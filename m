Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F990545593
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:27:10 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOkD-0001pQ-BZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nzNjS-0001J3-86; Thu, 09 Jun 2022 15:22:14 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nzNjP-0005Z6-Qv; Thu, 09 Jun 2022 15:22:13 -0400
Received: by mail-lf1-x133.google.com with SMTP id w20so17836986lfa.11;
 Thu, 09 Jun 2022 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1DwPWeghK1SYILdmBOcwosBBmAC16Re7YyHoneZ1z1k=;
 b=DoyN65Il+Q5garZe5TaNpaSivKkLzVD2OBQBh1OT9GmdO6TdHiOai7rdE4oz/X9/EO
 yMzCFcxTJwz/l/B8gdaf8OitK5B0M2FNxaDrH3hBWYHTJgCt835qcPpPPOOHEQzbNxWX
 pwSu43y3ay6mjuR98gSZ4dLtOg5XF+9vXXkvqsKOxuz5yg36uhN7VSMAxqiz043HZLzE
 7zYXSZXMKaPEaAPd249x+LDyXNTlNwHn0qXxE375jQ7BfhbqrruwVvwAnI2BbjpSAtCV
 vPFRccumfl9NkziITxVjyIAmUMKKVNOtZxZX7Ium8SpTlja0zEFBzkA8Fa10swGuSFCw
 Li9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1DwPWeghK1SYILdmBOcwosBBmAC16Re7YyHoneZ1z1k=;
 b=UNyJTvvK5LZ4CvtNhUYJMsFnhQi+Z4SIidVlSdP0DKKW2okQtnEtDkZlRZyHTfMfGz
 m3Z5SwnOWHqgblVvXFeP4oT9ScZkhDUul7xqvd+WK3504vjo6TPamDG3TLUO0V6jxi9J
 DgY2iUHKLH+JphX/rAgNQt18etZxYunzApsFW2ujkkB30R8YMrgukww2czpopg0h3T+m
 VX39xRHWbZ78Tnta/7Gl/P1FTFW66vQ0qohv9xBxaZIEiLQggvbPjGxwUXxcXgR2tD4n
 jugNrpjeDziCDI1cPNmtunfaS2CEpAmGSvty0gbb3Qvi3IzG417J6J6MKCirr6eWX4wc
 yopQ==
X-Gm-Message-State: AOAM531XykhANUPvlYmmBzJYcy/GVAP+UHV2+mx+owvuILzUz5+ESAB+
 CnDB+sZk0iwN0nGBjfkf7JA=
X-Google-Smtp-Source: ABdhPJw2zFjCTid/ybNHD/52zdEdSeZSYem/lSb72JN6xHaBLpqlIPH5Win9occH0ppHBKf98udmdQ==
X-Received: by 2002:ac2:533c:0:b0:479:12f2:3699 with SMTP id
 f28-20020ac2533c000000b0047912f23699mr23529789lfh.549.1654802524550; 
 Thu, 09 Jun 2022 12:22:04 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a2e9cd3000000b00253d23f0d12sm3829943ljj.19.2022.06.09.12.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 12:22:03 -0700 (PDT)
Date: Thu, 9 Jun 2022 21:22:02 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Iris Chen <irischenlj@fb.com>
Cc: pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org,
 Iris Chen <irischenlj@gmail.com>
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Message-ID: <20220609192201.GC10629@fralle-msi>
References: <20220609031320.2212468-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609031320.2212468-1-irischenlj@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x133.google.com
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

Hi Iris,

Looks good some, a couple of comments below.

On [2022 Jun 08] Wed 20:13:19, Iris Chen wrote:
> From: Iris Chen <irischenlj@gmail.com>
> 
> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> ---
> Addressed all comments from V1. The biggest change: removed object_class_property_add.
> 
>  hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
>  tests/qtest/aspeed_smc-test.c |  2 ++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..1a20bd55d4 100644
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
> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
>          flash_erase(s, s->cur_addr, s->cmd_in_progress);
>          break;
>      case WRSR:
> +        /*
> +         * If WP# is low and status_register_write_disabled is high,
> +         * status register writes are disabled.
> +         * This is also called "hardware protected mode" (HPM). All other
> +         * combinations of the two states are called "software protected mode"
> +         * (SPM), and status register writes are permitted.
> +         */
> +        if ((s->wp_level == 0 && s->status_register_write_disabled)
> +            || !s->write_enable) {

'write_enable' needs to be true in 'decode_new_cmd' when issueing the WRSR
command, otherwise the state machinery will not advance to this function
(meaning that above check for !s->write_enable will never hit as far as I can
tell). A suggestion is to move the check for wp_level and
status_reg_wr_disabled into 'decode_new_cmd' to for keeping it consistent.

> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: Status register write is disabled!\n");
> +            break;
> +        }
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>          switch (get_man(s)) {
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>          if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
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
> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
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
> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
>          VMSTATE_UINT8(needed_bytes, Flash),
>          VMSTATE_UINT8(cmd_in_progress, Flash),
>          VMSTATE_UINT32(cur_addr, Flash),
> +        VMSTATE_BOOL(wp_level, Flash),
> +        VMSTATE_BOOL(status_register_write_disabled, Flash),

Above needs to be added through a subsection, you can see commit 465ef47abe3
for an example an also read about this in docs/devel/migration.rst.

Thank you,
Best regads,
Francisco Iglesias


>          VMSTATE_BOOL(write_enable, Flash),
>          VMSTATE_BOOL(reset_enable, Flash),
>          VMSTATE_UINT8(ear, Flash),
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index ec233315e6..c5d97d4410 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -56,7 +56,9 @@ enum {
>      BULK_ERASE = 0xc7,
>      READ = 0x03,
>      PP = 0x02,
> +    WRSR = 0x1,
>      WREN = 0x6,
> +    SRWD = 0x80,
>      RESET_ENABLE = 0x66,
>      RESET_MEMORY = 0x99,
>      EN_4BYTE_ADDR = 0xB7,
> -- 
> 2.30.2
> 
> 

