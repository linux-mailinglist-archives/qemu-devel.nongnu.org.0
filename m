Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C3D6F1D44
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:16:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRgZ-0000C4-RU; Fri, 28 Apr 2023 13:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psRgY-0000Bs-3U
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psRgS-0005Nr-61
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682702098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/iQg3HmQDp5t3jvP0Y5U1/2NZasKb7UmA3NcCOH/iY=;
 b=OlLJ7E9bi72f8Y8x5ZlFOB9qh9SI4sweteHoAE3KNNH5oG04Cuu5nAlLJOEDfcY4Hw4EvM
 BKMIFooVjpsuOvtFTONRt10xT+263IpUiOjtnWRKbmJ5JrzFFohNTqQzCFHLj2ABtMwkjR
 iocN3gCCQF8zdF3sonjjtz4AyTumAvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-2xCj5egtOAS03MHM6kKepA-1; Fri, 28 Apr 2023 13:14:57 -0400
X-MC-Unique: 2xCj5egtOAS03MHM6kKepA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEA523801F65;
 Fri, 28 Apr 2023 17:14:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C78E814171B6;
 Fri, 28 Apr 2023 17:14:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BAE3D21E6608; Fri, 28 Apr 2023 19:14:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] meson: Pass -j option to sphinx
References: <20230428150102.13114-1-farosas@suse.de>
Date: Fri, 28 Apr 2023 19:14:55 +0200
In-Reply-To: <20230428150102.13114-1-farosas@suse.de> (Fabiano Rosas's message
 of "Fri, 28 Apr 2023 12:01:02 -0300")
Message-ID: <87r0s4gc8g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Fabiano Rosas <farosas@suse.de> writes:

> Save a bit of build time by passing the number of jobs option to
> sphinx.
>
> We cannot use the -j option from make because meson does not support
> setting build time parameters for custom targets. Use nproc instead or
> the equivalent sphinx option "-j auto", if that is available.
>
> Also make sure our plugins support parallelism and report it properly
> to sphinx. Particularly, implement the merge_domaindata method in
> DBusDomain that is used to merge in data from other subprocesses.
>
> before:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
>
>   real    0m43.157s
>   user    0m42.642s
>   sys     0m0.576s
>
> after:
>   $ time make man html
>   ...
>   [1/2] Generating docs/QEMU manual with a custom command
>   [2/2] Generating docs/QEMU man pages with a custom command
>
>   real    0m25.014s
>   user    0m51.288s
>   sys     0m2.085s

Thanks for tackling this!  sphinx-build is so slow I disable doc
building unless I'm working on docs.

> Tested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  docs/meson.build           | 12 ++++++++++++
>  docs/sphinx/dbusdomain.py  |  4 ++++
>  docs/sphinx/fakedbusdoc.py |  5 +++++
>  docs/sphinx/qmp_lexer.py   |  5 +++++
>  4 files changed, 26 insertions(+)
>
> diff --git a/docs/meson.build b/docs/meson.build
> index f220800e3e..138ec6ce6f 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -10,6 +10,18 @@ if sphinx_build.found()
>      SPHINX_ARGS +=3D [ '-W', '-Dkerneldoc_werror=3D1' ]
>    endif
>=20=20
> +  sphinx_version =3D run_command(SPHINX_ARGS + ['--version'],
> +                               check: true).stdout().split()[1]
> +  if sphinx_version.version_compare('>=3D5.1.2')

Where do you get 5.1.2 from?  I have 5.0.2, and -j auto appears to work
fine.  The manual page says "Changed in version 1.7: Support auto
argument."

> +    SPHINX_ARGS +=3D ['-j', 'auto']
> +  else
> +    nproc =3D find_program('nproc')
> +    if nproc.found()
> +      jobs =3D run_command(nproc, check: true).stdout()
> +      SPHINX_ARGS +=3D ['-j', jobs]
> +    endif
> +  endif
> +
>    # This is a bit awkward but works: create a trivial document and
>    # try to run it with our configuration file (which enforces a
>    # version requirement). This will fail if sphinx-build is too old.

[...]


