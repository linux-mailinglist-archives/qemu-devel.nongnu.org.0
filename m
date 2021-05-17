Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BD383815
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:50:51 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifW5-0007JF-4b
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifUO-0005b2-AC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:49:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifUK-00012U-Nu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621266539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0UE78KEKOfekPPwEDJRor/35hC5+f2p+vd5hSCaQ7M=;
 b=aM4k0/Cs1jjFkwBVAMFMAwrfkI0KfXYugMCJfuLxzjjoH6T4ZavQZeE2dxUpncDDyoxnIc
 UsaOFhcZlYpMKGqtLOEJ7h7Y4BP0wMFvr7pdh6DG+H0DycKEBVxuqPImidv/RXNINjZYmU
 QDQJJ94dDbFJIEpjVV2mebPzAGFAJDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6RPKA1fkO2-xTG8W8b1BzA-1; Mon, 17 May 2021 11:48:57 -0400
X-MC-Unique: 6RPKA1fkO2-xTG8W8b1BzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9A38015DB;
 Mon, 17 May 2021 15:48:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E638160C9B;
 Mon, 17 May 2021 15:48:51 +0000 (UTC)
Subject: Re: [PATCH 04/21] qdev: allow setting drive property for realized
 device
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-6-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <90135147-4b08-3af2-cfde-aaa3dd397c17@redhat.com>
Date: Mon, 17 May 2021 17:48:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> We need an ability to insert filters above top block node, attached to
> block device. It can't be achieved with blockdev-reopen command. So, we
> want do it with help of qom-set.
> 
> Intended usage:
> 
> 1. blockdev-add, creating the filter, which child is at top node A,
>     attached to some guest block device.

Is a “not” missing here, i.e. “not attached to any guest block device”? 
  I would have thought one would create a filtered tree that is not in 
use by any frontend, so that the filter need not take any permissions.

> 2. qom-set, to change bs attached to root blk from original node to
>     newly create filter.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   hw/core/qdev-properties-system.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)

Looks good, just one question: (well, two, one was above)

> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 2760c21f11..7d97562654 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c

[...]

> @@ -196,6 +209,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
>   const PropertyInfo qdev_prop_drive = {
>       .name  = "str",
>       .description = "Node name or ID of a block device to use as a backend",
> +    .realized_set_allowed = true,
>       .get   = get_drive,
>       .set   = set_drive,
>       .release = release_drive,

Why not for qdev_prop_drive_iothread?

Max


