Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0F6EA722
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9G-0008Fp-SW; Fri, 21 Apr 2023 05:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn98-0008Ef-1S
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn96-00032r-NS
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3A9++hQqz+KlNyqBz9ikcaFaIzOEE3nV7V+VgiSLlc=;
 b=DBj62XN9+ecCD530gUFDRTXICZnq32GLLFg1o4LPHOLFsoEEr0i+zZadb56/sVWXd9RE2W
 +wDv4GcG46E4roCt+bQqDxRiPHje6YgRHSyZU4tXDVx/wVwM66dyVWCkFUQnpJPBXx6a65
 Tm66rQLHVZmlXYA9hUeCbX2G71SfVlk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-n9LkV6_eOECYQMYxq-0Vjg-1; Fri, 21 Apr 2023 05:33:34 -0400
X-MC-Unique: n9LkV6_eOECYQMYxq-0Vjg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a342f6516so144187966b.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069613; x=1684661613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3A9++hQqz+KlNyqBz9ikcaFaIzOEE3nV7V+VgiSLlc=;
 b=AwnNWBGUsHxnrk3e2rz8LOPco/IMouh1PqFAe1xum9quB0PLr+8sjXLkVpnpfqMJAw
 K/WgzOkid0R88roKQm7ix7I2Yfza92MjJIfAFC/o8IOBmOCWsyR0bfnkmMWM7unhyu48
 7UElrb7T7IIfETPyNzgXCmc5Aw/3VL8bl/3dKbXj3YCWnbhhhNlx3AO2mKI4KWRo9u7N
 xZZbalIOjhpCP6tWbxaAJ2uUStY8k1Tu82z9CC52IDjwZtP/ob6ozjPk+4a4WjjSn1yb
 L1ZlZsFf/62UV9zgTPNGyvMU3zZrcqq0IjhjiBaxKHpPcRfyBjrcMYu/ZhxSgGNSN4/j
 tIuA==
X-Gm-Message-State: AAQBX9dw5gHOpHsZt4dC1Bn3zmvwlwCsoZ/1RYYu+AgrMwh0/bfE44c/
 9Eh6i2XyON6EEa+LcU+E1uvoFqkp5ThbMNPCPstdP1QAbuNj/a57JXsdONI7R8/LOJw9IPUcD8J
 j1rg0Xb/nhKyMqCGYlv4WEjmFC37BRjifM9fG11u+pp52mp5hTDcndzTzWT+FcJDXLz8T6vODW8
 IsIA==
X-Received: by 2002:a17:906:72cd:b0:94f:8118:d74b with SMTP id
 m13-20020a17090672cd00b0094f8118d74bmr1590494ejl.40.1682069613119; 
 Fri, 21 Apr 2023 02:33:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZCfvw0houpZFkLkQl9/ctYrVQWcx/nyiv2LaVENZSAD0FSI4JDf+EMdaizVxGtpKuQAbhFTw==
X-Received: by 2002:a17:906:72cd:b0:94f:8118:d74b with SMTP id
 m13-20020a17090672cd00b0094f8118d74bmr1590475ejl.40.1682069612774; 
 Fri, 21 Apr 2023 02:33:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170906539500b0094efdfe60dcsm1780428ejo.206.2023.04.21.02.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/25] target/mips: tcg: detect out-of-bounds accesses to
 cpu_gpr and cpu_gpr_hi
Date: Fri, 21 Apr 2023 11:33:02 +0200
Message-Id: <20230421093316.17941-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In some cases (for example gen_compute_branch_nm in
nanomips_translate.c.inc) registers can be unused
on some paths and a negative value is passed in that case:

        gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
                              imm << 1);

To avoid an out of bounds access in those cases, introduce
assertions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/mips/tcg/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 1fb4ef712729..999fbb7cc1c0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1223,6 +1223,7 @@ static const char regnames_LO[][4] = {
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr));
     if (reg == 0) {
         tcg_gen_movi_tl(t, 0);
     } else {
@@ -1232,6 +1233,7 @@ void gen_load_gpr(TCGv t, int reg)
 
 void gen_store_gpr(TCGv t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr));
     if (reg != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg], t);
     }
@@ -1240,6 +1242,7 @@ void gen_store_gpr(TCGv t, int reg)
 #if defined(TARGET_MIPS64)
 void gen_load_gpr_hi(TCGv_i64 t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr_hi));
     if (reg == 0) {
         tcg_gen_movi_i64(t, 0);
     } else {
@@ -1249,6 +1252,7 @@ void gen_load_gpr_hi(TCGv_i64 t, int reg)
 
 void gen_store_gpr_hi(TCGv_i64 t, int reg)
 {
+    assert(reg >= 0 && reg <= ARRAY_SIZE(cpu_gpr_hi));
     if (reg != 0) {
         tcg_gen_mov_i64(cpu_gpr_hi[reg], t);
     }
-- 
2.40.0


