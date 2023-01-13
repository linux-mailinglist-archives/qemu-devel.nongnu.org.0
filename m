Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90380669D4E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGML2-0004t0-3B; Fri, 13 Jan 2023 10:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGMKk-0004lb-0m
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGMKi-0007PH-Ih
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673625067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRG+Lp1mHOpqN7Y7wXc6znLSs/xQYkmnfRAwJTX6i4Y=;
 b=HjLSm5l3jLl2mZ1fRHsK6csi3JAaJn6+/XKR+7t7hJss4UG0DmlkfPjJ9kIZzpBm/EMo9y
 bRJdoWLXt5eo+sjDCYcFEgcewqA6NRbPjteRx/GcH4PVCNzitvxWHZkp9AN7iZzvnFfxFQ
 LYgBlPjDuPohDuxdFlxVjXBaO/CGPQU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-cpabaLVyMz6iyAzonNFJrw-1; Fri, 13 Jan 2023 10:51:06 -0500
X-MC-Unique: cpabaLVyMz6iyAzonNFJrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E072E3C0F68E;
 Fri, 13 Jan 2023 15:51:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B595314171B7;
 Fri, 13 Jan 2023 15:51:04 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:51:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 02/14] block: Convert bdrv_io_plug() to co_wrapper
Message-ID: <Y8F95z2Z5gprCzlZ@redhat.com>
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-3-kwolf@redhat.com>
 <088f4a56-1ae1-2f3f-0412-c05f65ba6707@yandex-team.ru>
 <c4c1c417-bded-497f-b1bc-41af90d80dab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4c1c417-bded-497f-b1bc-41af90d80dab@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 19.12.2022 um 13:26 hat Emanuele Giuseppe Esposito geschrieben:
> Am 16/12/2022 um 17:12 schrieb Vladimir Sementsov-Ogievskiy:
> > On 12/13/22 11:53, Kevin Wolf wrote:
> >> --- a/include/block/block_int-common.h
> >> +++ b/include/block/block_int-common.h
> >> @@ -729,7 +729,7 @@ struct BlockDriver {
> >>       void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent
> >> event);
> >>         /* io queue for linux-aio */
> >> -    void (*bdrv_io_plug)(BlockDriverState *bs);
> >> +    void coroutine_fn (*bdrv_io_plug)(BlockDriverState *bs);
> > 
> > But you didn't add coroutine_fn to realizations of this callback. Seems,
> > it should be done
> 
> This has to be done by Paolo & Alberto Faria work to add missing
> coroutine_fn and various annotations in a systematic way. It has to be
> done using tools like vrc, and not manually because it's not feasible.
> Not covered by this serie.

I didn't want to change your patches too much (and I'm sure it has
nothing at all to do with laziness!), but Vladimir is really right.
Doing the renames in the final patch is a bit sloppy, just as not adding
coroutine_fn is.

I'll fix it for v2 to do all of the changes in the respective patches.

Kevin


