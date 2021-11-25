Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262645D77C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 10:43:53 +0100 (CET)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBIF-0001YI-QV
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 04:43:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <segher@kernel.crashing.org>)
 id 1mqBH7-0000ih-BC; Thu, 25 Nov 2021 04:42:41 -0500
Received: from gate.crashing.org ([63.228.1.57]:43768)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <segher@kernel.crashing.org>)
 id 1mqBH3-0001F1-Hg; Thu, 25 Nov 2021 04:42:41 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1AP9c4lr025932;
 Thu, 25 Nov 2021 03:38:05 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1AP9c1FD025924;
 Thu, 25 Nov 2021 03:38:01 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 25 Nov 2021 03:38:01 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
Message-ID: <20211125093801.GM614@gate.crashing.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
User-Agent: Mutt/1.4.2.3i
Received-SPF: pass client-ip=63.228.1.57;
 envelope-from=segher@kernel.crashing.org; helo=gate.crashing.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
> As for guests, those running on the said PowerMac G4 should have support 
> for these CPUs so maybe you can try some Mac OS X versions (or maybe 

OSX uses hardware pagetables.

> MorphOS but that is not the best for debugging as there's no source 
> available nor any help from its owners but just to see if it boots it may 
> be sufficient, it should work on real PowerMac G4).

I have no idea what MorphOS uses, but I bet HPT as well.  That is
because HPT is fastest in general.  Software TLB reloads are good in
special cases only; the most common is real-time OSes, which can use its
lower guaranteed latency for some special address spaces (and can have a
simpler address map in general).


Segher

