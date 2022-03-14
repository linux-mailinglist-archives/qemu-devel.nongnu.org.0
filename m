Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C04D8AC5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:27:09 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToTM-00013s-LC
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:27:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nToRY-000806-OK; Mon, 14 Mar 2022 13:25:16 -0400
Received: from [2607:f8b0:4864:20::102c] (port=41639
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nToRX-0006Fe-As; Mon, 14 Mar 2022 13:25:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso15354760pjb.0; 
 Mon, 14 Mar 2022 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D83VIlTOxi5abuZgEdwdNy5wzw/pQHiPDI6dLU/Nx78=;
 b=B2OtlIdotELUu8uFNtvqAD0mf4LAYNyYbQL94pQgcGOoqP8dC/wvJgy/uk5GTA5skg
 ovwMNzOjMujjby1x7MVRggP/xsQI+iLhTQEckUwb1Q3tX2zArnlidi9SHVHA7hXKAYEp
 T93WTOgFGe7oXua3M6ucu9pdY79+hGa+2XALs4c6aZvwZZiIcAT2rRruRFNS4ZQW9fl3
 jGaQLMJ90LDAkRfR7+7NN/zmUQrWjYBH/XgjEB8magHd0fZjN6QDaxp6qlj/IDE1RWEw
 TS/FKgv22OSm5DTGBwe6I7u42KpdgBLR5/mKgDoU0altMzlJH6A2n65HVXZIBPDroQrm
 y1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D83VIlTOxi5abuZgEdwdNy5wzw/pQHiPDI6dLU/Nx78=;
 b=YtZgaUtXCN2tqFDzbju4G42hMqMDA243cIL9V3XCoKVM6cSyM2z2bfL93Bi7AhB1DA
 GHa+b+ddm5NDx+QlaTzxdx0cBkB4ft0vLTzkJbnu0NT7tcknVwroI4ajOyh4VtsFCoV6
 /DDAvAyxB8jOyB76LJaTemn1cdRIkYZ5Er8WptX1mMAdqSBOXW+Y1JGCOSJy+HYpK9+o
 c9HsEx/V4F5nHcjPn7VYlZREexvgXSbpp/oRi84LWmfbpgK45UHETChCaQ8h66afr321
 Snn0mN9ApHW3Gr5zGAaAj86svAPlJbTvFazpmRlQv0uH+CUvAGA0xOax6BtiiMyH+vhw
 qO1g==
X-Gm-Message-State: AOAM533LxPdMsVYMociYs+J4xLli1inO1dobK1raoonV4KTJtnOM3AF4
 384Day5wBsQ3LPAYkLg+Quuvz9HXWFU2Fw==
X-Google-Smtp-Source: ABdhPJyvb5hkcHPfqIrskL+Xf6E1rcyLd4KN6/ZzF2yTunH+ilvwzMJqJ3xb0fchwgYn8BX9wa4GMA==
X-Received: by 2002:a17:90b:3ec8:b0:1c5:68d3:1883 with SMTP id
 rm8-20020a17090b3ec800b001c568d31883mr267458pjb.201.1647278713270; 
 Mon, 14 Mar 2022 10:25:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056a00114700b004f7be3231d6sm6392701pfm.7.2022.03.14.10.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:25:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ppc: Include asm/ptrace.h for pt_regs struct definition
Date: Mon, 14 Mar 2022 10:25:08 -0700
Message-Id: <20220314172508.816110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=raj.khem@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Khem Raj <raj.khem@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes
../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
    return uc->uc_mcontext.regs->nip;
           ~~~~~~~~~~~~~~~~~~~~^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
v2: Drop ifdef __powerpc__

 linux-user/include/host/ppc/host-signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/include/host/ppc/host-signal.h b/linux-user/include/host/ppc/host-signal.h
index b80384d135..ec6166ed66 100644
--- a/linux-user/include/host/ppc/host-signal.h
+++ b/linux-user/include/host/ppc/host-signal.h
@@ -11,6 +11,9 @@
 #ifndef PPC_HOST_SIGNAL_H
 #define PPC_HOST_SIGNAL_H
 
+/* needed for pt_regs */
+#include <asm/ptrace.h>
+
 /* The third argument to a SA_SIGINFO handler is ucontext_t. */
 typedef ucontext_t host_sigcontext;
 
-- 
2.35.1


