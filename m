Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73E2F2C2A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:05:46 +0100 (CET)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGYY-0002Wg-UT
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBY-000404-Dq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:56 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBS-0007dp-N8
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id s15so1100590plr.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QFsPDGGstlpNC8yZd2jptms+E2w3nJ4A2M/mfdcapkM=;
 b=noZzlKCDtd7vJh/yiae0g3W58mpdFUDHZyexmMoGVoXZ/DPaWw91fjLq7+Qe0Z02MT
 N3RW1wLrQ/bQxQAtEXBTlLHkSheyCzvNXqpoOIqkEc6YchxPWir2gmaHGqYKiubVbd0Z
 nqismDFU/Cq8TzilsVvj3eKCSVs/2E7as8Hu6HDe46AKO3r09AVcuYxA1kkAnx562HI+
 gfXqfJBomzemyHg3d2A1OgYlFU1ddP+iLrNc6ESrs5U5lVNqBvKlmqkZNCJyosBy81qw
 v7Twd/hpDWmU5VXbKsdWINhQw5mVFaaJj00SF2H+FmtKuq/DxJWXPRWQOADm/Ps5B+WL
 qQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QFsPDGGstlpNC8yZd2jptms+E2w3nJ4A2M/mfdcapkM=;
 b=sxiyHburcLinWGJhuDMfbQPi5cJA8lUX/KDShdFdr6NbRzbyNG5GtoRRqKpRREQ9Ml
 /RPaW3VCaBipfuoxrgW2bYbnUrTdmxCEnzoFjZ2Cq0eFp4VGSPyKHLf2kQFOZMh5I0pb
 o5Ui3DYM+19xRmpKvdQEcB4IYsMLF0Ecn3ml165ZkQPsrkXXlFWWXtJiAlmtWmI/skoh
 i+E3iusLZPTeVvpMhYxZrmMxm7eZDUwo27pXADD7/7cBakLdD19xA4lc0Rvl/W33J/4z
 QFnX+5kTWH2J7rRrX0sG7BIU4ycX1jnId5V5qsgT2bjh4DqvT4EplE9+QPxa4hHWO3d0
 0pvQ==
X-Gm-Message-State: AOAM532qccKlEm9kMpSoxgdvXCayUoKimjxgOteP1XCUulUHYcUIXrJz
 YLOrAhb2wdCP9uj+nO+jJEfcSV8J6wRm8zT6
X-Google-Smtp-Source: ABdhPJwMgnd2bdrXYrux+WewZgtZXxUhoMNyaOGuj9AZRrGD3FcM46lVjUm9h8s66Ae2O/7lH2MLGA==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id
 l8-20020a170902f688b02900daa8171753mr3886490plg.76.1610444508404; 
 Tue, 12 Jan 2021 01:41:48 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 26/72] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Tue, 12 Jan 2021 17:39:00 +0800
Message-Id: <20210112093950.17530-27-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e11666f16df..c0053cfb828 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -538,7 +538,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.17.1


