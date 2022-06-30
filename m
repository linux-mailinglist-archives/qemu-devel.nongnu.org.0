Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D345623AC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:57:28 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70I3-0005l3-3o
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704c-0004WH-8H; Thu, 30 Jun 2022 15:43:34 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704V-0006HS-V8; Thu, 30 Jun 2022 15:43:32 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so582582fac.13; 
 Thu, 30 Jun 2022 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tsub3WIHJyIUS6wAY/AlAAg4SAe96SeEYRVQ4l/QV1s=;
 b=Je9l2wUAcKeKwXCTC+5U9gYNhymiaD99KmQNrGN7hLgxy2R/tU5qTJO0NS65qP86OS
 hQ4CRN3DHXqbsiJm2lydXrsd2m2g86JKjo2w49XofEqvoxVHM3Wo0WhEiJnhWXaoxVK3
 cot/Y3are6xtMoh5r5bvBHKdcpYctbaujBWCDogUSRHGIz3amCofacE+qoed8ry1FYN2
 kYHpc8XoK/1+G1bgQxk64CC5x7dbEplmSJbP4JwwTt0IyVXb8+ZAL4U6eG1oYduPsNYV
 ZRJaSNffTo9MFdVE1URgtzteMoinpVI/k4+XuKfy5HTYHlATK8aMuVC2MwM6aKigqgi1
 igdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tsub3WIHJyIUS6wAY/AlAAg4SAe96SeEYRVQ4l/QV1s=;
 b=zrqh3sDvikaCEXCecVcGGjxL6Gpwez/uzqi+yILREEsIQAZTZXGGTe57qOYznox7nD
 vVHkVAS6FU2Fyz/siPyUAwCwj1yFxgeWgwlyrB2IZq6rxPc1eEj69y6rfV5rHw7qlpZn
 CL+1gtKRcCeUxQQ8US0hAxBsVOsUWCKglSwvW+4t/+LcmaB2iwdx0/PQmvM6g+68Tfej
 GPBtRu9dMqN2yy6laWLNlFrnOb9JGt23viMKh3XB/NREWG3n50qHBxFBm9yljDxvQh6e
 7F8Jc45r7iYcrdg9c+wo2FLX/hCGinze9rdt8MCtqSCha/W5QzIeTeyZ+J2ZUCGoSHot
 etXg==
X-Gm-Message-State: AJIora9pAv4/EyhYiAETdzOp3o6Ty4ghHVLUgGJN0RlkBZHs/dSjc0aO
 YYOm2PB3vP3fTIG6+HrK5/a2Ly2t5VQ=
X-Google-Smtp-Source: AGRyM1t7X7qkHNlq5iITQoeMiKpkNRC1z4VtJBAoObqX3xMjWiO0mOJbkmNfIg57PxSnM/ECDR8d0w==
X-Received: by 2002:a05:6870:4344:b0:10b:8499:395d with SMTP id
 x4-20020a056870434400b0010b8499395dmr6418728oah.214.1656618205938; 
 Thu, 30 Jun 2022 12:43:25 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 8/9] e500.c: use PLATFORM_CLK_FREQ_HZ if unable to read clock
 freq from DT
Date: Thu, 30 Jun 2022 16:42:48 -0300
Message-Id: <20220630194249.886747-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Default 'clock_freq' to PLATFORM_CLK_FREQ_HZ if kvmppc_get_clockfreq()
fails to read the clock from the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 4b4e99ef3c..dc53d99b47 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -404,8 +404,14 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
 
     if (kvm_enabled()) {
+        Error *local_err = NULL;
+
         /* Read out host's frequencies */
-        clock_freq = kvmppc_get_clockfreq(NULL);
+        clock_freq = kvmppc_get_clockfreq(&local_err);
+        if (local_err) {
+            clock_freq = PLATFORM_CLK_FREQ_HZ;
+        }
+
         tb_freq = kvmppc_get_tbfreq();
 
         /* indicate KVM hypercall interface */
-- 
2.36.1


