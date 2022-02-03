Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237274A8E9F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:38:51 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFisU-0002hY-8e
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheP-0002wm-Ic
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:14 -0500
Received: from [2607:f8b0:4864:20::434] (port=42993
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheJ-0002YU-7f
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id i65so3017702pfc.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LTnoR1/7ie7sT/Lak77TlJ7qUxuvOUu3DpitIJDnHP8=;
 b=JHFZ4hGZHuhRDa6FP/+X2WKRc7jYvDjI8GaUtV/zcCGur9lax2cjeqJ05DG2Qmd4lt
 xI+uxuC6tuCLBR8lEM9h+oqPHVk8N78WeTfz+xzdpyyApV3HslN0bBg/9+FB9xwVHKy+
 rSW5RCUUPujc47PjQXMoalaQwfvWGPqOa41+EizP613FLH3TzEgqJ5Ne3bSr+SWv2EwZ
 wlZvY2lJKcr5wXYjRjZUqy3k9rDek5wqFL8932yNlOSPg/1DvHAG9QTo2GypVEb2WQ/d
 nJA75QblksDb/P1AEs4Gli4pUhYMbARSYkJkWUlEMXsJqmNo+FcWwGl30YveSvPNtfYq
 SATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LTnoR1/7ie7sT/Lak77TlJ7qUxuvOUu3DpitIJDnHP8=;
 b=EtJuPVpAJ+JANfzzbTJW2Vlfsw/lEoIog9KNjw/I3ds0PURkQyo0aHXQnoF/ZqGBER
 8l8cl04VdHbNxXWu3fLqUxKocs1NpcU/aPS3fFxZXHKPfBkfrFMQw18kzVMC7bQk5p/o
 +0l1ZsR1/NRwsTTc3NtBVR/0mKi+CgD/tOx7J8DIUUB9/RnIiHa1VqXzL8lH2FvKpsrQ
 XzkG9P0O6v9nURej5pcTecNbF0NZg3+rOB/fN5dBioRsA8bqTZppcbD3kAw+gw4Oqin4
 YNuQtg1WU7/6125sd9jd2f8EHH5moDZnY3gNxGBKWXcBtmRBeaKyUgw2qBs+mFSIDbiV
 BCLA==
X-Gm-Message-State: AOAM531S9C1Q73S9LaY2mDO5lmBl800zbyLHVxA0IcTQcO1NXAgZlmsH
 yflIWsupcuvwe1K3pZXS5IxujK6DKzY=
X-Google-Smtp-Source: ABdhPJz9ucAurLbbLOoldzljJ2p1ROBeESc5bHj7ym0OejeOaeIK0syVXnpgMOEWFMDcFHEG2YqfbA==
X-Received: by 2002:a63:2a92:: with SMTP id
 q140mr29357328pgq.379.1643916003793; 
 Thu, 03 Feb 2022 11:20:03 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 10sm29615630pfm.56.2022.02.03.11.20.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:03 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 13/21] softmmu/runstate: Clean headers
Date: Thu,  3 Feb 2022 20:18:06 +0100
Message-Id: <20220203191814.45023-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Add the missing 'qemu/log.h' header and remove the
unused 'exec/exec-all.h' one.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365a..3cb2758b33 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -30,7 +30,6 @@
 #include "crypto/cipher.h"
 #include "crypto/init.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "hw/boards.h"
 #include "migration/misc.h"
@@ -44,6 +43,7 @@
 #include "qemu-common.h"
 #include "qemu/error-report.h"
 #include "qemu/job.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "qemu/sockets.h"
-- 
2.34.1


