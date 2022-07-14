Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1373E575182
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:14:41 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Y3-0002vi-VY
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RV-0005MT-Nw
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RQ-0000Ri-08
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHlnVLDD50+AMq+R96FEN4NDKh0OfZSxWHH0hVRtk0U=;
 b=FL2Q/ryrJXtASIGoqEgG66N+vntgsWTwIO7UwaokPGtlncGyDxsontzgFlJ8xqCQXqMbnS
 thXFjnfiHb7s5W1nTSO+duiadOW0IHE/i6+39hJ188lSc0nE0ssZWHu5LQywbwZ2yz0R5A
 UK2FumnAFesnrOGkUHHfqk1JBe9LdA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-4Fy5zrzQNhKQdGr1GFDFhA-1; Thu, 14 Jul 2022 11:07:43 -0400
X-MC-Unique: 4Fy5zrzQNhKQdGr1GFDFhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35EDC85A588;
 Thu, 14 Jul 2022 15:07:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D3F82166B26;
 Thu, 14 Jul 2022 15:07:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/3] target/i386: display deprecation note in '-cpu help'
Date: Thu, 14 Jul 2022 16:07:33 +0100
Message-Id: <20220714150735.1835166-2-berrange@redhat.com>
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
References: <20220714150735.1835166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The deprecation notes are currently only displayed at runtime when the
user activates a CPU. The QMP query displays a simple flag for
deprecation, while '-cpu help' displays nothing unless the deprecation
info is duplicated into the 'notes' field.

This changes the code so that deprecation notes are explicitly shown
in '-cpu help', to assist the user in deciding what to use.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..a2c5dcfc04 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4833,10 +4833,21 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     if (!desc && cc->model && cc->model->note) {
         desc = g_strdup_printf("%s [%s]", model_id, cc->model->note);
     }
-    if (!desc) {
+    if (!desc && *model_id) {
         desc = g_strdup_printf("%s", model_id);
     }
 
+    if (cc->model && cc->model->cpudef->deprecation_note) {
+        g_autofree char *dep = g_strdup_printf(
+            "(deprecated: %s)", cc->model->cpudef->deprecation_note);
+        if (desc) {
+            g_autofree char *olddesc = desc;
+            desc = g_strdup_printf("%s %s", olddesc, dep);
+        } else {
+            desc = g_steal_pointer(&dep);
+        }
+    }
+
     qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
-- 
2.36.1


