Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034514AA17D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:59:43 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5gD-0007Aj-Sh
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R0-0006oc-Np
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:59 -0500
Received: from [2a00:1450:4864:20::42a] (port=46058
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qy-0007NA-Bn
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:58 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m14so13364305wrg.12
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3pYD4JYSVXhkyNJUs20bvFwaG/zT+sknHaI6CYVatE=;
 b=TA58Qzb+F8E975v/DTXedJi2piVdfVnaaWVIERqz5mmcgY0sotV6i7PI4P32L1WTA/
 am1zN7oStqp5u3fZsGA1PARcC9kLp9K/cG71nMVQ9ty2U53Cy7ob+vhV3u/ogAgT8z79
 ubyIda7S6yqqu/nzpaq7UhKv/uyLW/7xO1tBmDnMY+I55TAzE8j247gYkCbAaNdvQxJz
 ysJ2RuBGdsPP5QcY0A9oTdNFHDWxzXZLi4o4KS2S0n+YXekqsAlQeIEShW5e6XBURcQS
 +ufCcQfr5NyZuNdvOwldyzZflKClqvAQ89ohDU7xujNAgEyUwrp9pPlyyKBi3P3pPlrJ
 WCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3pYD4JYSVXhkyNJUs20bvFwaG/zT+sknHaI6CYVatE=;
 b=ZZlioydaI7VgllGny+IlnIbmtAKvigZCdxNKa+FKWhxAqDLuqhjLs5pJjtvBly+QaL
 LKOcbHXpEDy92aQ57rViHCd7ZS0Zo3Frj8ScQ2KYw5Eji6QIgrVTWU/wcrttit2YIiCV
 kONfRGCP2flu2XQxRu51f0E7AzKQWEItTeocsupf6lPOXV+4eTVI1ZBi9UHyeNStmn8u
 LCPj73lvQTUpsRvMjtXwfuAod5XSm+ZTGocEWnDoeSZwgwHwHLBkhMuL6hO4pGktBtjM
 4+YJmHSXSNrFKxl9gtNvqQujhCBbsqL1HANKHDixAghCqBUfHV2spGDR6EZ9VfwOltc8
 9HOg==
X-Gm-Message-State: AOAM531gssxk/tPQ9UAzRMbsn1cljhpqlyyfk1E4a26QVdH0q816hqc8
 RoDfgmnIrRidnl/ATlwv78fSoA==
X-Google-Smtp-Source: ABdhPJxsmEXq03nn+okkH5hQQIleG/tVfgFgychAFCvxYadKZdxHtvFoSR4ftUS6+Be+opp2RpNutA==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr538074wru.20.1644007435161;
 Fri, 04 Feb 2022 12:43:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm2905543wrp.41.2022.02.04.12.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41B5B1FFC3;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 11/26] tests/lcitool: Install libibumad to cover RDMA on
 Debian based distros
Date: Fri,  4 Feb 2022 20:43:20 +0000
Message-Id: <20220204204335.1689602-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

On Debian we also need libibumad to enable RDMA:

  $ ../configure --enable-rdma

  ERROR:  OpenFabrics librdmacm/libibverbs/libibumad not present.
          Your options:
           (1) Fast: Install infiniband packages (devel) from your distro.
           (2) Cleanest: Install libraries from www.openfabrics.org
           (3) Also: Install softiwarp if you don't have RDMA hardware

Add the dependency to lcitool's qemu.yml (where librdmacm and
libibverbs are already listed) and refresh the generated files
by running:

      $ make lcitool-refresh

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-8-f4bug@amsat.org>
Message-Id: <20220124201608.604599-12-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 tests/lcitool/projects/qemu.yml            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 003ee2cfed..699f2dfc6a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglib2.0-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8993d2d9e0..87513125b8 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -53,6 +53,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libglusterfs-dev \
             libgnutls28-dev \
             libgtk-3-dev \
+            libibumad-dev \
             libibverbs-dev \
             libiscsi-dev \
             libjemalloc-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index de51a2f1dd..958868a6ee 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -43,6 +43,7 @@ packages:
  - libfdt
  - libffi
  - libgcrypt
+ - libibumad
  - libibverbs
  - libiscsi
  - libjemalloc
-- 
2.30.2


