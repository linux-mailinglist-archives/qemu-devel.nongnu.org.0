Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49E832B853
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:49:48 +0100 (CET)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRsp-00020F-7R
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lHRra-0001Xl-DG
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:48:30 -0500
Received: from oxygen.pond.sub.org ([94.130.129.15]:38254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1lHRrX-0000YZ-Q7
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:48:29 -0500
Received: from blackfin.pond.sub.org
 (p200300d36f3cab00dacb8afffee0c842.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f3c:ab00:dacb:8aff:fee0:c842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id B07DB2029D
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 14:48:21 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 356C8113860F; Wed,  3 Mar 2021 14:48:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] qemu-config: add error propagation to qemu_config_parse
References: <20210226170816.231173-1-pbonzini@redhat.com>
Date: Wed, 03 Mar 2021 14:48:20 +0100
Message-ID: <871rcwjql7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=94.130.129.15; envelope-from=armbru@pond.sub.org;
 helo=oxygen.pond.sub.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This enables some simplification of vl.c via error_fatal, and improves
> error messages.  Before:
>
> Before:
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: error reading file
>   qemu-system-x86_64: -readconfig .: read config .: Invalid argument
>   $ /usr/libexec/qemu-kvm -readconfig foo
>   qemu-kvm: -readconfig foo: read config foo: No such file or directory
>
> After:
>
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: -readconfig .: error reading file: Is a directory
>   $ ./qemu-system-x86_64 -readconfig foo
>   qemu-system-x86_64: -readconfig foo: Cannot read config file foo: No su=
ch file or directory
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Lovely :)

> ---
>  block/blkdebug.c           |  3 +--
>  include/qemu/config-file.h |  5 +++--
>  softmmu/vl.c               | 29 +++++++++++------------------
>  util/qemu-config.c         | 23 ++++++++++++-----------
>  4 files changed, 27 insertions(+), 33 deletions(-)
>
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 5fe6172da9..7eaa8a28bf 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -279,9 +279,8 @@ static int read_config(BDRVBlkdebugState *s, const ch=
ar *filename,
>              return -errno;
>          }
>=20=20
> -        ret =3D qemu_config_parse(f, config_groups, filename);
> +        ret =3D qemu_config_parse(f, config_groups, filename, errp);
>          if (ret < 0) {
> -            error_setg(errp, "Could not parse blkdebug config file");
>              goto fail;
>          }
>      }
> diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
> index 29226107bd..8d3e53ae4d 100644
> --- a/include/qemu/config-file.h
> +++ b/include/qemu/config-file.h
> @@ -11,9 +11,10 @@ void qemu_add_drive_opts(QemuOptsList *list);
>  int qemu_global_option(const char *str);
>=20=20
>  void qemu_config_write(FILE *fp);
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
> +int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
> +                      Error **errp);
>=20=20
> -int qemu_read_config_file(const char *filename);
> +int qemu_read_config_file(const char *filename, Error **errp);
>=20=20
>  /* Parse QDict options as a replacement for a config file (allowing mult=
iple
>     enumerated (0..(n-1)) configuration "sections") */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index e67f91dd37..e80859c40d 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2062,17 +2062,19 @@ static int global_init_func(void *opaque, QemuOpt=
s *opts, Error **errp)
>      return 0;
>  }
>=20=20
> -static int qemu_read_default_config_file(void)
> +static void qemu_read_default_config_file(Error **errp)
>  {
> +    ERRP_GUARD();
>      int ret;
>      g_autofree char *file =3D get_relocated_path(CONFIG_QEMU_CONFDIR "/q=
emu.conf");
>=20=20
> -    ret =3D qemu_read_config_file(file);
> -    if (ret < 0 && ret !=3D -ENOENT) {
> -        return ret;
> +    ret =3D qemu_read_config_file(file, errp);
> +    if (ret < 0) {
> +        if (ret =3D=3D -ENOENT) {
> +            error_free(*errp);
> +            *errp =3D NULL;
> +        }
>      }
> -
> -    return 0;
>  }

This change to return void goes against advice in error.h:

 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

Tolerable.  The only caller wouldn't profit from a return value (it
passes &error_fatal), and more callers seem quite unlikely.

>=20=20
>  static int qemu_set_option(const char *str)
> @@ -2640,9 +2642,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      }
>=20=20
>      if (userconfig) {
> -        if (qemu_read_default_config_file() < 0) {
> -            exit(1);
> -        }
> +        qemu_read_default_config_file(&error_fatal);
>      }
>=20=20
>      /* second pass of option parsing */
> @@ -3330,15 +3330,8 @@ void qemu_init(int argc, char **argv, char **envp)
>                  qemu_plugin_opt_parse(optarg, &plugin_list);
>                  break;
>              case QEMU_OPTION_readconfig:
> -                {
> -                    int ret =3D qemu_read_config_file(optarg);
> -                    if (ret < 0) {
> -                        error_report("read config %s: %s", optarg,
> -                                     strerror(-ret));
> -                        exit(1);
> -                    }
> -                    break;
> -                }
> +                qemu_read_config_file(optarg, &error_fatal);
> +                break;
>              case QEMU_OPTION_spice:
>                  olist =3D qemu_find_opts_err("spice", NULL);
>                  if (!olist) {
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index e2a700b284..af89df109d 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -350,7 +350,7 @@ void qemu_config_write(FILE *fp)
>  }
>=20=20
>  /* Returns number of config groups on success, -errno on error */
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
> +int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,=
 Error **errp)
>  {
>      char line[1024], group[64], id[64], arg[64], value[1024];
>      Location loc;
> @@ -375,7 +375,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
 const char *fname)
>              /* group with id */
>              list =3D find_list(lists, group, &local_err);
>              if (local_err) {
> -                error_report_err(local_err);
> +                error_propagate(errp, local_err);
>                  goto out;
>              }

Please avoid error_propagate() where possible:

               list =3D find_list(lists, group, errp);
               if (!list) {
                   goto out;
               }

>              opts =3D qemu_opts_create(list, id, 1, NULL);
> @@ -386,7 +386,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
 const char *fname)
>              /* group without id */
>              list =3D find_list(lists, group, &local_err);
>              if (local_err) {
> -                error_report_err(local_err);
> +                error_propagate(errp, local_err);
>                  goto out;
>              }

Likewise.

>              opts =3D qemu_opts_create(list, NULL, 0, &error_abort);
> @@ -398,21 +398,21 @@ int qemu_config_parse(FILE *fp, QemuOptsList **list=
s, const char *fname)
>              sscanf(line, " %63s =3D \"\"", arg) =3D=3D 1) {
>              /* arg =3D value */
>              if (opts =3D=3D NULL) {
> -                error_report("no group defined");
> +                error_setg(errp, "no group defined");
>                  goto out;
>              }
> -            if (!qemu_opt_set(opts, arg, value, &local_err)) {
> -                error_report_err(local_err);
> +            if (!qemu_opt_set(opts, arg, value, errp)) {
>                  goto out;
>              }
>              continue;
>          }
> -        error_report("parse error");
> +        error_setg(errp, "parse error");
>          goto out;
>      }
>      if (ferror(fp)) {
> -        error_report("error reading file");
> -        goto out;
> +        loc_pop(&loc);
> +        error_setg_errno(errp, errno, "error reading file");
> +        return res;
>      }
>      res =3D count;
>  out:
> @@ -420,16 +420,17 @@ out:
>      return res;
>  }
>=20=20
> -int qemu_read_config_file(const char *filename)
> +int qemu_read_config_file(const char *filename, Error **errp)
>  {
>      FILE *f =3D fopen(filename, "r");
>      int ret;
>=20=20
>      if (f =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "Cannot read config file %s", file=
name);
>          return -errno;
>      }
>=20=20
> -    ret =3D qemu_config_parse(f, vm_config_groups, filename);
> +    ret =3D qemu_config_parse(f, vm_config_groups, filename, errp);
>      fclose(f);
>      return ret;
>  }

Not avoiding error_propagate() isn't wrong, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>

But please consider avoiding it anyway.

