Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3717681194
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUvc-0002VR-J5; Mon, 30 Jan 2023 09:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUva-0002Uy-R7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:14:34 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUvZ-0000WY-60
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:14:34 -0500
Received: by mail-pl1-x635.google.com with SMTP id p24so11721266plw.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/wauOP2KtXuUV8qpj/Jtnf0jIu6O0L7TvGYxvbmPKwg=;
 b=MXMEJ5cEJ6MNWEIcH54xUoJ4qNUwa45wOG+gQ4pGYW3//+a6CqXkAVH82OjZoH8uCC
 hrP6tSdL8j4EbJ1DK65A1E5Ybmgk2qpL9ZQ/pLVsnObq73WmarfZJCjDL1wFA7HGykS7
 hnGneO/6Q+4dfooJyApgAQQEjYmUqBhjrCU+NryJ4Bbuk+H4vIdyQXwXF5twUjfizTiZ
 b3B+qLFDB2ZLCWPbiTghVjhDyvVQlFhxHy8GJ+ICPobB2MLEQIHO6j3CguhvhpAU+QBM
 DUG4KEgO7LQqT1ZHNkbOieL1aWznrfFdKOhIXCszAxTJa1jeFarVGDJIkNokcuWfQy+H
 kLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/wauOP2KtXuUV8qpj/Jtnf0jIu6O0L7TvGYxvbmPKwg=;
 b=HTdWY6FPabIEuD17/aaoO+ZHrPak/F+s/AMaj35GdODIPD1yv68xV/Sb/1uWSk/7GZ
 lHslKhdVR4W0sKXmbcNDfVBnc3mjs31gIJN+iMCaaAc00wuzpHUVBLJ22+D1BvvclfyV
 eho/31qEVZafepjhH44GTRD0jLDuHERAZQm9bgV33BpHnMHDGEvzh6mC1QnpBi3vOJag
 qMN7jxzVdRGFaZXg7lBPI2UNWY70fVC+sqWlUKPgAUZzjACQNCdnm5OznxmAs3+Ie/O4
 cTHPBxnDhdKbUTuAPbzhJKmST07yNhbdRoTrY+/RKrql4Fz7OcdQyeL7WI7RDcoLos41
 jINg==
X-Gm-Message-State: AO0yUKW9ZjJQDxsS0CJc+GUZRe6mW38PmlarxrhpCRMq6VmQh4xofvKw
 7RktttsO0Il4j+qbCo6cHvp8nw==
X-Google-Smtp-Source: AK7set8ft72xAfWvuIggTxImQ+n6TWmq115d/lT+rW+jTFolTL0YOuRRDbpjdbh2jOx/Z+m7mGpBmw==
X-Received: by 2002:a17:903:11d1:b0:196:1425:740c with SMTP id
 q17-20020a17090311d100b001961425740cmr10560746plh.62.1675088071615; 
 Mon, 30 Jan 2023 06:14:31 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902b58800b00196047fc25dsm1735064pls.42.2023.01.30.06.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:14:31 -0800 (PST)
Message-ID: <fa54086a-758c-4dbf-aa3b-93b223d7835b@daynix.com>
Date: Mon, 30 Jan 2023 23:14:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/9] igb: handle PF/VF reset properly
Content-Language: en-US
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
 <20230130132304.2347-3-sriram.yagnaraman@est.tech>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230130132304.2347-3-sriram.yagnaraman@est.tech>
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

On 2023/01/30 22:22, Sriram Yagnaraman wrote:
> Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
> is reset.
> 
> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
>   hw/net/e1000x_regs.h |  1 +
>   hw/net/igb_core.c    | 33 +++++++++++++++++++++------------
>   hw/net/trace-events  |  2 ++
>   3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
> index fb5b861135..bb3fb36b8d 100644
> --- a/hw/net/e1000x_regs.h
> +++ b/hw/net/e1000x_regs.h
> @@ -548,6 +548,7 @@
>   
>   #define E1000_CTRL_EXT_ASDCHK  0x00001000 /* auto speed detection check */
>   #define E1000_CTRL_EXT_EE_RST  0x00002000 /* EEPROM reset */
> +#define E1000_CTRL_EXT_PFRSTD  0x00004000 /* PF reset done indication */

Please add this to igb_regs.h as it is specific to igb.

>   #define E1000_CTRL_EXT_LINK_EN 0x00010000 /* enable link status from external LINK_0 and LINK_1 pins */
>   #define E1000_CTRL_EXT_DRV_LOAD 0x10000000 /* Driver loaded bit for FW */
>   #define E1000_CTRL_EXT_EIAME   0x01000000
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index abeb9c7889..9bd53cc25f 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -1902,14 +1902,6 @@ static void igb_set_eims(IGBCore *core, int index, uint32_t val)
>       igb_update_interrupt_state(core);
>   }
>   
> -static void igb_vf_reset(IGBCore *core, uint16_t vfn)
> -{
> -    /* TODO: Reset of the queue enable and the interrupt registers of the VF. */
> -
> -    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
> -    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
> -}
> -
>   static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
>   {
>       uint32_t ent = core->mac[VTIVAR_MISC + vfn];
> @@ -1987,6 +1979,17 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
>       }
>   }
>   
> +static void igb_vf_reset(IGBCore *core, uint16_t vfn)
> +{
> +    /* disable Rx and Tx for the VF*/
> +    core->mac[VFTE] &= ~BIT(vfn);
> +    core->mac[VFRE] &= ~BIT(vfn);
> +    /* indicate VF reset to PF */
> +    core->mac[VFLRE] |= BIT(vfn);
> +    /* VFLRE and mailbox use the same interrupt cause */
> +    mailbox_interrupt_to_pf(core);
> +}
> +
>   static void igb_w1c(IGBCore *core, int index, uint32_t val)
>   {
>       core->mac[index] &= ~val;
> @@ -2241,14 +2244,20 @@ igb_set_status(IGBCore *core, int index, uint32_t val)
>   static void
>   igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
>   {
> -    trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
> -                                     !!(val & E1000_CTRL_EXT_SPD_BYPS));
> -
> -    /* TODO: PFRSTD */
> +    trace_igb_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
> +                                  !!(val & E1000_CTRL_EXT_SPD_BYPS),
> +                                  !!(val & E1000_CTRL_EXT_PFRSTD));
>   
>       /* Zero self-clearing bits */
>       val &= ~(E1000_CTRL_EXT_ASDCHK | E1000_CTRL_EXT_EE_RST);
>       core->mac[CTRL_EXT] = val;
> +
> +    if (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PFRSTD) {
> +        for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
> +            core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
> +            core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTD;
> +        }
> +    }
>   }
>   
>   static void
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 2f791b9b57..e94172e748 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -281,6 +281,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
>   igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
>   igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
>   
> +igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
> +
>   igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
>   igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
>   

