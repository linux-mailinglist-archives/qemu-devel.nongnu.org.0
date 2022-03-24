Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54C4E6009
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:12:00 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIZb-0000bi-C8
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:11:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIWg-0007P4-4x
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:08:58 -0400
Received: from [2a00:1450:4864:20::634] (port=35599
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXIWe-0000fm-E4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:08:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id yy13so7533550ejb.2
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGwR00G2oPsV6CI+SY2f6JpoisnJnzXQj8p1weGDL4c=;
 b=XGkO8H1cAoU6XBLTBnBm5B4LLjdj7ByLEXMIdq4x0G2griFzpvnWiglLiSJtJdHl01
 vHsz7CyGtNjbOe2rFz6liqVSX88XRvAkP9vaaz1bRL6Dd9FeTF/T8yDgZO9dsULxf8d6
 G0BlIw4Aa0+00T932MhIVrCQBZBc85rgqvhn7w6lUuMpFHSohLShpupb9l60knhMjgG0
 cD7Vq7TYhVorSTN1E3lV0yWiWc5pZIaNGKwFuGma395M079rjYNZTiEoNmI3pd0kxRUY
 wvcfoxqGOl/2v6sARXuOoBj1fU0cdeO54NIrbO3cJDRFIzlr1fceYkwUXik7n3iiuJA6
 1hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gGwR00G2oPsV6CI+SY2f6JpoisnJnzXQj8p1weGDL4c=;
 b=M154PRfxP41Po3126Th33lWCU4Eors8IjmMD/Xy2Qqo4m0K8Xdt650KdKZ8CAF1Iga
 ybJOP6N46NX2fxgi2Eia/w2gGhdWhNWO7168T++/9tK3yIzXofhTyaKHoIzdhlgOJArq
 shxrug2zMLqTeGygGLu9uo0Uc+PfNq9FAciLIZ1+45Hw900JKHWsXgLcA3dELNA7sfx/
 hSrA7b4vfs4cpjXdQCG34t/XGHK7bXyYl9OtlCucfPe9XierVnbso6zfZlJug7pl9yj9
 YorOmdQ4tZ54lBja7zSlTThftI8TIFoXNt+Na7kilQ0GkbvydFP1tIKQ4InCaznCVfXN
 qYOg==
X-Gm-Message-State: AOAM530ivpJa47VRSEE9Vn824eaAjXlLFXOgKvnY/0jxOQvK95yRA40W
 xjmxiw3h/mgLBK2XcgxmSaKzYA5B4DQ=
X-Google-Smtp-Source: ABdhPJy6xLXOKmRHMQ9RdtI0uVnYfH1udoAxS51Av9Kr/wqMeFcj8K6FExaQFuwEEYfJvs4bcr92bg==
X-Received: by 2002:a17:906:a046:b0:6b9:20c:47c1 with SMTP id
 bg6-20020a170906a04600b006b9020c47c1mr4341277ejb.615.1648109334981; 
 Thu, 24 Mar 2022 01:08:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a17090635cc00b006e055c9c91esm800699ejb.101.2022.03.24.01.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:08:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: tcg: high bits SSE cmp operation must be ignored
Date: Thu, 24 Mar 2022 09:08:47 +0100
Message-Id: <20220324080847.69459-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: sonicadvance1@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

High bits in the immediate operand of SSE comparisons are ignored, they
do not result in an undefined opcode exception.  This is mentioned
explicitly in the Intel documentation.

Reported-by: sonicadvance1@gmail.com
Closes: https://gitlab.com/qemu-project/qemu/-/issues/184
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..c393913fe0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4509,10 +4509,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
             break;
         case 0xc2:
-            /* compare insns */
-            val = x86_ldub_code(env, s);
-            if (val >= 8)
-                goto unknown_op;
+            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
+            val = x86_ldub_code(env, s) & 7;
             sse_fn_epp = sse_op_table4[val][b1];
 
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-- 
2.35.1


