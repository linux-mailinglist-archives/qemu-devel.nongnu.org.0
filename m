Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247B145EBDB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:43:50 +0100 (CET)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYho-0003eI-AL
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <segher@kernel.crashing.org>)
 id 1mqYgE-00026I-2a; Fri, 26 Nov 2021 05:42:10 -0500
Received: from gate.crashing.org ([63.228.1.57]:35768)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <segher@kernel.crashing.org>)
 id 1mqYgC-0006DW-0V; Fri, 26 Nov 2021 05:42:09 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1AQAbZLC013316;
 Fri, 26 Nov 2021 04:37:36 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1AQAbW5R013308;
 Fri, 26 Nov 2021 04:37:32 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 26 Nov 2021 04:37:32 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
Message-ID: <20211126103732.GP614@gate.crashing.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <20211125093801.GM614@gate.crashing.org>
 <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
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
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

On Fri, Nov 26, 2021 at 09:34:44AM +0100, Cédric Le Goater wrote:
> On 11/25/21 10:38, Segher Boessenkool wrote:
> >On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
> >>As for guests, those running on the said PowerMac G4 should have support
> >>for these CPUs so maybe you can try some Mac OS X versions (or maybe
> >
> >OSX uses hardware pagetables.
> >
> >>MorphOS but that is not the best for debugging as there's no source
> >>available nor any help from its owners but just to see if it boots it may
> >>be sufficient, it should work on real PowerMac G4).
> >
> >I have no idea what MorphOS uses, but I bet HPT as well.  That is
> >because HPT is fastest in general.  Software TLB reloads are good in
> >special cases only; the most common is real-time OSes, which can use its
> >lower guaranteed latency for some special address spaces (and can have a
> >simpler address map in general).
> 
> The support was added to QEMU knowing that Linux didn't handle soft TLBs.
> And the commit says that it was kept disabled initially. I guess that was
> broken these last years.

Ah :-)  So when was it enabled, do you know?

> $ git show 7dbe11acd807
> commit 7dbe11acd807
> Author: Jocelyn Mayer <l_indien@magic.fr>
> Date:   Mon Oct 1 05:16:57 2007 +0000
> 
>     Handle all MMU models in switches, even if it's just to abort because 
>     of lack
>       of supporting code.
>     Implement 74xx software TLB model.
>     Keep 74xx with software TLB disabled, as Linux is not able to handle 
>     TLB miss
>       on those processors.

This is very specifically for 7450, not 7400, fwiw.  7400 is a nice
core, while 7450 is ugly and asymmetric and unbalanced as hell.  It can
be faster though ;-)


Segher

