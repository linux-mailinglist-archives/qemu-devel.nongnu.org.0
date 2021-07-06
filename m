Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBF3BDBF4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:08:21 +0200 (CEST)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oYW-00071l-SH
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0oWz-0004qH-8E
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:06:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0oWx-0000ao-H2
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625591203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2d875CdiZ9CQ9cjGWVunbiJRwN7aSzZpFVSHPwM/rXw=;
 b=a6+5DjfkSW5vtde73SxRIwYQrdb3ifnUFO90Oa29+VtMmY+sCAFfTLOkzvM5vaF0eEn6J6
 HFf1IJNEs2flumhm1W+08M96Cw8lMZI4nCDnIZLRpB7CO6YuQgnD9WOdbQ8T1vX4hyAiFG
 pmD9Luf2uoWWNiB0lBFa4Q+9gSVhFzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-DCU4zhyZNgei5C7Hd-snLg-1; Tue, 06 Jul 2021 13:06:39 -0400
X-MC-Unique: DCU4zhyZNgei5C7Hd-snLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF25E804302;
 Tue,  6 Jul 2021 17:06:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9243D5C1D5;
 Tue,  6 Jul 2021 17:06:37 +0000 (UTC)
Date: Tue, 6 Jul 2021 19:06:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 0/6] block: block-status cache for data regions
Message-ID: <YOSNnK5VVT+vukwK@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210623150143.188184-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.06.2021 um 17:01 hat Max Reitz geschrieben:
> Hi,
> 
> See the cover letter from v1 for the general idea:
> 
> https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg00843.html
> 
> 
> The biggest change here in v2 is that instead of having a common CoMutex
> protect the block-status cache, we’re using RCU now.  So to read from
> the cache, or even to invalidate it, no lock is needed, only to update
> it with new data.
> 
> Disclaimer: I have no experience with RCU in practice so far, neither in
> qemu nor anywhere else.  So I hope I’ve used it correctly...

This I hope as well. :-)

With the missing qatomic_rcu_read() added:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


