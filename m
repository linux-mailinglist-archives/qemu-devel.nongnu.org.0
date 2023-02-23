Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA686A0EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFI2-0005Vb-Gi; Thu, 23 Feb 2023 12:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVFI0-0005Tm-7e
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVFHn-00075b-3k
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677172893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhdNhyG1GZQKNA+2sXcZln6xHVZURhgWJVfXtqkJH5s=;
 b=EEL3zC4jjx6BoNndFBhMLQlbRy6YJ8AweeuXHrq2TILzVKqjkHMwqQVkKU9c3PkUKquRSp
 wvIxBzsukdANteDpbMgIkkjHqe+S7nThlW699ZJZ70OMuI/Q+jeQCE4Pa748nOGK6GUcNW
 iylJk89ZnUocsmRwsNMlUTC4jcGVFWY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-BidSgokuMjS7xzaPjDIicQ-1; Thu, 23 Feb 2023 12:21:26 -0500
X-MC-Unique: BidSgokuMjS7xzaPjDIicQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5500B1C02D31;
 Thu, 23 Feb 2023 17:21:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B67EC15BA0;
 Thu, 23 Feb 2023 17:21:22 +0000 (UTC)
Date: Thu, 23 Feb 2023 18:21:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 0/3] virtio-scsi: fix SCSIDevice hot unplug with
 IOThread
Message-ID: <Y/egkTfE3Own4AHJ@redhat.com>
References: <20230221212218.1378734-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221212218.1378734-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 21.02.2023 um 22:22 hat Stefan Hajnoczi geschrieben:
> v3:
> - Fix s/see/sees/ typo in Patch 2 commit description [Eric]
> - Add call stack to Patch 3 commit description to make it clear how blk_drain()
>   is invoked [Kevin]
> 
> Unplugging SCSIDevices when virtio-scsi is using an IOThread suffers from race
> conditions:
> - scsi_device_purge_requests() is called from the IOThread in TMF emulation.
>   This is unsafe, it should only be called from the BQL.
> - SCSIRequest->aiocb is not protected by a lock, so there are races between the
>   main loop thread and the IOThread when scsi_device_purge_requests() runs in
>   the main loop thread.
> - DMAAIOCB->acb is not protected by a lock, so there are races in the DMA
>   helpers code when cancelling a request from the main loop thread.
> 
> These fixes solve assertion failures during SCSIDevice hot unplug in
> virtio-scsi with IOThread. Expanding the use of the AioContext lock isn't great
> since we're in the midst of trying to remove it. However, I think this solution
> is appropriate so that stable trees or distros can backport the fix without
> depending on QEMU multi-queue block layer refactoring.
> 
> Special thanks to Qing Wang, who helped me iterate these patches because I
> couldn't reproduce the assertion failures myself.

Thanks, applied to the block branch.

Kevin


