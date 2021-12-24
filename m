Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9647EEE5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 13:59:00 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0k9z-0006RT-6D
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 07:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n0k8V-00056K-8I; Fri, 24 Dec 2021 07:57:27 -0500
Received: from [2001:738:2001:2001::2001] (port=31997 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n0k8S-00083L-UH; Fri, 24 Dec 2021 07:57:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4ACD27463B7;
 Fri, 24 Dec 2021 13:57:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2FE2D746353; Fri, 24 Dec 2021 13:57:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2DC2E7462D3;
 Fri, 24 Dec 2021 13:57:18 +0100 (CET)
Date: Fri, 24 Dec 2021 13:57:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/8] ppc/ppc405: Activate MMU logs
In-Reply-To: <6e2fa6b4-16cd-4c84-0969-a8de82820059@linaro.org>
Message-ID: <c047662-56d9-be64-4b76-fecb9715fcd4@eik.bme.hu>
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-4-clg@kaod.org>
 <6e2fa6b4-16cd-4c84-0969-a8de82820059@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1606727768-1640350638=:56720"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1606727768-1640350638=:56720
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 23 Dec 2021, Richard Henderson wrote:
> On 12/21/21 10:40 PM, Cédric Le Goater wrote:
>> There is no need to deactivate MMU logging at compile time.
>> 
>> Signed-off-by: Cédric Le Goater<clg@kaod.org>
>> ---
>>   target/ppc/mmu_common.c | 4 ++--
>>   target/ppc/mmu_helper.c | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> There's also no need to use #defines.
> You should just remove these and the ifdefs.

I thought the same unless these are disabled by default for performance 
reasons. MMU is already quite slow, would this make it even slower?

Regards,
BALATON Zoltan
--3866299591-1606727768-1640350638=:56720--

