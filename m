Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBA5AED5E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:32:00 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZcN-0007GB-Dg
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZS9-0007ql-1G
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:21:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZS5-0001p9-P1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:21:24 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o15-20020a17090a3d4f00b002004ed4d77eso6014811pjf.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=IY81pB6EhRPNgD8sr/NmWre6f2wMDBn4hHjwsjUE9D0=;
 b=Dln3k/2Od0dl2VZCq/1r+7pGqtjQ1pBqyxArJ9Ovt5qr3X0WE1LuIYSex+3qYBrMOk
 +wxl1x7aV5+S11AzNO6L//96OEMBjqf1Dgv1JyUAxcYNhbyKiCYtDtvEdRsxbqpAVsrR
 SaJjhNP5WkZJG6pjg1gxl2XCf9czhormCIAAr9etG4yGJ+gvy0t6wAqwZGSHSFTLOHLl
 e4jazFn3Z8ViIE8OAHYd+kng8R+L2hu014Dm5vvzqR+duFmVYKipR7sUu9HIyO0UTj5b
 z9JN0N/AB7pUksgoGL6ZMl2LJa3r8WPIvIQTcnzZcJlg4YvbZ7TsEMJSGD/mqS7wNFOn
 Pi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=IY81pB6EhRPNgD8sr/NmWre6f2wMDBn4hHjwsjUE9D0=;
 b=c5pm7wG8wsA50ltxx72tVx3HqWEnK5umgts/vx87lZbM0cQ/jX7ZC//YfjjXjLqdC7
 7DaBRdMXGi6QtkPlyfEF9BTvwNEC8cuDvEsB6z3FVOi/5+P5YW4G5JQl+rk7yFrrxsXZ
 sP6c3QTTWXAvXsVxVOaY52tw5s4I6a0Rg8b5BDWnlhFfe5e6FGFrnwO9ot2f2oSYudZ2
 7YdzfkqLgKa3PEuXs6aHbwaBZcwLv+GAMQ4nWLIQfYnhFkBlh3a0SzFqfWLngjaqGfUI
 hnHecVwfR6R5ltmLcKYaN1j7MLuDLlwgx9zHG8o0g0Mwo+qUowd3oBwKL63YagJASK3I
 8KJg==
X-Gm-Message-State: ACgBeo2bYRCpT0WQH35OD7ANEDLGeIO3wtD6gRNxlhdJDR66u1V6MoGi
 C0Ji2+bVU5sY41A62dnAcoc=
X-Google-Smtp-Source: AA6agR5jTBO7QaeF0MOjj1ofH33BGYKuYfV4DZkg2XiqMOxBfff3B7S/ImykipKVpdTF5YWIjvWTNw==
X-Received: by 2002:a17:90b:3b92:b0:200:ad6a:d762 with SMTP id
 pc18-20020a17090b3b9200b00200ad6ad762mr1075016pjb.227.1662474078788; 
 Tue, 06 Sep 2022 07:21:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ce8200b0015e8d4eb1d5sm4725021plg.31.2022.09.06.07.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:21:18 -0700 (PDT)
Message-ID: <9d22dd82-516e-46a2-bdbc-0aa9214d53c4@amsat.org>
Date: Tue, 6 Sep 2022 16:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220906115501.28581-1-cfontana@suse.de>
 <20220906115501.28581-3-cfontana@suse.de>
 <6608303b-0e08-8045-3872-257450e1adb5@suse.de>
In-Reply-To: <6608303b-0e08-8045-3872-257450e1adb5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Markus

On 6/9/22 14:32, Claudio Fontana wrote:
> On 9/6/22 13:55, Claudio Fontana wrote:
>> improve error handling during module load, by changing:
>>
>> bool module_load_one(const char *prefix, const char *lib_name);
>> void module_load_qom_one(const char *type);
>>
>> to:
>>
>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>> bool module_load_qom_one(const char *type, Error **errp);
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   audio/audio.c         |   6 +-
>>   block.c               |  12 +++-
>>   block/dmg.c           |  10 ++-
>>   hw/core/qdev.c        |  10 ++-
>>   include/qemu/module.h |  10 +--
>>   qom/object.c          |  15 +++-
>>   softmmu/qtest.c       |   6 +-
>>   ui/console.c          |  19 +++++-
>>   util/module.c         | 155 ++++++++++++++++++++++++++++++------------
>>   9 files changed, 182 insertions(+), 61 deletions(-)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 76b8735b44..4f4bb10cce 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
>>   audio_driver *audio_driver_lookup(const char *name)
>>   {
>>       struct audio_driver *d;
>> +    Error *local_err = NULL;
>>   
>>       QLIST_FOREACH(d, &audio_drivers, next) {
>>           if (strcmp(name, d->name) == 0) {
>> @@ -79,7 +80,10 @@ audio_driver *audio_driver_lookup(const char *name)
>>           }
>>       }
>>   
>> -    audio_module_load_one(name);
>> +    if (!audio_module_load_one(name, &local_err) && local_err) {
>> +        error_report_err(local_err);
>> +    }
>> +
>>       QLIST_FOREACH(d, &audio_drivers, next) {
>>           if (strcmp(name, d->name) == 0) {
>>               return d;
>> diff --git a/block.c b/block.c
>> index bc85f46eed..85c3742d7a 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -464,7 +464,11 @@ BlockDriver *bdrv_find_format(const char *format_name)
>>       /* The driver isn't registered, maybe we need to load a module */
>>       for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>           if (!strcmp(block_driver_modules[i].format_name, format_name)) {
>> -            block_module_load_one(block_driver_modules[i].library_name);
>> +            Error *local_err = NULL;
>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>> +                                       &local_err) && local_err) {
>> +                error_report_err(local_err);
>> +            }
>>               break;
>>           }
>>       }
>> @@ -976,7 +980,11 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>>       for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>           if (block_driver_modules[i].protocol_name &&
>>               !strcmp(block_driver_modules[i].protocol_name, protocol)) {
>> -            block_module_load_one(block_driver_modules[i].library_name);
>> +            Error *local_err = NULL;
>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>> +                                       &local_err) && local_err) {
>> +                error_report_err(local_err);
>> +            }
>>               break;
>>           }
>>       }
>> diff --git a/block/dmg.c b/block/dmg.c
>> index 98db18d82a..349b05d20b 100644
>> --- a/block/dmg.c
>> +++ b/block/dmg.c
>> @@ -434,6 +434,7 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>       uint64_t plist_xml_offset, plist_xml_length;
>>       int64_t offset;
>>       int ret;
>> +    Error *local_err = NULL;
>>   
>>       ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>>       if (ret < 0) {
>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>           return -EINVAL;
>>       }
>>   
>> -    block_module_load_one("dmg-bz2");
>> -    block_module_load_one("dmg-lzfse");
>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>> +        error_report_err(local_err);
>> +    }
>> +    local_err = NULL;
>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>> +        error_report_err(local_err);
>> +    }
>>   
>>       s->n_chunks = 0;
>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index 0806d8fcaa..5902c59c94 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -148,7 +148,15 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>>   DeviceState *qdev_new(const char *name)
>>   {
>>       if (!object_class_by_name(name)) {
>> -        module_load_qom_one(name);
>> +        Error *local_err = NULL;
>> +        if (!module_load_qom_one(name, &local_err)) {
>> +            if (local_err) {
>> +                error_report_err(local_err);
>> +            } else {
>> +                error_report("could not find a module for type '%s'", name);
>> +            }
>> +            abort();
> 
> Are we ok abort() ing here for qdev?
> 
> In my understanding of this, qdev_new is expected to always succeed,
> while we have qdev_try_new for allowing continuing the program even on failure.
> 
> Can someone confirm this?
> 
>> +        }
>>       }
>>       return DEVICE(object_new(name));
>>   }
>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>> index 8c012bbe03..7893922aba 100644
>> --- a/include/qemu/module.h
>> +++ b/include/qemu/module.h
>> @@ -61,16 +61,16 @@ typedef enum {
>>   #define fuzz_target_init(function) module_init(function, \
>>                                                  MODULE_INIT_FUZZ_TARGET)
>>   #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
>> -#define block_module_load_one(lib) module_load_one("block-", lib)
>> -#define ui_module_load_one(lib) module_load_one("ui-", lib)
>> -#define audio_module_load_one(lib) module_load_one("audio-", lib)
>> +#define block_module_load_one(lib, errp) module_load_one("block-", lib, errp)
>> +#define ui_module_load_one(lib, errp) module_load_one("ui-", lib, errp)
>> +#define audio_module_load_one(lib, errp) module_load_one("audio-", lib, errp)
>>   
>>   void register_module_init(void (*fn)(void), module_init_type type);
>>   void register_dso_module_init(void (*fn)(void), module_init_type type);
>>   
>>   void module_call_init(module_init_type type);
>> -bool module_load_one(const char *prefix, const char *lib_name);
>> -void module_load_qom_one(const char *type);
>> +bool module_load_one(const char *prefix, const char *name, Error **errp);
>> +bool module_load_qom_one(const char *type, Error **errp);
>>   void module_load_qom_all(void);
>>   void module_allow_arch(const char *arch);
>>   
>> diff --git a/qom/object.c b/qom/object.c
>> index d34608558e..6a74e6a478 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -526,8 +526,14 @@ void object_initialize(void *data, size_t size, const char *typename)
>>   
>>   #ifdef CONFIG_MODULES
>>       if (!type) {
>> -        module_load_qom_one(typename);
>> -        type = type_get_by_name(typename);
>> +        Error *local_err = NULL;
>> +        if (!module_load_qom_one(typename, &local_err)) {
>> +            if (local_err) {
>> +                error_report_err(local_err);
>> +            }
>> +        } else {
>> +            type = type_get_by_name(typename);
>> +        }
>>       }
>>   #endif
>>       if (!type) {
>> @@ -1033,7 +1039,10 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>       oc = object_class_by_name(typename);
>>   #ifdef CONFIG_MODULES
>>       if (!oc) {
>> -        module_load_qom_one(typename);
>> +        Error *local_err = NULL;
>> +        if (!module_load_qom_one(typename, &local_err) && local_err) {
>> +            error_report_err(local_err);
>> +        }
>>           oc = object_class_by_name(typename);
>>       }
>>   #endif
>> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
>> index 76eb7bac56..bb83c7aae9 100644
>> --- a/softmmu/qtest.c
>> +++ b/softmmu/qtest.c
>> @@ -753,12 +753,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>>           qtest_sendf(chr, "OK %"PRIi64"\n",
>>                       (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>>       } else if (strcmp(words[0], "module_load") == 0) {
>> +        Error *local_err = NULL;
>>           g_assert(words[1] && words[2]);
>>   
>>           qtest_send_prefix(chr);
>> -        if (module_load_one(words[1], words[2])) {
>> +        if (module_load_one(words[1], words[2], &local_err)) {
>>               qtest_sendf(chr, "OK\n");
>>           } else {
>> +            if (local_err) {
>> +                error_report_err(local_err);
>> +            }
>>               qtest_sendf(chr, "FAIL\n");
>>           }
>>       } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
>> diff --git a/ui/console.c b/ui/console.c
>> index 765892f84f..9c5f6d5c30 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -2632,7 +2632,11 @@ bool qemu_display_find_default(DisplayOptions *opts)
>>   
>>       for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
>>           if (dpys[prio[i]] == NULL) {
>> -            ui_module_load_one(DisplayType_str(prio[i]));
>> +            Error *local_err = NULL;
>> +            if (!ui_module_load_one(DisplayType_str(prio[i]), &local_err)
>> +                && local_err) {
>> +                error_report_err(local_err);
>> +            }
>>           }
>>           if (dpys[prio[i]] == NULL) {
>>               continue;
>> @@ -2650,7 +2654,11 @@ void qemu_display_early_init(DisplayOptions *opts)
>>           return;
>>       }
>>       if (dpys[opts->type] == NULL) {
>> -        ui_module_load_one(DisplayType_str(opts->type));
>> +        Error *local_err = NULL;
>> +        if (!ui_module_load_one(DisplayType_str(opts->type), &local_err)
>> +            && local_err) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>       if (dpys[opts->type] == NULL) {
>>           error_report("Display '%s' is not available.",
>> @@ -2680,7 +2688,12 @@ void qemu_display_help(void)
>>       printf("none\n");
>>       for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
>>           if (!dpys[idx]) {
>> -            ui_module_load_one(DisplayType_str(idx));
>> +            Error *local_err = NULL;
>> +            if (!ui_module_load_one(DisplayType_str(idx), &local_err)
>> +                && local_err) {
>> +                /* don't clutter the help text, no error report emitted */
>> +                error_free(local_err);
>> +            }
>>           }
>>           if (dpys[idx]) {
>>               printf("%s\n",  DisplayType_str(dpys[idx]->type));
>> diff --git a/util/module.c b/util/module.c
>> index 8563edd626..7b838ee4a1 100644
>> --- a/util/module.c
>> +++ b/util/module.c
>> @@ -21,6 +21,7 @@
>>   #include "qemu/module.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/config-file.h"
>> +#include "qapi/error.h"
>>   #ifdef CONFIG_MODULE_UPGRADES
>>   #include "qemu-version.h"
>>   #endif
>> @@ -144,7 +145,22 @@ static bool module_check_arch(const QemuModinfo *modinfo)
>>       return true;
>>   }
>>   
>> -static int module_load_file(const char *fname, bool export_symbols)
>> +/*
>> + * module_load_file: attempt to load a dso file
>> + *
>> + * fname:          full pathname of the file to load
>> + * export_symbols: if true, add the symbols to the global name space
>> + * errp:           error to set.
>> + *
>> + * Return value:   0 on success (found and loaded), < 0 on failure.
>> + *                 A return value of -ENOENT or -ENOTDIR means 'not found'.
> 
> Here I accepted both ENOENT and ENOTDIR, because the idea was,
> if the pathname provided as argument contains directories that are actually not directories,
> it means that we can't find any module with the provided path.
> 
> We want to distinguish "found but an error occurred during load" from "not found" in my understanding:
> 
> "found and loaded" -> return value 0 (no error set in errp obviously).
> "not found" -> return value -ENOENT or -ENOTDIR, no error set in errp.
> "found and error during load" -> return value -errno or a generic -EINVAL, with error set in errp.
> 
>> + *                 -EINVAL is used as the generic error condition.
>> + *
>> + * Error:          If fname is found, but could not be loaded, errp is set
>> + *                 with the error encountered during load.
>> + */
>> +static int module_load_file(const char *fname, bool export_symbols,
>> +                            Error **errp)
>>   {
>>       GModule *g_module;
>>       void (*sym)(void);
>> @@ -152,16 +168,19 @@ static int module_load_file(const char *fname, bool export_symbols)
>>       int len = strlen(fname);
>>       int suf_len = strlen(dsosuf);
>>       ModuleEntry *e, *next;
>> -    int ret, flags;
>> +    int flags;
>>   
>>       if (len <= suf_len || strcmp(&fname[len - suf_len], dsosuf)) {
>> -        /* wrong suffix */
>> -        ret = -EINVAL;
>> -        goto out;
>> +        error_setg(errp, "wrong filename, missing suffix %s", dsosuf);
>> +        return -EINVAL;
>>       }
>> -    if (access(fname, F_OK)) {
>> -        ret = -ENOENT;
>> -        goto out;
>> +    if (access(fname, F_OK) != 0) {
>> +        int ret = errno;
>> +        if (ret != ENOENT && ret != ENOTDIR) {
>> +            error_setg_errno(errp, ret, "error trying to access %s", fname);
>> +        }
>> +        /* most likely is EACCES here */
>> +        return -ret;
>>       }
>>   
>>       assert(QTAILQ_EMPTY(&dso_init_list));
>> @@ -172,41 +191,52 @@ static int module_load_file(const char *fname, bool export_symbols)
>>       }
>>       g_module = g_module_open(fname, flags);
>>       if (!g_module) {
>> -        fprintf(stderr, "Failed to open module: %s\n",
>> -                g_module_error());
>> -        ret = -EINVAL;
>> -        goto out;
>> +        error_setg(errp, "failed to open module: %s", g_module_error());
>> +        return -EINVAL;
>>       }
>>       if (!g_module_symbol(g_module, DSO_STAMP_FUN_STR, (gpointer *)&sym)) {
>> -        fprintf(stderr, "Failed to initialize module: %s\n",
>> -                fname);
>> -        /* Print some info if this is a QEMU module (but from different build),
>> -         * this will make debugging user problems easier. */
>> +        error_setg(errp, "failed to initialize module: %s", fname);
>> +        /*
>> +         * Print some info if this is a QEMU module (but from different build),
>> +         * this will make debugging user problems easier.
>> +         */
>>           if (g_module_symbol(g_module, "qemu_module_dummy", (gpointer *)&sym)) {
>> -            fprintf(stderr,
>> -                    "Note: only modules from the same build can be loaded.\n");
>> +            error_append_hint(errp,
>> +                              "Only modules from the same build can be loaded");
>>           }
>>           g_module_close(g_module);
>> -        ret = -EINVAL;
>> -    } else {
>> -        QTAILQ_FOREACH(e, &dso_init_list, node) {
>> -            e->init();
>> -            register_module_init(e->init, e->type);
>> -        }
>> -        ret = 0;
>> +        return -EINVAL;
>>       }
>>   
>> +    QTAILQ_FOREACH(e, &dso_init_list, node) {
>> +        e->init();
>> +        register_module_init(e->init, e->type);
>> +    }
>>       trace_module_load_module(fname);
>>       QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
>>           QTAILQ_REMOVE(&dso_init_list, e, node);
>>           g_free(e);
>>       }
>> -out:
>> -    return ret;
>> +    return 0;
>>   }
>> -#endif
>> +#endif /* CONFIG_MODULES */
>>   
>> -bool module_load_one(const char *prefix, const char *lib_name)
>> +/*
>> + * module_load_one: attempt to load a module from a set of directories
>> + *
>> + * directories searched are:
>> + * - getenv("QEMU_MODULE_DIR")
>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>> + * - /var/run/qemu/${version_dir}
> 
> I found it quite complex to understand what exactly this version_dir is from the code below...
>> + *
>> + * prefix:         a subsystem prefix, or the empty string ("audio-", "")
>> + * name:           name of the module
>> + * errp:           error to set.
>> + *
>> + * Return value:   true on success (found and loaded), false on failure.
>> + *                 If module is found, but could not be loaded, errp will be set
>> + */
>> +bool module_load_one(const char *prefix, const char *name, Error **errp)
>>   {
>>       bool success = false;
>>   
>> @@ -226,7 +256,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>       const char **sl;
>>   
>>       if (!g_module_supported()) {
>> -        fprintf(stderr, "Module is not supported by system.\n");
>> +        error_setg(errp, "%s", "this platform does not support GLib modules");
>>           return false;
>>       }
>>   
>> @@ -234,7 +264,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>           loaded_modules = g_hash_table_new(g_str_hash, g_str_equal);
>>       }
>>   
>> -    module_name = g_strdup_printf("%s%s", prefix, lib_name);
>> +    module_name = g_strdup_printf("%s%s", prefix, name);
>>   
>>       if (g_hash_table_contains(loaded_modules, module_name)) {
>>           g_free(module_name);
>> @@ -246,6 +276,8 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>           if (modinfo->arch) {
>>               if (strcmp(modinfo->name, module_name) == 0) {
>>                   if (!module_check_arch(modinfo)) {
>> +                    error_setg(errp, "module arch does not match: "
>> +                        "expected '%s', got '%s'", module_arch, modinfo->arch);
>>                       return false;
>>                   }
>>               }
>> @@ -254,7 +286,9 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>               if (strcmp(modinfo->name, module_name) == 0) {
>>                   /* we depend on other module(s) */
>>                   for (sl = modinfo->deps; *sl != NULL; sl++) {
>> -                    module_load_one("", *sl);
>> +                    if (!(module_load_one("", *sl, errp))) {
>> +                        return false;
>> +                    }
>>                   }
>>               } else {
>>                   for (sl = modinfo->deps; *sl != NULL; sl++) {
>> @@ -285,14 +319,20 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>       for (i = 0; i < n_dirs; i++) {
>>           fname = g_strdup_printf("%s/%s%s",
>>                   dirs[i], module_name, CONFIG_HOST_DSOSUF);
>> -        ret = module_load_file(fname, export_symbols);
>> +        ret = module_load_file(fname, export_symbols, errp);
>>           g_free(fname);
>>           fname = NULL;
>> -        /* Try loading until loaded a module file */
>> -        if (!ret) {
>> -            success = true;
>> -            break;
>> +        /*
>> +         * Try to find the file in all directories until we either fail badly,
>> +         * load the file successfully, or exhaust all directories in the list.
>> +         */
>> +        if (ret == -ENOENT || ret == -ENOTDIR) {
>> +            continue;
>>           }
>> +        if (ret == 0) {
>> +            success = true;
>> +        }
>> +        break;
>>       }
>>   
>>       if (!success) {
>> @@ -312,13 +352,25 @@ bool module_load_one(const char *prefix, const char *lib_name)
>>   
>>   static bool module_loaded_qom_all;
>>   
>> -void module_load_qom_one(const char *type)
>> +/*
>> + * module_load_qom_one: attempt to load a module to provide a QOM type
>> + *
>> + * type:           the type to be provided
>> + * errp:           error to set.
>> + *
>> + * Return value:   true on success (found and loaded), false on failure.
>> + *                 If a module is simply not found for the type,
>> + *                 errp will not be set.
>> + */
>> +bool module_load_qom_one(const char *type, Error **errp)
>>   {
>> +    bool found = false;
>>       const QemuModinfo *modinfo;
>>       const char **sl;
>>   
>>       if (!type) {
>> -        return;
>> +        error_setg(errp, "%s", "type is NULL");
>> +        return false;
>>       }
>>   
>>       trace_module_lookup_object_type(type);
>> @@ -331,15 +383,26 @@ void module_load_qom_one(const char *type)
>>           }
>>           for (sl = modinfo->objs; *sl != NULL; sl++) {
>>               if (strcmp(type, *sl) == 0) {
>> -                module_load_one("", modinfo->name);
>> +                if (found) {
>> +                    error_setg(errp, "multiple modules providing '%s'", type);
>> +                    found = false;
>> +                    break;
> 
> I added this one, as it does not otherwise make sense to continue the loop.
> Either we loop through all modules in order to find duplicates, or we bail out as soon as we find one;
> 
> in this patch I chose to keep the existing idea to loop through all modules, but then added the check to report an error if multiple mods try to handle the same type.
> 
>> +                }
>> +                found = module_load_one("", modinfo->name, errp);
>> +                if (!found) {
>> +                    /* errp optionally set in module_load_one */
>> +                    break;
>> +                }
>>               }
>>           }
>>       }
>> +    return found;
>>   }
>>   
>>   void module_load_qom_all(void)
>>   {
>>       const QemuModinfo *modinfo;
>> +    Error *local_err = NULL;
>>   
>>       if (module_loaded_qom_all) {
>>           return;
>> @@ -352,7 +415,9 @@ void module_load_qom_all(void)
>>           if (!module_check_arch(modinfo)) {
>>               continue;
>>           }
>> -        module_load_one("", modinfo->name);
>> +        if (!module_load_one("", modinfo->name, &local_err) && local_err) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>       module_loaded_qom_all = true;
>>   }
>> @@ -368,7 +433,11 @@ void qemu_load_module_for_opts(const char *group)
>>           }
>>           for (sl = modinfo->opts; *sl != NULL; sl++) {
>>               if (strcmp(group, *sl) == 0) {
>> -                module_load_one("", modinfo->name);
>> +                Error *local_err = NULL;
>> +                if (!module_load_one("", modinfo->name, &local_err)
>> +                    && local_err) {
>> +                    error_report_err(local_err);
>> +                }
>>               }
>>           }
>>       }
> 
> For this module_load_qom_all() maybe Gerd has a bit more context on was should be the error reporting here?
> 
> Thanks,
> 
> Claudio
> 
>> @@ -378,7 +447,7 @@ void qemu_load_module_for_opts(const char *group)
>>   
>>   void module_allow_arch(const char *arch) {}
>>   void qemu_load_module_for_opts(const char *group) {}
>> -void module_load_qom_one(const char *type) {}
>> +bool module_load_qom_one(const char *type, Error **errp) { return true; }
>>   void module_load_qom_all(void) {}
>>   
>>   #endif
> 
> 


