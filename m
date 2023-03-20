Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A76C0E56
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:11:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTb-0003lv-AY; Mon, 20 Mar 2023 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTQ-0003kc-MU
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTP-0000CI-1u
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:40 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o32so690058wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7w228qMV522vrZs8kcDs+ryF/z3Qx23mEIba2VleiM=;
 b=J1FYxKVVugjFuJuf+X3ZiP3R9eiR3UOQiMW0huLiK70p0rhYEXs6XUECflTGFM4BBp
 BaacGM7TebtC/ksSciddGBJBi3/dypyja7sZJP2MhxIaQB4SgMuewzWTczac20cG6Cpx
 vqlM5M1u0IkM8rzj81nPU2p7/DcMv7WqQIsuEQkZEy++X/LmitpnRtEUGBVHUotXHAsO
 /WIm2ES4Gq76pcwLM6vL1OzcolRBjyIAYi/98oaXN+gOhTLOTLFB+Xd58ggyDcd1sRwR
 UxgK5zUk6MSQm9jQTrhydo6peY6dCmFz01ZRuGdobThQew2f2WFhCoQ8esTG7LbxGSgS
 /xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7w228qMV522vrZs8kcDs+ryF/z3Qx23mEIba2VleiM=;
 b=2mmRonhVSHvxjVrzn6PLmbuKfnMJsU5j415Z4WiMCK7jwi6kPpZkugMpiZ2OQUDUuK
 yfFDwKGyGaQ604vlFpv4igO779TV3ZZ2RnEgIuvRyUef3fNg29IBJD5yV6EB5d1hqilx
 YtG6xQ9AZ8ZEQNfdX31ibRPjnNETtxOxlWbTF0ApEszvc+od2LHOG6hAp/HNX6ysCeX0
 kbffduL1/Fo7TRceXBfBww+dWCmuHg7ywyXABLuriktPj9OFWpdCtt9GrHAoBO+PhYPM
 jiLkJj8cFAs1x2VChcZoBVm5wSUqa2EkS6yROS7zm+VTOWVVlNu0uWNtxQxjqVrb2yyL
 N1Fg==
X-Gm-Message-State: AO0yUKW9dU35kyjsYjU5RWUyrTUJcYlFGSp/3Y954iTLH9G27l6loF6L
 a46In524fAJpGITscfVKh3zanQ==
X-Google-Smtp-Source: AK7set8wbFRZ+gTdfeeMmoYGKNlohNbp3im2C6wMeuz9Gduczc+1fYvDDBztnse7CFb8C/nnD9qRvQ==
X-Received: by 2002:a7b:ce99:0:b0:3ee:126b:4a11 with SMTP id
 q25-20020a7bce99000000b003ee126b4a11mr623974wmj.6.1679307036739; 
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002d1daafea30sm8480224wrz.34.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4E9E1FFB8;
 Mon, 20 Mar 2023 10:10:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 01/10] metadata: add .git-blame-ignore-revs
Date: Mon, 20 Mar 2023 10:10:26 +0000
Message-Id: <20230320101035.2214196-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Someone mentioned this on IRC so I thought I would try it out with a
few commits that are pure code style fixes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .git-blame-ignore-revs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 .git-blame-ignore-revs

diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
new file mode 100644
index 0000000000..24208ece8c
--- /dev/null
+++ b/.git-blame-ignore-revs
@@ -0,0 +1,18 @@
+#
+# List of code-formatting clean ups the git blame can ignore
+#
+#   git blame --ignore-revs-file .git-blame-ignore-revs
+#
+# or
+#
+#   git config blame.ignoreRevsFile .git-blame-ignore-revs
+#
+
+# gdbstub: clean-up indents
+ad9e4585b3c7425759d3eea697afbca71d2c2082
+
+# e1000e: fix code style
+0eadd56bf53ab196a16d492d7dd31c62e1c24c32
+
+# target/riscv: coding style fixes
+8c7feddddd9218b407792120bcfda0347ed16205
-- 
2.39.2


