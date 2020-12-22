Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0702E0CEB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:52:45 +0100 (CET)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krjxs-0000dh-42
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krjwh-0008RF-PD; Tue, 22 Dec 2020 10:51:31 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krjwg-0002cg-0B; Tue, 22 Dec 2020 10:51:31 -0500
Received: by mail-yb1-xb31.google.com with SMTP id y128so12061590ybf.10;
 Tue, 22 Dec 2020 07:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sf9Yb60BI5GksMy94aUiemAA7RLcOCpCyxO6c6TRKto=;
 b=W0rr+nG34pWRMSQa8BkoQERjRYnA1mVatd/LGLLC+9YTr0rdRhOSzGXS07AdwwDFDi
 ZIk8tCzauXaVfXe56n/xiAgSeifyYIxfnyehgBWgkbUnUQLoi6aEEmGpQaS478RVdbt+
 Xg62Z7HsnIktHjbJGzSHiiOw/HNPU6FBfWPGTHSR/6gntT0FnDZg1Jr5w0EYYItw8hsn
 BEYjlPlcPwpMfXX0n2jsxGn61WMaq7oMWfLHPbEwbEsnDVQfmyfTRRW47IZ4E5x/9ycU
 /nOK4jU88ncCgF/LBzF1aLjvMUPaNkmwpiSCH4ue0ie8Wbz1NSUrhW6mueXneEtsJEPw
 JbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sf9Yb60BI5GksMy94aUiemAA7RLcOCpCyxO6c6TRKto=;
 b=h5h67QDhI7SW7lcyMWUp4W/prrEKK38Pupc0Q4Cgy6Vq40dxurOp2o57kWe2P+3aTG
 YKGSzRvzRc7eFdEraCoYaNBO2qr+DeGVoYT61XYdBWBQ+fio1wBNL8zy5zasijNl+Z7a
 uHnmZC89nz4jBz0hbuXoQMfnMnpAyygxd2JpeZEowVlpu+vzNy5UQhVuvVE/fzyNlLYP
 495W5YXEFv2SSibFKI1I+Gs7lnmAI0Epdvpu3+nrHL+qOF8HzKNOhWEvFuDbHgu7meNI
 uwxL0FpHrr96ixVFAdOxTcuqIo2imc3/FXwgEYaTsKcrknaIyW+jvlPSzL/hTDsDRcja
 qOzA==
X-Gm-Message-State: AOAM5315x8fbunvgnAvxNwO5wCmsq6hXz6MK8z9aG593PKG0DKr3rQJM
 fioL1h9PRmpn4zRWwFhFu074DS0ytzIsI2xfAh0=
X-Google-Smtp-Source: ABdhPJzxgaQSMEvxI7k5h7qWQ+ZZyLxOc7jOVSGPHM55W3DWmZArn41xMWACSmcLyMmwZvAVuK8ZV2lXLGVngqwO/XM=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr32068600ybo.387.1608652288663; 
 Tue, 22 Dec 2020 07:51:28 -0800 (PST)
MIME-Version: 1.0
References: <1608619520-62782-1-git-send-email-bmeng.cn@gmail.com>
 <1608619520-62782-2-git-send-email-bmeng.cn@gmail.com>
 <20201222154319.GA26555@fralle-msi>
In-Reply-To: <20201222154319.GA26555@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 23:51:16 +0800
Message-ID: <CAEUhbmXhPmvmW+qRvOhy=dfva7+vS=_jP_C04=_1nOeX3aopvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hw/block: m25p80: Implement AAI-WP command support
 for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Tue, Dec 22, 2020 at 11:43 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> A couple of minor comments only!
>
> On [2020 Dec 22] Tue 14:45:20, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Auto Address Increment (AAI) Word-Program is a special command of
> > SST flashes. AAI-WP allows multiple bytes of data to be programmed
> > without re-issuing the next sequential address location.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v4:
> > - simplify is_valid_aai_cmd()
> > - use a subsection for s->aai_enable vm state
> >
> > Changes in v3:
> > - initialize aai_enable to false in reset_memory()
> >
> > Changes in v2:
> > - add aai_enable into the vmstate
> > - validate AAI command before decoding a new command
> > - log guest errors during AAI_WP command handling
> > - report AAI status in the status register
> > - abort AAI programming when address is wrapped
> > - make sure AAI programming starts from the even address
> >
> >  hw/block/m25p80.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 236e1b4..d37b4d8 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -359,6 +359,7 @@ typedef enum {
> >      QPP_4 = 0x34,
> >      RDID_90 = 0x90,
> >      RDID_AB = 0xab,
> > +    AAI_WP = 0xad,
> >
> >      ERASE_4K = 0x20,
> >      ERASE4_4K = 0x21,
> > @@ -449,6 +450,7 @@ struct Flash {
> >      bool four_bytes_address_mode;
> >      bool reset_enable;
> >      bool quad_enable;
> > +    bool aai_enable;
> >      uint8_t ear;
> >
> >      int64_t dirty_page;
> > @@ -664,6 +666,11 @@ static void complete_collecting_data(Flash *s)
> >      case PP4_4:
> >          s->state = STATE_PAGE_PROGRAM;
> >          break;
> > +    case AAI_WP:
> > +        /* AAI programming starts from the even address */
> > +        s->cur_addr &= ~BIT(0);
> > +        s->state = STATE_PAGE_PROGRAM;
> > +        break;
> >      case READ:
> >      case READ4:
> >      case FAST_READ:
> > @@ -762,6 +769,7 @@ static void reset_memory(Flash *s)
> >      s->write_enable = false;
> >      s->reset_enable = false;
> >      s->quad_enable = false;
> > +    s->aai_enable = false;
> >
> >      switch (get_man(s)) {
> >      case MAN_NUMONYX:
> > @@ -932,6 +940,11 @@ static void decode_qio_read_cmd(Flash *s)
> >      s->state = STATE_COLLECTING_DATA;
> >  }
> >
> > +static bool is_valid_aai_cmd(uint32_t cmd)
> > +{
> > +    return cmd == AAI_WP || cmd == WRDI || cmd == RDSR;
> > +}
> > +
> >  static void decode_new_cmd(Flash *s, uint32_t value)
> >  {
> >      int i;
> > @@ -943,6 +956,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >          s->reset_enable = false;
> >      }
> >
> > +    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "M25P80: Invalid cmd within AAI programming sequence");
> > +    }
> > +
> >      switch (value) {
> >
> >      case ERASE_4K:
> > @@ -1008,6 +1026,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >
> >      case WRDI:
> >          s->write_enable = false;
> > +        if (get_man(s) == MAN_SST) {
> > +            s->aai_enable = false;
> > +        }
> >          break;
> >      case WREN:
> >          s->write_enable = true;
> > @@ -1018,6 +1039,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >          if (get_man(s) == MAN_MACRONIX) {
> >              s->data[0] |= (!!s->quad_enable) << 6;
> >          }
> > +        if (get_man(s) == MAN_SST) {
> > +            s->data[0] |= (!!s->aai_enable) << 6;
> > +        }
> > +
> >          s->pos = 0;
> >          s->len = 1;
> >          s->data_read_loop = true;
> > @@ -1160,6 +1185,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >      case RSTQIO:
> >          s->quad_enable = false;
> >          break;
> > +    case AAI_WP:
> > +        if (get_man(s) == MAN_SST) {
> > +            if (s->write_enable) {
> > +                if (s->aai_enable) {
> > +                    s->state = STATE_PAGE_PROGRAM;
> > +                } else {
> > +                    s->aai_enable = true;
> > +                    s->needed_bytes = get_addr_length(s);
> > +                    s->state = STATE_COLLECTING_DATA;
> > +                }
> > +            } else {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                              "M25P80: AAI_WP with write protect\n");
> > +            }
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
> > +        }
> > +        break;
> >      default:
> >          s->pos = 0;
> >          s->len = 1;
> > @@ -1205,6 +1248,19 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
> >          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
> >          flash_write8(s, s->cur_addr, (uint8_t)tx);
> >          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
> > +
> > +        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {
> > +            /*
> > +             * There is no wrap mode during AAI programming once the highest
> > +             * unprotected memory address is reached. The Write-Enable-Latch
> > +             * bit is automatically reset, and AAI programming mode aborts.
> > +             */
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "M25P80: AAI highest memory address reached");
>
> Above message will be printed after writing the highest addressed byte but
> before trying to write a byte after wrapping. Since it wouldn't be a guest
> error (to write the final byte) perhaps we should remove it?
> (An option is to swap it to a trace event instead also)

Agree. This is not an error. Will update in the next version.

>
> > +            s->write_enable = false;
> > +            s->aai_enable = false;
> > +        }
> > +
> >          break;
> >
> >      case STATE_READ:
> > @@ -1350,6 +1406,24 @@ static const VMStateDescription vmstate_m25p80_data_read_loop = {
> >      }
> >  };
> >
> > +static bool m25p80_aai_enable_needed(void *opaque)
> > +{
> > +    Flash *s = (Flash *)opaque;
> > +
> > +    return get_man(s) == MAN_SST;
>
> For only using the subsection if really needed (and restricting further)
> we can swap above to:
>
> return s->aai_enable;

Will do. Thanks!

Regards,
Bin

