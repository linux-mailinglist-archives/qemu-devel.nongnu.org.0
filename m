Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572E662FC6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:03:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExQP-0003nv-Ee; Mon, 09 Jan 2023 14:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExQ1-0003lg-VL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:02:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pExQ0-0001CL-7N
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673290966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJ46I4X8xJfWbeZMLBjOO87PGNBpt3aiLFz9tQNvxyQ=;
 b=UTaNcK6X8HG9lQec631buuTyHY8E4NU0QY5NODu/q+oqjUu5YxNq6s60Q60LvdTFxQd8zd
 yB6/eII9AvsoRkqJ/Uh/WY4fSx44QBFcW8WPcBH9sASnSEa+xqvf2kykXb4EjNv7dfweM4
 +zMlIF00p5lQJnxIusZfY1QPWNXU35s=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-3ULtlRo_M3GpkdZmp7AE0g-1; Mon, 09 Jan 2023 14:02:45 -0500
X-MC-Unique: 3ULtlRo_M3GpkdZmp7AE0g-1
Received: by mail-lj1-f198.google.com with SMTP id
 p16-20020a2e7410000000b0027fdc588a62so2227771ljc.17
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJ46I4X8xJfWbeZMLBjOO87PGNBpt3aiLFz9tQNvxyQ=;
 b=brbTS6l3Bus0cSjpmrlcApODj186OHdoglaijghRbhUQDryBsWy0KPOPi9VClvhD10
 0f0eBbQTL+qMZl4lrYtc7UY/Vfk5VGJZWUV+ct5WoIuQR/PjbMbJOG5jOrI/K+gbZNqw
 gNHmqTVuigbWQkKsjOWcku2AQ3Gn+FUrR1tECFJtsnL0g3x9So5lOaDFwnywzumCifd+
 tCDzcIlpoJtQSRKHpiLsRg3GedENJ1NtYLesZQ31R3K/8lXdFdoOAoCNIM03Thws2GMs
 F8mRA/9iUb0R3Eh81kqUKzPykHQ/h1dAty2yui8lzPqhH3HtmBg3FXM+awgbnItg6mX1
 fFcg==
X-Gm-Message-State: AFqh2kqe4gby3JiJ9b+hhrs2wEo3ky7kWWp58fDls5XFAHL170H/kXEV
 r84HVmqDntZaqYLmwF5VCjYLDdDwt25p7flqkfW922EUj7Nx7jpa9kOhCk2JI5adJmJL9nPN+Bk
 UKl46Z/D+j3tj5VfkzBgnkc1pzWRQsDQ=
X-Received: by 2002:a2e:9f06:0:b0:281:980:a708 with SMTP id
 u6-20020a2e9f06000000b002810980a708mr1135094ljk.354.1673290963823; 
 Mon, 09 Jan 2023 11:02:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9qOHzx09NqB9BOaETp8Okv30PBzaTGowW4exe73RVzkYIeOgMmlaT81fsM/WDPXXhb51Pd8gPX/bIQLWiK/A=
X-Received: by 2002:a2e:9f06:0:b0:281:980:a708 with SMTP id
 u6-20020a2e9f06000000b002810980a708mr1135074ljk.354.1673290963510; Mon, 09
 Jan 2023 11:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
 <20230109181447.235989-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230109181447.235989-2-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 9 Jan 2023 14:02:31 -0500
Message-ID: <CAFn=p-aMdBxE4rmmu3Gw1tw+U07YOM-psKPt4U1dwQCvKDWHDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] build-sys: fix crlf-ending C code
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, 
 David Hildenbrand <david@redhat.com>, kraxel@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Mon, Jan 9, 2023 at 1:14 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> On msys2, the shader-to-C script produces bad C:
> ./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " charact=
er [-Werror]
>
> Fix it by changing the line ending from crlf to lf, and convert the
> script to Python (qemu build seems perl-free after that).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build              |  2 +-
>  scripts/shaderinclude.pl | 16 ----------------
>  scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 17 deletions(-)
>  delete mode 100644 scripts/shaderinclude.pl
>  create mode 100755 scripts/shaderinclude.py
>
> diff --git a/meson.build b/meson.build
> index 175517eafd..b3c6db8343 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2781,7 +2781,7 @@ config_host_data.set('CONFIG_SLIRP', slirp.found())
>  genh +=3D configure_file(output: 'config-host.h', configuration: config_=
host_data)
>
>  hxtool =3D find_program('scripts/hxtool')
> -shaderinclude =3D find_program('scripts/shaderinclude.pl')
> +shaderinclude =3D find_program('scripts/shaderinclude.py')
>  qapi_gen =3D find_program('scripts/qapi-gen.py')
>  qapi_gen_depends =3D [ meson.current_source_dir() / 'scripts/qapi/__init=
__.py',
>                       meson.current_source_dir() / 'scripts/qapi/commands=
.py',
> diff --git a/scripts/shaderinclude.pl b/scripts/shaderinclude.pl
> deleted file mode 100644
> index cd3bb40b12..0000000000
> --- a/scripts/shaderinclude.pl
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -#!/usr/bin/env perl
> -use strict;
> -use warnings;
> -
> -my $file =3D shift;
> -open FILE, "<", $file or die "open $file: $!";
> -my $name =3D $file;
> -$name =3D~ s|.*/||;
> -$name =3D~ s/[-.]/_/g;
> -print "static GLchar ${name}_src[] =3D\n";
> -while (<FILE>) {
> -    chomp;
> -    printf "    \"%s\\n\"\n", $_;
> -}
> -print "    \"\\n\";\n";
> -close FILE;
> diff --git a/scripts/shaderinclude.py b/scripts/shaderinclude.py
> new file mode 100755
> index 0000000000..ab2aade2cd
> --- /dev/null
> +++ b/scripts/shaderinclude.py
> @@ -0,0 +1,26 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (C) 2023 Red Hat, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import sys
> +import os
> +
> +
> +def main(args):
> +    file_path =3D args[1]
> +    basename =3D os.path.basename(file_path)
> +    varname =3D basename.replace('-', '_').replace('.', '_')
> +
> +    with os.fdopen(sys.stdout.fileno(), "wt", closefd=3DFalse, newline=
=3D'\n') as stdout:

fancy ~

> +        with open(file_path, "r", encoding=3D'utf-8') as file:
> +            print(f'static GLchar {varname}_src[] =3D', file=3Dstdout)
> +            for line in file:
> +                line =3D line.rstrip()
> +                print(f'    "{line}\\n"', file=3Dstdout)
> +            print('    "\\n";', file=3Dstdout)
> +
> +
> +if __name__ =3D=3D '__main__':
> +    sys.exit(main(sys.argv))
> --
> 2.39.0
>

ACK on the Python.

--js


