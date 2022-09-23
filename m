Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142545E7F4F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:10:33 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblG3-0001UG-Ka
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obkxg-0006BF-B2
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obkxc-0007XZ-OV
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 11:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663948287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q6eFepxyZYkYQR8F9/p/nwFYtmX5Fs0qPDW57JDmkhc=;
 b=CMmrmsLWSuog4RzMY+fVbvi7zQoSmPmn7GCgyEvBnsClsCSaH86LrF3Z5SUQWA5AsvgGe3
 9vD/XIWeMpPc9vvuSxsgfiqsPBvpz1f/+eO1k01WGX2Ew/yK+NaH5UvhD0P0+Rt9kgfUrA
 dFyGv+BdY86tsS2R5gSx8ANCxFai9Fw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-9BiyCXnXM6meQGlGBVoGaQ-1; Fri, 23 Sep 2022 11:51:24 -0400
X-MC-Unique: 9BiyCXnXM6meQGlGBVoGaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ECC7185A794;
 Fri, 23 Sep 2022 15:51:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB95477F5C;
 Fri, 23 Sep 2022 15:51:22 +0000 (UTC)
Date: Fri, 23 Sep 2022 16:51:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 3/4] module: add Error arguments to module_load and
 module_load_qom
Message-ID: <Yy3V95eCse+PP2bA@redhat.com>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-4-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220923145131.21282-4-cfontana@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 04:51:30PM +0200, Claudio Fontana wrote:
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




> diff --git a/audio/audio.c b/audio/audio.c
> index 0a682336a0..ea51793843 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -72,20 +72,24 @@ void audio_driver_register(audio_driver *drv)
>  audio_driver *audio_driver_lookup(const char *name)
>  {
>      struct audio_driver *d;
> +    Error *local_err = NULL;
> +    int rv;
>  
>      QLIST_FOREACH(d, &audio_drivers, next) {
>          if (strcmp(name, d->name) == 0) {
>              return d;
>          }
>      }
> -
> -    audio_module_load(name);
> -    QLIST_FOREACH(d, &audio_drivers, next) {
> -        if (strcmp(name, d->name) == 0) {
> -            return d;
> +    rv = audio_module_load(name, &local_err);
> +    if (rv > 0) {
> +        QLIST_FOREACH(d, &audio_drivers, next) {
> +            if (strcmp(name, d->name) == 0) {
> +                return d;
> +            }
>          }
> +    } else if (rv < 0) {
> +        error_report_err(local_err);
>      }

The rv == 0 case could be treated the same as rv > 0
meaning the diff merely needs to be

   audio_module_load(name, &local_err)
   if (rv < 0) {
     error_report_err(local_err);
     return NULL;.
   }

>      return NULL;
>  }
>  
> diff --git a/block.c b/block.c
> index 72c7f6d47d..0390ece056 100644
> --- a/block.c
> +++ b/block.c
> @@ -464,12 +464,18 @@ BlockDriver *bdrv_find_format(const char *format_name)
>      /* The driver isn't registered, maybe we need to load a module */
>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
> -            block_module_load(block_driver_modules[i].library_name);
> +            Error *local_err = NULL;
> +            int rv = block_module_load(block_driver_modules[i].library_name,
> +                                       &local_err);
> +            if (rv > 0) {
> +                return bdrv_do_find_format(format_name);
> +            } else if (rv < 0) {
> +                error_report_err(local_err);
> +            }

Again,  rv ==0 can be handled the same as rv > 0


> @@ -976,12 +982,17 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>          if (block_driver_modules[i].protocol_name &&
>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
> -            block_module_load(block_driver_modules[i].library_name);
> +            Error *local_err = NULL;
> +            int rv = block_module_load(block_driver_modules[i].library_name, &local_err);
> +            if (rv > 0) {
> +                drv1 = bdrv_do_find_protocol(protocol);
> +            } else if (rv < 0) {
> +                error_report_err(local_err);
> +            }

Likewise rv == 0 vs rv > 0



> diff --git a/block/dmg.c b/block/dmg.c
> index 007b8d9996..e84a7a44a3 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -434,6 +434,8 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>      uint64_t plist_xml_offset, plist_xml_length;
>      int64_t offset;
>      int ret;
> +    int module_rv;
> +    Error *local_err = NULL;
>  
>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>      if (ret < 0) {
> @@ -446,8 +448,21 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>          return -EINVAL;
>      }
>  
> -    block_module_load("dmg-bz2");
> -    block_module_load("dmg-lzfse");
> +    module_rv = block_module_load("dmg-bz2", &local_err);
> +    if (module_rv < 0) {
> +        error_report_err(local_err);
> +        return -EINVAL;
> +    } else if (module_rv == 0) {
> +        warn_report("dmg-bz2 module not present, bz2 decomp unavailable");
> +    }
> +    local_err = NULL;
> +    module_rv = block_module_load("dmg-lzfse", &local_err);
> +    if (module_rv < 0) {
> +        error_report_err(local_err);
> +        return -EINVAL;
> +    } else if (module_rv == 0) {
> +        warn_report("dmg-lzfse module not present, lzfse decomp unavailable");
> +    }

THis is the wrong place for these warnings, it'll spam
stdout, even if the file opened doesn't use bz2/lzfse.

The real problem is the later code which appears to
silently ignore data blocks if the lzfse/bz2 modules
are not loaded, instead of using error_report.


> diff --git a/qom/object.c b/qom/object.c
> index 4f834f3bf6..35ced55282 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -526,8 +526,13 @@ void object_initialize(void *data, size_t size, const char *typename)
>  
>  #ifdef CONFIG_MODULES
>      if (!type) {
> -        module_load_qom(typename);
> -        type = type_get_by_name(typename);
> +        Error *local_err = NULL;
> +        int rv = module_load_qom(typename, &local_err);
> +        if (rv > 0) {
> +            type = type_get_by_name(typename);
> +        } else if (rv < 0) {
> +            error_report_err(local_err);
> +        }

Again no need to distinguish rv == 0 from rv > 0

> @@ -1033,8 +1038,13 @@ ObjectClass *module_object_class_by_name(const char *typename)
>      oc = object_class_by_name(typename);
>  #ifdef CONFIG_MODULES
>      if (!oc) {
> -        module_load_qom(typename);
> -        oc = object_class_by_name(typename);
> +        Error *local_err = NULL;
> +        int rv = module_load_qom(typename, &local_err);
> +        if (rv > 0) {
> +            oc = object_class_by_name(typename);
> +        } else if (rv < 0) {
> +            error_report_err(local_err);
> +        }

Same comment

> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index fc5b733c63..36e28609ff 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -753,12 +753,18 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>          qtest_sendf(chr, "OK %"PRIi64"\n",
>                      (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>      } else if (strcmp(words[0], "module_load") == 0) {
> +        Error *local_err = NULL;
> +        int rv;
>          g_assert(words[1] && words[2]);
>  
>          qtest_send_prefix(chr);
> -        if (module_load(words[1], words[2])) {
> +        rv = module_load(words[1], words[2], &local_err);
> +        if (rv > 0) {
>              qtest_sendf(chr, "OK\n");
>          } else {
> +            if (rv < 0) {
> +                error_report_err(local_err);
> +            }
>              qtest_sendf(chr, "FAIL\n");
>          }

This change means the 'module_load' command is totally silent
if  'rv == 0', but the code appears to try to read a response
line which will now never arrive AFAICT.

In the context of 'modules-test.c' I think it is fine to treat
rv == 0 the same as rv > 0 and thus print 'OK'.



Perhaps I've overlooked something, but I'm not seeing a reason
we need module_load() to return 4 different return values. It
looks like every caller would work with a boolean success/fail


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


