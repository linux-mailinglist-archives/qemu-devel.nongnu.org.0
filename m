Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62B57B3EC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:32:40 +0200 (CEST)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE64N-0002fp-RF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dC-0000cN-Oa
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dA-0001WJ-0v
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GvXipf6687yqbpp29H53ftxEHpjHLircYN+XUGxjUo=;
 b=br8/uXoFcMaDju/sy+rsVtHDi2OX4AniNtgnZJIOjNPf7P+vdYtUFHZTWNGv+o1nGYeGdK
 pMpfm8IdS6G3VdSpMN/Ou7eJDwebRT4nk+D4yreUEfTHqJgUCYYXrg/YXi87ljjN7RYi4s
 1Lcn7Gm2mT/Idjuqt/HRMS1NfDiGFi4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-oL4R2jEeNoSyMEL_vGE5xw-1; Wed, 20 Jul 2022 05:04:27 -0400
X-MC-Unique: oL4R2jEeNoSyMEL_vGE5xw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A03C29ABA11;
 Wed, 20 Jul 2022 09:04:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60F85492C3B;
 Wed, 20 Jul 2022 09:04:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>, Like Xu <like.xu@linux.intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 22/25] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
Date: Wed, 20 Jul 2022 17:03:10 +0800
Message-Id: <20220720090313.55169-23-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Zhang Chen <chen.zhang@intel.com>

If the checkpoint occurs when the guest finishes restarting
but has not started running, the runstate_set() may reject
the transition from COLO to PRELAUNCH with the crash log:

{"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
"event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'

Long-term testing says that it's pretty safe.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 softmmu/runstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index fac7b63..168e1b7 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -126,6 +126,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
 
     { RUN_STATE_COLO, RUN_STATE_RUNNING },
+    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
     { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
 
     { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
-- 
2.7.4


