Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143A6217FE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQPR-0004Ve-MM; Tue, 08 Nov 2022 10:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osQPO-0004Uj-Nx
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osQPH-0005N6-HK
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667920853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bk9bI6JDfFt3gPWrBbTlrPjrBOlPUX8Sl8teRyjPzC0=;
 b=eWERFV16Ff03b4pOIZeb9J69LIpTzf26OBPRmzcGr7pH0nRaFto19LcslavOUj7rAoOkLZ
 l8vUMX+R9ynyxK/CWtXQaHIFKGI5hIHtIP05YB87qvD4UR6q1o5DS18Y3fV3mOVIzxIITy
 7pmi/4FoQ0iPBLl+4++jgd/U+CrbLmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-vwh4kflqMG6t_ku54RHA5g-1; Tue, 08 Nov 2022 10:20:50 -0500
X-MC-Unique: vwh4kflqMG6t_ku54RHA5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F09857D0F;
 Tue,  8 Nov 2022 15:20:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F9F340C83AD;
 Tue,  8 Nov 2022 15:20:47 +0000 (UTC)
Date: Tue, 8 Nov 2022 16:20:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/9] block: call bdrv_co_drain_begin in a coroutine
Message-ID: <Y2pzzuQ4E8VIwV0u@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-2-eesposit@redhat.com>
 <1a4627a3-e5c3-5ee7-d953-5719e5a019d1@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a4627a3-e5c3-5ee7-d953-5719e5a019d1@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Am 08.11.2022 um 15:33 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
> > It seems that bdrv_open_driver() forgot to create a coroutine
> > where to call bs->drv->bdrv_co_drain_begin(), a callback
> > marked as coroutine_fn.
> > 
> > Because there is no active I/O at this point, the coroutine
> > should end right after entering, so the caller does not need
> > to poll until it is finished.
> 
> Hmm. I see your point. But isn't it better to go the generic way and
> use a generated coroutine wrapper? Nothing guarantees that
> .bdrv_co_drain_begin() handlers will never do any yield point even on
> driver open...
> 
> Look for example at bdrv_co_check(). It has a generated wrapper
> bdrv_check(), declared in include/block/block-io.h
> 
> So you just need to declare the wrapper, and use it in
> bdrv_open_driver(), the code would be clearer too.

Note that if we apply the drain simplification series I sent today up to
at least patch 3 ('block: Revert .bdrv_drained_begin/end to
non-coroutine_fn') [1], then this patch isn't actually needed any more.

Kevin

[1] https://lists.gnu.org/archive/html/qemu-block/2022-11/msg00206.html


