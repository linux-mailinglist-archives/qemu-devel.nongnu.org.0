Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111022FC1FE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:11:54 +0100 (CET)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yI4-0002ti-VU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1y5F-00008m-Jj; Tue, 19 Jan 2021 15:58:37 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1y5E-00049F-0G; Tue, 19 Jan 2021 15:58:37 -0500
Received: by mail-qk1-x729.google.com with SMTP id 186so23318410qkj.3;
 Tue, 19 Jan 2021 12:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQQQ1w3TCupY77ZAhJxeAV6NLr2IxqNDGhZAWKFyIDg=;
 b=IAVeG9Wo+G6GZSpdOeVZCZiAhhDfxxTd/L8kdW8x8g2e3TUZJ9Mf6T4LWa0CGXxtza
 Ttkq17F1Fb4QhC+vjYWx7EtAp8rEwVRnT4IlkWjeYwLB+xDHeMWt8B2zMMjb+8jYL0Uq
 yjPX9yWgy37NCMA9rtsnrKLlrNyfdf5acjNfsTAqFfMiUv9me7W33P2Anood31USQG9o
 zyXuCu/doD7gdkGuOvHap+et0OBI8XTu7wCDakoruTDrvcC2NWl/wjBNNEJbU9/GaIxN
 buyznKhmIYa69ImgLgs/n8x+nEjEeoy22EXSmxPK2fd2A2miFzTz0W/BN9HoQZsg63jm
 PPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQQQ1w3TCupY77ZAhJxeAV6NLr2IxqNDGhZAWKFyIDg=;
 b=t9fylN3JgLVtACGtgl9OXHflmUq5IB0s/FQ3dpMMdmZ1CvGIW+Gwyv+1gs/dh0lT1x
 8Nq2qz7I5c5ChMZeoIw/Cye4qFCN7PL2pNODRwUJjjqQIP9JVYCnVoJ6Nap5NASA4BOO
 KHFQLSn1QuJO/bNrte/3xNsxTBlPCQnIQTDVjTetGKzLkoE3UNEYh4NqLxw4/viIR3nA
 9RLY9ZAbIcqh1y9ziWS90kmZOs9cf0w4TlVrgtp3dFT5OL8zDy1myMFE9UGjrtc9KFq3
 JU+YhqRCY9NoQ4hOIQbedGIlWKUC6Bgiytqtc40S1/IneuxNXinkC4l8/wf5h02apDH/
 ZwUw==
X-Gm-Message-State: AOAM532NUly1PipXdvzg1rObCc+1dED93JT2HlfhCp2VBhKa8lfmeYaD
 p+0nThV56ITnFGQzwvKh4GOjxLPduiQ=
X-Google-Smtp-Source: ABdhPJw81Xom8clF7OQK7/mjXDp6MaaCU0ZGQrOsbAEtb+JSM1Y/TqUafVXFt7gCr/FFE8PllenekA==
X-Received: by 2002:a37:bc07:: with SMTP id m7mr6324548qkf.438.1611089914245; 
 Tue, 19 Jan 2021 12:58:34 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id u1sm4720405qth.19.2021.01.19.12.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 12:58:33 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] spapr_caps.c: disable KVM specific caps when running with
 TCG
Date: Tue, 19 Jan 2021 17:58:24 -0300
Message-Id: <20210119205824.2222801-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
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

Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
when introducing cap-ccf-assist.

These warning messages, although benign to the machine launch, can make
users a bit confused. E.g:

$ sudo ./ppc64-softmmu/qemu-system-ppc64
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on

We're complaining about "TCG doesn't support requested feature" when the
user didn't request any of those caps in the command line.

Check if we're running with TCG and change the defaults in spapr_caps_init().
Note that this change doesn't impact backward compatibility or migration
to older QEMU versions because we never activated these caps with TCG
in the first place.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_caps.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9341e9782a..53eea2b11e 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -781,6 +781,21 @@ void spapr_caps_init(SpaprMachineState *spapr)
     /* Compute the actual set of caps we should run with */
     default_caps = default_caps_with_cpu(spapr, MACHINE(spapr)->cpu_type);
 
+   /*
+    * These are KVM specific caps that TCG doesn't support, but will
+    * throw an warning if enabled by default (see 006e9d361869 and
+    * 8ff43ee404d3). This behavior can make the user wonder why a warning
+    * is being shown for caps that the user didn't enable in the
+    * command line.
+    *
+    * Disable them for TCG. */
+    if (tcg_enabled()) {
+        default_caps.caps[SPAPR_CAP_CFPC] = SPAPR_CAP_BROKEN;
+        default_caps.caps[SPAPR_CAP_SBBC] = SPAPR_CAP_BROKEN;
+        default_caps.caps[SPAPR_CAP_IBS] = SPAPR_CAP_BROKEN;
+        default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_BROKEN;
+    }
+
     for (i = 0; i < SPAPR_CAP_NUM; i++) {
         /* Store the defaults */
         spapr->def.caps[i] = default_caps.caps[i];
-- 
2.26.2


