Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9049C2FAA48
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 20:36:03 +0100 (CET)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1aJm-0001gG-M9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 14:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1aEn-0007rM-UY; Mon, 18 Jan 2021 14:30:58 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1aEk-0002xo-1W; Mon, 18 Jan 2021 14:30:53 -0500
Received: by mail-qt1-x834.google.com with SMTP id z9so2152455qtv.6;
 Mon, 18 Jan 2021 11:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2HxoCJsV4cAhEeGpi7kZ++Gx8OszeNEjjB9iA94yXg=;
 b=PNK6VWpil6nRSk2qFuvw5jJFpuEi3TMFWten/uqy/n1FQ5AFR/UU/lgUpPPSssE07T
 6mROhVQVSJ5TGN/bn7NOtBLCoythuiOpaxDQDF3ChEX9rMfimmYL0H/DycTe6AQe+Mbb
 nh2ZUPhUUFZEpwnYeReROzsFxh4iD6n/v5dmRGRZmWWeI+DlmRlcyleF71zhpC+o3mOJ
 DLSn5RTYABnXQAjEbCCqdeIunNa7NgQcdF2WIvo9i4UMFhlEh0mKKlZ4WDe/NSi4/DGZ
 Bu2QD8QLJornrKax47Cy8ftzIdPVpVgFlg7VFp7yFv1URDE3tZrdPRE8pt5SdmNix/0Y
 ZOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2HxoCJsV4cAhEeGpi7kZ++Gx8OszeNEjjB9iA94yXg=;
 b=QNf7edPAfcTE/x4tDUvZcIZ4ORvC3W2FaRI7i1eAsOR/LQ4iy4hz92cymJT7Da+urm
 UMaJbBED+mrpf++XINrjDoZgtezUbEDEYNAuCdxAORSLppg75OyQj3QXq/ZkLpxS2O4o
 c4JA/gwQa2TIaaVZ91XW3kztCyDdzUYWHnG+ayF7uDn7+FVmptyuhHMgLd8RiqOwY9lk
 ggaklSUCC+Q/pFaeRPqdoSsckYiuMJEEEOVCYLWXJYCzaHi3ChU0Zf/aX9R4Fxkh+X2I
 QPS3xJnqrGCiNctwRrsnL+pacuCTjJhZCL5tGlE+BRUgeP4knj9ZF7wZLafFt1hIiCff
 Xnhg==
X-Gm-Message-State: AOAM5337eqiZqhAlzYpukRpkn6SFvKF7gQy2PBORfXw9iQIA80M+tVur
 WQ7fSc42z7SsmC1hNYe23dx4rI9c3sNUlg==
X-Google-Smtp-Source: ABdhPJwr0hVl5tJmNV3BHs1t/85MBgWZn2lv3X2FJWOU5PzdrrlxCkO2OllKlcDfMP8TlpyXwuQnnA==
X-Received: by 2002:ac8:4801:: with SMTP id g1mr1119298qtq.44.1610998248327;
 Mon, 18 Jan 2021 11:30:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id d25sm11458195qkl.97.2021.01.18.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 11:30:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Date: Mon, 18 Jan 2021 16:30:35 -0300
Message-Id: <20210118193035.2089474-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118193035.2089474-1-danielhb413@gmail.com>
References: <20210118193035.2089474-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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
Cc: Xujun Ma <xuma@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
requests were breaking QEMU. The solution was to just spapr_drc_detach()
once, and use spapr_drc_unplug_requested() to filter whether we
already detached it or not. The commit also tied the hotplug request
to the guest in the same condition.

Turns out that there is a reliable way for a CPU hotunplug to fail. If
a guest with one CPU hotplugs a CPU1, then offline CPU0s via
'echo 0 > /sys/devices/system/cpu/cpu0/online', then attempts to
hotunplug CPU1, the kernel will refuse it because it's the last online
CPU of the system. Given that we're pulsing the IRQ only in the first try,
in a failed attempt, all other CPU1 hotunplug attempts will fail, regardless
of the online state of CPU1 in the kernel, because we're simply not letting
the guest know that we want to hotunplug the device.

Let's move spapr_hotplug_req_remove_by_index() back out of the
"if (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
'device_del' requests to the same CPU core to reach the guest, in case
the CPU core didn't fully hotunplugged previously. Granted, this is not
optimal because this can allow for multiple hotplug events queueing in the
guest, like it was already possible before 47c8c915b162.

Other possible alternatives would be:

- check if the given CPU is the last online CPU in the guest before attempting
to hotunplug. This can be done by checking 'cs->halted' and msr states of
the core. Problem is, this approach will fail if the guest offlines/onlines
a CPU while we're in the middle of the unplug request, given that we can't
control whether the CPU core states will change in the kernel. This option
sure makes it harder to allow a hotunplug failure to happen, but will never
be enough to fully avoid it;

- let the user handled it. In this case, we would advise the user to reboot the
guest and the CPU will be removed during machine reset.

None of the alternatives are clear winnners, so this patch goes for the approach
makes the IRQ queue of the guest prone to multiple hotunplug requests for the
same CPU, but at least the user can successfully hotunplug the CPU after a failed
attempt, without the need of guest reboot.

Reported-by: Xujun Ma <xuma@redhat.com>
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9e3816cd3..e2f12ce413 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3737,8 +3737,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_detach(drc);
-        spapr_hotplug_req_remove_by_index(drc);
     }
+
+    /*
+     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
+     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
+     * pulses removing the same CPU core. Otherwise, in an failed hotunplug
+     * attempt (e.g. the kernel will refuse to remove the last online CPU
+     * core), we will never attempt it again because unplug_requested will
+     * still be 'true' in that case.
+     */
+    spapr_hotplug_req_remove_by_index(drc);
 }
 
 int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
-- 
2.26.2


