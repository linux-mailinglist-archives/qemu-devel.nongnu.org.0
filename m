Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3E3376AE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:17:31 +0100 (CET)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN46-00051p-Ax
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVe-0004Sf-RQ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:56 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVU-000719-60
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:54 -0500
Received: by mail-qt1-x82e.google.com with SMTP id 6so1263487qty.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtFk4wSnOwjuUh6hagaoKS0TCdHIiNtFe13FGIUqDnw=;
 b=qegANKqnPL3vmUImMmOUkpCnyCrG4ZA4S0RJpMy3bzJ10QpDUTaA/55RA2LxognTVu
 YbBaOhZ0Vfo1gnY7VlmyV6Y9m1GbQj0IOPpTm0AwK5jG85IZp5og8nYAeH+EC6MRHeSF
 yb3yEeeGlP7PBDi9uagYIdrjjDq2bxmvP5SX7sd1YwHxnop30VTY+ZAcO5YUX231YUoE
 sRJw2ugJAypwbAnPsAjOpz+pHpSZRzFib/KSId6NqyDsT0GUOw05cE4dEl6SSYUSVZs3
 0gY7fSqpPH1A1KC/SVsrfw+/Zzhhv1+1uh+hb2uPNFif3b04bZ7Os2y8DvfYpE2ikQyK
 TY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtFk4wSnOwjuUh6hagaoKS0TCdHIiNtFe13FGIUqDnw=;
 b=XPG57gs7RpY2JUBK5T66P+b8EygnW/w36I8INfdI4aVa4Fg+3S5LoNDyDrsqHofAMn
 JQAhW6npDF019SB005nRv4pmjTrGuCPARNqzA8bJe7x9QWyPnn90OoVA3vRBu2whk3Wc
 UkUWB+KBHimBCMO57lphoKpn7vC53dSBMCpIODcXQJpWdHvqxAF1G5uiaNUyc1hJ8axW
 AKmRVKuCvn9Y46CdhNfXIUP3MuqKf/PXhO2yhMhesAPX/Sf7kJgUedIn7rsl8ghvhCcJ
 7nhhusrwbdz9Zwbm+PpUuSbnjR4QaB8kTJ1+u3r2ZQqrJnW37f+Sp/Ry6BBKFg4Hjnuj
 HXqQ==
X-Gm-Message-State: AOAM531cehj+Rf9N14mX8JQAJniwxYezRf9/sdLfd1gOZGruC5VWzaOZ
 1KIm/GIxmIKn+omkkFlo2G8VwqVuq3cUIaSR
X-Google-Smtp-Source: ABdhPJyN2+T3nTBk+3D+Qpyaykq3GH8HciuvZgKTDKMoV5jh0BU4lA2Lxuw8LsO1jC1f9H9zZhKSeA==
X-Received: by 2002:ac8:3a41:: with SMTP id w59mr7776294qte.8.1615473703228;
 Thu, 11 Mar 2021 06:41:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 55/57] tests/tcg: Increase timeout for TCI
Date: Thu, 11 Mar 2021 08:39:56 -0600
Message-Id: <20210311143958.562625-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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

The longest test at the moment seems to be a (slower)
aarch64 host, for which test-mmap takes 64 seconds.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                 | 3 +++
 tests/tcg/Makefile.target | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 34fccaa2ba..5ce5b5b136 100755
--- a/configure
+++ b/configure
@@ -5792,6 +5792,9 @@ fi
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


