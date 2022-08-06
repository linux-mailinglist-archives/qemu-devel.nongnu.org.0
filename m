Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181058B53B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 13:24:17 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKHui-0005iE-Oi
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 07:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKHt3-0004Dr-7n; Sat, 06 Aug 2022 07:22:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKHt0-0006Xz-NF; Sat, 06 Aug 2022 07:22:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 83B18746335;
 Sat,  6 Aug 2022 13:22:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D784A7462D3; Sat,  6 Aug 2022 13:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D5BE2745702;
 Sat,  6 Aug 2022 13:22:25 +0200 (CEST)
Date: Sat, 6 Aug 2022 13:22:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH] hw/ppc: ppc440_uc: avoid multiply overflow in
 dcr_write_dma()
In-Reply-To: <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
Message-ID: <1ecd8b2-4ab4-70b1-c5d3-7c733d8ab42@eik.bme.hu>
References: <20220805205435.139286-1-danielhb413@gmail.com>
 <326fba13-13e7-f327-bfd-f86aa0fe1211@eik.bme.hu>
 <35d24b84-14ee-fc74-bb6f-7166aaa5cb70@gmail.com>
 <42fdccf1-6ce5-a318-3893-04448c4ef3fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 6 Aug 2022, Daniel Henrique Barboza wrote:
> Balaton,
>
> I had a change of heart. The code is too clear that it won't overflow.
> It felt overkill changing var types just for that.
>
> Peter already marked it as Ignored - False Positive in Coverity as well.
> So this would be a code change to "look better". It didn't look particularly
> better after the changes I was about to send, so let's forget about it.

Fine with me. I may look at it later when Peter's second patch changing 
this code lands if there are any cleanups possible, I've noticed that now 
that we have xferlen = count * width it could be used elsewehere where 
that product appears for example. At that point I'll see if the type can 
be changed too. Until then it's fine as it is now.

Regards,
BALATON Zoltan

