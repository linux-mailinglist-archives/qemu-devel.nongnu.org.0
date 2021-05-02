Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8018371013
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:17:06 +0200 (CEST)
Received: from localhost ([::1]:43670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMGn-0002HM-Ra
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyD-0007rI-Fd
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:54 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy9-0000iQ-Pi
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:53 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s22so2491029pgk.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPyPdgIQwOt+hMMQWGT+aM63MqXLUcHF3tgc1cZoV80=;
 b=pcIVja7aY3yOhJ9NgYIuX3wuVDLusY6baN8+SaBsm+yVGZtIhpXa6SHPrKofbfaYLk
 f96kEDvfnOJOQE0LSNY+6r1M8fNwuhe1kSf5myITkhnPm4GtBrxzUOME0QobpNzs06HZ
 /nV6DroSwy1k+K9AtpkyCS+MSYFfBPQEX93czZQCYxgwCwJJmuMyiJmhSL/++cIsVJle
 1IElFyP87RndR8XEL5zE+JjH3TFyzLATEmOXiciSr9fnipHomo4+2FcecK539Ni8OMzW
 29RH1DnzCic9pKVxkEEmHpVV0uoo//fTO6f1zZosmTrMvUjgNb24C7W0amZghYOqKOpR
 Vxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPyPdgIQwOt+hMMQWGT+aM63MqXLUcHF3tgc1cZoV80=;
 b=tQT9gyCZHOLayfZYsbKdVYzfsHhv32CLf6hNID2jLC+pmF6kQ3CBSKq6yAI7YRe/ip
 Io5OuEXJhqCC+/jHIuytIzjgkEO5cfFP/VdbB2UqkVBbJY968M8tWPI/eNOH/T42t3zh
 Xgmx2x1ScSUW1WWppE/AaBOYoZDkcN3PoBRDemvNoCT6WrhN1ieY2K69QYlBeei3WXed
 NFhqqcKbbVtWloZnFjag3vl87B89M2hpT9Y/hQjCCiocaO6aLUakGe+cjObb6rDN3V6u
 XI7ZcZ48Sv1qssGETXRSTdZ/3Yw896r2GGkbuoJX+wFxLhi/jB9im2hROCQG6loVJt56
 kpzA==
X-Gm-Message-State: AOAM533wBSF4sCnHg/ffbTFGwrFhUmAgSsxpfku6HKCx7f0d1ItAJL/y
 dulcxRCPjaWQpaCyQjFdC80dQFPpK2W1xw==
X-Google-Smtp-Source: ABdhPJzeL60f7y+1q4mkhTft0E/hCAfOg+2RdEhsGRl09sYy/LHZg9HCJACJHNRQWavFGGyXfpr6cQ==
X-Received: by 2002:aa7:8c59:0:b029:28e:9093:cd4d with SMTP id
 e25-20020aa78c590000b029028e9093cd4dmr3316636pfd.25.1619999868610; 
 Sun, 02 May 2021 16:57:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 24/26] tests/tcg: Increase timeout for TCI
Date: Sun,  2 May 2021 16:57:25 -0700
Message-Id: <20210502235727.1979457-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 4f374b4889..c0caa6f42d 100755
--- a/configure
+++ b/configure
@@ -5795,6 +5795,9 @@ fi
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
index cab8c6b3a2..29d2291016 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -80,8 +80,10 @@ LDFLAGS=
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


