Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781E665E04
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFc9Q-0004Tv-1n; Wed, 11 Jan 2023 09:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFc9L-0004SQ-OS
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pFc9J-0001vN-Nt
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673447536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8ySEFPPSDvJqRcu9WZ8gCqJIVMcbAVOD4nCC9L3vpY=;
 b=PgRnW8NSXio11VccUj/29LcP/CwZHO9qt3DgcqrrdCh66ukw9Hb000GZ43tujB0A8F9KHS
 gpXGaNm0mBpLtaWK68A6yLOZVyQ0bWArFFU0wGVxAh5/iezdi9VLuNUD2t7UVsOV7IN/ei
 X7+MPU1D7COQT07Ix2uoSwwk+KRg8Ng=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-ZYlSxLCLMbuciffuteoqhw-1; Wed, 11 Jan 2023 09:32:14 -0500
X-MC-Unique: ZYlSxLCLMbuciffuteoqhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0340629AA3A5;
 Wed, 11 Jan 2023 14:32:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C84B40C2064;
 Wed, 11 Jan 2023 14:32:12 +0000 (UTC)
Date: Wed, 11 Jan 2023 15:32:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Cc: mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Questions about how block devices use snapshots
Message-ID: <Y77IajRLJOC6ohih@redhat.com>
References: <90855f8f-76ce-0a5f-3156-e69b157342c9@bytedance.com>
 <Y7wdTurqBjWXIGmo@redhat.com>
 <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5433b9c-12c1-bfff-a3a5-878b47a86bab@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 11.01.2023 um 08:55 hat Zhiyong Ye geschrieben:
> Hi Kevin,
> 
> Thank you for your reply and detailed answers.
> 
> In my scenario is the iSCSI SAN environment. The network storage device is
> connected to the physical machine via iSCSI, and LVM is used as the middle
> layer between the storage device and the VM for storage management and
> metadata synchronization. Every VM uses both raw and qcow2 formats, with the
> system disk being qcow2 and the data disk being raw. Therefore block devices
> need to support snapshot capability in both raw and qcow2 store methods. In
> addition, snapshot images should also be stored in iSCSI storage, which is a
> block device.
> 
> Both internal and external snapshots can implement snapshots of block
> devices, but they both have their drawbacks when multiple snapshots are
> required.
> 
> Internal snapshots can only be used in qcow2 format and do not require
> additional creation of new block devices. As you said, the block device has
> much more space than the virtual disk. There is no telling when disk space
> will be full when creating multiple snapshots.
> 
> External snapshots require the creation of additional block devices to store
> the overlay images, but it is not clear how much space needs to be created.
> If the space is the same as the virtual disk, when there are multiple
> snapshots it will be a serious waste of disk space, because each time a new
> snapshot is created the previous one will become read-only. However, if the
> disk space created is too small, the snapshot data may not be stored when
> the disk space is full.
> 
> The problem with both is the uncertainty of the space size of the block
> device at the time of creation. Of course, we can rely on lvm's resize
> function to dynamically grow the space of the block device. But I think this
> is more of a workaround.

Yes, this is why I said it's challenging. oVirt uses resizing of LVs to
achieve this, and it's still very complex. You need to decide yourself
if you think implementing the management software for this is worth it.

> It is mentioned in the Qemu docs page under "QEMU disk image utility" that
> the qemu-img rebase can be used to perform a “diff” operation on two disk
> images.
> 
> Say that base.img has been cloned as modified.img by copying it, and that
> the modified.img guest has run so there are now some changes compared to
> base.img. To construct a thin image called diff.qcow2 that contains just the
> differences, do:
> 
> qemu-img create -f qcow2 -b modified.img diff.qcow2
> qemu-img rebase -b base.img diff.qcow2
> 
> At this point, modified.img can be discarded, since base.img + diff.qcow2
> contains the same information.
> 
> Can this “diff” operation be used on snapshots of block devices? The first
> snapshot is a copy of the original disk (to save space we can copy only the
> data that has already been used), while the subsequent snapshots are based
> on the diff of the previous snapshot, so that the space required for the
> created block device is known at the time of the snapshot.

Yes, you can use raw block devices for both base.img and modified.img.
But of course, the result is still a qcow2 file that you need to store
somewhere.

Kevin


