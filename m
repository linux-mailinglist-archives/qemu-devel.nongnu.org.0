Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56A5262EE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:19:47 +0200 (CEST)
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVCs-0005MM-3k
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npVBL-0003PL-Cv
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:18:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npVBF-00006Z-Ho
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:18:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso5252132wmq.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=feuaJLzK8Nu4Ocx9M7NvKfkc0AdKMuwnoiZ0q+4fWpU=;
 b=CfrY0RxFVyuIrsJ9H+K7xa6Bs3fzEPNVJHZUidGm5joI+rRehS9oLvEg2VDYfCA6L6
 s1ezTLVvFhjcokuOWEmPb65GbEZzf0f7p53JNYqUdHIqFNLyw5rFBg3jBpgyfnB22TCe
 0JVTLqg7KoymP+GjsTP5EBk1EbKtQ4N5A7dUlkjzJa2oSPC6gYuKE7TEuepiMEVpOPyq
 tFzLKiqoSXeMctDjrMSs1/xrEWgC246J3u813NvcoK7uKc3XiLYm1PWuKk9WOEXsPY9R
 pxfyuBld9cHHYMUB6Gq7p2F0N8NTPp1WiruIz+ZeJ1Nw/5ZuGL4aOcFQpk4KrOSmL4E7
 iJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=feuaJLzK8Nu4Ocx9M7NvKfkc0AdKMuwnoiZ0q+4fWpU=;
 b=n38SuH52HzQJA/I84VTLW7nnrP6gow6sCJ9wTCjcHVb1I3UJ5Rp2Vuc9FjsYUCjHOH
 xPXv6yQjph6t7iRdpD9+TY/wV8Yjki9cxyt1R1VYMH7WtQ+y5eysj15SfY1mPFX9w4D4
 TWFCT7LgYrwJ188Lo6GbvxXC06R2tZiSo6ilwGzxMFyoU/Hq5eVIPjaKBJmFwczTHs0/
 77OTT/VGjU2Et7QNFSeCckqk+Q1ZDl0McnofzPt4fCVeW8pY2zeC/BLqtyfoqZCW1sD9
 tKiarCbsyzYI9l+zY03hZwvIVqLUw4Mdf0gTRHpyQqwRk16+qee1fFV6Ojziia9MaAYE
 CF2w==
X-Gm-Message-State: AOAM531PSGtSS4Z8xsMUNtwOLKJtVCWoUbrWtEngJNgIiQmQjIzpQgc8
 8LIloLZfNN0QVq67kuGRxWtxLAUU/cPV5A==
X-Google-Smtp-Source: ABdhPJxnqOpizZYfigmBl+Qrf9jgVdKJtceMdMF6WL6lKs+IiJTjQkwmlHqsB9B4lCB10zBqLNrrqQ==
X-Received: by 2002:a7b:c93a:0:b0:394:2583:69fe with SMTP id
 h26-20020a7bc93a000000b00394258369femr4672716wml.29.1652447882970; 
 Fri, 13 May 2022 06:18:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adfa74f000000b0020c5253d8e5sm2095914wrd.49.2022.05.13.06.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:18:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Date: Fri, 13 May 2022 14:18:01 +0100
Message-Id: <20220513131801.4082712-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 88ce6c6ee85d we switched from directly fishing the number
of breakpoints and watchpoints out of the ID register fields to
abstracting out functions to do this job, but we forgot to delete the
now-obsolete comment in define_debug_regs() about the relation
between the ID field value and the actual number of breakpoints and
watchpoints.  Delete the obsolete comment.

Reported-by: CHRIS HOWARD <cvz185@web.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 432bd819195..3184fcb7797 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6529,7 +6529,6 @@ static void define_debug_regs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &dbgdidr);
     }
 
-    /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
     wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
-- 
2.25.1


