Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDA22CBB87
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:28:11 +0100 (CET)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQIr-0000qq-Sm
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkQ3r-00031b-DS
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kkQ3o-0006NE-MO
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hbAuA9iTipgGITFijin1R/Mw+XmN9YONmLsV2jd12lw=;
 b=K+bZ9F60BV5wDyT7oGZEhSUb/Uq8+NDel+5dct/3uUzBAmjlDUXMFFzzw717LTJbTj+w3g
 4W4Gd8CdyfYuMnzk8Ii0wvFsu7mlKTYfQrwJqpkDQKuEqU4QS6/omZ6pB/kv0twb834KZP
 g9Diffd50V5J6mzdV2eHpcI9vgPwIYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-lDOjYFQFO0yjzIQZ1EfV_w-1; Wed, 02 Dec 2020 06:12:34 -0500
X-MC-Unique: lDOjYFQFO0yjzIQZ1EfV_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA1C8800D55;
 Wed,  2 Dec 2020 11:12:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-199.ams2.redhat.com [10.36.113.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 181605B4A0;
 Wed,  2 Dec 2020 11:12:27 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:12:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH 3/4] block/throttle-groups.c: Use lock guard macros
Message-ID: <20201202111226.GD16765@merkur.fritz.box>
References: <20201109154327.325675-1-ganqixin@huawei.com>
 <20201109154327.325675-4-ganqixin@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201109154327.325675-4-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, dnbrdsky@gmail.com,
 stefanha@redhat.com, kuhn.chenqun@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.11.2020 um 16:43 hat Gan Qixin geschrieben:
> Replace manual lock()/unlock() calls with lock guard macros
> (QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/throttle-groups.c.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

> @@ -638,14 +636,14 @@ void throttle_group_detach_aio_context(ThrottleGroupMember *tgm)
>      assert(qemu_co_queue_empty(&tgm->throttled_reqs[1]));
>  
>      /* Kick off next ThrottleGroupMember, if necessary */
> -    qemu_mutex_lock(&tg->lock);
> -    for (i = 0; i < 2; i++) {
> -        if (timer_pending(tt->timers[i])) {
> -            tg->any_timer_armed[i] = false;
> -            schedule_next_request(tgm, i);
> +     WITH_QEMU_LOCK_GUARD(&tg->lock) {

Indentation is off.

> +        for (i = 0; i < 2; i++) {
> +            if (timer_pending(tt->timers[i])) {
> +                tg->any_timer_armed[i] = false;
> +                schedule_next_request(tgm, i);
> +            }
>          }
>      }
> -    qemu_mutex_unlock(&tg->lock);
>  
>      throttle_timers_detach_aio_context(tt);
>      tgm->aio_context = NULL;

Kevin


