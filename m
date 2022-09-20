Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139DF5BE6C9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:13:31 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oad45-0001rR-0D
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ2-0001HF-EM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ0-0004xP-Kb
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id p18so1908593plr.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NRgpn8UKlLeZRK3O++E8fem4Ty/tJxVKgPqLLc5aG4c=;
 b=glAD/IZhxEcFnpja1UtXQZLuIViM9IvgwUNhPHqgzVWzJXSJ/13PGhSfLa+73QjYpn
 xdBFbyZXifD8VUhY2ZoNqh1Y5/HZzH8ulQQ51ezg3FWjn6ym0sK4DIT7WDaBXTUcD52u
 o5qw+ob+0wKzTDWEeqoAUEOseJkwHRxCej2rPaRJjLYKogvdS+dAMfFJQuz5eHanc8FE
 RdI0kgQXt9ha56+2eEgPCjUovXyD5mU0BH2l3rMBsRpCyS79xXpP4mA3xrVloHCPgDEo
 1j8GBmksVHBGrg7KWpyDblO6y31QL5e/WoNlYCmeKIM3N5vt+RVGSiu0UjP0riGhLz+Z
 t/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NRgpn8UKlLeZRK3O++E8fem4Ty/tJxVKgPqLLc5aG4c=;
 b=JkC//52HkRjcYIGqfms9eUpbKouzjrQSb5BTZMPldg83eREdRH2z8+73xfKbq84JxQ
 Amc0+1o+aTyGOD257rOdFWdhfhIEzYVV9k3C0lm5R2xKV7OaVeqUUodXKC3jUYsKFW32
 q3ouRFnxQoqOgHpMxA056ioabtHh1PF18gFoQRFn4aCU+XFRXq0VJz4XO5WpgzOEwSPq
 CmWRSReK/WtolAgeQLXvKhyIEx40ISsUdBpaxyFbUgnjZQeyPbSgtkOykuh5/gLW9kH3
 c5XTOEvKyzGuwp0/1uHenELg2ECBWZVCnGaexAiaf1ggAuTItx8q7xWtTNyhSAmFRvI6
 odjA==
X-Gm-Message-State: ACrzQf3iR0qc4dZx0o2YidcXyk/bz2FouBINNVKZz0a5nHdtRZWdx2OU
 a2MeJWShh/TFnRoN91+vdGnXZ01iGZA=
X-Google-Smtp-Source: AMsMyM69UDXr/woFpJVFapBPB7NQ70ZJMwYOzBUPqvn728D4q++c0jvUj3aRZeoliKnsVYBh2Aj3gQ==
X-Received: by 2002:a17:90b:14d2:b0:202:dd9c:4e98 with SMTP id
 jz18-20020a17090b14d200b00202dd9c4e98mr3148067pjb.62.1663669993180; 
 Tue, 20 Sep 2022 03:33:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 22/39] tests/qtest: migration-test: Disable IO redirection
 for win32
Date: Tue, 20 Sep 2022 18:31:42 +0800
Message-Id: <20220920103159.1865256-23-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

On Windows the QEMU executable is created via CreateProcess() and
IO redirection does not work, so don't bother adding IO redirection
to the command line.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Change the place that sets IO redirection in the command line

 tests/qtest/migration-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9925691ead..c87afad9e8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -648,7 +648,16 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
+#ifndef _WIN32
         ignore_stderr = "2>/dev/null";
+#else
+        /*
+         * On Windows the QEMU executable is created via CreateProcess() and
+         * IO redirection does not work, so don't bother adding IO redirection
+         * to the command line.
+         */
+        ignore_stderr = "";
+#endif
     } else {
         ignore_stderr = "";
     }
-- 
2.34.1


