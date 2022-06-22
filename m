Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498455544F6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:48:24 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wyE-00030t-SM
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3wvn-0001EP-4R; Wed, 22 Jun 2022 05:45:51 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3wvk-0003C9-TR; Wed, 22 Jun 2022 05:45:50 -0400
Received: by mail-lf1-x132.google.com with SMTP id c2so26860299lfk.0;
 Wed, 22 Jun 2022 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zg2VII0Ib03SkUSyEhOVbM/vzsfVRr82EZ2uotI1NXo=;
 b=DktjBZxWElfAb1JCFUsH2qvNVVy4eV4hmzstMDXsbGf2y67ddLdZQgTo4D0mWN7490
 v9Eiv4rrb9sbCXlvhNET/xI22wyUShMRqFjdaFRmhYyBkp63FAb1U3IwwLdPu0DWdZZQ
 z+Fh25tlZGJrufLkU7ZByikVF+C9r0MfNm2XWanYg33c0PAFxoXYIrBoCNmEZapO9APW
 kbMQWZ2ACpTXE7ZlW5wJvOXfQ5tiT66LcxAtlnRaw81CsbduxmRXed2xznbtxRLJneof
 3qi8dFiijH1meow+95fzguorOVux/qzeIidtU25WN9rTw7jTRwnx0NGsvBIzUWcRZPOX
 mXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zg2VII0Ib03SkUSyEhOVbM/vzsfVRr82EZ2uotI1NXo=;
 b=DBG/gKrULpa14+KgM4iAnCxZNS9trd2iDWepipWrqbse/LaWKAsxuoW/k0T2JdMXtu
 Lgu/tHRkDq7LRb9zkEOMdnHclhMqhvMHVCzM06CMZAZaVuDE9DponaJoWcqcWm04DgzS
 2J39lEkS7OG2kEdo90Be5CbGqAnMUIP420Og19idAphI8Wz1I3H1tb3esqBrt6k/HJEc
 qhqKKPa+LT34poEAOI6GG6wVHpSDEYeZ6YC8XZUZx9cuhxJftCMXyMPzYD5GdcipLi3o
 PuFZmjQEbffOGCuHRCnQRmjx0gGoHtLx8QmTZWw68iYJ+aOovoD5cX/jytF51t+1gPKM
 E3Kg==
X-Gm-Message-State: AJIora9rD74lV9ex6Jgi8leEtCX21sa+6Sclg+otsf1+LvVYmRv+IAik
 Y7b8VLrLgFROLM8Tz59bZEo=
X-Google-Smtp-Source: AGRyM1tF6PHxOIVFx7XpcpQGDUbOSHdLtEEUA7tgy1TVqU0YnK5daVvKlJmBPvy1OHKgQUOB1NPWkg==
X-Received: by 2002:a05:6512:1195:b0:479:77d9:ba7d with SMTP id
 g21-20020a056512119500b0047977d9ba7dmr1591246lfr.307.1655891145728; 
 Wed, 22 Jun 2022 02:45:45 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 p3-20020ac24ec3000000b0047f76a935a5sm940997lfr.137.2022.06.22.02.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 02:45:44 -0700 (PDT)
Date: Wed, 22 Jun 2022 11:45:43 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com,
 Iris Chen <irischenlj@gmail.com>
Subject: Re: [PATCH v4] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <20220622094542.GE10629@fralle-msi>
References: <20220621202427.2680413-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621202427.2680413-1-irischenlj@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x132.google.com
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

On [2022 Jun 21] Tue 13:24:27, Iris Chen wrote:
> From: Iris Chen <irischenlj@gmail.com>
> 
> Signed-off-by: Iris Chen <irischenlj@gmail.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
> Fixed .needed for subsection and suggestions from Francisco 
> 
>  hw/block/m25p80.c | 82 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 67 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..3045dda53b 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -472,11 +472,13 @@ struct Flash {
>      uint8_t spansion_cr2v;
>      uint8_t spansion_cr3v;
>      uint8_t spansion_cr4v;
> +    bool wp_level;
>      bool write_enable;
>      bool four_bytes_address_mode;
>      bool reset_enable;
>      bool quad_enable;
>      bool aai_enable;
> +    bool status_register_write_disabled;
>      uint8_t ear;
>  
>      int64_t dirty_page;
> @@ -723,6 +725,8 @@ static void complete_collecting_data(Flash *s)
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>          switch (get_man(s)) {
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1165,22 +1169,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>  
>      case WRSR:
> -        if (s->write_enable) {
> -            switch (get_man(s)) {
> -            case MAN_SPANSION:
> -                s->needed_bytes = 2;
> -                s->state = STATE_COLLECTING_DATA;
> -                break;
> -            case MAN_MACRONIX:
> -                s->needed_bytes = 2;
> -                s->state = STATE_COLLECTING_VAR_LEN_DATA;
> -                break;
> -            default:
> -                s->needed_bytes = 1;
> -                s->state = STATE_COLLECTING_DATA;
> -            }
> -            s->pos = 0;
> +        /*
> +         * If WP# is low and status_register_write_disabled is high,
> +         * status register writes are disabled.
> +         * This is also called "hardware protected mode" (HPM). All other
> +         * combinations of the two states are called "software protected mode"
> +         * (SPM), and status register writes are permitted.
> +         */
> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> +            || !s->write_enable) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: Status register write is disabled!\n");
> +            break;
> +        }
> +
> +        switch (get_man(s)) {
> +        case MAN_SPANSION:
> +            s->needed_bytes = 2;
> +            s->state = STATE_COLLECTING_DATA;
> +            break;
> +        case MAN_MACRONIX:
> +            s->needed_bytes = 2;
> +            s->state = STATE_COLLECTING_VAR_LEN_DATA;
> +            break;
> +        default:
> +            s->needed_bytes = 1;
> +            s->state = STATE_COLLECTING_DATA;
>          }
> +        s->pos = 0;
>          break;
>  
>      case WRDI:
> @@ -1195,6 +1211,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
> @@ -1484,6 +1502,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>      return r;
>  }
>  
> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> +{
> +    Flash *s = M25P80(opaque);
> +    /* WP# is just a single pin. */
> +    assert(n == 0);
> +    s->wp_level = !!level;
> +}
> +
>  static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>  {
>      Flash *s = M25P80(ss);
> @@ -1515,12 +1541,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>          s->storage = blk_blockalign(NULL, s->size);
>          memset(s->storage, 0xFF, s->size);
>      }
> +
> +    qdev_init_gpio_in_named(DEVICE(s),
> +                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
>  }
>  
>  static void m25p80_reset(DeviceState *d)
>  {
>      Flash *s = M25P80(d);
>  
> +    s->wp_level = true;
> +    s->status_register_write_disabled = false;
> +
>      reset_memory(s);
>  }
>  
> @@ -1587,6 +1619,25 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
>      }
>  };
>  
> +static bool m25p80_wp_level_srwd_needed(void *opaque)
> +{
> +    Flash *s = (Flash *)opaque;
> +
> +    return !s->wp_level || s->status_register_write_disabled;
> +}
> +
> +static const VMStateDescription vmstate_m25p80_write_protect = {
> +    .name = "m25p80/write_protect",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = m25p80_wp_level_srwd_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(wp_level, Flash),
> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_m25p80 = {
>      .name = "m25p80",
>      .version_id = 0,
> @@ -1618,6 +1669,7 @@ static const VMStateDescription vmstate_m25p80 = {
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_m25p80_data_read_loop,
>          &vmstate_m25p80_aai_enable,
> +        &vmstate_m25p80_write_protect,
>          NULL
>      }
>  };
> -- 
> 2.30.2
> 
> 

