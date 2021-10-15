Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69442E809
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:46:41 +0200 (CEST)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF7A-0006Jt-Oj
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcC-0006rR-VQ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcB-0002ti-GB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id 187so7279059pfc.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=caXEo8XfcVNqQC/PP328NXImnbbtyaPSavWBwvAB8S1sFXsgzGxEDM0d/OTLxO8T3G
 j5JkZd52oY+nRfjZbQ53ifiztefYGieujZI03+qLI1jEEtFK0KyTDNkYRHMo4enAd5ym
 /TZBt9pGxA4jjN5A9PttOczJhsWgvXEcH4Tb8FyhxMqvXhj/XcBi7HQJceD1j7mB76cZ
 AWF8/hvn9spNNvAr19X2HA8clizEy+gJhjnq/6Ux7ZahOxG4k1YgAWTYkxRVpHnylCIF
 ZsVM7lC3olLeQ8FtjOJohuM6AcCAt8/4U6KpU3ymYLG3tSe9MM7XIsqH1X99ntyKNXlW
 ZvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=idiLh04DVC1IXavqpuKOqnwuOXsypp3zuVHdr6oq5zUtDgrPEzVuMXW4vLng8plhhZ
 kms6CW/pcxRpRF22WvXLy6DWrvP3Hm28Gf0KPacGOlLkUh+cfWFDooGqs1g0o+cLbPpb
 0SfjTwut1jBGCyTtWMjr7oQGMZU9hLeoSgsaVekaUvwbXNa6ooc3lohzTHehfYdGSnlq
 2CfORpxNyG+O+9rC4UmfPb5txeXAgRHUeE8r3JHVHO+wZ9/TlSIQcLJ3dAfElg0knvw0
 S3jCTk8U1OWWGydsWFxjDkcE/q8Y9abDPBNmVifM85eWStagp0EXRKOaH6ncecn9SEqg
 FNgg==
X-Gm-Message-State: AOAM533x+LBZq4b20QGz1fp1XibpmXiBUhsaqi61e822Jrp46Jg1+YXN
 nwjOL6zXJXlUQRPjuBzymPhGWcD9ZOJK4g==
X-Google-Smtp-Source: ABdhPJyu8mHwae1Kf2Cd51kyKDr2xVwkAVltFhogh2lRvMBeL1Wiusj+hZhdAwpC522zcutYdYZt5g==
X-Received: by 2002:a63:7450:: with SMTP id e16mr3562995pgn.482.1634271277964; 
 Thu, 14 Oct 2021 21:14:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 54/67] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Thu, 14 Oct 2021 21:10:40 -0700
Message-Id: <20211015041053.2769193-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..d6d70c339f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


