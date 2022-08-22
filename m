Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE859C6CE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:40:54 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCM1-0007gY-5d
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAim-0008NU-Lq
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:16 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAik-000601-U9
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id w19so22462389ejc.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GVRb/7doUSSFkMj9m+LAbITgMHZXde61grtd9l+BnG4=;
 b=HF39GeIhJXt1ItJO+L4g9SAWg5zuaAaLEoOyj3sfimiOI/Wc94XFfKQUhAOi+wvAZ2
 v+fUHy7NjA5DotLq011Q8T4vK9GEN/PqpyLDPAqXz6THZ4AiitogTH49IvBEDshHSxS4
 JtRkuUHJeD1Rd87QOU5Wx/NOuB0B4Ac8LPDYSx3OZ56bdkWiqy4t5Hegj+p+K7OpKnm/
 +4oilLug+4ndj6qAkvbrHmFbOBSskn7rXx/Mrmxt8FeqOqMLPrVxzWDeFBQKfHNilsDk
 iSJpJjjSNRw8bxGjYdoDgTrmjzPY+F48nL/CvCW4JHrwvZHzOySYiUEj/BouZdv/U34h
 7tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GVRb/7doUSSFkMj9m+LAbITgMHZXde61grtd9l+BnG4=;
 b=HQqoloTZpkMPk262biXrG+355dpo1VMdG1ZirAAslZ3wqIzjYtGRJjzHYQIE/dXgeP
 E0N2eUbG1z3E/kJYZCVH4+phT/4Ch82wi1cQMbUsAjFdM6is50amCNhP27Ra4gHh0BGQ
 e/NUc7zVDBjmVfNEvMcpxVNfKVHglHsZpPmYaOvOGU7jdlFFq3VC+jVPb1DozkILvz5m
 CEcPWZccUr7Zc1pl2DNnq3vz1wFKNFer9YXmqi0d2VFbdddcpLwpTdtQtnjPAkNWnomo
 lB4lq+AGVWc8JLvvtXvVa5+U/fhHx6Nppf/1Q508zpj6jGJUlvl6QzjAi/voJ+Mbt0tB
 DcQA==
X-Gm-Message-State: ACgBeo3wNdxRrV20zMCo+3x7n2t2SJWR0xdkoXUVqW+F/xIOe1WeOR41
 3/Fh94Cxvw6zGGHwgm/Gq9C8jw==
X-Google-Smtp-Source: AA6agR69Q567wYpXm58hTci795oKbu9BjhidRM+zBhyEm4NBQndLg6WD/rII8/+J5JMMJf1FcK7/Jw==
X-Received: by 2002:a17:906:9f2a:b0:730:bc30:da30 with SMTP id
 fy42-20020a1709069f2a00b00730bc30da30mr13756487ejc.763.1661187373350; 
 Mon, 22 Aug 2022 09:56:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a17090618e100b0072ed9efc9dfsm6374998ejf.48.2022.08.22.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 456A31FFBC;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v1 4/6] tests/migration/i386: Speed up the i386 migration test
 (when using TCG)
Date: Mon, 22 Aug 2022 17:56:06 +0100
Message-Id: <20220822165608.2980552-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Thomas Huth <thuth@redhat.com>

When KVM is not available, the i386 migration test also runs in a rather
slow fashion, since the guest code takes a couple of seconds to print
the "B"s on the serial console, and the migration test has to wait for
this each time. Let's increase the frequency here, too, so that the
delays in the migration tests get smaller.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/migration/i386/a-b-bootblock.h | 12 ++++++------
 tests/migration/i386/a-b-bootblock.S |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/migration/i386/a-b-bootblock.h b/tests/migration/i386/a-b-bootblock.h
index 7d459d4fde..b7b0fce2ee 100644
--- a/tests/migration/i386/a-b-bootblock.h
+++ b/tests/migration/i386/a-b-bootblock.h
@@ -4,17 +4,17 @@
  * the header and the assembler differences in your patch submission.
  */
 unsigned char x86_bootsect[] = {
-  0xfa, 0x0f, 0x01, 0x16, 0x74, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
+  0xfa, 0x0f, 0x01, 0x16, 0x78, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
   0x0f, 0x22, 0xc0, 0x66, 0xea, 0x20, 0x7c, 0x00, 0x00, 0x08, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe4, 0x92, 0x0c, 0x02,
   0xe6, 0x92, 0xb8, 0x10, 0x00, 0x00, 0x00, 0x8e, 0xd8, 0x66, 0xb8, 0x41,
   0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xb3, 0x00, 0xb8, 0x00, 0x00, 0x10,
   0x00, 0xfe, 0x00, 0x05, 0x00, 0x10, 0x00, 0x00, 0x3d, 0x00, 0x00, 0x40,
-  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x75, 0xe9, 0x66, 0xb8, 0x42, 0x00, 0x66,
-  0xba, 0xf8, 0x03, 0xee, 0xeb, 0xde, 0x66, 0x90, 0x00, 0x00, 0x00, 0x00,
-  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00,
-  0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00, 0x27, 0x00, 0x5c, 0x7c,
-  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x80, 0xe3, 0x3f, 0x75, 0xe6, 0x66, 0xb8,
+  0x42, 0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xeb, 0xdb, 0x8d, 0x76, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00,
+  0x00, 0x9a, 0xcf, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00,
+  0x27, 0x00, 0x60, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/tests/migration/i386/a-b-bootblock.S b/tests/migration/i386/a-b-bootblock.S
index 3f97f28023..3d464c7568 100644
--- a/tests/migration/i386/a-b-bootblock.S
+++ b/tests/migration/i386/a-b-bootblock.S
@@ -50,6 +50,7 @@ innerloop:
         jl innerloop
 
         inc %bl
+        andb $0x3f,%bl
         jnz mainloop
 
         mov $66,%ax
-- 
2.30.2


