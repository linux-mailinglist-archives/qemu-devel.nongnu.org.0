Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4D36F9B9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:04:03 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRsI-0002lr-JY
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcQos-00005T-Uy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcQoq-0004ar-7b
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLIhPJq5RjC+G7lXg3X9UOcTHGg0P+I3IeXCQ+7qwWE=;
 b=MggnYlb/P5qWIIZoc0eZL/colIBcLW78PTBzCqPMtQ7sRk1YQ1IUBeYfQ4KAqe9FabV33I
 dIOd9BjL43iH3HpcO0ScM9jO7X1enkJ7Pz0TbJduSLRyE4nhNAATU48x8tKdmC25ymaiQB
 1er7lPEbiWjM48psPTJBROCoOZaBK8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-dUq2KkeNO9uG7o-sOBTxbg-1; Fri, 30 Apr 2021 06:56:19 -0400
X-MC-Unique: dUq2KkeNO9uG7o-sOBTxbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123C7107ACE8;
 Fri, 30 Apr 2021 10:56:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1C519714;
 Fri, 30 Apr 2021 10:56:16 +0000 (UTC)
Subject: Re: [PATCH] mirror: stop cancelling in-flight requests on non-force
 cancel in READY
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210421075858.40197-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6a04b710-3c3a-27da-e497-f7c17770aaac@redhat.com>
Date: Fri, 30 Apr 2021 12:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421075858.40197-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 nshirokovskiy@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.04.21 09:58, Vladimir Sementsov-Ogievskiy wrote:
> If mirror is READY than cancel operation is not discarding the whole
> result of the operation, but instead it's a documented way get a
> point-in-time snapshot of source disk.
> 
> So, we should not cancel any requests if mirror is READ and
> force=false. Let's fix that case.
> 
> Note, that bug that we have before this commit is not critical, as the
> only .bdrv_cancel_in_flight implementation is nbd_cancel_in_flight()
> and it cancels only requests waiting for reconnection, so it should be
> rare case.
> 
> Fixes: 521ff8b779b11c394dbdc43f02e158dd99df308a
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h | 2 +-
>   include/qemu/job.h        | 2 +-
>   block/backup.c            | 2 +-
>   block/mirror.c            | 6 ++++--
>   job.c                     | 2 +-
>   tests/qemu-iotests/264    | 2 +-
>   6 files changed, 9 insertions(+), 7 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


