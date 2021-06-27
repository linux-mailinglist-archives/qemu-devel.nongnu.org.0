Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0403B50EE
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 05:29:52 +0200 (CEST)
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxLUU-0003mm-O9
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 23:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lxLTc-00036H-Gt
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 23:28:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lxLTa-00063T-LK
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 23:28:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id g7so11254391wri.7
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Zubl8mgJImZll2lQi+hFnjquenEVGAsVZioeT3sF1Kc=;
 b=Dbc4tdmqqhiQHcEDFyc1vgs5CkM0iBEIXDVRBQphaovB6Tx1PAGX6BIgS43R3hh41/
 C9JVKpGsToHgx5uqUMqmR7KPECDMy/0EaSjI6/zbYQerMhXWgeGWO5rUYWJlrhPDXY6c
 lEb5d8WSgJAyatAIdtMoXejdxr7SmDkjMjfXkUGzmYqELWXl4TdScVzGnr5HbK2bWeI5
 W6aavMYVz0eVHdFrTK+9wzEhrm3lNOUoLE+Q+FteYfuWeaMlarpuD3AClDvAeF0/i1ek
 6xeFLNNwqVjLEhPu87crYd3WOoPh2AHIaqevnfqMFIcZEkuTm6JRyubzWDyFBweOd6p6
 4Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zubl8mgJImZll2lQi+hFnjquenEVGAsVZioeT3sF1Kc=;
 b=TOsJ3Av9+7W3f5KJy+/wmmPipe3RyepbJvsMNpcQIJS7rPiMePidttUv/j0Mj1Gnig
 TuZNqOizvngj5e77oKuXE+0zf/OT0LYhb78sMw5IlZ0tqy6I32gZiLjh85dAXeaTSo19
 75C1pewiCNdKY56K/Nt5d/7aJ2KNK8zXl53T8d+7VWMHd9+Dmzzzptonpvtp+NAM7x8R
 YdM73eCESwXU38W7HmGkqp3YiR45vIbWBIvZgnsVVv9adfGN5DnfdsXWcUmjdPuIpMru
 uS+5geHxtashikcGz2bxH13fd17sZRKTCVUbi7Ba8PFUlPtnArq0gUQoBP1oDl9hDfzu
 cegg==
X-Gm-Message-State: AOAM5319cna5zcn03trOEJt5DBFz2xoovkkzu4vEKQdsRvPUXSrQrC83
 go7PAVOF5dsJtcfX3WJQiNo=
X-Google-Smtp-Source: ABdhPJx3NuSYdFoPe+QI6GurMzsDocn7NwV/FnrgytfoFEmpC8HRnRR77lg7xdYtt13elDgafXhdmQ==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr13838985wrn.248.1624764531838; 
 Sat, 26 Jun 2021 20:28:51 -0700 (PDT)
Received: from localhost ([147.78.177.108])
 by smtp.gmail.com with ESMTPSA id c12sm10003795wrw.46.2021.06.26.20.28.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Jun 2021 20:28:51 -0700 (PDT)
From: Qiang Liu <cyruscyliu@gmail.com>
To: 
Subject: [PATCH] hw/usb/hcd-dwc2: Enforce epnum to 0 for the control endpoint
 to avoid the assertion failure in usb_ep_get()
Date: Sun, 27 Jun 2021 11:28:26 +0800
Message-Id: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=cyruscyliu@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Qiang Liu <cyruscyliu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When eptype is USB_ENDPOINT_XFER_CONTROL and pid is
TSIZ_SC_MC_PID_SETUP, usb_ep_get() should return the control endpoint.
In hw/usb/core.c, the assumed epnum of the control endpoint is 0. When
epnum is not 0, usb_ep_get() will crash due to the check assert(pid ==
USB_TOKEN_IN || pid == USB_TOKEN_OUT).

The description
http://www.capital-micro.com/PDF/CME-M7_Family_User_Guide_EN.pdf
(18.5.3.4 (14), 18.5.3.4 (10)) a) mentions that the pid is maintained by
the host, b) but doesn't mention that whether the epnum should be 0 for
the control endpoint. However, usb_ep_get() assumes it is 0. To avoid
potential assertion failure in usb_ep_get(), we could enforce epnum to 0
and warn users.

Fixes: 153ef1662c3 ("dwc-hsotg (dwc2) USB host controller emulation")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/usb/hcd-dwc2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index e1d96ac..65d9d46 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -636,6 +636,11 @@ static void dwc2_enable_chan(DWC2State *s,  uint32_t index)
     }
 
     if (eptype == USB_ENDPOINT_XFER_CONTROL && pid == TSIZ_SC_MC_PID_SETUP) {
+        if (epnum != 0) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "epnum should be 0 for the control endpoint\n");
+            epnum = 0;
+        }
         pid = USB_TOKEN_SETUP;
     } else {
         pid = epdir ? USB_TOKEN_IN : USB_TOKEN_OUT;
-- 
2.7.4


