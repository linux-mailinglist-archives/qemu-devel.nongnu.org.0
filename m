Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D669EF2B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 08:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUjLA-0005f7-Gf; Wed, 22 Feb 2023 02:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUjL8-0005eO-8A
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:14:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUjL6-0003Rb-90
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 02:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677050094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JpBoVmHcF+4yCxhjnqvhy7tdYOyZSR5SjpeQSj2GNLE=;
 b=S/m7lWMrB4pMMWmqMOP1VatgTAPUA2LxMEA4EBxxbz6zlCei8xLq9DLl6pFiKP/C5BMNG9
 Ek+zP8Gv87QSpnn2AN1Yl2IFzLtLKtoFe/xfYii4qBTJrg/S3dr/nQaDAO5wka/kVE5dOs
 7fSh/eNuW+ffCJ6lZ11eWG3i6NjbKqA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-7bvQ2plxPOGe60WS7eV5qg-1; Wed, 22 Feb 2023 02:14:51 -0500
X-MC-Unique: 7bvQ2plxPOGe60WS7eV5qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0163085A5B1;
 Wed, 22 Feb 2023 07:14:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAECA40CF8F0;
 Wed, 22 Feb 2023 07:14:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C3D2B21E6A1F; Wed, 22 Feb 2023 08:14:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth
 <michael.roth@amd.com>,  Thomas Huth <thuth@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  Cleber Rosa <crosa@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Daniel Berrange
 <berrange@redhat.com>
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
 <87o7pnzf4d.fsf@pond.sub.org>
 <CAFn=p-aYtKwFUpHH+4TYGKKNhVreUL+KSLKjzPvDbxiMr9eN3g@mail.gmail.com>
Date: Wed, 22 Feb 2023 08:14:49 +0100
In-Reply-To: <CAFn=p-aYtKwFUpHH+4TYGKKNhVreUL+KSLKjzPvDbxiMr9eN3g@mail.gmail.com>
 (John Snow's message of "Tue, 21 Feb 2023 11:49:22 -0500")
Message-ID: <87bklmrx1y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> On Tue, Feb 21, 2023, 1:50 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Once upon a time, "sphinx-build" on certain RPM platforms invoked
>> > specifically a Python 2.x version, while "sphinx-build-3" was a distro
>> > shim for the Python 3.x version.
>> >
>> > These days, none of our supported platforms utilize a 2.x version, so it
>> > should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
>> > which will prefer pip/venv installed versions of sphinx if they're
>> > available.
>> >
>> > This adds an extremely convenient ability to test document building
>> > ability in QEMU across multiple versions of Sphinx for the purposes of
>> > compatibility testing.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  docs/meson.build | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/docs/meson.build b/docs/meson.build
>> > index 9136fed3b73..906034f9a87 100644
>> > --- a/docs/meson.build
>> > +++ b/docs/meson.build
>> > @@ -1,5 +1,5 @@
>> >  if get_option('sphinx_build') == ''
>> > -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
>> > +  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
>> >                                required: get_option('docs'))
>> >  else
>> >    sphinx_build = find_program(get_option('sphinx_build'),
>>
>> Do we still need to check for sphinx-build-3?  Or asked differently, is
>> there any supported build host that provides only sphinx-build-3?
>>
>
> Yes, modern Fedora still uses "sphinx-build-3" as the name in /usr/bin for
> the rpm-packaged version of sphinx.

For what it's worth, python3-sphinx-5.0.2-2.fc37.noarch provides

    /usr/bin/sphinx-build
    /usr/bin/sphinx-build-3
    /usr/bin/sphinx-build-3.11

where the latter two are symbolic links to the first.  No need to check
for sphinx-build-3 here.

> It's just that the only platforms where "sphinx-build" is the 2.x version
> are platforms on which we want to drop 3.6 support anyway, so it's OK to
> invert the search priority in the context of this series.
>
> (All pip/pypi versions use "sphinx-build" as the binary name. In effect,
> this patch means we prefer pip/pypi versions if they're in your $PATH.)


