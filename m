Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC193B0CC1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 20:21:20 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvl1T-0004bb-D4
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 14:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lvl0I-0003Vs-Vm; Tue, 22 Jun 2021 14:20:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lvl0G-0002uK-HJ; Tue, 22 Jun 2021 14:20:06 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E31AB1FD45;
 Tue, 22 Jun 2021 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624386001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCnFjVRls4Z8LJqMaCflB8OBK1tYUCHAlYFFQPgtilQ=;
 b=Bv4cbJt4XsSzzjyUO9KvQLc5Y8yjdNwZ5CuI2JAHo4+UzkUemW6kIMcG7sG4xxh4QKcYZ7
 HVuTvOZR2EHlICw9LrQ5I6yXgJlrhHEEjTo3XgF1SYETlO0MDyqnToAJ5iWGJnTFEJpMUA
 v14UOsNDTXVuBO9VCrmvDtIPBifKuH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624386001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCnFjVRls4Z8LJqMaCflB8OBK1tYUCHAlYFFQPgtilQ=;
 b=65mvxyfAiCCU/yOudV3vSL3hVlYZhaUGezYEfzgrUfM5ByhlrbuKsmHfXfabSXqvoINnar
 GixVBaEl82Ex5qCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5CA8811A97;
 Tue, 22 Jun 2021 18:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624386001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCnFjVRls4Z8LJqMaCflB8OBK1tYUCHAlYFFQPgtilQ=;
 b=Bv4cbJt4XsSzzjyUO9KvQLc5Y8yjdNwZ5CuI2JAHo4+UzkUemW6kIMcG7sG4xxh4QKcYZ7
 HVuTvOZR2EHlICw9LrQ5I6yXgJlrhHEEjTo3XgF1SYETlO0MDyqnToAJ5iWGJnTFEJpMUA
 v14UOsNDTXVuBO9VCrmvDtIPBifKuH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624386001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jCnFjVRls4Z8LJqMaCflB8OBK1tYUCHAlYFFQPgtilQ=;
 b=65mvxyfAiCCU/yOudV3vSL3hVlYZhaUGezYEfzgrUfM5ByhlrbuKsmHfXfabSXqvoINnar
 GixVBaEl82Ex5qCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id slSSB8wp0mA5YQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Tue, 22 Jun 2021 18:19:56 +0000
Date: Tue, 22 Jun 2021 15:19:53 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 03/24] modules: generate modinfo.c
Message-ID: <YNIpyckP9wyQZtts@pizza>
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/nGEL53u3dm5Q26b"
Content-Disposition: inline
In-Reply-To: <20210618045353.2510174-4-kraxel@redhat.com>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/nGEL53u3dm5Q26b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Just a small change.

On Fri, Jun 18, 2021 at 06:53:32AM +0200, Gerd Hoffmann wrote:
> Add script to generate C source with a small
> database containing the module meta-data.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  scripts/modinfo-generate.py | 84 +++++++++++++++++++++++++++++++++++++
>  include/qemu/module.h       | 17 ++++++++
>  softmmu/vl.c                |  4 ++
>  util/module.c               | 11 +++++
>  meson.build                 | 13 +++++-
>  5 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/modinfo-generate.py
>=20
> diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
> new file mode 100755
> index 000000000000..2b925432655a
> --- /dev/null
> +++ b/scripts/modinfo-generate.py
> @@ -0,0 +1,84 @@
> +#!/usr/bin/env python3
> +# -*- coding: utf-8 -*-
> +
> +import os
> +import sys
> +
> +def print_array(name, values):
> +    if len(values) =3D=3D 0:
> +        return
> +    list =3D ", ".join(values)
> +    print("    .%s =3D ((const char*[]){ %s, NULL })," % (name, list))
> +
> +def parse_line(line):
> +    kind =3D ""
> +    data =3D ""
> +    get_kind =3D False
> +    get_data =3D False
> +    for item in line.split():
> +        if item =3D=3D "MODINFO_START":
> +            get_kind =3D True
> +            continue
> +        if item.startswith("MODINFO_END"):
> +            get_data =3D False
> +            continue
> +        if get_kind:
> +            kind =3D item
> +            get_kind =3D False
> +            get_data =3D True
> +            continue
> +        if get_data:
> +            data +=3D " " + item
> +            continue
> +    return (kind, data)
> +
> +def generate(name, lines):
> +    arch =3D ""
> +    objs =3D []
> +    deps =3D []
> +    opts =3D []
> +    for line in lines:
> +        if line.find("MODINFO_START") !=3D -1:
> +            (kind, data) =3D parse_line(line)
> +            if kind =3D=3D 'obj':
> +                objs.append(data)
> +            elif kind =3D=3D 'dep':
> +                deps.append(data)
> +            elif kind =3D=3D 'opts':
> +                opts.append(data)
> +            elif kind =3D=3D 'arch':
> +                arch =3D data;
> +            else:
> +                print("unknown:", kind)
> +                exit(1)
> +
> +    print("    .name =3D \"%s\"," % name)
> +    if arch !=3D "":
> +        print("    .arch =3D %s," % arch)
> +    print_array("objs", objs)
> +    print_array("deps", deps)
> +    print_array("opts", opts)
> +    print("},{");
> +
> +def print_pre():
> +    print("/* generated by scripts/modinfo.py */")

generated by scripts/modinfo-generate.py

> +    print("#include \"qemu/osdep.h\"")
> +    print("#include \"qemu/module.h\"")
> +    print("const QemuModinfo qemu_modinfo[] =3D {{")
> +
> +def print_post():
> +    print("    /* end of list */")
> +    print("}};")
> +
> +def main(args):
> +    print_pre()
> +    for modinfo in args:
> +        with open(modinfo) as f:
> +            lines =3D f.readlines()
> +        print("    /* %s */" % modinfo)
> +        (basename, ext) =3D os.path.splitext(modinfo)
> +        generate(basename, lines)
> +    print_post()
> +
> +if __name__ =3D=3D "__main__":
> +    main(sys.argv[1:])
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 81ef086da023..a98748d501d3 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -98,4 +98,21 @@ void module_load_qom_all(void);
>  /* module registers QemuOpts <name> */
>  #define module_opts(name) modinfo(opts, name)
> =20
> +/*
> + * module info database
> + *
> + * scripts/modinfo-generate.c will build this using the data collected
> + * by scripts/modinfo-collect.py
> + */
> +typedef struct QemuModinfo QemuModinfo;
> +struct QemuModinfo {
> +    const char *name;
> +    const char *arch;
> +    const char **objs;
> +    const char **deps;
> +    const char **opts;
> +};
> +extern const QemuModinfo qemu_modinfo[];
> +void module_init_info(const QemuModinfo *info);
> +
>  #endif
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 326c1e908008..a4857ec43ff3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2740,6 +2740,10 @@ void qemu_init(int argc, char **argv, char **envp)
>      error_init(argv[0]);
>      qemu_init_exec_dir(argv[0]);
> =20
> +#ifdef CONFIG_MODULES
> +    module_init_info(qemu_modinfo);
> +#endif
> +
>      qemu_init_subsystems();
> =20
>      /* first pass of option parsing */
> diff --git a/util/module.c b/util/module.c
> index eee8ff2de136..8d3e8275b9f7 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -110,6 +110,17 @@ void module_call_init(module_init_type type)
>  }
> =20
>  #ifdef CONFIG_MODULES
> +
> +static const QemuModinfo module_info_stub[] =3D { {
> +    /* end of list */
> +} };
> +static const QemuModinfo *module_info =3D module_info_stub;
> +
> +void module_init_info(const QemuModinfo *info)
> +{
> +    module_info =3D info;
> +}
> +
>  static int module_load_file(const char *fname, bool mayfail, bool export=
_symbols)
>  {
>      GModule *g_module;
> diff --git a/meson.build b/meson.build
> index bb99619257d5..9cf50a50d39a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2022,6 +2022,7 @@ subdir('tests/qtest/fuzz')
>  ########################
> =20
>  modinfo_collect =3D find_program('scripts/modinfo-collect.py')
> +modinfo_generate =3D find_program('scripts/modinfo-generate.py')
>  modinfo_files =3D []
> =20
>  block_mods =3D []
> @@ -2042,7 +2043,6 @@ foreach d, list : modules
>                                         output: d + '-' + m + '.modinfo',
>                                         input: module_ss.sources(),
>                                         capture: true,
> -                                       build_by_default: true, # to be r=
emoved when added to a target
>                                         command: [modinfo_collect, '@INPU=
T@'])
>        endif
>      else
> @@ -2055,6 +2055,17 @@ foreach d, list : modules
>    endforeach
>  endforeach
> =20
> +if enable_modules
> +  modinfo_src =3D custom_target('modinfo.c',
> +                              output: 'modinfo.c',
> +                              input: modinfo_files,
> +                              command: [modinfo_generate, '@INPUT@'],
> +                              capture: true)
> +  modinfo_lib =3D static_library('modinfo', modinfo_src)
> +  modinfo_dep =3D declare_dependency(link_whole: modinfo_lib)
> +  softmmu_ss.add(modinfo_dep)
> +endif
> +
>  nm =3D find_program('nm')
>  undefsym =3D find_program('scripts/undefsym.py')
>  block_syms =3D custom_target('block.syms', output: 'block.syms',
> --=20
> 2.31.1
>=20
>=20

--/nGEL53u3dm5Q26b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmDSKcUACgkQaJ4wdCKK
F5ZWBA/9FYUwEm8aWO13gQ62AELXumfM6LiXLW2deI6SHk/z9nB+ynKrp8h00L6I
WDvVy0Nx4FAzk/2lHI1GSwCJtOQcZH1Sc8JTK/Lv0iETy87QwWRSGOWOIDuD7ylj
ZN0OBEDcfQx+2W9hcT2WRVc/3vGDukEnDdRft5vF0zXe5IaZRCd7Ip5kJkXBDto8
I1DzH7u+Q9ClkRplUmVrB6y6zR4R66//7XU+tMdrlEi3Wft0npvqCuVhpucVWyIG
yGrQErk0B8VdyUmUyJv5xDhFgPZsJReJbABcE1bvoa3vcrQvlezJ+Ky6etzDIJph
4KWdskU1fPZ5uzvijX/YLtYp45HwsyBOnaJXj/ITEs/W1Nu2GBUCPpbRUM9RCoYh
Ud9yPXJEyYU9kFm3PunTYOkLzqj/mVeWv6xd38mBXl4pxg2L8nIsb0yPL+aNb8rO
2r6NYQnWKk3/qmAxlfvi/ofhw/rLgc789fxn40DFFDKWX9C8CaArbldgdmcTBx9U
gmObXqlr4FBA37Bz+hpvWKPN1l2SJ53TwLvnG5Sy+2PfAAcAauKIcIwfa9YQd0tv
EHaXl3slV11FKiYubuNsu567MWZGN1es5D0dy0alPdRr/vkwIXIa0irG1V4ZJJMw
EvC43Iq0K4dwplwlXFhOaccFI1rsqDG3nByvPiqDJgviKYCnGs4=
=3UFK
-----END PGP SIGNATURE-----

--/nGEL53u3dm5Q26b--

