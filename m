Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667C380DB0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:58:54 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaDF-0003rk-9k
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZA-0003Zu-Ua
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:28 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ9-0000Eo-Ch
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:28 -0400
Received: by mail-qk1-x732.google.com with SMTP id f29so16784688qka.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRRbIYZnMJygZMeuiu8ub/8sm7AeW6vOv0S7nYlH/yg=;
 b=D+cDVMDQSz7KwTaB1yY3mwpxgO1iCBbWce9vM9WUHTqQ0Z+FHOhYuazAkJa3lXk1D0
 bpy3da559f6r2MJ/v24YK/1ZDvBXFmPntlPq8ZxgLH2ZJWfM39SYVOTizZkHik3M3BxI
 wjWrgR8ZxSWs4Ist2+o0D8MDtjHD1/LwALO6amlB8mYajdhSaMXwRY7S+qeEWi/w3wmG
 tssAQUaxfYsf2844ctiE1Y+t+behfQQNWLhhnE/PfoEd5HrkycnpSf9PrisPdVQT5t7y
 JVg6zm3KVHXI3Pov2JukE2xM00m4EQQvcGCdw7vS4Rlp22Hm4lokR/r9HWw0j9kks7g7
 Lefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRRbIYZnMJygZMeuiu8ub/8sm7AeW6vOv0S7nYlH/yg=;
 b=sVVKy18byTPZq6+YPqHNq/q/vnZ8NhL/3YFkG2DnZbrJNTtG0W1a5f2fyyaqX3VKUA
 NfYlvgSahThXMMaju7g3Hnq9x8LTYog8a3fzZkxohDgidlQS/AJwdolCCrDIAcPiAJUa
 iYXmi6Zl0nkJzudz0nbeB8VM6zw7p4ueI5ccp2rv9171/wTfo3viNdKakiOcabkfATpi
 EfcDot5FstQXux+L/XAmjPSFEdKh1QbjFA70NszYFTrW+OpH8FrPP56eIJx/32vLPt+N
 0FMqbAxxL5q7I8Ceox5JIS86Wr070Z8eqHWCQhar/jx9F0XAoQpb7hTW2/fa1SBlcscv
 I9Sw==
X-Gm-Message-State: AOAM532gi8DHXQYqb2LSSaHRBjFl1R0diW0E1bV6vP4Qq3JS6NGWwtus
 NO1uiSSk4MZE78Ijgb8QkMFzfjQXDoRCXS/p0IM=
X-Google-Smtp-Source: ABdhPJxNn6Z4TBDsVDhLcfec2lIeghXpWa2tMQis/ARsaxdxsuG8Lj2Kev3fAX/BTF3dAxWyeKW2Nw==
X-Received: by 2002:a05:620a:3c3:: with SMTP id
 r3mr43118017qkm.35.1621005446595; 
 Fri, 14 May 2021 08:17:26 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/50] target/i386: Exit tb after wrmsr
Date: Fri, 14 May 2021 10:13:37 -0500
Message-Id: <20210514151342.384376-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At minimum, wrmsr can change efer, which affects HF_LMA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2aa2410336..6eeaa3a98b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7260,6 +7260,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
             }
         }
         break;
-- 
2.25.1


