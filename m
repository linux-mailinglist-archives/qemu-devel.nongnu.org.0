Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1322F866A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:14:59 +0100 (CET)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VUo-0007el-W2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSI-0005yW-0j
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:22 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSG-0008KF-D2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so3252981wrz.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z2/OxhZnl1+hCx4R296hZXKkrZrY01o//F5I89aw4RA=;
 b=EY/xswtqUbQBtCAtA5CEj9AQyaxyzJtGh7hlLoIYFANCQTSndpaoZvyGzjUymO0e/q
 oWUeIfVcVnsk4uNQWHXHZrpy689tuhnTO1YVKtBPyrx05md7xMvas8RkNf0lWB1VzQAD
 l/g7qO1BUygEG7UZelPD1C9lHCFMSeB4ySd9q26Xx1V3L3jJim6h4raw/h3db4odwYfu
 YmPUxT1aYdCOn/oiygQU7fxgIn/84FNudT5KhxDq5PP0SN7/7wo615aCF/pM1d+3VLqy
 vEh5C1qehqJNgwVDGscMWwLwpG2+Xb/HaQySuMZ6rxIf7eQMtUZo/6B7Y4Psw49W6iUv
 LpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2/OxhZnl1+hCx4R296hZXKkrZrY01o//F5I89aw4RA=;
 b=d2QUBsVvox5YjJACNIyOoBMdMVbHjEJa5jWNDHakHClJB6fLTdZMsOzh1JDgBarl89
 4/nN2OvbOeUVseNYjqVY0Acdpd1U4oodPYkxlhGlaA5ogie2Ue//IPQK8EgBezOYoS1H
 17fE7upkrYgAFPWGjL3cIExp0O5F4wRrz97S1OwCDlBV3roVeRstm4B534LgsluJRXiz
 RQW+oKWXDPkptO3KdLn1TUVMQdOTxSFRtmfAHD709x7usKyT+qSRkEgo8L2xhJP6AMB0
 /WRzomR2fVmP8h6eJDUq6rv3bOPlEYvQFf3PsD/0nomIOU1rxM6NQR+sFnxthcNpCwav
 uxSg==
X-Gm-Message-State: AOAM5334AZgaqHTbi448VnJS1EKhS4dfYEFK05b/AGx6AWaoLfLjNten
 sMAmu+s0xj28lNyVFe6InMtzIMberdF+XQ==
X-Google-Smtp-Source: ABdhPJxRtFLFu1TDUyLyJhGXXufIR2/3wgxV1rp5Qwk6mD9xpIusGfKlccTmXQa+vY3tHGaFnG+4YA==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr14649212wro.231.1610741538862; 
 Fri, 15 Jan 2021 12:12:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] hw/m68k/next-cube: Remove unused fields from NeXTState
Date: Fri, 15 Jan 2021 20:12:04 +0000
Message-Id: <20210115201206.17347-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fields scsi_irq, scsi_dma, scsi_reset and fd_irq in
NeXTState are all unused, except in commented out
"this should do something like this" code. Remove the
unused fields. As and when the functionality that might
use them is added, we can put in the correct kind of
wiring (which might or might not need to be a qemu_irq,
but which in any case will need to be in the NeXTPC
device, not in NeXTState).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 3c83b874c56..dd0a2a5aea0 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -74,10 +74,6 @@ struct NeXTState {
     MachineState parent;
 
     next_dma dma[10];
-    qemu_irq *scsi_irq;
-    qemu_irq scsi_dma;
-    qemu_irq scsi_reset;
-    qemu_irq *fd_irq;
 };
 
 #define TYPE_NEXT_PC "next-pc"
-- 
2.20.1


