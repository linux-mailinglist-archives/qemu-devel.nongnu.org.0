Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FB4E569B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:37:44 +0100 (CET)
Received: from localhost ([::1]:46348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3zT-0000k9-QM
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:37:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QR-000636-C2
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QP-0005g0-Qw
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UtMegau24O0+wiFeqYKD+L0WWmF0Q2AAnvHuNu6MKc=;
 b=BTaoSp0QX1exZABKAnL+RmDNmRzRXCqZdwpZhOL2pZ/7suugQ6O3BG0HliB4SCuiKbtCCk
 pQQYsYS9bU4DgtlVvqPlqqAadOpNj1LBkSKATbGNfLAUULbyLwIcmg21aAEf5Y1D7yMlfZ
 hDerwgFg9oHuVxfAgFl9yKqbHilqwBU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-Su4LcC7wNZ-AWAlPpKHY0w-1; Wed, 23 Mar 2022 12:01:25 -0400
X-MC-Unique: Su4LcC7wNZ-AWAlPpKHY0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109ED3801ECD;
 Wed, 23 Mar 2022 16:01:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 013A5141DC5F;
 Wed, 23 Mar 2022 16:01:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 27/32] include: move page_size_init() to include/hw/core/cpu.h
Date: Wed, 23 Mar 2022 19:57:38 +0400
Message-Id: <20220323155743.1585078-28-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/core/cpu.h | 2 ++
 include/qemu-common.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 13adb251b2ab..466bed604727 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1035,6 +1035,8 @@ void cpu_exec_unrealizefn(CPUState *cpu);
  */
 bool target_words_bigendian(void);
 
+void page_size_init(void);
+
 #ifdef NEED_CPU_H
 
 #ifdef CONFIG_SOFTMMU
diff --git a/include/qemu-common.h b/include/qemu-common.h
index a271cac66a1b..65483f70d4fe 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,6 +24,4 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void page_size_init(void);
-
 #endif
-- 
2.35.1.273.ge6ebfd0e8cbb


