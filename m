Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E621D6ADD53
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVVE-0007Ub-SV; Tue, 07 Mar 2023 06:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUx-0007HV-Sn
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZVUu-0005gD-9W
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:28:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id c18so7532932wmr.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678188526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yM2KjYGD7orZo6AEu6pU16rn3FTr1UxycOe1pdtgZ0A=;
 b=CuiKwmsUbs1gOBp7lmR93X4YFwAkwCqLH18nTj+qtUxbAcM4ElK5XPZq14ef1z2OaC
 NZsa4V8rz9PS2Vf/wHAa3u4O+gdlkogCyqk9Ih17YShaYv+sqfmI8w/sHyXKafRXgZW5
 SpOruP7QCCOYG8nZdxqxKv5JTBsWbR60HcKBLPDqxPISm2VS8QhPp6n5/hM3s5/ayBXl
 nbNdWT9Dcyq8j6SwPf5kKtQCXtVKhayMdh4PVKBrH1h2T/C43gjQRpQnFgqu5gs0OJ26
 5dF0hiipnwxX4XxnQl6wdxr+zvFvppsa8Afjdpc36n3ZkdRI8irs/SPQ+Z+023zV/zZK
 b6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yM2KjYGD7orZo6AEu6pU16rn3FTr1UxycOe1pdtgZ0A=;
 b=7oqIwX7d3hY/ci8KynziEeb8QngdT4tjQQtdwfuciA0EplQrcOznjHeAgWm33czi9R
 NUQGh93zzAaIsxbbHvNsDpNp5fOAc2hC3jnV86AfvH7RSUKueP1kHgF+TykhxcZ46uLu
 VFd3PONhuou51jBy2ZNWMUvvsoNzFZe1c4RDgmGyke808JZnt+chanoh++fwweNiAPTp
 UcB5QQwchdZKcV91FtYpzLbmkyU74gK7cHz0s264XLarWuITBX5aoTQI8TczEgwAj185
 oUes1Tn+TDbR3NBPn8QuN3+2aDTfy9nF6qDuI3q9DMDko2f4hWyC3V6XisqSn80lpRKH
 xxhQ==
X-Gm-Message-State: AO0yUKWuy4NaLtO3s8aNX9Fi7FVYRk2dFykfuhwejfnMeaOL1YtQQqfv
 jPNfsIUqIwGbyKSrJIhS+RB/xQ==
X-Google-Smtp-Source: AK7set88BxEHbelSNh6ps8DSC6iaP2PD0fl51x4goNDO94VTcB1EXG+zzvc+L+VzA474e1nRXT5I/A==
X-Received: by 2002:a05:600c:35d2:b0:3ea:f6c4:5f2a with SMTP id
 r18-20020a05600c35d200b003eaf6c45f2amr11517830wmq.17.1678188526216; 
 Tue, 07 Mar 2023 03:28:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1ccc06000000b003e118684d56sm17047627wmb.45.2023.03.07.03.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:28:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FED91FFB8;
 Tue,  7 Mar 2023 11:28:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvmarm@lists.cs.columbia.edu
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>,
 kvmarm@lists.linux.dev, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v10 1/7] Makefile: add GNU global tags support
Date: Tue,  7 Mar 2023 11:28:39 +0000
Message-Id: <20230307112845.452053-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307112845.452053-1-alex.bennee@linaro.org>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

If you have ctags you might as well offer gtags as a target.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>

---
v10
  - update .gitignore
---
 Makefile   | 5 ++++-
 .gitignore | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6ed5deac..f22179de 100644
--- a/Makefile
+++ b/Makefile
@@ -145,6 +145,9 @@ cscope:
 		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
 	cscope -bk
 
-.PHONY: tags
+.PHONY: tags gtags
 tags:
 	ctags -R
+
+gtags:
+	gtags
diff --git a/.gitignore b/.gitignore
index 33529b65..4d5f460f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,6 +12,9 @@ tags
 patches
 .stgit-*
 cscope.*
+GPATH
+GRTAGS
+GTAGS
 *.swp
 /lib/asm
 /lib/config.h
-- 
2.39.2


