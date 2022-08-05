Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B012258ACFE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:22:58 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzA9-00040Y-Nh
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7u-0006lj-Cz
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJz7t-0007gt-0i
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659712836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LuvpfQDyrc6Wv358pZJWDQkWem2Ny++jQn9NtXTqPc=;
 b=BKM2RdMCX3cxQAarzKucjKchy2rp0HaQZzH4aUf7O7Pl72vPyAjtLNuOQoHZ1DtRERJH64
 gt/XH7tPQw9aFHgFPtxgHnECzsiQezFXu6qSng9mvUZ5a7uPclr+2m6zK+ZI5fIURMCUM7
 +usnMzWj/aY8uvQgehbdoUaddOqOKXg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-7wzStZu0M96LpbkPvbIXVw-1; Fri, 05 Aug 2022 11:20:33 -0400
X-MC-Unique: 7wzStZu0M96LpbkPvbIXVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 688192A5955B;
 Fri,  5 Aug 2022 15:20:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3CB2024CB6;
 Fri,  5 Aug 2022 15:20:29 +0000 (UTC)
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
Subject: [PULL 3/6] target/i386: display deprecation status in '-cpu help'
Date: Fri,  5 Aug 2022 16:20:11 +0100
Message-Id: <20220805152014.135768-4-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 194b5a31af..1db1278a59 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4837,6 +4837,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
+    if (cc->model && cc->model->cpudef->deprecation_note) {
+        g_autofree char *olddesc = desc;
+        desc = g_strdup_printf("%s (deprecated)", olddesc);
+    }
+
     qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
-- 
2.37.1


