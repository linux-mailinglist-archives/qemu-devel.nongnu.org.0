Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBD5365EE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:24:53 +0200 (CEST)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuclg-0004Xc-KE
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucI3-0004sN-8c
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucHo-0005ii-P2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id bg25so2865320wmb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmtlpNoCXuBTeKkixtH0g1IEh3T3xvBlICWh/r11jKc=;
 b=qTRDV/8rSM7MTli8sYleKkqUWWasvbglF294hq1Woyf4nDOagKHFVaj+bR/W4C4vfq
 8qjXhh6Vus6u0FBJwLO/wxDsUfX6i6IVGS4ftbUyBkWUpJX6kpWHXt/PEKviI7TFLQC/
 j1StDFEsdPywV3iD2czcCGYMKb26UHrIPRUd4yeX8aTDLLgChTMz1Ys1ByTpVqHmq6EK
 VRJArKJTF4PYVYgQQUkEsPZjerr32N+OVxL2sUXn1KqrPpExkJmWHsJ4Qo1YIx0Hq2ZY
 eazY8hpPFst7lPMWYZnluXNR+EuMlk8mxRGDR2RxOL9mOBKkuQc+Rkzzu3lj0ABSrUff
 Z8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmtlpNoCXuBTeKkixtH0g1IEh3T3xvBlICWh/r11jKc=;
 b=Tlz67zIkFvntogxxDBW4iAufup4gBalIZhaCsQU3PjVx45a3M9yK69mWH8/z4Dt/sK
 2s5ZV/scV9DSlt1+x+REighDLuUM538GiCATnc6xEF48P/kAodD8WseOSv1xnsw0QAlr
 BMfr33naH0X1kWIzF0SHmp9gM4prAfj/j9ElFvhiDSx/VNJq2gNGM/fwFZFQnyzyCYpx
 GQPeMc08LNSXptR+O7P+zy9/A+sSBBW/3UYyU9PgBcC4PE1Rh9ehlbS5+cri30QzQYUi
 h9cppM1nFPE2BbRHGpDDKyPzuwYIEt9HHmnr4k0BBPjZbRywVmuA8Alj6YVJ9plav7wz
 fUTw==
X-Gm-Message-State: AOAM531y5XFNSCmwiqNwvu1WjIdz0eW6e43akyEnZ89gxesWYNdDoytH
 5HcRWeqLzwq69Tdw+HLn+6NvAZI8vNh9tA==
X-Google-Smtp-Source: ABdhPJwcuYO++Zh5jS38eKUP85irpTFWl1MzPOxC6RKdqGrVFvgTIwIVO5lU2yJ59r5DiXM0phWlsg==
X-Received: by 2002:a7b:c0c6:0:b0:397:6181:f08a with SMTP id
 s6-20020a7bc0c6000000b003976181f08amr7550902wmh.75.1653666839469; 
 Fri, 27 May 2022 08:53:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b0039787538c9csm2711558wmj.20.2022.05.27.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:53:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C66F1FFCB;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 19/33] configure: add missing cross compiler fallbacks
Date: Fri, 27 May 2022 16:35:49 +0100
Message-Id: <20220527153603.887929-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The arm compiler can be used for armeb, and the sparc64 compiler
can be used for sparc.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-9-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index bb05e70bcc..31c1ab2579 100755
--- a/configure
+++ b/configure
@@ -1822,6 +1822,7 @@ fi
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
 : ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
+: ${cross_cc_armeb="$cross_cc_arm"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
@@ -1844,9 +1845,10 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
+: ${cross_cc_sparc="$cross_cc_sparc64"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
-- 
2.30.2


