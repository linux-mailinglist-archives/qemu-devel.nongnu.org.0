Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075186ECBF2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:23:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvCT-0001Pz-AK; Mon, 24 Apr 2023 08:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqvCL-0001O9-Sy
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqvCK-0002SY-Jb
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682338896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dsuP6VMHnYCR1DZcnBD6Y63DngXMZul/cFptIwU+kLI=;
 b=TwTtlaY99s+qw/6J1q6bOcK/r5RH3yZzR50AM1cFVsIYPlxK3+vyye67Gjgp8v0V4Ebcqk
 snTdPAIHxukYR76hq551IKgTa3Ir/uOY998TcyPSf5HhI9sobqtHvpVBQD0G4zNNUlhrO/
 EX+VzdTq+CvTs7E3nx4vu8WcLVDExyc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-BmVDO9kVNFi6XVE2Og81HA-1; Mon, 24 Apr 2023 08:21:30 -0400
X-MC-Unique: BmVDO9kVNFi6XVE2Og81HA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E242A59579;
 Mon, 24 Apr 2023 12:21:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54D65492C13;
 Mon, 24 Apr 2023 12:21:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] linux-user/main: Use list_cpus() instead of cpu_list()
Date: Mon, 24 Apr 2023 14:21:26 +0200
Message-Id: <20230424122126.236586-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

This way we can get rid of the if'deffery and the XXX comment
here (it's repeated in the list_cpus() function anyway).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index fe03293516..aece4d9e91 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -359,10 +359,7 @@ static void handle_arg_cpu(const char *arg)
 {
     cpu_model = strdup(arg);
     if (cpu_model == NULL || is_help_option(cpu_model)) {
-        /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-        cpu_list();
-#endif
+        list_cpus();
         exit(EXIT_FAILURE);
     }
 }
-- 
2.31.1


