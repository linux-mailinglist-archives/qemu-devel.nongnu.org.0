Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5B4AFFD0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:03:11 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv3O-0004xF-Lm
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvu-00050Z-QQ
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:26 -0500
Received: from [2607:f8b0:4864:20::102d] (port=38874
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvg-00081Z-1K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so6548327pja.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J84qIjygQPTZULeHT6lJUDBBJVkyzL5iTTMxavo/mCM=;
 b=bTbdcsOPl0yWfiNamSpfUi4uc7DH8hvDraepJl7v+uvfMZOuRaywxKoFym+O5+2ok5
 KG3MEnbEUjYLU8YKQxGHI07S/Pft4QHyl8swKJ4o9dUkGUWYrMFM9Fomwx7EQVyuxlBK
 qKaiXTVDkgeCkPve4/uPXR+BdMqX9pAYtWEa/eExYxN3ZZTfTNIHk5yd4JS56YqGk+us
 /AXY75Pl0PBHHTeJtxtPDz/YDs259dT99RW2TPPBKeHmx9gIlgYOAlWA4RUStVNGDk7Z
 ED8S5f7sdWPWRf46IgtnPNo1OfGdg9Cv1SAUr+UJzdMUj9MKJP/yoMx1iI6S4oAJAd6J
 5cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J84qIjygQPTZULeHT6lJUDBBJVkyzL5iTTMxavo/mCM=;
 b=r7VyO24VfSZtCSbJx25fhxfz4PSs1vqSxTg/9gLkBtLVN39FHIcgZW3fcUFtdw/xsH
 cdjRcNB2jolnFfaKDyILnMe6ziT0X9yZSHT8M+ZthH8zxNmW5YA4+cubQ1548xvmmK8x
 ZkbEGNmZiIJ3OIAD/HrmLJlVjOctJjmvR6yOQdhcqdcC86z8xeG7FdKYjSOXCMYZY5RU
 LYoX3zskHfdmVdM469LHTvp7QnS5t03ChRo3rHSR/J8R4aEv4bz3iP5WEDSVP9kNIALs
 TyjxQmuZMcXX4rKwpyNNxKWk25pRpPqDjxv3gpx2yjJG7EddY9bfn3cbhnZwv1gPCbWl
 TOoQ==
X-Gm-Message-State: AOAM530L2DX5S1B7ppvSF/368jChqOsjuL1zcmVydA88r5pfOzobHRYu
 3Ewyy7YrfHKzFivcAdCOI71iVKHQ7LA=
X-Google-Smtp-Source: ABdhPJykWeRkoGBfOahJGYTcIYGubLUNjpX0REAxi5eKTjxOMp1k7lrpWTPEOflRiD1MamrDDcadMg==
X-Received: by 2002:a17:90a:1987:: with SMTP id
 7mr4848706pji.215.1644443708824; 
 Wed, 09 Feb 2022 13:55:08 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b24sm14949306pgs.1.2022.02.09.13.55.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:08 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 02/15] hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
Date: Wed,  9 Feb 2022 22:54:33 +0100
Message-Id: <20220209215446.58402-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

hwaddr type is defined in "exec/hwaddr.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/m68k/mcf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
index decf17ce42..8cbd587bbf 100644
--- a/include/hw/m68k/mcf.h
+++ b/include/hw/m68k/mcf.h
@@ -2,6 +2,7 @@
 #define HW_MCF_H
 /* Motorola ColdFire device prototypes.  */
 
+#include "exec/hwaddr.h"
 #include "target/m68k/cpu-qom.h"
 
 /* mcf_uart.c */
-- 
2.34.1


