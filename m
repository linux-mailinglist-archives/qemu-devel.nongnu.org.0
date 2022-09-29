Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1485EFA58
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:24:27 +0200 (CEST)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwKo-0003qe-Q3
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1odvgp-0002tS-Ko
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1odvgl-0002AR-Ee
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664466180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d6dmokZDm5kVDQlkFm4C1MuGfv3oJNgAvYSSmFlb+ok=;
 b=fnZwjupGejV7QRGv+JBSgFY3OMoHS2tTR4dLOF8Y7LBpIK5apMGGKy92MDijXB8CufT8hi
 XS888j3ud+t7+7LtaohUiDsXdxXXCMGMhxQJh5PN6ksJ+/OrJD8LgjQ3bePiFJATWekmng
 yhxDwCfOYynJtm8KATXalOpayjRwB14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-pYZ6JNfZPDaQr7OC8gPKcw-1; Thu, 29 Sep 2022 11:41:30 -0400
X-MC-Unique: pYZ6JNfZPDaQr7OC8gPKcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0D10801231;
 Thu, 29 Sep 2022 15:41:26 +0000 (UTC)
Received: from starship (unknown [10.40.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 210062166B2D;
 Thu, 29 Sep 2022 15:41:24 +0000 (UTC)
Message-ID: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
Subject: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Keith Busch <kbusch@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, qemu-devel@nongnu.org, kvm@vger.kernel.org
Date: Thu, 29 Sep 2022 18:41:23 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!
 
Recently I noticed that this commit broke the boot of some of the VMs that I run on my dev machine.
 
It seems that I am not the first to notice this but in my case it is a bit different
 
https://lore.kernel.org/all/e0038866ac54176beeac944c9116f7a9bdec7019.camel@linux.ibm.com/
 
My VM is a normal x86 VM, and it uses virtio-blk in the guest to access the virtual disk,
which is a qcow2 file stored on ext4 filesystem which is stored on NVME drive with 4K sectors.
(however I was also able to reproduce this on a raw file)
 
It seems that the only two things that is needed to reproduce the issue are:
 
1. The qcow2/raw file has to be located on a drive which has 4K hardware block size.
2. Qemu needs to use direct IO (both aio and 'threads' reproduce this). 
 
I did some debugging and I isolated the kernel change in behavior from qemu point of view:
 
 
Qemu, when using direct IO, 'probes' the underlying file.
 
It probes two things:
 
1. It probes the minimum block size it can read.
   It does so by trying to read 1, 512, 1024, 2048 and 4096 bytes at offset 0,
   using a 4096 bytes aligned buffer, and notes the first read that works as the hardware block size.
 
   (The relevant function is 'raw_probe_alignment' in src/block/file-posix.c in qemu source code).
 
 
2. It probes the buffer alignment by reading 4096 bytes also at file offset 0,
   this time using a buffer that is 1, 512, 1024, 2048 and 4096 aligned
   (this is done by allocating a buffer which is 4K aligned and adding 1/512 and so on to its address)
 
   First successful read is saved as the required buffer alignment. 
 
 
Before the patch, both probes would yield 4096 and everything would work fine.
(The file in question is stored on 4K block device)
 
 
After the patch the buffer alignment probe succeeds at 512 bytes.
This means that the kernel now allows to read 4K of data at file offset 0 with a buffer that
is only 512 bytes aligned. 
 
It is worth to note that the probe was done using 'pread' syscall.
 
 
Later on, qemu likely reads the 1st 512 sector of the drive.
 
It uses preadv with 2 io vectors:
 
First one is for 512 bytes and it seems to have 0xC00 offset into page 
(likely depends on debug session but seems to be consistent)
 
Second one is for 3584 bytes and also has a buffer that is not 4K aligned.
(0x200 page offset this time)
 
This means that the qemu does respect the 4K block size but only respects 512 bytes buffer alignment,
which is consistent with the result of the probing.
 
And that preadv fails with -EINVAL
 
Forcing qemu to use 4K buffer size fixes the issue, as well as reverting the offending commit.
 
Any patches, suggestions are welcome.

I use 6.0-rc7, using mainline master branch as yesterday.
 
Best regards,
	Maxim Levitsky


