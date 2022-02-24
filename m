Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71044C319C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:38:51 +0100 (CET)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNH8k-0004Q8-PV
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6h-0002WN-Rl
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNH6f-0008QO-Cd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645720595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vs2h69F5DrYRY591B1w0MixGYcQcgOISaqpanCnFT0w=;
 b=H+839ilS/hoGXExYg0L7HW68aompGPBdJsqAGl71x6Hrbg0wj/rzA5P5N86M13Hvicf8Gz
 pc0/4rjMa7OHNW/vxRFVm8yIAEWta86fgrax2hnffMsJXlEg2sHSYQigYDsh8E1VcsuSml
 OWaDa+VEKLDAZOrRWkLcrbdFed7+klw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-kL7QIpw_PcKdxzffe9bJ8Q-1; Thu, 24 Feb 2022 11:36:34 -0500
X-MC-Unique: kL7QIpw_PcKdxzffe9bJ8Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 g15-20020adfbc8f000000b001e9506e27ddso97013wrh.22
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 08:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vs2h69F5DrYRY591B1w0MixGYcQcgOISaqpanCnFT0w=;
 b=YX+dKtebs8CcfFPC6hYUKkBIpHPEB+WchFizZBW3Nxo2A368odlWh0Ib1jY7Q/OzT0
 f5X7zDuYvouxEmM6vGh1ptKA0T1FGFRy0XOQweplFkcbeNjP77DfkXA0bZxYvRi1QBDH
 Ch60cT4LPt+iVWgrp801sQG2tmzss4x4pT6PNOfIWcdYRwbDc7yyf/SBgVoKzfyf3LWr
 jX+JsCeHb92+NTB8vCAdnQk/plsO8BbnChLYb08EKcTkLdS5TORZjidjYBnX54h5w8pG
 cRB9fr4GkplffIvwktMrd55RVmRpkLiw1krd5cymXZYTnEukAwjGe4rwawu02jQRuSrU
 A/aw==
X-Gm-Message-State: AOAM531OnBfdGYSvpHagNPCCTq6ImyEDU1IWz9RIxL9ivMl4nQSAXAEe
 EaC1KWrsL+o0DzkZ2RVeHImHRagTvBWuOtfrzM2IjKT21AXhdBYLXCxPl2HMuysZCPCAY5psjON
 rK/3OOtVetBwqMxc=
X-Received: by 2002:a1c:4b17:0:b0:380:e44f:426e with SMTP id
 y23-20020a1c4b17000000b00380e44f426emr8921229wma.150.1645720593224; 
 Thu, 24 Feb 2022 08:36:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2mW1xwuDgHGdl0CnGY+c08Vg7MkxUF4Oypfvn37tCKiSaP5ST5JSxjLdanv6jBvTzUncNXQ==
X-Received: by 2002:a1c:4b17:0:b0:380:e44f:426e with SMTP id
 y23-20020a1c4b17000000b00380e44f426emr8921197wma.150.1645720592892; 
 Thu, 24 Feb 2022 08:36:32 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id b15sm3729527wri.96.2022.02.24.08.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:36:32 -0800 (PST)
Message-ID: <481fa9b7-ad02-5fc0-94f4-f2a059584213@redhat.com>
Date: Thu, 24 Feb 2022 17:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/4] hw: hyperv: Initial commit for Synthetic Debugging
 device
To: Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-5-arilou@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220216102500.692781-5-arilou@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 16/02/2022 11:25, Jon Doron wrote:
> Signed-off-by: Jon Doron <arilou@gmail.com>
> ---
>  hw/hyperv/Kconfig     |   5 +
>  hw/hyperv/meson.build |   1 +
>  hw/hyperv/syndbg.c    | 402 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 408 insertions(+)
>  create mode 100644 hw/hyperv/syndbg.c
> 
> diff --git a/hw/hyperv/Kconfig b/hw/hyperv/Kconfig
> index 3fbfe41c9e..fcf65903bd 100644
> --- a/hw/hyperv/Kconfig
> +++ b/hw/hyperv/Kconfig
> @@ -11,3 +11,8 @@ config VMBUS
>      bool
>      default y
>      depends on HYPERV
> +
> +config SYNDBG
> +    bool
> +    default y
> +    depends on VMBUS
> diff --git a/hw/hyperv/meson.build b/hw/hyperv/meson.build
> index 1367e2994f..b43f119ea5 100644
> --- a/hw/hyperv/meson.build
> +++ b/hw/hyperv/meson.build
> @@ -1,3 +1,4 @@
>  specific_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'))
>  specific_ss.add(when: 'CONFIG_HYPERV_TESTDEV', if_true: files('hyperv_testdev.c'))
>  specific_ss.add(when: 'CONFIG_VMBUS', if_true: files('vmbus.c'))
> +specific_ss.add(when: 'CONFIG_SYNDBG', if_true: files('syndbg.c'))
> diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
> new file mode 100644
> index 0000000000..8816bc4082
> --- /dev/null
> +++ b/hw/hyperv/syndbg.c
> @@ -0,0 +1,402 @@
> +/*
> + * QEMU Hyper-V Synthetic Debugging device
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/ctype.h"
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/sockets.h"
> +#include "qemu-common.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/loader.h"
> +#include "cpu.h"
> +#include "hw/hyperv/hyperv.h"
> +#include "hw/hyperv/vmbus-bridge.h"
> +#include "hw/hyperv/hyperv-proto.h"
> +#include "net/net.h"
> +#include "net/eth.h"
> +#include "net/checksum.h"
> +#include "trace.h"
> +
> +#define TYPE_HV_SYNDBG       "hv-syndbg"
> +
> +typedef struct HvSynDbg {
> +    DeviceState parent_obj;
> +
> +    char *host_ip;
> +    uint16_t host_port;
> +    bool use_hcalls;
> +
> +    uint32_t target_ip;
> +    struct sockaddr_in servaddr;
> +    int socket;
> +    bool has_data_pending;
> +    uint64_t pending_page_gpa;
> +} HvSynDbg;
> +
> +#define HVSYNDBG(obj) OBJECT_CHECK(HvSynDbg, (obj), TYPE_HV_SYNDBG)
> +
> +/* returns NULL unless there is exactly one HV Synth debug device */
> +static HvSynDbg *hv_syndbg_find(void)
> +{
> +    /* Returns NULL unless there is exactly one hvsd device */
> +    return HVSYNDBG(object_resolve_path_type("", TYPE_HV_SYNDBG, NULL));
> +}
> +
> +static void set_pending_state(HvSynDbg *syndbg, bool has_pending)
> +{
> +    hwaddr out_len;
> +    void *out_data;
> +
> +    syndbg->has_data_pending = has_pending;
> +
> +    if (!syndbg->pending_page_gpa) {
> +        return;
> +    }
> +
> +    out_len = 1;
> +    out_data = cpu_physical_memory_map(syndbg->pending_page_gpa, &out_len, 1);
> +    if (out_data) {
> +        *(uint8_t *)out_data = !!has_pending;
> +        cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
> +    }
> +}
> +
> +static bool get_udb_pkt_data(void *p, uint32_t len, uint32_t *data_ofs,
> +                             uint32_t *src_ip)
> +{
> +    uint32_t offset, curr_len = len;
> +
> +    if (curr_len < sizeof(struct eth_header) ||
> +        (be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto) != ETH_P_IP)) {
> +        return false;
> +    }
> +    offset = sizeof(struct eth_header);
> +    curr_len -= sizeof(struct eth_header);
> +
> +    if (curr_len < sizeof(struct ip_header) ||
> +        PKT_GET_IP_HDR(p)->ip_p != IP_PROTO_UDP) {
> +        return false;
> +    }
> +    offset += PKT_GET_IP_HDR_LEN(p);
> +    curr_len -= PKT_GET_IP_HDR_LEN(p);
> +
> +    if (curr_len < sizeof(struct udp_header)) {
> +        return false;
> +    }
> +
> +    offset += sizeof(struct udp_header);
> +    *data_ofs = offset;
> +    *src_ip = PKT_GET_IP_HDR(p)->ip_src;
> +    return true;
> +}
> +
> +static uint16_t handle_send_msg(HvSynDbg *syndbg, uint64_t ingpa,
> +                                uint32_t count, bool is_raw,
> +                                uint32_t *pending_count)
> +{
> +    uint16_t ret;
> +    hwaddr data_len;
> +    void *debug_data = NULL;
> +    uint32_t udp_data_ofs = 0;
> +    const void *pkt_data;
> +    int sent_count;
> +
> +    data_len = count;
> +    debug_data = cpu_physical_memory_map(ingpa, &data_len, 0);
> +    if (!debug_data || data_len < count) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    if (is_raw &&
> +        !get_udb_pkt_data(debug_data, count, &udp_data_ofs,
> +                          &syndbg->target_ip)) {
> +        ret = HV_STATUS_SUCCESS;
> +        goto cleanup;
> +    }
> +
> +    pkt_data = (const void *)((uintptr_t)debug_data + udp_data_ofs);
> +    sent_count = qemu_sendto(syndbg->socket, pkt_data, count - udp_data_ofs,
> +                             MSG_NOSIGNAL, NULL, 0);
> +    if (sent_count == -1) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup;
> +    }
> +
> +    *pending_count = count - (sent_count + udp_data_ofs);
> +    ret = HV_STATUS_SUCCESS;
> +cleanup:
> +    if (debug_data) {
> +        cpu_physical_memory_unmap(debug_data, count, 0, data_len);
> +    }
> +
> +    return ret;
> +}
> +
> +#define UDP_PKT_HEADER_SIZE \
> +    (sizeof(struct eth_header) + sizeof(struct ip_header) +\
> +     sizeof(struct udp_header))
> +
> +static bool create_udp_pkt(HvSynDbg *syndbg, void *pkt, uint32_t pkt_len,
> +                           void *udp_data, uint32_t udp_data_len)
> +{
> +    struct udp_header *udp_part;
> +
> +    if (pkt_len < (UDP_PKT_HEADER_SIZE + udp_data_len)) {
> +        return false;
> +    }
> +
> +    /* Setup the eth */
> +    memset(&PKT_GET_ETH_HDR(pkt)->h_source, 0, ETH_ALEN);
> +    memset(&PKT_GET_ETH_HDR(pkt)->h_dest, 0, ETH_ALEN);
> +    PKT_GET_ETH_HDR(pkt)->h_proto = cpu_to_be16(ETH_P_IP);
> +
> +    /* Setup the ip */
> +    PKT_GET_IP_HDR(pkt)->ip_ver_len =
> +        (4 << 4) | (sizeof(struct ip_header) >> 2);
> +    PKT_GET_IP_HDR(pkt)->ip_tos = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_id = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_off = 0;
> +    PKT_GET_IP_HDR(pkt)->ip_ttl = 64; /* IPDEFTTL */
> +    PKT_GET_IP_HDR(pkt)->ip_p = IP_PROTO_UDP;
> +    PKT_GET_IP_HDR(pkt)->ip_src = syndbg->servaddr.sin_addr.s_addr;
> +    PKT_GET_IP_HDR(pkt)->ip_dst = syndbg->target_ip;
> +    PKT_GET_IP_HDR(pkt)->ip_len =
> +        cpu_to_be16(sizeof(struct ip_header) + sizeof(struct udp_header) +
> +                    udp_data_len);
> +    eth_fix_ip4_checksum(PKT_GET_IP_HDR(pkt), PKT_GET_IP_HDR_LEN(pkt));
> +
> +    udp_part = (struct udp_header *)((uintptr_t)pkt +
> +                                     sizeof(struct eth_header) +
> +                                     PKT_GET_IP_HDR_LEN(pkt));
> +    udp_part->uh_sport = syndbg->servaddr.sin_port;
> +    udp_part->uh_dport = syndbg->servaddr.sin_port;
> +    udp_part->uh_ulen = cpu_to_be16(sizeof(struct udp_header) + udp_data_len);
> +    memcpy(udp_part + 1, udp_data, udp_data_len);
> +    net_checksum_calculate(pkt, UDP_PKT_HEADER_SIZE + udp_data_len, CSUM_ALL);
> +    return true;
> +}
> +
> +static uint16_t handle_recv_msg(HvSynDbg *syndbg, uint64_t outgpa,
> +                                uint32_t count, bool is_raw, uint32_t options,
> +                                uint64_t timeout, uint32_t *retrieved_count)
> +{
> +    uint16_t ret;
> +    uint8_t data_buf[TARGET_PAGE_SIZE - UDP_PKT_HEADER_SIZE];
> +    hwaddr out_len;
> +    void *out_data;
> +    ssize_t recv_byte_count;
> +
> +    /* TODO: Handle options and timeout */
> +    (void)options;
> +    (void)timeout;
> +
> +    if (!syndbg->has_data_pending) {
> +        recv_byte_count = 0;
> +    } else {
> +        recv_byte_count = qemu_recv(syndbg->socket, data_buf,
> +                                    MIN(sizeof(data_buf), count), MSG_WAITALL);
> +        if (recv_byte_count == -1) {
> +            return HV_STATUS_INVALID_PARAMETER;
> +        }
> +    }
> +
> +    if (!recv_byte_count) {
> +        *retrieved_count = 0;
> +        return HV_STATUS_NO_DATA;
> +    }
> +
> +    set_pending_state(syndbg, false);
> +
> +    out_len = recv_byte_count;
> +    if (is_raw) {
> +        out_len += UDP_PKT_HEADER_SIZE;
> +    }
> +    out_data = cpu_physical_memory_map(outgpa, &out_len, 1);
> +    if (!out_data) {
> +        return HV_STATUS_INSUFFICIENT_MEMORY;
> +    }
> +
> +    if (is_raw &&
> +        !create_udp_pkt(syndbg, out_data,
> +                        recv_byte_count + UDP_PKT_HEADER_SIZE,
> +                        data_buf, recv_byte_count)) {
> +        ret = HV_STATUS_INSUFFICIENT_MEMORY;
> +        goto cleanup_out_data;
> +    } else if (!is_raw) {
> +        memcpy(out_data, data_buf, recv_byte_count);
> +    }
> +
> +    *retrieved_count = recv_byte_count;
> +    if (is_raw) {
> +        *retrieved_count += UDP_PKT_HEADER_SIZE;
> +    }
> +    ret = HV_STATUS_SUCCESS;
> +
> +cleanup_out_data:
> +    cpu_physical_memory_unmap(out_data, out_len, 1, out_len);
> +    return ret;
> +}
> +
> +static uint16_t hv_syndbg_handler(void *context, HvSynDbgMsg *msg)
> +{
> +    HvSynDbg *syndbg = context;
> +    uint16_t ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> +
> +    switch (msg->type) {
> +    case HV_SYNDBG_MSG_CONNECTION_INFO:
> +        msg->u.connection_info.host_ip =
> +            ntohl(syndbg->servaddr.sin_addr.s_addr);
> +        msg->u.connection_info.host_port =
> +            ntohs(syndbg->servaddr.sin_port);
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    case HV_SYNDBG_MSG_SEND:
> +        ret = handle_send_msg(syndbg, msg->u.send.buf_gpa, msg->u.send.count,
> +                              msg->u.send.is_raw, &msg->u.send.pending_count);
> +        break;
> +    case HV_SYNDBG_MSG_RECV:
> +        ret = handle_recv_msg(syndbg, msg->u.recv.buf_gpa, msg->u.recv.count,
> +                              msg->u.recv.is_raw, msg->u.recv.options,
> +                              msg->u.recv.timeout,
> +                              &msg->u.recv.retrieved_count);
> +        break;
> +    case HV_SYNDBG_MSG_SET_PENDING_PAGE:
> +        syndbg->pending_page_gpa = msg->u.pending_page.buf_gpa;
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    case HV_SYNDBG_MSG_QUERY_OPTIONS:
> +        msg->u.query_options.options = 0;
> +        if (syndbg->use_hcalls) {
> +            msg->u.query_options.options = HV_X64_SYNDBG_OPTION_USE_HCALLS;
> +        }
> +        ret = HV_STATUS_SUCCESS;
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void hv_syndbg_recv_event(void *opaque)
> +{
> +    HvSynDbg *syndbg = opaque;
> +    struct timeval tv;
> +    fd_set rfds;
> +
> +    tv.tv_sec = 0;
> +    tv.tv_usec = 0;
> +    FD_ZERO(&rfds);
> +    FD_SET(syndbg->socket, &rfds);
> +    if (select(syndbg->socket + 1, &rfds, NULL, NULL, &tv) > 0) {
> +        set_pending_state(syndbg, true);
> +    }
> +}
> +
> +static void hv_syndbg_realize(DeviceState *dev, Error **errp)
> +{
> +    HvSynDbg *syndbg = HVSYNDBG(dev);
> +
> +    if (!hv_syndbg_find()) {
> +        error_setg(errp, "at most one %s device is permitted", TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    if (!vmbus_bridge_find()) {
> +        error_setg(errp, "%s device requires vmbus-bridge device",
> +                   TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    /* Parse and host_ip */
> +    if (qemu_isdigit(syndbg->host_ip[0])) {
> +        syndbg->servaddr.sin_addr.s_addr = inet_addr(syndbg->host_ip);
> +    } else {
> +        struct hostent *he = gethostbyname(syndbg->host_ip);
> +        if (!he) {
> +            error_setg(errp, "%s failed to resolve host name %s",
> +                       TYPE_HV_SYNDBG, syndbg->host_ip);
> +            return;
> +        }
> +        syndbg->servaddr.sin_addr = *(struct in_addr *)he->h_addr;
> +    }
> +
> +    syndbg->socket = socket(AF_INET, SOCK_DGRAM, 0);
> +    if (syndbg->socket < 0) {
> +        error_setg(errp, "%s failed to create socket", TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    qemu_set_nonblock(syndbg->socket);
> +
> +    syndbg->servaddr.sin_port = htons(syndbg->host_port);
> +    syndbg->servaddr.sin_family = AF_INET;
> +    if (connect(syndbg->socket, (struct sockaddr *)&syndbg->servaddr,
> +                sizeof(syndbg->servaddr)) < 0) {
> +        closesocket(syndbg->socket);
> +        error_setg(errp, "%s failed to connect to socket", TYPE_HV_SYNDBG);
> +        return;
> +    }
> +
> +    syndbg->pending_page_gpa = 0;
> +    syndbg->has_data_pending = false;
> +    hyperv_set_syndbg_handler(hv_syndbg_handler, syndbg);
> +    qemu_set_fd_handler(syndbg->socket, hv_syndbg_recv_event, NULL, syndbg);
> +}
> +
> +static void hv_syndbg_unrealize(DeviceState *dev)
> +{
> +    HvSynDbg *syndbg = HVSYNDBG(dev);
> +
> +    if (syndbg->socket > 0) {
> +        qemu_set_fd_handler(syndbg->socket, NULL, NULL, NULL);
> +        closesocket(syndbg->socket);
> +    }
> +}
> +
> +static const VMStateDescription vmstate_hv_syndbg = {
> +    .name = TYPE_HV_SYNDBG,
> +    .unmigratable = 1,
> +};
> +
> +static Property hv_syndbg_properties[] = {
> +    DEFINE_PROP_STRING("host_ip", HvSynDbg, host_ip),
> +    DEFINE_PROP_UINT16("host_port", HvSynDbg, host_port, 50000),
> +    DEFINE_PROP_BOOL("use_hcalls", HvSynDbg, use_hcalls, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void hv_syndbg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, hv_syndbg_properties);
> +    dc->fw_name = TYPE_HV_SYNDBG;
> +    dc->vmsd = &vmstate_hv_syndbg;
> +    dc->realize = hv_syndbg_realize;
> +    dc->unrealize = hv_syndbg_unrealize;
> +    dc->user_creatable = true;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo hv_syndbg_type_info = {
> +    .name = TYPE_HV_SYNDBG,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(HvSynDbg),
> +    .class_init = hv_syndbg_class_init,
> +};
> +
> +static void hv_syndbg_register_types(void)
> +{
> +    type_register_static(&hv_syndbg_type_info);
> +}
> +
> +type_init(hv_syndbg_register_types)
> 

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>


