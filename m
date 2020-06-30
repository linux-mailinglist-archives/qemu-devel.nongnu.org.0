Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660120EA93
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 03:05:04 +0200 (CEST)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jq4hq-0001JG-AE
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 21:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jq4gc-0000nB-QI; Mon, 29 Jun 2020 21:03:46 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:58900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jq4gZ-0003pP-P8; Mon, 29 Jun 2020 21:03:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7906874594E;
 Tue, 30 Jun 2020 03:03:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 37B3C745712; Tue, 30 Jun 2020 03:03:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 330107456F8;
 Tue, 30 Jun 2020 03:03:38 +0200 (CEST)
Date: Tue, 30 Jun 2020 03:03:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/ppc/ppc4xx: Only accept (combination of) pow2 DDR sizes
In-Reply-To: <20200629200256.2240-1-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2006300250390.32453@zero.eik.bme.hu>
References: <20200629200256.2240-1-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1747750601-1593479018=:32453"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1747750601-1593479018=:32453
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 29 Jun 2020, Philippe Mathieu-Daudé wrote:
> Use popcount instruction to count the number of bits set in
> the RAM size. Allow at most 1 bit for each bank. This avoid
> using invalid hardware configurations.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/ppc/ppc4xx_devs.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index f1651e04d9..c2484a5695 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -687,6 +687,15 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>     int i;
>     int j;
>
> +    if (ctpop64(size_left) > nr_banks) {
> +        if (nr_banks) {
> +            error_report("RAM size must be a power of 2");
> +        } else {
> +            error_report("RAM size must be the combination of %d powers of 2",
> +                         nr_banks);
> +        }
> +        exit(1);

What is this supposed to fix? Is it a good idea to exit() from a helper? I 
don't think so because the board code should be in control in my opinion 
to decide what it can work with or what it cannot handle and wants to 
abort. So maybe it's better to return error in some way and let board code 
handle it. (We already exit from this function but that was added in 
commit a0258e4afa1 when the size fix up was removed due to memdev. That 
exit uses EXIT_FAILURE constant.)

Regards,
BALATON Zoltan

> +    }
>     for (i = 0; i < nr_banks; i++) {
>         for (j = 0; sdram_bank_sizes[j] != 0; j++) {
>             bank_size = sdram_bank_sizes[j];
>
--3866299591-1747750601-1593479018=:32453--

