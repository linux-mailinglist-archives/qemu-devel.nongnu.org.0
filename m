Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00956343C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:18:01 +0200 (CEST)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GX2-00050a-EV
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o7GVd-0003w0-Mt; Fri, 01 Jul 2022 09:16:34 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1o7GVb-0004AQ-Ms; Fri, 01 Jul 2022 09:16:33 -0400
Received: by mail-lf1-x12e.google.com with SMTP id i18so3817296lfu.8;
 Fri, 01 Jul 2022 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=TdeuZh0ESiPRBVJFudaPvW16n9nzWg7b2PnH95UIUT8=;
 b=cj+YLXHtRr3DdolLlmWPyQ8NVN8iuIlRNGVlxTvJLs+ift1aor3wpQbe1PCUj2rNa8
 wOra46skQdxlio9NIR2+KvYsL4T+KHW/mZEvSS8zH4R/rK4+RNK20R3dYxcj3ANnYPTz
 +bGvVIr8pU+x8J2ZkroLT70WJTJdzWiFpiLZfazGcH1a4yJh3eGRy0lgXl8Yb5A9SAom
 pQVgzrvpFZcbpYG5sxKOp02SHwpzaDofuvbXzwC9nbaNwiilURXkYFsEsWAAs6lx4p+l
 2RW7GFos/73poBroqZvY0fXgb/zGGna1wG17B9py/ci+NOnXrmoUjQP4Uxa/YrHPYTpg
 vgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=TdeuZh0ESiPRBVJFudaPvW16n9nzWg7b2PnH95UIUT8=;
 b=7R7VmmBU7cRVvspgxqM6CGM7u4yMKPG1cjMwrebBdwXHVGsHi8FWB8pjm5xYxRJkR7
 noVSD/O5maFvOx7RQwt7IeGL95mbeB/71QxBsgpV9o+D0Mu/tEdG840Q4P4al4ZgVZv4
 40IGPOZ09lvkXWSGj2cLO/LuiScWkSjA336D1oYk2hIEZLpk5SPzezTw/B8NaecdrbEf
 velEct5/BaaJOF0177fbA/xyS54TIa314MKoZkXxjfj4lQbeG4tG9eyU853JpSjkg/n+
 5BtAC1ATFjOBQugV67F/2wYKMoVy2O/ePLEJ6jL+oekuA7GrHls+8hrZCmtGMYXOepgg
 HzZQ==
X-Gm-Message-State: AJIora/n+ahv+f+aEyYCguTJAf7HDbC8/7FgswJM55lA6zfm+e3sTyTq
 6ZbTXp6TfJ0F4S0GC2l4jJ0=
X-Google-Smtp-Source: AGRyM1tLnuflXvMfsZtvSfHkM30ilyU4dQOuen8LhCYj+BJgESNprdT1xopn5iZnLfFb0IXPrzWS2A==
X-Received: by 2002:a05:6512:3a95:b0:481:4d0:1da2 with SMTP id
 q21-20020a0565123a9500b0048104d01da2mr9077306lfu.327.1656681389119; 
 Fri, 01 Jul 2022 06:16:29 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a2e8050000000b0025be65ff611sm1298395ljg.46.2022.07.01.06.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 06:16:28 -0700 (PDT)
Date: Fri, 1 Jul 2022 15:16:26 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Iris Chen <irischenlj@fb.com>, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, patrick@stwcx.xyz, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org,
 dz4list@gmail.com
Subject: Re: [PATCH 1/2] hw: m25p80: Add Block Protect and Top Bottom bits
 for write protect
Message-ID: <20220701131625.GA16475@fralle-msi>
References: <20220627185234.1911337-1-irischenlj@fb.com>
 <20220627185234.1911337-2-irischenlj@fb.com>
 <20220701114004.GF10629@fralle-msi>
 <b3366184-2989-b1a2-7ff5-c8f850582bec@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3366184-2989-b1a2-7ff5-c8f850582bec@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
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

On [2022 Jul 01] Fri 14:23:17, Cédric Le Goater wrote:
> On 7/1/22 13:40, Francisco Iglesias wrote:
> > Hi Iris,
> > 
> > Looks good, a couple of minor comments below!
> > 
> > On [2022 Jun 27] Mon 11:52:33, Iris Chen wrote:
> > > Signed-off-by: Iris Chen <irischenlj@fb.com>
> > > ---
> > >   hw/block/m25p80.c | 74 +++++++++++++++++++++++++++++++++++++++--------
> > >   1 file changed, 62 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > > index 50b523e5b1..0156a70f5e 100644
> > > --- a/hw/block/m25p80.c
> > > +++ b/hw/block/m25p80.c
> > > @@ -38,21 +38,19 @@
> > >   #include "trace.h"
> > >   #include "qom/object.h"
> > > -/* Fields for FlashPartInfo->flags */
> > > -
> > > -/* erase capabilities */
> > > -#define ER_4K 1
> > > -#define ER_32K 2
> > > -/* set to allow the page program command to write 0s back to 1. Useful for
> > > - * modelling EEPROM with SPI flash command set
> > > - */
> > > -#define EEPROM 0x100
> > > -
> > >   /* 16 MiB max in 3 byte address mode */
> > >   #define MAX_3BYTES_SIZE 0x1000000
> > > -
> > >   #define SPI_NOR_MAX_ID_LEN 6
> > > +/* Fields for FlashPartInfo->flags */
> > > +enum spi_nor_option_flags {
> > 
> > (A suggestion is to s/nor/flash/ above (and s/SNOR_F_//  below) since there
> > looks to be nand flashes as W25N01GV using the protocol to).
> > 
> > > +    ER_4K                  = BIT(0),
> > > +    ER_32K                 = BIT(1),
> > > +    EEPROM                 = BIT(2),
> > > +    SNOR_F_HAS_SR_TB       = BIT(3),
> > > +    SNOR_F_HAS_SR_BP3_BIT6 = BIT(4),
> > > +};
> > > +
> > >   typedef struct FlashPartInfo {
> > >       const char *part_name;
> > >       /*
> > > @@ -253,7 +251,8 @@ static const FlashPartInfo known_devices[] = {
> > >       { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
> > >       { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> > >       { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> > > -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> > > +    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
> > > +           ER_4K | SNOR_F_HAS_SR_BP3_BIT6 | SNOR_F_HAS_SR_TB) },
> > >       { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> > >       { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
> > >       { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
> > > @@ -480,6 +479,11 @@ struct Flash {
> > >       bool reset_enable;
> > >       bool quad_enable;
> > >       bool aai_enable;
> > > +    bool block_protect0;
> > > +    bool block_protect1;
> > > +    bool block_protect2;
> > > +    bool block_protect3;
> > > +    bool top_bottom_bit;
> > >       bool status_register_write_disabled;
> > >       uint8_t ear;
> > > @@ -630,6 +634,29 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
> > >           qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
> > >           return;
> > >       }
> > > +    uint32_t block_protect_value = (s->block_protect3 << 3) |
> > > +                                   (s->block_protect2 << 2) |
> > > +                                   (s->block_protect1 << 1) |
> > > +                                   (s->block_protect0 << 0);
> > > +
> > > +     uint32_t num_protected_sectors = 1 << (block_protect_value - 1);
> > > +     uint32_t sector = addr / s->pi->sector_size;
> > > +
> > > +     /* top_bottom_bit == 0 means TOP */
> > 
> > Indentation needs minor fixing on above lines, also the declarations should
> > be at the top of the function.
> 

Hi Cédric,

> I agree in that case it would be better to have at the top
> but checkpatch does not complain. What's the rule ?
> 

Below is taken from docs/devel/style.rst:

"
Declarations
============

Mixed declarations (interleaving statements and declarations within
blocks) are generally not allowed; declarations should be at the beginning
of blocks.

Every now and then, an exception is made for declarations inside a
#ifdef or #ifndef block: if the code looks nicer, such declarations can
be placed at the top of the block even if there are statements above.
On the other hand, however, it's often best to move that #ifdef/#ifndef
block to a separate function altogether
"

I understand above as this is generally not allowed but in case you would
prefer to keep the declarations as they are placed one can see this as 'code
looks nicer' (to me the loop case is often cleaner in the way you are
mentioning). I should though have been more clear that 'moving to the top' was
a suggestion for not breaking this 'general rule' (also in case I've
interpreted this wrongly), sorry for that!

Best regards,
Francisco Iglesias

> For loop indexes, I do prefer to declare in the block
> statement.
> 
> > 
> > > +    if (!s->top_bottom_bit) {
> > > +        if (block_protect_value > 0 &&
> > > +            s->pi->n_sectors <= sector + num_protected_sectors) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > +                          "M25P80: write with write protect!\n");
> > > +            return;
> > > +        }
> > > +    } else {
> > > +        if (block_protect_value > 0 && sector < num_protected_sectors) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > +                          "M25P80: write with write protect!\n");
> > > +            return;
> > > +        }
> > > +    }
> > >       if ((prev ^ data) & data) {
> > >           trace_m25p80_programming_zero_to_one(s, addr, prev, data);
> > > @@ -728,6 +755,15 @@ static void complete_collecting_data(Flash *s)
> > >           break;
> > >       case WRSR:
> > >           s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> > > +        s->block_protect0 = extract32(s->data[0], 2, 1);
> > > +        s->block_protect1 = extract32(s->data[0], 3, 1);
> > > +        s->block_protect2 = extract32(s->data[0], 4, 1);
> > > +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> > > +            s->top_bottom_bit = extract32(s->data[0], 5, 1);
> > > +        }
> > > +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> > > +            s->block_protect3 = extract32(s->data[0], 6, 1);
> > > +        }
> > >           switch (get_man(s)) {
> > >           case MAN_SPANSION:
> > > @@ -1213,6 +1249,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> > >       case RDSR:
> > >           s->data[0] = (!!s->write_enable) << 1;
> > >           s->data[0] |= (!!s->status_register_write_disabled) << 7;
> > > +        s->data[0] |= (!!s->block_protect0) << 2;
> > > +        s->data[0] |= (!!s->block_protect1) << 3;
> > > +        s->data[0] |= (!!s->block_protect2) << 4;
> > > +        if (s->pi->flags & SNOR_F_HAS_SR_TB) {
> > > +            s->data[0] |= (!!s->top_bottom_bit) << 5;
> > > +        }
> > > +        if (s->pi->flags & SNOR_F_HAS_SR_BP3_BIT6) {
> > > +            s->data[0] |= (!!s->block_protect3) << 6;
> > > +        }
> > >           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
> > >               s->data[0] |= (!!s->quad_enable) << 6;
> > > @@ -1553,6 +1598,11 @@ static void m25p80_reset(DeviceState *d)
> > >       s->wp_level = true;
> > >       s->status_register_write_disabled = false;
> > > +    s->block_protect0 = false;
> > > +    s->block_protect1 = false;
> > > +    s->block_protect2 = false;
> > > +    s->block_protect3 = false;
> > > +    s->top_bottom_bit = false;
> > 
> > We need to place above ones in a subsection in the vmstate (similar to the your
> > previous patch).
> 
> Ah yes. I keep forgetting these ...
> 
> Thanks for the second look Francisco.
> 
> C.
> 
> 
> > 
> > Looks good to me otherwise!
> > 
> > Thanks!
> > Best regards,
> > Francisco Iglesias
> > 
> > >       reset_memory(s);
> > >   }
> > > -- 
> > > 2.30.2
> > > 
> > > 
> 

