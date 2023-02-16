Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B969946E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:35:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdTG-0006p7-Cr; Thu, 16 Feb 2023 07:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSdTE-0006ju-9S
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSdTC-0005Fw-Hf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CafzpDwoJKj+VRb2V9J2mptnKi3IL4Uxzb/HyAKypTQ=;
 b=NHXzEmqAV+8uHe8Bf1C3Or7TkNh1IBR100khTbJqzVFXf+5ygNKLgqgudMEPQ8C80PT5iH
 iJe2OnJGQcSVVuMzzJUeucWnFzi8uvddbMUwMYGKjwIehe0p5MRVEvjmWwHAWC4Vvn2uic
 f32miSHsy8aeSXxZhh0UZGiNA4/vycs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-ZbN0GUucNCSuIwqaNO1RCA-1; Thu, 16 Feb 2023 07:34:34 -0500
X-MC-Unique: ZbN0GUucNCSuIwqaNO1RCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B796830F82;
 Thu, 16 Feb 2023 12:34:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 257E840C1423;
 Thu, 16 Feb 2023 12:34:31 +0000 (UTC)
Date: Thu, 16 Feb 2023 13:34:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v2 1/3] scsi: protect req->aiocb with AioContext lock
Message-ID: <Y+4i1lTksqNWjTy4@redhat.com>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143238.524357-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 10.02.2023 um 15:32 hat Stefan Hajnoczi geschrieben:
> If requests are being processed in the IOThread when a SCSIDevice is
> unplugged, scsi_device_purge_requests() -> scsi_req_cancel_async() races
> with I/O completion callbacks. Both threads load and store req->aiocb.
> This can lead to assert(r->req.aiocb == NULL) failures and undefined
> behavior.
> 
> Protect r->req.aiocb with the AioContext lock to prevent the race.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I tried to check that all accesses of .aiocb are actually protected by
the AioContext lock. I stopped at scsi_read_data(), which asserts that
it is non-NULL, but it is only called as a SCSIReqOps function. I
couldn't find any information on what the locking rules are with
SCSIReqOps functions and didn't feel like reverse engineering scsi-bus
etc. without just asking first.

The same question applies to:
- scsi_read_data
- scsi_write_data
- scsi_disk_emulate_write_data
- scsi_disk_emulate_command

Since these are not callbacks scheduled in the AioContext by scsi-disk
itself, I expect that they are indeed covered. The acquire/release pair
in virtio_scsi_handle_cmd() might actually indirectly cover all of them,
but I haven't checked that.

Either way, the changes that you're making look good:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


