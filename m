Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22619347E2A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:49:02 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6gn-0007Df-62
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP6em-0006Ps-M0
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:46:56 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:40621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP6ek-0003BQ-EA
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:46:56 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so23354227otb.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fOau8rpDDHl9c/Ot3yQk8tZ8xyCg6pIUYZPgecScZk4=;
 b=XE1KKA95WZ5kfDYoUPbaG4Ub5tJFLaZ++ux+ip33N4fFddeS+UWWzGWiO5/mP4wNLt
 +EcxVAzQjjSkpcb+wVQYgKJYM6DfWDPtSTXhwZfTRrMYI7cdEWIsX8E+k8oHBf5mZg0y
 bsPGqXc58TTxbfAU3xz42kCYGumaBadq2Wb9C/b7cUpSRqoChaaEeD9hdmT+eXeykwPD
 pC2ABcyU4C4JKwSHYmbGpFQj0jUBe7tfTclh0/Zjfp81iO9QcknRYzv6Op/lUrV3Lbhz
 C/KBA/U6DD+3pqSNXqLFwTvJeFiCmbh9j8g4rhcoMDoQY8QXCL3hAlUjcTIkT/Ibn92I
 A/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fOau8rpDDHl9c/Ot3yQk8tZ8xyCg6pIUYZPgecScZk4=;
 b=mljn8GVVz6X7yizjfARlpcSKUEcF3F5+v+GuaVJq2AjQfukDGWFrzIYYHePIKJXR+q
 UtJUA26UQnLK8s1prkb4gs/gvlcHGGUoZIllGcUTXAryDoDu/EMCgxjZ9VOEsXya+JlR
 fEF6wKugKNvdxCuGqucegQzK751sxDP0vcAOYqVmZWlVNj81TnzdtwsgSliGKUny7Lq0
 gnP/FwtWrkq6jPxG3pOXMMWtmtkAI2Bwls1CtfaA8fxMc+QHBBQSrXfarxevY4G5xA6A
 7ZOvTy1BgiGd1b8051Wb4PIEhOK5iv7LB+Ki9rDoItKTzd28DNMneO5nbLF0GcVA8zZ7
 nF/A==
X-Gm-Message-State: AOAM531zckNjgDBy4/NWMImmZrl69e87gcKSwnzHxpUUoQhHeqKbXt1S
 cPXrKc+hcOpTyE6iXG9H7QhpgMWRvaURk3KE
X-Google-Smtp-Source: ABdhPJzz8Zs79y0arvPVLlWyirQ7LMj86dvJzTNMhpP3S9JZdSCJVXwqUuBPwzuH077YSSlEesY/Dg==
X-Received: by 2002:a05:6830:1288:: with SMTP id
 z8mr4071365otp.5.1616604412343; 
 Wed, 24 Mar 2021 09:46:52 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i3sm640135oov.2.2021.03.24.09.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:46:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Verify memory operand for lcall and ljmp
Date: Wed, 24 Mar 2021 10:46:50 -0600
Message-Id: <20210324164650.128608-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two opcodes only allow a memory operand.

Lacking the check for a register operand, we used the A0 temp
without initialization, which led to a tcg abort.

Buglink: https://bugs.launchpad.net/qemu/+bug/1921138
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index af1faf9342..880bc45561 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5061,6 +5061,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jr(s, s->T0);
             break;
         case 3: /* lcall Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
@@ -5088,6 +5091,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             gen_jr(s, s->T0);
             break;
         case 5: /* ljmp Ev */
+            if (mod == 3) {
+                goto illegal_op;
+            }
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
             gen_op_ld_v(s, MO_16, s->T0, s->A0);
-- 
2.25.1


