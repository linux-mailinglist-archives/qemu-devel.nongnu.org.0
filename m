Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274A2ECDBB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:26:38 +0100 (CET)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSV3-0007Mx-2b
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSSC-0004ZB-D0
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSSA-0006jf-FR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzNp6btn9SRTsuumUp+bOPUMwBrJ4pY52moh5KY3Nhw=;
 b=RU9cym8Z9tKvMkjsNy7arnq+UekiMMxji5JXHQXfVu3l5K3JU4Whyq+Pvn06lCRDlaxuKY
 fheXrRdGmvtupqBqZNOoMm+JoTOwuR+fgCJnhAOqvPoZxy+dtGHepH0Ha2+y7YlIOqQDQA
 I9C+fzVDpmyTYr4Oh2x3ToJD0NwLzEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-YHJPv-zUOty0YCZLf-QWog-1; Thu, 07 Jan 2021 05:23:34 -0500
X-MC-Unique: YHJPv-zUOty0YCZLf-QWog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8D98049C0;
 Thu,  7 Jan 2021 10:23:32 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97DAF71CB7;
 Thu,  7 Jan 2021 10:23:24 +0000 (UTC)
Message-ID: <26a820b4f4796b74fa679b5afaf2af65ad3c2b9b.camel@redhat.com>
Subject: Re: [PATCH v3 0/5] SCSI: fix transfer limits for SCSI passthrough
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 12:23:23 +0200
In-Reply-To: <20201217165612.942849-1-mlevitsk@redhat.com>
References: <20201217165612.942849-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Tom Yan <tom.ty89@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-17 at 18:56 +0200, Maxim Levitsky wrote:
> This patch series attempts to provide a solution to the problem of the transfer
> limits of the raw file driver (host_device/file-posix), some of which I
> already tried to fix in the past.
> 
> I included 2 patches from Tom Yan which fix two issues with reading the limits
> correctly from the */dev/sg* character devices in the first place.
> 
> The only change to these patches is that I tweaked a bit the comments in the
> source to better document the /dev/sg quirks.
> 
> The other two patches in this series split the max transfer limits that qemu
> block devices expose in two:
> One limit is for the regular IO, and another is for the SG_IO (aka bdrv_*_ioctl),
> and the two device drivers (scsi-block and scsi-generic) that use the later
> are switched to the new interface.
> 
> This should ensure that the raw driver can still advertise the unlimited
> transfer  length, unless it is used for SG_IO, because that yields the highest
> performance.
> 
> Also I include a somewhat unrelated fix to a bug I found in qemu's
> SCSI passthrough while testing this:
> When qemu emulates the VPD block limit page, for a SCSI device that doesn't
> implement it, it doesn't really advertise the emulated page to the guest.
> 
> I tested this by doing both regular and SG_IO passthrough of my
> USB SD card reader.
> 
> That device turned out to be a perfect device for the task, since it has max
> transfer size of 1024 blocks (512K), and it enforces it.
> 
> Also it didn't implement the VPD block limits page,
> (transfer size limit probably comes from something USB related) which triggered
> the unrelated bug.
> 
> I was able to see IO errors without the patches, and the wrong max transfer
> size in the guest, and with patches both issues were gone.
> 
> I also found an unrelated issue in /dev/sg passthrough in the kernel.
> It turns out that in-kernel driver has a limitation of 16 requests in flight,
> regardless of what underlying device supports.
> 
> With a large multi-threaded fio job  and a debug print in qemu, it is easy to
> see it, although the errors don't do much harm to the guest as it retries the
> IO, and eventually succeed.
> It is an open question if this should be solved.
> 
> V2: fixed an issue in a patch from Tom Yan (thanks), and removed
> refactoring from last patch according to Paulo's request.
> 
> V3: few cosmitic changes due to the review feedback.
> 
> Maxim Levitsky (3):
>   block: add max_ioctl_transfer to BlockLimits
>   block: use blk_get_max_ioctl_transfer for SCSI passthrough
>   block/scsi: correctly emulate the VPD block limits page
> 
> Tom Yan (2):
>   file-posix: split hdev_refresh_limits from raw_refresh_limits
>   file-posix: add sg_get_max_segments that actually works with sg
> 
>  block/block-backend.c          | 12 ++++++
>  block/file-posix.c             | 76 +++++++++++++++++++++++++++-------
>  block/io.c                     |  2 +
>  block/iscsi.c                  |  1 +
>  hw/scsi/scsi-generic.c         | 13 ++++--
>  include/block/block_int.h      |  4 ++
>  include/sysemu/block-backend.h |  1 +
>  7 files changed, 90 insertions(+), 19 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
> 
Any update on this?
Best regards,
	Maxim Levitsky


