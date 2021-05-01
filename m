Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157437087D
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:51:34 +0200 (CEST)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuiD-00059s-Ju
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaT-00088T-Tz
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:33 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaO-0008Sy-2p
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:33 -0400
Received: by mail-pf1-x434.google.com with SMTP id i13so1346719pfu.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqEgUgqz02Z8sn33fRQv9yX+A8s/JtIeF1usXc7oQj8=;
 b=YVSjGecjtV+2Tq3LH75qDpT1NRZ1MyOMVOVE+GCnE3Nkf5GjRsH78lvOHjYJfMTe/+
 Yn4PgeXmaleKCW/xSva4kQr1Bc1qvh+s+gWDqZGyMNb9G+FcHEXX2TP/H6FMjLHzYzG8
 COWWytY/fFTg0cFiFzhHSdmLCRZxEYz1yh0Ty2Z+fOZGbzKa+7MFv6+gANmBMSAYKbAA
 sHhpXAcHbO2c6SnVOrwjV6iEPMZDUxM2WxMqdzgYyK5FImsqOsh4G/BmU50dnOrnfitY
 6X6hvf/NK1SljVtlE7leCNQDlUdJjch1wAJ2klQUBG9AzNBwenN49ZVik0eidmtTvoeP
 DKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqEgUgqz02Z8sn33fRQv9yX+A8s/JtIeF1usXc7oQj8=;
 b=b5neMQYPFIfT1R6Gd2dEBQ9/pUzSfpf98Lbmg8lNoCr8xA6hRjmmB5wGTaFTdtd+Jl
 cbbH9KiXHkT5jYuuJTCAHcFCl7WGC46LcSPZX3UHmnnqibir0kqcRKoT+NMujZZXDtT6
 hRfYoD5S1cMSGgv19+ur58hNafvZOGYGA51FBBSMwstE6T0uByO5Tk+hNdDuQUWAcjhq
 mcWz4uhhUiQwwnrAczEM2wAvE5WUn13xV/GkILNGdnmWGwUMnRQYjAom9yoSOmWTALYK
 xjkRTCZVae4i//SFFmq0LOkGt+lFgf/vDuxbz/uFpzqnvS2uxdmtb3EJfp3OvY39ebmj
 3YKw==
X-Gm-Message-State: AOAM5303sjwDSTqSmyGvJpQq8Dbtq79/1UdswYZ1f1tQfBIchUfg/k5V
 Yjvs/gIYi0325mceAkIITAwYxwStttQwEw==
X-Google-Smtp-Source: ABdhPJye7xMdU+iqsoz2PqcXDKac1S/LmfIMKXzUEUAZaP40uHCqIgnQklECD9Xajh3EIcz3h9PYqQ==
X-Received: by 2002:a63:4559:: with SMTP id u25mr10633605pgk.93.1619894606760; 
 Sat, 01 May 2021 11:43:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/31] target/hexagon: remove unnecessary checks in
 find_iclass_slots
Date: Sat,  1 May 2021 11:42:55 -0700
Message-Id: <20210501184324.1338186-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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


