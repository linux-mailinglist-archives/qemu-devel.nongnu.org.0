Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D13A2E6D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:39:46 +0200 (CEST)
Received: from localhost ([::1]:45970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLqT-00050e-9X
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrLow-0003f0-IQ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:38:10 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrLou-0004MB-Uc
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:38:10 -0400
Received: by mail-lj1-x22c.google.com with SMTP id z22so5212660ljh.8
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O0gBJMrpiELgsCsym6mzXOOEJr+lQDvkgWLbBVsNK6Y=;
 b=nwC2MgVmEWUosxWglLAejO7168DqU8Th7X2J1EnR2Qb9NTpo9iYGs3q2QdZeZLKN+T
 4V0AjueJ7iJuzBtMwa1bH0lxb5GL5a6fFNK4HbmjnRMskpSYMObY7s77tKb1sGDzV1+7
 wM0P8M5r9ScJmHT/cQAfLbsslmhDtbU/5456esSNrFKhnzDnpNteMzqZ/q9P2SHVQCS9
 CpDDWtGEd8qU7AJ7y1fAKdyX9NQ3SAbAVTg1FWZLVPQ7GjV6LVe39pT2YHaR510t4Mh9
 LqN0/envlc0XcFC+p3YWMf4au5Mj4cnHSNZQyXBA8VW5JOU6HqcJ1z8UYAEENP4QoAlf
 3GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O0gBJMrpiELgsCsym6mzXOOEJr+lQDvkgWLbBVsNK6Y=;
 b=Epx1dyeSJS48Lk5+H2og0oFA7nxHIm1emcV+EfL85oGeFyfX/a5nO7w34xpZt6KB/R
 5dWXzuOcPImpUYaCGPUPpuiQs/UetASYx1VF/MpY5W9Ax7E8ZGSEnpTuzxOExyZ3YwRA
 ZDj2K1DpLDW0qDQj/NNpFWxfk86iP+we0suBm0hNz4Lh0S1+prkTMIx2F/mS0UxEQINv
 sq3VwYpbOzKRYZldDnLToL355cU5WijUoM5NmA7N5Cd3NtVZQ2KKnQbrsraY1DkbuQlR
 EQgORGAbvA2+fwgvwVHJQ4QO0VO24Oh/VPaiPR81sDSVW1hDFf8zl/PSGy2UfVaJiH9g
 3d0Q==
X-Gm-Message-State: AOAM531Xn80PFuzqHRAlnb+YMAnj06IYX1SX+JmcL39mQL3vRv45ofZZ
 Kpdmhabfh2TmAEFLSN1zdVuj4QAT5v+gHuX2kk+KBA==
X-Google-Smtp-Source: ABdhPJz+zk18g6J7n+zjfLMLtXZYPy0ztunbRrlOdkAeYV8IZE/F/zxcs87JeO+xOgUBmOR71s2b8g==
X-Received: by 2002:a2e:90f:: with SMTP id 15mr2491241ljj.277.1623335886421;
 Thu, 10 Jun 2021 07:38:06 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id i130sm313497lfd.304.2021.06.10.07.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 07:38:06 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qga-win: Free GMatchInfo properly
Date: Thu, 10 Jun 2021 17:38:00 +0300
Message-Id: <20210610143800.3293854-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22c;
 envelope-from=konstantin@daynix.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The g_regex_match function creates match_info even if it
returns FALSE. So we should always call g_match_info_free.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 300b87c859..e8bc3df306 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2497,6 +2497,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             GMatchInfo *match_info;
             GuestDeviceIdPCI *id;
             if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)) {
+                g_match_info_free(match_info);
                 continue;
             }
             skip = false;
-- 
2.25.1


