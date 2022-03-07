Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED34D06AE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:38:14 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIFJ-0004kN-B4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI48-0006Hh-3E
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI46-0006vV-I1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAnOCuWhHZY6WFFn20PyWOZAWbGK2n8S6dRJWDcL7oQ=;
 b=UB/C7Kk6g13unWEirH3VrrD86RBwMZPxpTxeEGmUBKBoBCiq4TJuX5n0cnf2INZ1XnYpDM
 OKqEAJA/Xz8Pyg71zr+4BOn7oXyZbkH4JwRHca2psbbNW81oCeNJOYTm7tWWT+HLjrNgKd
 HCMFX9Qm/ox/DL3kNLQ0GNRlLVu3ALA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-cGTF9ybcM52-_xi7OSq-xA-1; Mon, 07 Mar 2022 13:26:33 -0500
X-MC-Unique: cGTF9ybcM52-_xi7OSq-xA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3356D1006AA6;
 Mon,  7 Mar 2022 18:26:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE79B804DB;
 Mon,  7 Mar 2022 18:26:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] Check and report for incomplete 'global' option format
Date: Mon,  7 Mar 2022 19:26:09 +0100
Message-Id: <20220307182609.94466-8-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
References: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Rohit Kumar <rohit.kumar3@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rohit Kumar <rohit.kumar3@nutanix.com>

Qemu might crash when provided incomplete '-global' option.
For example:
     qemu-system-x86_64 -global driver=isa-fdc
     qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
     string_input_visitor_new: Assertion `str' failed.
     Aborted (core dumped)

Fixes: 3751d7c43f795b ("vl: allow full-blown QemuOpts syntax for -global")
Signed-off-by: Rohit Kumar <rohit.kumar3@nutanix.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Message-Id: <20220216071508.412974-1-rohit.kumar3@nutanix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/qdev-monitor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index fe6cf268ff..12fe60c467 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1038,6 +1038,13 @@ int qemu_global_option(const char *str)
     if (!opts) {
         return -1;
     }
+    if (!qemu_opt_get(opts, "driver")
+        || !qemu_opt_get(opts, "property")
+        || !qemu_opt_get(opts, "value")) {
+        error_report("options 'driver', 'property', and 'value'"
+                     " are required");
+        return -1;
+    }
 
     return 0;
 }
-- 
2.27.0


