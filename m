Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701694F1940
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:28:37 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPZD-0007wd-V3
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:28:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbPFz-0001MZ-HM
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 12:08:46 -0400
Received: from [2a00:1450:4864:20::22b] (port=34569
 helo=mail-lj1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbPFw-0003sT-5W
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 12:08:42 -0400
Received: by mail-lj1-x22b.google.com with SMTP id 17so13586992lji.1
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i6h6qJ5BpN6cdiUa8WU41EBlcHRG09+Yo1Cszk3aPh0=;
 b=ch0TQk9KY6MDPU8uJ1cidlybzWs1q5mcttq65nblHOUGgY0V17DzbO9Que87+F8ls2
 6VK1b75Ll+51ryvw8GJk5GzLzqNR7G8UMQIAKcsSNXNknyY65dcauZDp+UrTVCrU5zGv
 Q2S5lXZ34Z2smTAnrunaP7cP/M6hzr5rEch90pSsBtmP/0NSw+ae+n9F8CzQw+3Nz3LS
 Bd/quA4y5aXyMQowhlx1iEsu0Fc7gMKOcUrGKphBO3XoY7hOoWR9o2VRcxv5vyL2hcWR
 ZsixZxz2pQ2FOxBtM9UcODx1VcvgHFmg5mflmERrnFWwgxE/W1z0aojaVuLcS1QD2maw
 lXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i6h6qJ5BpN6cdiUa8WU41EBlcHRG09+Yo1Cszk3aPh0=;
 b=v62GotBMuXlUNfxVzC7+jqbC2xKT/H/k7MmlZF/d+rk+csYYqB4qpGuWjKaPxHS+Aw
 RDxkAGN2rEbXT3oBAD1QQonR5s6vOGtWWe2lxO+A6nZeCnKZcoGbQ7sdXZaZcrmNIxkN
 lDsaet16KiMxNjUa8WnGGBp53g2NRbWrHR9xRoEAQeo9wzjyZY/8hwNV+u93MUvMBd1F
 kITDnYq3wpWF12V6Ktjfhy+38Dhj6StWjKTUZuCWruHZjYXaRhsSIf6dU2512lJ1E5Np
 dJTe+BSM9SNWKQmieObky5QjFi8ROiurGTpcjnq73FMVJf2k+/WzAHBfoxMGx8IfDD93
 UEqQ==
X-Gm-Message-State: AOAM5336MNqdsoDydzxhyFDzKe8fYIssuShE5uxHsQdATbuwRs7Dc+H+
 DFLkr277wmnDZRQAunKJnJT1uA==
X-Google-Smtp-Source: ABdhPJwX2nbdiWZ9Tal5oL/ZFRZp6IaJBjwiaaKb3fDcG9Mdlf/ZxONcEUoW24hWHM39PdEKKxELCA==
X-Received: by 2002:a2e:1542:0:b0:249:a4dd:8ca5 with SMTP id
 2-20020a2e1542000000b00249a4dd8ca5mr171073ljv.303.1649088513901; 
 Mon, 04 Apr 2022 09:08:33 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a19dc19000000b0044a16b068c7sm1177289lfg.117.2022.04.04.09.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 09:08:33 -0700 (PDT)
Message-ID: <b2e9fa54-bef7-d9a0-40ad-4927648603f7@openvz.org>
Date: Mon, 4 Apr 2022 19:08:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 8/9] qom: add command to print initial properties
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-9-maxim.davydov@openvz.org>
 <20220331135515.3675892e@redhat.com>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <20220331135515.3675892e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, armbru@redhat.com,
 crosa@redhat.com, qemu-devel@nongnu.org, lizhijian@fujitsu.com,
 f4bug@amsat.org, wangyanan55@huawei.com, marcandre.lureau@redhat.com,
 chen.zhang@intel.com, jsnow@redhat.com, pbonzini@redhat.com, ani@anisinha.ca,
 den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/31/22 14:55, Igor Mammedov wrote:
> On Tue, 29 Mar 2022 00:15:38 +0300
> Maxim Davydov <maxim.davydov@openvz.org> wrote:
>
>> The command "query-init-properties" is needed to get values of properties
>> after initialization (not only default value). It makes sense, for example,
>> when working with x86_64-cpu.
>> All machine types (and x-remote-object, because its init uses machime
>> type's infrastructure) should be skipped, because only the one instance can
>> be correctly initialized.
> It might be obvious to you but I couldn't parse above commit message at all.
> Pls rephrase and explain in more detail what you are trying to achieve.
I want to dump all "default" object properties to compare it with 
compat_props of MachineState. It means that I need values from 
ObjectProperty even it doesn't have default value. For many devices it 
can give useless information. But, for example, x86_64-cpu sets "real" 
default values for specific model only during initialization. 
x86_cpu_properties[] can't give information about kvm default features.
>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   qapi/qom.json      |  69 ++++++++++++++++++++++++++
>>   qom/qom-qmp-cmds.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 190 insertions(+)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index eeb5395ff3..1eedc441eb 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -949,3 +949,72 @@
>>   ##
>>   { 'command': 'object-del', 'data': {'id': 'str'},
>>     'allow-preconfig': true }
>> +
>> +##
>> +# @InitValue:
>> +#
>> +# Not all objects have default values but they have "initial" values.
>> +#
>> +# @name: property name
>> +#
>> +# @value: Current value (default or after initialization. It makes sence,
>> +#         for example, for x86-cpus)
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'InitValue',
>> +  'data': { 'name': 'str',
>> +            '*value': 'any' } }
>> +
>> +##
>> +# @ClassProperties:
>> +#
>> +# Initial values of properties that are owned by the class
>> +#
>> +# @classname: name of the class that owns appropriate properties
>> +#
>> +# @classprops: List of class properties
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'ClassProperties',
>> +  'data': { 'classname': 'str',
>> +            '*classprops': [ 'InitValue' ] } }
>> +
>> +##
>> +# @InitProps:
>> +#
>> +# List of properties and their values that are available after class
>> +# initialization. So it important to know default value of the property
>> +# even if it doesn't have "QObject *defval"
>> +#
>> +# @name: Object name
>> +#
>> +# @props: List of properties
>> +#
>> +# Notes: a value in each property was defval if it's available
>> +#        otherwise it's obtained via "(ObjectPropertyAccessor*) get"
>> +#        immediately after initialization of device object.
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'InitProps',
>> +  'data': { 'name': 'str',
>> +            'props': [ 'ClassProperties' ] } }
>> +
>> +##
>> +# @query-init-properties:
>> +#
>> +# Returns list of all objects (except all types related with machine type)
>> +# with all properties and their "default" values that  will be available
>> +# after initialization. The main purpose of this command is to be used to
>> +# build table with all machine-type-specific properties
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'command': 'query-init-properties',
>> +  'returns': [ 'InitProps' ] }
>> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
>> index 2d6f41ecc7..c1bb3f1f8b 100644
>> --- a/qom/qom-qmp-cmds.c
>> +++ b/qom/qom-qmp-cmds.c
>> @@ -27,6 +27,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qom/object_interfaces.h"
>>   #include "qom/qom-qobject.h"
>> +#include "hw/boards.h"
>>   
>>   ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>>   {
>> @@ -235,3 +236,123 @@ void qmp_object_del(const char *id, Error **errp)
>>   {
>>       user_creatable_del(id, errp);
>>   }
>> +
>> +static void query_object_prop(InitValueList **props_list, ObjectProperty *prop,
>> +                              Object *obj, Error **errp)
>> +{
>> +    InitValue *prop_info = NULL;
>> +
>> +    /* Skip inconsiderable properties */
>> +    if (strcmp(prop->name, "type") == 0 ||
>> +        strcmp(prop->name, "realized") == 0 ||
>> +        strcmp(prop->name, "hotpluggable") == 0 ||
>> +        strcmp(prop->name, "hotplugged") == 0 ||
>> +        strcmp(prop->name, "parent_bus") == 0) {
>> +        return;
>> +    }
>> +
>> +    prop_info = g_malloc0(sizeof(*prop_info));
>> +    prop_info->name = g_strdup(prop->name);
>> +    prop_info->value = NULL;
>> +    if (prop->defval) {
>> +        prop_info->value = qobject_ref(prop->defval);
>> +    } else if (prop->get) {
>> +        /*
>> +         * crash-information in x86-cpu uses errp to return current state.
>> +         * So, after requesting this property it returns  GenericError:
>> +         * "No crash occured"
>> +         */
>> +        if (strcmp(prop->name, "crash-information") != 0) {
>> +            prop_info->value = object_property_get_qobject(obj, prop->name,
>> +                                                           errp);
>> +        }
>> +    }
>> +    prop_info->has_value = !!prop_info->value;
>> +
>> +    QAPI_LIST_PREPEND(*props_list, prop_info);
>> +}
>> +
>> +typedef struct QIPData {
>> +    InitPropsList **dev_list;
>> +    Error **errp;
>> +} QIPData;
>> +
>> +static void query_init_properties_tramp(gpointer list_data, gpointer opaque)
>> +{
>> +    ObjectClass *k = list_data;
>> +    Object *obj;
>> +    ObjectClass *parent;
>> +    GHashTableIter iter;
>> +
>> +    QIPData *data = opaque;
>> +    ClassPropertiesList *class_props_list = NULL;
>> +    InitProps *dev_info;
>> +
>> +    /* Only one machine can be initialized correctly (it's already happened) */
>> +    if (object_class_dynamic_cast(k, TYPE_MACHINE)) {
>> +        return;
>> +    }
>> +
>> +    const char *klass_name = object_class_get_name(k);
>> +    /*
>> +     * Uses machine type infrastructure with notifiers. It causes immediate
>> +     * notify and SEGSEGV during remote_object_machine_done
>> +     */
>> +    if (strcmp(klass_name, "x-remote-object") == 0) {
>> +        return;
>> +    }
>> +
>> +    dev_info = g_malloc0(sizeof(*dev_info));
>> +    dev_info->name = g_strdup(klass_name);
>> +
>> +    obj = object_new_with_class(k);
>> +
>> +    /*
>> +     * Part of ObjectPropertyIterator infrastructure, but we need more precise
>> +     * control of current class to dump appropriate features
>> +     * This part was taken out from loop because first initialization differ
>> +     * from other reinitializations
>> +     */
>> +    parent = object_get_class(obj);
>> +    g_hash_table_iter_init(&iter, obj->properties);
>> +    const char *prop_owner_name = object_get_typename(obj);
>> +    do {
>> +        InitValueList *prop_list = NULL;
>> +        ClassProperties *class_data;
>> +
>> +        gpointer key, val;
>> +        while (g_hash_table_iter_next(&iter, &key, &val)) {
>> +            query_object_prop(&prop_list, (ObjectProperty *)val, obj,
>> +                              data->errp);
>> +        }
>> +        class_data = g_malloc0(sizeof(*class_data));
>> +        class_data->classname = g_strdup(prop_owner_name);
>> +        class_data->classprops = prop_list;
>> +        class_data->has_classprops = !!prop_list;
>> +
>> +        QAPI_LIST_PREPEND(class_props_list, class_data);
>> +
>> +        if (!parent) {
>> +            break;
>> +        }
>> +        g_hash_table_iter_init(&iter, parent->properties);
>> +        prop_owner_name = object_class_get_name(parent);
>> +        parent = object_class_get_parent(parent);
>> +    } while (true);
>> +    dev_info->props = class_props_list;
>> +    object_unref(OBJECT(obj));
>> +
>> +    QAPI_LIST_PREPEND(*(data->dev_list), dev_info);
>> +}
>> +
>> +InitPropsList *qmp_query_init_properties(Error **errp)
>> +{
>> +    GSList *typename_list = object_class_get_list(TYPE_OBJECT, false);
>> +
>> +    InitPropsList *dev_list = NULL;
>> +    QIPData data = { &dev_list, errp };
>> +    g_slist_foreach(typename_list, query_init_properties_tramp, &data);
>> +    g_slist_free(typename_list);
>> +
>> +    return dev_list;
>> +}

-- 
Best regards,
Maxim Davydov


