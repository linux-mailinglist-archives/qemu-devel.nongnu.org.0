Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA06A02B0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 07:15:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV4rI-0004fx-2U; Thu, 23 Feb 2023 01:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV4rF-0004fU-OL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pV4rD-0000Qy-No
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677132807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YwMw0P+9zYEm9mDOHaCaUjAbBbGGrFcM44VzXkSQULI=;
 b=VBTASUFGyL35WymN6EyjpAaQvLJ5vlV9+eZNYw/epZ0jbW+k3X459dA8q7iURRgPFXXzhI
 xhIUHSVmzusEAxVN6gAFp033nMoeQ0BgFhPhvEx0tMfYZgGdydeeBmvjRfbVlwdTyqbsBe
 3c9hvay6n0y9W5y5S2bvvDyh/UmZzjM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-dD-CiE-FM_-NzT8PzwLUUw-1; Thu, 23 Feb 2023 01:13:26 -0500
X-MC-Unique: dD-CiE-FM_-NzT8PzwLUUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44643801F54;
 Thu, 23 Feb 2023 06:13:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 986EA404BEC0;
 Thu, 23 Feb 2023 06:13:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 919B721E6A1F; Thu, 23 Feb 2023 07:13:24 +0100 (CET)
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
 <87bklmrx1y.fsf@pond.sub.org>
 <CAFn=p-aiM+8280+xUrJNqh7+uzK6JLmiwEjKBdob_fLR_Mss_Q@mail.gmail.com>
Date: Thu, 23 Feb 2023 07:13:24 +0100
In-Reply-To: <CAFn=p-aiM+8280+xUrJNqh7+uzK6JLmiwEjKBdob_fLR_Mss_Q@mail.gmail.com>
 (John Snow's message of "Wed, 22 Feb 2023 23:40:20 -0500")
Message-ID: <87ilfshptn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On Wed, Feb 22, 2023 at 2:15 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > On Tue, Feb 21, 2023, 1:50 AM Markus Armbruster <armbru@redhat.com> wrote:
>> >
>> >> John Snow <jsnow@redhat.com> writes:
>> >>
>> >> > Once upon a time, "sphinx-build" on certain RPM platforms invoked
>> >> > specifically a Python 2.x version, while "sphinx-build-3" was a distro
>> >> > shim for the Python 3.x version.
>> >> >
>> >> > These days, none of our supported platforms utilize a 2.x version, so it
>> >> > should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
>> >> > which will prefer pip/venv installed versions of sphinx if they're
>> >> > available.
>> >> >
>> >> > This adds an extremely convenient ability to test document building
>> >> > ability in QEMU across multiple versions of Sphinx for the purposes of
>> >> > compatibility testing.
>> >> >
>> >> > Signed-off-by: John Snow <jsnow@redhat.com>
>> >> > ---
>> >> >  docs/meson.build | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/docs/meson.build b/docs/meson.build
>> >> > index 9136fed3b73..906034f9a87 100644
>> >> > --- a/docs/meson.build
>> >> > +++ b/docs/meson.build
>> >> > @@ -1,5 +1,5 @@
>> >> >  if get_option('sphinx_build') == ''
>> >> > -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
>> >> > +  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
>> >> >                                required: get_option('docs'))
>> >> >  else
>> >> >    sphinx_build = find_program(get_option('sphinx_build'),
>> >>
>> >> Do we still need to check for sphinx-build-3?  Or asked differently, is
>> >> there any supported build host that provides only sphinx-build-3?
>> >>
>> >
>> > Yes, modern Fedora still uses "sphinx-build-3" as the name in /usr/bin for
>> > the rpm-packaged version of sphinx.
>>
>> For what it's worth, python3-sphinx-5.0.2-2.fc37.noarch provides
>>
>>     /usr/bin/sphinx-build
>>     /usr/bin/sphinx-build-3
>>     /usr/bin/sphinx-build-3.11
>>
>> where the latter two are symbolic links to the first.  No need to check
>> for sphinx-build-3 here.
>
> Oh, I see. I guess it should be fine, but only if we explicitly drop
> support for the 3.6 version that comes with CentOS. I'm not entirely
> sure if "sphinx-build-3" is used anywhere else, I *think* it's just an
> rpm-ism.

I can see just two reasons for trying sphinx-build-3:

1. sphinx-build does not exist.

2. sphinx-build exists, but uses Python 2, which doesn't work with our
   Sphinx extension.

The commit message seems to claim it's not 2.

So, what is it?


