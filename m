Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E176E5751B8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:23:20 +0200 (CEST)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0gR-00040H-UP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RX-0005Rd-9J
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RT-0000SJ-40
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIEKp4A/euRwpuaAoyZCuunfabQKRWXCvWPVhNg11Os=;
 b=NYTjkNec045WL+n0gTS+qqoeIdqrI938aBb8jK/P9L1DHmrh53qsxNuOJir3F7+0OYb+yG
 /BBPJy0QKGmW/HmjzsVQ3rDhO4bORHipc27lzXH2KDLO09ROHTreuejziT8YAX1VM0X4tL
 FAahdzM1PLc4SUy4kX1s8cRigS/IFrE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-GFH_VTacMpaoLRqyq5-QQg-1; Thu, 14 Jul 2022 11:07:47 -0400
X-MC-Unique: GFH_VTacMpaoLRqyq5-QQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E48C31C05AE0;
 Thu, 14 Jul 2022 15:07:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9E02166B26;
 Thu, 14 Jul 2022 15:07:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] target/arm: display deprecation note in '-cpu help'
Date: Thu, 14 Jul 2022 16:07:35 +0100
Message-Id: <20220714150735.1835166-4-berrange@redhat.com>
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

The deprecation notes are currently only displayed at runtime when the
user activates a CPU. The QMP query displays a simple flag for
deprecation, while '-cpu help' displays nothing unless the deprecation
info is duplicated into the 'notes' field.

This changes the code so that deprecation notes are explicitly shown
in '-cpu help', to assist the user in deciding what to use.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce0..1a0988d8fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8222,12 +8222,20 @@ static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    CPUClass *cc = CPU_CLASS(oc);
     const char *typename;
     char *name;
+    g_autofree char *details = NULL;
+
+    if (cc->deprecation_note) {
+        details = g_strdup_printf(" (deprecated: %s)", cc->deprecation_note);
+    } else {
+        details = g_strdup("");
+    }
 
     typename = object_class_get_name(oc);
     name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
+    qemu_printf("  %s%s\n", name, details);
     g_free(name);
 }
 
-- 
2.36.1


