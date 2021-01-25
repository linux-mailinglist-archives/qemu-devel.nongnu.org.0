Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710B3025C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:56:46 +0100 (CET)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42MH-0001TZ-6S
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l42KH-0000Dr-Lf
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:54:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l42KE-0003kP-MP
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 08:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611582876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjOq+ydIW2Z+ChlwC9yiWRYrDBS78fmEZmGMoKYMElY=;
 b=UlcjrO0ckNGs6r8a8h0hScfEpplRBm70oej7OFoBkN4V8Uafg5hBc/yCp142msa8Ab39or
 LtBR5KWwh6ZBfAVMhFYdOFcOhgfpsRgVHqK0dvOLRpesCm3ELNipU4uCzTQnwEn8gvesQM
 C7JZkGlu24ySDCHc9oE4zQDAYJEXQps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-lfN7D0YEN4OpnLJ0uOw8DQ-1; Mon, 25 Jan 2021 08:54:34 -0500
X-MC-Unique: lfN7D0YEN4OpnLJ0uOw8DQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C121922960
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 13:54:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBAA5D9DB;
 Mon, 25 Jan 2021 13:54:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F6C5113865F; Mon, 25 Jan 2021 14:54:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/25] qemu-config: add error propagation to
 qemu_config_parse
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-13-pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 14:54:32 +0100
In-Reply-To: <20210118163113.780171-13-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 18 Jan 2021 11:31:00 -0500")
Message-ID: <87eei9f7fr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> This enables some simplification of vl.c via error_fatal.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blkdebug.c           |  3 +--
>  include/qemu/config-file.h |  4 ++--
>  softmmu/vl.c               | 30 ++++++++++++------------------
>  util/qemu-config.c         | 20 ++++++++++----------
>  4 files changed, 25 insertions(+), 32 deletions(-)
>
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 5fe6172da9..7eaa8a28bf 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -279,9 +279,8 @@ static int read_config(BDRVBlkdebugState *s, const ch=
ar *filename,
>              return -errno;
>          }
> =20
> -        ret =3D qemu_config_parse(f, config_groups, filename);
> +        ret =3D qemu_config_parse(f, config_groups, filename, errp);
>          if (ret < 0) {
> -            error_setg(errp, "Could not parse blkdebug config file");
>              goto fail;
>          }
>      }
> diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
> index 7d26fe3816..da6f4690b7 100644
> --- a/include/qemu/config-file.h
> +++ b/include/qemu/config-file.h
> @@ -10,9 +10,9 @@ void qemu_add_opts(QemuOptsList *list);
>  void qemu_add_drive_opts(QemuOptsList *list);
>  int qemu_global_option(const char *str);
> =20
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)=
;
> +int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,=
 Error **errp);

Long line.

> =20
> -int qemu_read_config_file(const char *filename);
> +int qemu_read_config_file(const char *filename, Error **errp);
> =20
>  /* Parse QDict options as a replacement for a config file (allowing mult=
iple
>     enumerated (0..(n-1)) configuration "sections") */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index d34307bf11..d991919155 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2056,17 +2056,20 @@ static int global_init_func(void *opaque, QemuOpt=
s *opts, Error **errp)
>      return 0;
>  }
> =20
> -static int qemu_read_default_config_file(void)
> +static void qemu_read_default_config_file(Error **errp)
>  {
>      int ret;
> +    Error *local_err =3D NULL;
>      g_autofree char *file =3D get_relocated_path(CONFIG_QEMU_CONFDIR "/q=
emu.conf");
> =20
> -    ret =3D qemu_read_config_file(file);
> -    if (ret < 0 && ret !=3D -ENOENT) {
> -        return ret;
> +    ret =3D qemu_read_config_file(file, &local_err);
> +    if (ret < 0) {
> +        if (ret =3D=3D -ENOENT) {
> +            error_free(local_err);
> +        } else {
> +            error_propagate(errp, local_err);
> +        }
>      }
> -
> -    return 0;
>  }

Please use ERRP_GUARD() in new code:

   static void qemu_read_default_config_file(Error **errp)
   {
       ERRP_GUARD();
       int ret;
       g_autofree char *file =3D get_relocated_path(CONFIG_QEMU_CONFDIR
                                                  "/qemu.conf");

       ret =3D qemu_read_config_file(file, errp);
       if (ret =3D=3D -ENOENT) {
           error_free(*errp);
           *errp =3D NULL;
       }
   }

> =20
>  static int qemu_set_option(const char *str)
> @@ -2622,9 +2625,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      }
> =20
>      if (userconfig) {
> -        if (qemu_read_default_config_file() < 0) {
> -            exit(1);
> -        }
> +        qemu_read_default_config_file(&error_fatal);
>      }
> =20
>      /* second pass of option parsing */
> @@ -3312,15 +3313,8 @@ void qemu_init(int argc, char **argv, char **envp)
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

More than just code simplifcation: you're deleting an extra error
message.  Test case:

    $ qemu-system-x86_64 -readconfig .
    qemu: error reading file
    qemu: -readconfig .: read config .: Invalid argument

Pretty bad.  With your patch applied:

    qemu-system-x86_64: error reading file

Worse :)

I actually expected this to come out as

    qemu-system-x86_64: -readconfig .: error reading file

That would be an improvement.

The reason for the bad location information is here:

    int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname=
, Error **errp)
    {
        char line[1024], group[64], id[64], arg[64], value[1024];
        Location loc;
        QemuOptsList *list =3D NULL;
        Error *local_err =3D NULL;
        QemuOpts *opts =3D NULL;
        int res =3D -EINVAL, lno =3D 0;
        int count =3D 0;

        loc_push_none(&loc);
        while (fgets(line, sizeof(line), fp) !=3D NULL) {

If the very first fgets() fails setting @fp's error indicator, ...

            loc_set_file(fname, ++lno);
            [...]
        }
        if (ferror(fp)) {

... we get here with error location "none", and ...

            error_setg(errp, "error reading file");

... use it to report the error (remember, @errp is &error_fatal).

Independently, error_setg_errno() would be nice.  Assuming we're willing
to rely on errno being useful after fgets().

            goto out;
        }
        res =3D count;
    out:
        loc_pop(&loc);
        return res;
    }

Always, always, always test the error messages.

>              case QEMU_OPTION_spice:
>                  olist =3D qemu_find_opts_err("spice", NULL);
>                  if (!olist) {
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index a4a1324c68..d0629f4960 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -308,7 +308,7 @@ void qemu_add_opts(QemuOptsList *list)
>  }
> =20
>  /* Returns number of config groups on success, -errno on error */
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
> +int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,=
 Error **errp)
>  {
>      char line[1024], group[64], id[64], arg[64], value[1024];
>      Location loc;
> @@ -333,7 +333,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
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
> @@ -344,7 +344,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
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
> @@ -356,20 +356,19 @@ int qemu_config_parse(FILE *fp, QemuOptsList **list=
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

*=C3=84chz*  Not your patch's fault.

>          goto out;
>      }
>      if (ferror(fp)) {
> -        error_report("error reading file");
> +        error_setg(errp, "error reading file");
>          goto out;
>      }
>      res =3D count;
> @@ -378,16 +377,17 @@ out:
>      return res;
>  }
> =20
> -int qemu_read_config_file(const char *filename)
> +int qemu_read_config_file(const char *filename, Error **errp)
>  {
>      FILE *f =3D fopen(filename, "r");
>      int ret;
> =20
>      if (f =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "Cannot read config file %s", file=
name);
>          return -errno;
>      }
> =20
> -    ret =3D qemu_config_parse(f, vm_config_groups, filename);
> +    ret =3D qemu_config_parse(f, vm_config_groups, filename, errp);
>      fclose(f);
>      return ret;
>  }


