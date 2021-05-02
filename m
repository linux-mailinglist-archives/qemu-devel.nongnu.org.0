Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F267370D72
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:49:39 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDPe-0006WA-81
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKd-0001GP-Lq
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKZ-00059d-Kg
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id t4so675522plc.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqEgUgqz02Z8sn33fRQv9yX+A8s/JtIeF1usXc7oQj8=;
 b=vdUdclw+/yAcNISwosSjeSvu3hVydEj+D/xS0vsTC9UANi4W6ssur6TYRPfDkU5HZs
 IEK1j5g+9GetWVZifzoBTHcri835siuhdjSGzcv1YfNzEEQAlGesVoIMNaJiP3jFQfmH
 c8cMfF2RYBF2YglMlFBpiUqzQjKUUSamAQWBvRyMTmMLWgpkur1gf5V1X5xZUDzijlOr
 mdjJCkVNBpCeequb7nSqZ8t1GfLq1Je/dwVVRR8SjghYKcA0ZWZt6VxPZ99cUN5jHw+C
 n3Z10y0H/doVee7xMSCMhkjadkoy4bxRZeN4kTpw1ZD7VC3jL3NTjnnGS3nKH9erL1bH
 EjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqEgUgqz02Z8sn33fRQv9yX+A8s/JtIeF1usXc7oQj8=;
 b=W15Jzhs2NWE2bdt7iWhPcHJWvWJ2JVwPgkS/rzUpPkygJRd8IVSmaOmM+heQUK/EFv
 S9NG7odmP+6h8IO5vf1lxUEhAxOu/fI9MO7J59N2FG+RHhVqeCdeiIKT1E+3c9sSDTCJ
 +V/KkgTPB5u+bpLNPa59JBQ3cBPCWeMC6m7BFZ0HhpGA+Bd4mGgaRdUu+D1sBs0looaS
 HcJLQ9SkGp1wg6NB80nvq2hWGKtD+mo2NlJ9HzmweOcSakuJTL0498wnPNsPqYj4slUw
 vfXv+RSeqiLDpZwshYebgd02k9CnlQYi9zu1/WrDKPoMYIISqy40M6vVsyeCmCOXG7JH
 rykA==
X-Gm-Message-State: AOAM530Rb4dlslwHQQcadnT40YIdMUeqWwZrsbdo9B0SZCHPrMlcM6eY
 EL4ThkTsxBwTI6t2Q8Efc2XWm0hSxPl6pQ==
X-Google-Smtp-Source: ABdhPJwdLWJDHvOSDNZl5cwq2vae8Fpy6d6JowQ0kMUrOMVMJv5YGnU6OjVmvJxikL/SefTkR9CoMw==
X-Received: by 2002:a17:902:b18c:b029:ed:631f:63ca with SMTP id
 s12-20020a170902b18cb02900ed631f63camr15806481plr.40.1619966662340; 
 Sun, 02 May 2021 07:44:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/31] target/hexagon: remove unnecessary checks in
 find_iclass_slots
Date: Sun,  2 May 2021 07:43:50 -0700
Message-Id: <20210502144419.1659844-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reported-by: Richard Henderson <<richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784037-26129-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/iclass.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/hexagon/iclass.c b/target/hexagon/iclass.c
index 378d8a6a75..6091286993 100644
--- a/target/hexagon/iclass.c
+++ b/target/hexagon/iclass.c
@@ -53,10 +53,6 @@ SlotMask find_iclass_slots(Opcode opcode, int itype)
                (opcode == Y2_isync) ||
                (opcode == J2_pause) || (opcode == J4_hintjumpr)) {
         return SLOTS_2;
-    } else if ((itype == ICLASS_V2LDST) && (GET_ATTRIB(opcode, A_STORE))) {
-        return SLOTS_01;
-    } else if ((itype == ICLASS_V2LDST) && (!GET_ATTRIB(opcode, A_STORE))) {
-        return SLOTS_01;
     } else if (GET_ATTRIB(opcode, A_CRSLOT23)) {
         return SLOTS_23;
     } else if (GET_ATTRIB(opcode, A_RESTRICT_PREFERSLOT0)) {
-- 
2.25.1


