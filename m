Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B248F41F168
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:43:30 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKh7-0003rm-Pz
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKY4-0006pE-J9
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:08 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:43831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXw-0007mW-K8
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:08 -0400
Received: by mail-qk1-x72f.google.com with SMTP id 138so9479688qko.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ty9oWbKVOJOBomZhBTDMFXJ5kVE2f+VzbHAS7qTOPJk=;
 b=tVpl60him62RPDaU2zi63+ORUV+IjjTy9W5qc37q7vK7jH8NuwiVhYX0QWp6HyuVJm
 6iph14sfd9e9iFvCl07TUGislyUAuFijWPMoi68/OK2Cj9x4o8tJXk6jcl16bkHyYMwo
 UDyNjgTo6jn0aaiXc+SPWuRUnwY3YMCTfL9JmVfaSBjAuTiWy+FUblOzGu6uZvwMmIEL
 v0YoJrQEePhOvDFiqr+EbQxw6QaWBK3dHWntTOIBkwPaayZoG15ttb5kq7liYTsU2zUC
 3QVRe4L9WMBus9pO8XThpDO9OaVF6pUc0r+31E5bKeJda5/l5N/x57u4H19LESkhgfPr
 Np1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ty9oWbKVOJOBomZhBTDMFXJ5kVE2f+VzbHAS7qTOPJk=;
 b=IqRFGKhuyEyN1ybM4PJklmoVUkpf3u+sXGs99756brSvVgR3Sw3b8i+ch4BHynrX9x
 FvCm8ZRsiO1oIMJtsEUpidfJ3eDGLDD37f6kNkHV7B+WJEK/kF9iCWqKnBeJ1sAF0GnC
 Lz6CdxyKlCXqOd74FY6EaVfAdMf7qM2zXb8hEcRqJbps58Vc0ZBNzgTr+DQx9ZWqIGH/
 Ylit5yyy5+xBqXKuK0EDbvD75mdafr/rNdo0xiX0spcebNJLp3v3R71TcgNfqsaB7iXJ
 1ePWYnsXRaHCtqBeujEMIRBo4WZivGiSKwj4FLm+wpKFIRbH42Sn4wzUMXspruwPJhi6
 o5iw==
X-Gm-Message-State: AOAM533sVbXnV2C+LEIK5nNaUrwVH4zJlLV0Jx5wgqOugDg5tX3U2ycQ
 pCjX2Rf6QRxP2sqlFHCLKIIe7y0AdmjyQQ==
X-Google-Smtp-Source: ABdhPJyagLvSLGGnkXjGZhWKPFRjU6Oq0V8FjrAixn1+wtB1ryaoFmIQzP3b8h+IoG6XzW12sy/Hcw==
X-Received: by 2002:a37:6350:: with SMTP id x77mr10162330qkb.356.1633102439674; 
 Fri, 01 Oct 2021 08:33:59 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] tests/tcg: Enable container_cross_cc for nios2
Date: Fri,  1 Oct 2021 11:33:47 -0400
Message-Id: <20211001153347.1736014-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/configure.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0..62ca1e2cae 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -59,6 +59,7 @@ fi
 : $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
 : $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
 : $(cross_cc_mips="mips-linux-gnu-gcc")
+: $(cross_cc_nios2="nios2-linux-gnu-gcc")
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
@@ -153,6 +154,11 @@ for target in $target_list; do
       container_image=debian-mips-cross
       container_cross_cc=mips-linux-gnu-gcc
       ;;
+    nios2-*)
+      container_hosts=x86_64
+      container_image=debian-nios2-cross
+      container_cross_cc=nios2-linux-gnu-gcc
+      ;;
     ppc-*|ppc64abi32-*)
       container_hosts=x86_64
       container_image=debian-powerpc-test-cross
-- 
2.25.1


