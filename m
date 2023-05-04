Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8066F7111
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco4-0006mH-UL; Thu, 04 May 2023 13:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puaXa-0004ml-Oo
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:06:42 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1puaXY-00039g-Mp
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:06:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64115eef620so13067164b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683212799; x=1685804799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bd0wGy7b2kMKL8aHt34nDgaIQr9gbygk/ihp3zKgYvE=;
 b=xzVpkl2u+OOq/6iFDf+Fum6G1wKEiiuab7BadptyrupcKQ5A25Vx7JW3104PaRmHAZ
 GQkJnlrNzSBskCTCjdm2Zl23KGAs07VjEudh6QXE+Z+8olLR4HtHT9SttKeOkSNq+NFr
 W7FOC2ouZfPO83oyXyidVbtDEG2iFdRb8sRfxWW3ir0+tBFOsrVa+E5Kv/Y2M9qNwlMS
 jTMJrKrHp3crevl+RSaJNufOIGpI/9BsH0HBWHY/W4vT2vFFGYbrDqCKylrTZeYb8SIo
 kfmFSvQ9MwmEjgCyx33TmccfMl9mRqVFsrMNFf4Ag7Ato7tTjoH/Pm7RbHNTc+nK9cPC
 SWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683212799; x=1685804799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bd0wGy7b2kMKL8aHt34nDgaIQr9gbygk/ihp3zKgYvE=;
 b=SiU7dJUuWydK2WkIa8zXAQP+6aeLrjF0iZJWtsJBs3OeKuR1loB5sD61tyksQMWGwy
 ifVdRs0zBVy5Rd5u88psNpzotG8jhI2hpi4qnc7hyoZqaiWVZwPpMvNw0ET1Pe3OLoog
 0MdHN5WevEXOnbrSSxX8wHxhHdVg0vzIR4mJZt2fY17Q9z47pVbn2TVnMKJrDtUfLV4U
 iaPtYQWfZ7JgCG++ZdCLSFrrA+UxmeCoQK1v0H9nTDHbkQKzxqCR43i9k3D2NsUSmYCn
 HKrKt8FQia4Cu8WCm/JNVXGgZrv1/ld5LDlZNEqUjP6xuIG/vq/MoZbViRS8Ev7Ib0+W
 ndRg==
X-Gm-Message-State: AC+VfDxakQA92gDh3nObg7HdGqMZH6qRN1bSetU8LmK5WR64knoSRDxO
 zoeyWKpcFrYybIZ4k4oPcm4xIw==
X-Google-Smtp-Source: ACHHUZ6YVvJ/fWWpNO71DveeeHwccxoXBi1d2RGMEot0PXoY2dcPkmXFKtLRX2rR+g4AAGL7pZxD3g==
X-Received: by 2002:a05:6a20:7da0:b0:f3:3ea5:5185 with SMTP id
 v32-20020a056a207da000b000f33ea55185mr2766966pzj.10.1683212799034; 
 Thu, 04 May 2023 08:06:39 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a62e717000000b005aa60d8545esm25436548pfh.61.2023.05.04.08.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 08:06:38 -0700 (PDT)
Message-ID: <5377fd3f-a4e4-0ec1-8a27-e7958ee290aa@daynix.com>
Date: Fri, 5 May 2023 00:06:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 5/5] igb: packet-split descriptors support
Content-Language: en-US
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131107eucas1p2aae525d7b23725b4efd8713e14943fb6@eucas1p2.samsung.com>
 <20230504131055.11767-6-t.dzieciol@partner.samsung.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230504131055.11767-6-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/05/04 22:10, Tomasz Dzieciol wrote:
> Packet-split descriptors are used by Linux VF driver for MTU values from 2048
> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
> ---
>   hw/net/igb_core.c   | 368 ++++++++++++++++++++++++++++++++++++++------
>   hw/net/igb_regs.h   |   8 +
>   hw/net/trace-events |   2 +-
>   3 files changed, 332 insertions(+), 46 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 8c0291665f..9c1a2fa136 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -276,6 +276,20 @@ typedef struct E1000ERingInfo {
>       int idx;
>   } E1000ERingInfo;
>   
> +static uint32_t
> +igb_rx_queue_desctyp_get(IGBCore *core, const E1000ERingInfo *r)
> +{
> +    return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
> +}
> +
> +static bool
> +igb_rx_use_ps_descriptor(IGBCore *core, const E1000ERingInfo *r)
> +{
> +    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
> +    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT ||
> +           desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
> +}
> +
>   static inline bool
>   igb_rss_enabled(IGBCore *core)
>   {
> @@ -1233,21 +1247,70 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
>   }
>   
>   static inline void
> -igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> -                      hwaddr *buff_addr)
> +igb_read_adv_rx_single_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +                                 hwaddr *buff_addr)
>   {
>       *buff_addr = le64_to_cpu(desc->read.pkt_addr);
>   }
>   
>   static inline void
> -igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
> -                  hwaddr *buff_addr)
> +igb_read_adv_rx_split_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
> +                                hwaddr *buff_addr)
>   {
> +    buff_addr[0] = le64_to_cpu(desc->read.hdr_addr);
> +    buff_addr[1] = le64_to_cpu(desc->read.pkt_addr);
> +}
> +
> +typedef struct IGBBaState {
> +    uint16_t written[IGB_MAX_PS_BUFFERS];
> +    uint8_t cur_idx;
> +} IGBBaState;

This struct derives from e1000e so you should rename the corresponding 
struct of e1000e.

> +
> +typedef struct IGBPacketRxDMAState {
> +    size_t size;
> +    size_t total_size;
> +    size_t ps_hdr_len;
> +    size_t desc_size;
> +    size_t desc_offset;
> +    uint32_t rx_desc_packet_buf_size;
> +    uint32_t rx_desc_header_buf_size;
> +    struct iovec *iov;
> +    size_t iov_ofs;
> +    bool do_ps;
> +    bool is_first;
> +    IGBBaState bastate;
> +    hwaddr ba[IGB_MAX_PS_BUFFERS];

I meant this should not be an array but instead should be defined as a 
struct as it is in the "read" member of union e1000_adv_rx_desc. It's 
defined in a way different from e1000e's extended packet split 
descriptor (union e1000_rx_desc_packet_split) and that is based on the 
differences of notations in e1000e's and igb's datasheets so I want you 
to respect that.

Also, this definition is moved from the place where it is defined at 
first in an earlier patch, but I suggest to place it here in the earlier 
patch to keep this patch concise unless there is something to prevent that.

