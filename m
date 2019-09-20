Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AFB9408
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:32:18 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBKtK-00026q-Ux
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iBKo6-0007R1-HV
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iBKo5-0003jx-Ht
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:26:50 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:3852)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iBKo1-0003ch-Fw; Fri, 20 Sep 2019 11:26:46 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65d84ef91409-afe0f;
 Fri, 20 Sep 2019 23:26:10 +0800 (CST)
X-RM-TRANSID: 2ee65d84ef91409-afe0f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25d84ef90573-53167;
 Fri, 20 Sep 2019 23:26:09 +0800 (CST)
X-RM-TRANSID: 2ee25d84ef90573-53167
Date: Fri, 20 Sep 2019 23:26:28 +0800
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: COMPARE_AND_WRITE support for rbd driver
Message-ID: <20190920152627.GA10350@byw>
References: <20190919053623.GA19956@byw>
 <8a304065-b9ec-8245-09ae-e38724f46645@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a304065-b9ec-8245-09ae-e38724f46645@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
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
Reply-To: baiyaowei@cmss.chinamobile.com
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, yangjun@cmss.chinamobile.com,
 baiyaowei@cmss.chinamobile.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 20, 2019 at 01:22:02PM +0200, Paolo Bonzini wrote:
> On 19/09/19 07:36, Yaowei Bai wrote:
> > 
> > Hey guys,
> > 
> > I noticed that COMPARE_AND_WRITE had been supported by CEPH/librbd since
> > v12.1.1. And in my company, we use this COMPARE_AND_WRITE support in
> > CEPH with the ISCSI protocol. More precisely, we use tgt and CEPH with this
> > COMPARE_AND_WRITE support as the SCSI target and export it to the remote
> > hosts. And then VMs on remote hosts can use these SCSI targets through ISCSI
> > initiator support in QEMU directly or as local SCSI disks. But unfortunately,
> > there're some issues with this tgt case. So i think maybe we could also add this
> > COMPARE_AND_WRITE support into the rbd driver in QEMU so we can leave the
> > ISCSI/tgt alone and use this COMPARE_AND_WRITE support with the
> > scsi-disk <--> virtio-scsi <--> rbd driver path. This can also apply to
> > the WRITESAME support in CEPH/librbd.
> > 
> > So is it suitable for doing this?
> 
> Yes, it would be suitable.  In a nutshell you would have to add support
> for COMPARE_AND_WRITE to block/io.c (calling into a new BlockDriver
> function pointer), block/rbd.c and hw/scsi/scsi-disk.c.

OK, i'll try to implement this and send it out for review. Thanks Paolo.

> 
> Paolo



