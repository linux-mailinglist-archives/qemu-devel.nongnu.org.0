Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BC54ED9B2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:35:06 +0200 (CEST)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZu13-0007Pi-UP
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:35:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtOe-0000ck-Ej
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtOb-0000Tv-Ou
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648727721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcrHCVpuOxcYmY1cH4l09yU77NyAES1Owq/klYttGqg=;
 b=XOC5H3sJ1qeaIoFlXxZa69sQXRGV4KXwXstNdVxij947Ov2Q9dcLf+qJFOtbLdZ4rOgQjX
 LQD6Y3zHRmd0Jloo++z+Y4vFgKIGFB1KtwLbceXgJwOzGAf6OdlwMN9D5/A3zPlMhWSaNW
 1jjnJz8A11liaPi9DCHMbPzenW6vrxs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-V5O3ZxOyMOGUcMeShcAMoQ-1; Thu, 31 Mar 2022 07:55:19 -0400
X-MC-Unique: V5O3ZxOyMOGUcMeShcAMoQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b71-20020a509f4d000000b00418d658e9d1so14652138edf.19
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 04:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcrHCVpuOxcYmY1cH4l09yU77NyAES1Owq/klYttGqg=;
 b=QfyeDUHqGa3g/ogRVDeC7APe0wSrsgT5IKsHfWcKpfi0IgEe/UzE2FtQx6HGmgJhcn
 TdXvn0D/Wt8C/UHJDFKtSrvuchIoxcDex7r4j5K31t96EZFw06ZiDyNqSuvD+C5AEOL1
 4psaUVMMuyc6+TfjvH239bAm7jIe3CQ/D+8kbD1WV/VDTnQ/3Sz62hF99SXTfUlQa4gt
 lqCQoHdyszgFfkRC+PHU/WYXYxjVH0Xo3TdETuiGl6Kv0imvanRSxvKxjlul3cwAolzh
 2+muuAuwbX6g1GmKkSgzXXOLiqnRlpfbMUawNZjb+uJ29tG7hnPd12/BUo0QgcTEI/nB
 v/pA==
X-Gm-Message-State: AOAM532+BzlthJK51znizhodyZGHrK7XZVFZkX6A0W0VRMsJvEursKs/
 l1/oLlmIz849FtHHuFzR3tqJTU6BA92X78x1sU0RYdx7ELaALLEit7xyMwNHOLOXHJpxCzxvqyL
 +f0IFCavc/+In8+4=
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id
 hb35-20020a170907162300b006dfc9daa6a8mr4543150ejc.303.1648727718363; 
 Thu, 31 Mar 2022 04:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFHhDzSwQkNYFV9+8yUcB6L9JgkfByRIh4KAAXdnZIP1j6C50teHMrNVCSk/HERgEw9vJ1VA==
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id
 hb35-20020a170907162300b006dfc9daa6a8mr4543127ejc.303.1648727718099; 
 Thu, 31 Mar 2022 04:55:18 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 jg22-20020a170907971600b006df9ff416ccsm9161107ejc.137.2022.03.31.04.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 04:55:17 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:55:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Maxim Davydov <maxim.davydov@openvz.org>
Subject: Re: [PATCH v1 8/9] qom: add command to print initial properties
Message-ID: <20220331135515.3675892e@redhat.com>
In-Reply-To: <20220328211539.90170-9-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-9-maxim.davydov@openvz.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, armbru@redhat.com,
 crosa@redhat.com, qemu-devel@nongnu.org, lizhijian@fujitsu.com,
 f4bug@amsat.org, wangyanan55@huawei.com, marcandre.lureau@redhat.com,
 chen.zhang@intel.com, jsnow@redhat.com, pbonzini@redhat.com, ani@anisinha.ca,
 den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 00:15:38 +0300
Maxim Davydov <maxim.davydov@openvz.org> wrote:

> The command "query-init-properties" is needed to get values of properties
> after initialization (not only default value). It makes sense, for example,
> when working with x86_64-cpu.
> All machine types (and x-remote-object, because its init uses machime
> type's infrastructure) should be skipped, because only the one instance can
> be correctly initialized.

It might be obvious to you but I couldn't parse above commit message at all.
Pls rephrase and explain in more detail what you are trying to achieve.

> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>  qapi/qom.json      |  69 ++++++++++++++++++++++++++
>  qom/qom-qmp-cmds.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 190 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..1eedc441eb 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -949,3 +949,72 @@
>  ##
>  { 'command': 'object-del', 'data': {'id': 'str'},
>    'allow-preconfig': true }
> +
> +##
> +# @InitValue:
> +#
> +# Not all objects have default values but they have "initial" values.
> +#
> +# @name: property name
> +#
> +# @value: Current value (default or after initialization. It makes sence,
> +#         for example, for x86-cpus)
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'InitValue',
> +  'data': { 'name': 'str',
> +            '*value': 'any' } }
> +
> +##
> +# @ClassProperties:
> +#
> +# Initial values of properties that are owned by the class
> +#
> +# @classname: name of the class that owns appropriate properties
> +#
> +# @classprops: List of class properties
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'ClassProperties',
> +  'data': { 'classname': 'str',
> +            '*classprops': [ 'InitValue' ] } }
> +
> +##
> +# @InitProps:
> +#
> +# List of properties and their values that are available after class
> +# initialization. So it important to know default value of the property
> +# even if it doesn't have "QObject *defval"
> +#
> +# @name: Object name
> +#
> +# @props: List of properties
> +#
> +# Notes: a value in each property was defval if it's available
> +#        otherwise it's obtained via "(ObjectPropertyAccessor*) get"
> +#        immediately after initialization of device object.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'InitProps',
> +  'data': { 'name': 'str',
> +            'props': [ 'ClassProperties' ] } }
> +
> +##
> +# @query-init-properties:
> +#
> +# Returns list of all objects (except all types related with machine type)
> +# with all properties and their "default" values that  will be available
> +# after initialization. The main purpose of this command is to be used to
> +# build table with all machine-type-specific properties
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'command': 'query-init-properties',
> +  'returns': [ 'InitProps' ] }
> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
> index 2d6f41ecc7..c1bb3f1f8b 100644
> --- a/qom/qom-qmp-cmds.c
> +++ b/qom/qom-qmp-cmds.c
> @@ -27,6 +27,7 @@
>  #include "qemu/cutils.h"
>  #include "qom/object_interfaces.h"
>  #include "qom/qom-qobject.h"
> +#include "hw/boards.h"
>  
>  ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
>  {
> @@ -235,3 +236,123 @@ void qmp_object_del(const char *id, Error **errp)
>  {
>      user_creatable_del(id, errp);
>  }
> +
> +static void query_object_prop(InitValueList **props_list, ObjectProperty *prop,
> +                              Object *obj, Error **errp)
> +{
> +    InitValue *prop_info = NULL;
> +
> +    /* Skip inconsiderable properties */
> +    if (strcmp(prop->name, "type") == 0 ||
> +        strcmp(prop->name, "realized") == 0 ||
> +        strcmp(prop->name, "hotpluggable") == 0 ||
> +        strcmp(prop->name, "hotplugged") == 0 ||
> +        strcmp(prop->name, "parent_bus") == 0) {
> +        return;
> +    }
> +
> +    prop_info = g_malloc0(sizeof(*prop_info));
> +    prop_info->name = g_strdup(prop->name);
> +    prop_info->value = NULL;
> +    if (prop->defval) {
> +        prop_info->value = qobject_ref(prop->defval);
> +    } else if (prop->get) {
> +        /*
> +         * crash-information in x86-cpu uses errp to return current state.
> +         * So, after requesting this property it returns  GenericError:
> +         * "No crash occured"
> +         */
> +        if (strcmp(prop->name, "crash-information") != 0) {
> +            prop_info->value = object_property_get_qobject(obj, prop->name,
> +                                                           errp);
> +        }
> +    }
> +    prop_info->has_value = !!prop_info->value;
> +
> +    QAPI_LIST_PREPEND(*props_list, prop_info);
> +}
> +
> +typedef struct QIPData {
> +    InitPropsList **dev_list;
> +    Error **errp;
> +} QIPData;
> +
> +static void query_init_properties_tramp(gpointer list_data, gpointer opaque)
> +{
> +    ObjectClass *k = list_data;
> +    Object *obj;
> +    ObjectClass *parent;
> +    GHashTableIter iter;
> +
> +    QIPData *data = opaque;
> +    ClassPropertiesList *class_props_list = NULL;
> +    InitProps *dev_info;
> +
> +    /* Only one machine can be initialized correctly (it's already happened) */
> +    if (object_class_dynamic_cast(k, TYPE_MACHINE)) {
> +        return;
> +    }
> +
> +    const char *klass_name = object_class_get_name(k);
> +    /*
> +     * Uses machine type infrastructure with notifiers. It causes immediate
> +     * notify and SEGSEGV during remote_object_machine_done
> +     */
> +    if (strcmp(klass_name, "x-remote-object") == 0) {
> +        return;
> +    }
> +
> +    dev_info = g_malloc0(sizeof(*dev_info));
> +    dev_info->name = g_strdup(klass_name);
> +
> +    obj = object_new_with_class(k);
> +
> +    /*
> +     * Part of ObjectPropertyIterator infrastructure, but we need more precise
> +     * control of current class to dump appropriate features
> +     * This part was taken out from loop because first initialization differ
> +     * from other reinitializations
> +     */
> +    parent = object_get_class(obj);
> +    g_hash_table_iter_init(&iter, obj->properties);
> +    const char *prop_owner_name = object_get_typename(obj);
> +    do {
> +        InitValueList *prop_list = NULL;
> +        ClassProperties *class_data;
> +
> +        gpointer key, val;
> +        while (g_hash_table_iter_next(&iter, &key, &val)) {
> +            query_object_prop(&prop_list, (ObjectProperty *)val, obj,
> +                              data->errp);
> +        }
> +        class_data = g_malloc0(sizeof(*class_data));
> +        class_data->classname = g_strdup(prop_owner_name);
> +        class_data->classprops = prop_list;
> +        class_data->has_classprops = !!prop_list;
> +
> +        QAPI_LIST_PREPEND(class_props_list, class_data);
> +
> +        if (!parent) {
> +            break;
> +        }
> +        g_hash_table_iter_init(&iter, parent->properties);
> +        prop_owner_name = object_class_get_name(parent);
> +        parent = object_class_get_parent(parent);
> +    } while (true);
> +    dev_info->props = class_props_list;
> +    object_unref(OBJECT(obj));
> +
> +    QAPI_LIST_PREPEND(*(data->dev_list), dev_info);
> +}
> +
> +InitPropsList *qmp_query_init_properties(Error **errp)
> +{
> +    GSList *typename_list = object_class_get_list(TYPE_OBJECT, false);
> +
> +    InitPropsList *dev_list = NULL;
> +    QIPData data = { &dev_list, errp };
> +    g_slist_foreach(typename_list, query_init_properties_tramp, &data);
> +    g_slist_free(typename_list);
> +
> +    return dev_list;
> +}


