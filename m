Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE339A5A8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:23:02 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq7Z-0001cW-6u
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl9-00024X-JB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl6-0007KS-VL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l2so6392064wrw.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Cds5GGFqPsxZEQ8A/Oi3ANjhdDr2P17DFeabFdjzF8U=;
 b=uiIkQukl2KEQBueWUw4rXpRwFeNgRLPaa1AcADpNGq0WHim2TPVfWsq8On4RpuEJsc
 Pui+qyTZapmEmfwSqezn8qxtWzQsmWw6c8TQuLo6wxvxfWjWhHXMjxvbpGzNnO0kcw25
 Bm/YLh7eQQU+J9XHZg1VqusSYaVrghbEl1AEF60hw6zjX8nUNsNNL6gcVUyjVX/rDsbE
 7+HsCYwaGhdM7O+4er3aQ/oZ11TeJU7vUh0LBMhF4rD3zHDckPOg/H4pPPNzzGSkkk6L
 H2wYO21sQOEg8GT0ZIAXBWInb5VyWN+nWZghmx6ZItK/ycJRW8ctLTg0hTBIkmgt2v5Q
 FxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cds5GGFqPsxZEQ8A/Oi3ANjhdDr2P17DFeabFdjzF8U=;
 b=LkvAjU0b5KIxAsrmEK9FcXREPM8Q6o5/BH/5o/CRJ7TLG3+puDQFPz/F1YdALM8Tyz
 XruX+XSSp7y4FK38wzJ0wrchDhL0mBEScV8YuqNO2DHQ1lWME1RlFJkwoZpsXJJQAXgP
 KnuqVSyiQSy9SpnYJU6QXKcmwyRJ1p7v40CmTNvaLM4hCMJQgkjsSrE3jjv6AWtsM2s2
 v+dfo/fcEN7Dtgj6isKpbOt3Hv4JQTJDwpFlISQcpWZxFlqkYCeh+5VYGHGbcXsnrNqx
 ws3ASZd+zhPFIPgng9UTQ9rnMEHtZI+u9hl7m3RlN+wCJ5768IYKK5ETJ9sElgNzRQff
 WNpg==
X-Gm-Message-State: AOAM530YRwgfQE9CqTQu6g5c70tDXaU3zFvGiEQFWJnDUNk9/1hSaAGf
 faN9mSLXgAH+8ApKiEqPWcECXLTCHr2x+bBN
X-Google-Smtp-Source: ABdhPJzawrOlK5DqRuxYPHQUfBufIGIk0aqbdTM8/8BPR2fWoeVocJjtfXJSJPhB+x0vjQ+3XlXN5w==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr612427wrp.383.1622735987690; 
 Thu, 03 Jun 2021 08:59:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/45] tests/qtest/hd-geo-test: Fix checks on mkstemp() return
 value
Date: Thu,  3 Jun 2021 16:59:01 +0100
Message-Id: <20210603155904.26021-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity notices that the checks against mkstemp() failing in
create_qcow2_with_mbr() are wrong: mkstemp returns -1 on failure but
the check is just "g_assert(fd)".  Fix to use "g_assert(fd >= 0)",
matching the correct check in create_test_img().

Fixes: Coverity CID 1432274
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20210525134458.6675-4-peter.maydell@linaro.org
---
 tests/qtest/hd-geo-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index f7b7cfbc2d1..113126ae06c 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -464,7 +464,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     }
 
     fd = mkstemp(raw_path);
-    g_assert(fd);
+    g_assert(fd >= 0);
     close(fd);
 
     fd = open(raw_path, O_WRONLY);
@@ -474,7 +474,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     close(fd);
 
     fd = mkstemp(qcow2_path);
-    g_assert(fd);
+    g_assert(fd >= 0);
     close(fd);
 
     qemu_img_path = getenv("QTEST_QEMU_IMG");
-- 
2.20.1


