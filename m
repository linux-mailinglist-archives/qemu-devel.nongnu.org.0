Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D285A28B4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 15:37:54 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRZWt-0002Ob-Va
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 09:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZH8-00014Q-LZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oRZGx-0003zr-Af
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 09:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661520078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKqVznNy8akJg1iTy9Jd+SVAEogFydiIAa9+NwW7cgw=;
 b=Q5NMWcwF8ofnYjValTpjsFVSeBch8lOkvdFeBzOkTCB5W4Nwk/Nilj28lkSfJohyWh1lFK
 uenoWvMLAUr7/KSMO0cWxfR4BzMtpYKfKMgJH67oNmCR99egtCJGs0PnotlvCOFsc2y3z4
 Z6fegnQ+gjJRbXkl3xaxj3V6LoKGzd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-8s4AMkREOKedqW8O4AOqeg-1; Fri, 26 Aug 2022 09:21:15 -0400
X-MC-Unique: 8s4AMkREOKedqW8O4AOqeg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27DA085A58F;
 Fri, 26 Aug 2022 13:21:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C54AE492C3B;
 Fri, 26 Aug 2022 13:21:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v11 19/21] block_job_query: remove atomic read
Date: Fri, 26 Aug 2022 09:21:02 -0400
Message-Id: <20220826132104.3678958-20-eesposit@redhat.com>
In-Reply-To: <20220826132104.3678958-1-eesposit@redhat.com>
References: <20220826132104.3678958-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Not sure what the atomic here was supposed to do, since job.busy
is protected by the job lock. Since the whole function
is called under job_mutex, just remove the atomic.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockjob.c b/blockjob.c
index d04f804001..120c1b7ead 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -338,7 +338,7 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
     info = g_new0(BlockJobInfo, 1);
     info->type      = g_strdup(job_type_str(&job->job));
     info->device    = g_strdup(job->job.id);
-    info->busy      = qatomic_read(&job->job.busy);
+    info->busy      = job->job.busy;
     info->paused    = job->job.pause_count > 0;
     info->offset    = progress_current;
     info->len       = progress_total;
-- 
2.31.1


