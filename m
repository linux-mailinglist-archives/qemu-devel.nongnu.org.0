Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80755EF6D8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:44460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtsA-0004Kl-PQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3Q-0000dx-Cq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3I-0002P2-Th
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so3506276wmr.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=y7ztg4FO2RX9qokS5MY3bU2yllpC+y9KMjpt1S6fvtU=;
 b=H9Yf8HRxqPdG9Oh0cJHxBOay5qGm04muY7M1nRQ2HLFCCefZmax7x4Qu1eUsKYyV6h
 lnRD2qAmt/UfGuYFwkIuUno4rzFaoFNB1QNBroKM/gq2paa+OaWS8mRTDNtqzhGuQnOg
 6NHtaIwT0wMAIK2RtomMdvE3xILE36gmrulUXsKZLpRk5IOQIrzTq5PnKxPp3JFa9Vs0
 UHfkqBKBM11Ml8p8Rv0bZ6G4MGP6Aag/o8T6BTGF7OxvrjNUxKdaTuBEM1bIJ8p1Qzo0
 4ritFcQdxQYE8pIjdvSnPr4n+G6q/GPjaNQpRxMbKyxyZVXPUWGF15lya5JbxFhOKGkM
 Kpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y7ztg4FO2RX9qokS5MY3bU2yllpC+y9KMjpt1S6fvtU=;
 b=0uS+6RlvNkuhItk69sv2SHitcVCBhg61s3wW/+/tYliCwk3uDkXzqY7Ts9Mr/VBaIN
 +e6/+3D7J1InbZp1eBi2F5ZguyM0TcO4i8oB75+Upf/O2msQlnfqj3vkNG8tSP7rot75
 8cZayMln/0JPS+8XkhoXDCUc4n93JVZ05xkEnFhA6dVR8yPUEb2/NK9x86fsjY+zke7W
 JVtqighevTy/BZ1nl6MVUjZLyq1CBv7Z5qDu2U0Vna59mUYQlI1BE8R9eNlWfoCxaUhi
 Sr8L0jTSUqNqPhXpa1KSygnFay2tlU2VzRZdoUPyGlBsrU5pBSsB7vzXyPpPCX8qrtZE
 3hiw==
X-Gm-Message-State: ACrzQf0bnEo0kjO2VIgw0A32ixpZRcRATRdmM4G5+a8g+Ax8tZrtOODc
 vV1sMWafaKUvN11pRAWwlsEFdw==
X-Google-Smtp-Source: AMsMyM53Npumh8i+ZPdc1dLOcpaMEEjHA9f/Fg8iIF4TPK7rHVdEgeIf81NU5LOI8tz116Zxqvkywg==
X-Received: by 2002:a05:600c:1f05:b0:3b4:ae0a:b2e5 with SMTP id
 bd5-20020a05600c1f0500b003b4ae0ab2e5mr2099777wmb.104.1664452199977; 
 Thu, 29 Sep 2022 04:49:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003b47b80cec3sm4457949wmq.42.2022.09.29.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B0D51FFB8;
 Thu, 29 Sep 2022 12:42:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 18/51] configure: store container engine in config-host.mak
Date: Thu, 29 Sep 2022 12:41:58 +0100
Message-Id: <20220929114231.583801-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

In preparation for removing $(DOCKER_SCRIPT) from the tests/tcg configuration
files, have Make use the same container engine that had been probed at
configure time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                     | 11 ++++++++---
 tests/docker/Makefile.include |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f3984bb193..ad70c81bfe 100755
--- a/configure
+++ b/configure
@@ -1810,9 +1810,11 @@ fi
 
 container="no"
 if test $use_containers = "yes"; then
-    if has "docker" || has "podman"; then
-        container=$($python "$source_path"/tests/docker/docker.py probe)
-    fi
+    case $($python "$source_path"/tests/docker/docker.py probe) in
+        *docker) container=docker ;;
+        podman) container=podman ;;
+        no) container=no ;;
+    esac
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2444,6 +2446,9 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
+if test "$container" != no; then
+    echo "ENGINE=$container" >> $config_host_mak
+fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 270e99786e..c87f14477a 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -14,7 +14,7 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-ENGINE := auto
+ENGINE ?= auto
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
-- 
2.34.1


