Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F623F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:50:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmQG-0005CZ-6f
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:50:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbusch@kernel.org>) id 1hSjwT-0003mM-S3
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbusch@kernel.org>) id 1hSjwT-0002O1-2H
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:11:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:60822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbusch@kernel.org>)
	id 1hSjwS-0002Lq-P2; Mon, 20 May 2019 11:11:09 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 08:11:05 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost.localdomain) ([10.232.112.69])
	by fmsmga004.fm.intel.com with ESMTP; 20 May 2019 08:11:04 -0700
Date: Mon, 20 May 2019 09:05:57 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Birkelund Jensen <klaus@birkelund.eu>
Message-ID: <20190520150557.GE25092@localhost.localdomain>
References: <20190518073905.17178-1-klaus@birkelund.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518073905.17178-1-klaus@birkelund.eu>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
X-Mailman-Approved-At: Mon, 20 May 2019 13:41:06 -0400
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

On Sat, May 18, 2019 at 09:39:05AM +0200, Klaus Birkelund Jensen wrote:
> `nvme_dma_read_prp` erronously used `qemu_iovec_*to*_buf` instead of
> `qemu_iovec_*from*_buf` when the request involved the controller memory
> buffer.
> 
> Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>

I was wondering how this mistake got by for so long, and it looks like
the only paths here require an admin command with dev->host transfer
to CMB. That's just not done in any host implementation I'm aware of
since it'd make it more difficult to use for no particular gain AFAICS,
so I'd be curious to hear if you have a legit implementation doing this.

Anyway, thanks for the fix.

