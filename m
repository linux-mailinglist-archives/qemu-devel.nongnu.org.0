Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070164B546
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54WA-0001JV-IB; Tue, 13 Dec 2022 07:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54W7-0001HN-NW
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54W5-000640-86
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:14 -0500
Received: by mail-wm1-x331.google.com with SMTP id ay40so8186295wmb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAS00uDwTnX0iz6OiEnof4qv+85R5FD/5UPI6Ha2V80=;
 b=lQmDA90DbXEwC7qP5vPds/7EEfMXj/0zvOwqP7kxXmDGx6j9d3G5fJXLl9eVN3Voby
 7N9XLDnv8YW2mE0ZUfC80tjWsajTp1tMWPNqsm2bfIm9lKyRnWmA9PHbpELvM/WJ0nDD
 SaDduq0n3B5HUjsRgR+3CyFagqZYjN05fZ5T7VPL7tdRQ0BujZ6hJYF/EoyT+nzBd/sy
 H55ydNcpEOcoDROHV+kPvDP0fguBIb9JZKbAMePgLuxyHHQuK25RhVlJ192zx2oE/P23
 mTVu+xEKOhWXgNY5Y4wcrdeL1R+mTMHhV2Oau8MdxRaN78GpBLJIMu4DiIOMQgHi84Py
 +R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAS00uDwTnX0iz6OiEnof4qv+85R5FD/5UPI6Ha2V80=;
 b=yOBteEMCs2KvD8It7HIUS6CtIMFlZ4AvTwsUUBw+bYW3ZHt1V/LdC83OL4lHZ9MuTB
 vJ/7oZhQEIhOQSJCkPLUTrMoWFmJBOWjfTQVDKppKCkUwopujny/TRSOf4ExVpCxmbch
 9hSloqONo7KRntyU0w1bX/i+eg4yVub09vBqejiS/NqAH5nNkIR+lzj59Mx4HGD1pKcQ
 A2FbaA0/liNfnMV66n7pusQLKkkvZClAHEwXwPZ/EeESiyzc3r7ujHNftkmuDtT3/qPB
 QW2EqdTKx+SR0FgBuUAK2hcsbeyu3sNAhRAtrufvrgCZ2xY3dv0MBoKs3p7DBFiPQMSm
 mJYg==
X-Gm-Message-State: ANoB5pnQq/xlJhOMws33VZoQRhJGlYwcguvG84gg2YWNpMxuAKUN4ldC
 NF1yeRdnoYmajDsbv/OUJeSQ8TvwLDznsLqg/7o=
X-Google-Smtp-Source: AA0mqf6Q7a99lz4o6i2mZR6Xev5Bo/BCPIkxBFwblJpymEZdQWi+7bcEYuWQEdQoM9waol9RshSezg==
X-Received: by 2002:a05:600c:22ca:b0:3d1:ee97:980 with SMTP id
 10-20020a05600c22ca00b003d1ee970980mr19035459wmg.7.1670934970165; 
 Tue, 13 Dec 2022 04:36:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003cf71b1f66csm12090266wmj.0.2022.12.13.04.36.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:36:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 3/4] hw/ppc/spapr: Reduce "vof.h" inclusion
Date: Tue, 13 Dec 2022 13:35:49 +0100
Message-Id: <20221213123550.39302-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213123550.39302-1-philmd@linaro.org>
References: <20221213123550.39302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently objects including "hw/ppc/spapr.h" are forced to be
target specific due to the inclusion of "vof.h" in "spapr.h".

"spapr.h" only uses a Vof pointer, so doesn't require the structure
declaration. The only place where Vof structure is accessed is in
spapr.c, so include "vof.h" there, and forward declare the structure
in "spapr.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c         | 1 +
 include/hw/ppc/spapr.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 66b414d2e9..f38a851ee3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -62,6 +62,7 @@
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
+#include "hw/ppc/vof.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/pci/msi.h"
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 04a95669ab..5c8aabd444 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -12,7 +12,6 @@
 #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
 #include "hw/ppc/xics.h"        /* For ICSState */
 #include "hw/ppc/spapr_tpm_proxy.h"
-#include "hw/ppc/vof.h"
 
 struct SpaprVioBus;
 struct SpaprPhbState;
@@ -22,6 +21,8 @@ typedef struct SpaprEventLogEntry SpaprEventLogEntry;
 typedef struct SpaprEventSource SpaprEventSource;
 typedef struct SpaprPendingHpt SpaprPendingHpt;
 
+typedef struct Vof Vof;
+
 #define HPTE64_V_HPTE_DIRTY     0x0000000000000040ULL
 #define SPAPR_ENTRY_POINT       0x100
 
-- 
2.38.1


