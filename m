Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACDF5F9D0F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:50:41 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqMp-0005aS-TT
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohqJQ-0003EZ-BJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ohqJO-0008M8-6e
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665398825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DFqweI3dhVzf5PJa0t9Q1VxMimczQ4JPvpJqPSH56s=;
 b=CKtmKxCyYoCKE8oXPt0/Z6Wb/ra2sDSKrJhC3sc4CZ8/59zU4QAajyizm373rTNn0aZzfg
 n4xjxVFrpvUy10v3aBrpzCtH0vnHivFVBl0HhXlz9lsaySAxxcNT6WVwgsmM/2MJb0q3Ir
 gWk50PWADAApqk2z7QL2MCwg9IoN9BM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-YYwq_5VVM6CSxBr6kqNyGg-1; Mon, 10 Oct 2022 06:47:01 -0400
X-MC-Unique: YYwq_5VVM6CSxBr6kqNyGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 656CA29AA39C;
 Mon, 10 Oct 2022 10:47:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F9E215CDC3;
 Mon, 10 Oct 2022 10:46:59 +0000 (UTC)
Date: Mon, 10 Oct 2022 12:46:58 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/11] blockjob: implement .change_aio_ctx in child_job
Message-ID: <Y0P4IvOnNl6lTioI@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
> child_job_change_aio_ctx() is very similar to
> child_job_can_set_aio_ctx(), but it implements a new transaction
> so that if all check pass, the new transaction's .commit()
> will take care of changin the BlockJob AioContext.
> child_job_set_aio_ctx_commit() is similar to child_job_set_aio_ctx(),
> but it doesn't need to invoke the recursion, as this is already
> taken care by child_job_change_aio_ctx().
> 
> Note: bdrv_child_try_change_aio_context() is not called by
> anyone at this point.
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


