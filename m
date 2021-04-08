Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF8358B0B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:12:46 +0200 (CEST)
Received: from localhost ([::1]:45834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYCz-00009Y-IT
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUYAQ-0007D0-4j
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lUYAM-0006C9-JB
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617901799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W11x5c1ITjWsD9FI4nDOu4GIpFre8z+6O526LFFrFEM=;
 b=FXfq6k4BpuDuq/Qoc2u6B8PXZe1WAG0B9khbyDN5hx/F7HQuSreyWgFB249ARXN0ctUR6j
 ZEAoco+7n4Rd9rNbR9hsP+nZ58rK3CMEsKu+njKZStjN9JOCI2Ljw9bylyz+opO9xqVh1Q
 66dc3DYR21EHoN4oIyEz3ZpdD1MdUBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-9Keqc4gCPuaED_YUoSVaPg-1; Thu, 08 Apr 2021 13:09:57 -0400
X-MC-Unique: 9Keqc4gCPuaED_YUoSVaPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5482195D561;
 Thu,  8 Apr 2021 17:09:56 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1269794A0;
 Thu,  8 Apr 2021 17:09:55 +0000 (UTC)
Subject: Re: [PATCH for-6.0? 0/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210408162039.242670-1-mreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <250ce24c-6f0d-e534-f0bd-2966a60dc827@redhat.com>
Date: Thu, 8 Apr 2021 13:09:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408162039.242670-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 12:20 PM, Max Reitz wrote:
> Hi,
> 
> See patch 1 for a detailed explanation of the problem.
> 
> The gist is: Draining a READY job makes it transition to STANDBY, and
> jobs on STANDBY cannot be completed.  Ending the drained section will
> schedule the job (so it is then resumed), but not wait until it is
> actually running again.
> 
> Therefore, it can happen that issuing block-job-complete fails when you
> issue it right after some draining operation.
> 
> I tried to come up with an iotest reproducer, but in the end I only got
> something that reproduced the issue like 2/10 times, and it required
> heavy I/O, so it is nothing I would like to have as part of the iotests.
> Instead, I opted for a unit test, which allows me to cheat a bit
> (specifically, locking the job IO thread before ending the drained
> section).
> 
> 
> Max Reitz (3):
>    job: Add job_wait_unpaused() for block-job-complete
>    test-blockjob: Test job_wait_unpaused()
>    iotests/041: block-job-complete on user-paused job
> 
>   include/qemu/job.h         |  15 ++++
>   blockdev.c                 |   3 +
>   job.c                      |  42 +++++++++++
>   tests/unit/test-blockjob.c | 140 +++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/041     |  13 +++-
>   5 files changed, 212 insertions(+), 1 deletion(-)
> 

Left comments and review on #1, skimmed 2/3. Not sure if it's 
appropriate for 6.0 yet, that might depend on the responses to my 
comments and other reviewers and so on.

Acked-by: John Snow <jsnow@redhat.com>


