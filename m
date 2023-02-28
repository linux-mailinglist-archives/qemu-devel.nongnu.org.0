Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39006A598E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:57:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWzXE-0005CU-S8; Tue, 28 Feb 2023 07:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWzWz-00053p-Kj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWzWw-0005xk-Kj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677588984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5UQbZMWkh6GX5wnCJ1eHx88pna6yw0F5US2KYU3bTw=;
 b=e2EBDKVKCWazIleVXb3jxJ3AR2onp8XvP7CFVtjg9h+jy6aKrZDebi9C5ISn52fE3ZX7DA
 HLWYySkyFboZ7NWC3nWNWxRA1Ry/btHo3xsDeMwHWDw0Ym2oomCyZIUoUCVfYTTA4cqD1E
 jqZQAWK2OrFVzzz4HVFT+Y57qG3GbYQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-ZOZhPPqAPR-dnAlvg6fKbg-1; Tue, 28 Feb 2023 07:56:20 -0500
X-MC-Unique: ZOZhPPqAPR-dnAlvg6fKbg-1
Received: by mail-wm1-f69.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so6850759wmj.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677588979;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g5UQbZMWkh6GX5wnCJ1eHx88pna6yw0F5US2KYU3bTw=;
 b=Rj3TRYLbRixMSLkyxKMs08nfjkxkmcBzqRTIK3pPjHnhUa+bjCkmiF5DnVuwr6PdCw
 y9KqAy4w0knsMk/xbe/FMSU9c9Si8Av6jme7nnCgihmDT+xTFjaZazhUHjLpNHMZvHl9
 +vsDlmUtI8fXxOtUxpd+2Vz6GFYcFVZktkyTGeJB4AFa3E8PAtAbbRPsrUfwbgOwrzLe
 s7MryKpxwQzELmeqYBzTJGNxnKXF6r0z/Z+n3bDaGqfA7c7prorbpBhJ4+KL4LzMdpBJ
 k0xRwofW3zHmlbZP47ACawEFZpIliUajk2pwX/kbb8qgOU4jmRtcco5F5J1AJasHLyzf
 U6Tw==
X-Gm-Message-State: AO0yUKWjnxf2MfAD+BQGCF5Mk2BuJiQ79GeTdzELdJtJGRo0Hfj4LUZs
 1g4Sl1Rfr7vX4qGlKIgHPlrzawc4nfi0u8vartpUBaCCuDT93sP8gVvxW2mPQLVBGdPj4Vqjh7o
 isaaZC3dt4lbCt5Q=
X-Received: by 2002:a05:6000:694:b0:2c5:5822:96d4 with SMTP id
 bo20-20020a056000069400b002c5582296d4mr2229186wrb.30.1677588979332; 
 Tue, 28 Feb 2023 04:56:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/EVCCI/dSE8i5R1PjFM0nncbnptqe1/HMXtvrR1BRYUhGGDicz4QhFCYSgO44rhP5f6bVU/w==
X-Received: by 2002:a05:6000:694:b0:2c5:5822:96d4 with SMTP id
 bo20-20020a056000069400b002c5582296d4mr2229174wrb.30.1677588979018; 
 Tue, 28 Feb 2023 04:56:19 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c5694aef92sm9686410wrx.21.2023.02.28.04.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:56:18 -0800 (PST)
Date: Tue, 28 Feb 2023 07:56:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Message-ID: <20230228075511-mutt-send-email-mst@kernel.org>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230129025747.682282-12-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Sun, Jan 29, 2023 at 10:57:46AM +0800, zhenwei pi wrote:
> Now we can use "query-stats" QMP command to query statistics of
> crypto devices. (Originally this was designed to show statistics
> by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
> querying configuration info by "query-cryptodev", and querying
> runtime performance info by "query-stats". This makes sense!)
> 
> Example:
> ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
>    "arguments": {"target": "cryptodev"} }' | jq
> {
>   "return": [
>     {
>       "provider": "cryptodev",
>       "stats": [
>         {
>           "name": "asym-verify-bytes",
>           "value": 7680
>         },
>         ...
>         {
>           "name": "asym-decrypt-ops",
>           "value": 32
>         },
>         {
>           "name": "asym-encrypt-ops",
>           "value": 48
>         }
>       ],
>       "qom-path": "/objects/cryptodev0" # support asym only
>     },
>     {
>       "provider": "cryptodev",
>       "stats": [
>         {
>           "name": "asym-verify-bytes",
>           "value": 0
>         },
>         ...
>         {
>           "name": "sym-decrypt-bytes",
>           "value": 5376
>         },
>         ...
>       ],
>       "qom-path": "/objects/cryptodev1" # support asym/sym
>     }
>   ],
>   "id": "libvirt-422"
> }
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

I assume since this has been out a long time and no
comments by maintainers it's ok from QAPI POV.


> ---
>  backends/cryptodev.c | 141 +++++++++++++++++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c   |   5 ++
>  monitor/qmp-cmds.c   |   2 +
>  qapi/stats.json      |  10 ++-
>  4 files changed, 156 insertions(+), 2 deletions(-)
> 
> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index 09ffdd345f..9d52220772 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -22,9 +22,11 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "monitor/stats.h"
>  #include "sysemu/cryptodev.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-cryptodev.h"
> +#include "qapi/qapi-types-stats.h"
>  #include "qapi/visitor.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> @@ -32,6 +34,14 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio-crypto.h"
>  
> +typedef struct StatsArgs {
> +    union StatsResultsType {
> +        StatsResultList **stats;
> +        StatsSchemaList **schema;
> +    } result;
> +    strList *names;
> +    Error **errp;
> +} StatsArgs;
>  
>  static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
>  
> @@ -435,6 +445,134 @@ static void cryptodev_backend_finalize(Object *obj)
>      }
>  }
>  
> +static StatsList *cryptodev_backend_stats_add(const char *name, int64_t *val,
> +                                              StatsList *stats_list)
> +{
> +    Stats *stats = g_new0(Stats, 1);
> +
> +    stats->name = g_strdup(name);
> +    stats->value = g_new0(StatsValue, 1);
> +    stats->value->type = QTYPE_QNUM;
> +    stats->value->u.scalar = *val;
> +
> +    QAPI_LIST_PREPEND(stats_list, stats);
> +    return stats_list;
> +}
> +
> +static int cryptodev_backend_stats_query(Object *obj, void *data)
> +{
> +    StatsArgs *stats_args = data;
> +    StatsResultList **stats_results = stats_args->result.stats;
> +    StatsList *stats_list = NULL;
> +    StatsResult *entry;
> +    CryptoDevBackend *backend;
> +    QCryptodevBackendSymStat *sym_stat;
> +    QCryptodevBackendAsymStat *asym_stat;
> +
> +    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
> +        return 0;
> +    }
> +
> +    backend = CRYPTODEV_BACKEND(obj);
> +    sym_stat = backend->sym_stat;
> +    if (sym_stat) {
> +        stats_list = cryptodev_backend_stats_add("sym-encrypt-ops",
> +                         &sym_stat->encrypt_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("sym-decrypt-ops",
> +                         &sym_stat->decrypt_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("sym-encrypt-bytes",
> +                         &sym_stat->encrypt_bytes, stats_list);
> +        stats_list = cryptodev_backend_stats_add("sym-decrypt-bytes",
> +                         &sym_stat->decrypt_bytes, stats_list);
> +    }
> +
> +    asym_stat = backend->asym_stat;
> +    if (asym_stat) {
> +        stats_list = cryptodev_backend_stats_add("asym-encrypt-ops",
> +                         &asym_stat->encrypt_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-decrypt-ops",
> +                         &asym_stat->decrypt_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-sign-ops",
> +                         &asym_stat->sign_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-verify-ops",
> +                         &asym_stat->verify_ops, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-encrypt-bytes",
> +                         &asym_stat->encrypt_bytes, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-decrypt-bytes",
> +                         &asym_stat->decrypt_bytes, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-sign-bytes",
> +                         &asym_stat->sign_bytes, stats_list);
> +        stats_list = cryptodev_backend_stats_add("asym-verify-bytes",
> +                         &asym_stat->verify_bytes, stats_list);
> +    }
> +
> +    entry = g_new0(StatsResult, 1);
> +    entry->provider = STATS_PROVIDER_CRYPTODEV;
> +    entry->qom_path = g_strdup(object_get_canonical_path(obj));
> +    entry->stats = stats_list;
> +    QAPI_LIST_PREPEND(*stats_results, entry);
> +
> +    return 0;
> +}
> +
> +static void cryptodev_backend_stats_cb(StatsResultList **result,
> +                                       StatsTarget target,
> +                                       strList *names, strList *targets,
> +                                       Error **errp)
> +{
> +    switch (target) {
> +    case STATS_TARGET_CRYPTODEV:
> +    {
> +        Object *objs = container_get(object_get_root(), "/objects");
> +        StatsArgs stats_args;
> +        stats_args.result.stats = result;
> +        stats_args.names = names;
> +        stats_args.errp = errp;
> +
> +        object_child_foreach(objs, cryptodev_backend_stats_query, &stats_args);
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +}
> +
> +static StatsSchemaValueList *cryptodev_backend_schemas_add(const char *name,
> +                                 StatsSchemaValueList *list)
> +{
> +    StatsSchemaValueList *schema_entry = g_new0(StatsSchemaValueList, 1);
> +
> +    schema_entry->value = g_new0(StatsSchemaValue, 1);
> +    schema_entry->value->type = STATS_TYPE_CUMULATIVE;
> +    schema_entry->value->name = g_strdup(name);
> +    schema_entry->next = list;
> +
> +    return schema_entry;
> +}
> +
> +static void cryptodev_backend_schemas_cb(StatsSchemaList **result,
> +                                         Error **errp)
> +{
> +    StatsSchemaValueList *stats_list = NULL;
> +    const char *sym_stats[] = {"sym-encrypt-ops", "sym-decrypt-ops",
> +                               "sym-encrypt-bytes", "sym-decrypt-bytes"};
> +    const char *asym_stats[] = {"asym-encrypt-ops", "asym-decrypt-ops",
> +                                "asym-sign-ops", "asym-verify-ops",
> +                                "asym-encrypt-bytes", "asym-decrypt-bytes",
> +                                "asym-sign-bytes", "asym-verify-bytes"};
> +
> +    for (int i = 0; i < ARRAY_SIZE(sym_stats); i++) {
> +        stats_list = cryptodev_backend_schemas_add(sym_stats[i], stats_list);
> +    }
> +
> +    for (int i = 0; i < ARRAY_SIZE(asym_stats); i++) {
> +        stats_list = cryptodev_backend_schemas_add(asym_stats[i], stats_list);
> +    }
> +
> +    add_stats_schema(result, STATS_PROVIDER_CRYPTODEV, STATS_TARGET_CRYPTODEV,
> +                     stats_list);
> +}
> +
>  static void
>  cryptodev_backend_class_init(ObjectClass *oc, void *data)
>  {
> @@ -456,6 +594,9 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
>                                cryptodev_backend_get_ops,
>                                cryptodev_backend_set_ops,
>                                NULL, NULL);
> +
> +    add_stats_callbacks(STATS_PROVIDER_CRYPTODEV, cryptodev_backend_stats_cb,
> +                        cryptodev_backend_schemas_cb);
>  }
>  
>  static const TypeInfo cryptodev_backend_info = {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index cda52c2526..dda69a1098 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1883,6 +1883,8 @@ static StatsFilter *stats_filter(StatsTarget target, const char *names,
>          filter->u.vcpu.vcpus = vcpu_list;
>          break;
>      }
> +    case STATS_TARGET_CRYPTODEV:
> +        break;
>      default:
>          break;
>      }
> @@ -1954,6 +1956,9 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>          int cpu_index = monitor_get_cpu_index(mon);
>          filter = stats_filter(target, names, cpu_index, provider);
>          break;
> +    case STATS_TARGET_CRYPTODEV:
> +        filter = stats_filter(target, names, -1, provider);
> +        break;
>      default:
>          abort();
>      }
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index bf22a8c5a6..dd31936f6a 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -385,6 +385,8 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
>              targets = filter->u.vcpu.vcpus;
>          }
>          break;
> +    case STATS_TARGET_CRYPTODEV:
> +        break;
>      default:
>          abort();
>      }
> diff --git a/qapi/stats.json b/qapi/stats.json
> index 57db5b1c74..f9dec18066 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -50,10 +50,14 @@
>  #
>  # Enumeration of statistics providers.
>  #
> +# @kvm: since 7.1
> +#
> +# @cryptodev: since 8.0
> +#
>  # Since: 7.1
>  ##
>  { 'enum': 'StatsProvider',
> -  'data': [ 'kvm' ] }
> +  'data': [ 'kvm', 'cryptodev' ] }
>  
>  ##
>  # @StatsTarget:
> @@ -65,10 +69,12 @@
>  #
>  # @vcpu: statistics that apply to a single virtual CPU.
>  #
> +# @cryptodev: statistics that apply to a crypto device.
> +#
>  # Since: 7.1
>  ##
>  { 'enum': 'StatsTarget',
> -  'data': [ 'vm', 'vcpu' ] }
> +  'data': [ 'vm', 'vcpu', 'cryptodev' ] }
>  
>  ##
>  # @StatsRequest:
> -- 
> 2.34.1


