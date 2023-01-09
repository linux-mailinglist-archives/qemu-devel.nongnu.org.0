Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81693662762
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:41:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEs2B-00063V-O2; Mon, 09 Jan 2023 08:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pEs21-00062O-4Z
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:17:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pEs1y-0004lZ-87
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:17:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1C473F1ED;
 Mon,  9 Jan 2023 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673270254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eE4WKjL763M+HQdVDPspv+9g5KDDMF7QXCnBB9d4JMw=;
 b=uCghQ+m3qDurd5iDDlaNkA2Te5dzoeZSCutwxgmqNk2G52Q7mI3g2+GSg2GuTELHNtJWix
 o8DMuWvvaYk+j5zi56RfRmuO/Dm8+Bya2wjPeTzs5fNUo+C79WExKh6xcTfR8wfbS0X047
 ltRXej+0oMS/KbzQ0b8jzeqjmhUjejM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673270254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eE4WKjL763M+HQdVDPspv+9g5KDDMF7QXCnBB9d4JMw=;
 b=xiIJV1LUiPDWBb4BOHwu0Tu3G/2BXB/gdCnuh4HAQMVgjQgkRvTsx1esq+017FIZLzPFaV
 S9nBWK1wVyaF3tDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61810134AD;
 Mon,  9 Jan 2023 13:17:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wqsmFu4TvGPwBgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 09 Jan 2023 13:17:34 +0000
Message-ID: <848b35b9-8477-e64a-0dfc-ba94674bd68f@suse.de>
Date: Mon, 9 Jan 2023 14:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH] qom: Extract object_try_new() from qdev_new()
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230109112056.94385-1-philmd@linaro.org>
 <Y7wLH3wg5YnlYx+n@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Y7wLH3wg5YnlYx+n@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 1/9/23 13:39, Daniel P. Berrangé wrote:
> On Mon, Jan 09, 2023 at 12:20:56PM +0100, Philippe Mathieu-Daudé wrote:
>> The module resolving in qdev_new() is specific to QOM, not to
>> QDev. Extract the code as a new QOM object_try_new() helper so
>> it can be reused by non-QDev code.
> 
> qdev_new() unconditionally tries loading the module, regardless
> of whether that particular device type can be built as a module.
> Not an issue, as we should only hit the error code of missing
> object type for devices which can be loadable, or in case of
> programmer error in typename. The latter shouldn't ever happen.
> 
> If we want to push this logic down into QOM, this suggests
> not introducing a new object_try_new() helper at all. Instead
> modify  'object_new' to unconditionally try to load modules.
> 
> Or even take it one step further, make 'object_class_by_name'
> try to load the module in its error path.

As far as I understand, when we want this behavior this is what we currently achieve with module_object_class_by_name().

If we are to make module_object_class_by_name() the only way to do object_class_by_name I would just recommend a lot of care and a lot of testing
given the amount of calls to object_class_by_name in the code, studying the underlying assumptions of the code in each case,

especially testing with/without loadable modules, with the modules builtin, loadable but not present, etc.

> 
> Can anyone think of other scenarios where object_class_by_name
> would be expected to fail, that aren't a case of the typename
> being a loadable module, or a programmer error ? If not, then
> modifying object_class_by_name should be ok.

Currently optional AccelCPUClass cpu interfaces can be used to extend a CPUClass with additional acceelerator-specific initializations.
In this context, object_class_by_name in accel-common.c can fail if no such extension is needed,
and since we don't have full target-specific accelerator loadable modules in QEMU, this isn't always a case of the typename being a loadable module, or a programmer error.

Thanks,

Claudio


> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC because I'm wonder if we can't find a better name...
>>
>> Also, should we refactor object_initialize() similarly,
>> having object_try_initialize(..., Error *)?
>> ---
>>  hw/core/qdev.c       | 23 ++---------------------
>>  include/qom/object.h | 12 ++++++++++++
>>  qom/object.c         | 23 +++++++++++++++++++++++
>>  3 files changed, 37 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index d759c4602c..3a076dcc7f 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -147,31 +147,12 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>>  
>>  DeviceState *qdev_new(const char *name)
>>  {
>> -    ObjectClass *oc = object_class_by_name(name);
>> -#ifdef CONFIG_MODULES
>> -    if (!oc) {
>> -        int rv = module_load_qom(name, &error_fatal);
>> -        if (rv > 0) {
>> -            oc = object_class_by_name(name);
>> -        } else {
>> -            error_report("could not find a module for type '%s'", name);
>> -            exit(1);
>> -        }
>> -    }
>> -#endif
>> -    if (!oc) {
>> -        error_report("unknown type '%s'", name);
>> -        abort();
>> -    }
>> -    return DEVICE(object_new(name));
>> +    return DEVICE(object_try_new(name, &error_fatal));
>>  }
>>  
>>  DeviceState *qdev_try_new(const char *name)
>>  {
>> -    if (!module_object_class_by_name(name)) {
>> -        return NULL;
>> -    }
>> -    return DEVICE(object_new(name));
>> +    return DEVICE(object_try_new(name, NULL));
>>  }
>>  
>>  static QTAILQ_HEAD(, DeviceListener) device_listeners
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index ef7258a5e1..9cc5bf30ec 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -565,6 +565,18 @@ Object *object_new_with_class(ObjectClass *klass);
>>   */
>>  Object *object_new(const char *typename);
>>  
>> +/**
>> + * object_try_new: Try to create an object on the heap
>> + * @name: The name of the type of the object to instantiate.
>> + * @errp: pointer to Error object.
>> + *
>> + * This is like object_new(), except it returns %NULL when type @name
>> + * does not exist, rather than asserting.
>> + *
>> + * Returns: The newly allocated and instantiated object, or %NULL.
>> + */
>> +Object *object_try_new(const char *name, Error **errp);
>> +
>>  /**
>>   * object_new_with_props:
>>   * @typename:  The name of the type of the object to instantiate.
>> diff --git a/qom/object.c b/qom/object.c
>> index e25f1e96db..6d3faaeb6e 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -755,6 +755,29 @@ Object *object_new(const char *typename)
>>  }
>>  
>>  
>> +Object *object_try_new(const char *name, Error **errp)
>> +{
>> +    TypeImpl *ti = type_get_by_name(name);
>> +
>> +    if (!ti) {
>> +#ifdef CONFIG_MODULES
>> +        int rv = module_load_qom(name, errp);
>> +        if (rv <= 0) {
>> +            error_report("could not find a module for type '%s'", name);
>> +            exit(1);
>> +        }
>> +        ti = type_get_by_name(name);
>> +#endif
>> +    }
>> +    if (!ti) {
>> +        error_setg(errp, "unknown type '%s'", name);
>> +        return NULL;
>> +    }
>> +
>> +    return object_new_with_type(ti);
>> +}
>> +
>> +
>>  Object *object_new_with_props(const char *typename,
>>                                Object *parent,
>>                                const char *id,
>> -- 
>> 2.38.1
>>
> 
> With regards,
> Daniel


