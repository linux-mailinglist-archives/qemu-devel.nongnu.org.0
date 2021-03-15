Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC433C866
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:27:46 +0100 (CET)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLukb-0007zY-Gp
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLuj9-0007B4-V4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:26:15 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:33352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLuj8-0005OG-F7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:26:15 -0400
Received: by mail-ot1-f43.google.com with SMTP id
 o19-20020a9d22130000b02901bfa5b79e18so5850914ota.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DFOqLpRGgw1bJiVaHxV+F6AE7qchu2eCtmyXukGcas0=;
 b=hlL0aGdXpAenzN4YM0EF36KkqcSREEz5pf9we8MxCuHfeGuDRqySv30eMYtZhAMMsR
 zjyooFkBkNZAQDxSkr8HhA4ljPm/ncDQG7LPOhutzp8KkmIVPAEYQw0QEQMSkGhXOVzl
 IwI7L2UaP9lqCgENSdJKRd+Cz9QB+Y/EW3mwsXxdRvyyzpe/ee6/Y4ebcTv5H7pmtT0d
 yPxCvTn95TGfJwuXrFMpBQv7VZISock/nt/St3gNfo7MUpX0a5xzvN/uR8ZtYtjfXal2
 56myxM6aiAn/7mZL1KIO0AayLRYTj7Mt7412/bt3CL48qJSoPr/9zBN2YmXTDwCv3Sqm
 PONQ==
X-Gm-Message-State: AOAM5322XoRWJwoCKjEuePxJqMKYD6gslrUgqLmWnJ1/mTQb2RNHv+Ss
 em4kSKahoZrsNh++Eo6xFsfBvGFArcjYSD9SzB0=
X-Google-Smtp-Source: ABdhPJwluFADnSw14Iu/NGEe/s0Il/VGn8gstz6Dr9KlyaK883AZx05GnIYk4MScSakFUuUc9ID0sZ4S9W5WE7992m0=
X-Received: by 2002:a05:6830:15cb:: with SMTP id
 j11mr850898otr.126.1615843573284; 
 Mon, 15 Mar 2021 14:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181217200444.14812-1-aleksandar.markovic@rt-rk.com>
 <20181217200444.14812-6-aleksandar.markovic@rt-rk.com>
 <CAL1e-=gUE7KPL+MwBOd_sb2KocHox-4Davo_SN2fwozBoOa20Q@mail.gmail.com>
 <eface3ff-cafd-da6f-3f6d-30496f168cd9@linaro.org>
In-Reply-To: <eface3ff-cafd-da6f-3f6d-30496f168cd9@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 15 Mar 2021 22:26:01 +0100
Message-ID: <CAAdtpL7_m3t1dPz3DVoj612VdShuL71GPuERvz+4R9HYNUQvuQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/6] target/mips: MXU: Add handlers for
 max/min instructions
To: Richard Henderson <richard.henderson@linaro.org>, "Janeczek,
 Craig" <jancraig@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.43;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 25, 2018 at 8:35 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Sorry I missed the original post, but:
>
> > +    } else if (unlikely((XRb == 0) && (XRc == 0))) {
> > +        /* both operands zero registers -> just set destination to zero */
> > +        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
> > +    } else if (unlikely((XRb == 0) || (XRc == 0))) {
> > +        /* exactly one operand is zero register - find which one is not...*/
> > +        uint32_t XRx = XRb ? XRb : XRc;
> > +        /* ...and do max/min operation with one operand 0 */
> > +        if (opc == OPC_MXU_S32MAX) {
> > +            tcg_gen_smax_i32(mxu_gpr[XRa - 1], mxu_gpr[XRx - 1], 0);
> > +        } else {
> > +            tcg_gen_smin_i32(mxu_gpr[XRa - 1], mxu_gpr[XRx - 1], 0);
> > +        }
> > +    } else if (unlikely(XRb == XRc)) {
> > +        /* both operands same -> just set destination to one of them */
> > +        tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
>
> You should not special case unlikely events, especially when ...
>
> > +    } else {
> > +        /* the most general case */
> > +        if (opc == OPC_MXU_S32MAX) {
> > +            tcg_gen_smax_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1],
> > +                                               mxu_gpr[XRc - 1]);
> > +        } else {
> > +            tcg_gen_smin_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1],
> > +                                               mxu_gpr[XRc - 1]);
> > +        }
>
> ... the normal case will handle those special cases just fine.

Also because we have now 3 Coverity CID:

 *** CID 1450831:    (OVERRUN)
in gen_mxu_D16MAX_D16MIN()
1107             TCGv_i32 t0 = tcg_temp_new();
1108             TCGv_i32 t1 = tcg_const_i32(0);
1109
1110             /* the left half-word first */
1111             tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
1112             if (opc == OPC_MXU_D16MAX) {
>>>     CID 1450831:    (OVERRUN)
>>>     Overrunning array "mxu_gpr" of 15 8-byte elements at element index 4294967295 (byte offset 34359738367) using index "XRa - 1U" (which evaluates to 4294967295).
1113                 tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);

>>>     CID 1450831:    (OVERRUN)
>>>     Overrunning array "mxu_gpr" of 15 8-byte elements at element index 4294967295 (byte offset 34359738367) using index "XRa - 1U" (which evaluates to 4294967295).
1114             } else {
1115                 tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
1116             }
1117
1118             /* the right half-word */
1119             tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0x0000FFFF);

1125             } else {
1126                 tcg_gen_smin_i32(t0, t0, t1);
1127             }
1128             /* return resulting half-words to its original position */
1129             tcg_gen_shri_i32(t0, t0, 16);
1130             /* finally update the destination */
>>>     CID 1450831:    (OVERRUN)
>>>     Overrunning array "mxu_gpr" of 15 8-byte elements at element index 4294967295 (byte offset 34359738367) using index "XRa - 1U" (which evaluates to 4294967295).
1131             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
1132
1133             tcg_temp_free(t1);
1134             tcg_temp_free(t0);
1135         } else if (unlikely(XRb == XRc)) {
1136             /* both operands same -> just set destination to one of them */

