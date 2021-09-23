Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D64157E2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 07:35:46 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTHOa-0001gJ-LU
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 01:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mTHMw-0000rP-1P; Thu, 23 Sep 2021 01:34:02 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mTHMr-0003Bo-5y; Thu, 23 Sep 2021 01:34:01 -0400
Received: by mail-qk1-x72b.google.com with SMTP id i132so18432861qke.1;
 Wed, 22 Sep 2021 22:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VZ04CBmovw4lsw+X4PmWBlemcUfL5aL3wMY1eL8Sql8=;
 b=bMOhcv3pD4LPaGghOyEJUSQMfwTBXoLbtyBW5G1IEww7uFsk1e6Mc2Qf6TCjLgoAfH
 mRaEJST8knTQRUhB0p9G0ONiWA68QafaksB4mZs5ijgnRDtl5J18f8eYrrQOcCCESPPi
 X9Jk2LgroN8R/IUG25cEFbEgFFwnepXZIncGldU1aDAgjm15hiO4OPXDcVmpUSyhBG+9
 LDsv3CcUeV+0Hrib+aHsKAt/NqGMoLpdhBo0gjTHrRo3zwG15CwNHoOYYOKxurQOxTe3
 T/ZDmXblKvq7lvrpqTHYvldiBSNZuYwGblxaz7bbJHsrf8bv+mzQSwPC/UOoAgww8ER2
 ERCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VZ04CBmovw4lsw+X4PmWBlemcUfL5aL3wMY1eL8Sql8=;
 b=uaE3NzMwZjbIVHUiD9IHmneF0AbCynogpx9Ymr/OFnQj1UJB0UrGlygCImpp3L0ifx
 0wCBNFtQ4hCNuC1o3w3vSQ8r3atf0T15RANQ3VIZcQykzMB7ufe0eeVbEJN5mABZ1m75
 H82LJEt50Kt2BD2AG9zLVEHvqh6bVgDISJ3OeHaYjKsZ2ZIKOmPQcb/oMloTCjJipXW3
 hVyY9Pfiy5tRLl2+elKQnrDYU9x+LZ+4qSo7Qt3U5AGJt2SZSkXwLDH49/OHUhqHgoPe
 zaTGSLD6IgQlNtengl1T8xipgOFFaZEJ8QhjuekKle1DiD5gz9kJhdMQ0rLdZTKaMpJ2
 sFpQ==
X-Gm-Message-State: AOAM533dwfO/xY70ZptxhQfF2kMsMtoyKifSfHEttB7ekyiG3qGWhavV
 trVRt5nv5bXqDRFahP/A9uT3CoOtlsGgmwaYrUA=
X-Google-Smtp-Source: ABdhPJyj2Uad8HQ2ikzM5SBzSs9/vxG0xxJmCJW/sVVl9HYrnI89PFB2GmTGpng2rAnY5LmjKIKc5poGPkpoi24r+/g=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr3342319ybe.453.1632375235759; 
 Wed, 22 Sep 2021 22:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210918032653.646370-1-bin.meng@windriver.com>
 <YUlQo68s9mxISwEs@yekko> <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
In-Reply-To: <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 23 Sep 2021 13:33:44 +0800
Message-ID: <CAEUhbmVn3VeGCV25jSXk4G6CRfFuBCX+wFbFKZNPoNKPakEZWA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of
 IPIDR for FSL chipset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Maarten Koning <maarten.koning@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 21, 2021 at 4:13 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 9/21/21 05:25, David Gibson wrote:
> > On Sat, Sep 18, 2021 at 11:26:51AM +0800, Bin Meng wrote:
> >> The reset value of IPIDR should be zero for Freescale chipset, per
> >> the following 2 manuals I checked:
> >>
> >> - P2020RM (https://www.nxp.com/webapp/Download?colCode=3DP2020RM)
> >> - P4080RM (https://www.nxp.com/webapp/Download?colCode=3DP4080RM)
> >>
> >> Currently it is set to 1, which leaves the IPI enabled on core 0
> >> after power-on reset. Such may cause unexpected interrupt to be
> >> delivered to core 0 if the IPI is triggered from core 0 to other
> >> cores later.
> >>
> >> Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > Since these patches are very simple and look sensible, I've applied
> > them to ppc-for-6.2.
> >
> > However, you should note that Greg and I are both moving into other
> > areas and don't have much capacity for ppc maintainership any more.
> > Therefore I'll shortly be sending some MAINTAINERS updates moving
> > openpic (amongst other things) to "Orphan" status.
>
> I'm not trying to force Bin to become (yet) another maintainer,
> but from his previous contributions, he demonstrated a very good
> knowledge of embedded PowerPC ISA & chipsets, his patches have good
> quality and description, and he is consistent over time in his
> contributions. So if he is interested, I'd vouch for him as a
> maintainer for embedded ppc. Now up to him, his time and/or employer :)
>

Thanks Philippe for the offer.

David, is this the whole PowerPC domain will become un-maintained
soon, or is this just openpic and a few other things like a subset of
PowerPC?

I got extensive working experience on Freescale/AMCC PowerPC chipset
in the past, but I never touched anything on the Mac stuff with IBM
chip. And I am not sure if I have enough time to do the work :(

Regards,
Bin

