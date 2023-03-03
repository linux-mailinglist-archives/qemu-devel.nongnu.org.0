Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159A96A92CB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zB-000836-EV; Fri, 03 Mar 2023 03:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z9-00080K-Cg
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:51 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z7-0007wn-Sg
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:51 -0500
Received: by mail-pj1-x102a.google.com with SMTP id bo22so1784953pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832908;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23+QsQv5VG4gpEQ2Er0+nLjEcRytljERqxt4Mubuags=;
 b=NaHdoBQCeDIKpyy42smmupeSjMD9nj3uzxkI04k2mRsxq+ekuWKgz9y2yhppmH+6HQ
 geKwetk1C1kDhfoHvdYRz6C7ogkU8RkruTAsII8hp6osf5WpLov1SaCgRUzyVMMgWabQ
 xNTDuTneSHOPL4YO1tkEtjkJ8EqLkHAFJ+HMgeVc0b25pb3h1NG7BzN+sLDmvOXcVVI0
 nUtgEsiX9Nng+UQZ4CO4B1eW4iHkXkyAQF4x3AuYadhMYkfvJGeMCVVpucuaIZEdAny/
 n/oJCCk/6Dy/wOelUqsMsDLb3qMEwEcZaTlT/z4snLYC4QRoeIoTM0UUKdqgIN5e8frx
 C0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832908;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23+QsQv5VG4gpEQ2Er0+nLjEcRytljERqxt4Mubuags=;
 b=OELRUh6VsRweqgctyfxho/0PnsfOCHvEFL4Qcyo9GpJcBs2TFeQFgBvnaq54TWh/lK
 P9dOXYr86CMDtE2HL08ErXukHdwN8AzoX5QtPvIV4mC/fsTpj9/JuwsgRlSvWZXWk3CG
 DNj0ATtTr+2zxBzI67jWDrENoGfnLSMCf8PRre8rht6JjQ9jMVzUufexlzDSCHh14xy+
 +k31Ec8yfYhD0l7T9cjAMQ2T4mLgBS4pWgSbEuoQ2tKjLfpNLa3byUsldLTdRg9dO+0L
 1dTXxKUwDmS0cpUgcE6eV0eNISH0HLIy6dVtHYeOY5KbWeII17DeS4DLo4Y/GZMqKETU
 yjBg==
X-Gm-Message-State: AO0yUKVsKP9Cp6+qDpDJepxR3GdAgqSWgL5ohCdRVH5134y5Gp4Yfn0i
 y8w/DvlndnnrSQJCTWrUEFPh8g==
X-Google-Smtp-Source: AK7set+lnc02RtELGKYYyvLZyyFybOd7+lDAm4ufW6idrl7dpNy/Zj4QFJM7DmaPDTtAvI/Z7EUrow==
X-Received: by 2002:a17:90b:4c42:b0:22c:d44:5669 with SMTP id
 np2-20020a17090b4c4200b0022c0d445669mr847264pjb.22.1677832908342; 
 Fri, 03 Mar 2023 00:41:48 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kj16-20020a17090306d000b0019a97f180fcsm982463plb.37.2023.03.03.00.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:47 -0800 (PST)
Subject: [PULL 22/59] target/riscv: Fix check for vector load/store
 instructions when EEW=64
Date: Fri,  3 Mar 2023 00:37:03 -0800
Message-Id: <20230303083740.12817-23-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

The V extension supports all vector load and store instructions except
the V extension does not support EEW=64 for index values when XLEN=32.
(Section 18.3)

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-13-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9b2c5c9ac0..5dbdce073b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -287,13 +287,12 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
                require_nf(vd, nf, s->lmul);
 
     /*
-     * All Zve* extensions support all vector load and store instructions,
-     * except Zve64* extensions do not support EEW=64 for index values
-     * when XLEN=32. (Section 18.2)
+     * V extension supports all vector load and store instructions,
+     * except V extension does not support EEW=64 for index values
+     * when XLEN=32. (Section 18.3)
      */
     if (get_xl(s) == MXL_RV32) {
-        ret &= (!has_ext(s, RVV) &&
-                s->cfg_ptr->ext_zve64f ? eew != MO_64 : true);
+        ret &= (eew != MO_64);
     }
 
     return ret;
-- 
2.39.2


