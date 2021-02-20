Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46431320332
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 03:43:07 +0100 (CET)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDIEc-0006Pb-C8
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 21:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIDa-0005pE-RG; Fri, 19 Feb 2021 21:42:02 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDIDZ-0005P5-5R; Fri, 19 Feb 2021 21:42:02 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id b10so7443283ybn.3;
 Fri, 19 Feb 2021 18:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NSEH60PewGTAtOHs09DuhUg2EBhvy763nABjan+4rLU=;
 b=DQ/Yal3znDD172Y8PhM2jdg5elE9LS+2tMNrNkF20deAhIgKI4IBcWON8Sl6b9FoH9
 EU2g/oLcbaR6fgJZ4xIB2hRVekGORnYe5j4p1B2aELTmmdvBXk9y/lL5TJehiz86bRy2
 YmLTs2jQ/FrEHdEy9W+srqPDanHLVqEx6ztoIzPd0WT+DkdoR7CxP6KbyfXCmPTaern7
 Gcm4GwGouwlRmteI9ldORXjTR2H5v2RnNgA6iMYEZLl08xEyC3ES+4+JAcxbr/prFos6
 FI6+RyD5IJuBNDb+ULz3xfkO29TbsICVq5mqtp7m/DeNaoVetP4HtuZc4GuIAQzuEtWQ
 eV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSEH60PewGTAtOHs09DuhUg2EBhvy763nABjan+4rLU=;
 b=MiCDJNzehx+7aa9KnHbdRnf52UorwqVZF2tyLs6l0BXB2LnMq5P3eBLX7owcAfXAus
 FjKwDtKGTThkxyHyagsk/l9thQdPQP/cDhaipuGNswsLiO1OlK8nquCO4+5xfGfNOOSJ
 AoLcVrkVNTX1xbek3C0wD7lC8gVyG/ZnpoAHZ9SjufXOZQ8xJb24a9scv/0BnMYsXsGT
 qe3rTCOkAXIt8EQKmE3xLU6MKNAVQzhAqVbS2j/hN9bh8YAAp/hXqcXxClODz8sjYTY1
 WyjZASwVXrjQw7nxANJ35nCcKymvPrOKozM9EIgDBKxAtMhW2jZ02vTXwZxIoJhEh/6k
 FN2Q==
X-Gm-Message-State: AOAM5309j1C6YrWKznnxfJ+fJ7pj2L5KIFRaT/mLTdJl/SmO3/GiqwCb
 GzDPAJrVrJkRf7F6/LiV7GyZ1Yf601UrayfCtCBzlD8a
X-Google-Smtp-Source: ABdhPJyw6KuBm+5ah+cch6P8NW+a6ypE72igm7SJA0AG4cy4f835bm1Aekpcbv7WYRdS5V++hYCWyhHVrbzA2udekW4=
X-Received: by 2002:a25:8712:: with SMTP id a18mr17980427ybl.306.1613788919980; 
 Fri, 19 Feb 2021 18:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-7-bmeng.cn@gmail.com>
 <1afba402-8a95-db72-6529-0ac40d20b073@amsat.org>
In-Reply-To: <1afba402-8a95-db72-6529-0ac40d20b073@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 20 Feb 2021 10:41:48 +0800
Message-ID: <CAEUhbmWXdMZhUmH5bhRfQLNDw2G8KeEmfhjfOWSt5u5E7spE2g@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/sd: sd: Actually perform the erase operation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 20, 2021 at 6:28 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 2/16/21 4:02 PM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present the sd_erase() does not erase the requested range of card
> > data to 0xFFs. Let's make the erase operation actually happen.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - honor the write protection bits for SDSC cards
> >
> >  hw/sd/sd.c | 22 ++++++++++++++--------
> >  1 file changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> > index f1f98bdec3..b386f16fcb 100644
> > --- a/hw/sd/sd.c
> > +++ b/hw/sd/sd.c
> > @@ -766,6 +766,9 @@ static void sd_erase(SDState *sd)
> >      uint64_t erase_start =3D sd->erase_start;
> >      uint64_t erase_end =3D sd->erase_end;
> >      bool sdsc =3D true;
> > +    uint64_t wpnum;
> > +    uint64_t erase_addr;
> > +    int erase_len =3D 1 << HWBLOCK_SHIFT;
> >
> >      trace_sdcard_erase(sd->erase_start, sd->erase_end);
> >      if (sd->erase_start =3D=3D INVALID_ADDRESS
> > @@ -794,17 +797,20 @@ static void sd_erase(SDState *sd)
> >      sd->erase_end =3D INVALID_ADDRESS;
> >      sd->csd[14] |=3D 0x40;
> >
> > -    /* Only SDSC cards support write protect groups */
> > -    if (sdsc) {
> > -        erase_start =3D sd_addr_to_wpnum(erase_start);
> > -        erase_end =3D sd_addr_to_wpnum(erase_end);
> > -
> > -        for (i =3D erase_start; i <=3D erase_end; i++) {
> > -            assert(i < sd->wpgrps_size);
> > -            if (test_bit(i, sd->wp_groups)) {
> > +    memset(sd->data, 0xff, erase_len);
> > +    erase_addr =3D erase_start;
> > +    for (i =3D 0; i <=3D (erase_end - erase_start) / erase_len; i++) {
> > +        if (sdsc) {
> > +            /* Only SDSC cards support write protect groups */
> > +            wpnum =3D sd_addr_to_wpnum(erase_addr);
> > +            assert(wpnum < sd->wpgrps_size);
> > +            if (test_bit(wpnum, sd->wp_groups)) {
> >                  sd->card_status |=3D WP_ERASE_SKIP;
> > +                continue;
>
> So if a group is protected, you skip it but don't increase erase_addr.
> If G#4 is protected and G#5 isn't, when you check G#5 you end erasing
> G#4.
>

Oops, good catch!

I will send v2.

> >              }
> >          }
> > +        BLK_WRITE_BLOCK(erase_addr, erase_len);
> > +        erase_addr +=3D erase_len;
> >      }
> >  }

Regards,
Bin

