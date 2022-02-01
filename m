Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DB4A65CC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:37:42 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzuD-00036N-EO
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmY-00086X-Um
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::635] (port=33361
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExly-0000c2-4r
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:05 -0500
Received: by mail-ej1-x635.google.com with SMTP id jx6so57242486ejb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLdaq4nPs26ioB8IxHlRj4MYiTrVXXpGcD6fwPTNScM=;
 b=Z/+dmUlF9mVw1k3dtpJlWgPIR+IYB0Y9MIfVfJB2ekOm1TaXaNDg3qQVjMdwtkNIhp
 bola+DihR+HpFmOeoi78ITcAhRpv6UL8M3RWHpbj9/BD7gZW2PRGtiwHBvG3+/DsPUqM
 8cnPz2zegz46HTcRWzBrjc4YsEamYC/7F8uU75H4YlZTvDgYPqhi7D0+oLHnA6Lk0aqI
 f7SmEzdPI9iXriREdsQwWaMQ4SNMCZRkGSxeqIoS/kI2BGob83mYlfnjsdL+8ZGGim6y
 3w13JIdqpqcLDDabBrTlM4rhhS5zeNoJuu2vweUQ6vWX/1HtaUr25+XdzJcxCvUTwfBm
 X/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLdaq4nPs26ioB8IxHlRj4MYiTrVXXpGcD6fwPTNScM=;
 b=2ZHinfl0+ul8pN3UF+6ibw8MNOdOHIuJJnjXwYNbIet6qle//QY3LuRetZUWlBtIPM
 yKX5OaCkG62zt7UWzwpYm0kApF1VF7QIjv7PpNF6dkp/Zvj+xylS6oNlZVz+gfe2LkdR
 836xNYJ+nUQwZYIIyOXVnaBjqs1X1gevbMzLRK+BGmC2F+6Ts2cEmlexHuLrBCsO401s
 cy2vGZmD/zvIJi4vgH8eyo5lufuoHq3ENb7eMF/8y4ACk2sk3Xl7WT0JFIlGrpUZz3n0
 AuaIzAzsk0k+RZz/7nLWReDcsAaVkAz3G9lCuerBIH+BhQxiRI8icc3nj7BrJO8BSUIa
 jtIA==
X-Gm-Message-State: AOAM531NP8LMlZT3T7MOMcUU6/p1r8tVJuT6Cx/rCvbGI5xO/v+UMSuO
 CKNLAGvi+wPpUG0/CP1xbb/nPg==
X-Google-Smtp-Source: ABdhPJzt++UVdjNJu7GOZTs0ybJXZgVnSwar9hO6v81hWvtTjEtafRT6rczff/N5dxZ9QWa5JN+log==
X-Received: by 2002:a17:907:8a29:: with SMTP id
 sc41mr21123933ejc.312.1643739653232; 
 Tue, 01 Feb 2022 10:20:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm4981495edw.91.2022.02.01.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E73731FFBB;
 Tue,  1 Feb 2022 18:20:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 03/25] Makefile: also remove .gcno files when cleaning
Date: Tue,  1 Feb 2022 18:20:28 +0000
Message-Id: <20220201182050.15087-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left over .gcno files from old builds can really confuse gcov and the
user expects a clean slate after "make clean". Make clean mean clean.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220124201608.604599-4-alex.bennee@linaro.org>

---
v2
  - fix whitespace damage
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index db9a788601..e5fd1ebdf6 100644
--- a/Makefile
+++ b/Makefile
@@ -206,7 +206,8 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 clean: recurse-clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
-	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
+	find . \( -name '*.so' -o -name '*.dll' -o \
+		  -name '*.[oda]' -o -name '*.gcno' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
 		-exec rm {} +
-- 
2.30.2


