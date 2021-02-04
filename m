Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488130F81B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:40:07 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hfp-00075x-V3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7hBr-0000HE-Ia
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:09:07 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7hBl-0007BU-U0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:09:04 -0500
Received: by mail-oi1-f181.google.com with SMTP id w8so4247576oie.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfMaqSGNF3zWTZbScypkNamSnNfvASiBsDy5K9A/Xts=;
 b=guRapbo2vgtXh06oIxUPHUZHIN/I3QeTjIclHC/nkWiJHNuc9tYRtkiIEgIGbnkLnV
 72i0+xxmmVoOPTsMscgA0jxPhMaxQO0OPrYxd+UB19ME9r6RtW3+g4rcBhSZ8J5pmtHJ
 lrMt2KK5hVEiDTXKDtrJy4ibvmbXLrT5w57mI9UVztYbg9OhUgQ/Avo0aiHmHQpF8Ic6
 CKtshPeklKOryhYALe++xj/r+qnAM96+jt4nVNKZIHP7pJdrPD9k3z5bC4oGBPFmqRO3
 76IdaejCpVcdXVdBwFRckSWK8N8v2v2Lh1pLOs1Ou6kQUrTt0u43PkdeaCbkC65D58R9
 bLVg==
X-Gm-Message-State: AOAM533WsNScbbxeZfJrzz+ILQXsspOp5rOGGWkQaQZH5YxETFukc9A8
 bfJY9L81oK00+iPoNwbEtbTiwCUZSyolfxBT9wI=
X-Google-Smtp-Source: ABdhPJyK6V/WTqeMyEkHX7/hFBaKei748bIzJOlruyiFtjkN/S6iRwIviCd08VmoxT8V11dptQyKzwpZgJFQuemownQ=
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr110912oih.46.1612454940633; 
 Thu, 04 Feb 2021 08:09:00 -0800 (PST)
MIME-Version: 1.0
References: <28457ae1-7e9b-4428-cb10-3b79ebeac8d0@linaro.org>
 <19D304C1-6401-4D16-AB54-DD19C978D04D@redhat.com>
 <db32a1f5-ad73-a341-f5e7-1c8f592d3d5b@redhat.com>
 <bd7154e1-4d6c-5b98-9e80-ec04f8476373@redhat.com>
 <20210204090351.GN30079@redhat.com>
 <20210204092916.GS27779@redhat.com>
 <b94570e3-9f87-d259-a338-adef1d552d1a@redhat.com>
 <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
In-Reply-To: <e1bc591d-009f-3b0f-83a0-36095efff7ee@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 4 Feb 2021 17:08:49 +0100
Message-ID: <CAAdtpL5goR-Tiv7T0OWnrmEHs2D6-ryx0gVX043wCLdk2hQuMw@mail.gmail.com>
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: David Hildenbrand <david@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.181;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 4, 2021 at 5:04 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> On 2/4/21 10:37 AM, David Hildenbrand wrote:
> > On 04.02.21 10:29, Richard W.M. Jones wrote:
> >>>> commit 8f17a975e60b773d7c366a81c0d9bbe304f30859
> >>>> Author: Richard Henderson <richard.henderson@linaro.org>
> >>>> Date:   Mon Mar 30 19:52:02 2020 -0700
> >>>>
> >>>>      tcg/optimize: Adjust TempOptInfo allocation
> >>>>
> >>>> The image boots just fine on s390x/TCG as well.
> >>>
> >>> Let me try this in a minute on my original test machine.
> >>
> >> I got the wrong end of the stick as David pointed out in the other ema=
il.
> >>
> >> However I did test things again this morning (all on s390 host), and
> >> current head (1ed9228f63ea4b) fails same as before ("mount" command
> >> fails).
> >>
> >> Also I downloaded:
> >>
> >>
> >> https://dl.fedoraproject.org/pub/fedora-secondary/releases/33/Cloud/s3=
90x/images/Fedora-Cloud-Base-33-1.2.s390x.qcow2
> >>
> >>
> >> and booted it on 1ed9228f63ea4b using this command:
> >>
> >>    $ ~/d/qemu/build/s390x-softmmu/qemu-system-s390x -machine accel=3Dt=
cg
> >> -m 2048 -drive
> >> file=3DFedora-Cloud-Base-33-1.2.s390x.qcow2,format=3Dqcow2,if=3Dvirtio
> >> -serial stdio
> >>
> >> Lots of core dumps inside the guest, same as David saw.
> >>
> >> I then reset qemu back to 8f17a975e60b773d ("tcg/optimize: Adjust
> >> TempOptInfo allocation"), rebuilt qemu, tested the same command and
> >> cloud image, and that booted up much happier with no failures or core
> >> dumps.
> >>
> >> Isn't it kind of weird that this would only affect an s390 host?  I
> >> don't understand why the host would make a difference if we're doing
> >> TCG.
> >
> > I assume an existing BUG in the s390x TCG backend ... which makes it
> > harder to debug :)
>
> This seems to fix it:
>
> -- >8 --
> diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
> index 8517e552323..32d03dbfbaf 100644
> --- a/tcg/s390/tcg-target.c.inc
> +++ b/tcg/s390/tcg-target.c.inc
> @@ -1094,10 +1094,16 @@ static int tgen_cmp(TCGContext *s, TCGType type,
> TCGCond c, TCGReg r1,
>                  op =3D (is_unsigned ? RIL_CLFI : RIL_CFI);
>                  tcg_out_insn_RIL(s, op, r1, c2);
>                  goto exit;
> -            } else if (c2 =3D=3D (is_unsigned ? (uint32_t)c2 : (int32_t)=
c2)) {
> -                op =3D (is_unsigned ? RIL_CLGFI : RIL_CGFI);
> -                tcg_out_insn_RIL(s, op, r1, c2);
> -                goto exit;
> +            } else if (is_unsigned) {
> +                if (c2 =3D=3D (uint32_t)c2) {
> +                    tcg_out_insn_RIL(s, RIL_CLGFI, r1, c2);

This path was working,

> +                    goto exit;
> +                }
> +            } else {
> +                if (c2 =3D=3D (int32_t)c2) {
> +                    tcg_out_insn_RIL(s, RIL_CGFI, r1, c2);

but this one not =C2=AF\_(=E3=83=84)_/=C2=AF

> +                    goto exit;
> +                }
>              }
>          }
> ---
>

