Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CDB31E155
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:28:04 +0100 (CET)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUMd-0003nb-Ts
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN7-0002CG-TI
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:30 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN6-0007q5-AY
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:29 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z15so9172697pfc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8rHoeZKiC+7eBm3oTFadO1gEc0i538afGIZflXVo4w=;
 b=MePxeNbHN0QhcWIEXJzsKd74WDdoWYwDASNxSye19q6uFYly17eDZcudRSPUS5q7v2
 eOfroM9yqjh2QIUShaMRmHLGPtPkxG6EpunC4CoktqPxRCZ0TLaGiV9qobZICURN1D5N
 JGOTE1lrpDwZoAbRWdFgYaUp3m2t1/IWklaLlgk26yzkTP+Zc9KikX0uuIIFs083o9c1
 NzXov6QMbBhPrATiVVORxQQvmtrndAFoRy4QXWYdPjlhVB8F2s7wuLbcQzDocE+S6WuC
 0j35Gqq1kks7uATaUbL5JayjQ0LWRZ8Lj42wNXtKqs0J2La5iRQudXFXMUg2epUbrg8+
 VE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8rHoeZKiC+7eBm3oTFadO1gEc0i538afGIZflXVo4w=;
 b=a5+b1dg/QlFguy3Bk2UtNvk0Sy1RRq6CAqAjlfzpQNLx8tDETlvTQXLdEfqEYL/Zzd
 mMHUNCI+yjVFpl+2lC8tgSOGFJfftQIvY/t/76wlYdBaTnxAefOkacFazDWbe3XhMFSn
 v8IEviFcVi+LML2cf3rBAEpiTRLmyOPFxiIUe1r8E4yr4l+4hSai0pVkfX84jkJPS7jo
 QuHbT4ciCNOnzLSmJVEP+EIbBrbX2waTq0MLqHn+vOL3WoYQc8xawXvcXJ8HNg9QWcLM
 gS2Bds9Mn77Y4thGEX7D6k8g3BdxHblS2xGDgC6WQWoMkcoNL6P9DYk78esrcCuQ/J72
 5eMQ==
X-Gm-Message-State: AOAM532QjgH9IcMSfubJ6Mo/umf8gUBSeubM1rajGZsh6qnVsj3h1Io7
 y3nvxPAsUJmwjrfGCK7uAVQ1rdxuSzeyIQ==
X-Google-Smtp-Source: ABdhPJwA+VGMuSbPZaaffBxsMpK6HXMhJ8OC0lcWfKSPZ6QrZwrYZ5sCULYafcaL057nFsBSdy3OCw==
X-Received: by 2002:aa7:94aa:0:b029:1eb:7783:69c5 with SMTP id
 a10-20020aa794aa0000b02901eb778369c5mr962723pfl.60.1613593467044; 
 Wed, 17 Feb 2021 12:24:27 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 70/71] tests/tcg: Increase timeout for TCI
Date: Wed, 17 Feb 2021 12:20:35 -0800
Message-Id: <20210217202036.1724901-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index a79b3746d4..b8924276bc 100755
--- a/configure
+++ b/configure
@@ -5797,6 +5797,9 @@ fi
 if test "$optreset" = "yes" ; then
   echo "HAVE_OPTRESET=y" >> $config_host_mak
 fi
+if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
+  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
+fi
 if test "$fdatasync" = "yes" ; then
   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
 fi
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801..fa5813192a 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -77,8 +77,10 @@ LDFLAGS=
 QEMU_OPTS=
 
 
-# If TCG debugging is enabled things are a lot slower
-ifeq ($(CONFIG_DEBUG_TCG),y)
+# If TCG debugging, or TCI is enabled things are a lot slower
+ifneq ($(CONFIG_TCG_INTERPRETER),)
+TIMEOUT=90
+else ifneq ($(CONFIG_DEBUG_TCG),)
 TIMEOUT=60
 else
 TIMEOUT=15
-- 
2.25.1


