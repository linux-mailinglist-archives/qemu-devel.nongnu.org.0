Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DEA2F2DE1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:28:33 +0100 (CET)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHqi-0001ot-V6
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzHDh-0006vV-Py
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzHDe-0004I6-SU
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610448489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nb35rtweCcVfONanNeq8LpgS2IiBnXrqt6I7HCRUoeE=;
 b=cuYnHv9z8GMoeF8xg46eYnlEWQLa26JRRgYlyAxzyz0EKGjsYbEyXaOZL6I7adt8b0vMWy
 Vlbcwtyet3cGEuBwuEZaUd1fJc9jx9Y0wYE7oGsg/anP6bR/aQ1fnpDA43ZLhmrJNAmMZ4
 9QqwySnuRSqfg8iM4FDYA8ht12uRTLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-i5o4DhYqPrCn0tEdizOBxw-1; Tue, 12 Jan 2021 05:48:07 -0500
X-MC-Unique: i5o4DhYqPrCn0tEdizOBxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CD59CC09;
 Tue, 12 Jan 2021 10:48:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D2310002A6;
 Tue, 12 Jan 2021 10:48:03 +0000 (UTC)
Subject: Re: [PATCH v3 07/25] block/block-copy: add ratelimit to block-copy
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-8-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e7ae11c0-600a-5ed3-9f41-72e4c6ff8e9c@redhat.com>
Date: Tue, 12 Jan 2021 11:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.20 18:17, Vladimir Sementsov-Ogievskiy wrote:
> We are going to directly use one async block-copy operation for backup
> job, so we need rate limiter.
> 
> We want to maintain current backup behavior: only background copying is
> limited and copy-before-write operations only participate in limit
> calculation. Therefore we need one rate limiter for block-copy state
> and boolean flag for block-copy call state for actual limitation.
> 
> Note, that we can't just calculate each chunk in limiter after
> successful copying: it will not save us from starting a lot of async
> sub-requests which will exceed limit too much. Instead let's use the
> following scheme on sub-request creation:
> 1. If at the moment limit is not exceeded, create the request and
> account it immediately.
> 2. If at the moment limit is already exceeded, drop create sub-request
> and handle limit instead (by sleep).
> With this approach we'll never exceed the limit more than by one
> sub-request (which pretty much matches current backup behavior).
> 
> Note also, that if there is in-flight block-copy async call,
> block_copy_kick() should be used after set-speed to apply new setup
> faster. For that block_copy_kick() published in this patch.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  5 ++++-
>   block/backup-top.c         |  2 +-
>   block/backup.c             |  2 +-
>   block/block-copy.c         | 46 +++++++++++++++++++++++++++++++++++++-
>   4 files changed, 51 insertions(+), 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


