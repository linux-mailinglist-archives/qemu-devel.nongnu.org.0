Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44518444479
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:16:43 +0100 (CET)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI0H-0007vv-Qf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoy-0003GX-1i
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHov-0000Wv-DL
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so4845607wmj.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCgK4CE3camX8jKly35z9f0qOVDoSg2DiZBY0UgLY9A=;
 b=XQzmtp8gMyb9o3UVaVtgpja9xReaw70MIP7ZBfvvWgI+rCbgJ/91ina0MNpvdicYHG
 dQXOOyIxZ4yI+Etj0BvtrMdadv8CH+ryP+VGoyrXdbRacUSTAVR79Ud6HPC9As31mv9K
 DW+MvzrCRLUKOvLLA8s7dIvtAEUdQ+ySxkYwOA4TNQ0wGdzhxcHk3Y58DIVGKhZIDlzq
 0z8fL0xgK/VA+DjewqxQPXTK5oqSW+zUien43Y2dqbyMQDR4zIWJe0mwBmtknBiFGZGL
 8Ddznijg8aeZrn1i1Kg23cvKzlkW9bBprQjuEiRtptMbR05hwXxW5dsji02m/dUUx6lt
 XNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GCgK4CE3camX8jKly35z9f0qOVDoSg2DiZBY0UgLY9A=;
 b=M0HxYi8m3/KQR7ptNfdyzn1yZ5FLd4KE5Uu9gyt4Het5/rJOAXO1KcK0IRBiJiTiOb
 RISASxQOCJEd/4c3wMBFOEvp0gfRlNic6bpyXlIMfNXfOeOPQO3lGT1+sIT8LPAQBx6q
 CYcn3ZJeu15L35SO1MJvOXIe9+opR5Tg7FK7IH6PEAbz6mdS2L5TENw5HOrjcRDTYVL2
 a1dxj0h0QyEa4lcdnw0e61600WStXJD00EwLIHZHNnnL/67y+TTND4BrQw4cZkOF+zm5
 OqBFI5418s2oW1I3kVBf30czzDPDQoiFXDcMETvfdaaIvdMU0Xq3Hi53xogWlNhhDdnu
 hNBg==
X-Gm-Message-State: AOAM531VDxkEvqj11tqnNU4SIO00ASDeWowq0Gg50Mu0h/XcftGs5UIF
 sMaRXayskIUfCFvy00rr5SX//ZVrAr4=
X-Google-Smtp-Source: ABdhPJzrjcuPx5Q2AKoilaDiXnxttZJtuT4HJnzL7XEFjmRC4F4MPd+zpZEaXKwetDdNjGsx3OEjkw==
X-Received: by 2002:a1c:790d:: with SMTP id l13mr13225001wme.101.1635951895588; 
 Wed, 03 Nov 2021 08:04:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/27] configure: remove useless NPTL probe
Date: Wed,  3 Nov 2021 16:04:25 +0100
Message-Id: <20211103150442.387121-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a linuxthreads system with a recent QEMU will have bigger problems
than just not having NPTL.  Remove the unnecessary check.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



