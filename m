Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE4350B0F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 02:07:56 +0200 (CEST)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRksN-00067I-UE
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 20:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRkpd-0003u9-1m; Wed, 31 Mar 2021 20:05:08 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRkpW-0006do-I8; Wed, 31 Mar 2021 20:05:03 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l13so290841qtu.9;
 Wed, 31 Mar 2021 17:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8ikRSmlHQSCGEs+D1tIHuSQMBWuUxAxcZQYUYE1YBo=;
 b=S0KLocGHNzqMeHdYmBBoU8QvtjgzQszGEXF41Utb66NQz/F418sk2bVCcJyG/JHdh4
 XyE9r1NVedjzFroMEjfz28jwDqhScHOf8RdA8n4lIgws0LKMTMD7XYRw2IFtnWY4XdOr
 hirH7iExXW7oofbLcrUBNnznUL7+dLZpmZzLyIReRLKvontpjjX3CK9H9dmoQGvFxQz5
 LDg9nPg9pslhAuUb2QR4XPYxFqU0ZJULWJpO/e65lP+LAhcvvLqv7pXk84xkm/f898oR
 s7hadavn6SBR+7oBjbgUtcEfnvn9M0O9R7DyYqhJIIpAddGFja1vZsWbpCku4Gsq/cAs
 g5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8ikRSmlHQSCGEs+D1tIHuSQMBWuUxAxcZQYUYE1YBo=;
 b=AxnVYbeUS8EckCACHlTe7W17yYevnx63+OiGTjv9PVVUWcJplX5JiJWUMSj9Y1Pum3
 XJOKf5pyHLMi53sxB2ZE6vmtPq5cxmcIJdJZ5EZkvA/Vtk4e3nXs/eXEKt+1n3IZxyRX
 SDunPwn/SjZUzsY+V1+tEc9CXVJmoR/2Ipadlh5MdVkavnVG//99nRB0ladcS03ltIMb
 L7NdH5fJtI58uWeOqqYil3/rK0nEEMVRUnWdeIHWvoLBPXozHVwMyaGhkC2bsRd2PA88
 WcesVRGjvp7f3S3bszKEc6Ktn2Ls4Rwygq/jFFekl1dJOOhWNtgyl6/TUcoJz4Me57qt
 CP+g==
X-Gm-Message-State: AOAM531eGDIFpASRQd9ZQvpZVJGf+w+K1tYFQjDzcFWfgW6MWDEpO40t
 WQuUMI8AAb6bK0a4CjymL00FWOI0QCK+gw==
X-Google-Smtp-Source: ABdhPJzeoUSK1ql4TdwwQq9xfB1Z6G2RDn50+GQCBMF/+LpN1gurNy1XsEoB8E+iXK/p6mbME7G6vg==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr4756909qtr.209.1617235496965; 
 Wed, 31 Mar 2021 17:04:56 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:e000:6f43:93dd:11a0:93a1])
 by smtp.gmail.com with ESMTPSA id h8sm2346830qta.53.2021.03.31.17.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 17:04:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Date: Wed, 31 Mar 2021 21:04:37 -0300
Message-Id: <20210401000437.131140-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401000437.131140-1-danielhb413@gmail.com>
References: <20210401000437.131140-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
requests were breaking QEMU. The solution was to just spapr_drc_detach()
once, and use spapr_drc_unplug_requested() to filter whether we already
detached it or not. The commit also tied the hotplug request to the
guest in the same condition.

Turns out that there is a reliable way for a CPU hotunplug to fail. If a
guest with one CPU hotplugs a CPU1, then offline CPU0s via 'echo 0 >
/sys/devices/system/cpu/cpu0/online', then attempts to hotunplug CPU1,
the kernel will refuse it because it's the last online CPU of the
system. Given that we're pulsing the IRQ only in the first try, in a
failed attempt, all other CPU1 hotunplug attempts will fail, regardless
of the online state of CPU1 in the kernel, because we're simply not
letting the guest know that we want to hotunplug the device.

Let's move spapr_hotplug_req_remove_by_index() back out of the "if
(!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
'device_del' requests to the same CPU core to reach the guest, in case
the CPU core didn't fully hotunplugged previously.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 05a765fab4..e4be00b732 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3777,8 +3777,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
-        spapr_hotplug_req_remove_by_index(drc);
     }
+
+    /*
+     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
+     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
+     * pulses removing the same CPU. Otherwise, in an failed hotunplug
+     * attempt (e.g. the kernel will refuse to remove the last online
+     * CPU), we will never attempt it again because unplug_requested
+     * will still be 'true' in that case.
+     */
+    spapr_hotplug_req_remove_by_index(drc);
 }
 
 int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
-- 
2.30.2


