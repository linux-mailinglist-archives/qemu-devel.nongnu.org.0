Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E184E2D700C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:15:56 +0100 (CET)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbid-0000bC-LM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbgm-0008Mk-8y; Fri, 11 Dec 2020 01:14:01 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knbgf-0005Fn-86; Fri, 11 Dec 2020 01:13:56 -0500
Received: by mail-yb1-xb43.google.com with SMTP id 82so157558yby.6;
 Thu, 10 Dec 2020 22:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VtrYZSFfg9ien0BzUBa/ssjhsAPdL4qxXKybxXVsiPE=;
 b=ZHlv4a/sSg0oxsQByNjc5NsJpB+X29KgmVYJSyoIUU/DrzjjiJTYtkpI4HuQD6Vpu2
 zUx2bMMLvcOO4RHUZlPwU25cCtYUW533SpwtrxjK75HZ8CjnTnu0YaOh/1dOFlAl1amf
 2/VL6n++GXiBwEpb2RRpr4Ouh9eYNPwT+4VK1BbgJZ5KLJM0Qz58BJgdxkC8dbQKN9qE
 /nSobo5xGpt3EcZPc5dnZefIQa4NLq3MmqXS+N+yD4FYcwUJPbAmWq4EFHz2bMGMgaZC
 qtDbaAFmZ+c1/Owin5nKX7eRjHO9C4DCBqnPZg+TQTh7rILz8PeuRz9m6raBhZAF1Lxj
 4FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtrYZSFfg9ien0BzUBa/ssjhsAPdL4qxXKybxXVsiPE=;
 b=CZqymbWrFSloszbzemZPQ19UvtS+wSypV6hg5GElKsYOZ7sKNek6PkRH+9B7S92T2v
 GzaYROXK9C1BXYbTWpMchdE2Sc6uKf/C4iHaogyO3FbSUP2rJQjCrlX9/oKf//5giBCE
 VXR16r8ZLTZc38muGUV3z2M+8XeggvHAcyijmTfhDjgNYF/+ES0cG5SNEj0tloRYl3KE
 uZ/mYY6BA9grZ5pN+hCgLPnjrn3ZDJKNacA44rCNjKNzEts77KYngjMLV5kAl1bcVHrl
 ALAYRTXXgy27fKQb+nFOoKdpyNLqsFabZSdd7IgBfuvWXZ6xf45aTrTCGnyvAmCC22fd
 GmTg==
X-Gm-Message-State: AOAM530YLAhbTwskejZz5Sj9vzOEFf3yyoNGGSA1VPfAK+aZP8MCHEbG
 A3gOwp4xvawh6g2n5Kxto5GW6XlA0JfzQKROTSk=
X-Google-Smtp-Source: ABdhPJxehTJ54PGHcSNboaaMEneHHLGPiVBKkcDURR5DlDmTAHoNrsO5FIENYi+1m2auHqw8sd/oXQlVamioIXPkg58=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr15887035ybi.517.1607667231724; 
 Thu, 10 Dec 2020 22:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20201202143037.24110-1-bmeng.cn@gmail.com>
 <20201203125438.GB2661@fralle-msi>
In-Reply-To: <20201203125438.GB2661@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Dec 2020 14:13:39 +0800
Message-ID: <CAEUhbmXw6c3X+kT3+zrVARbp60OMwyroA5L3wobqVm=iwR4Lqw@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Implement AAI-WP command support for
 SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Qemu-block <qemu-block@nongnu.org>, Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Thu, Dec 3, 2020 at 8:54 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Bin,
>
> On [2020 Dec 02] Wed 22:30:37, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Auto Address Increment (AAI) Word-Program is a special command of
> > SST flashes. AAI-WP allows multiple bytes of data to be programmed
> > without re-issuing the next sequential address location.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/block/m25p80.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 9b36762df9..f225d9c96d 100644
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
>
> We need to add above addition also into the vmstate.
>
> >      uint8_t ear;
> >
> >      int64_t dirty_page;
> > @@ -661,6 +663,7 @@ static void complete_collecting_data(Flash *s)
> >      case PP:
> >      case PP4:
> >      case PP4_4:
> > +    case AAI_WP:
> >          s->state = STATE_PAGE_PROGRAM;
> >          break;
> >      case READ:
> > @@ -1010,6 +1013,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>
> Since only 3 cmds are allowed while within AAI programming sequence [1] I think
> a warning migt be good have before the command switch case, similar to:
>
> if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
>     qemu_log_mask(LOG_GUEST_ERROR,
>                   "M25P80: Invalid cmd within AAI programming sequence");
> }
>
> >
> >      case WRDI:
> >          s->write_enable = false;
> > +        if (get_man(s) == MAN_SST) {
> > +            s->aai_enable = false;
> > +        }
> >          break;
> >      case WREN:
> >          s->write_enable = true;
> > @@ -1162,6 +1168,17 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >      case RSTQIO:
> >          s->quad_enable = false;
> >          break;
> > +    case AAI_WP:
> > +        if (get_man(s) == MAN_SST && s->write_enable) {
> > +            if (s->aai_enable) {
> > +                s->state = STATE_PAGE_PROGRAM;
> > +            } else {
> > +                s->aai_enable = true;
> > +                s->needed_bytes = get_addr_length(s);
> > +                s->state = STATE_COLLECTING_DATA;
> > +            }
>
> Perhaps a qemu_log_mask in an 'else' could be useful here also:
>
> } else {
>     qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %s"
>                   (get_man(s) == MAN_SST) ? "AAI_WP with write protect" :
>                                             "Unknown CMD: 0xAD\n");
>
> Lastly, [1] also says that the address shouldn't wrapp around when in AAI mode,
> so we need a check before doing that also I think.
>
> Best regards,
> Francisco Iglesias
>
> [1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf

Thanks for the review. All of your comments will be addressed in v2.

Regards,
Bin

