Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF02EAE6C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:32:28 +0100 (CET)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoJv-0003su-9u
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwoID-0003Kj-0V
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwoI0-00048R-4v
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609860626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyJV9kkLRmjBbgaq8MLlqMv05pvlvzznd0PZYKNWhqQ=;
 b=hLY13zCKgGXUHzsKFOXUqTwwaPsK1jeft7v67Xb+rJiBMxU5OWTH9zZ9pRVaxT+uvMls5C
 o8EiARpq/tpja7709Poa+BiB6Dala+nEj22gh73TwulEx3GoUAYonQM6FDXTus1VEt3ZvM
 lTfoseXZedsAh+1IXZ7kAXW3yzLRZq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-SZwL33fzNe6b2aKwy91bfw-1; Tue, 05 Jan 2021 10:30:22 -0500
X-MC-Unique: SZwL33fzNe6b2aKwy91bfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C61C1AFA91;
 Tue,  5 Jan 2021 15:30:20 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B38986FEE2;
 Tue,  5 Jan 2021 15:30:14 +0000 (UTC)
Subject: Re: [PATCH v15 13/13] block: apply COR-filter to block-stream jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2eec872e-d601-e6ca-97f3-50d94d15f12c@redhat.com>
Date: Tue, 5 Jan 2021 16:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216061703.70908-14-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> This patch completes the series with the COR-filter applied to
> block-stream operations.
> 
> Adding the filter makes it possible in future implement discarding
> copied regions in backing files during the block-stream job, to reduce
> the disk overuse (we need control on permissions).
> 
> Also, the filter now is smart enough to do copy-on-read with specified
> base, so we have benefit on guest reads even when doing block-stream of
> the part of the backing chain.
> 
> Several iotests are slightly modified due to filter insertion.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>   tests/qemu-iotests/030     |   8 +--
>   tests/qemu-iotests/141.out |   2 +-
>   tests/qemu-iotests/245     |  20 ++++---
>   4 files changed, 80 insertions(+), 55 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
> index 08e0aecd65..028a16f365 100644
> --- a/tests/qemu-iotests/141.out
> +++ b/tests/qemu-iotests/141.out
> @@ -99,7 +99,7 @@ wrote 1048576/1048576 bytes at offset 0
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
>   {'execute': 'blockdev-del', 'arguments': {'node-name': 'drv0'}}
> -{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
> +{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: stream"}}
>   {'execute': 'block-job-cancel', 'arguments': {'device': 'job0'}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}

Amusing side note: This context matches two places in 141.out.  With 
0e720781282 (which requires two contextual whitespace tweaks), the file 
gets longer, so the line number doesn’t match anymore.  git then tries 
to apply the context to the first match (which is closer to line 99), 
which is wrong.

First time I had something like that happen, actually.

Max


