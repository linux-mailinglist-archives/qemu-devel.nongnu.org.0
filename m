Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977C1F9BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 17:16:28 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkqqZ-0006iN-5z
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 11:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkqp1-0005U2-PM
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 11:14:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:30612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jkqoz-0008Fe-8q
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 11:14:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF3ED746331;
 Mon, 15 Jun 2020 17:14:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B00C3746307; Mon, 15 Jun 2020 17:14:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AE62974594E;
 Mon, 15 Jun 2020 17:14:37 +0200 (CEST)
Date: Mon, 15 Jun 2020 17:14:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/4] sm501: Ignore no-op blits
In-Reply-To: <CAFEAcA_PoKT3RxidPuSoUy9=3-yUC82bn1dJpEpkqVq0VS06Cw@mail.gmail.com>
Message-ID: <alpine.BSF.2.22.395.2006151707580.31485@zero.eik.bme.hu>
References: <cover.1591471056.git.balaton@eik.bme.hu>
 <b62681e58108651b2ca0d2fdbde8281e87185dbb.1591471056.git.balaton@eik.bme.hu>
 <CAFEAcA_PoKT3RxidPuSoUy9=3-yUC82bn1dJpEpkqVq0VS06Cw@mail.gmail.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 11:14:38
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jun 2020, Peter Maydell wrote:
> On Sat, 6 Jun 2020 at 20:22, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> Some guests seem to try source copy blits with same source and dest
>> which are no-op so avoid calling pixman for these.
>
> Are they doing actual source copy blits, or one of the other
> currently-unimplemented op types which we currently fall
> back to doing as source-copy ?

I thought the same but in the cases I've seen the rop was 0xcc which is 
copy source so it looks like an actual source copy blit (this seems to be 
an issue in the guest driver, I've notified appropriate people but not 
sure it's still maintained). Even if it was fallback we wouldn't need to 
do the copy in this case as it changes nothing so we can optimise this 
out. When we implement the missing op that would come before this case so 
this is only for source copy case.

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thank you,
BALATON Zoltan

