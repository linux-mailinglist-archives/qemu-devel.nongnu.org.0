Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16167FD00
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 06:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM0he-00021t-7M; Sun, 29 Jan 2023 00:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM0hb-00021Z-Pk
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:58:07 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM0hZ-0001q3-Pm
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:58:07 -0500
Received: by mail-pg1-x536.google.com with SMTP id 36so5629299pgp.10
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 21:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+j/1x7O09B1LHdQjpR2bmbV0dHni2b/BHEpYul4MIs=;
 b=t7xSgHbGczyDMXdc+Gm8I9ntEogPThl4BEEphsEqA6VhgjVPlfUKcTAsRGUf4TwPFE
 9ApMn1Ipo84nZnD587WhZ5dpRfrMon+5JXNlKdu5UUEQk0uoKnKqg8I6+6kPDmvlanmw
 uibAvjV5fqJrHiDUmINU1PfEXZFwF7vWtsUXQUki1ZuNLJwK+FbiYxPHhhW3HhwZR04l
 c1RXdbhGY+Q3qgeTkHS7M7pdHGA1htSGzxXxs9ZQp61WDbcT6hxe0CME6STjRT3UTvOn
 9PVEabCuJHtQCE/I81SjLqdHjT7XTL8zQ9xBcHE2CEnBdwSdV5/5jjJOg6EYnly2kh6p
 Fc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+j/1x7O09B1LHdQjpR2bmbV0dHni2b/BHEpYul4MIs=;
 b=m2RJNddvWtoSieQmD8zE1qDJcfpKszEViLZqQud3Udfq4Kav89ks+4RLrVkuZCK3BI
 mtygN2nGI1vuZG9JMTnRAsZkIogxXt8NzOQgLiJOKuQ9wn2f1OynkAsbCoeFQsdCWKCH
 62ivZV3ZJ/W4GNi6TnMs6UVoVGU4koTaWjSNHj88SgFHQ5BlH2VnsY1At9v7YWdJsZVC
 pDQvdBUZllxx5TsEI6OjktiASR29KKzzvQP63mc4MBuwqRV7EgA7yMbXlCi/v8s6NyuN
 ExE2qPQJKcnfYc0huBGHtC5/F8C+g2JTvgN2nGuvsc0YM0fmtEbcBkFWCdsXjwoCZBfr
 AEVQ==
X-Gm-Message-State: AO0yUKVxfBxza6W55uugQzzrZ5+DkkWTm/iGhcQSOSdyHsaCqD+2Wx1x
 CLDLwAN9Y+bjm6LQQYb/ydmTJQ==
X-Google-Smtp-Source: AK7set/Zr+absz3qASw0pwLpq1/lajWltPEncwIA65gwA9Gc+GAuQr6GQPS9WjtSysxswTB+fWc3Xw==
X-Received: by 2002:a05:6a00:212e:b0:592:5eab:3402 with SMTP id
 n14-20020a056a00212e00b005925eab3402mr4420760pfj.28.1674971884237; 
 Sat, 28 Jan 2023 21:58:04 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x4-20020aa79ac4000000b0059072da44f3sm5104870pfp.130.2023.01.28.21.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 21:58:03 -0800 (PST)
Message-ID: <0d67b3aa-fd43-b445-8fdc-68f965c143d1@daynix.com>
Date: Sun, 29 Jan 2023 14:58:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/9] igb: handle PF/VF reset properly
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-3-sriram.yagnaraman@est.tech>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230128134633.22730-3-sriram.yagnaraman@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/28 22:46, Sriram Yagnaraman wrote:
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

Please do not move the function unless you have a legitimate reason for 
that.

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

