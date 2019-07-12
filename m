Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF366936
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 10:32:21 +0200 (CEST)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlqya-0003xf-J9
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 04:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55561)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hlqyM-0003Uq-Ce
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 04:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hlqyL-0004lW-4K
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 04:32:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35368)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>)
 id 1hlqyI-0004j4-5h; Fri, 12 Jul 2019 04:32:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 67379309B153;
 Fri, 12 Jul 2019 08:32:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AEA419C4F;
 Fri, 12 Jul 2019 08:32:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 167E141F40;
 Fri, 12 Jul 2019 08:32:01 +0000 (UTC)
Date: Fri, 12 Jul 2019 04:32:00 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Message-ID: <711988058.41191683.1562920320632.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190704124342.7753-1-mlevitsk@redhat.com>
References: <20190704124342.7753-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.116.201, 10.4.195.22]
Thread-Topic: Don't obey the kernel block device max transfer len / max
 segments for raw block devices
Thread-Index: AOcLEIKBQ8mrGaVFRFMVHcZaW8B3cw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 12 Jul 2019 08:32:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/1] Don't obey the kernel block device
 max transfer len / max segments for raw block devices
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Linux block devices, even in O_DIRECT mode don't have any user visible
> limit on transfer size / number of segments, which underlying kernel block
> device can have.
> The kernel block layer takes care of enforcing these limits by splitting the
> bios.
> 
> By limiting the transfer sizes, we force qemu to do the splitting itself
> which
> introduces various overheads.
> It is especially visible in nbd server, where the low max transfer size of
> the
> underlying device forces us to advertise this over NBD, thus increasing the
> traffic overhead in case of image conversion which benefits from large
> blocks.
> 
> More information can be found here:
> https://bugzilla.redhat.com/show_bug.cgi?id=1647104
> 
> Tested this with qemu-img convert over nbd and natively and to my surprise,Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> even native IO performance improved a bit.
> 
> (The device on which it was tested is Intel Optane DC P4800X,
> which has 128k max transfer size reported by the kernel)
> 
> The benchmark:
> 
> Images were created using:
> 
> Sparse image:  qemu-img create -f qcow2 /dev/nvme0n1p3 1G / 10G / 100G
> Allocated image: qemu-img create -f qcow2 /dev/nvme0n1p3 -o
> preallocation=metadata  1G / 10G / 100G
> 
> The test was:
> 
>  echo "convert native:"
>  rm -rf /dev/shm/disk.img
>  time qemu-img convert -p -f qcow2 -O raw -T none $FILE /dev/shm/disk.img >
>  /dev/zero
> 
>  echo "convert via nbd:"
>  qemu-nbd -k /tmp/nbd.sock -v  -f qcow2 $FILE -x export --cache=none
>  --aio=native --fork
>  rm -rf /dev/shm/disk.img
>  time qemu-img convert -p -f raw -O raw
>  nbd:unix:/tmp/nbd.sock:exportname=export /dev/shm/disk.img > /dev/zero
> 
> The results:
> 
> =========================================
> 1G sparse image:
>  native:
> 	before: 0.027s
> 	after: 0.027s
>  nbd:
> 	before: 0.287s
> 	after: 0.035s
> 
> =========================================
> 100G sparse image:
>  native:
> 	before: 0.028s
> 	after: 0.028s
>  nbd:
> 	before: 23.796s
> 	after: 0.109s
> 
> =========================================
> 1G preallocated image:
>  native:
>        before: 0.454s
>        after: 0.427s
>  nbd:
>        before: 0.649s
>        after: 0.546s
> 
> The block limits of max transfer size/max segment size are retained
> for the SCSI passthrough because in this case the kernel passes the userspace
> request
> directly to the kernel scsi driver, bypassing the block layer, and thus there
> is no code to split
> such requests.
> 
> Fam, since you was the original author of the code that added
> these limits, could you share your opinion on that?
> What was the reason besides SCSI passthrough?
> 
> V2:
> 
> *  Manually tested to not break the scsi passthrough with a nested VM
> *  As Eric suggested, refactored the area around the fstat.
> *  Spelling/grammar fixes
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (1):
>   raw-posix.c - use max transfer length / max segement count only for
>     SCSI passthrough
> 
>  block/file-posix.c | 54 ++++++++++++++++++++++++----------------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> --

I am not familiar with SCSI passthrough special case. But overall looks good to me.

Feel free to add:
Reviewed-by: Pankaj Gupta <pagupta@redhat.com>

> 2.17.2
> 
> 
> 

