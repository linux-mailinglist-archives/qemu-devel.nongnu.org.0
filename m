Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414B6EE2E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIZ5-0002Qk-V9; Tue, 25 Apr 2023 09:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVU-0006rU-4z
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006bx-Ph
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDK2bWRoL1fPnb9JRW8yfhaM5CIPpA07SEoVN8s0gKI=;
 b=dQu1t2tiXv2Rs4IqlOs9SKxqIbRyvs+V+/rS4NYzfp8+nXquOIob8A5NbCdP8URsO6YAsQ
 k/d7kdTOQzthtZ3cPd7yBOTBasghQNh5glSW0XDldxrp9XjDeAFkSLBQDOHDmlLMeAMdup
 vzXZc/SUsm3QMkZEVyB/pVoc/AfCqvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-NddgkydNPPSRGeGsK_Ap5A-1; Tue, 25 Apr 2023 09:14:24 -0400
X-MC-Unique: NddgkydNPPSRGeGsK_Ap5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47DF98828C1;
 Tue, 25 Apr 2023 13:14:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E41D40C2064;
 Tue, 25 Apr 2023 13:14:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 21/25] qemu-pr-helper: mark more coroutine_fns
Date: Tue, 25 Apr 2023 15:13:55 +0200
Message-Id: <20230425131359.259007-22-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

do_sgio can suspend via the coroutine function thread_pool_submit_co, so it
has to be coroutine_fn as well---and the same is true of all its direct and
indirect callers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230309084456.304669-7-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scsi/qemu-pr-helper.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index e9b3ad259a..a857e80c03 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -177,8 +177,8 @@ static int do_sgio_worker(void *opaque)
     return status;
 }
 
-static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *buf, int *sz, int dir)
+static int coroutine_fn do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
+                                uint8_t *buf, int *sz, int dir)
 {
     int r;
 
@@ -319,7 +319,7 @@ static SCSISense mpath_generic_sense(int r)
     }
 }
 
-static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
+static int coroutine_fn mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
 {
     switch (r) {
     case MPATH_PR_SUCCESS:
@@ -371,8 +371,8 @@ static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
     }
 }
 
-static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                           uint8_t *data, int sz)
+static int coroutine_fn multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+                                        uint8_t *data, int sz)
 {
     int rq_servact = cdb[1];
     struct prin_resp resp;
@@ -426,8 +426,8 @@ static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
     return mpath_reconstruct_sense(fd, r, sense);
 }
 
-static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                            const uint8_t *param, int sz)
+static int coroutine_fn multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+                                         const uint8_t *param, int sz)
 {
     int rq_servact = cdb[1];
     int rq_scope = cdb[2] >> 4;
@@ -544,8 +544,8 @@ static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
 }
 #endif
 
-static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *data, int *resp_sz)
+static int coroutine_fn do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+                                 uint8_t *data, int *resp_sz)
 {
 #ifdef CONFIG_MPATH
     if (is_mpath(fd)) {
@@ -562,8 +562,8 @@ static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
                    SG_DXFER_FROM_DEV);
 }
 
-static int do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                     const uint8_t *param, int sz)
+static int coroutine_fn do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+                                  const uint8_t *param, int sz)
 {
     int resp_sz;
 
-- 
2.40.0


