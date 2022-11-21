Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCB63283E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8kk-00007e-Lh; Mon, 21 Nov 2022 10:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox8kj-000079-5j
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox8kc-0006jX-OM
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669044614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3677qYFQQduEomEx7XAA/faE59jA+gxtSXP9YniNDYk=;
 b=Q9YqzYosn5ETeTinKKXJU/OBlgOFOxGArd7LT58TKHI0APw65ehd4EF661AYwGh1N7RFjW
 jRe4Ud7Ay98YB56yevs3NVrDeiSo0yAMzZl9tk8N6l0iw0uqKXDi02O9rAeFYeTssm/20x
 x/ggvVIqYCdggP8EBSvBS3ZLO0UG68M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-43eTt_GbPPGfV3LN6z1UIg-1; Mon, 21 Nov 2022 10:30:10 -0500
X-MC-Unique: 43eTt_GbPPGfV3LN6z1UIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D8E101A528;
 Mon, 21 Nov 2022 15:30:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1A92166B26;
 Mon, 21 Nov 2022 15:30:08 +0000 (UTC)
Date: Mon, 21 Nov 2022 16:30:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 05/11] block-coroutine-wrapper.py: default to main
 loop aiocontext if function does not have a BlockDriverState parameter
Message-ID: <Y3uZfAWotAr9IMGe@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> Basically BdrvPollCo->bs is only used by bdrv_poll_co(), and the
> functions that it uses are both using bdrv_get_aio_context, that
> defaults to qemu_get_aio_context() if bs is NULL.
> 
> Therefore pass NULL to BdrvPollCo to automatically generate a function
> that create and runs a coroutine in the main loop.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

It happens to work, but it's kind of ugly to call bdrv_coroutine_enter()
and BDRV_POLL_WHILE() with a NULL bs.

How hard would it be to generate code that doesn't use these functions,
but directly aio_co_enter() and AIO_WAIT_WHILE() for wrappers that are
not related to a BDS?

Kevin


