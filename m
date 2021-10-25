Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F364439110
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 10:21:05 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mevE8-0001Lg-Pp
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 04:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mevCP-0000eX-1U
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:19:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mevCN-0006tt-3l
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:19:16 -0400
Received: by mail-ed1-x534.google.com with SMTP id n1so12901804edd.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xh0lUDJ0bYFg1TnbFuNQwqUOPWrwhXrrMhAP+KCCSMM=;
 b=W0GIR7XAjggsuVpu7DfocsxNqvCv5lMN9x3hoM+Pzl3wBAvOTLcW/in85l6t0zPSvM
 mq224xEk3s0dXpdEs2xEUdHtm6gm4GP90POk1B1vPZ33+VNAlREiHVzzv5Y27nn1ASya
 hUhzRbWAqwwgoNO6WWO6dip8ZgtPp85+CM0rb7xble9GyNpjxToKDv/ZvfCgSszW8IuY
 l8Kwq8+ahg26pqDD1V482CXg0vG1Rk0RVoa4ew5GgLPAJwLzQuvuzponaHR1ZRnlsc31
 EDe7/aDRkuZ2mkck0WVl++altWKo1zwgfQpDzX9d5bBKmcsvyIYvGflVRHbS2whuJoL/
 WCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xh0lUDJ0bYFg1TnbFuNQwqUOPWrwhXrrMhAP+KCCSMM=;
 b=KCRuSNthIX2/j4RYY2ZT/osT9+t3bcD6pEEk4+zL4k7LXnvUuQeZd0HVV0Hnplv4sT
 7iuRRU2CzTo2MHqqy/JP5m83D3pIxHuyXa53M2KVa0jq7HJXttPr6gO0P2ywoaiOIpF1
 VrUcaiwEhql4UB5saFK/eeUmh82hCV6dJnCC0L5rDCUirg/4WiaK/0uX3AArGVLej/fs
 m6SInwDj/nJXbQqGetFvq+WcCU0XbVbl4tUug/lBz0mHABVfGf7tP8jsUl0e3aycpl1f
 AzcKexB4lL6Ih3jd3Md22X6ZlDYXVRt8oG4vtoqXUJFNQTL1nabsnlxehzpZhmbLs3fJ
 74Hw==
X-Gm-Message-State: AOAM532m94NCsc0mR8p3+Bk3l45wHdIBGUJzScgCkQFEc3jUOGKBzAPN
 e/OHCE46HzvG8sbbzY4571aj+XQH1co=
X-Google-Smtp-Source: ABdhPJxOw5KLgrDnSE1zhvhSBAwGaVOGUZ12qdLyKBUzCdd8X11terpF2RMCNJxhGu+WZW2g15Og+g==
X-Received: by 2002:a05:6402:520f:: with SMTP id
 s15mr2156915edd.320.1635149952959; 
 Mon, 25 Oct 2021 01:19:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id hs28sm868060ejc.111.2021.10.25.01.19.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:19:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove useless NPTL probe
Date: Mon, 25 Oct 2021 10:19:11 +0200
Message-Id: <20211025081911.628955-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a linuxthreads system with a recent QEMU will have bigger problems
than just not having NPTL.  Remove the unnecessary check.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/configure b/configure
index 03162008aa..b5c36347eb 100755
--- a/configure
+++ b/configure
@@ -1994,25 +1994,6 @@ if ! has "$pkg_config_exe"; then
   error_exit "pkg-config binary '$pkg_config_exe' not found"
 fi
 
-##########################################
-# NPTL probe
-
-if test "$linux_user" = "yes"; then
-  cat > $TMPC <<EOF
-#include <sched.h>
-#include <linux/futex.h>
-int main(void) {
-#if !defined(CLONE_SETTLS) || !defined(FUTEX_WAIT)
-#error bork
-#endif
-  return 0;
-}
-EOF
-  if ! compile_object ; then
-    feature_not_found "nptl" "Install glibc and linux kernel headers."
-  fi
-fi
-
 ##########################################
 # xen probe
 
-- 
2.31.1


