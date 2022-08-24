Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2059F800
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:42:42 +0200 (CEST)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnqL-0004WD-OY
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu9-0003Z4-Bi
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu7-0001Zi-Qi
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so3048980pjq.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/pjgCB/qOD1l65Q+5L6mduAGMNDgz5QBySrXjGl7kz0=;
 b=qIw0rgLIhEI4J0m9ccBvOoNw6Kfwgf9lyJZ+qz5FocUdXKJR/WnaPc9N1bgtMucesV
 0H/I1EflYtWDiT3jwlWydSuAy+pL5H6FhGcqRhRRWLL9Ovgum+0jOdyYUSl8zy+YZcEn
 MH7vvHvO/KyKie8WmHRcZFI7dPDb727E2Hs2a4lgP53Z/5mmR9fgsMH7QIBCwoMdtRUi
 HqXR3AqsPm1yUDPq3GHEBMiYrq/c/oqSOqq1Xv2HNOur1BtXsazuTG/znnnTT7tARyOj
 +sxeYU1WM01RXgQyyqs7s0gHTU+uQP/Qi3Cy4OsjLXyUaLHL3i5W5qdkOzh8VGzgaC8L
 dixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/pjgCB/qOD1l65Q+5L6mduAGMNDgz5QBySrXjGl7kz0=;
 b=AZkzoXyHAIVQsiIJE9eEy0AGEfxxv6NGZmCoQhxbvtv/QETNyjeVrr3aVtH6ra+u7s
 hW8CD3nTRI2I41ESsRp+IRVZwtUQja8jitSJTSGKSAcatg9NQ0IzikxdCcBPtCYlEpzq
 3AMom9iXQAGjby3D5xNSRTX54LnSNMkJl3G0Wur+T7o6SyZ6LEucWVV+EDebXDa9MFhc
 GjPFzkZHNR5JM417TM1eGiMAzwnFMgF3gEGXX7zX/InT6W/0RQkddA8OpzsuU8atkxR9
 qi+0h4wqEs+KgWKq3FpLxCP8AkXS9JRsZ3ZIKgF5Bh9KxBkbBry0z7kIoZWoJjdjP9S3
 1wzw==
X-Gm-Message-State: ACgBeo2usxUz08hACsQZROBAtGM9uz60Bc9h0KA2SXHxhv4xh1El4FRp
 XXaKAsoJ1XAM62bzm37tjw4sRcRmF64=
X-Google-Smtp-Source: AA6agR4MrX3OtOxW5UbAff9oJ8SUzKudGTCJJ2mbyQc3D59xdTJDndmYGd/Y3udEtiR3YDvy1I0Z8A==
X-Received: by 2002:a17:90a:a097:b0:1fb:5bc:7778 with SMTP id
 r23-20020a17090aa09700b001fb05bc7778mr7448887pjp.209.1661334150455; 
 Wed, 24 Aug 2022 02:42:30 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 22/51] tests/qtest: qmp-test: Skip running test_qmp_oob for
 win32
Date: Wed, 24 Aug 2022 17:40:00 +0800
Message-Id: <20220824094029.1634519-23-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The test_qmp_oob test case calls mkfifo() which does not exist on
win32. Exclude it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/qmp-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index b950dbafaf..4a165447f8 100644
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
@@ -338,7 +342,9 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("qmp/protocol", test_qmp_protocol);
+#ifndef _WIN32
     qtest_add_func("qmp/oob", test_qmp_oob);
+#endif
     qtest_add_func("qmp/preconfig", test_qmp_preconfig);
     qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
 
-- 
2.34.1


