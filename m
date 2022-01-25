Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED549B681
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:37:58 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMxJ-0003B7-QI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCLGb-0003z5-3t; Tue, 25 Jan 2022 07:49:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:55480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nCLGX-0008Ry-HO; Tue, 25 Jan 2022 07:49:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CB1AC74634B;
 Tue, 25 Jan 2022 13:49:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 698ED745706; Tue, 25 Jan 2022 13:49:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 678B47456E3;
 Tue, 25 Jan 2022 13:49:36 +0100 (CET)
Date: Tue, 25 Jan 2022 13:49:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 08/14] target/ppc: 405: System call exception
 cleanup
In-Reply-To: <7e2e4d56-4cdf-4f9f-65e4-359453ba20fb@kaod.org>
Message-ID: <f03cfff9-824-b52e-28d9-92e74d5ce7@eik.bme.hu>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-9-farosas@linux.ibm.com> <YeerEWyGu5j+Akeb@yekko>
 <7e2e4d56-4cdf-4f9f-65e4-359453ba20fb@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2111962595-1643114976=:61107"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, Fabiano Rosas <farosas@linux.ibm.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2111962595-1643114976=:61107
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 25 Jan 2022, Cédric Le Goater wrote:
> On 1/19/22 07:09, David Gibson wrote:
>> On Tue, Jan 18, 2022 at 03:44:42PM -0300, Fabiano Rosas wrote:
>>> There's no sc 1.
>> 
>> No... but what exactly should and will happen if you attempt to
>> execute an "sc 1" on 40x.  Will it be treated as an "sc 0", or will it
>> cause a 0x700?  If it's a 0x700, better double check that that is
>> generated at translation time, if you're removing the check on level
>> here.
>
> A Program Interrupt with the illegal instruction error code should be
> generated at translation time but it is not the case today. It never
> was correctly implemented AFAICT :
>
>  /* Top bit of opc2 corresponds with low bit of LEV, so use two handlers */
>  GEN_HANDLER(sc, 0x11, 0x11, 0xFF, 0x03FFF01D, PPC_FLOW),
>  GEN_HANDLER(sc, 0x11, 0x01, 0xFF, 0x03FFF01D, PPC_FLOW),
>
> We would need a simple 'sc' instruction for the PPC405 and other
> processors. Let's add that to the TODO list.

Not directly related to this but as a reminder: if I remember correctly 
VOF uses sc 1 for hypercalls and I use VOF on pegasos2 which has a G4 or 
G3 CPU that does not have this instruction but we emulate that anyway so 
this works now at least with TCG. AFAICT changes so far did not break this 
but please consider this when getting there. We could use a different 
method for hypercalls in VOF but that would either result in different VOF 
binary for different machines or needing more changes to spap,r neither of 
which is desirable, so we chose this solution for now to allow hypercalls 
on 32bit PPC if the vhyp is set. This was in commit 5e994fc019862.

Regards,
BALATON Zoltan
--3866299591-2111962595-1643114976=:61107--

