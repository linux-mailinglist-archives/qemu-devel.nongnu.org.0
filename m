Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6542294C0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 11:22:20 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyAx9-0005pt-Cz
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsh-0005bK-S4
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:17:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAsf-0005FL-Qj
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 05:17:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id p1so652226pls.4
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=Kuoq6oHAYiTccKvHPtXDhHZUKOKrbHn2n0pH7zA2OeX8IN8tczUlD2clgSQ4ucKNu9
 +y3Mq+egu4ffVF97uKG6HX6/OuYE8fJwdyCkTxrqvgBhyAAKoV7RIuaVG8wiVfr1B+ym
 Omm8D3QrmCAlMzM/ALc0eYFtyeCYix4w6qC/EtZRMyj27oZw80ecXaN+vS3Ohc0uRFxK
 iQvK2Ekl70soezxIRZfBwz1PvKoewV+NfhUo7RlOrMdgABCObofEhazKHroTkVTgR7t1
 plk91qrK4f98Yhm44Y47DZ7KpxpcA7tAp/lMy61UEcrlsbWWX5W1rlWYiteLjHvxi5JN
 Q0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gIClYh77YnToY+rzZTLHItNPlAaqhPTdCd+nqEyek5o=;
 b=ij4n9qJxlX7WQo25eeDafoFrwDUFW0MKlcX+ocgA2piAl7tMJZhSHOY0CqvRuVbP7k
 FmsVG3qkrfhy4Jz8EAY0LGjvWbtZHtvHiFu2BaxV3diJHlvyicoTM2X51v/Z7I3I4xaZ
 Nut8go9PehzVBZSSl3uRvpRxwe8/CJCIDT5/bhAWXB80YsE+V5kUcItF2dL5jDeuibtF
 6kiFVEDQ3Ius2NIZlvAmyY1Hzleepwz2EoKDWs3bYt379LbdtuWgl713y32b6quMio3z
 eZWSWinOcXMWs/SoJ+NA5I54qQYQuxrNv2v+AO3iiyxlHsamAfyX89+6ysWcb/Iqmvt9
 EhLQ==
X-Gm-Message-State: AOAM532zy+0/scg+RVVQuYtTtpBcPaN3FC/RjIjgkAqT6bn1B13tO8dZ
 Ouhz9irrXCreu1hDYv2jGLdRC3n3mc0=
X-Google-Smtp-Source: ABdhPJwzRRM2hFSuka3tv+LFfhOOWLxIoRmM+1tg+X4AzcR62Hguu+QU0XMPs8q/law6HhKtV1BMoA==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id
 q11mr9122542pjm.135.1595409460417; 
 Wed, 22 Jul 2020 02:17:40 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:17:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 05/76] target/riscv: fix return value of do_opivx_widen()
Date: Wed, 22 Jul 2020 17:15:28 +0800
Message-Id: <20200722091641.8834-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

do_opivx_widen() should return false if check function returns false.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7cd08f0868..c0b7375927 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1151,7 +1151,7 @@ static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
     if (opivx_widen_check(s, a)) {
         return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
     }
-    return true;
+    return false;
 }
 
 #define GEN_OPIVX_WIDEN_TRANS(NAME) \
-- 
2.17.1


