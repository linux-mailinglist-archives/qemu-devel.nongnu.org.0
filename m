Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E645EC2A1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:26:04 +0200 (CEST)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9f1-0005m7-GH
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rf-0003DM-HF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rd-00059Z-P7
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:11 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so9717420pjh.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZkLkDHlVbQWyL6DGpwTKMEuFbbF5Rn0sqTRRhF8/m18=;
 b=H3lCe8Cm44UMbXJRWGVb0rugu3eJHn6MlBYMemKpdDWqhDExmHwb/KefP0fsvcsMRD
 NEHB1nAKq1JPtULj09biSAvmWLFRKrvJDSbcVCcO2X5EdiBAVBliOQ1D1s+QqXwy0x9V
 vUemA7XfI86BQEI27aWoqeEmU9AjAIk+GbBJJOS+M4umFcY8RViqD1GMadMXAFjuRUEU
 HpKA+QPeqM1YZSL2wAXaiynM5fW0GHAt56xyLOF39vhtVl/S1/tBxz5dSv6nTA2df/+u
 s0Y5p1mBFGxdNUbZngRL3tEw0iOLODr3NQ8sD1Jrz6SGgvxtnOqTA6WruJDJ5OF0FNJ1
 n1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZkLkDHlVbQWyL6DGpwTKMEuFbbF5Rn0sqTRRhF8/m18=;
 b=ffb6ZkjBZFtviWKqeinACGaquDcwhi+EMkv3415kkzO9DE3Hu7d7arAQgyd1yTF9gk
 D3x1FOGWrAnfGla4M8vgC1gxEsDYLvpUnnCRPKrnGneQCVSxNSYqFLBBcI94QQkciYpM
 QUzziiVBKhFJgGFt/ba/t3Nyfna3UNlYqb0Uuql+1ZWKeQ1SQdi2KcSQIjTLNsyIdTLf
 1ueqZ9BjhPuBNUwmvv7RSZfNGPgQ5QMfFVMlC9EJ4FmdmVV1z2NI0HAhkKyAEggWsuW9
 ZGX2AFm+jLgwhLXvlRiVyj040UjAv7DQ4lYpTanUbgYOLWm4rnKJvxj9NgIyzSvP572J
 KPGw==
X-Gm-Message-State: ACrzQf1paMPznZI2jzSYZ77x1OYdl41HTIV7rxgYPMNbg4la8HJEWkTi
 zJHZWpOK4rReIfLgP7Ek2Z5s/ePLP3Q=
X-Google-Smtp-Source: AMsMyM6bVZQl/1QsW5LPcnVpOk/vZxLgVLGrFeRnGliQTT2ym0gNw2ExTkBxb15FLDfbgTkgNbdvRg==
X-Received: by 2002:a17:902:6bc8:b0:178:81db:c6d9 with SMTP id
 m8-20020a1709026bc800b0017881dbc6d9mr26969376plt.56.1664276887619; 
 Tue, 27 Sep 2022 04:08:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 32/54] tests/qtest: libqtest: Adapt global_qtest
 declaration for win32
Date: Tue, 27 Sep 2022 19:06:10 +0800
Message-Id: <20220927110632.1973965-33-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
moved global_qtest to libqtest-single.h, by declaring global_qtest
attribute to be common and weak.

This trick unfortunately does not work on Windows, and building
qtest test cases results in multiple definition errors of the weak
symbol global_qtest, as Windows PE does not have the concept of
the so-called weak symbol like ELF in the *nix world.

However Windows does provide a trick to declare a variable to be
a common symbol, via __declspec(selectany) [1]. It does not provide
the "strong override weak" effect but we don't need it in our use
case anyway. So let's use it for win32.

[1] https://docs.microsoft.com/en-us/cpp/cpp/selectany

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v2)

Changes in v2:
- Use __declspec(selectany) for the common weak symbol on Windows

 tests/qtest/libqtest-single.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 4e7d0ae1dc..851724cbcb 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -13,7 +13,11 @@
 
 #include "libqtest.h"
 
+#ifndef _WIN32
 QTestState *global_qtest __attribute__((common, weak));
+#else
+__declspec(selectany) QTestState *global_qtest;
+#endif
 
 /**
  * qtest_start:
-- 
2.34.1


