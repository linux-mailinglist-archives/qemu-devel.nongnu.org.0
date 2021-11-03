Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D48B4444B1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:34:46 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIHl-0006Lp-7c
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpU-0003fF-B9
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpG-0000z4-0f
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:31 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso4877361wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEYPHCoLHi7U2PQlZyg1xbJFkqyNPR2p+feFATfDKZs=;
 b=SPGj0ZihjNSAhZl2e5mw1DufY7yLbWIRAh9MDCFCqrZ+8fqIbcWqIGFfhjaaNjc0QK
 gKh143ZsyB8igGqACGKjL/hjFGth0+ONLd4Ir+sbqh/mf/0EA8CpDa7lQnT9CM6Np8ti
 xaM2aeGECr0OHqTA+0r7ZW2d0OTeR8y0LUHM1N3ZYAoayPLZMD15hRLpy4Bmbcga5R9g
 CWc/nUGLR2KruoWB0b6+Qd/zfBDJektmtT+zOMZplSCtXAN0sRSxh9+9qVQ3EROKQ5Zf
 BN4/jM1hNZ/4lWb0z3CPD+zOmghj7fet/HtRX9bedzxIx649Mhw41kKn2nSlmVceu0mF
 ZulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LEYPHCoLHi7U2PQlZyg1xbJFkqyNPR2p+feFATfDKZs=;
 b=O+ovCoG7vobeWHCMpQSAjHfT73RuRmY1OR+DgObTh9ndr0izde7+w8EELYY/g56Mnq
 L1juyoUChl9StfsyGD//cS6nv2a8F1AB8+oGunaVWHGUf1O0gEo5FN+u2rOMBHb1xe1r
 5bR3RaC8E3KUXJPz2pj72FLN89plk3upzlS6OvAhR71rCVaRMT9HNW1fiLh8N+0xoitZ
 +eNxssnMVBRJfW3SlFBEIfmimNfyFBVqE0NuJ5H1Z8vtZAm/I+jlGl2hEZSJLkxtDeDI
 6GsL0AoKwb4qjVwgAZhjrL3d+lFSauqnIfzmwKZVDN9uISm4A63QyGG83n78DEDtSfow
 qVow==
X-Gm-Message-State: AOAM53055sMSpxB1oVFbczWoiy6kU7Isfcq73dEs0AMlqeLzP5mXe+Ar
 LdVgUrewI93ydQ4ZIHA/mw6H+/wcZhs=
X-Google-Smtp-Source: ABdhPJzJEW12aSoMOpHepK7OqIrNy70EV4vwmrYH1e6efgsSyYLzVQe4a5VkzKz5p35SDNpjc+X9xQ==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr4559123wms.100.1635951913776; 
 Wed, 03 Nov 2021 08:05:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/27] configure: Remove the check for the __thread keyword
Date: Wed,  3 Nov 2021 16:04:41 +0100
Message-Id: <20211103150442.387121-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We recently bumped our minimum required version of GCC to 7.4
and Clang to 6.0, and those compiler versions should support
the __thread keyword already.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211028185910.1729744-2-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure b/configure
index 2268e5d0ab..4c444e1750 100755
--- a/configure
+++ b/configure
@@ -1724,17 +1724,6 @@ if test "$static" = "yes" ; then
   fi
 fi
 
-# Unconditional check for compiler __thread support
-  cat > $TMPC << EOF
-static __thread int tls_var;
-int main(void) { return tls_var; }
-EOF
-
-if ! compile_prog "-Werror" "" ; then
-    error_exit "Your compiler does not support the __thread specifier for " \
-	"Thread-Local Storage (TLS). Please upgrade to a version that does."
-fi
-
 cat > $TMPC << EOF
 
 #ifdef __linux__
-- 
2.31.1



