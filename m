Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA874540D7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 07:22:09 +0100 (CET)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEKc-0006hK-RB
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 01:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4c01cfe20b1e1ad945a+6660+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1mnDtI-0003uh-Sg; Wed, 17 Nov 2021 00:53:52 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4c01cfe20b1e1ad945a+6660+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1mnDtF-0004gt-Sj; Wed, 17 Nov 2021 00:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UZIGL4rir57xpB6m+PG7mTxDJ1KUVpUcHZBCLH0PHdo=; b=e2hLuBq6+Henvq1h68mQi2RirC
 breympNBuViWhFI8zWWYEFkT7RVgELpRyil7x66qDwmIiNV2MWAdWBqu6w4/+1zDz5XKDxf7CP4zC
 G3OExAZdmExmfUsbeZQ9nF/PnyR6w78nkHUm1IrEsMusNUq8ygeUDDBu5It3FfMHONAP5DPRdznHU
 1ahXi+p6h2trapqAulhr7kf8++xVRTa4CvR56U74ES3LW8Kfody02XqzTENHZCjjdViwzKOddv7eC
 Pg737D5IxodBKnLUMCTjiIVNsTJgh8U9uvKL+Usb/GSoFU+fWjJnny9I8Rl1AWqJ0r+ntuiPbOQoo
 Y8crQm4g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mnDt5-003OVl-1w; Wed, 17 Nov 2021 05:53:39 +0000
Date: Tue, 16 Nov 2021 21:53:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Message-ID: <YZSY44T08a2yePpr@infradead.org>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
 <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
 <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
 <YZOO1hD/+AAMB/b5@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZOO1hD/+AAMB/b5@stefanha-x1.localdomain>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=198.137.202.133;
 envelope-from=BATV+f4c01cfe20b1e1ad945a+6660+infradead.org+hch@bombadil.srs.infradead.org;
 helo=bombadil.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Jens Axboe <axboe@kernel.dk>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christoph Hellwig <hch@infradead.org>, "Wang, Kai Z" <kai.z.wang@intel.com>,
 "hreitz@redhat.com" <hreitz@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "Qi, Yadong" <yadong.qi@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 10:58:30AM +0000, Stefan Hajnoczi wrote:
> Question for Jens and Christoph:
> 
> Is there a way for userspace to detect whether a Linux block device
> supports SECDISCARD?

I don't know of one.

> If not, then maybe a new sysfs attribute can be added:

This looks correct, but if we start looking into SECDISCARD seriously
I'd like to split the max_sectors settings for it from discard as that
is currently a bit of a mess.  If we then expose the secure erase max
sectors in sysfs that would also be a good indicator.

What is the use case for exposing secure erase in qemu?  The whole
concept for a LBA based secure erase is generally not a very smart
idea for flash based media..

