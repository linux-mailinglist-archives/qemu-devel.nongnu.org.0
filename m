Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFB23FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 20:05:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmfI-0007lC-49
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 14:05:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hSmWq-0002sg-52
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hSmWn-0004pb-Ti
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:56:51 -0400
Received: from charlie.dont.surf ([128.199.63.193]:50196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hSmWh-0004lV-Bv; Mon, 20 May 2019 13:56:44 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
	[5.186.120.196])
	by charlie.dont.surf (Postfix) with ESMTPSA id 02FB6BF42F;
	Mon, 20 May 2019 17:56:39 +0000 (UTC)
Date: Mon, 20 May 2019 19:56:36 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <20190520175636.GA20507@apples.localdomain>
Mail-Followup-To: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
	Keith Busch <keith.busch@intel.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	"Heitke, Kenneth" <kenneth.heitke@intel.com>, qemu-devel@nongnu.org
References: <20190518073905.17178-1-klaus@birkelund.eu>
	<20190520150557.GE25092@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520150557.GE25092@localhost.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: Re: [Qemu-devel] [PATCH] nvme: fix copy direction in DMA reads
 going to CMB
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, "Heitke,
	Kenneth" <kenneth.heitke@intel.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 20, 2019 at 09:05:57AM -0600, Keith Busch wrote:
> On Sat, May 18, 2019 at 09:39:05AM +0200, Klaus Birkelund Jensen wrote:
> > `nvme_dma_read_prp` erronously used `qemu_iovec_*to*_buf` instead of
> > `qemu_iovec_*from*_buf` when the request involved the controller memory
> > buffer.
> > 
> > Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
> 
> I was wondering how this mistake got by for so long, and it looks like
> the only paths here require an admin command with dev->host transfer
> to CMB. That's just not done in any host implementation I'm aware of
> since it'd make it more difficult to use for no particular gain AFAICS,
> so I'd be curious to hear if you have a legit implementation doing this.
> 

I'm just trying to get the device to be as compliant as possible, but I
don't know why you'd have any reason to do a, say Get Feature, to the
CMB.

