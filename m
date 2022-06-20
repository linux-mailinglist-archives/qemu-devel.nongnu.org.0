Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D065513CD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:14:44 +0200 (CEST)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3DUZ-0007HG-1b
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3DQi-0005TV-Hj; Mon, 20 Jun 2022 05:10:45 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o3DQa-00039T-Uw; Mon, 20 Jun 2022 05:10:39 -0400
Received: by mail-lf1-x12a.google.com with SMTP id g4so3839380lfv.9;
 Mon, 20 Jun 2022 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YzrE3ubLHPXWSEZ0Nn7384TQFxa8gKiqCOwRRAoE1R8=;
 b=L1j/fShKz/DOQ7ZhU28vGhxOMM8/pglvYps/KtGCs00IN0U3DKrXZ9MjQGPBGgRlZz
 FW3UnoNZL3DGpkrSB4JcdJECCmDhmcFYgA+GSgBuDncrtX8idMG0OWqxaTmXV2ydT5Yc
 M7LMqkdX3i4XxXBG7Ev+c35NWGZ7WCL/zBKlPPfia53GDowDO67PB3jREqXup5mMdED2
 m4JR/HYDO1omSj/tFL58Ja1QPo7uIewsSZmfpL3B8ua3c7H/jrKgD3JVku2rX/l1+2wH
 0whwZV1YtPcVKFFyvsRgyPPX1O5W35uBfh3OCwS0AZ6B7XQBjpSepgfIDdGVVzrNgq6P
 xoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YzrE3ubLHPXWSEZ0Nn7384TQFxa8gKiqCOwRRAoE1R8=;
 b=DoYN9+T+7FYv1ZqxsA6q2hgm4za6wQA+8lNCt9ZecBBl75Fo4Ob+1TRlhEeODXp1tk
 2xxDHntZQyJTwbqorEI6/Lv8dVDSeanaBRDtwu9nCAllSW2U5uQukvbHXvfRMk1eEysV
 OjeKUIwGa8NskZTuQwT+ocyV1Hx00gngk06dD/fmxt8gCNFsqWRLPMjd2/JM4hfPbGqz
 4F9riwp6jH65yq44wFJsvg6sHsxsv7Kt6DYhBj/W7wRiInPnkgK+xsAwwzlpaORR/r3w
 W9nGMYE5hf/B61m8+KJZ4xh1WjMJwVGHcms/MGqsNRo9RsFGOkYQSMPuFGiM/mj+2zkI
 fBBQ==
X-Gm-Message-State: AJIora9gkFwUAhSNLzHhnNJ4qppS29d2qLSM/Al4N4qbvAzIC9Nixn2S
 ZEi3F9YVN7aNW14pYlYJ2QY=
X-Google-Smtp-Source: AGRyM1tLNMk3UPmVtkHnbjy2pg2KpYN24e0jC/mMrAk9qPw+Qx4QfQ43UoiGw1mXTGLJ9Zl40CReGQ==
X-Received: by 2002:a19:2d10:0:b0:47f:55d1:3c4e with SMTP id
 k16-20020a192d10000000b0047f55d13c4emr8266974lfj.640.1655716231763; 
 Mon, 20 Jun 2022 02:10:31 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a196747000000b0047255d211e5sm1685833lfj.276.2022.06.20.02.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 02:10:31 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:10:29 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com
Subject: Re: [PATCH v3 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <20220620091028.GD10629@fralle-msi>
References: <20220617220245.2285150-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617220245.2285150-1-irischenlj@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -1010
X-Spam_score: -101.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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

Hi Iris,

On [2022 Jun 17] Fri 15:02:45, Iris Chen wrote:
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> Thanks everyone for your comments. This is a v3 patch that addresses all 
> suggestions (moving write_enable to decode_new_cmd). 
> I am waiting on some feedback from Dan's (dz4list@gmail.com) patch
> regarding adding a STATE_STANDBY state. 
> 
> Currently, all tests are passing. 
>  
>  hw/block/m25p80.c | 77 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 62 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..12a59ca57c 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -27,12 +27,14 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> +#include "hw/irq.h"
>  #include "migration/vmstate.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"

We can remove above two new header includes (sorry for missing this last time).

>  #include "trace.h"
>  #include "qom/object.h"
>  
> @@ -472,11 +474,13 @@ struct Flash {
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
> @@ -723,6 +727,8 @@ static void complete_collecting_data(Flash *s)
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>          switch (get_man(s)) {
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1165,22 +1171,34 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
>          }
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
> +        }
> +        s->pos = 0;
>          break;
>  
>      case WRDI:
> @@ -1195,6 +1213,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
> @@ -1484,6 +1504,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
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
> @@ -1515,12 +1543,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
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
> @@ -1587,6 +1621,18 @@ static const VMStateDescription vmstate_m25p80_aai_enable = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_m25p80_write_protect = {
> +    .name = "m25p80/write_protect",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = false,

Above is a function, something like:

static bool m25p80_wp_level_srwd_needed(void *opaque)
{
    Flash *s = (Flash *)opaque;

    return !s->wp_level || s->status_register_write_disabled;
}

    .needed = m25p80_wp_level_srwd_needed,


Looks good otherwise!

Thanks,
Best regards,
Francisco

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
> @@ -1618,6 +1664,7 @@ static const VMStateDescription vmstate_m25p80 = {
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

