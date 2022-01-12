Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D54048C235
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:27:18 +0100 (CET)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7aqb-0004vB-Bi
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:27:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7anT-0002qV-3G
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7anP-0002BC-Nt
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxtZu0tzZHK4lCBhGkC0KICyM1a/rMpSmx0WzsQC6p4=;
 b=GDoAXtgmyAOTtg2ldSofauAuc2/eSkRTVGuryw876fN1kYM9BuNAERWO7sNM+nl5UqNG2o
 aVeyNS1Pf07uuZZvNQ+6DR6OdAi42b+M3cOBgZUll2IcMNBuXmeGMnoTXHcjGVW6CAm0Wd
 YSe4CGy/vha9E+BlOjeJVgure0ZlWeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-4KV55viIOwSrHYPJ2n-a-w-1; Wed, 12 Jan 2022 05:23:57 -0500
X-MC-Unique: 4KV55viIOwSrHYPJ2n-a-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B01010144E1;
 Wed, 12 Jan 2022 10:23:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64B2C7B14C;
 Wed, 12 Jan 2022 10:23:49 +0000 (UTC)
Date: Wed, 12 Jan 2022 11:23:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/2] block-backend: prevent dangling BDS pointers
 across aio_poll()
Message-ID: <Yd6sNHrPuJkFw2Iv@redhat.com>
References: <20220111153613.25453-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111153613.25453-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.01.2022 um 16:36 hat Stefan Hajnoczi geschrieben:
> This series fixes use-after-free bugs when blk->root changes across aio_poll().
> For example, a temporary filter node can be removed by a blockjob when a
> drained section begins. If the caller doesn't hold a ref on the BDS then it
> will have been freed.
> 
> Hanna Reitz (1):
>   iotests/stream-error-on-reset: New test
> 
> Stefan Hajnoczi (1):
>   block-backend: prevent dangling BDS pointers across aio_poll()

Thanks, applied to the block branch.

Kevin


