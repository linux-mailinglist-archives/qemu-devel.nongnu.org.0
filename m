Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0764E58B6CD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKMd6-0007SO-OG
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 12:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKMbL-0005l9-KF; Sat, 06 Aug 2022 12:24:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:26824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKMbJ-0001aq-5H; Sat, 06 Aug 2022 12:24:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4B4E974635D;
 Sat,  6 Aug 2022 18:24:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 15EBB746335; Sat,  6 Aug 2022 18:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1439D745702;
 Sat,  6 Aug 2022 18:24:27 +0200 (CEST)
Date: Sat, 6 Aug 2022 18:24:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
In-Reply-To: <CAFEAcA8GrZO6JtdBJbP4r-Znv5kNSROtGqkpOUo5kJoGsVC_yQ@mail.gmail.com>
Message-ID: <2218e532-e0e-ce7-e149-f6b9de4dcaf3@eik.bme.hu>
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
 <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
 <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
 <1ecd8b2-4ab4-70b1-c5d3-7c733d8ab42@eik.bme.hu>
 <CAFEAcA8GrZO6JtdBJbP4r-Znv5kNSROtGqkpOUo5kJoGsVC_yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 6 Aug 2022, Peter Maydell wrote:
> On Sat, 6 Aug 2022 at 12:24, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I may look at it later when Peter's second patch changing
>> this code lands if there are any cleanups possible
>
> You mean the 2nd patch I sent in that RFC series? I'm not

Yes I mean that patch.

> currently totally sure what I want to do with that. Looking
> at the code and at the docs that describe how the device
> works, there's definitely quite a bit of missing
> functionality. So I'm sort of undecided between "do a fair

As the original commit message says I only aimed for the functionality 
AmigaOS seems to use and did not try to implement everything. What we have 
now seems to be enough for AmigaOS but I don't know if there are any other 
functionality it may want to use in rare cases that I don't know about or 
there are other guests that would do so.

> bit of overhaul to the device to fix up the more obviously
> missing pieces (but without much ability to test the changes)"
> and "just leave the code as it is in git at the moment, since
> it's sufficient for the only guest we know touches it to be
> able to boot". What would you prefer?

I won't stop you if you want to improve this device but I also don't know 
how to test it apart from verifying AmigaOS still boots and works. It did 
with your second patch (I've sent a Tested-by) and I'll test any further 
patches. So just fixing the obviously wrong parts without adding any new 
functionality is probably enough if you don't want to spend too much time 
with it. I'll try to gather some traces on how AmigaOS uses it to help you 
to judge what's needed.

Thank you,
BALATON Zoltan

