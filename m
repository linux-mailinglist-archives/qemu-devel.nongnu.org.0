Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216CF6D462B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYu-0002z4-1L; Mon, 03 Apr 2023 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYr-0002vq-B0
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYn-0004um-Hq
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id r29so29388040wra.13
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTOWIebDq0xH5MEdgwVyuiNxE4JxhgEfL/zEAMmcLTQ=;
 b=Pd745bmnXlfs4LJh75sVHpdsPA+xhcR3XlKK3TosfuE1r4GmjMcCMK//Sg5U8B9OCy
 QApDpXjTidsFf6gSbmq2SgYwstpQ7u2awLYYx+4Vk6KUWZCwSWqLUJc+NeSG8H+V/dcS
 Dwbel5nNX0LpskAYoI3JNAv7Z3EznmNWbtxvBkjFqblsWce7z949QLS4zc79G8/BxSbl
 QSU/Lc8ZBOAeIZwJ/NOLRhqcgUAl4KP04pfjAGGX6zJyVB8QT3D5VkPhJV6sx3HNLe+I
 Jc9DoN1KL+ilRkw0P1VXc/p4l+WpoPVl1zCyAStMx/mXL11fRlcfkeTPV+1SMtDRrmRW
 LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTOWIebDq0xH5MEdgwVyuiNxE4JxhgEfL/zEAMmcLTQ=;
 b=tAiKtnL2uTNoZnqthWYcgG98AdIKGiNt8KvABLCzQMO0kFDopQdY9sHSIC0TtWODMU
 jCqwY7IXkRBp1RzemGJBnyss/VVjnO+COgUNhWx/4Fnj6Y1EyLkrIb0XCpGhyVfx4zUa
 ExkGyuiQuqse5ssSsE2/pF9oHhedb8PNy4s4jRYL+hl1E3fxdN+3lfvY2uePCEsdllrl
 OomN72RSVU1L0ZEgiDnBe470WJEXT7y7XxBKmK2ooRLhBRwQDGtzFjcfya93BrvwICpz
 tbBWxXZ4Cg79WA1vQXM8uREMKEIn3iCXybARGoJxjTvTBoaT8Oo7rz7uXCBuXYmysaCf
 at+g==
X-Gm-Message-State: AAQBX9eJpQBSi8XUuwN3DPRCYDswY43AHtRlzBnN0T7j9cw+yth/9suj
 GE/bqhFIarDoHCDVhgvsUVBpNg==
X-Google-Smtp-Source: AKy350ZRhlxNrjjVOSPUKEPVG7isDQmeeJWmbFFZBRlp1mMjzm7Mq0oej7yeF6yUqNQCE7KoPphvYw==
X-Received: by 2002:a5d:408b:0:b0:2cb:76d4:42ea with SMTP id
 o11-20020a5d408b000000b002cb76d442eamr29007696wrp.36.1680529764015; 
 Mon, 03 Apr 2023 06:49:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm9760207wru.65.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51E3D1FFBE;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 06/11] metadata: add .git-blame-ignore-revs
Date: Mon,  3 Apr 2023 14:49:15 +0100
Message-Id: <20230403134920.2132362-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Message-Id: <20230330101141.30199-6-alex.bennee@linaro.org>

---
v2
  - rm extraneous +
---
 .git-blame-ignore-revs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 .git-blame-ignore-revs

diff --git a/.git-blame-ignore-revs b/.git-blame-ignore-revs
new file mode 100644
index 0000000000..93718ef425
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
+48805df9c22a0700fba4b3b548fafaa21726ca68
-- 
2.39.2


