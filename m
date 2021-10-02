Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F14F41FC07
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:05:36 +0200 (CEST)
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWehp-0006fB-Uc
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWZ-0000yT-JS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWY-0000iF-5T
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J6Nu9xcD/1mLwA45H6T/mwE1HK3rKCkbuT6P4bJEEQ4=;
 b=WOzXIdZrMDUAtoo9o7MEfWUtNCtab60BP9qO4YEiZuIuEK82TskcazDOibkAZ0KkFnByaV
 J/idG34SH18tBH807TrZnHE/0ILZGiJwtFU9EcKQ+is8xja3/lLCKFzcBkP+4jPDxvuBR5
 gbduzBxjASGFsz+DHjdyPHKn/Op9ZMc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-XeUS17jDMGa7tRB5LPmQuA-1; Sat, 02 Oct 2021 08:53:52 -0400
X-MC-Unique: XeUS17jDMGa7tRB5LPmQuA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t2-20020adf97c2000000b001608326aa2fso2763248wrb.8
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6Nu9xcD/1mLwA45H6T/mwE1HK3rKCkbuT6P4bJEEQ4=;
 b=2St41/BKZfJpbUP7dlN/BZtBrWtfP3IvAuCluHFAIBC+pjE7zKQalT8Y3c2EWKkN0f
 OjF8DzwXOmtu+I7Ry+LH6x8mOa24chGmboBtgimz9fkAK2rq9oxi0whUolVwhUV8InAK
 ggOjVicbZgX2KOPq3+ajB0RjKszfA+mFP2gH4Q8sre6gh02dsl85NkEibfxn3g7YUCwN
 p4IsR2CqyHj6mKc29wS8FJBAhaAFGReOCko/pLVpSgbqXiDp8NlbjFPV5NOHGttccZ0c
 oBMV+DS1QufttQfaL3q7lAh2y9XN+qWcH6LaoUwKWSZK/Y8zGVBqLpHuLKMJRCxYAqUv
 L6+Q==
X-Gm-Message-State: AOAM533hpBpBIcubIBhcImf1gyn8VM16pttVzqxhGxblMzx65Mcy1/dl
 O93IsXS1/zk1411inta4WhvcyCOTbLORs9wTcSDdFomBIW3DWw4v/Ks9xPYSGbqm6KHMNE7ed2t
 2jOnpItxtKUpIRBgjNSt6MCPpoK0B5AzfQSowCdi6AfDYg2IvE8F3jY84VOuMv+Ud
X-Received: by 2002:adf:97cc:: with SMTP id t12mr1334728wrb.189.1633179230928; 
 Sat, 02 Oct 2021 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEX2HQVvG0eH4EoV9kXNFJrMMQBJdc9DWwXnuA0OfpprIlXkRMpruuO+nx+/QeCu4EKQakjA==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr1334706wrb.189.1633179230756; 
 Sat, 02 Oct 2021 05:53:50 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f18sm4106229wrj.30.2021.10.02.05.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/22] target/i386/sev_i386.h: Remove unused headers
Date: Sat,  2 Oct 2021 14:53:02 +0200
Message-Id: <20211002125317.3418648-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declarations don't require these headers, remove them.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 4 ----
 target/i386/sev-stub.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index ae6d8404787..f4223f1febf 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -14,11 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "qom/object.h"
-#include "qapi/error.h"
-#include "sysemu/kvm.h"
 #include "sysemu/sev.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 0227cb51778..d91c2ece784 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "sev_i386.h"
 
 SevInfo *sev_get_info(void)
-- 
2.31.1


