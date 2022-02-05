Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BB4AA53C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:05:03 +0100 (CET)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG9Ve-000479-Nx
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG99d-0003jg-RI
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:42:18 -0500
Received: from [2607:f8b0:4864:20::c29] (port=35415
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG99b-0002ay-Iw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:42:17 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so6562606ook.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 16:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsyBGPmuEohYbzq2IKhS66MWC7voJesO8CpZ+xmmjNo=;
 b=zVAjAQHst1BGU71oepXbw6FVZop0G9xa8YQhPjC53ykHVyTiWXM52EJvAhv2V18e0Q
 nccA74RuNoNIByu0NhhQJxZdnAzL2bqKET6/pNWDZ7A1Plf9jpC+ZZ0w1NCKMe0Yw+mi
 cwpp7cfrmQtlgb76Jy2+U0fOhOr3PFcxNT986+7Z9H/KLSs/bBnQ/fkd+DBP90MRGhuE
 dBhzWw48o03umfGIaZZ2/ubcDP1vCq0f4yuSNNQaLwW4SXNjiI6BuOFbliJXInkcKWJO
 aW4GUYFolVr4bQ5LSTZv/kLlhnSLINQjfxNOQB7KWHqYd3rQe/LgpCvvCC0L2Xpzp9va
 eT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsyBGPmuEohYbzq2IKhS66MWC7voJesO8CpZ+xmmjNo=;
 b=UvPyUBS0dbahB3tMmpexqs5glUHS3dOE4bdWHgGH7hyfYHsDm1DBwNTXCTtgEJbh+N
 FZzq592sG7t3cN+7YsUaV67um78+f3qCX9FxlPN9Zjdv7ci8MRQB5qimr0bRJGOnnwTz
 9d0hwjx7O8bwgESdKxlzlIcDoJ/FbGb+uVtOFSPaVoOXVViSPQWhbCfvkQlyJTUdc180
 QJkTJVM6gSSKsaBwXCMp/mbxtr9MQRS92o9GqLfS/PB5XF7OWRep1rKgpEojPV2xmcSO
 qt881SP5yaCojJUT/jKMC8uuhdZueqy/G45G6IvyOUARxTjonfkuMTC0jy/LupmwJbTm
 jONA==
X-Gm-Message-State: AOAM532XodhBH98ilb75DzO+fiuNsUi1mpXcRrCRU0/jNTAhoiSNWN38
 GaueVY8B6M/bU9vRDW76cAI7VSOkMyxJxVOH
X-Google-Smtp-Source: ABdhPJxQ18bbY9jGoPeKBrxA1UJuaENzmcRqZmfpXEjFDEQC7q1J2W5xzzywfSCYGqrm4U0Lbo8y7g==
X-Received: by 2002:a05:6870:91c4:: with SMTP id
 c4mr381731oaf.240.1644021413015; 
 Fri, 04 Feb 2022 16:36:53 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] target/riscv: Define simpler privileged spec version
 numbering
Date: Fri,  4 Feb 2022 16:36:00 -0800
Message-Id: <20220205003605.1150143-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205003605.1150143-1-atishp@rivosinc.com>
References: <20220205003605.1150143-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9d24d678e98a..e5ff4c134c86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
 
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_1_11_0,
+};
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


