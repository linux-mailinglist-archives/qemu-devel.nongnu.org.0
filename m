Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1646F47F9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:09:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYz-0002qq-T3; Tue, 02 May 2023 12:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYp-0002mM-9z
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0000lL-J0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so1630293f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043738; x=1685635738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CuEFSNGMh/WzbQQ92fOBrKgMOL6IF2RkfhGTw2qebH8=;
 b=knyJDa8aknyY6eIgnOhlh1hDu4eGpaPHFp0Mes8WyV+6/l5UnHAUgUAPcU6lvqEQ7G
 UMRJ2aIPcgSGREVdSkJ+oXIHI5Do9uvtyW3dyk+tcju58zEQGvxVkjpD5aJ534/Vm/y0
 kpGdExMn4JWF5gTmURtOgJo+YNEWtMhEVEEQ1FmMXvqNBxI4OIkmHBhOFYg6wBVMI7Oc
 54geW9Y4slNODkYYQuVD86pfL92rBw7ea/cH6Ea275kcVP4cwB9vqFkL0IHNuhiNSrQA
 pIiVzxSYstffugAzgaFSbG6+vIZyKkl8DzIQhc5mq/Yq3OZVo9C/sdogSYKIL9ztRhTw
 5sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043738; x=1685635738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CuEFSNGMh/WzbQQ92fOBrKgMOL6IF2RkfhGTw2qebH8=;
 b=Ld2VpXqyAodD0Y6wYk1pEs6KluD6JI9OhG277kdbSDGkfjDCrmnmFQxBT/v+vtHcxP
 2+xEOWwaPQJDSM60Gl5LwL7DAFeQdfX8oKMl54ImfNfOWaXiUt+6LWfFY4Ggr5wsFciS
 OPxr7r7rlaiTQYraG8yNc13BFXigHqzb2kD4DgXanM6gfgMaXzlwiTQ77ZvZw2XrSxda
 urespLAh7G2reVW+ANmFigZOhu/aDkBVlW0gEimBvsPB+hliFYzjQR22GQUIT4bVtEZ7
 JI9bCS/1rqqIfLjvD+pmDnb9qo+N23IMBbXnfVl+DVHoQUhbpdTmiaIw1K1rfDvpK/Qj
 J3Qw==
X-Gm-Message-State: AC+VfDy0NN55fv3nV9YNRz36X+A9GaYaRXe/2gnFew5MsdWUxumiYLSp
 uSNe/q+CDNn0xcaHSlITPF4I+hr5kiNo6VnwdpG5Yg==
X-Google-Smtp-Source: ACHHUZ6pPAbuB2B2MqI+ZiNbS/rYi7UeM9m4bn4GmehqRnVO8l+NI8lGAGxC4nW3RIssr5SEIV327Q==
X-Received: by 2002:a5d:4a0a:0:b0:301:8551:446f with SMTP id
 m10-20020a5d4a0a000000b003018551446fmr13843225wrq.38.1683043738009; 
 Tue, 02 May 2023 09:08:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 15/16] target/sparc: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:45 +0100
Message-Id: <20230502160846.1289975-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/sparc-linux-user.mak       | 1 -
 configs/targets/sparc-softmmu.mak          | 1 -
 configs/targets/sparc32plus-linux-user.mak | 1 -
 configs/targets/sparc64-linux-user.mak     | 1 -
 configs/targets/sparc64-softmmu.mak        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/configs/targets/sparc-linux-user.mak b/configs/targets/sparc-linux-user.mak
index 00e7bc1f07..abcfb8fc62 100644
--- a/configs/targets/sparc-linux-user.mak
+++ b/configs/targets/sparc-linux-user.mak
@@ -1,5 +1,4 @@
 TARGET_ARCH=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc-softmmu.mak b/configs/targets/sparc-softmmu.mak
index a849190f01..454eb35499 100644
--- a/configs/targets/sparc-softmmu.mak
+++ b/configs/targets/sparc-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc32plus-linux-user.mak b/configs/targets/sparc32plus-linux-user.mak
index a65c0951a1..6cc8fa516b 100644
--- a/configs/targets/sparc32plus-linux-user.mak
+++ b/configs/targets/sparc32plus-linux-user.mak
@@ -4,5 +4,4 @@ TARGET_BASE_ARCH=sparc
 TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-linux-user.mak b/configs/targets/sparc64-linux-user.mak
index 20fcb93fa4..52f05ec000 100644
--- a/configs/targets/sparc64-linux-user.mak
+++ b/configs/targets/sparc64-linux-user.mak
@@ -3,5 +3,4 @@ TARGET_BASE_ARCH=sparc
 TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
index c626ac3eae..d3f8a3b710 100644
--- a/configs/targets/sparc64-softmmu.mak
+++ b/configs/targets/sparc64-softmmu.mak
@@ -1,4 +1,3 @@
 TARGET_ARCH=sparc64
 TARGET_BASE_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
-- 
2.34.1


