Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459AE327D30
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:29:18 +0100 (CET)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgjl-0001JM-AZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGghZ-00087M-7T
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lGghX-0007qx-SR
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614598019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yXOLbxmWRCv04n8YDpJqk53QLgbu+SGhu72P0vyw1wk=;
 b=dZu2yChQdEOvKr5wvad8KXrXa3D+/LB/gFoGBL2V0CPH6EX1ofMQSA348AFeJZXDDvkBJf
 YjuA3sPI6Q+xEH+wewy0JM9NyeWlJ+ql2P23FBMk3hdW4JItdLV3DSlrB4GFSYIXCwyLVa
 24jYqhDjQLgdVIvBG3rsaVaYbGuAk2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-BWxYdJtvNzKkAAbITxm6rQ-1; Mon, 01 Mar 2021 06:26:55 -0500
X-MC-Unique: BWxYdJtvNzKkAAbITxm6rQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CE3107ACC7;
 Mon,  1 Mar 2021 11:26:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 625FA60BFA;
 Mon,  1 Mar 2021 11:26:53 +0000 (UTC)
Date: Mon, 1 Mar 2021 12:26:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2] blockjob: report a better error message
Message-ID: <20210301112651.GE7698@merkur.fritz.box>
References: <20210225103633.76746-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225103633.76746-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 11:36 hat Stefano Garzarella geschrieben:
> When a block job fails, we report strerror(-job->job.ret) error
> message, also if the job set an error object.
> Let's report a better error message using error_get_pretty(job->job.err).
> 
> If an error object was not set, strerror(-job->ret) is used as fallback,
> as explained in include/qemu/job.h:
> 
> typedef struct Job {
>     ...
>     /**
>      * Error object for a failed job.
>      * If job->ret is nonzero and an error object was not set, it will be set
>      * to strerror(-job->ret) during job_completed.
>      */
>     Error *err;
> }
> 
> In block_job_query() there can be a transient where 'job.err' is not set
> by a scheduled bottom half. In that case we use strerror(-job->ret) as it
> was before.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin


