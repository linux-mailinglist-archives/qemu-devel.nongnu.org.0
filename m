Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FF36F3CB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:41:10 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI9V-0005a3-Jg
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHld-0003WI-BM
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlF-0007fF-6m
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so866302pjz.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDPAFOrvmgC88VNXvSpZ5tv8Dk8WkejS3jZX6LUfMs8=;
 b=exnBhI0jueUZ1eqVm0yxwzoCIOMV6jrzuxixHkluaKXf6hKogJPTUbfDdrD6Cys4lj
 nal9pjlkJcI6HlIJdSpvd76AktFW3jZiNMocCYPCOXk54bcdtte0gH1dVuPGB0UrihdC
 nm6I7/zUDvd2Brg/9uL7Z07JMbhzMIoWQbj+H7qvGaQVJH56d2SQEH/dtFYaxaCd4kzI
 fpYJW0bPg8h226Y44UsNCH6XMrYmRLVovaLRyNI8X6HSCXh79ptVjPYXRCHrTbbRSYE9
 ghlHYG9eI0GJYDaK94cERg01JP/HFS5waB46SgvpfGrSPlbKZwTDeMtB69XzrJE0QBXU
 hZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDPAFOrvmgC88VNXvSpZ5tv8Dk8WkejS3jZX6LUfMs8=;
 b=H/DyCJSh+hO67SEVgUkgPKSCEn5RWEiZYU7TIw82E1sN2Ns8oYZMqzpvjUv6fOFyq8
 gjixHqkvIw1D1O4c71+DmHI82NDUndv+iqp3S/hzHcCt5vJOSHnHtvlY/nF2rWNf5LN1
 oxA/KMgXtPtir3MeMhIsw/AgCMuJHGBrLXBg26/bkBKdYWZdrdQfXuxS1iOjSwU1x1jx
 7kZlEpaDFEVN2Gz07Ei+tGRVS9L5qPRbBolABCLdp0MHG5/ECesZzfi8UV15LRBUe+2F
 OS+AIMj7n5Ggl0ndX/rEmnJjogi3aUq3y/Uawo5Qkjog/rnXeoiog55KIrf1YnMjRJAw
 Wj+w==
X-Gm-Message-State: AOAM5331iBFSzMMrivx2JeiHRD0HablwDc+iGP1ipjEnApHm/W53TPxB
 jKOuy5L+wQQTXkvx79KTVQjGeHtuFW2+RA==
X-Google-Smtp-Source: ABdhPJwnxjDSiUIDYHPUk1USROU9jDLn020jtixTMs/yy9NVeWvryXLDP0ToCqS1Ne7/tKflrSlrWw==
X-Received: by 2002:a17:902:44:b029:ee:9107:4242 with SMTP id
 62-20020a1709020044b02900ee91074242mr2715882pla.18.1619745363860; 
 Thu, 29 Apr 2021 18:16:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/30] target/ppc: Implement prefixed integer load
 instructions
Date: Thu, 29 Apr 2021 18:15:41 -0700
Message-Id: <20210430011543.1017113-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn64.decode | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 5a82ce375e..4198e5c8f3 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -29,6 +29,21 @@
                 ...... rt:5 ra:5 ................       \
                 &PLS_D si=%pls_si
 
+### Fixed-Point Load Instructions
+
+LBZ             000001 10 0--.-- .................. \
+                100010 ..... ..... ................     @PLS_D
+LHZ             000001 10 0--.-- .................. \
+                101000 ..... ..... ................     @PLS_D
+LHA             000001 10 0--.-- .................. \
+                101010 ..... ..... ................     @PLS_D
+LWZ             000001 10 0--.-- .................. \
+                100000 ..... ..... ................     @PLS_D
+LWA             000001 00 0--.-- .................. \
+                101001 ..... ..... ................     @PLS_D
+LD              000001 00 0--.-- .................. \
+                111001 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            000001 10 0--.-- ..................     \
-- 
2.25.1


