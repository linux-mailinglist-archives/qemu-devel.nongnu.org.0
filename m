Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE87373DDD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:43:22 +0200 (CEST)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIkD-00056k-7N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIic-0003yy-RS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leIiZ-0005gJ-CS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620225698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSUfofrtnPzM968woQH3vk4oEFUWGg3NDam3kiR2lI4=;
 b=Q7lk+2itR7rC/QX9ckfiDwrVb4F1aWsVhqMo5wP+ugMZYlajdPdstolx8Caz6uH7Bg+XMB
 alrbEFhHpxgO+SgGX7T9InZVjRj9bDMWHjf3mEXOsE9YGcOru5a6nE2oLGGz5SNWyIuFei
 fi7v4CoEDYH5VIiClfuuxgyLJ5lgZYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-hKgXTcrhNfKkwP3v4pgG5Q-1; Wed, 05 May 2021 10:41:36 -0400
X-MC-Unique: hKgXTcrhNfKkwP3v4pgG5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7818580D686;
 Wed,  5 May 2021 14:41:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03A9A53CC3;
 Wed,  5 May 2021 14:41:28 +0000 (UTC)
Subject: Re: [PATCH v2 4/9] block/write-threshold: drop extra APIs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <72ea8fac-d9a3-dbf0-c4be-60482d603bb9@redhat.com>
Date: Wed, 5 May 2021 16:41:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504082553.20377-5-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
> bdrv_write_threshold_exceeded() is unused at all.
> 
> bdrv_write_threshold_is_set() is used only to double check the value of
> bs->write_threshold_offset in tests. No real sense in it (both tests do
> check real value with help of bdrv_write_threshold_get())

Well, depends on how one sees it.  One could also say that it neatly 
hides the fact that a threshold of 0 means disabled (i.e. the overloaded 
meaning of the write_threshold_offset attribute).

*shrug*

Reviewed-by: Max Reitz <mreitz@redhat.com>

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/write-threshold.h   | 24 ------------------------
>   block/write-threshold.c           | 19 -------------------
>   tests/unit/test-write-threshold.c |  4 ----
>   3 files changed, 47 deletions(-)


