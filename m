Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7F31430C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:34:30 +0100 (CET)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F6z-0005S0-9k
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCs-0003jW-KN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:18 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCp-0006Nr-GS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i9so70696wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Byhw7pC7xUaDjfJlJlPSWYHYZDjUaFGH01Y0bppqA6w=;
 b=BtiYG+xq/zFiR6lXVaXKHsWfGOujV+Nrt1BaaAbdlZhqQ9MkOkxbWYjbePUWdkiNt1
 6koggVU+wxgY0g+7j1WZwgOFzQX0gTlUjk7XncFsswhNzwoo/wzmGazmVEMpc3qoIIm9
 2YRMff6aP5jvr8c0hrE15203v9ZEEf9VFvrjC2D2s5Uecv9ysJ4fAwEnvqMR+TkEToGf
 zEmvYEM04D5avskyd2A3mGZn5J8drRifgMGrZMgFIme1X98VP6w+NpMtoCSFi5uZ1ViE
 enIG7j8AkWnL80XjVf9a1hwgEL81VkY/uGuDkU7D5VWNwsm/+BlMW2GSWFuDfHNy00L1
 fhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Byhw7pC7xUaDjfJlJlPSWYHYZDjUaFGH01Y0bppqA6w=;
 b=phtYp0rxGXsVhRaVRdgc/CzqAYSpVpjMxg+xkAlgjP4iXuIRZKCcXxPUQD4rKEKKuK
 uGyA81t0Ogak9pynxvHeKLAFG+8W+SHF2EbrYeiG1peK9ljReNZ8i4e5BpM2lEW66WC1
 P7aCPZVO0DI51xFS7My4aQ3VLTMPCGe2s7AmLQRvDBTCMT7sQiEXfc2Z09YtrkN4YeA2
 bHidqGd2WLEV8bzMZVk6OEPxsXMaFJZRO+nQHL/YQ+PBcFtEYCYhIEp4nIbZ7G1mLvJQ
 uakC4WTZwJkX+/9dLLL5nHy8yORmz4Ed6DdEgUnO7bnl73eAQhkVygOOyd1spDz0MAPt
 4D6g==
X-Gm-Message-State: AOAM531oCsPy2BllJuMQh+Pif/kiy40ZtQ/cBeQ9bqokiN01GptcIFuh
 wM89xp/QvVOeGcmjqC5xCpYhVmg8G+FOQA==
X-Google-Smtp-Source: ABdhPJyvLP7eupO7AEbzL9XLisq1xLND06MWcO64rYvqqPZqrPhVFv7Vz3aK3oROacoUJoRggrByOg==
X-Received: by 2002:a05:600c:4114:: with SMTP id
 j20mr67014wmi.15.1612808654327; 
 Mon, 08 Feb 2021 10:24:14 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/46] tz-ppc: add dummy read/write methods
Date: Mon,  8 Feb 2021 19:23:28 +0100
Message-Id: <20210208182331.58897-44-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add tz-ppc-dummy mmio read/write methods to avoid assert failure
during initialisation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <20200811114133.672647-8-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/tz-ppc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 6431257b52..36495c68e7 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -196,7 +196,21 @@ static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
     g_assert_not_reached();
 }
 
+static uint64_t tz_ppc_dummy_read(void *opaque, hwaddr addr, unsigned size)
+{
+    g_assert_not_reached();
+}
+
+static void tz_ppc_dummy_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    g_assert_not_reached();
+}
+
 static const MemoryRegionOps tz_ppc_dummy_ops = {
+    /* define r/w methods to avoid assert failure in memory_region_init_io */
+    .read = tz_ppc_dummy_read,
+    .write = tz_ppc_dummy_write,
     .valid.accepts = tz_ppc_dummy_accepts,
 };
 
-- 
2.29.2



