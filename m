Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FC62FDC6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 20:09:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow6is-0004m0-Us; Fri, 18 Nov 2022 14:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6ip-0004lB-LT
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:08:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6io-0006nc-A6
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668798497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sD+HUCOT8JQ4jS7l4t2GSH1IFGXPWWh3XVjU+VE2/H4=;
 b=YbxDtIBoiISMvMYmh7VlFszjvz8tQl9b5cZVlpN4+p0EYr609hzPE1hAT9z9+9zX+uSRv8
 990aRlAjsq7WoT2jKfe5Tq+KSoSnZsm7e9pXGiBxHC+27WG7ybwKxpk93Ra5PDyHLpQin3
 FkwIvK8dDy+2eWezQV4nmV6hRY8CBpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-pzvUY96UNcCOQcvnozC1Zw-1; Fri, 18 Nov 2022 14:08:14 -0500
X-MC-Unique: pzvUY96UNcCOQcvnozC1Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2FF185A78B;
 Fri, 18 Nov 2022 19:08:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6A01121325;
 Fri, 18 Nov 2022 19:08:12 +0000 (UTC)
Date: Fri, 18 Nov 2022 20:08:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/11] nbd/server.c: add missing coroutine_fn
 annotations
Message-ID: <Y3fYGWTGo35lPBQ7@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> These functions end up calling bdrv_*() implemented as generated_co_wrapper
> functions.
> In addition, they also happen to be always called in coroutine context,
> meaning all callers are coroutine_fn.
> This means that the g_c_w function will enter the qemu_in_coroutine()
> case and eventually suspend (or in other words call qemu_coroutine_yield()).
> Therefore we need to mark such functions coroutine_fn too.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Here, too, it would be better to convert the callers to new blk_co_*()
wrappers instead of going through g_c_w even though we know that we are
in coroutine context.

Doesn't make the patch less correct, though.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


