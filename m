Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42F41B8C7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 22:56:57 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVK9o-0007hX-Em
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 16:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVK7v-0006Hv-P4
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:54:59 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVK7t-0003k0-Sm
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:54:59 -0400
Received: by mail-lf1-x12e.google.com with SMTP id b15so1439394lfe.7
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/8a5g8ks8jgGNrjMXDP064TmRFSw6yw9mk8cFZ4RU0=;
 b=7ra+c0XOt/Pfia8QQWFY1vIa4bSIoqo7YkgjslGUYxESIcfn0o294nyCOcfOLzb8s6
 D4PMYQTFrljKmgUN1xoG0sIAD7LHN2ZR1TunBWBGdI5xyiuSYRtFdw11QHWrXEWoJvd9
 UXUAkNugcu5Yd6ufHZm0rMrpctjRW76vjhzY5B2wSlgYEdy1nGsW1s8SVM7YFVj1RzCv
 ZlyYJcxQFOAkCwEB+O9fGOyDaRxdOJYMcyExh3d/missZNKYS7g5Jb+v8GMHkq4eIZwh
 lLFOmElaEUhXRTIoQQRSb81RVZUKrhqG6Yv8iWPT5nFeSaIOl+aaGuWvaxfFu6xZEuKE
 BSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/8a5g8ks8jgGNrjMXDP064TmRFSw6yw9mk8cFZ4RU0=;
 b=C+Eq2mYMqc+BXP4VeXm+WY4mfDlrj4lbAnxbBWCnQT/Agh8Ta9MCp9eOR6YSQlwH15
 tBWQOtqWLjhtrIZQPKbtBh/T7bqX2eUIyhR04gbqQE7AHXRzYz32qy1cEPrCX1nhzkdq
 nIp0HaiJm3xB8WN0R9IHqeg099ROBsIgNSySkoqqdRxysuyNXX67ToC0GZ53amGqPZYw
 d9JTVHimpQqB6FYn/DOYQG/q/p2BgJ4LU4LnmkO/+/sTF07cxZ/hsplWE7Yh+WMWHIDB
 vO1irszoisbHwSLtXQuU7d+GJ2I4F1w1Wwc2cqaN4+zIqsORMZEUCd0S6461jeOAfFpg
 tSsg==
X-Gm-Message-State: AOAM5301bEjnzPxY/Gr6muCEgx5u/l7IlmFNM5Lm8ZzQ2id8/LiPeOsC
 Tpi5vTpA+95H705bIDxJ4Ffh7FcHEsJWJxw8
X-Google-Smtp-Source: ABdhPJxGV+kZ2Q/gwr4c3AwI6cExBVcqW+YOIoHEXKOsMN+1MLvFqUUnZCrDtJpqX+CKFoCJ2cgsWA==
X-Received: by 2002:a05:6512:1294:: with SMTP id
 u20mr7479648lfs.1.1632862493954; 
 Tue, 28 Sep 2021 13:54:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id l14sm24061lji.137.2021.09.28.13.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:54:53 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg: add dup_const_tl wrapper
Date: Tue, 28 Sep 2021 22:54:49 +0200
Message-Id: <20210928205450.4121269-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dup_const always generates a uint64_t, which may exceed the size of a
target_long (generating warnings with recent-enough compilers).

To ensure that we can use dup_const both for 64bit and 32bit targets,
this adds dup_const_tl, which wraps dup_const and legalises the
truncation to target_long by casting it to target_long.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 include/tcg/tcg.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 44ccd86f3e..8f8a209600 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1272,6 +1272,11 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
+static inline target_long dup_const_tl(unsigned vece, uint64_t c)
+{
+    return (target_long)dup_const(vece, c);
+}
+
 /*
  * Memory helpers that will be used by TCG generated code.
  */
-- 
2.25.1


