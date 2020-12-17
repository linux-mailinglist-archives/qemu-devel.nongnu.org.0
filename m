Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F42DD90C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:05:22 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyaX-0008Ed-CV
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIb-0006Vk-Ji
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIa-00020C-0p
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j44rIim2jTOUHVnyXT1njY81jJLoFkr2v/m64iTKiAM=;
 b=XPTNsr3qa2/9pxrGZa57vYTvvgrZEJ3mlkJIBwA289ADdRUcx2JVswwbqYjR4j/H6y7BYK
 SgSKEfFsZiWLy6ceBcGrDOTpamPtwCL8x8dgcLxNMF1n2KUHnQh/ESTXAM4sBWplC9NhJe
 28Acqux8oKzxkRZeFcpoQP0ldC5e09g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-sixR0uBrOZyESF45BQUwOg-1; Thu, 17 Dec 2020 13:46:44 -0500
X-MC-Unique: sixR0uBrOZyESF45BQUwOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E5C8800D53;
 Thu, 17 Dec 2020 18:46:42 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242B019C71;
 Thu, 17 Dec 2020 18:46:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/17] tcg: Make CPUClass.debug_excp_handler optional
Date: Thu, 17 Dec 2020 13:46:19 -0500
Message-Id: <20201217184620.3945917-17-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201212155530.23098-12-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 accel/tcg/cpu-exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 36dde32ff9..8689c54499 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -482,7 +482,9 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
         }
     }
 
-    cc->debug_excp_handler(cpu);
+    if (cc->debug_excp_handler) {
+        cc->debug_excp_handler(cpu);
+    }
 }
 
 static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
-- 
2.28.0


