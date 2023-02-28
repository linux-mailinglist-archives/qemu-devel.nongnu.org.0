Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C26A5AA9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0jf-0004WT-FQ; Tue, 28 Feb 2023 09:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX0jc-0004Vz-LU
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX0ja-00016E-Du
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677593617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK+izncuPg2NlsX0tc4dtGihbGMPeIEas9LFW1gB0CM=;
 b=D0uyFGEcDyFRVlRcs+153E5hj6/5cNAMJ6BHmH0gaPmBHVPNvbI2Qzyl4q0smcg+RT1u7K
 PT0w9TsyX0oIr7dJecl4vzC85jcGx6Lx52eHsgxn7wrvI9hT8vJKiNEoguMr7feAI6xPwK
 oFHOsWMTO7Jybo2Hxbjgtb96qJxudnE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-qV_zTuftM06ZwWFLLqjEmA-1; Tue, 28 Feb 2023 09:13:35 -0500
X-MC-Unique: qV_zTuftM06ZwWFLLqjEmA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so4324226wmr.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677593614;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nK+izncuPg2NlsX0tc4dtGihbGMPeIEas9LFW1gB0CM=;
 b=2u+BKiHfoGimkEgxAYQLuKEHsSfjxyQhTs0V2BxUlmibity9McalnybcVZpEhFo+gn
 VZPjPQFCX4hkB7yFH116Rthh+05Yo/x4MXInlLhbgu6Zu3eZNLUslnjDrW4D7fnCZm/S
 TxC3B6/EDl/m1mSXJYxh6SPHow5aPTOcBfPMZi9bKHEL09tTLiGgN6t1Deb7AcHUmLIy
 nz7SwJFdasWGtrzKRjg4oXB2Vvug1BGu6A4Q9W/r4+U0hudvoETaQUS+b7wN1u3O21iN
 gD0hO9HgnFOL7kG992MY/ed8Y/Zw/biz/jDeQAFqqkk+BuZg5OIo03g2XJEc1NwHHLjl
 KlMw==
X-Gm-Message-State: AO0yUKVcVo7BfpBkTN5yL8HT9+adzemcKJySkcmnG+9Lc429Yd64M2Ah
 94HTIzGi73SrgvICYMbS1TgxwUXrKImnzXNm2KoHc5NDOXmc9VqEnUYKb87uTEc8OHkbZPeKf8u
 US58fCH15yGAqJhs=
X-Received: by 2002:adf:d84f:0:b0:2c7:1e16:57cf with SMTP id
 k15-20020adfd84f000000b002c71e1657cfmr2073527wrl.67.1677593614620; 
 Tue, 28 Feb 2023 06:13:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9WzEoNgM0xc1azcgIayivTalHgGgDoOHBxC5EdP87yeTuWKdZnZkco/MeYqlEckpobh1kP9g==
X-Received: by 2002:adf:d84f:0:b0:2c7:1e16:57cf with SMTP id
 k15-20020adfd84f000000b002c71e1657cfmr2073509wrl.67.1677593614314; 
 Tue, 28 Feb 2023 06:13:34 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe892000000b002c707b336c9sm9944697wrm.36.2023.02.28.06.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 06:13:33 -0800 (PST)
Date: Tue, 28 Feb 2023 09:13:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, arei.gonglei@huawei.com,
 dgilbert@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 11/12] cryptodev: Support query-stats QMP command
Message-ID: <20230228091303-mutt-send-email-mst@kernel.org>
References: <20230129025747.682282-1-pizhenwei@bytedance.com>
 <20230129025747.682282-12-pizhenwei@bytedance.com>
 <20230228075511-mutt-send-email-mst@kernel.org>
 <Y/3/AJqXD4aDdtrP@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3/AJqXD4aDdtrP@redhat.com>
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

On Tue, Feb 28, 2023 at 01:17:52PM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 07:56:14AM -0500, Michael S. Tsirkin wrote:
> > On Sun, Jan 29, 2023 at 10:57:46AM +0800, zhenwei pi wrote:
> > > Now we can use "query-stats" QMP command to query statistics of
> > > crypto devices. (Originally this was designed to show statistics
> > > by '{"execute": "query-cryptodev"}'. Daniel Berrangé suggested that
> > > querying configuration info by "query-cryptodev", and querying
> > > runtime performance info by "query-stats". This makes sense!)
> > > 
> > > Example:
> > > ~# virsh qemu-monitor-command vm '{"execute": "query-stats", \
> > >    "arguments": {"target": "cryptodev"} }' | jq
> > > {
> > >   "return": [
> > >     {
> > >       "provider": "cryptodev",
> > >       "stats": [
> > >         {
> > >           "name": "asym-verify-bytes",
> > >           "value": 7680
> > >         },
> > >         ...
> > >         {
> > >           "name": "asym-decrypt-ops",
> > >           "value": 32
> > >         },
> > >         {
> > >           "name": "asym-encrypt-ops",
> > >           "value": 48
> > >         }
> > >       ],
> > >       "qom-path": "/objects/cryptodev0" # support asym only
> > >     },
> > >     {
> > >       "provider": "cryptodev",
> > >       "stats": [
> > >         {
> > >           "name": "asym-verify-bytes",
> > >           "value": 0
> > >         },
> > >         ...
> > >         {
> > >           "name": "sym-decrypt-bytes",
> > >           "value": 5376
> > >         },
> > >         ...
> > >       ],
> > >       "qom-path": "/objects/cryptodev1" # support asym/sym
> > >     }
> > >   ],
> > >   "id": "libvirt-422"
> > > }
> > > 
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > 
> > I assume since this has been out a long time and no
> > comments by maintainers it's ok from QAPI POV.
> 
> I'm not the QAPI maintainer, but I think this worked out
> pretty nicely compared to the previous versions of the
> series which didn't use query-stats.. just a minor point
> below.

Hmm applied already ... is this ok to fix with patch on top
or do I have to revert?


> > 
> > > ---
> > >  backends/cryptodev.c | 141 +++++++++++++++++++++++++++++++++++++++++++
> > >  monitor/hmp-cmds.c   |   5 ++
> > >  monitor/qmp-cmds.c   |   2 +
> > >  qapi/stats.json      |  10 ++-
> > >  4 files changed, 156 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> > > index 09ffdd345f..9d52220772 100644
> > > --- a/backends/cryptodev.c
> > > +++ b/backends/cryptodev.c
> > > @@ -22,9 +22,11 @@
> > >   */
> > >  
> > >  #include "qemu/osdep.h"
> > > +#include "monitor/stats.h"
> > >  #include "sysemu/cryptodev.h"
> > >  #include "qapi/error.h"
> > >  #include "qapi/qapi-commands-cryptodev.h"
> > > +#include "qapi/qapi-types-stats.h"
> > >  #include "qapi/visitor.h"
> > >  #include "qemu/config-file.h"
> > >  #include "qemu/error-report.h"
> > > @@ -32,6 +34,14 @@
> > >  #include "qom/object_interfaces.h"
> > >  #include "hw/virtio/virtio-crypto.h"
> > >  
> > > +typedef struct StatsArgs {
> > > +    union StatsResultsType {
> > > +        StatsResultList **stats;
> > > +        StatsSchemaList **schema;
> > > +    } result;
> > > +    strList *names;
> > > +    Error **errp;
> > > +} StatsArgs;
> > >  
> > >  static QTAILQ_HEAD(, CryptoDevBackendClient) crypto_clients;
> > >  
> > > @@ -435,6 +445,134 @@ static void cryptodev_backend_finalize(Object *obj)
> > >      }
> > >  }
> > >  
> > > +static StatsList *cryptodev_backend_stats_add(const char *name, int64_t *val,
> > > +                                              StatsList *stats_list)
> > > +{
> > > +    Stats *stats = g_new0(Stats, 1);
> > > +
> > > +    stats->name = g_strdup(name);
> > > +    stats->value = g_new0(StatsValue, 1);
> > > +    stats->value->type = QTYPE_QNUM;
> > > +    stats->value->u.scalar = *val;
> > > +
> > > +    QAPI_LIST_PREPEND(stats_list, stats);
> > > +    return stats_list;
> > > +}
> > > +
> > > +static int cryptodev_backend_stats_query(Object *obj, void *data)
> > > +{
> > > +    StatsArgs *stats_args = data;
> > > +    StatsResultList **stats_results = stats_args->result.stats;
> > > +    StatsList *stats_list = NULL;
> > > +    StatsResult *entry;
> > > +    CryptoDevBackend *backend;
> > > +    QCryptodevBackendSymStat *sym_stat;
> > > +    QCryptodevBackendAsymStat *asym_stat;
> > > +
> > > +    if (!object_dynamic_cast(obj, TYPE_CRYPTODEV_BACKEND)) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    backend = CRYPTODEV_BACKEND(obj);
> > > +    sym_stat = backend->sym_stat;
> > > +    if (sym_stat) {
> > > +        stats_list = cryptodev_backend_stats_add("sym-encrypt-ops",
> > > +                         &sym_stat->encrypt_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("sym-decrypt-ops",
> > > +                         &sym_stat->decrypt_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("sym-encrypt-bytes",
> > > +                         &sym_stat->encrypt_bytes, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("sym-decrypt-bytes",
> > > +                         &sym_stat->decrypt_bytes, stats_list);
> > > +    }
> > > +
> > > +    asym_stat = backend->asym_stat;
> > > +    if (asym_stat) {
> > > +        stats_list = cryptodev_backend_stats_add("asym-encrypt-ops",
> > > +                         &asym_stat->encrypt_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-decrypt-ops",
> > > +                         &asym_stat->decrypt_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-sign-ops",
> > > +                         &asym_stat->sign_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-verify-ops",
> > > +                         &asym_stat->verify_ops, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-encrypt-bytes",
> > > +                         &asym_stat->encrypt_bytes, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-decrypt-bytes",
> > > +                         &asym_stat->decrypt_bytes, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-sign-bytes",
> > > +                         &asym_stat->sign_bytes, stats_list);
> > > +        stats_list = cryptodev_backend_stats_add("asym-verify-bytes",
> > > +                         &asym_stat->verify_bytes, stats_list);
> 
> Perhaps there's benefit in having constants defined for these strings,
> since they become part of our API, and the same strings are repeated
> again further down.....
> 
> > > +    }
> > > +
> > > +    entry = g_new0(StatsResult, 1);
> > > +    entry->provider = STATS_PROVIDER_CRYPTODEV;
> > > +    entry->qom_path = g_strdup(object_get_canonical_path(obj));
> > > +    entry->stats = stats_list;
> > > +    QAPI_LIST_PREPEND(*stats_results, entry);
> > > +
> > > +    return 0;
> > > +}
> 
> ...snip...
> 
> > > +
> > > +static void cryptodev_backend_schemas_cb(StatsSchemaList **result,
> > > +                                         Error **errp)
> > > +{
> > > +    StatsSchemaValueList *stats_list = NULL;
> > > +    const char *sym_stats[] = {"sym-encrypt-ops", "sym-decrypt-ops",
> > > +                               "sym-encrypt-bytes", "sym-decrypt-bytes"};
> > > +    const char *asym_stats[] = {"asym-encrypt-ops", "asym-decrypt-ops",
> > > +                                "asym-sign-ops", "asym-verify-ops",
> > > +                                "asym-encrypt-bytes", "asym-decrypt-bytes",
> > > +                                "asym-sign-bytes", "asym-verify-bytes"};
> 
> ... here's the repeated use of the constant strings from earlier
> 
> > > +
> > > +    for (int i = 0; i < ARRAY_SIZE(sym_stats); i++) {
> > > +        stats_list = cryptodev_backend_schemas_add(sym_stats[i], stats_list);
> > > +    }
> > > +
> > > +    for (int i = 0; i < ARRAY_SIZE(asym_stats); i++) {
> > > +        stats_list = cryptodev_backend_schemas_add(asym_stats[i], stats_list);
> > > +    }
> > > +
> > > +    add_stats_schema(result, STATS_PROVIDER_CRYPTODEV, STATS_TARGET_CRYPTODEV,
> > > +                     stats_list);
> > > +}
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


