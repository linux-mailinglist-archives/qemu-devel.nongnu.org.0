Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE96D6699
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8g-0004Le-LX; Tue, 04 Apr 2023 11:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8K-0004HR-Pp
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8D-0005B6-TQ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id d17so33121925wrb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LjHLaVrEVQKJ9Md9w/twy+uhYkbwEad0mCPaPdBTuAs=;
 b=AT0nGEw5nmeFBXg9FVoLQ+/xfbvylAyVo9vxqj0wM1wrdqrMVYpyInhiAK0Buo5o9q
 OJ85hpHT9AxkpM1sBrCPdRtZc5I5fEyQpPrBACGx/uxA26eyoMvdhIsIo71GU0K+xw62
 OEtARa8LKnbAjGyM52jYY4uiW5OVuAHffnZ+6xZ9/zwiob9Hu9srGhbkDlghL+/csA3+
 Ft9IxYdeh2O6IqcSJQ/ftSjzOxhjv1vVzit/zGKsj6ZVj8cDJtAA/pUcELrCwovkpeQz
 PmDIF85lyPqxpqR+y4b1TpDd4iv3mACVIyy/wwuxsOoYHdtxJgR6ib/R0LoluKa84X8U
 eF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LjHLaVrEVQKJ9Md9w/twy+uhYkbwEad0mCPaPdBTuAs=;
 b=qS8zsMJYhsrvvxNOK4fk0tWnco2JQ5iM2scLVzw1NjcGffsLj68jnLWvIDubPHPKOf
 dIm+3tM2edY2Z/+I2quCx04sY5plsQ+AUVJyJzsdPDXONyLOBYdNY2QAbPG3ijrC8KbL
 JHQAGuESnrxbNPCvjSq7ts4LqoX68gELegPATX6d5S6DJE8cAqYdD3LhBGe4rrItryKT
 4J5IH6IJk5DNyD/YizL1Sn/XdX08/BpBs+buDwgKJEIkj1YRXOjZ880ccp+Ey1sdas4H
 7WA2wDi/eUP6x22xN5PCCsjymki9OyGH8zxACag8RfocwpBDt2Z7gflXOFAsyDqaYTro
 vklg==
X-Gm-Message-State: AAQBX9fl4EGHOcBtwQCB1i7cR4DKnn4V0sZ7FZuavlYJe89wRaqF5iHw
 syaY7iFkk8wstSgLqlzTj8upAA==
X-Google-Smtp-Source: AKy350bPFZBXeDF3LQ1CL6CywJpWgZHjAX/V7wjC3hNoJnAi1Ylst76GoX3TGZsAK4XN8FQZtSG0ww==
X-Received: by 2002:a05:6000:10cc:b0:2ce:ae57:71db with SMTP id
 b12-20020a05600010cc00b002ceae5771dbmr2025455wrx.33.1680620367402; 
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b003ed2276cd0dsm15456291wmo.38.2023.04.04.07.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92B161FFBD;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/10] metadata: add .git-blame-ignore-revs
Date: Tue,  4 Apr 2023 15:59:20 +0100
Message-Id: <20230404145925.2638152-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230403134920.2132362-7-alex.bennee@linaro.org>

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


