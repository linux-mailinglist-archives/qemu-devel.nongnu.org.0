Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E76CAA84
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 18:25:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgpeQ-0003ty-2h; Mon, 27 Mar 2023 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgpeN-0003tg-93
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:24:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pgpeK-0002jf-NP
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 12:24:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id l27so9421957wrb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679934287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+WTJHwJEid8pCJpVjxqSEGg9967iqK/eIFWgdQyH0NU=;
 b=dbh/G2wv349+jGRdva5YFhWDgk6AKiwDSO1MuDXBWF+4c0u9GEJAUq9AJeVzVx3aZN
 Jhj5o5ASuHj5BAXSoh9gCghyr87Vno/HWBGO75U4+dpSP4dgq0AATO4MZPF/dcsCTw26
 Ya4f0cG3jDOCbl9PjfhI8ajViFx5vBFdXVgb1fxPsU4ZNohaZBOYguQRv+oGDicNW8/8
 cMnuumDNzQYkB2yrefmFu3Ls3VRKOcYGYADdMSKV0nh0Tr7nLynh7IKo8NC5CcWXhyZM
 Hq5lNzQLRKICRsZpLNjd3llpPhxkvJQ/nP8CxXnfRHkvagXTEsQd+1EfFvutdkD1nDEY
 lZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679934287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WTJHwJEid8pCJpVjxqSEGg9967iqK/eIFWgdQyH0NU=;
 b=f7qMUfDOIgbBX/hHiTwPabp4BTnVGH+8sgc+IoKigmiNevWJ+/dBLERIgU422sM4vI
 TQjTC452R2ZlLk5fM/l9jjd4JAejjwh3kJCvOPdvSApDUby168TYr5JGfeEio56e9oDk
 c6WHn9wDkqpkS0NFQkARUelqambtDuiQ7T5Tr/AN92y4ysLC71+YJgjo1f9IRgGoZOFo
 vfNnSsU26E+4wfdiEgr43dQMBWXpv+pPfq6yD/RDxKOdscP2LyMhoVwHBWCWhYWTgdRB
 mzWr7uJASYuBmnbUug7TbrOaT+wp9kt3U1JYI4X09gMFfqSLPPGxLiVxMKjhxv1VlG/4
 Ia5Q==
X-Gm-Message-State: AAQBX9dtZy/Uex5S5LXY0QQrqVjr+5HbUOxNnrLhddZCQSwAnNJyDjiA
 woVZfcdz0VlGPjS03AodR/GvKMv5wodXdF+YpSc=
X-Google-Smtp-Source: AKy350amhzkI4gzBV5XqU7ABM943wM5GcnEwtrQ1QhVqoS/5ORwmlCf7ZpBQcK4FgRQeFw3Hp3F2Wg==
X-Received: by 2002:a5d:6082:0:b0:2cf:e70a:ad9e with SMTP id
 w2-20020a5d6082000000b002cfe70aad9emr9010655wrt.46.1679934286932; 
 Mon, 27 Mar 2023 09:24:46 -0700 (PDT)
Received: from localhost.localdomain
 (4be54-h02-176-184-9-157.dsl.sta.abo.bbox.fr. [176.184.9.157])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6082000000b002c6d0462163sm25352020wrt.100.2023.03.27.09.24.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Mar 2023 09:24:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: YunQiang Su <yunqiang.su@cipunited.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jue Wang <jue.wang@oss.cipunited.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] linux-user/mips: Use P5600 as default CPU to run
 NaN2008 ELF binaries
Date: Mon, 27 Mar 2023 18:24:44 +0200
Message-Id: <20230327162444.388-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Per the release 6.06 revision history:

 5.03 August 21, 2013

 • ABS2008 and NAN2008 fields of Table 5.7 “FCSR RegisterField
   Descriptions” were optional in release 3 and could be R/W,
   but as of release 5 are required, read-only, and preset by
   hardware.

The P5600 core implements the release 5, and has the ABS2008
and NAN2008 bits set in CP1_fcr31. Therefore it is able to run
ELF binaries compiled with EF_MIPS_NAN2008, such the CIP United
Debian NaN2008 distribution:
http://repo.oss.cipunited.com/mipsel-nan2008/README.txt

In order to run such compiled binaries, select by default the
P5600 core when the ELF 'MIPS_NAN2008' flag is set.

Reported-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/mips/target_elf.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/mips/target_elf.h b/linux-user/mips/target_elf.h
index a98c9bd6ad..b965e86b2b 100644
--- a/linux-user/mips/target_elf.h
+++ b/linux-user/mips/target_elf.h
@@ -15,6 +15,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
     if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
         return "R5900";
     }
+    if (eflags & EF_MIPS_NAN2008) {
+        return "P5600";
+    }
     return "24Kf";
 }
 #endif
-- 
2.38.1


