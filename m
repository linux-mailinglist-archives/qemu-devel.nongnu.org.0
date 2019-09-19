Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB6B72C0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 07:39:07 +0200 (CEST)
Received: from localhost ([::1]:37704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAp9m-0005Si-MB
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 01:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iAp7u-0004DC-Kq
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iAp7t-00070e-GW
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:37:10 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:5844)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iAp7p-0006ev-Ms; Thu, 19 Sep 2019 01:37:06 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25d8313c4d8b-8a9b8;
 Thu, 19 Sep 2019 13:36:05 +0800 (CST)
X-RM-TRANSID: 2ee25d8313c4d8b-8a9b8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5d8313c43b3-a8b02;
 Thu, 19 Sep 2019 13:36:05 +0800 (CST)
X-RM-TRANSID: 2eea5d8313c43b3-a8b02
Date: Thu, 19 Sep 2019 13:36:23 +0800
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: pbonzini@redhat.com, fam@euphon.net, dillaman@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com
Message-ID: <20190919053623.GA19956@byw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] COMPARE_AND_WRITE support for rbd driver
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
Cc: baiyaowei@cmss.chinamobile.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

baiyaowei@cmss.chinamobile.com 
Bcc: 
Subject: COMPARE_AND_WRITE support for rbd driver
Reply-To: baiyaowei@cmss.chinamobile.com

Hey guys,

I noticed that COMPARE_AND_WRITE had been supported by CEPH/librbd since
v12.1.1. And in my company, we use this COMPARE_AND_WRITE support in
CEPH with the ISCSI protocol. More precisely, we use tgt and CEPH with this
COMPARE_AND_WRITE support as the SCSI target and export it to the remote
hosts. And then VMs on remote hosts can use these SCSI targets through ISCSI
initiator support in QEMU directly or as local SCSI disks. But unfortunately,
there're some issues with this tgt case. So i think maybe we could also add this
COMPARE_AND_WRITE support into the rbd driver in QEMU so we can leave the
ISCSI/tgt alone and use this COMPARE_AND_WRITE support with the
scsi-disk <--> virtio-scsi <--> rbd driver path. This can also apply to
the WRITESAME support in CEPH/librbd.

So is it suitable for doing this? I want to hear suggestions from you
genius guys. Appreciate it.



