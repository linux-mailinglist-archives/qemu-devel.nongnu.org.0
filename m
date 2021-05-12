Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174A37D0D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:43:40 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgstX-0001fj-74
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgshl-000678-38
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgshg-0007tX-Pf
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620840684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vkj0eH1H8tW2AAoWJwYI9NPy+YKvbywJoOkPRbwp/QQ=;
 b=Kbn/70HJ0LD4P7zqXcg8QS7MveLgp4zBkFwbQVL3EGMipfWTkTwdP0pH/Juo+1IRG7cBs4
 8P5UhAsWYbJ47yKfDNw5NApuWBl6SZYM9l+t7/IoWQ5sqaorIOInQ5LA++SU10GcLlcHNZ
 VqtQiXGATYmtkGugI7HmJJT1RTSvC5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-pwBgdOo8P2u84Tay29f5kA-1; Wed, 12 May 2021 13:31:21 -0400
X-MC-Unique: pwBgdOo8P2u84Tay29f5kA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 760778014D8;
 Wed, 12 May 2021 17:31:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-121.ams2.redhat.com
 [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23BA46D8C4;
 Wed, 12 May 2021 17:31:12 +0000 (UTC)
Subject: Re: [PATCH v3 0/8] block: refactor write threshold
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <1f1948bd-4d2b-98b8-2e54-e02704696add@redhat.com>
Date: Wed, 12 May 2021 19:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On 06.05.21 11:06, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v3:
> 01-04,06,07: add Max's r-b.
> 01: improve commit msg and comments
> 03: improve commit msg
> 05: add more comments and qemu/atomic.h include
> 08: new, replacement for v2:08,09
> 
> Vladimir Sementsov-Ogievskiy (8):
>    block/write-threshold: don't use write notifiers
>    block: drop write notifiers
>    test-write-threshold: rewrite test_threshold_(not_)trigger tests
>    block/write-threshold: drop extra APIs
>    block/write-threshold: don't use aio context lock
>    test-write-threshold: drop extra tests
>    test-write-threshold: drop extra TestStruct structure
>    write-threshold: deal with includes
> 
>   include/block/block_int.h         |  19 ++---
>   include/block/write-threshold.h   |  31 +++------
>   block.c                           |   1 -
>   block/io.c                        |  11 +--
>   block/write-threshold.c           | 111 +++++++-----------------------
>   tests/unit/test-write-threshold.c |  90 ++----------------------
>   6 files changed, 52 insertions(+), 211 deletions(-)

Thanks, I’ve applied all patches but patch 5 to my block branch, with 
the changes Eric has suggested:

https://github.com/XanClic/qemu/commits/block

Max


