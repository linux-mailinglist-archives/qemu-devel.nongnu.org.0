Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE75BA961
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 11:29:31 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ7f8-0007RZ-30
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 05:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ7de-0005NT-5d
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oZ7da-00087R-I6
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663320473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o8jeETvZyBrDMD6s+siBFk8mU+i2DN/ouDl4u96PIGE=;
 b=hCcD5KH4dZMiaeokZ/dJ2DsJ6fLHW+aRhF7YqM1+YOnyVd7BqA7UA4k+p0NnDhZzknVHps
 nEepVE8yJ+GDo3teKoo859wMO1TlJo2uOXuEMT0dUb+Q/o/bWs6AFy/rY9r1vs6OKX64Rd
 120x1E0fx5shbT+5o/rRcWnRZdOqd6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-ylxof6vYP1eTbxftctDsUA-1; Fri, 16 Sep 2022 05:27:49 -0400
X-MC-Unique: ylxof6vYP1eTbxftctDsUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8987485A583;
 Fri, 16 Sep 2022 09:27:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A08D40C83EF;
 Fri, 16 Sep 2022 09:27:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A63E621E6900; Fri, 16 Sep 2022 11:27:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
Date: Fri, 16 Sep 2022 11:27:47 +0200
In-Reply-To: <20220908183012.17667-3-cfontana@suse.de> (Claudio Fontana's
 message of "Thu, 8 Sep 2022 20:30:11 +0200")
Message-ID: <877d23ekj0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> bool module_load_one(const char *prefix, const char *lib_name);
> void module_load_qom_one(const char *type);
>
> to:
>
> bool module_load_one(const char *prefix, const char *name, Error **errp);
> bool module_load_qom_one(const char *type, Error **errp);
>
> module_load_qom_one has been introduced in:
>
> commit 28457744c345 ("module: qom module support"), which built on top of
> module_load_one, but discarded the bool return value. Restore it.
>
> Adapt all callers to emit errors, or ignore them, or fail hard,
> as appropriate in each context.

How exactly does behavior change?  The commit message is mum on the
behavior before the patch, and vague on the behavior afterwards.

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  audio/audio.c         |   9 ++-
>  block.c               |  15 ++++-
>  block/dmg.c           |  18 +++++-
>  hw/core/qdev.c        |  10 ++-
>  include/qemu/module.h |  38 ++++++++++--
>  qom/object.c          |  18 +++++-
>  softmmu/qtest.c       |   6 +-
>  ui/console.c          |  18 +++++-
>  util/module.c         | 140 ++++++++++++++++++++++++------------------
>  9 files changed, 194 insertions(+), 78 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 76b8735b44..cff7464c07 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
>  audio_driver *audio_driver_lookup(const char *name)
>  {
>      struct audio_driver *d;
> +    Error *local_err = NULL;
>  
>      QLIST_FOREACH(d, &audio_drivers, next) {
>          if (strcmp(name, d->name) == 0) {
> @@ -79,7 +80,13 @@ audio_driver *audio_driver_lookup(const char *name)
>          }
>      }
>  
> -    audio_module_load_one(name);
> +    if (!audio_module_load_one(name, &local_err)) {
> +        if (local_err) {
> +            error_report_err(local_err);
> +        }
> +        return NULL;
> +    }
> +
>      QLIST_FOREACH(d, &audio_drivers, next) {
>          if (strcmp(name, d->name) == 0) {
>              return d;
> diff --git a/block.c b/block.c
> index bc85f46eed..8b610c6d95 100644
> --- a/block.c
> +++ b/block.c
> @@ -464,7 +464,14 @@ BlockDriver *bdrv_find_format(const char *format_name)
>      /* The driver isn't registered, maybe we need to load a module */
>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
> -            block_module_load_one(block_driver_modules[i].library_name);
> +            Error *local_err = NULL;
> +            if (!block_module_load_one(block_driver_modules[i].library_name,
> +                                       &local_err)) {
> +                if (local_err) {
> +                    error_report_err(local_err);
> +                }
> +                return NULL;
> +            }
>              break;
>          }
>      }

Before the patch, bdrv_find_format() fails silently[*].

Afterwards, it reports an error on some failures, but not on others.
Sure this is what we want?

> @@ -976,7 +983,11 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (block_driver_modules[i].protocol_name &&
>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
> -            block_module_load_one(block_driver_modules[i].library_name);
> +            Error *local_err = NULL;
> +            if (!block_module_load_one(block_driver_modules[i].library_name,
> +                                       &local_err) && local_err) {

Break the line before && local_err, please, like you do elsewhere.

> +                error_report_err(local_err);
> +            }
>              break;
>          }
>      }

Uh-oh: error_report() or equivalent in a function with an Error **
parameter.  This is almost always wrong.  Shouldn't you pass the error
to the caller?

Please check all uses of your FOO_load_one() for this issue.

> diff --git a/block/dmg.c b/block/dmg.c
> index 98db18d82a..11d184d39c 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>      uint64_t plist_xml_offset, plist_xml_length;
>      int64_t offset;
>      int ret;
> +    Error *local_err = NULL;
>  
>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>      if (ret < 0) {
> @@ -446,8 +447,21 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>          return -EINVAL;
>      }
>  
> -    block_module_load_one("dmg-bz2");
> -    block_module_load_one("dmg-lzfse");
> +    if (!block_module_load_one("dmg-bz2", &local_err)) {
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return -EINVAL;
> +        }
> +        warn_report("dmg-bz2 module not present, bz2 decomp unavailable");
> +    }
> +    local_err = NULL;
> +    if (!block_module_load_one("dmg-lzfse", &local_err)) {
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return -EINVAL;
> +        }
> +        warn_report("dmg-lzfse module not present, lzfse decomp unavailable");
> +    }
>  
>      s->n_chunks = 0;
>      s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 0806d8fcaa..5902c59c94 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -148,7 +148,15 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>  DeviceState *qdev_new(const char *name)
>  {
>      if (!object_class_by_name(name)) {
> -        module_load_qom_one(name);
> +        Error *local_err = NULL;
> +        if (!module_load_qom_one(name, &local_err)) {
> +            if (local_err) {
> +                error_report_err(local_err);
> +            } else {
> +                error_report("could not find a module for type '%s'", name);
> +            }
> +            abort();

Why is this a programming error?

> +        }
>      }
>      return DEVICE(object_new(name));
>  }
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 8c012bbe03..78d4c4de96 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -61,16 +61,44 @@ typedef enum {
>  #define fuzz_target_init(function) module_init(function, \
>                                                 MODULE_INIT_FUZZ_TARGET)
>  #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
> -#define block_module_load_one(lib) module_load_one("block-", lib)
> -#define ui_module_load_one(lib) module_load_one("ui-", lib)
> -#define audio_module_load_one(lib) module_load_one("audio-", lib)
> +#define block_module_load_one(lib, errp) module_load_one("block-", lib, errp)
> +#define ui_module_load_one(lib, errp) module_load_one("ui-", lib, errp)
> +#define audio_module_load_one(lib, errp) module_load_one("audio-", lib, errp)
>  
>  void register_module_init(void (*fn)(void), module_init_type type);
>  void register_dso_module_init(void (*fn)(void), module_init_type type);
>  
>  void module_call_init(module_init_type type);
> -bool module_load_one(const char *prefix, const char *lib_name);
> -void module_load_qom_one(const char *type);
> +
> +/*
> + * module_load_one: attempt to load a module from a set of directories
> + *
> + * directories searched are:
> + * - getenv("QEMU_MODULE_DIR")
> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
> + * - /var/run/qemu/${version_dir}
> + *
> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
> + * name:           name of the module
> + * errp:           error to set in case the module is found, but load failed.
> + *
> + * Return value:   true on success (found and loaded);
> + *                 if module if found, but load failed, errp will be set.
> + *                 if module is not found, errp will not be set.

I understand you need to distingush two failure modes "found, but load
failed" and "not found".

Functions that set an error on some failures only tend to be awkward: in
addition to checking the return value for failure, you have to check
@errp for special failures.  This is particularly cumbersome when it
requires a @local_err and an error_propagate() just for that.  I
generally prefer to return an error code and always set an error.

That said, the patch doesn't look bad.  Perhaps it will be once the
issues I pointed out above have been addressed.  Let's not worry about
it right now.

> + */
> +bool module_load_one(const char *prefix, const char *name, Error **errp);
> +
> +/*
> + * module_load_qom_one: attempt to load a module to provide a QOM type
> + *
> + * type:           the type to be provided
> + * errp:           error to set.
> + *
> + * Return value:   true on success (found and loaded), false on failure.
> + *                 If a module is simply not found for the type,
> + *                 errp will not be set.
> + */
> +bool module_load_qom_one(const char *type, Error **errp);
>  void module_load_qom_all(void);
>  void module_allow_arch(const char *arch);
>  

[...]


[*] Except it prints "Module is not supported by system\n" to stderr
when !g_module_supported(), which doesn't look right to me.


