Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5FC5EC328
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:44:29 +0200 (CEST)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9wq-0004yA-Js
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RY-000320-4l
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:04 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RW-00050q-Ba
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l9-20020a17090a4d4900b00205e295400eso413727pjh.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=73Bh6gjqapgnX8a4D+ItufmvDUF4gENdWKOZ0zcuwjU=;
 b=TYUJaMUFGOWvSZnl8vzXr5OVIF81ks6D0N5GexrbpJJg2IiWjsTqgotBkcxAX7sSU4
 I21bIhVXnZs6bIjOYVYQz8YFgGbQsgRdt7l+liulAOiWyn/7CRbQT9Kk0C/FaUylq5Ms
 Y5mCk80Krhn2j/0RCdiFMj9CSdkwdd2WlFXEEnVwivStC+NjheBhtKzr9H/7HL1sDia1
 I+5YuVhwsS/mOPxTQ5286Uc8PeRityT/lsO75P/JRKr/Rtlj5N58NPecsXfofavCt72c
 ikV2q7lM4PGciKSo3STj/Up3g84CLPOKrT0Bm8cLoIrDo7IW0/YsBY1dgTifIymE6yBB
 yoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=73Bh6gjqapgnX8a4D+ItufmvDUF4gENdWKOZ0zcuwjU=;
 b=y4ODOyYGV+GGzMgiLLPQ6I7CfdyBFNZ/6aY+ysmretGwMzp3UuLLwXSaJQNZkALg9f
 +aKhblK+cdOOjDKJgGrBzkOx1TEoFmoH8DxySUVHNRmS4FD6o6cHDRcp0kbatZ9IPtdO
 RJ8Xy3HyossLjVjr+lyRasBLq0aMwjyd0JGQChY10KvHUG+kQF7f93uEB1ij7bZq7VEn
 kFzT2KdBVkeu0JpRdWqqnhEAXGFHdDZM2QBhAFb8IQmYuV001xEGuNTNcfqRHYQd4YmP
 SUlxYZ0Ngzg/56zsmS3MgsvWVAyEm2u/5UN6ZJqGhFNGIcRBf4BNw+3DWpmTNc+iO6vx
 EFQg==
X-Gm-Message-State: ACrzQf0x15ODuu4AbekuMM37DaHPoMDIHcQsrR0qm6Vh/XIf22jbeUi8
 TnD4IKZ8W2FGJnH1RNjFNqtXgO9DSG8=
X-Google-Smtp-Source: AMsMyM5yr62DLe8Kzv8Uvbur+50MZQxRuw1La7woQTfpz1VKC6OwlOOxLJjvC7HWSXCskMrF7KFX5A==
X-Received: by 2002:a17:902:d58f:b0:179:b756:6f5e with SMTP id
 k15-20020a170902d58f00b00179b7566f5emr15372305plh.1.1664276881464; 
 Tue, 27 Sep 2022 04:08:01 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 30/54] tests/qtest: qmp-test: Skip running test_qmp_oob for
 win32
Date: Tue, 27 Sep 2022 19:06:08 +0800
Message-Id: <20220927110632.1973965-31-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
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

(no changes since v2)

Changes in v2:
- Add a comment in the code to explain why test_qmp_oob test case
  is skipped on win32

 tests/qtest/qmp-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index d2070cb683..22957fa49c 100644
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


