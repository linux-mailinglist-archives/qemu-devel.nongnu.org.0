Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77D437B589
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:40:11 +0200 (CEST)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghbO-0003tW-VA
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYq-0001IP-02
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYo-0006Z3-IF
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n2so22347377wrm.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOMO62Q92IuNdNSfONgd4MnSVajL3jCH8wZPtpwgeBk=;
 b=EIRg2spGMghwhaoSxQP4ls8MW4t3Vadh0h1NdN3QG9d2zkcZHtpFNfshqc/JUIlVf2
 +Y1E5UlGwDax9O16A7FVQ+On03GQ9hQbOZvpIkufK2WabMbCuQiJeO5IOjffa2fOQCCF
 m1yqs/av0tIaTmirj5L5MwhB0EQeeNgiUqBktz8O8X9DkGqyRMwQJY4VyAwSnoUMG2ra
 2EZJpb4A9pOisCxQFol1c7qzAUKrQDiFAPRLtgzp1Rw0pzlyMtQVibxaw1vFARLtyNZW
 VnrPHYygdd8JkNn/DzyT/BVIdFmVn//bMwZx49NtagtcPWdzjL09S3aPjCwH2ZacH/vO
 tgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uOMO62Q92IuNdNSfONgd4MnSVajL3jCH8wZPtpwgeBk=;
 b=dJVfEILLMVloq7Kmh7tz1YMBHvC6fLtHso52A4Yiz48RJpgHucH8dvHKT+VeBkduXd
 xHHbHL/n0hxbm9ve7rCZbnpXiyW4f+uwe/uyHb5S8U72ThZKLlZ9FKnRx8YLt/avyHky
 WMVvUzkCyTamgGoc81bFzEE4oXys33ee9mZLjZJ/yS1hI6E0a0xviZur93DNHgX03q64
 ZWnS7FWdTAFb2djr0ygNbGqJ5hIQvnSg4T6C26rtcX0bKZRLzyBgNsn00zCy/i8l0qJ/
 BTnyxUklg9i4nIXMok1crLsfO71FtajoMwCYU8udSX4WkOSMUzB/xjnu030Bo3+mWfwk
 HtZA==
X-Gm-Message-State: AOAM532QkssvvcHw0Ll9epFYO3SaKGRwfSTeioSk0kB69SBv+Da1EACM
 iP/834cI9sdURzLc8ZZycgkxdgftziA22Q==
X-Google-Smtp-Source: ABdhPJyLajq00fq4SiWax0RoSvJ4cPKWTi46P+Q3jfmt3HOnY0CLer3PcGcmVFSdCu+cGGTtkLvkvw==
X-Received: by 2002:adf:f683:: with SMTP id v3mr42121676wrp.133.1620797848939; 
 Tue, 11 May 2021 22:37:28 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z7sm28923720wrl.11.2021.05.11.22.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] gitlab-ci: Adapt JOBS variable for FreeBSD runners
Date: Wed, 12 May 2021 07:37:10 +0200
Message-Id: <20210512053714.3268162-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


