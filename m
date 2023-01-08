Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0E661336
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaj-0006op-P1; Sat, 07 Jan 2023 21:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELaP-0006RI-FX
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:39:02 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZP-0004nQ-9O
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:39:01 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so5819528pjj.4
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdHoeH+hZ0t51S2EuQPsB5HeY/0JCfhoxTNUbpkf+2E=;
 b=XPo5xEUOrItF78dICgV6Q+o2yG+GIWyORRH2fq0KKJYRWTh2LPUmJ39WfST6SXa1Ee
 LX54/sh5jWr90y0USup6xo/zHnvJe9n2DOQG2UpIlqZNZflG8/q151TbDSbOLHgjdrfj
 4oRycYWSxXZ5mnIvfzTQ/Sz6PqjAQAHKHq8uHTKHNRSM9HtFWjCexHygTW0BxJXJMJyJ
 MCia3QHaSJEp+0Dl1nnBhZnPINcrTSLlBHopy4Bhsd08+Nc3JJNusfe8yH9hOh0qNDsi
 5u6D0VcWov+bT/RZT2rS0Fj1haEm/WVsnds3cLJV3mj+uyrE05/whMH0WLtvasUXS5i1
 ekhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdHoeH+hZ0t51S2EuQPsB5HeY/0JCfhoxTNUbpkf+2E=;
 b=0ebKee81XnPnf/GZ2m97bGj/C9Lnqa0FZBSuFQ1bvSdnHgwJG35Ew5FM+DNfXvgv+D
 VM5/SO3Qhq7+epuP4E+YgMTkkCaRcY3lNyV1MXCCmyzvRhc0ax6FGsmJkF4sMfkN9V75
 z1J5v5nZNdWyo5RIze/y3ZFa64PUe5sd3Gx8g9ssKPLASfkpI2VC8XNzZK5NQSgiVNkK
 OBtu+8b6w9yuNr3MEn8+3mZB7LBfRiNIG4DOpoEVzg680iNg2k2GctrW5i4Fwde7EsSg
 /qSgVXEeXKhawvn4TL9JArw14mvFbwdTy+muyZvalLTu0YQe4927BBKQgTaRmynEF3UP
 l2HQ==
X-Gm-Message-State: AFqh2kqmiE7EKC6D+3tggXWvy10CeuJxvJEASkyI0r0HggPK8tWuiz3q
 +kkOMiiGNjrRndiOHJEplb26xo9ap1b6gRXS
X-Google-Smtp-Source: AMrXdXtE7kZ6fmDjzr7ktyC/V62m5EKKHyaGI3BuJ3qLC32xs1VMRPmbrHwXH5u8gjU9GcwyEMZyzw==
X-Received: by 2002:a17:902:7d93:b0:186:644f:bef1 with SMTP id
 a19-20020a1709027d9300b00186644fbef1mr65128014plm.6.1673145477997; 
 Sat, 07 Jan 2023 18:37:57 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 33/36] target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
Date: Sat,  7 Jan 2023 18:37:16 -0800
Message-Id: <20230108023719.2466341-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This case is trivial to implement inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0dafa27dab..b8cb21c395 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -625,6 +625,9 @@ static void gen_op_calc_cc(DisasContext *s)
         /* env->cc_op already is the cc value */
         break;
     case CC_OP_NZ:
+        tcg_gen_setcondi_i64(TCG_COND_NE, cc_dst, cc_dst, 0);
+        tcg_gen_extrl_i64_i32(cc_op, cc_dst);
+        break;
     case CC_OP_ABS_64:
     case CC_OP_NABS_64:
     case CC_OP_ABS_32:
-- 
2.34.1


