Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B572CD62F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:58:15 +0100 (CET)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoBa-0002Jv-KY
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kko8D-00072d-Td; Thu, 03 Dec 2020 07:54:45 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kko8B-0000V5-Ut; Thu, 03 Dec 2020 07:54:45 -0500
Received: by mail-lj1-x243.google.com with SMTP id a1so1060495ljq.3;
 Thu, 03 Dec 2020 04:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2Ax9//epRaFnovbs6HtORAquskyrjxe/UXoEUSr2wic=;
 b=PAXIRWNcZDIPXS9XbNXXFjJswBcpIszrP24fLMtK6ZLkbahMSfH/KOBRZO+l82E9T7
 n3jLmcBE4NZqQV0uO/jOovt48szHQtfC/uGdzdLDQQodTUoteRttr6bUE3tBFlz8IfhJ
 BopTaqEu7KuHGY7x7WuntOi2IgPao/jzvZloBxti+ZL50Ns221AUnp+eqX8cwbN8qQQq
 BJV7cfRNzbxaMYuPWOGVGY6ylk8RRbMWubcdTdIo/HQveKmkq2yWrFizV2I143xuy9V6
 xpEs9ilPnN4qp3EO/LCdrEDh7xtBKeuFNmA+0aFGI/BAu8JMlFl+zASlBCzOjC/blEHK
 t4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2Ax9//epRaFnovbs6HtORAquskyrjxe/UXoEUSr2wic=;
 b=BKuiddyhfR2aVbnW/toN06KPKdyzBi6SqkHUFYbO6MwdldbK47w+2rV0FaTWjdYqF7
 vs132YWSjTA+2BVCBW00LQPk0dvlvq5ClyBcG9b/SNHD9r6+JQ3nPhu0WxhTXbfkhEgA
 eXiajOwW/ok3hEE0OZ4i8EsvBFIqjScLIn4O+aTVpkYxzvWo45OSDmWnZW+hQAcwidfl
 5NfzvjL2uwRwuUTqDVrnUU3CZwbaXZ+VJqeaAylI+EQmm5xLmeQiDfM7s7xO3LervJJb
 91CCwcL+i9diKNEGivXzrHxDP/hL8iukUgB7B7dG77gVo1vKoOfVVIaBSjHjRWUqj33t
 ENTQ==
X-Gm-Message-State: AOAM530zbKRGQUJbcjcVkUWfF8Rjrmfe6kdSmgO3IPvPITtbxESPSJVE
 Pu3y+bYIROOYzu6+8fFyeTI=
X-Google-Smtp-Source: ABdhPJzGG0l8paId7hrQt3mkn7N3bu75TWo92M8ZPdcZNxg9aS49kKdrFJFbY6ChvtEuNTqwy7gDLA==
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr1119568ljk.288.1607000080964; 
 Thu, 03 Dec 2020 04:54:40 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j7sm484721lfe.165.2020.12.03.04.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:54:40 -0800 (PST)
Date: Thu, 3 Dec 2020 13:54:38 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
Message-ID: <20201203125438.GB2661@fralle-msi>
References: <20201202143037.24110-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202143037.24110-1-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-block@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Bin,

On [2020 Dec 02] Wed 22:30:37, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Auto Address Increment (AAI) Word-Program is a special command of
> SST flashes. AAI-WP allows multiple bytes of data to be programmed
> without re-issuing the next sequential address location.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/block/m25p80.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 9b36762df9..f225d9c96d 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -359,6 +359,7 @@ typedef enum {
>      QPP_4 = 0x34,
>      RDID_90 = 0x90,
>      RDID_AB = 0xab,
> +    AAI_WP = 0xad,
>  
>      ERASE_4K = 0x20,
>      ERASE4_4K = 0x21,
> @@ -449,6 +450,7 @@ struct Flash {
>      bool four_bytes_address_mode;
>      bool reset_enable;
>      bool quad_enable;
> +    bool aai_enable;

We need to add above addition also into the vmstate.

>      uint8_t ear;
>  
>      int64_t dirty_page;
> @@ -661,6 +663,7 @@ static void complete_collecting_data(Flash *s)
>      case PP:
>      case PP4:
>      case PP4_4:
> +    case AAI_WP:
>          s->state = STATE_PAGE_PROGRAM;
>          break;
>      case READ:
> @@ -1010,6 +1013,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)

Since only 3 cmds are allowed while within AAI programming sequence [1] I think
a warning migt be good have before the command switch case, similar to:

if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
    qemu_log_mask(LOG_GUEST_ERROR,
                  "M25P80: Invalid cmd within AAI programming sequence");
}

>  
>      case WRDI:
>          s->write_enable = false;
> +        if (get_man(s) == MAN_SST) {
> +            s->aai_enable = false;
> +        }
>          break;
>      case WREN:
>          s->write_enable = true;
> @@ -1162,6 +1168,17 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case RSTQIO:
>          s->quad_enable = false;
>          break;
> +    case AAI_WP:
> +        if (get_man(s) == MAN_SST && s->write_enable) {
> +            if (s->aai_enable) {
> +                s->state = STATE_PAGE_PROGRAM;
> +            } else {
> +                s->aai_enable = true;
> +                s->needed_bytes = get_addr_length(s);
> +                s->state = STATE_COLLECTING_DATA;
> +            }

Perhaps a qemu_log_mask in an 'else' could be useful here also:

} else {
    qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %s"
                  (get_man(s) == MAN_SST) ? "AAI_WP with write protect" :
                                            "Unknown CMD: 0xAD\n");

Lastly, [1] also says that the address shouldn't wrapp around when in AAI mode,
so we need a check before doing that also I think. 

Best regards,
Francisco Iglesias

[1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf

> +        }
> +        break;
>      default:
>          s->pos = 0;
>          s->len = 1;
> -- 
> 2.25.1
> 
> 

