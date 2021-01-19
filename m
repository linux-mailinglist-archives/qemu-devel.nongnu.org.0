Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CF2FBAB5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:06:04 +0100 (CET)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sa4-0004PZ-0L
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1sXu-0003pi-Bi
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1sXr-0008Lo-OZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611068625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ft4/oz3h85Tjw3wjj+Bry9SSF0uTGOUJcNx6DDFl1Y=;
 b=SXtr5zcMHYgDpwUfbyzj7QS3v0CDl494E3Ug0byVrAFFIuXbs5lNVbvhpeSpNCXtv+8Dm7
 YFo9q2dbrr7fSPqKmJ9ga7CU/ADMzydQuI7aYEtxJQ6WWxBO0CQqfdNUsQvGdpFhHXning
 J0tKcEoPp0vkLh8FiYA8JVhrBV0K3lU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-j_mg_xoLNLCUqsJ1pWNwEw-1; Tue, 19 Jan 2021 10:03:42 -0500
X-MC-Unique: j_mg_xoLNLCUqsJ1pWNwEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B2E107AD26;
 Tue, 19 Jan 2021 15:03:41 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-54.ams2.redhat.com
 [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4917910021AA;
 Tue, 19 Jan 2021 15:03:40 +0000 (UTC)
Subject: Re: [PATCH 1/2] block: Separate blk_is_writable() and
 blk_supports_write_perm()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210118123448.307825-1-kwolf@redhat.com>
 <20210118123448.307825-2-kwolf@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <50412fcb-08e6-699b-1b11-f618bafaee67@redhat.com>
Date: Tue, 19 Jan 2021 16:03:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210118123448.307825-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alxndr@bu.edu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.01.21 13:34, Kevin Wolf wrote:
> Currently, blk_is_read_only() tells whether a given BlockBackend can
> only be used in read-only mode because its root node is read-only. Some
> callers actually try to answer a slightly different question: Is the
> BlockBackend configured to be writable, by taking write permissions on
> the root node?
> 
> This can differ, for example, for CD-ROM devices which don't take write
> permissions, but may be backed by a writable image file. scsi-cd allows
> write requests to the drive if blk_is_read_only() returns false.
> However, the write request will immediately run into an assertion
> failure because the write permission is missing.
> 
> This patch introduces separate functions for both questions.
> blk_supports_write_perm() answers the question whether the block
> node/image file can support writable devices, whereas blk_is_writable()
> tells whether the BlockBackend is currently configured to be writable.
> 
> All calls of blk_is_read_only() are converted to one of the two new
> functions.
> 
> Fixes: https://bugs.launchpad.net/bugs/1906693
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/sysemu/block-backend.h |  3 ++-
>   block/block-backend.c          | 19 ++++++++++++++++---
>   hw/block/dataplane/xen-block.c |  2 +-
>   hw/block/fdc.c                 |  9 +++++----
>   hw/block/m25p80.c              |  6 +++---
>   hw/block/nand.c                |  2 +-
>   hw/block/nvme-ns.c             |  7 ++++---
>   hw/block/onenand.c             |  2 +-
>   hw/block/pflash_cfi01.c        |  2 +-
>   hw/block/pflash_cfi02.c        |  2 +-
>   hw/block/swim.c                |  6 +++---
>   hw/block/virtio-blk.c          |  6 +++---
>   hw/block/xen-block.c           |  2 +-
>   hw/ide/core.c                  |  2 +-
>   hw/misc/sifive_u_otp.c         |  2 +-
>   hw/ppc/pnv_pnor.c              |  2 +-
>   hw/scsi/scsi-disk.c            | 10 +++++-----
>   hw/scsi/scsi-generic.c         |  4 ++--
>   hw/sd/sd.c                     |  6 +++---
>   hw/usb/dev-storage.c           |  4 ++--
>   20 files changed, 57 insertions(+), 41 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


