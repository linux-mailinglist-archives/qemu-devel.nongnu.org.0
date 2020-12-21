Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05202DFDB7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:53:54 +0100 (CET)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNVR-0004n6-OC
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1krNTm-0004FL-IJ; Mon, 21 Dec 2020 10:52:11 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1krNTi-0005GY-4D; Mon, 21 Dec 2020 10:52:10 -0500
Received: by mail-lf1-x135.google.com with SMTP id h22so15271146lfu.2;
 Mon, 21 Dec 2020 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OhhDtDFHwoet6JJ/iAu+jPX/bM8eAQQ14BQb7ijf1HY=;
 b=hl21JP8I1OqtyXoPPQUx8XNgxLm9uMmNyOOl43NyQFht59GjVUa7p5Z2+OvTZy3IiK
 jLbdRuywlLiVB4kEd32y90+xRG9wqsLuVrwPeLt0SX0pVIve/teAczaMXeMd6E8t2bDZ
 dxX8VeTo7nyVbVTv2XonqLN/vz9uBmj2cXaomerjlMl6/r9c0LSRr25TF0n03biVpnnp
 NV1lZ8+VP+Dtbbvk9MbDIAGX5qzk3+5cR2KaKOFc/MRHM4AWCiuoZVqI2CJzZg5UuioI
 xU6pibXyemTJ/10nBgTWJ5bgvyZ7VvsJGlELLs9MtY518DkCgoDJPIz3MD7QxtWgjI61
 V1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OhhDtDFHwoet6JJ/iAu+jPX/bM8eAQQ14BQb7ijf1HY=;
 b=U7aa/49f1xY9R6PCcJH2/CCJc9kNJQBq+YWo0OYuhHFsdjLQBuM2pMRRJe6xS7pn8B
 5+wkI6OEFw48xn4FLaJdQCXLnd86zOy9Xa+6Oh1cpAxo+OIDNup445eYCz3xgiutjJTG
 40maDQ/BHKVnSc1+W8zqH3Z5fVC4ogag5quC1rwp/NUAGhMCvr+KiY+uwwyEmfuQewuH
 +QVGIctPS6yHdaAd3VyP11QXYtuZsk3OQnlvjmFR5zIEjmeJB5CQhwpD8/QwXv88QC0L
 qV+MBevxuidkkbB+5LTe5hKLCIlruSVutmwCrBmdidklwAKfvOq5GgvhF7ULHAAdeZXC
 BsMQ==
X-Gm-Message-State: AOAM531glLCWNCnm+xYDFchYUDdaotZPuLPmG8OoD16PRxNkacQjBDTJ
 fUg2qplMyaIRglUn1V6WP2E=
X-Google-Smtp-Source: ABdhPJzHcEr0OxGXPUVTikP+/wt/RJlOM0bWg10KJTfSqzWWSmHcjpT0GQJmxDU9kyeYwWCBbnDhwQ==
X-Received: by 2002:ac2:58e8:: with SMTP id v8mr6563957lfo.630.1608565923097; 
 Mon, 21 Dec 2020 07:52:03 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 b9sm2136927lji.68.2020.12.21.07.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 07:52:02 -0800 (PST)
Date: Mon, 21 Dec 2020 16:52:00 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 2/2] hw/block: m25p80: Implement AAI-WP command
 support for SST flashes
Message-ID: <20201221155159.GA23373@fralle-msi>
References: <1607668640-33970-1-git-send-email-bmeng.cn@gmail.com>
 <1607668640-33970-2-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607668640-33970-2-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin,

On [2020 Dec 11] Fri 14:37:20, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Auto Address Increment (AAI) Word-Program is a special command of
> SST flashes. AAI-WP allows multiple bytes of data to be programmed
> without re-issuing the next sequential address location.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
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
>  hw/block/m25p80.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 236e1b4..802a21d 100644
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
>      uint8_t ear;
>  
>      int64_t dirty_page;
> @@ -664,6 +666,11 @@ static void complete_collecting_data(Flash *s)
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
> @@ -762,6 +769,7 @@ static void reset_memory(Flash *s)
>      s->write_enable = false;
>      s->reset_enable = false;
>      s->quad_enable = false;
> +    s->aai_enable = false;
>  
>      switch (get_man(s)) {
>      case MAN_NUMONYX:
> @@ -932,6 +940,15 @@ static void decode_qio_read_cmd(Flash *s)
>      s->state = STATE_COLLECTING_DATA;
>  }
>  
> +static bool is_valid_aai_cmd(uint32_t value)
> +{
> +    if (value == AAI_WP || value == WRDI || value == RDSR) {
> +        return true;
> +    } else {
> +        return false;
> +    }

For fewer lines (perhaps also rename value -> cmd):

return value == AAI_WP || value == WRDI || value == RDSR;


> +}
> +
>  static void decode_new_cmd(Flash *s, uint32_t value)
>  {
>      int i;
> @@ -943,6 +960,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
> @@ -1008,6 +1030,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>  
>      case WRDI:
>          s->write_enable = false;
> +        if (get_man(s) == MAN_SST) {
> +            s->aai_enable = false;
> +        }
>          break;
>      case WREN:
>          s->write_enable = true;
> @@ -1018,6 +1043,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
> @@ -1160,6 +1189,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
> @@ -1205,6 +1252,19 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
>          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
>          flash_write8(s, s->cur_addr, (uint8_t)tx);
>          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
> +
> +        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {

I had a another look at above and think [1] actually speeks about wrapping
when hitting into protected areas. Since we do not handle those at the
moment we can just remove this portion in case you agree with me.


> +            /*
> +             * There is no wrap mode during AAI programming once the highest
> +             * unprotected memory address is reached. The Write-Enable-Latch
> +             * bit is automatically reset, and AAI programming mode aborts.
> +             */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: AAI highest memory address reached");
> +            s->write_enable = false;
> +            s->aai_enable = false;
> +        }
> +
>          break;
>  
>      case STATE_READ:
> @@ -1372,6 +1432,7 @@ static const VMStateDescription vmstate_m25p80 = {
>          VMSTATE_UINT32(volatile_cfg, Flash),
>          VMSTATE_UINT32(enh_volatile_cfg, Flash),
>          VMSTATE_BOOL(quad_enable, Flash),
> +        VMSTATE_BOOL(aai_enable, Flash),

Above we will have to be put into a subsection (for not breaking
migration). In 'docs/devel/migration.rst' one can read more about those
(and in the file there's one already that can be looked into).

The rest of the patch looks good to me!

Best regards,
Francisco Iglesias

>          VMSTATE_UINT8(spansion_cr1nv, Flash),
>          VMSTATE_UINT8(spansion_cr2nv, Flash),
>          VMSTATE_UINT8(spansion_cr3nv, Flash),
> -- 
> 2.7.4
> 

