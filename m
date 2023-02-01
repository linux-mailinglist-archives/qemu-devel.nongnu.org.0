Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DD685EAD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 06:02:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN5CR-0002pN-FB; Tue, 31 Jan 2023 23:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN5CP-0002pD-8h
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:58:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN5CN-0008SA-Dh
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:58:20 -0500
Received: by mail-pl1-x635.google.com with SMTP id m2so12312193plg.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UbKYl3LMDoDHjCpwja5V9+m58izhQKIQnWMqUuKqNKY=;
 b=tKu4APwy6pIC/l+g4QarbSKMt/VHfZPyHD44n27RkFe+TmPS4I6bdjgCbAX/yPEQgj
 9OtXoN43AVlntrxOGTQ2it2qzYGgSuiVLDmobiBACh3aQRkdTCSZMkPRdR4pI92lITso
 olDpAdBxo1bx+4ph2vfLfZZGoMNBKvbxHszCIuiy01wJIiJMLnYF5h/T/2G48lAnXPl2
 lnQviRqMdx5sFcA5eUfERRdSb9C5Br9lBzDZc7+M/qzCsOiXDwEiALch9jbLfhkD2Oiu
 uZEWl6Bheck4tcvnXo1Lkk13TUN+kIm7zyotZ27ljDses0SXOqzAsTDcdvmYHtaMY8ME
 jF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbKYl3LMDoDHjCpwja5V9+m58izhQKIQnWMqUuKqNKY=;
 b=mLH3ewKBcWh6c7HuJd6CpPBTzwr4AvTVBHaYaldLkIUNpJoR6m0jJOg9yAkLSWBwmg
 fwYKqMRveNRdWbURUDhulj6rFMkzcTGzyONe2HsceRUtKooPLcENEu6v4LG2EXaCXkpE
 dl/yGkAwEnq2cAbN2BbrQM32fnKClf7C99wl9dQlEr61T4jdS0EnHJ3c79C49g6xtrPd
 0yujlMXmrwYQpx69yt7ZQZxsiMhbd8R+9pnaMx6ekGAVYcfZNC99sAzaEpenaeRaRIWF
 +wOVz+71fit5xOIdDF3VI7rsHICrK4rOOgsfTGxLFBosjp86QClOXcTNDSLUtceOMzZh
 BxQA==
X-Gm-Message-State: AO0yUKXQ20oAFKVDLM6OjLv2dHtbbbcyurGgQTJDrG5oSXhVUYugKdSt
 6kbXnOhd9oz7RpPbYg9DTHpjkw==
X-Google-Smtp-Source: AK7set8IWMq/qT6RIe+7iGEAdISCyG7rZ2hAIxb1HHRAjg/wKuxWkwhQXk+FVTbIk8XTBh5nuaLArw==
X-Received: by 2002:a17:902:db01:b0:198:adc4:22a1 with SMTP id
 m1-20020a170902db0100b00198adc422a1mr668225plx.28.1675227497838; 
 Tue, 31 Jan 2023 20:58:17 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b002296094b9cdsm328178pjf.24.2023.01.31.20.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 20:58:17 -0800 (PST)
Message-ID: <6ee9c527-2993-83b4-02c2-6e604d0c3679@daynix.com>
Date: Wed, 1 Feb 2023 13:58:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 8/9] igb: respect VT_CTL ignore MAC field
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
 <20230131094232.28863-9-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230131094232.28863-9-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/31 18:42, Sriram Yagnaraman wrote:
> Also trace out a warning if replication mode is disabled, since we only
> support replication mode enabled.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/igb_core.c   | 9 +++++++++
>   hw/net/trace-events | 2 ++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index c5f9c14f47..8115be2d76 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -964,6 +964,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>       }
>   
>       if (core->mac[MRQC] & 1) {
> +        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
> +            trace_igb_rx_vmdq_replication_mode_disabled();
> +        }
> +
>           if (is_broadcast_ether_addr(ehdr->h_dest)) {
>               for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
>                   if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
> @@ -1010,6 +1014,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
>               }
>           }
>   
> +        /* assume a full pool list if IGMAC is set */
> +        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
> +            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
> +        }
> +

This overwrites "queues", but "external_tx" is not overwritten.

>           if (e1000x_vlan_rx_filter_enabled(core->mac)) {
>               uint16_t mask = 0;
>   
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index e94172e748..9bc7658692 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -288,6 +288,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint3
>   
>   igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
>   
> +igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication mode enabled is supported"
> +
>   igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
>   igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
>   igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"

