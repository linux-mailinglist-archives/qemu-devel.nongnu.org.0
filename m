Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A4373B99
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:42:09 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGqu-0004wH-Lc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leGpJ-0004Ek-Pq
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leGpF-0002AE-PK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620218423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liseBQwn0gFaQ+PdELHEsDlmtkO6SeXnoa8rtecu5XQ=;
 b=POzokx+nyZIWxl3w2eJ7kKHRqdYmmeU09LCwWBQrzfGuAU3a0BuvO72WpoaDV1ROGrJFT6
 V74cGIv80X68yb8Ate2rBcpxx8zB4Hw4V5tQAeQiATc5f5OLaFDP4dVM9ifuLk0+TPQwRT
 pM8AulbwOhPanqjzmVIZupOp4vtGKfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-0fvQo7oMOKu6afBk8Kr2-w-1; Wed, 05 May 2021 08:40:21 -0400
X-MC-Unique: 0fvQo7oMOKu6afBk8Kr2-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E833F1008060;
 Wed,  5 May 2021 12:40:20 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8FF610016FD;
 Wed,  5 May 2021 12:40:15 +0000 (UTC)
Subject: Re: [PATCH v2 2/9] block: drop write notifiers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-3-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <04889e15-1f27-7cc3-0972-b4bba08cd87b@redhat.com>
Date: Wed, 5 May 2021 14:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-3-vsementsov@virtuozzo.com>
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
> They are unused now.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block_int.h | 12 ------------
>   block.c                   |  1 -
>   block/io.c                |  6 ------
>   3 files changed, 19 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


