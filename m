Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47211383A2A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:38:33 +0200 (CEST)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligGE-00049k-Qq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifyt-000202-SK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifyp-0002H1-Mx
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621268428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHbvFf46FxmZTU0WtDthjT1sF3qlqjOgwa/B7/oYPlo=;
 b=jSVCYFIPpB0XjT8JPlc7vTwGhIOf2yXzEvt7HRRp5QTthsV/JUobzDNhKxzcpn/mp3ifda
 AA1HZfGPk1agxDkjEg9DUq8T1vNgLio7UUr6XL3KSQJ4503aSLdS3ype9XWsZ3iebSaPB/
 IBJq7IwwW/8YfhP4uaB7buD9bKT8JZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-DyZShSiRNNqKcNWZlMtoxg-1; Mon, 17 May 2021 12:20:26 -0400
X-MC-Unique: DyZShSiRNNqKcNWZlMtoxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9C1C107ACE4;
 Mon, 17 May 2021 16:20:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C7510027A5;
 Mon, 17 May 2021 16:20:23 +0000 (UTC)
Subject: Re: [PATCH 06/21] block/backup: drop support for copy_range
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-8-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <160d1cab-d1c3-9abe-b299-9553227f92a5@redhat.com>
Date: Mon, 17 May 2021 18:20:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> copy_range is not a default behavior since 6a30f663d4c0b3c, and it's
> now available only though x-perf experimantal argument, so it's OK to
> drop it.
> 
> Even when backup is used to copy disk to same filesystem, and
> filesystem supports zero-copy copy_range, copy_range is probably not
> what we want for backup: backup has good property of making a copy of
> active disk, with no impact to active disk itself (unlike creating a
> snapshot). And if copy_range instead of copying data adds fs-level
> references, and on next guest write COW operation occurs, it's seems
> most possible, that new block will be allocated for original vm disk,
> not for backup disk. Thus, fragmentation of original disk will
> increase.

Good point.

> We can simply add support back on demand. Now we want to publish
> copy-before-write filter, and instead of thinking how to pass
> use-copy-range argument to block-copy (create x-block-copy parameter
> for new public filter driver, or may be set it by hand after filter
> node creation?), instead of this let's just drop copy-range support in
> backup for now.
> 
> After this patch copy-range support in block-copy becomes unused. Let's
> keep it for a while, it won't hurt:
> 
> 1. If there would be request for supporting copy_range in backup
>     (and/or in a new public copy-before-write filter), it will be easy
>     to satisfy it.
> 
> 2. Probably, qemu-img convert will reuse block-copy, and qemu-img has
>     option to enable copy-range. qemu-img convert is not a backup, and
>     copy_range may be more reasonable for some cases in context of
>     qemu-img convert.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.h | 1 -
>   block/backup.c            | 3 +--
>   block/copy-before-write.c | 4 +---
>   3 files changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


