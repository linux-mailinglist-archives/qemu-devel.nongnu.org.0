Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBC374328
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:56:52 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKpP-0000ju-D0
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leK5Z-0007hU-PB
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leK5V-0003br-Ec
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620230964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDCKDAq4NWZFDj+NngCy2Z5A2as7a85QSwu76tDEaJg=;
 b=bYecuwsr72DDwaJOhy/kZ6WLa+GbKyeCD/fnWzxnvgNvG3nOI/2vu2kbEoL2iKEoR41afy
 Ui7/3Hp246TwMZLm2V2atPaidW9QnQW7pDBNo6KSkHWGbFn2d0aEPcgSzbvVGDr7pFndPr
 0VW7YtrTN5GOUHfCgfPO5x22rW8Z6y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-0Tj7fRMXPR6LMvAFyf8RrA-1; Wed, 05 May 2021 12:09:20 -0400
X-MC-Unique: 0Tj7fRMXPR6LMvAFyf8RrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740B86D24A;
 Wed,  5 May 2021 16:09:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F179860C17;
 Wed,  5 May 2021 16:09:13 +0000 (UTC)
Subject: Re: [PATCH v2 5/9] block/write-threshold: don't use aio context lock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-6-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ec4d641b-d73b-f0f4-b320-4e25763c38b1@redhat.com>
Date: Wed, 5 May 2021 18:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: fam@euphon.net, kwolf@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
> Instead of relying on aio context lock, let's make use of atomic
> operations.
> 
> The tricky place is bdrv_write_threshold_check_write(): we want
> atomically unset bs->write_threshold_offset iff
>    offset + bytes > bs->write_threshold_offset
> We don't have such atomic operation, so let's go in a loop:

This could also be solved by untangling the overloaded meaning of 
write_threshold_offset – if we had an additional boolean 
write_threshold_check, then this wouldn’t be a problem, and we could do 
this:

if (end > bdrv_write_threshold_get(bs)) {
     if (qatomic_xchg(&bs->write_threshold_check, false) == true) {
         qapi_event_send(...);
     }
}

However, the problem then becomes thinking about the memory access 
semantics, because if some other thread sets the threshold offset and 
enables the threshold check, we need to ensure that we see the updated 
offset here...

So I suppose your loop is simpler then.

> 1. fetch wtr atomically
> 2. if condition satisfied, try cmpxchg (if not satisfied, we are done,
>     don't send event)
> 3. if cmpxchg succeeded, we are done (send event), else go to [1]
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/write-threshold.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


