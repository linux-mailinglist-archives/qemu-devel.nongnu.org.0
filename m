Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB754442EC9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:06:02 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtUH-0004qe-9H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsyo-0007ua-2f
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhsyi-0000OY-By
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZCwacL48z6oBpdKChdWznoqxwQiVRWzmGplkF6wmZc=;
 b=PEBjeIil/XW3uDwj5t3MpckpfSqBVo7XgI/YLhRkH3wCc68k0m5Yherc1ThBsrneUiDhNM
 gz4BDV7uWKBUqxc4IGOzugN5yJqTHcmQFBw1MdAbO65q01VvUJwhrYIZcsyLVsh7I1g34v
 EGSLNjeGoPzkTVJdMCP0oGbFy/H+aLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-SF6dqVBWOwCnISwqK0A6tQ-1; Tue, 02 Nov 2021 08:33:21 -0400
X-MC-Unique: SF6dqVBWOwCnISwqK0A6tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1722835B48;
 Tue,  2 Nov 2021 12:33:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC3C1017CF2;
 Tue,  2 Nov 2021 12:33:18 +0000 (UTC)
Date: Tue, 2 Nov 2021 13:33:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
Message-ID: <YYEwDRCvNpct0BeB@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
 <20211006164931.172349-6-philmd@redhat.com>
 <YV72QsbNN3Eb2kLV@stefanha-x1.localdomain>
 <19edd050-c09f-2039-0c89-50bcae61321f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <19edd050-c09f-2039-0c89-50bcae61321f@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.10.2021 um 15:34 hat Philippe Mathieu-Daudé geschrieben:
> On 10/7/21 15:29, Stefan Hajnoczi wrote:
> > On Wed, Oct 06, 2021 at 06:49:31PM +0200, Philippe Mathieu-Daudé wrote:
> >> nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
> >> but we never release them. Do it in nvme_free_queue() which is called
> >> from nvme_free_queue_pair().
> >>
> >> Reported by valgrind:
> >>
> >>   ==252858== 520,192 bytes in 1 blocks are still reachable in loss record 8,293 of 8,302
> >>   ==252858==    at 0x4846803: memalign (vg_replace_malloc.c:1265)
> >>   ==252858==    by 0x484691F: posix_memalign (vg_replace_malloc.c:1429)
> >>   ==252858==    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210)
> >>   ==252858==    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
> >>   ==252858==    by 0xAA0125: nvme_init (nvme.c:799)
> >>   ==252858==    by 0xAA081C: nvme_file_open (nvme.c:953)
> >>   ==252858==    by 0xA23DDD: bdrv_open_driver (block.c:1550)
> >>   ==252858==    by 0xA24806: bdrv_open_common (block.c:1827)
> >>   ==252858==    by 0xA2889B: bdrv_open_inherit (block.c:3747)
> >>   ==252858==    by 0xA28DE4: bdrv_open (block.c:3840)
> >>   ==252858==    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
> >>   ==252858==    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)
> >>
> >> Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  block/nvme.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/block/nvme.c b/block/nvme.c
> >> index 6e476f54b9f..903c8ffa060 100644
> >> --- a/block/nvme.c
> >> +++ b/block/nvme.c
> >> @@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
> >>  
> >>  static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
> >>  {
> >> +    qemu_vfio_dma_unmap(s->vfio, q->queue);
> >>      qemu_vfree(q->queue);
> >>  }
> > 
> > I can't figure out the issue. qemu_vfree(q->queue) was already called
> > before this patch. How does adding qemu_vfio_dma_unmap() help with the
> > valgrind report in the commit description?
> 
> You are right, I think I didn't select the correct record
> between the 8302 reported by valgrind. I will revisit, thanks.

Should we still merge (parts of) this series for 6.2? Or does this mean
that we don't want it at all?

Kevin


