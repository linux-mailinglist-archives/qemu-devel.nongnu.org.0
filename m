Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2FD373DB2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:30:56 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIY8-00024Y-HG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIWD-0001Cn-4N
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:28:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIWA-0006aN-Ft
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620224929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=01MRtR27QdGkFBHzcyFcvVu0NXr777trt7jDfo3Pq9U=;
 b=dnIucvc/T7Ls+maKJUQqMaTDERCZldTe1cm/iTNmIavjFUiZBZ4qcWNZByob7mu/sVMeit
 S6GoUjsf2mFYcXcZ+YjKXAHeHirz9FC0sfmUw/l/y4RziUTyNnBZSw3k9gUBW0kVkJ6RlD
 m2C3zbahlqx0DnLKLGTLmUas3Wq1Fsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-AA2EJaMxPOawoCq5lltp6w-1; Wed, 05 May 2021 10:28:47 -0400
X-MC-Unique: AA2EJaMxPOawoCq5lltp6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5027A6D241;
 Wed,  5 May 2021 14:28:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9B95D6AC;
 Wed,  5 May 2021 14:28:41 +0000 (UTC)
Subject: Re: [PATCH v2 3/9] test-write-threshold: rewrite
 test_threshold_(not_)trigger tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-4-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f082362f-ec9e-9367-eede-9df7d14ef85b@redhat.com>
Date: Wed, 5 May 2021 16:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
> These tests use bdrv_write_threshold_exceeded() API, which is used only
> for test.

Well, now.  That used to be different before patch 1.

> Better is testing real API, which is used in block.c as well.
> 
> So, let's call bdrv_write_threshold_check_write(), and check is
> bs->write_threshold_offset cleared or not (it's cleared iff threshold
> triggered).
> 
> Also we get rid of BdrvTrackedRequest use here. Tracked requests are
> unrelated to write-threshold since we get rid of write notifiers.

The purpose behind the BdrvTrackedRequest was clearly because this is 
the object bdrv_write_threshold_exceeded() expected.  This reads like 
there was some other purpose (i.e. actually tracked requests), but there 
wasn’t.

The question that comes to my mind is why we had the 
bdrv_check_request() calls there, and why this patch removes them.  They 
seem unrelated to the write threshold, but someone must have thought 
something when adding them.

Looking into git blame, that someone is you :) (8b1170012b1)
Looks like you added those calls because BdrvTrackedRequest is a block 
layer structure, so getting rid of it means the reason for 
bdrv_check_request() disappears.  OK.

Reviewed-by: Max Reitz <mreitz@redhat.com>

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/unit/test-write-threshold.c | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
> index fc1c45a2eb..fd40a815b8 100644
> --- a/tests/unit/test-write-threshold.c
> +++ b/tests/unit/test-write-threshold.c
> @@ -55,41 +55,27 @@ static void test_threshold_multi_set_get(void)
>   
>   static void test_threshold_not_trigger(void)
>   {
> -    uint64_t amount = 0;
>       uint64_t threshold = 4 * 1024 * 1024;
>       BlockDriverState bs;
> -    BdrvTrackedRequest req;
>   
>       memset(&bs, 0, sizeof(bs));
> -    memset(&req, 0, sizeof(req));
> -    req.offset = 1024;
> -    req.bytes = 1024;
> -
> -    bdrv_check_request(req.offset, req.bytes, &error_abort);
>   
>       bdrv_write_threshold_set(&bs, threshold);
> -    amount = bdrv_write_threshold_exceeded(&bs, &req);
> -    g_assert_cmpuint(amount, ==, 0);
> +    bdrv_write_threshold_check_write(&bs, 1024, 1024);
> +    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, threshold);
>   }
>   
>   
>   static void test_threshold_trigger(void)
>   {
> -    uint64_t amount = 0;
>       uint64_t threshold = 4 * 1024 * 1024;
>       BlockDriverState bs;
> -    BdrvTrackedRequest req;
>   
>       memset(&bs, 0, sizeof(bs));
> -    memset(&req, 0, sizeof(req));
> -    req.offset = (4 * 1024 * 1024) - 1024;
> -    req.bytes = 2 * 1024;
> -
> -    bdrv_check_request(req.offset, req.bytes, &error_abort);
>   
>       bdrv_write_threshold_set(&bs, threshold);
> -    amount = bdrv_write_threshold_exceeded(&bs, &req);
> -    g_assert_cmpuint(amount, >=, 1024);
> +    bdrv_write_threshold_check_write(&bs, threshold - 1024, 2 * 1024);
> +    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
>   }
>   
>   typedef struct TestStruct {
> 


