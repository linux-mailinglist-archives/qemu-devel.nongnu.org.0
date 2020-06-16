Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7921FBBFB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:42:40 +0200 (CEST)
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlEfW-0006pZ-Qr
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jlEek-0006BK-Ji
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:41:50 -0400
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:48197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jlEeh-0001dE-1u
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:41:50 -0400
Received: from player776.ha.ovh.net (unknown [10.108.42.184])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id B630F140ED5
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 18:41:43 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player776.ha.ovh.net (Postfix) with ESMTPSA id 30874137DC99A;
 Tue, 16 Jun 2020 16:41:38 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001f420ef45-4f36-4896-92fc-f4fed9b8791a,6D1193CAFB0197A83E26607BB2BE83A43F9AE14F)
 smtp.auth=groug@kaod.org
Date: Tue, 16 Jun 2020 18:41:36 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 72/78] 9p: Lock directory streams with a CoMutex
Message-ID: <20200616184136.27463d2e@bahia.lan>
In-Reply-To: <2182702.l5DGtSyN0k@silver>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
 <20200616141547.24664-73-mdroth@linux.vnet.ibm.com>
 <20200616171440.172f1173@bahia.lan> <2182702.l5DGtSyN0k@silver>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17746152860616268096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.44.159; envelope-from=groug@kaod.org;
 helo=7.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 12:41:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 18:09:04 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 16. Juni 2020 17:14:40 CEST Greg Kurz wrote:
> > Cc'ing co-maintainer Christian Schoenebeck.
> > 
> > Christian,
> > 
> > If there are some more commits you think are worth being cherry picked
> > for QEMU 4.2.1, please inform Michael before freeze on 2020-06-22.
> 
> Indeed, for that particular stable branch I would see the following 9p fixes
> as additional candidates (chronologically top down):
> 
> 841b8d099c [trivial] 9pfs: local: Fix possible memory leak in local_link()
> 846cf408a4 [maybe] 9p: local: always return -1 on error in local_unlinkat_common
> 9580d60e66 [maybe] virtio-9p-device: fix memleak in virtio_9p_device_unrealize
> 659f195328 [trivial] 9p/proxy: Fix export_flags
> a5804fcf7b [maybe] 9pfs: local: ignore O_NOATIME if we don't have permissions
> 03556ea920 [trivial] 9pfs: include linux/limits.h for XATTR_SIZE_MAX
> a4c4d46272 [recommended] xen/9pfs: yield when there isn't enough room on the ring
> 
> What do you think Greg?
> 

AFAIK, only regressions and fixes to severe bugs (QEMU crashes, hangs, CVEs) go
to stable QEMU releases. It doesn't seem to be the case for any of the commits
listed above but I had only a quick look.

> What's the recommended way for me to keep track of imminent stable picks/
> freezes in future?
> 

Hmm good question. I'm usually notified when Michael posts the patch round-up
and a 9p patch is already in the list, like for the present patch. Other than
that I watch qemu-stable from time to time or the planning pages in the wiki.

Michael, anything better to suggest to Christian ?

> Best regards,
> Christian Schoenebeck
> 
> 


