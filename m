Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62B2E1C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 14:21:11 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks44k-0002dc-KW
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 08:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ks42x-0001Zj-1X; Wed, 23 Dec 2020 08:19:19 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:40727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ks42T-0005rA-DY; Wed, 23 Dec 2020 08:19:18 -0500
Received: by mail-lf1-x133.google.com with SMTP id m12so40027653lfo.7;
 Wed, 23 Dec 2020 05:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CfkC3wzzyilErcqRMKGdtWf4He5ghBV6pWfwVB2Syuo=;
 b=vcyJJ7fZcYCeqPktiVS2rK5uDMwpsE/TFJo8we/RTv3Dcg5v8PuO0SF341fl1qcKU6
 M5DhKxheG1oeyaRoIU8dxLNobjQVc8lsXxPvH6YMDBH7iNJCwDZ2e23WFfdjYiWud9UA
 Ns/n3lt8zem60rkAo+6tvskPadKLhO1eiPlZD9wPx8dILFCyTH/PpMGbinL9jyPTB96c
 tY8BReLqDV/JKxJ//OjwpPZun6azBiMDiV5UTaG2ravT/uHq/lYHVv0VE8stOV6mFNtg
 1cWkgxAZzaV983CwIF2uowRcoMesqC4aaKZeWhxcK9ii+JhSf8GBWXc/kSDUU5hng/KD
 SQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CfkC3wzzyilErcqRMKGdtWf4He5ghBV6pWfwVB2Syuo=;
 b=oAcJ9wSBE07Q0q3ZHhptXr60iOEOmCnieTt2LWwHocWrTEUx5IgsCli+MwYp0ULYn/
 3EG7zMh883tTZpjy4TCW1Kjid3Z0IHMtY+NZcJnUAY5Ig6trQxHbDm+hpYy7b3q4tSDL
 9F8ApvoOut4/osObU5euY0MktAoAXXNKXZn78EEsCAgXCaz47cOCM18X8lwd2FtS2aB3
 XT3FYNTg4R9flq4I/WMDmKCqve+VJDsZ7sMbygEaCIt38FQOZQQdPF5Wbhc9kgNSgvFK
 R04esRszt4yxG+sdf956CN2nFvcPapejFqQaAK4gydx1VJZyvm97Jk+koM1rDI7OjXaT
 tv0w==
X-Gm-Message-State: AOAM530H04KwLFLckaWn5qiF9vKGbyECxLGH3UVOfztQ8WwwGqx7ewJG
 nUdeqXdJT4afp+Q0YzNN0Ww=
X-Google-Smtp-Source: ABdhPJyKRLXcSonDf4t0O0+R3yFM7gLDGo93ZbdbsGNiqw0AHpL4wb6GfRob6WuGg4esuaARoR8lSQ==
X-Received: by 2002:a2e:a402:: with SMTP id p2mr11652907ljn.270.1608729524703; 
 Wed, 23 Dec 2020 05:18:44 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j7sm3183861lfg.114.2020.12.23.05.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 05:18:44 -0800 (PST)
Date: Wed, 23 Dec 2020 14:18:42 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v5 2/2] hw/block: m25p80: Implement AAI-WP command
 support for SST flashes
Message-ID: <20201223131841.GA30208@fralle-msi>
References: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
 <1608688825-81519-2-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608688825-81519-2-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2020 Dec 23] Wed 10:00:25, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Auto Address Increment (AAI) Word-Program is a special command of
> SST flashes. AAI-WP allows multiple bytes of data to be programmed
> without re-issuing the next sequential address location.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> 
> ---
> 
> Changes in v5:
> - remove the guest error logging when address wrap is detected in AAI
> - change to return s->aai_enable in m25p80_aai_enable_needed()
> 
> Changes in v4:
> - simplify is_valid_aai_cmd()
> - use a subsection for s->aai_enable vm state
> 
> Changes in v3:
> - initialize aai_enable to false in reset_memory()
> 
> Changes in v2:
> - add aai_enable into the vmstate
> - validate AAI command before decoding a new command
> - log guest errors during AAI_WP command handling
> - report AAI status in the status register
> - abort AAI programming when address is wrapped
> - make sure AAI programming starts from the even address
> 
>  hw/block/m25p80.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 29598b4..c64852f 100644
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
> @@ -455,6 +456,7 @@ struct Flash {
>      bool four_bytes_address_mode;
>      bool reset_enable;
>      bool quad_enable;
> +    bool aai_enable;
>      uint8_t ear;
>  
>      int64_t dirty_page;
> @@ -670,6 +672,11 @@ static void complete_collecting_data(Flash *s)
>      case PP4_4:
>          s->state = STATE_PAGE_PROGRAM;
>          break;
> +    case AAI_WP:
> +        /* AAI programming starts from the even address */
> +        s->cur_addr &= ~BIT(0);
> +        s->state = STATE_PAGE_PROGRAM;
> +        break;
>      case READ:
>      case READ4:
>      case FAST_READ:
> @@ -768,6 +775,7 @@ static void reset_memory(Flash *s)
>      s->write_enable = false;
>      s->reset_enable = false;
>      s->quad_enable = false;
> +    s->aai_enable = false;
>  
>      switch (get_man(s)) {
>      case MAN_NUMONYX:
> @@ -973,6 +981,11 @@ static void decode_qio_read_cmd(Flash *s)
>      s->state = STATE_COLLECTING_DATA;
>  }
>  
> +static bool is_valid_aai_cmd(uint32_t cmd)
> +{
> +    return cmd == AAI_WP || cmd == WRDI || cmd == RDSR;
> +}
> +
>  static void decode_new_cmd(Flash *s, uint32_t value)
>  {
>      int i;
> @@ -984,6 +997,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          s->reset_enable = false;
>      }
>  
> +    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "M25P80: Invalid cmd within AAI programming sequence");
> +    }
> +
>      switch (value) {
>  
>      case ERASE_4K:
> @@ -1103,6 +1121,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case WRDI:
>          s->write_enable = false;
> +        if (get_man(s) == MAN_SST) {
> +            s->aai_enable = false;
> +        }
>          break;
>      case WREN:
>          s->write_enable = true;
> @@ -1113,6 +1134,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          if (get_man(s) == MAN_MACRONIX) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
> +        if (get_man(s) == MAN_SST) {
> +            s->data[0] |= (!!s->aai_enable) << 6;
> +        }
> +
>          s->pos = 0;
>          s->len = 1;
>          s->data_read_loop = true;
> @@ -1260,6 +1285,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case RSTQIO:
>          s->quad_enable = false;
>          break;
> +    case AAI_WP:
> +        if (get_man(s) == MAN_SST) {
> +            if (s->write_enable) {
> +                if (s->aai_enable) {
> +                    s->state = STATE_PAGE_PROGRAM;
> +                } else {
> +                    s->aai_enable = true;
> +                    s->needed_bytes = get_addr_length(s);
> +                    s->state = STATE_COLLECTING_DATA;
> +                }
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "M25P80: AAI_WP with write protect\n");
> +            }
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
> +        }
> +        break;
>      default:
>          s->pos = 0;
>          s->len = 1;
> @@ -1305,6 +1348,17 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
>          flash_write8(s, s->cur_addr, (uint8_t)tx);
>          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
> +
> +        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {
> +            /*
> +             * There is no wrap mode during AAI programming once the highest
> +             * unprotected memory address is reached. The Write-Enable-Latch
> +             * bit is automatically reset, and AAI programming mode aborts.
> +             */
> +            s->write_enable = false;
> +            s->aai_enable = false;
> +        }
> +
>          break;
>  
>      case STATE_READ:
> @@ -1450,6 +1504,24 @@ static const VMStateDescription vmstate_m25p80_data_read_loop = {
>      }
>  };
>  
> +static bool m25p80_aai_enable_needed(void *opaque)
> +{
> +    Flash *s = (Flash *)opaque;
> +
> +    return s->aai_enable;
> +}
> +
> +static const VMStateDescription vmstate_m25p80_aai_enable = {
> +    .name = "m25p80/aai_enable",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = m25p80_aai_enable_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(aai_enable, Flash),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m25p80 = {
>      .name = "m25p80",
>      .version_id = 0,
> @@ -1480,6 +1552,7 @@ static const VMStateDescription vmstate_m25p80 = {
>      },
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_m25p80_data_read_loop,
> +        &vmstate_m25p80_aai_enable,
>          NULL
>      }
>  };
> -- 
> 2.7.4
> 

