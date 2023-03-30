Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C46D00C4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG9-0007Zg-PJ; Thu, 30 Mar 2023 06:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG2-0007UP-6I
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFy-0000HU-2A
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d17so18465769wrb.11
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gey+X0Dy+O+Kq3MElEFAXcP1Z2iyav7fvJs9uGtJ488=;
 b=psojH1qrds29B92CVLslgMX+0lW3Aa+6vRupIGoTAAccMLJw5ewWp96B6rBZq6oDMS
 ff4rpSbnE8CG0tabKbEh7/Nyp9WrkfJkMYYLrKuVK9pcHx5ON3ZQpWtLUNNe0tGqnAco
 YAiHiy9k94oXSNa5DU2JnASLahDM0zN3+Tu3PVl3bK7/PDgQImIHbN3erlSVIusVcAcB
 s2Yf760aut/zuR6hy/4XHl3Loon6MlSpTkJiNShG8FokDeb/VCZX4FQsIakr/hePrgRu
 LmvY3bRCDZwC37Qc3DL3pqH8Jg75dBGN0lFf1RO+bYbLFzDEaNRrprcYf6HN2mJ9UKKs
 jq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gey+X0Dy+O+Kq3MElEFAXcP1Z2iyav7fvJs9uGtJ488=;
 b=tLdCzUMk8/e2WUUV1y9is3wy6RH4OTuQ7nz3qhD5gsXYVoTbqqYZWakGtPN+ctgGIV
 iHyeZbID8Y3rsYdz2r0xegCeOwjCXm6a1VmG4kVcpwEbpct2mEniYYc3i6nkvpC3ziNn
 E0niPkJSjYSvq5tvDJ7rI8Vhc0lskTf5qxEH3vpqHdwu+nWcC5zl0zORqx2w6ET7WZzy
 KW+HcaVxuUd8xhsNg5OkWsAyqbRydRh+TTsZ6HTDwk50laycmabvEdsmrCIq/DR0lEdN
 XNt+xiHaQw72IZSQi+j25jSi0gLRNq2NqoAJ5Sdsva2l2LnC38o6oR4aKvEAbCXasnBY
 ppQA==
X-Gm-Message-State: AAQBX9df0DsVDi7+LLnd7zkXEwKQga5rhszPz5zTEEzVuCJw0uUTINRx
 HhaJCqG8FFAK3hi9VVxYFM/R/w==
X-Google-Smtp-Source: AKy350aqCqo7ciR7fmY0P78yWMLubmZr7eFXchKdCEBo4Tbz+THDSXQYvnLZM4U/dkOtQQKquPLKoQ==
X-Received: by 2002:a5d:4009:0:b0:2d4:99f:66fa with SMTP id
 n9-20020a5d4009000000b002d4099f66famr17959815wrp.14.1680171104457; 
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d4e84000000b002ceac2ccc4asm32554544wru.23.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 957E71FFBD;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 05/11] metadata: add .git-blame-ignore-revs
Date: Thu, 30 Mar 2023 11:11:35 +0100
Message-Id: <20230330101141.30199-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230318115657.1345921-1-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .git-blame-ignore-revs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 .git-blame-ignore-revs

diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
new file mode 100644
index 0000000000..fa01e77a1e
--- /dev/null
+++ b/.git-blame-ignore-revs
@@ -0,0 +1,21 @@
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
+
+# replace TABs with spaces
++48805df9c22a0700fba4b3b548fafaa21726ca68
-- 
2.39.2


