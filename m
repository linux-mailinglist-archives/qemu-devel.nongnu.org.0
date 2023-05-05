Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD86F7A51
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:05:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsR-0003Vn-FW; Thu, 04 May 2023 21:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsP-0003IV-JW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsN-00076S-L8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aad5245571so8028165ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248686; x=1685840686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByUOlk1RB4HTBv9euthcrclHSXtsLV8170svpbksmdk=;
 b=Xg84NQPP1qUkTklL10h9QNXHgC2GqrLoIG4IAGhmnd7Ks6b86RlQoM3r7c0gR7mC93
 iSPJ9UBGcTDtykb24389FPBjP0rEGgFfV15YBmEkAKBxIYMx6HnZNMOPFvl83FWdyOFe
 /q6xT8w0DzR4JCOGey9dW3OwISIMkUdRPeQbvYfCXHCN97QJ9et31IEwWsCYDU8rHyBj
 Fpk7o/yRMZ3JYw6XioxpT9Pmn1MhIBG8F4d9xJSe98+5lFviH1ziTY+dUOjAqk35BDbH
 BxJKSgBerNZhDN3Y4kV6f3IbTAWfVUhMNtxgnnRGirjAnfj/wkND1yQEyrGubyxBa6zr
 te9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248686; x=1685840686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ByUOlk1RB4HTBv9euthcrclHSXtsLV8170svpbksmdk=;
 b=JLVZ6X/gzhiL2MVu32VyKsz9XryoJrTA8oRqb6txRGY1wOLfC4oNTVHpd+s3mZMVYV
 ASQridaLVTiWWVbJR8WCP25djanKhasXGRHNep94PZUZOM/1LSpoFdsgfQLsTbEICqYp
 g/qkbp0zYqwufrZGTvtTf6o15N+GM0eD7SdyD8sbuTwQZGL/5J4haBXI/pkYpPJLyJ+K
 TVZQsyF1hoQwNfEgHhdIXX2vtl8Uj3cADs+rZX8oD2tzhePeOqODQqu5XV8PYybViZSM
 sg0VammYGlZd30hDyhWlTXwAqbYk7sRyQIH8Pq2jILY/G4sllhp+u8oAtBeMpy5LKOzU
 j3Zw==
X-Gm-Message-State: AC+VfDx+aCGj64j6C3zle4gIN8GjbfiL7U84i4opxwHgbU9Bt9SseguC
 C6wFeWSUhkL0bY+0ZBx5l9gPYBMohZ0n7w==
X-Google-Smtp-Source: ACHHUZ66L5BFzDRNocpKNqh2Jf/5olN3+9jb6LrXQ9QcwK2LAHPqmFANE24mHXO539MJAR+ByX0A/Q==
X-Received: by 2002:a17:902:c948:b0:1a9:6d25:b2d2 with SMTP id
 i8-20020a170902c94800b001a96d25b2d2mr6195005pla.67.1683248686584; 
 Thu, 04 May 2023 18:04:46 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:46 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 26/89] target/riscv: Fix addr type for get_physical_address
Date: Fri,  5 May 2023 11:01:38 +1000
Message-Id: <20230505010241.21812-27-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Function get_physical_address() translates both virtual address and
guest physical address, and the latter is 34-bits for Sv32x4. So we
should use vaddr type for 'addr' parameter.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230329101928.83856-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9e2be29c45..b0e094a933 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -732,7 +732,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @env: CPURISCVState
  * @physical: This will be set to the calculated physical address
  * @prot: The returned protection attributes
- * @addr: The virtual address to be translated
+ * @addr: The virtual address or guest physical address to be translated
  * @fault_pte_addr: If not NULL, this will be set to fault pte address
  *                  when a error occurs on pte address translation.
  *                  This will already be shifted to match htval.
@@ -744,7 +744,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
-                                int *prot, target_ulong addr,
+                                int *prot, vaddr addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
-- 
2.40.0


