Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F96A7CC7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGX-0005CK-3U; Thu, 02 Mar 2023 03:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGR-0004yx-Qw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGQ-0002Qj-1e
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5lWbatbxSdF0Y0jI5eIVBSt28ruPy3dHHozV6cb81s=;
 b=Tq8V5H9nxF9pJYp1d0sSpPp+44aqsheKTeWTEqmVM4TC/+SNbq30OstL5NPk1PziT3vidS
 za37uKO3EJ9QvCJ78LNGZSvMMo2UsMV2rl4mlcJHkunVLa9R0/S71N17q0aF/J7/Sv5X0w
 0CSSdAC4ZLzPMeWIn8TTMGTL7pz5njg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-V4_4p-hMOtyYmr-_xXydng-1; Thu, 02 Mar 2023 03:26:00 -0500
X-MC-Unique: V4_4p-hMOtyYmr-_xXydng-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so1919139wrs.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745559;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x5lWbatbxSdF0Y0jI5eIVBSt28ruPy3dHHozV6cb81s=;
 b=IRTnygUMwIA7Vn6LTNgovDM+xwqg6ChKqMOmWhUk5JQa+58xdw5CeEX7Y8+krlk2rW
 ohZE07X98ccuiFp+C9HB3q8y0XQIgelrEyrpNJkiyjA/msSz6RIKPiUzjOtVyoyWHL7k
 aar2r7u4B9z3YuPs2IHKggcJlElaTYylzi6SOUgjF9lPJSRdqLgKQKdAQPqf4iq3/N+0
 EUcetXCmi9AaTI6UV4upYoyJIGjeCgwa8yB4zOp+AjBteN8TTfl/2NhArPVPLlQR4e4r
 gRbkAzSXZ3PtxFlshGCN+EW7Py9jWCH6i44c8JMbzlQY1Jqk5PBT1oQyYpkcjwO2HEBW
 308A==
X-Gm-Message-State: AO0yUKXIwL40rVFjo+XTkmZpH6LBeS+CSmqbuEW09N2EsWgk83GDjJqS
 JLTdBjslX3Jnp0bUD9Uo1fQVSn1xbHSy62fkHyaoOX69A19N1TPJs3prAvIJ7eVEs5GbT/WRd3r
 kKCVz0nzG7DmyLDl+9RHYXS9UgV67CXpW8wCnlS/gninZVFcK5YzsWVMofIaLWMwJqQ==
X-Received: by 2002:a5d:4752:0:b0:2c9:d91b:a6ff with SMTP id
 o18-20020a5d4752000000b002c9d91ba6ffmr7676937wrs.21.1677745559211; 
 Thu, 02 Mar 2023 00:25:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/LhCtEoJhugSrj+Yu3O5mLd6F27j/ZD4fAJSaNTyXQPb6SUeI0SQm++vg9VsZLsl7kQAgndQ==
X-Received: by 2002:a5d:4752:0:b0:2c9:d91b:a6ff with SMTP id
 o18-20020a5d4752000000b002c9d91ba6ffmr7676917wrs.21.1677745558944; 
 Thu, 02 Mar 2023 00:25:58 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm14967284wro.93.2023.03.02.00.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:58 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 28/53] pcie: drop unused PCIExpressIndicator
Message-ID: <20230302082343.560446-29-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The structure type is unused. Also, it's the only user of corresponding
macros, so drop them too.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-10-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie.h      | 8 --------
 include/hw/pci/pcie_regs.h | 5 -----
 2 files changed, 13 deletions(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 798a262a0a..3cc2b15957 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -27,14 +27,6 @@
 #include "hw/pci/pcie_sriov.h"
 #include "hw/hotplug.h"
 
-typedef enum {
-    /* for attention and power indicator */
-    PCI_EXP_HP_IND_RESERVED     = PCI_EXP_SLTCTL_IND_RESERVED,
-    PCI_EXP_HP_IND_ON           = PCI_EXP_SLTCTL_IND_ON,
-    PCI_EXP_HP_IND_BLINK        = PCI_EXP_SLTCTL_IND_BLINK,
-    PCI_EXP_HP_IND_OFF          = PCI_EXP_SLTCTL_IND_OFF,
-} PCIExpressIndicator;
-
 typedef enum {
     /* these bits must match the bits in Slot Control/Status registers.
      * PCI_EXP_HP_EV_xxx = PCI_EXP_SLTCTL_xxxE = PCI_EXP_SLTSTA_xxx
diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 00b595a82e..1fe0bdd25b 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -66,11 +66,6 @@ typedef enum PCIExpLinkWidth {
 
 #define PCI_EXP_SLTCAP_PSN_SHIFT        ctz32(PCI_EXP_SLTCAP_PSN)
 
-#define PCI_EXP_SLTCTL_IND_RESERVED     0x0
-#define PCI_EXP_SLTCTL_IND_ON           0x1
-#define PCI_EXP_SLTCTL_IND_BLINK        0x2
-#define PCI_EXP_SLTCTL_IND_OFF          0x3
-
 #define PCI_EXP_SLTCTL_SUPPORTED        \
             (PCI_EXP_SLTCTL_ABPE |      \
              PCI_EXP_SLTCTL_PDCE |      \
-- 
MST


