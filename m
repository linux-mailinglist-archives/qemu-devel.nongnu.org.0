Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04256BE87
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 19:52:04 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9s95-00068V-Gd
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o9s2D-0001jM-1E; Fri, 08 Jul 2022 13:44:57 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:37544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o9s29-0002oi-AY; Fri, 08 Jul 2022 13:44:56 -0400
Received: by mail-lj1-x22c.google.com with SMTP id 19so5875257ljz.4;
 Fri, 08 Jul 2022 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=M8Plsecq4uec1YoYmqYuY1vMM7ihL4EU1U/NLAkXfqE=;
 b=Bz1wkrQQzyucYP7PRdZsr4Z8ahupmIO+NRbWoxSxiH5D8Uj3bLXAplIE0myFhwXybx
 yZnfonMhYKEROfahmOgPmKtOQCJ3d4YJ3reSPjO4K9BPT/VRZae8XXo1UxdAAbBmf2+1
 ErArR22wRUZeU0gZySe29tZ9Eh+Vcmt7j4nq2/X16cSJgkML0sUw6r/nP6T50zfdSTwL
 YOgcyPftK5LMsaJH+BnD4mHNqYaYRgmP5WhTPyLmqfjqho0zbJHRwFOT5EmO/9LSICDG
 T3IpRyaCEc6RSfaCKshO+xEvzbF+KMWiKfJYjTHB4fqru6H5J+7+jtyKAjTwJSKG1ZNX
 jqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M8Plsecq4uec1YoYmqYuY1vMM7ihL4EU1U/NLAkXfqE=;
 b=xP9pd5ouWcpyBKlSuGe3tPucnRXRD1nF+4jeLAQIdgAe16k4tcK2cOReX4jsrjnvVw
 cKFsCjERMS/5xVPe2IXXNK/kevIz4ifarU+6Rwqh8q3dM6lvC1gxzBHH/GYzJ1ybwFTO
 8hiWy4nCqOp/vdXqDbz0Ha5Jtr/yh5v0/9Ml+gLDHnM2/CZMqINGXaeAUpZbtncz90JL
 F6F+mJizSAg4oyiovlqJl4xUJ2zOwU9k/4XqdcGBO+xe201mCdEXwi6ZcRpnrVNmi/HH
 Qeug3ZI6qKy1A+lQj9ZSYJiBr2JV4Gu1wexQTr5U3I2HSPiyjLfHFz8KgmJ/YJa2cdHC
 ZSEw==
X-Gm-Message-State: AJIora+Rx5a+Fw8yTDtNnEHXDoQzf44Tszn7MD9s7e0B4jMajq0sySmq
 pkUG+OLijOHfUKOPXBDYZFM=
X-Google-Smtp-Source: AGRyM1thgcym79Pp+EadIwIZii7Kf+7XaPyu6XXPceCrzgtS+1AJjy3QO+ictKXmm8LrySsU4KEncQ==
X-Received: by 2002:a2e:953:0:b0:25d:5c20:2265 with SMTP id
 80-20020a2e0953000000b0025d5c202265mr924508ljj.348.1657302288986; 
 Fri, 08 Jul 2022 10:44:48 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05651203e500b0048910301774sm797243lfq.307.2022.07.08.10.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 10:44:47 -0700 (PDT)
Date: Fri, 8 Jul 2022 19:44:45 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com
Subject: Re: [PATCH v3] hw: m25p80: Add Block Protect and Top Bottom bits for
 write protect
Message-ID: <20220708174444.GA29533@fralle-msi>
References: <20220627185234.1911337-1-irischenlj@fb.com>
 <20220708164552.3462620-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708164552.3462620-1-irischenlj@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Jul 08] Fri 09:45:52, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
> Cosmetic suggestions addressed. 
> 
>  hw/block/m25p80.c | 102 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 90 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 50b523e5b1..f3b401cf90 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -38,21 +38,19 @@
>  #include "trace.h"
>  #include "qom/object.h"
>  
> -/* Fields for FlashPartInfo->flags */
> -
> -/* erase capabilities */
> -#define ER_4K 1
> -#define ER_32K 2
> -/* set to allow the page program command to write 0s back to 1. Useful for
> - * modelling EEPROM with SPI flash command set
> - */
> -#define EEPROM 0x100
> -
>  /* 16 MiB max in 3 byte address mode */
>  #define MAX_3BYTES_SIZE 0x1000000
> -
>  #define SPI_NOR_MAX_ID_LEN 6
>  
> +/* Fields for FlashPartInfo->flags */
> +enum spi_flash_option_flags {
> +    ER_4K                  = BIT(0),
> +    ER_32K                 = BIT(1),
> +    EEPROM                 = BIT(2),
> +    HAS_SR_TB              = BIT(3),
> +    HAS_SR_BP3_BIT6        = BIT(4),
> +};
> +
>  typedef struct FlashPartInfo {
>      const char *part_name;
>      /*
> @@ -253,7 +251,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
> +           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB) },
>      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>      { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
> @@ -480,6 +479,11 @@ struct Flash {
>      bool reset_enable;
>      bool quad_enable;
>      bool aai_enable;
> +    bool block_protect0;
> +    bool block_protect1;
> +    bool block_protect2;
> +    bool block_protect3;
> +    bool top_bottom_bit;
>      bool status_register_write_disabled;
>      uint8_t ear;
>  
> @@ -625,12 +629,36 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
>  {
>      uint32_t page = addr / s->pi->page_size;
>      uint8_t prev = s->storage[s->cur_addr];
> +    uint32_t block_protect_value = (s->block_protect3 << 3) |
> +                                   (s->block_protect2 << 2) |
> +                                   (s->block_protect1 << 1) |
> +                                   (s->block_protect0 << 0);
>  
>      if (!s->write_enable) {
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
>          return;
>      }
>  
> +    if (block_protect_value > 0) {
> +        uint32_t num_protected_sectors = 1 << (block_protect_value - 1);
> +        uint32_t sector = addr / s->pi->sector_size;
> +
> +        /* top_bottom_bit == 0 means TOP */
> +        if (!s->top_bottom_bit) {
> +            if (s->pi->n_sectors <= sector + num_protected_sectors) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "M25P80: write with write protect!\n");
> +                return;
> +            }
> +        } else {
> +            if (sector < num_protected_sectors) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "M25P80: write with write protect!\n");
> +                return;
> +            }
> +        }
> +    }
> +
>      if ((prev ^ data) & data) {
>          trace_m25p80_programming_zero_to_one(s, addr, prev, data);
>      }
> @@ -728,6 +756,15 @@ static void complete_collecting_data(Flash *s)
>          break;
>      case WRSR:
>          s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +        s->block_protect0 = extract32(s->data[0], 2, 1);
> +        s->block_protect1 = extract32(s->data[0], 3, 1);
> +        s->block_protect2 = extract32(s->data[0], 4, 1);
> +        if (s->pi->flags & HAS_SR_TB) {
> +            s->top_bottom_bit = extract32(s->data[0], 5, 1);
> +        }
> +        if (s->pi->flags & HAS_SR_BP3_BIT6) {
> +            s->block_protect3 = extract32(s->data[0], 6, 1);
> +        }
>  
>          switch (get_man(s)) {
>          case MAN_SPANSION:
> @@ -1213,6 +1250,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
>          s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +        s->data[0] |= (!!s->block_protect0) << 2;
> +        s->data[0] |= (!!s->block_protect1) << 3;
> +        s->data[0] |= (!!s->block_protect2) << 4;
> +        if (s->pi->flags & HAS_SR_TB) {
> +            s->data[0] |= (!!s->top_bottom_bit) << 5;
> +        }
> +        if (s->pi->flags & HAS_SR_BP3_BIT6) {
> +            s->data[0] |= (!!s->block_protect3) << 6;
> +        }
>  
>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
> @@ -1553,6 +1599,11 @@ static void m25p80_reset(DeviceState *d)
>  
>      s->wp_level = true;
>      s->status_register_write_disabled = false;
> +    s->block_protect0 = false;
> +    s->block_protect1 = false;
> +    s->block_protect2 = false;
> +    s->block_protect3 = false;
> +    s->top_bottom_bit = false;
>  
>      reset_memory(s);
>  }
> @@ -1639,6 +1690,32 @@ static const VMStateDescription vmstate_m25p80_write_protect = {
>      }
>  };
>  
> +static bool m25p80_block_protect_needed(void *opaque)
> +{
> +    Flash *s = (Flash *)opaque;
> +
> +    return s->block_protect0 ||
> +           s->block_protect1 ||
> +           s->block_protect2 ||
> +           s->block_protect3 ||
> +           s->top_bottom_bit;
> +}
> +
> +static const VMStateDescription vmstate_m25p80_block_protect = {
> +    .name = "m25p80/block_protect",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = m25p80_block_protect_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(block_protect0, Flash),
> +        VMSTATE_BOOL(block_protect1, Flash),
> +        VMSTATE_BOOL(block_protect2, Flash),
> +        VMSTATE_BOOL(block_protect3, Flash),
> +        VMSTATE_BOOL(top_bottom_bit, Flash),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m25p80 = {
>      .name = "m25p80",
>      .version_id = 0,
> @@ -1671,6 +1748,7 @@ static const VMStateDescription vmstate_m25p80 = {
>          &vmstate_m25p80_data_read_loop,
>          &vmstate_m25p80_aai_enable,
>          &vmstate_m25p80_write_protect,
> +        &vmstate_m25p80_block_protect,
>          NULL
>      }
>  };
> -- 
> 2.30.2
> 
> 

