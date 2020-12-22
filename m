Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014552E0CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:01:53 +0100 (CET)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krk6h-0006wz-HL
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krk4t-0006Ds-GY
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krk4o-0005a3-Lh
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608652793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SsamPesHC+de3Nx3xIeL/ypNu9y6D2AC6U/DNP0nbMI=;
 b=a44+jGKQ1BwJkpXCrkMIQgysZn7ZnkQpAz9hpZZF40eI3clh2qg5eeXkhq8Nh3rIn3Zx7j
 VU1hdiJwUNDXOx7kV1GdARomP5whR6ynHoC8xmgghwUVyILMZi13NWu7cS8cvKM42Lt8Dm
 vzhFWm/S4KqxSDedhaNgTmTAaQi/uV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-nC-6wAfwNSGPg60s-PpmEQ-1; Tue, 22 Dec 2020 10:59:49 -0500
X-MC-Unique: nC-6wAfwNSGPg60s-PpmEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73B518C89C4;
 Tue, 22 Dec 2020 15:59:47 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 489885C8B8;
 Tue, 22 Dec 2020 15:59:42 +0000 (UTC)
Subject: Re: [PATCH v15 09/13] stream: rework backing-file changing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <48f91f57-3463-4f99-d15a-9a83446502f2@redhat.com>
Date: Tue, 22 Dec 2020 16:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216061703.70908-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.12.20 07:16, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Stream in stream_prepare calls bdrv_change_backing_file() to change
> backing-file in the metadata of bs.
> 
> It may use either backing-file parameter given by user or just take
> filename of base on job start.
> 
> Backing file format is determined by base on job finish.
> 
> There are some problems with this design, we solve only two by this
> patch:
> 
> 1. Consider scenario with backing-file unset. Current concept of stream
> supports changing of the base during the job (we don't freeze link to
> the base). So, we should not save base filename at job start,
> 
>    - let's determine name of the base on job finish.
> 
> 2. Using direct base to determine filename and format is not very good:
> base node may be a filter, so its filename may be JSON, and format_name
> is not good for storing into qcow2 metadata as backing file format.
> 
>    - let's use unfiltered_base
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>    [vsementsov: change commit subject, change logic in stream_prepare]
> ---
>   block/stream.c | 9 +++++----
>   blockdev.c     | 8 +-------
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
> index 6e281c71ac..6a525a5edf 100644
> --- a/block/stream.c
> +++ b/block/stream.c

[...]

> @@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
>   
>       if (bdrv_cow_child(unfiltered_bs)) {
>           const char *base_id = NULL, *base_fmt = NULL;
> -        if (base) {
> -            base_id = s->backing_file_str;
> -            if (base->drv) {
> -                base_fmt = base->drv->format_name;
> +        if (unfiltered_base) {
> +            base_id = s->backing_file_str ?: unfiltered_base->filename;
> +            if (unfiltered_base->drv) {
> +                base_fmt = unfiltered_base->drv->format_name;
>               }
>           }
>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);

I think I preferred the v14 behavior of not setting a backing file 
format if backing_file_str is nowhere to be found in the current backing 
chain.  (I just noticed, I had a typo in my reply to v14, though; the 
“continuing on with setting a backing_fmt” should have read “continuing 
on *without* setting a backing_fmt”...)

Anyway, this is still an improvement on the pre-patch behavior, so:

Reviewed-by: Max Reitz <mreitz@redhat.com>

(And as we discussed, the best would be for the user to specify a 
backing format through a yet-to-be-added option.)


