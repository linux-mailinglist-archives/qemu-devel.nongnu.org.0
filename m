Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED3A1D22BB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 01:08:12 +0200 (CEST)
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ0Tz-0007wm-4P
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 19:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jZ0TG-0007E1-Gx
 for qemu-devel@nongnu.org; Wed, 13 May 2020 19:07:26 -0400
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:36709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jZ0TE-0001E0-W9
 for qemu-devel@nongnu.org; Wed, 13 May 2020 19:07:26 -0400
Received: from player791.ha.ovh.net (unknown [10.108.42.5])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id B030213C537
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 01:07:21 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 8497512471372;
 Wed, 13 May 2020 23:07:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001517004d4-e67e-49bd-8c89-060d26047845,35CE032151D79A3AF3D4DB1C17342E10B4F8B631)
 smtp.auth=groug@kaod.org
Date: Thu, 14 May 2020 01:07:13 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 0/2] 9pfs: regression init_in_iov_from_pdu truncating size
Message-ID: <20200514010713.492e0c82@bahia.lan>
In-Reply-To: <20200512113823.3c292c27@bahia.lan>
References: <cover.1589132512.git.qemu_oss@crudebyte.com>
 <20200512113823.3c292c27@bahia.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9054768528132118848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrleehgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuedvtefgfeeukeekgeeukefhueekheetffevledvfeevvdfgveethfeghfevhfenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeluddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.46.122; envelope-from=groug@kaod.org;
 helo=8.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 19:07:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 11:38:23 +0200
Greg Kurz <groug@kaod.org> wrote:

> On Sun, 10 May 2020 19:41:52 +0200
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> 
> > Stefano, looks like your original patch needs some more fine tuning:
> > 
> > https://bugs.launchpad.net/bugs/1877688
> > 
> > Please check if the assumptions I made about Xen are correct, and please
> > also test whether these changes still work for you with Xen as intended by
> > you.
> > 
> > Christian Schoenebeck (2):
> >   xen-9pfs: Fix log messages of reply errors
> >   9pfs: fix init_in_iov_from_pdu truncating size
> > 
> >  hw/9pfs/virtio-9p-device.c | 35 ++++++++++++++++++++++++--------
> >  hw/9pfs/xen-9p-backend.c   | 41 ++++++++++++++++++++++++++++----------
> >  2 files changed, 58 insertions(+), 18 deletions(-)
> > 
> 
> Sorry, I'm off this week, not sure I'll have time to review.
> So I've only applied patch 1 for now and I'll let Stefano
> and you sort out what should be done for patch 2.
> 

IIUC this requires more thinking and may end up in a complete rewrite of
the truncating logic. I intend to send a PR soon : is it worth keeping
patch 1 anyway ? 

> Cheers,
> 
> --
> Greg
> 


