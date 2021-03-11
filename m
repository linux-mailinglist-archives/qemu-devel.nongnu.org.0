Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0058337683
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:08:47 +0100 (CET)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMve-0002DJ-Pe
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVi-0004Tr-TP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:42:00 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVW-00073D-Bl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:58 -0500
Received: by mail-qt1-x834.google.com with SMTP id r14so1265921qtt.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mIbW7tk8kzPtUH9Z3cL5eHd0L1fqZoXvXXJa8VSBNBo=;
 b=uyPzs3WJIEtWsnJCLDudzCIZd3ffQv7vP7+YxAfmppXFmWpqoOVj/1x9YQEMsGtSUy
 2kq/j1utYzALm/zU9oxp1uI+RGTr8HjpwB+rjuZ9ozlNfMhzTk4BEDX3zb3qzEMRA5Bo
 UDuWTfd9m/kmILcGZtu4Cpq5fLwDVVnvuH43ID9f1fuyaGG3VjBeDrQWhcNAxLP0WgFc
 5WJbXVQ7OHNKZBeka4FPQ4cqZpHZFmGO//WROTPMHa5VOsNu1FjLlvQh02lhDa1F8YAt
 dQxdElze5HGCUzwdcVyw7k6iOGWfeYYwi1cvpbU6kREOMx0HeNmhXbWUA6cO9mWfrlSO
 ONrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIbW7tk8kzPtUH9Z3cL5eHd0L1fqZoXvXXJa8VSBNBo=;
 b=sfAuUUeNQJ1SCVPMZ02N8r2T5aW1sq8tbR3CLb5PmXl3oB8EQ3Wpgto41MtUdlJ7qV
 6NOQvWDDiS6Bw6H4QbWVeHMuxXFh6NpLZL5GF+rMpu4WTCR8qhNkg/UJDq/Hu/gDPnWy
 aq7uewPUI5f+jYtR0lLBgWcCQd6AFZQPdKKaFz2JSb7a8oAaOulmRZ2lzCLGt4IppJin
 nq6aBfC2Uezbo+L3mgWbttIsL8eVKReeQ9112vjWAPacJR+1x7Ak2X/3+DUIY6C7Ogbi
 9g6SxwtMQtWLO3KaCq5HqExPv/DOEWG1AzT/nEI8fGPQovKkdYLl/fyorWfNLQbrXQ3S
 j/lw==
X-Gm-Message-State: AOAM533XmDpqJMj2ACGFP5667KNmRjKrSDUvbbesgECAlIzpdEJkU66k
 zDiTULbp9gu5rjkAAzJp9WdVUsFJAqOC6QuU
X-Google-Smtp-Source: ABdhPJwHJrHl8TVlzolNHqrbhyzYHZeO5DiZvPnaPqQwb758sUL9GIqFzIlpUiWSxr4ZvW/QMimO0w==
X-Received: by 2002:aed:2ce3:: with SMTP id g90mr7600377qtd.308.1615473705455; 
 Thu, 11 Mar 2021 06:41:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 57/57] gitlab: Enable cross-i386 builds of TCI
Date: Thu, 11 Mar 2021 08:39:58 -0600
Message-Id: <20210311143958.562625-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: sw@weilnetz.de, Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently only testing TCI with a 64-bit host -- also test
with a 32-bit host.  Enable a selection of softmmu and user-only
targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.

Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml                      | 11 ++++++++++-
 tests/docker/dockerfiles/fedora-i386-cross.docker |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d573e431e5..099f2ef2e5 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -27,7 +27,7 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
         --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
   stage: build
@@ -97,6 +97,15 @@ cross-i386-user:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check
 
+cross-i386-tci:
+  extends: .cross_accel_build_job
+  timeout: 60m
+  variables:
+    IMAGE: fedora-i386-cross
+    ACCEL: tcg-interpreter
+    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
+    MAKE_CHECK_ARGS: check check-tcg
+
 cross-mips-system:
   extends: .cross_system_build_job
   needs:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 966072c08e..b620d7664d 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     findutils \
     gcc \
     git \
+    libffi-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
-- 
2.25.1


