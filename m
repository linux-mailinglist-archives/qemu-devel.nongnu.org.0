Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EC5EDDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:26:22 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odX4v-0002WK-8s
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odVHz-0003E5-RM
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 07:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odVHw-0005ui-J1
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 07:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664364697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Fjvr+6nWUTIF3yK6DYgLa87+Jo42N5LjQjD5ZxeP3E=;
 b=JCP7Ulw7gEW5l6S/eLbD+Ac5fV+V2F8fqiN5n4QdPN3dS4Ku94Nx2F2Xq6Y2KryUHamjsx
 zSfHnLnetCUtV1jR/mhHKkWpHFBe/YYQKlpPCbpNYWsDwiXJFSVVBtktv1KtV403uqe1ZQ
 MNC/QNuMhaURAyjARwIQinOj2W+pty4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-cciM6FtkMsSJst45jl5zhg-1; Wed, 28 Sep 2022 07:31:33 -0400
X-MC-Unique: cciM6FtkMsSJst45jl5zhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658BD185A7A3;
 Wed, 28 Sep 2022 11:31:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 010BF2166B26;
 Wed, 28 Sep 2022 11:31:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 883EE21E691D; Wed, 28 Sep 2022 13:31:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 3/5] module: add Error arguments to module_load and
 module_load_qom
References: <20220927133825.32631-1-cfontana@suse.de>
 <20220927133825.32631-4-cfontana@suse.de>
Date: Wed, 28 Sep 2022 13:31:31 +0200
In-Reply-To: <20220927133825.32631-4-cfontana@suse.de> (Claudio Fontana's
 message of "Tue, 27 Sep 2022 15:38:23 +0200")
Message-ID: <87zgejybu4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> improve error handling during module load, by changing:
>
> bool module_load(const char *prefix, const char *lib_name);
> void module_load_qom(const char *type);
>
> to:
>
> int module_load(const char *prefix, const char *name, Error **errp);
> int module_load_qom(const char *type, Error **errp);
>
> where the return value is:
>
>  -1 on module load error, and errp is set with the error
>   0 on module or one of its dependencies are not installed
>   1 on module load success
>   2 on module load success (module already loaded or built-in)

Two changes, if I understand things correctly:

1. Convert to Error API from fprintf(stderr, ...)

2. Return a more useful value

Right?

Do you add any new errors here that weren't reported before?  Just
trying to calibrate my expectations before I dig into the actual patch.

> module_load_qom_one has been introduced in:
>
> commit 28457744c345 ("module: qom module support"), which built on top of
> module_load_one, but discarded the bool return value. Restore it.
>
> Adapt all callers to emit errors, or ignore them, or fail hard,
> as appropriate in each context.
>
> Some memory leaks also fixed as part of the module_load changes.

Where?

> audio: when attempting to load an audio module, report module load errors.
> block: when attempting to load a block module, report module load errors.
> console: when attempting to load a display module, report module load err=
ors.
>
> qdev: when creating a new qdev Device object (DeviceState), report load e=
rrors.
>       If a module cannot be loaded to create that device, now abort execu=
tion.
>
> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>               report module load errors.
>
> qtest: when processing the "module_load" qtest command, report errors
>        in the load of the module.

This looks like a list of behavioral changes.  Appreciated!  It's a bit
terse, though.  I might come back to this and suggest improvement.  But
first, I need to understand the patch.

>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  audio/audio.c         |  16 ++--
>  block.c               |  20 +++-
>  block/dmg.c           |  14 ++-
>  hw/core/qdev.c        |  17 +++-
>  include/qemu/module.h |  37 +++++++-
>  qom/object.c          |  18 +++-
>  softmmu/qtest.c       |   8 +-
>  ui/console.c          |  18 +++-
>  util/module.c         | 211 +++++++++++++++++++++++-------------------
>  9 files changed, 235 insertions(+), 124 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 0a682336a0..ea51793843 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -72,20 +72,24 @@ void audio_driver_register(audio_driver *drv)
>  audio_driver *audio_driver_lookup(const char *name)
>  {
>      struct audio_driver *d;
> +    Error *local_err =3D NULL;
> +    int rv;
>=20=20
>      QLIST_FOREACH(d, &audio_drivers, next) {
>          if (strcmp(name, d->name) =3D=3D 0) {
>              return d;
>          }
>      }
> -
> -    audio_module_load(name);
> -    QLIST_FOREACH(d, &audio_drivers, next) {
> -        if (strcmp(name, d->name) =3D=3D 0) {
> -            return d;
> +    rv =3D audio_module_load(name, &local_err);
> +    if (rv > 0) {
> +        QLIST_FOREACH(d, &audio_drivers, next) {
> +            if (strcmp(name, d->name) =3D=3D 0) {
> +                return d;
> +            }
>          }
> +    } else if (rv < 0) {
> +        error_report_err(local_err);
>      }
> -
>      return NULL;
>  }
>=20=20

Before: audio_module_load() reports to stderr, but the caller can't
know.  So, error or no error, search the driver registry for the one we
want.  Return it if found, else fail.

After: if audio_module_load() fails, report to stderr or current
monitor, and fail.  If it could find no module or loaded one, search the
driver registry.  Return it if found, else fail.

What if audio_module_load() fails, but a search for the driver succeeds?
Before the patch, we succeed.  Afterwards, we fail.  Can this happen?
Yes: module_load() starts with

       if (!g_module_supported()) {
           error_setg(errp, "%s", "this platform does not support GLib modu=
les");
           return -1;
       }

Regression.

One way to fix: ensure module_load() cannot fail when the search will
succeed.

Another: search first, and module_load() only if not found, then search
again.

Now let's review your use of the Error API.  Error objects should be
passed up the call chain to the place that handles then.  The call
chains are:

* audio_init(), which is called by

  - AUD_register_card(), which is called by a bunch of device creation
    helpers called within machine initialization functions (I think),
    which are called from qemu_init() via qemu_init_board() and
    machine_run_board_init()

  - AUD_add_capture(), which is called by

    =C2=B7 wav_start_capture(), which is called by hmp_wavcapture on behalf
      of HMP command wavcapture

    =C2=B7 audio_add(), which is called by protocol_client_msg() in respone
      of a VNC_MSG_CLIENT_QEMU_AUDIO_ENABLE message from a VNC client (I
      think).  Since audio_add() does return anything, its callers
      remain oblivious of failure.

  - audio_init_audiodevs(), which is called by
    qemu_create_early_backends(), which is called by qemu_init()

* audio_help(), which is called by

  - audio_parse_option(), which is called by qemu_init()

  - qemu_init()

* audio_handle_legacy_opts()

  - audio_init(); see above

  - audio_legacy_help(), which is called by qemu_init()

For the call chains that end in qemu_init(), error_report_err() is okay.
Just beware of error cascades, i.e. one issue triggering multiple
reports.  That's bad UX.  The extra reporting should predate this patch,
which means it's no reason to reject this patch.

Likewise for call chains that end in an HMP command, because
error_report_err() does the right thing then: it reports to the current
monitor.  Bug fix: before the patch, it reports to stderr.  Commit
message should mention the fix.

The problematic case is audio_add().  Reporting an error and then
ignoring it feels wrong.  But it's how audio_add() works even before
this patch.  Not this patch's problem to solve.

> diff --git a/block.c b/block.c
> index 72c7f6d47d..7a94739aed 100644
> --- a/block.c
> +++ b/block.c
> @@ -464,12 +464,18 @@ BlockDriver *bdrv_find_format(const char *format_na=
me)
>      /* The driver isn't registered, maybe we need to load a module */
>      for (i =3D 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
> -            block_module_load(block_driver_modules[i].library_name);
> +            Error *local_err =3D NULL;
> +            int rv =3D block_module_load(block_driver_modules[i].library=
_name,
> +                                       &local_err);
> +            if (rv > 0) {
> +                return bdrv_do_find_format(format_name);
> +            } else if (rv < 0) {
> +                error_report_err(local_err);
> +            }
>              break;
>          }
>      }
> -
> -    return bdrv_do_find_format(format_name);
> +    return NULL;
>  }
>=20=20

Same regression, I think.

Callers:

* bdrv_open_common()

* bdrv_fill_options()

* bdrv_open_inherit()

* bdrv_insert_node()

* bdrv_img_create()

* qmp_x_blockdev_amend()

* qmp_blockdev_create()

* qcow_co_create_opts()

* enable_write_target()

These all use the Error API.  Thus, we have instances of the
"error_report() or similar from within a user of th Error API"
anti-pattern.

Let's look more closely at just one of them: qmp_blockdev_create().
Since we're in QMP monitor context, bdrv_find_format()'s
error_report_err() will report a specific error to stderr, and then
qmp_blockdev_create() will report a less specific one to the QMP client.
This is wrong.

The obvious fix is to convert bdrv_find_format() to the Error API.

If you can't do that now, please note the issue in the commit message.

>  static int bdrv_format_is_whitelisted(const char *format_name, bool read=
_only)
> @@ -976,12 +982,16 @@ BlockDriver *bdrv_find_protocol(const char *filenam=
e,
>      for (i =3D 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (block_driver_modules[i].protocol_name &&
>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
> -            block_module_load(block_driver_modules[i].library_name);
> +            int rv =3D block_module_load(block_driver_modules[i].library=
_name, errp);
> +            if (rv > 0) {
> +                drv1 =3D bdrv_do_find_protocol(protocol);
> +            } else if (rv < 0) {
> +                return NULL;
> +            }
>              break;
>          }
>      }
>=20=20
> -    drv1 =3D bdrv_do_find_protocol(protocol);
>      if (!drv1) {
>          error_setg(errp, "Unknown protocol '%s'", protocol);
>      }

Same regression, I think.

bdrv_find_protocol() already uses the Error API, and your patch passes
the Error up the chain.  Good.

[...]

Out of steam for today, intend to continue later.  If you want to respin
meanwhile, that's okay.  If you prefer to wait for me to finish
reviewing this one, that's okay, too.


