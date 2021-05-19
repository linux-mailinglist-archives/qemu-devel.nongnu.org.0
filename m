Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8719389659
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:14:17 +0200 (CEST)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRe4-0000Io-Q2
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCn-0000Gn-L7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCl-0005AD-2e
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so15116360wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOMO62Q92IuNdNSfONgd4MnSVajL3jCH8wZPtpwgeBk=;
 b=Y98e67dpeXKqeI+2AZbWshcySi/SwNQlRpYqnfMdi8llt/jw+5i9it+hthnuHRCcca
 7DFGv07614TmdjD421rOAQl1tdzxqQrNC1IDCxRcrFUhusoM59Le2N07GVsEIdzAyiVs
 42jWQEUj8rIAfrDLLV3TUygUpkxD+aDO1yXoTPyzU2Ae5I4qTxmi944G2IRZNJkiM+H7
 ubKoC8vBvuG9YFk7akZ4Ylw5nMGJFqZYPmZuvlHxiFMDZ3gY/WS+sEH6Di08+7tDeRWq
 V5T9lsIgBYHvuxRUPTHpp0YOCsKHFBiket2et+kqAkW3dgqr3S60syln6ONWkmmVVpJY
 OF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uOMO62Q92IuNdNSfONgd4MnSVajL3jCH8wZPtpwgeBk=;
 b=NP6AiXY0Nj19Wt4JvX+Zuai6Kq97IEfgXohjjvM/8YYPKJXX0QsqG5nowGFJJ8gQ5F
 v0VIQiNSRAxgYVerI1/zE4ib94tjNhGlJBoZAZ7RJ1SvbYV4kT6O17claBCesm7y4NTm
 iU9mYMYm0q2PaqBIzD03LzLNaQBVrOdHHdRNHnCijiJUcbCwTIzc+gfJfLetY5KdKnG0
 iRb6jGjcc9PtisGm1f/P2nU6OPCIgCSWku9yK1aF1UmsolZMo0slcQBTR4II7rVKNAwJ
 ZRhy4lbFPWlxr5+kwz1pg9eahyEemHiJDz5AqHnDNr2XJhYlgW/cB70XLtc9qqyRj8Jm
 xDzQ==
X-Gm-Message-State: AOAM531AIZmIbpw4xeYP3zrtF8yqNPubkYnCrAiY5DW2LwX2iA4zzbhH
 hKpKEPb/hDm2Uc6H4QM+aF6a82bsJDWOrA==
X-Google-Smtp-Source: ABdhPJw0iL6ts75u0hDpzdQwyQJDKeO4qdpxb1X/Mo6TOMdQdJcx+qoto53eL0Z5mUtdnvoDQ6U0iQ==
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr345843wrv.372.1621449961484;
 Wed, 19 May 2021 11:46:01 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm199005wru.73.2021.05.19.11.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:46:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] gitlab-ci: Adapt JOBS variable for FreeBSD runners
Date: Wed, 19 May 2021 20:45:45 +0200
Message-Id: <20210519184549.2192728-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'nproc' is not available on FreeBSD:

  $ JOBS=$(expr $(nproc) + 1)
  bash: line 119: nproc: command not found
  expr: syntax error

Instead, use 'sysctl -n hw.ncpu'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 58b01744751..fe4f18595ac 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -1,6 +1,16 @@
 .environment_variables_template:
   before_script:
-    - JOBS=$(expr $(nproc) + 1)
+    - if
+        test $(uname) = "FreeBSD"
+        ;
+      then
+        JOBS=$(sysctl -n hw.ncpu)
+        ;
+      else
+        JOBS=$(expr $(nproc) + 1)
+        ;
+      fi
+    - echo "=== Using $JOBS simultaneous jobs ==="
 
 .native_build_job_template:
   stage: build
-- 
2.26.3


