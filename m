Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E369F5B7A8A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:06:48 +0200 (CEST)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBFA-0001Tk-5M
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYB4H-0008K3-Fn; Tue, 13 Sep 2022 14:55:36 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYB4E-00044d-5Z; Tue, 13 Sep 2022 14:55:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E96F74632B;
 Tue, 13 Sep 2022 20:55:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CBC8874633F; Tue, 13 Sep 2022 20:55:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C9E19746307;
 Tue, 13 Sep 2022 20:55:24 +0200 (CEST)
Date: Tue, 13 Sep 2022 20:55:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/18] ppc4xx_sdram QOMify and clean ups
In-Reply-To: <cover.1663092335.git.balaton@eik.bme.hu>
Message-ID: <df7444c5-6e78-0c-1918-1bdd62f274b6@eik.bme.hu>
References: <cover.1663092335.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-151063393-1663095324=:83903"
X-Spam-Probability: 9%
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-151063393-1663095324=:83903
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 13 Sep 2022, BALATON Zoltan wrote:
> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex.
>
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)

Looks like I made a mistake while rebasing this and some patches were 
inadverently squashed. I'll send a v3 correcting this, please disregard 
this one.

> Regards,
> BALATON Zoltan
>
> BALATON Zoltan (18):
>  ppc440_bamboo: Remove unnecessary memsets
>  ppc4xx: Introduce Ppc4xxSdramBank struct
>  ppc4xx_sdram: Get rid of the init RAM hack
>  ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>  ppc440_bamboo: Add missing 4 MiB valid memory size
>  ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>  ppc4xx_sdram: QOM'ify
>  ppc4xx_sdram: Drop extra zeros for readability
>  ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>  ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>  ppc440_sdram: Rename local variable for readibility
>  ppc440_sdram: Move RAM size check to ppc440_sdram_init
>  ppc440_sdram: QOM'ify
>  ppc4xx_sdram: Move ppc4xx DDR and DDR2 SDRAM controller models
>    together
>  ppc4xx_sdram: Use hwaddr for memory bank size
>  ppc4xx_sdram: Rename local state variable for brevity
>  ppc4xx_sdram: Generalise bank setup
>  ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>
> hw/ppc/meson.build      |   3 +-
> hw/ppc/ppc405.h         |   8 +-
> hw/ppc/ppc405_boards.c  |  22 +-
> hw/ppc/ppc405_uc.c      |  33 +-
> hw/ppc/ppc440.h         |   4 -
> hw/ppc/ppc440_bamboo.c  |  29 +-
> hw/ppc/ppc440_uc.c      | 267 +--------------
> hw/ppc/ppc4xx_devs.c    | 413 -----------------------
> hw/ppc/ppc4xx_sdram.c   | 723 ++++++++++++++++++++++++++++++++++++++++
> hw/ppc/sam460ex.c       |  48 +--
> hw/ppc/trace-events     |   1 +
> include/hw/ppc/ppc4xx.h |  66 +++-
> 12 files changed, 847 insertions(+), 770 deletions(-)
> create mode 100644 hw/ppc/ppc4xx_sdram.c
>
>
--3866299591-151063393-1663095324=:83903--

