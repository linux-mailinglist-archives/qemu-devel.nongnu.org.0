Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD357E14A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:08:28 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErSF-0008A6-F1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMh-0008Vi-HN
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMb-0006Hk-Gc
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZKA16DD5aXsXwHfgNpLOQiVvBMGOsruRHXElQl5fw8=;
 b=DKpnfmRWfJzX/Sc16/FgoxJhjFXyvdtPhaTm50nbu5CeJmyYjQQcKj95pWy0pXtZ6I3izL
 pOQLNjvDp4aZU6naf+kc+DpRN2hfud+ywZ8V5H0NSDBEVDMgAncpdliziUI2gF4cvg/m0+
 UULOdOkQ/1ugXvPdrO7YEv9FivJSfAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-2IdAds_4P4Cixdf3RmrnNw-1; Fri, 22 Jul 2022 08:02:31 -0400
X-MC-Unique: 2IdAds_4P4Cixdf3RmrnNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56625811E75;
 Fri, 22 Jul 2022 12:02:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D831121315;
 Fri, 22 Jul 2022 12:02:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/3] target/arm: display deprecation status in '-cpu help'
Date: Fri, 22 Jul 2022 13:02:24 +0100
Message-Id: <20220722120224.2311982-4-berrange@redhat.com>
In-Reply-To: <20220722120224.2311982-1-berrange@redhat.com>
References: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a8b06410e..ef4e33f309 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8185,12 +8185,17 @@ static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    CPUClass *cc = CPU_CLASS(oc);
     const char *typename;
     char *name;
 
     typename = object_class_get_name(oc);
     name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
+    if (cc->deprecation_note) {
+        qemu_printf("  %s (deprecated)\n", name);
+    } else {
+        qemu_printf("  %s\n", name);
+    }
     g_free(name);
 }
 
-- 
2.36.1


