Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CD32D541
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:27:06 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHowT-0006ie-IU
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHouU-0005sy-85
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHouS-0005HU-ST
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614867900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2E1X1lR0DjkyYTgQB8Y3379Zi+QRygMbNedF7TZdk2k=;
 b=jPhfVBsEuqWBPuWYXAzZYAKf7Xo3yOoQVO64EKH5WwvzQuSH9Nq9iD6QLzDjxbZRoXQ5lB
 CUGQff9zud2HoVfhKj4h5TAu0HEt/XObA2bRYPj6VjhvjLFoW8os+gn2V9OjeSTCbyirmB
 EvgRrcpzbll5zezt2EF6cEcE+P24y/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-X4EG44UNOCqva_jCAIBF3g-1; Thu, 04 Mar 2021 09:24:58 -0500
X-MC-Unique: X4EG44UNOCqva_jCAIBF3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA5C19057B9;
 Thu,  4 Mar 2021 14:24:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B6E2BFEB;
 Thu,  4 Mar 2021 14:24:51 +0000 (UTC)
Date: Thu, 4 Mar 2021 15:24:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 3/6] block/parallels: BDRVParallelsState: add
 cluster_size field
Message-ID: <20210304142450.GD9607@merkur.fritz.box>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210224104707.88430-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2021 um 11:47 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We are going to use it in more places, calculating
> "s->tracks << BDRV_SECTOR_BITS" doesn't look good.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> @@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>          ret = -EFBIG;
>          goto fail;
>      }
> +    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
>  
>      s->bat_size = le32_to_cpu(ph.bat_entries);
>      if (s->bat_size > INT_MAX / sizeof(uint32_t)) {

Checking the context, I saw this a few lines above:

    if (s->tracks > INT32_MAX/513) {

Is the 513 intentional?

Kevin


