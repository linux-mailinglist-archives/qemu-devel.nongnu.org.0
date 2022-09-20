Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D64F5BE581
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:17:39 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacC2-0001zl-2d
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYd-0000uQ-GB
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:51 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYb-0004p7-R3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:51 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s206so2134814pgs.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=n/8pblQrtAbp24OYjcBCAChq99vs2kPOZwnELezy5us=;
 b=N12jsS/Ad0YiknumIwkSjmwjEZ2Nvz/Uo1zW1f/IOAI3He/i6tcBobmfPufQfdBUPa
 PkJ3LiINcb5M4NZ8BrP+VwKLc0dS3leg8OO8SbguZ21TIU9WGQ+W2zEaxMnf7rpQXmpK
 o+IOjEKiLmiIGdb+hKDRq8EL769NvVNnj//p0RpoZsDR9oTPqX7xcXa8ngvmhEkiC7W/
 G3TjRKTZBJlzkxZcyNrF1mCpG/UiTh/iTw+7fFVvZ5I2h6fYPfhDUxFIm25ojTE4OBux
 HzxIhV0V33jxdOXFfplXTqsoMny7v3piu/kjOrSa6d/NtwIfmcSP+y20XTMMDfkwXuWb
 2gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=n/8pblQrtAbp24OYjcBCAChq99vs2kPOZwnELezy5us=;
 b=lBf4HreWDMo1tM3EMUc8MAfUrsHetB6GQspKRZ1e/kjtUXq1qxTxFHlU07rzya2PKu
 1sLRecBduU7lsTmfTeHunZgCBo8ZvECjb/06lEQhaHm7RqVy15aXA9Ih4JNUcKrrDwoy
 WPer6dMrEdW0uez42SE8eyfAP7Sjs3e9p8p490EruEGuM08let/QX6cErgTUc1IrnFtH
 1EN2nXeDyQiqFZvzwoNVWCtaqHtjls3kSt2QcFmHf6liUZkBppd/PVbrHqUE0sBP5ABw
 /GKLZiyrqPTc9xmxaVl7A01fuqQaP60+NuroyU8NxdqsTMDqFzbVSV6Kxh/LonCS+xN1
 XU9Q==
X-Gm-Message-State: ACrzQf0LWGMNuLGnu2OpmVDsRn5wzN4Bs3cGa09U/JSFeEyBbjkfkwZs
 OXOocAMYpTRvgBb4PnDlIKiRlbllidw=
X-Google-Smtp-Source: AMsMyM6MwVsyEdNfiBH8jo5xNzs5kyUK4wYTvSTnMlIopd8u7awgie0gtzozMHgDTsdcNMPRT2Hfeg==
X-Received: by 2002:a63:1d1:0:b0:43a:348b:63fd with SMTP id
 200-20020a6301d1000000b0043a348b63fdmr6087738pgb.52.1663669968163; 
 Tue, 20 Sep 2022 03:32:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 13/39] tests/qtest: qmp-test: Skip running test_qmp_oob for
 win32
Date: Tue, 20 Sep 2022 18:31:33 +0800
Message-Id: <20220920103159.1865256-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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

The test_qmp_oob test case calls mkfifo() which does not exist on
win32. Exclude it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

Changes in v2:
- Add a comment in the code to explain why test_qmp_oob test case
  is skipped on win32

 tests/qtest/qmp-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 0fa00c12dc..074953fdf0 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
     qtest_quit(qts);
 }
 
+#ifndef _WIN32
+
 /* Out-of-band tests */
 
 char *tmpdir;
@@ -279,6 +281,8 @@ static void test_qmp_oob(void)
     qtest_quit(qts);
 }
 
+#endif /* _WIN32 */
+
 /* Preconfig tests */
 
 static void test_qmp_preconfig(void)
@@ -338,7 +342,10 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("qmp/protocol", test_qmp_protocol);
+#ifndef _WIN32
+    /* This case calls mkfifo() which does not exist on win32 */
     qtest_add_func("qmp/oob", test_qmp_oob);
+#endif
     qtest_add_func("qmp/preconfig", test_qmp_preconfig);
     qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
 
-- 
2.34.1


