Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF76D821C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:40:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5En-00064D-1I; Wed, 05 Apr 2023 11:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Ek-00063t-7z
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:39:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pk5Eh-000098-QG
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:39:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id c18so34762984ple.11
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680709186; x=1683301186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lPTAbe1F/7gOdJ7DtTW+gC7EMEMRwRjnNsDdCERprNc=;
 b=QhSXkt74MF8AO+pYVNKTmdxELDP1HC0v6QmPWovWc1K6DHnC32i7CoG69sBiW15C4e
 NtSQiXpBByGJNE0odWS227ZkoJm2Qkl5KqFwipgCBOn96fN+5haDBKRakQHEHtP2g56q
 4E1RCxnuwNeD3D+muit9ZCNqGtxzNinAHqxTxQneaBR8XfpvxdANMNSXfiGh+/KbmlFy
 +Mjno59fNlNXQvGNFBuI0tXAy8NusqmOuMZj+UdqJCdFLxNkZlJy/wFsZf3ZSWQkhgl8
 cwsbsdTmaT6qMVldyCOWaMi05E2GS/i5JNaE548MlfvuL5MnANrxkanLoupXVfgqBCls
 d4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680709186; x=1683301186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lPTAbe1F/7gOdJ7DtTW+gC7EMEMRwRjnNsDdCERprNc=;
 b=HZhaTg6BlXq62T46I5ReIz7jjkCQRDFJMpw3iVkEgisp3nIoNlHt2zw4rYfrLylqqu
 Y0bT2VREZLIcCgAd2ZkmVKpZzbVteQc4AweXXQVRFHJpfrTC8hY4Qb1RY9YM/BzyLk0Z
 wowMbKw766Lqap4/c2GYSFHgVHHNkTUb4iK6SeHEjtS97HrDVcFhuuHKyRjPArQ3p5LK
 j1cWqBH+AO3pwWoKr+LhOk4nAI79qISVh0s3xu9pHHL8Lj7VC1AsB7kUba+5FTRwNnUv
 VaGiryRWdPJUAQtRy8utBsOgr5o1KTb7g0fMkvCCM6FFM7eT1dXpAO1zt+5D4YKILYJz
 VPkg==
X-Gm-Message-State: AAQBX9eHPebg5f/gWbVfUaGbx7OXGw8XFLRmRhaYL4Fq9nXDwZ3jg5sP
 eJ8o5F8WIObtGQopQRMXEjLGng==
X-Google-Smtp-Source: AKy350bMQ7mT+gWyUDY5AZ59QJsk9bCI4++A93s03vcfnqGlKy/kS1D5KlTcvtk6cJaLoX0sitd7KQ==
X-Received: by 2002:a17:90b:1c05:b0:240:d8a:8d24 with SMTP id
 oc5-20020a17090b1c0500b002400d8a8d24mr7445860pjb.4.1680709186392; 
 Wed, 05 Apr 2023 08:39:46 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a170902761100b0019ef86c2574sm10187198pll.270.2023.04.05.08.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:39:46 -0700 (PDT)
Message-ID: <2f2c4ef2-9b52-48a4-71f1-19a354822fa2@daynix.com>
Date: Thu, 6 Apr 2023 00:39:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] igb: fix VFs traffic with IOMMU
Content-Language: en-US
To: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>, qemu-devel@nongnu.org
Cc: jasowang@redhat.com, k.kwiecien@samsung.com
References: <CGME20230405142315eucas1p119a1df91ea88687d83e734c3616834dc@eucas1p1.samsung.com>
 <20230405142306.1287-1-t.dzieciol@partner.samsung.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230405142306.1287-1-t.dzieciol@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.355, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi,

I believe this problem is already addressed with commit 
f4fdaf009cc85e95a00aba47a6b5b9df920d51c4.

Regards,
Akihiko Odaki

On 2023/04/05 23:23, Tomasz Dzieciol wrote:
> Use proper PCI device for net_tx_pkt provided to
> net_tx_pkt_add_raw_fragment.
> 
> Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
> ---
>   hw/net/igb.c      |  8 ++++++++
>   hw/net/igb_core.c | 47 +++++++++++++++++++++++++++++++++++++++++------
>   hw/net/igb_core.h |  3 +++
>   3 files changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/igb.c b/hw/net/igb.c
> index c6d753df87..a67497ff48 100644
> --- a/hw/net/igb.c
> +++ b/hw/net/igb.c
> @@ -97,11 +97,19 @@ struct IGBState {
>   static void igb_write_config(PCIDevice *dev, uint32_t addr,
>       uint32_t val, int len)
>   {
> +    uint16_t num_vfs_curr;
>       IGBState *s = IGB(dev);
> +    PCIESriovPF *pf = &dev->exp.sriov_pf;
>   
> +    uint16_t num_vfs_prev = pf->num_vfs;
>       trace_igb_write_config(addr, val, len);
>       pci_default_write_config(dev, addr, val, len);
>   
> +    num_vfs_curr = pf->num_vfs;
> +    if (num_vfs_curr != num_vfs_prev) {
> +        igb_core_num_vfs_change_handle(&s->core);
> +    }
> +
>       if (range_covers_byte(addr, len, PCI_COMMAND) &&
>           (dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
>           igb_start_recv(&s->core);
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index a7c7bfdc75..e1b99f312b 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -3810,24 +3810,59 @@ igb_vm_state_change(void *opaque, bool running, RunState state)
>       }
>   }
>   
> +static void
> +igb_core_init_queues_tx_packet(IGBCore *core)
> +{
> +    PCIDevice *dev;
> +    int i;
> +
> +    for (i = 0; i < IGB_NUM_QUEUES; i++) {
> +        dev = pcie_sriov_get_vf_at_index(core->owner, i % 8);
> +        if (!dev) {
> +            dev = core->owner;
> +        }
> +
> +        net_tx_pkt_init(&core->tx[i].tx_pkt, dev, E1000E_MAX_TX_FRAGS);
> +    }
> +}
> +
> +static void
> +igb_core_uninit_queues_tx_packet(IGBCore *core)
> +{
> +    int i;
> +
> +    for (i = 0; i < IGB_NUM_QUEUES; i++) {
> +        net_tx_pkt_reset(core->tx[i].tx_pkt);
> +        net_tx_pkt_uninit(core->tx[i].tx_pkt);
> +    }
> +}
> +
> +static void
> +igb_core_reinit_queues_tx_packet(IGBCore *core)
> +{
> +    igb_core_uninit_queues_tx_packet(core);
> +    igb_core_init_queues_tx_packet(core);
> +}
> +
> +void
> +igb_core_num_vfs_change_handle(IGBCore *core)
> +{
> +    igb_core_reinit_queues_tx_packet(core);
> +}
> +
>   void
>   igb_core_pci_realize(IGBCore        *core,
>                        const uint16_t *eeprom_templ,
>                        uint32_t        eeprom_size,
>                        const uint8_t  *macaddr)
>   {
> -    int i;
> -
>       core->autoneg_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
>                                          igb_autoneg_timer, core);
>       igb_intrmgr_pci_realize(core);
>   
>       core->vmstate = qemu_add_vm_change_state_handler(igb_vm_state_change, core);
>   
> -    for (i = 0; i < IGB_NUM_QUEUES; i++) {
> -        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
> -    }
> -
> +    igb_core_init_queues_tx_packet(core);
>       net_rx_pkt_init(&core->rx_pkt);
>   
>       e1000x_core_prepare_eeprom(core->eeprom,
> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
> index 814c1e264b..8a32195d74 100644
> --- a/hw/net/igb_core.h
> +++ b/hw/net/igb_core.h
> @@ -143,4 +143,7 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt);
>   void
>   igb_start_recv(IGBCore *core);
>   
> +void
> +igb_core_num_vfs_change_handle(IGBCore *core);
> +
>   #endif

