Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B650931C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:44:56 +0200 (CEST)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhJ4C-0007d6-0H
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe9-0000td-Pf; Wed, 20 Apr 2022 18:18:01 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe8-0006CO-6i; Wed, 20 Apr 2022 18:18:01 -0400
Received: by mail-oi1-x229.google.com with SMTP id s16so3726514oie.0;
 Wed, 20 Apr 2022 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/O3ZRxuyRCIP5ow9riCJoMToOS7OBVPr0AyxJs9OIQ=;
 b=i0/UpH0VOFDpvkd9FMDy5ec9T2pqgOof0Jaq1GFFdX1J4YKwyt2BHAemebKxIB99MX
 8qabGyUIoTYOEDU1baurLPKPXUBObi93nAFDdtw0QQ04p/629xTX7ZguJtzX/TZz4xvp
 61LzluWO6VRg+rnLnaPA9OVxuFVsu0/bDxTzz91v2xJ+b89xes8YNDAL1VAY2fFOVxJO
 uiCkCwcwaY6wqucGpxx4Vh0ktp1H6MoU6mRVA67P8i+outjt4OlvcUmPleQGv8pkXfUD
 a0wYKOOutC52u6YHE6tVc6OTIw/ybtOS6a5RmFLhSh1Mm17MYkBTxzEjawI6n4RTCPY2
 DjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/O3ZRxuyRCIP5ow9riCJoMToOS7OBVPr0AyxJs9OIQ=;
 b=M5H1eBSwP99shKvpLl+qqKKw6Gj008R0mDEFxvV+MbcL4OHhHw5yuRx2lK4gFGSbh0
 2wy1ZMBHwrhGa6xfBczevZx9Vi/5iJYyws+eXPuaq+nlES9Z9WnkYnPocK6IGmoF0ilo
 5NWdbzn7q+sAaKePd3bbUIBar0xnxnuqFNBan6uHxqzbDpDyEJcfKb7EO8YUYmo4AsjT
 vart88XRufjHH593SwtmIschddYIg6v10F2ha8G9bJ8QvATf4MNYNyhYZZbbJmCEb9y6
 d2Yak5g/NmFQS1eOBPjEk0HVOfXE7iT7dKDdgfBDKSDCgcl1KWrSosva9J+XST/nJnjc
 9hVw==
X-Gm-Message-State: AOAM533Eirxnh8N0OSCCBrGmYjXZs1QIsnCPt+mzIXVhnKZuHIco1l8w
 vbyr/5FkbABOS1/NAH/w4TIW7rDRiGg=
X-Google-Smtp-Source: ABdhPJwUJVlg5EbSOxsjtxBk5Vvw0OqzcIbxeamY1uT2kt2VMm6dGy4Lcv7rC0GwyRa9u37XH58UmA==
X-Received: by 2002:a05:6808:f88:b0:322:fcb3:f35a with SMTP id
 o8-20020a0568080f8800b00322fcb3f35amr1293334oiw.188.1650493078740; 
 Wed, 20 Apr 2022 15:17:58 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] ppc/vof: Fix uninitialized string tracing
Date: Wed, 20 Apr 2022 19:13:25 -0300
Message-Id: <20220420221329.169755-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

There are error paths which do not initialize propname but the trace_exit
label prints it anyway. This initializes the problem string.

Spotted by Coverity CID 1487241.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220406045013.3610172-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/vof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index 8d96593677..18c3f92317 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -293,7 +293,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
                             uint32_t nodeph, uint32_t pname,
                             uint32_t valaddr, uint32_t vallen)
 {
-    char propname[OF_PROPNAME_LEN_MAX + 1];
+    char propname[OF_PROPNAME_LEN_MAX + 1] = "";
     uint32_t ret = PROM_ERROR;
     int offset, rc;
     char trval[64] = "";
-- 
2.35.1


