Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75E49FDA7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:09:37 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDToe-0002eJ-RX
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD8-0002Ak-7T
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:55 -0500
Received: from [2a00:1450:4864:20::429] (port=36447
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCz-0006Qn-L2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id u15so11596623wrt.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1JzsXBg2hmiS63BFFEiqs4MT5Eh+Id4HFoGGl8loaDA=;
 b=tU+ikKCvVs+Ufbtv+BXouy4l1012O2RW3vL8dAJC004uruZUqDDPKUyFbAf73wkmMH
 EuzjJL0miOIbXeF5gOiKGABX2tfeVYfGVuyW6gkbsyCV3fapCjHoS78mOXi9x20Fmvkw
 q/14KsfOXupxC0mism3AH4eZtmwDYlOZt6H/6LTnCSBnLrLxbTzemuRotal150QCxzIV
 mi4PawNlnjgZXd4eGCYiQAEsLZM88e7Wl19ZKw7TEniT+Mh1r3HXfHjvdUFlEW7ds3Hu
 /6dRbjHJmkwgtTl6I6KfDxVQEdWDOd1hShBi7Hhx3E1MsosbAUrUXyiE+9RoC/+jZaR8
 fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JzsXBg2hmiS63BFFEiqs4MT5Eh+Id4HFoGGl8loaDA=;
 b=P1rL0LCKFEaDLqD+BU8iWYDlF2I+mromdXhDBAxmmPvjx87Pz1SMmTb05TIkQGCwus
 /Fod4N6VutQrEeXyOfKpzXwCMOvrz1UpoltciyJeikvL0HC2WV6+XJUjG2w9Xw5phpVs
 oY8W3j2QPvY9U1sK8BEIioLAq380nLGl+5hyDIOxFW5byWzDdsEfAe6OQxQyGzQvIFqk
 S+TFLnw9cZ5AOoEMYG3MIRYKcNUGnvTSwPnHUfna0r99CLBzHeIhdneCEYslXlpp1ze2
 qFPOTRFCsQgBGoYGK5iWIKQaYAhvCUl4nSsGnJeKxnbIoe5DApfqTWU7t6w8F+GuhbaE
 i5YQ==
X-Gm-Message-State: AOAM530jcjfCATH20i+54mYtkitOyUD2Vd2Dx9D4Rh/muuen2ojGG+T0
 GHKxYUu/XW7kC5IIYDtDUph82oC2vKQXOQ==
X-Google-Smtp-Source: ABdhPJxSUJyWTHqN/Z4gEKWD3VF8ILNOO1AANdMfKN847SB8o1/Ko7JZlN9Tx7Cx0zmjQIyvFzsFpw==
X-Received: by 2002:a05:6000:1884:: with SMTP id
 a4mr7167873wri.509.1643383839428; 
 Fri, 28 Jan 2022 07:30:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/32] hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for
 unimplemented registers
Date: Fri, 28 Jan 2022 15:30:04 +0000
Message-Id: <20220128153009.2467560-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ITS has a bank of 8 GITS_BASER<n> registers, which allow the
guest to specify the base address of various data tables.  Each
register has a read-only type field indicating which table it is for
and a read-write field where the guest can write in the base address
(among other things).  We currently allow the guest to write the
writeable fields for all eight registers, even if the type field is 0
indicating "Unimplemented".  This means the guest can provoke QEMU
into asserting by writing an address into one of these unimplemented
base registers, which bypasses the "if (!value) continue" check in
extract_table_params() and lets us hit the assertion that the type
field is one of the permitted table types.

Prevent the assertion by not allowing the guest to write to the
unimplemented base registers. This means their value will remain 0
and extract_table_params() will ignore them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-12-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b17f2631269..237198845d7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -929,6 +929,10 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
 
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             if (offset & 7) {
                 value <<= 32;
                 value &= ~GITS_BASER_RO_MASK;
@@ -1025,6 +1029,10 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          */
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
+            if (s->baser[index] == 0) {
+                /* Unimplemented GITS_BASERn: RAZ/WI */
+                break;
+            }
             s->baser[index] &= GITS_BASER_RO_MASK;
             s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
         }
-- 
2.25.1


