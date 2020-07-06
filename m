Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D41215C18
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 18:43:35 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUDO-0004oo-8N
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 12:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUBB-0001xZ-Gc; Mon, 06 Jul 2020 12:41:17 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUB7-0002yZ-Pl; Mon, 06 Jul 2020 12:41:16 -0400
Received: by mail-io1-xd32.google.com with SMTP id v6so26373667iob.4;
 Mon, 06 Jul 2020 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hte3oKrs3+MNLJi/r32ZEuHwrtV7cBrw01VPyRYeXCc=;
 b=ge2BVElF87zWZYhmdWxLDXCBVH+Rp4TQc6AMLbrFWz9uoFsdbBhB1qdu/AgFMt58Z1
 RYr7dDYaluNposp7Hl4enVaIqOMAX1Lu2T0KgdXXSK0WP6TBIhtSiS07usoi/UGaNvBQ
 qfQljiVIT10zdpPBk5e20oBaxIDdVucvjf+WRIlo7C2MKkf3/nPXxKQc9abuxEGEyopc
 hkfVNp33lxKGEGzFx9+PXXInzglBc4vyKaiQS92KIilPEdCDk5+zFV4S4WzE/Gc3mEc4
 elKSOr1yTqiZBnTaD0vcLw15dg4hgw2rCW6O+UcLqhTjLd25ZQtyJM+1b/x34DmB7Yjv
 BU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hte3oKrs3+MNLJi/r32ZEuHwrtV7cBrw01VPyRYeXCc=;
 b=sPY9a30V3ugexROAE1BFevtH7kxpltz5jm5lFNBuvqzpZ3ho5SeJSTQzgYe9NuQ1b4
 pSxZPXXBY05qrnSTLs8oc/R5A1zDu5RbWFU8p/xfxHbRKUxNLpEmoNbOXDuay8b3TFy8
 DOXQFQtscG47obpJVsh6YnrVCJyR0V9YSW9H5s8BlBr9hpKF/02N3uJxmh+37lKklzeC
 HnBdVISQH/DWu3L2GOo+fYloLzV/1h/GTYg/fztaxF7ITkBNbawpuY1u/8p4AabJDma6
 t1Rz/sG2AVR9G5PKciFftd0LdVL+H+wP1B3jim31COwL5ueYTLpngwx5K9eIj8wCrHju
 GFow==
X-Gm-Message-State: AOAM530rOLBHUOfMaL+XTFlgbm1k7+wyM1O3nazSykYDHWtfmbpYRVPo
 R6WxY9YnecBPiuK16l5PaKqbJ0yafCMe58Kg+90=
X-Google-Smtp-Source: ABdhPJx9fdFpgEkwbliVrb35IryZ6Iap8geCZOGyoW/jzx3ZP38YhCTbLKOMiwiKLXq4Z9ApSNT+xhKMANIJwNabhrQ=
X-Received: by 2002:a6b:8dd1:: with SMTP id
 p200mr26312703iod.118.1594053672235; 
 Mon, 06 Jul 2020 09:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200605102230.21493-1-philmd@redhat.com>
 <7a456fdc-eb53-063b-1d5e-24472b4057d5@redhat.com>
In-Reply-To: <7a456fdc-eb53-063b-1d5e-24472b4057d5@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:31:25 -0700
Message-ID: <CAKmqyKPaQxw4Gw-Fi5X3PT2kBed+Z+iAAuobSAnfCd9hjZ_3QA@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] hw/sd/sdcard: Fix CVE-2020-13253 & cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 8, 2020 at 10:48 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 6/5/20 12:22 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Patches 2 & 3 fix CVE-2020-13253.
> > The rest are (accumulated) cleanups.
> >
> > Supersedes: <20200604182502.24228-1-f4bug@amsat.org>
> >
> > Philippe Mathieu-Daud=C3=A9 (11):
> >   MAINTAINERS: Cc qemu-block mailing list
> >   hw/sd/sdcard: Update coding style to make checkpatch.pl happy
> >   hw/sd/sdcard: Do not switch to ReceivingData if address is invalid
> >   hw/sd/sdcard: Restrict Class 6 commands to SCSD cards
> >   hw/sd/sdcard: Update the SDState documentation
> >   hw/sd/sdcard: Simplify cmd_valid_while_locked()
> >   hw/sd/sdcard: Constify sd_crc*()'s message argument
> >   hw/sd/sdcard: Make iolen unsigned
> >   hw/sd/sdcard: Correctly display the command name in trace events
> >   hw/sd/sdcard: Display offset in read/write_data() trace events
> >   hw/sd/sdcard: Simplify realize() a bit
>
> I forgot to Cc you.
>
> Since you already reviewed a bunch of SD patches in the
> past, do you mind having a look a this series? It should
> be quite trivial.

Hey,

Sorry I took so long but I have reviewed a few. Let me know if there
are anymore you want reviewed.

Alistair

>
> Thanks!
>
> Phil.
>
>

