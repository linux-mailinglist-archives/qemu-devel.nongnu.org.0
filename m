Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1F50247D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 07:43:07 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfEja-0005B6-FL
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 01:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEfu-0004Un-P4
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nfEfr-0000X4-Mi
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 01:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650001154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk5Rwn0gj8swX8hRW1hN6jkgobxcsxVpS+VlidXsDec=;
 b=Q/qSRwdZoo/kDxt6Msv7qGqVLlzF7thnPbrZpUTLnB3gqVSvjy+0rVnAd9MZM6hgub8uT1
 TYExxPQEFzn7WjjNqDFCuvCD3WMOLZd6om/PRkjueUm0BnXdd/1z5jsmiYhxUTxRDdkBUy
 M0O4uJ+r2rDLpM9hJT2VAeJ8EyeuzGI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-LX55IyjyOAGESXNPRmUQPg-1; Fri, 15 Apr 2022 01:39:13 -0400
X-MC-Unique: LX55IyjyOAGESXNPRmUQPg-1
Received: by mail-pf1-f200.google.com with SMTP id
 i132-20020a62878a000000b0050605452ef2so4190889pfe.7
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 22:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wk5Rwn0gj8swX8hRW1hN6jkgobxcsxVpS+VlidXsDec=;
 b=pUl7RTl16edM1ynasgMaASdVJdz+TSr1GCVFlHkU+hl9dljd2igXlBoFxAEAtNUABm
 zEWpC6Us5kasXRx/a/mjCTuErFDH1kvwAbcLMo0rKUJ0HU2N+wZ05ZiBFev9r7CA+QR4
 XC4p73XCfsTrOX37DwJnT2lW/roFz0zio6kvwTlEyNFAiglZVphyNTGer9TXO0nq48Tj
 wEXyC9BlAByUgLHiHTjOvOQMhILJI3aJFyCEmT1BWJ+jGidSJb3TiamvPx1/DNxsXpf8
 JZ7diYG7gqz7g0MVGdxMOy9ORRQvRnFxIxZZdb0JMyg/jVmXThT1SuOwjc6ffgSjeAoJ
 RIcw==
X-Gm-Message-State: AOAM532yCLC4xrF1I50cI4z2QTidgrXxUSkUYKz3dPFAYrk5ClmF/oW7
 iN50RKFEPupYREYy/MXidUiYSCYElnBu7YrWwEeiA6rD4tIlueIDKbgdJB58UwOwNCPwIpotg8Y
 5cQlwbWm8HjhFgSY=
X-Received: by 2002:a17:90b:4c8a:b0:1cd:66fa:f66d with SMTP id
 my10-20020a17090b4c8a00b001cd66faf66dmr2389010pjb.71.1650001151035; 
 Thu, 14 Apr 2022 22:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhkbARXBi6C6Qyr/8mxRQQDoN6cM44l7+77GvUnJdE8ZvTnWDkvIy5R7YUSak75ed42CnhEw==
X-Received: by 2002:a17:90b:4c8a:b0:1cd:66fa:f66d with SMTP id
 my10-20020a17090b4c8a00b001cd66faf66dmr2388981pjb.71.1650001150704; 
 Thu, 14 Apr 2022 22:39:10 -0700 (PDT)
Received: from [10.72.13.51] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 kx3-20020a17090b228300b001cb7ed57660sm3510706pjb.52.2022.04.14.22.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 22:39:10 -0700 (PDT)
Message-ID: <fad596eb-63cb-c942-820b-555ec44a5579@redhat.com>
Date: Fri, 15 Apr 2022 13:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH 2/5] virtio-net: prepare for variable RSS key and indir
 table lengths
To: Maxime Coquelin <maxime.coquelin@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, andrew@daynix.com, yuri.benditovich@daynix.com,
 dgilbert@redhat.com, quintela@redhat.com
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
 <20220408122813.1357045-3-maxime.coquelin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408122813.1357045-3-maxime.coquelin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: chenbo.xia@intel.com, dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 20:28, Maxime Coquelin 写道:
> This patch is a preliminary rework to support RSS with
> Vhost-user backends. It enables supporting different types
> of hashes, key lengths and indirection table lengths.
>
> This patch does not introduces behavioral changes.
>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>   ebpf/ebpf_rss.c                |  8 ++++----
>   hw/net/virtio-net.c            | 35 +++++++++++++++++++++++++---------
>   include/hw/virtio/virtio-net.h | 16 +++++++++++++---
>   include/migration/vmstate.h    | 10 ++++++++++
>   4 files changed, 53 insertions(+), 16 deletions(-)
>
> diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> index 4a63854175..f03be5f919 100644
> --- a/ebpf/ebpf_rss.c
> +++ b/ebpf/ebpf_rss.c
> @@ -96,7 +96,7 @@ static bool ebpf_rss_set_indirections_table(struct EBPFRSSContext *ctx,
>       uint32_t i = 0;
>   
>       if (!ebpf_rss_is_loaded(ctx) || indirections_table == NULL ||
> -       len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> +       len > VIRTIO_NET_RSS_DEFAULT_TABLE_LEN) {
>           return false;
>       }
>   
> @@ -116,13 +116,13 @@ static bool ebpf_rss_set_toepliz_key(struct EBPFRSSContext *ctx,
>       uint32_t map_key = 0;
>   
>       /* prepare toeplitz key */
> -    uint8_t toe[VIRTIO_NET_RSS_MAX_KEY_SIZE] = {};
> +    uint8_t toe[VIRTIO_NET_RSS_DEFAULT_KEY_SIZE] = {};
>   
>       if (!ebpf_rss_is_loaded(ctx) || toeplitz_key == NULL ||
> -            len != VIRTIO_NET_RSS_MAX_KEY_SIZE) {
> +            len != VIRTIO_NET_RSS_DEFAULT_KEY_SIZE) {
>           return false;
>       }
> -    memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_MAX_KEY_SIZE);
> +    memcpy(toe, toeplitz_key, VIRTIO_NET_RSS_DEFAULT_KEY_SIZE);
>       *(uint32_t *)toe = ntohl(*(uint32_t *)toe);
>   
>       if (bpf_map_update_elem(ctx->map_toeplitz_key, &map_key, toe,
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 73145d6390..38436e472b 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -137,12 +137,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
>       memcpy(netcfg.mac, n->mac, ETH_ALEN);
>       virtio_stl_p(vdev, &netcfg.speed, n->net_conf.speed);
>       netcfg.duplex = n->net_conf.duplex;
> -    netcfg.rss_max_key_size = VIRTIO_NET_RSS_MAX_KEY_SIZE;
> +    netcfg.rss_max_key_size = n->rss_capa.max_key_size;
>       virtio_stw_p(vdev, &netcfg.rss_max_indirection_table_length,
> -                 virtio_host_has_feature(vdev, VIRTIO_NET_F_RSS) ?
> -                 VIRTIO_NET_RSS_MAX_TABLE_LEN : 1);
> +                 n->rss_capa.max_indirection_len);
>       virtio_stl_p(vdev, &netcfg.supported_hash_types,
> -                 VIRTIO_NET_RSS_SUPPORTED_HASHES);
> +                 n->rss_capa.supported_hashes);
>       memcpy(config, &netcfg, n->config_size);
>   
>       /*
> @@ -1202,7 +1201,7 @@ static bool virtio_net_attach_epbf_rss(VirtIONet *n)
>   
>       if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
>                             n->rss_data.indirections_table, n->rss_data.key,
> -                          VIRTIO_NET_RSS_MAX_KEY_SIZE)) {
> +                          n->rss_data.key_len)) {
>           return false;
>       }
>   
> @@ -1277,7 +1276,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>           err_value = n->rss_data.indirections_len;
>           goto error;
>       }
> -    if (n->rss_data.indirections_len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
> +    if (n->rss_data.indirections_len > n->rss_capa.max_indirection_len) {
>           err_msg = "Too large indirection table";
>           err_value = n->rss_data.indirections_len;
>           goto error;
> @@ -1323,7 +1322,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>           err_value = queue_pairs;
>           goto error;
>       }
> -    if (temp.b > VIRTIO_NET_RSS_MAX_KEY_SIZE) {
> +    if (temp.b > n->rss_capa.max_key_size) {
>           err_msg = "Invalid key size";
>           err_value = temp.b;
>           goto error;
> @@ -1339,6 +1338,14 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
>       }
>       offset += size_get;
>       size_get = temp.b;
> +    n->rss_data.key_len = temp.b;
> +    g_free(n->rss_data.key);
> +    n->rss_data.key = g_malloc(size_get);
> +    if (!n->rss_data.key) {
> +        err_msg = "Can't allocate key";
> +        err_value = n->rss_data.key_len;
> +        goto error;
> +    }
>       s = iov_to_buf(iov, iov_cnt, offset, n->rss_data.key, size_get);
>       if (s != size_get) {
>           err_msg = "Can get key buffer";
> @@ -3093,8 +3100,9 @@ static const VMStateDescription vmstate_virtio_net_rss = {
>           VMSTATE_UINT32(rss_data.hash_types, VirtIONet),
>           VMSTATE_UINT16(rss_data.indirections_len, VirtIONet),
>           VMSTATE_UINT16(rss_data.default_queue, VirtIONet),
> -        VMSTATE_UINT8_ARRAY(rss_data.key, VirtIONet,
> -                            VIRTIO_NET_RSS_MAX_KEY_SIZE),
> +        VMSTATE_VARRAY_UINT8_ALLOC(rss_data.key, VirtIONet,
> +                                   rss_data.key_len, 0,
> +                                   vmstate_info_uint8, uint8_t),


I wonder if we may break the migration compatibility here.

Thanks


>           VMSTATE_VARRAY_UINT16_ALLOC(rss_data.indirections_table, VirtIONet,
>                                       rss_data.indirections_len, 0,
>                                       vmstate_info_uint16, uint16_t),
> @@ -3523,8 +3531,16 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>       net_rx_pkt_init(&n->rx_pkt, false);
>   
>       if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
> +        n->rss_capa.max_key_size = VIRTIO_NET_RSS_DEFAULT_KEY_SIZE;
> +        n->rss_capa.max_indirection_len = VIRTIO_NET_RSS_DEFAULT_TABLE_LEN;
> +        n->rss_capa.supported_hashes = VIRTIO_NET_RSS_SUPPORTED_HASHES;
> +
>           virtio_net_load_ebpf(n);
> +    } else {
> +        n->rss_capa.max_indirection_len = 1;
>       }
> +
> +
>   }
>   
>   static void virtio_net_device_unrealize(DeviceState *dev)
> @@ -3567,6 +3583,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
>       qemu_del_nic(n->nic);
>       virtio_net_rsc_cleanup(n);
>       g_free(n->rss_data.indirections_table);
> +    g_free(n->rss_data.key);
>       net_rx_pkt_uninit(n->rx_pkt);
>       virtio_cleanup(vdev);
>   }
> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> index eb87032627..6794b354ad 100644
> --- a/include/hw/virtio/virtio-net.h
> +++ b/include/hw/virtio/virtio-net.h
> @@ -127,8 +127,16 @@ typedef struct VirtioNetRscChain {
>   /* Maximum packet size we can receive from tap device: header + 64k */
>   #define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 * KiB))
>   
> -#define VIRTIO_NET_RSS_MAX_KEY_SIZE     40
> -#define VIRTIO_NET_RSS_MAX_TABLE_LEN    128
> +typedef struct VirtioNetRssCapa {
> +    uint8_t max_key_size;
> +    uint16_t max_indirection_len;
> +    uint32_t supported_hashes;
> +} VirtioNetRssCapa;
> +
> +#define VIRTIO_NET_RSS_MIN_KEY_SIZE      40
> +#define VIRTIO_NET_RSS_DEFAULT_KEY_SIZE  40
> +#define VIRTIO_NET_RSS_MIN_TABLE_LEN     128
> +#define VIRTIO_NET_RSS_DEFAULT_TABLE_LEN 128
>   
>   typedef struct VirtioNetRssData {
>       bool    enabled;
> @@ -136,7 +144,8 @@ typedef struct VirtioNetRssData {
>       bool    redirect;
>       bool    populate_hash;
>       uint32_t hash_types;
> -    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
> +    uint8_t key_len;
> +    uint8_t *key;
>       uint16_t indirections_len;
>       uint16_t *indirections_table;
>       uint16_t default_queue;
> @@ -213,6 +222,7 @@ struct VirtIONet {
>       QDict *primary_opts;
>       bool primary_opts_from_json;
>       Notifier migration_state;
> +    VirtioNetRssCapa rss_capa;
>       VirtioNetRssData rss_data;
>       struct NetRxPkt *rx_pkt;
>       struct EBPFRSSContext ebpf_rss;
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index ad24aa1934..9398cdf803 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -448,6 +448,16 @@ extern const VMStateInfo vmstate_info_qlist;
>       .offset     = vmstate_offset_varray(_state, _field, _type),      \
>   }
>   
> +#define VMSTATE_VARRAY_UINT8_ALLOC(_field, _state, _field_num, _version, _info, _type) {\
> +    .name       = (stringify(_field)),                               \
> +    .version_id = (_version),                                        \
> +    .num_offset = vmstate_offset_value(_state, _field_num, uint8_t),\
> +    .info       = &(_info),                                          \
> +    .size       = sizeof(_type),                                     \
> +    .flags      = VMS_VARRAY_UINT8 | VMS_POINTER | VMS_ALLOC,       \
> +    .offset     = vmstate_offset_pointer(_state, _field, _type),     \
> +}
> +
>   #define VMSTATE_VSTRUCT_TEST(_field, _state, _test, _version, _vmsd, _type, _struct_version) { \
>       .name         = (stringify(_field)),                             \
>       .version_id   = (_version),                                      \


