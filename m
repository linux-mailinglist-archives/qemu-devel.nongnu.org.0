Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8D4955FD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:32:59 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAf3C-0002TT-La
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZB3-0007iH-TB
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:16:44 -0500
Received: from [2a00:1450:4864:20::332] (port=43972
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZAz-0003OX-Nm
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:16:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so14515455wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcNzRDDLqUXh8SKulDhEdj/nqpA2o3Dbwbq+sgN0vNg=;
 b=ZewIxEA1BzNUxoMoJEmAuxr2QDpTFmGWoYpJhbBxjTHst0Z9BhlCyAEfmvybhhiPNW
 pwBEMEGdRcRBjDWvAPsMG7GeZyv2Hx3FHcW8Z6bMH3LO2NpSzKL7oHCwHN9f8sZEQoIN
 NBgjUzSj67EPZacOugUlRryQ45LqZ0xtoQivt7rWFUeF1KEzpJm1AftJA6r7vx4E20L4
 xRNJ+74j5R1437gorGJX3I/NDNFiIUlPoDvE2zKa/8+GlI9fafHWu3787kIcXWz+UDn1
 QePcpkpEAW+tsOHaCJC06ZRax3M1/CaiLJYVTyDn/PwxBWDjBvc6N7Uda9lwKV85Emy6
 r8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcNzRDDLqUXh8SKulDhEdj/nqpA2o3Dbwbq+sgN0vNg=;
 b=SnyLUeqelsVuiV7dLxUuVOhS+84mor1WEDX+4zIIOkZPIMacu41qmo3oQq482uyCDF
 x1Ya0U74WEhqCfu1DW9YiPW9yEH3XYogQwkTzeIEaxQnmFGRjJ5uZVf9FfR7bY5m7nr6
 iqFB9jV20Q+VfHoFJ7nSehUi3MiVGZZ5vw+RtIRdIcOaqzhZWzf3iYF059qfUaPVnF00
 xnuvjJbjlayXi7oJYOkZz7bql24r1+TIAjaqnk7pvkAj3OLfiPrs2K7E7sjv4cXmQi3p
 EuAKtgUS+sMHHfbxinr7C/cWdJghAEeoWRpAzOZO77lpcWQhXP2vI6a3ay5X+rJS9Fne
 KfOg==
X-Gm-Message-State: AOAM531cpQWyNyqwucC8J2ALFl1ISRO78QvKXD3IBcudccBli+FMJa8t
 1EdL7n+NKjaMiOgagUbN4Zv0iw==
X-Google-Smtp-Source: ABdhPJwtgHRJHm3m+H38klcu1PN7EV4BeZdtlNslPUOl3I4YiHvT9QIdgiLQshggLYpWTOSmRNbAgw==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr9331490wmb.5.1642691771507;
 Thu, 20 Jan 2022 07:16:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v5sm3984750wrx.114.2022.01.20.07.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:16:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/armv7m: Fix broken VMStateDescription
Date: Thu, 20 Jan 2022 15:16:09 +0000
Message-Id: <20220120151609.433555-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit d5093d961585f02 we added a VMStateDescription to
the TYPE_ARMV7M object, to handle migration of its Clocks.
However a cut-and-paste error meant we used the wrong struct
name in the VMSTATE_CLOCK() macro arguments. The result was
that attempting a 'savevm' might result in an assertion
failure.

Cc: qemu-stable@nongnu.org
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
Fixes: d5093d961585f02
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It's a shame there's no way to type-check that the struct
name used in the VMSTATE macros is correct...
---
 hw/arm/armv7m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8d08db80be8..ceb76df3cd4 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -520,8 +520,8 @@ static const VMStateDescription vmstate_armv7m = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_CLOCK(refclk, SysTickState),
-        VMSTATE_CLOCK(cpuclk, SysTickState),
+        VMSTATE_CLOCK(refclk, ARMv7MState),
+        VMSTATE_CLOCK(cpuclk, ARMv7MState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.25.1


