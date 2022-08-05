Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FB58AD01
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:24:20 +0200 (CEST)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzBT-0006U4-9P
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz85-0007If-6J
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz83-0007kT-PH
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbkrAPg+IoDH3/j0b+xGddH732Y0wt599nfHSMm17i4=;
 b=VETtp1nGWPjalRfWOXNiWIvOWs6xzCAuJjbSeW5d1QeN4/fL9t5hXsNu7XnLVIKnA82mQc
 YUlSwEYyBXy1dDqLRRJKRXnYKcHGb5bAOnICAVidlEGvpggCC90FYQr7Ph92jrh8qbr8/e
 fgmOgMBTuSb2WiM1ykMzUAJ/GEZvGsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-c6eRGdMCPLCa5b0kyNqdHQ-1; Fri, 05 Aug 2022 11:20:40 -0400
X-MC-Unique: c6eRGdMCPLCa5b0kyNqdHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E9CE802D2C;
 Fri,  5 Aug 2022 15:20:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5B12026D4C;
 Fri,  5 Aug 2022 15:20:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 5/6] target/arm: display deprecation status in '-cpu help'
Date: Fri,  5 Aug 2022 16:20:13 +0100
Message-Id: <20220805152014.135768-6-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e1bdc80c35..d7bc467a2a 100644
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
2.37.1


