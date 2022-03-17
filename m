Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5814DBEDF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:02:10 +0100 (CET)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjD7-0000eI-HP
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:02:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiON-0005tn-12
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:43 -0400
Received: from [2607:f8b0:4864:20::62c] (port=45604
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO8-0002g2-Ob
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q13so3536739plk.12
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rlZYzlv15UW77j9fostPaSd5V7tg5ruWK95qVptaMo=;
 b=dsN2bSRz9sIrDJ2swMHz+WWKNLlfNQ5C+BIL0G1NLRVvuyIHKvLT6ug0+5MvJWp6iJ
 WsOxbb6NCPyK2nEd2BAXuv1HgfF6XnT7Sj0NBeQwuqUXVbLtfL4Bix/CzWx1HpLBmoIK
 VMBfxr9PPp4rOX1SwdjdvwSwroMVqDi7Mr7tJ8dMybHi0G/+3hg7HpF9kVDGOonNa5Jn
 Yn3bfyOKl/9u9sr+xRgnXoG3EBKBNihWc1F2vI+UjybU34Fesj9mK1HqulgIM1TDjvkv
 R9OqOPOO94ZzjWHCXoDm+i/wWZeetyh6U1uHrXXJwPDOqZ0IvTZ9UhlXqGm+dDgn96Ds
 dIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rlZYzlv15UW77j9fostPaSd5V7tg5ruWK95qVptaMo=;
 b=sbNVNmpbukva1vYsR/IVdc+ykzd4D20EkkWEF656Nt3s3YhDSdz7tDXBwwUTL3W2+5
 JXJ4GXE+MQyV722Dr5OP0/j2AM4OWCXlDNORuuYGItLoRx7YCYG9sVvz7a3tCqYBpUlv
 FC+e7W9QCRO/tnkmxzdeI4HKs6kU5dbZnIqj1RexJjyOQ6aLsFCatfMioJK46q8R7KBv
 G98vYA3DCEDMpEf1pGAMapYXc+TXcb+qNmlYP5tr7ANrEFyg8+5Dezkh0P6p6ALuX0Y5
 a45U3gHEB37pJMxz4J3Km2pfs5pB+5qpRECXieyYIMIBdOYVMPRV9K44J2odFh2m2KKf
 Ogeg==
X-Gm-Message-State: AOAM532886YAppopSjwFp09XiK2r0kLxgKDMPo1B3eI19NB9joSIrVq+
 kW+U69jSXvgIcpdmg0FsodTgBUayle35Kg==
X-Google-Smtp-Source: ABdhPJzHc7kA17PycUoGiui4H6/8R2UwI1qPcGNjCWU77VCyLivL5UhdoEmnXkPaQwrZw0k6P9gfwA==
X-Received: by 2002:a17:90b:3881:b0:1bf:86ea:a5e5 with SMTP id
 mu1-20020a17090b388100b001bf86eaa5e5mr3332341pjb.11.1647493767290; 
 Wed, 16 Mar 2022 22:09:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 49/51] tests/tcg: Expose AR to test build
 environment if needed
Date: Wed, 16 Mar 2022 22:05:36 -0700
Message-Id: <20220317050538.924111-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The runtime we build for Nios2 requires building a static archive,
so supply the ar tool for that case.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.qemu |  7 +++++++
 tests/tcg/configure.sh  | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index 84c8543878..00b043c702 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -24,6 +24,7 @@ quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 CROSS_CC_GUEST:=
 CROSS_AS_GUEST:=
 CROSS_LD_GUEST:=
+CROSS_AR_GUEST:=
 DOCKER_IMAGE:=
 
 -include tests/tcg/config-$(TARGET).mak
@@ -46,6 +47,7 @@ cross-build-guest-tests:
 	    $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC="$(CROSS_CC_GUEST)" \
 			$(if $(CROSS_AS_GUEST),AS="$(CROSS_AS_GUEST)") \
 			$(if $(CROSS_LD_GUEST),LD="$(CROSS_LD_GUEST)") \
+			$(if $(CROSS_AR_GUEST),AR="$(CROSS_AR_GUEST)") \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=$(CROSS_CC_GUEST_STATIC) \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
@@ -73,6 +75,10 @@ DOCKER_LD_CMD=$(if $(DOCKER_CROSS_LD_GUEST),"$(DOCKER_SCRIPT) cc \
 		-i qemu/$(DOCKER_IMAGE) \
 		-s $(SRC_PATH) -- ")
 
+DOCKER_AR_CMD=$(if $(DOCKER_CROSS_AR_GUEST),"$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_AR_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- ")
 
 .PHONY: docker-build-guest-tests
 docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
@@ -81,6 +87,7 @@ docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
 	   $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC=$(DOCKER_COMPILE_CMD) \
 			$(if $(DOCKER_AS_CMD),AS=$(DOCKER_AS_CMD)) \
 			$(if $(DOCKER_LD_CMD),LD=$(DOCKER_LD_CMD)) \
+			$(if $(DOCKER_AR_CMD),AR=$(DOCKER_AR_CMD)) \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=y \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed4b5ccb1f..0b829f4f05 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -80,6 +80,9 @@ fi
 : ${cross_as_tricore="tricore-as"}
 : ${cross_ld_tricore="tricore-ld"}
 
+# nios2 is special as it requires ar
+: ${cross_ar_nios2="nios2-linux-gnu-ar"}
+
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -89,6 +92,7 @@ for target in $target_list; do
   container_cross_cc=
   container_cross_as=
   container_cross_ld=
+  container_cross_ar=
 
   # suppress clang
   supress_clang=
@@ -166,6 +170,7 @@ for target in $target_list; do
       container_hosts=x86_64
       container_image=debian-nios2-cross
       container_cross_cc=nios2-linux-gnu-gcc
+      container_cross_ar=nios2-linux-gnu-ar
       ;;
     ppc-*)
       container_hosts=x86_64
@@ -285,6 +290,11 @@ for target in $target_list; do
                   ;;
           esac
       fi
+
+      eval "target_ar=\"\${cross_ar_$arch}\""
+      if has $target_ar; then
+          echo "CROSS_AR_GUEST=$target_ar" >> $config_target_mak
+      fi
   fi
 
   if test $got_cross_cc = yes; then
@@ -344,6 +354,10 @@ for target in $target_list; do
                   echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
                       $config_target_mak
               fi
+              if test -n "$container_cross_ar"; then
+                  echo "DOCKER_CROSS_AR_GUEST=$container_cross_ar" >> \
+                      $config_target_mak
+              fi
           fi
       done
   fi
-- 
2.25.1


