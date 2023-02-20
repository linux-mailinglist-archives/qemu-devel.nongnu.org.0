Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290F69D049
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:07:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jL-0001Ri-TG; Mon, 20 Feb 2023 10:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jK-0001Ra-53
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jI-0008Mc-ER
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg37-20020a05600c3ca500b003e21e018039so2126555wmb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alpgVL4TtkFnvxglkaFOS7JafAYOgPwJn2AublwKwWs=;
 b=ASchb6AsemQJip8loRYisB7hEyV3yfrzaLMvvDJY1aJ/cJ3LAXXz48FtKkQbY3ckBs
 kWZbJjVVs2RZez2+tr/3EvLyINbeF5wsIM++U7qV6XuzOG7pKDqC/dvua0g1vZHz562B
 guKLHgtFb1OBBNROHoD3UIVPwDjYxaNCcIdzx+pmKPeEEV7AAR+OwRj+5VmEsUFLbW8I
 BGUc/9gylvWpt3Kim0uAboScpaWW8fAc+9Pqn6eDhnCPWSynfe0Vb5bvFOJjMR6jjdQi
 K17X6+aWIbBqu5g2pg8BVzYh2H61DFq5H0+lO0oO2gc/EgxD4f54P+wTD0AhoBhNtQMr
 enHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=alpgVL4TtkFnvxglkaFOS7JafAYOgPwJn2AublwKwWs=;
 b=PVc3+Q8ILBMSwBc5zN+QQAS9H37fbpbC6g4S42kk2o+h5Lrr/D3ZF+ncI3WvHNi/qC
 2V0WYUdRsgxkXMxBWylj/+MV9MWiX67h4+zs/SjJdedj4DEsLO2GEw+uhfBbHWkYzLrm
 rS5/8/peQBgBqFIo0TXw56OAFY1TWYaRbCO2CmqdHtjdSkUhhXKuSDEfC7O3jvniHiHF
 PVJo1/K0y/dyC1CET/qjAoSZoMWsm2Q4k/3LFapJJGoY4luTjPB5KeAwJpOvdFDDhlvR
 tjfSl0kjN2T3KjSaFo6gv8YFAhnc+FV+UEX6Df+/AUFzzuguWP7UnOHAt91YLpnzQB3Z
 eRyw==
X-Gm-Message-State: AO0yUKWeC0CUWZ/3X/N5zCbzlMhKi/tn3W5OSAR2FwKg3JJR79fycWIU
 LTkXnfUgmPFWgaG01H9jDY9cHN/YhkZERJEf
X-Google-Smtp-Source: AK7set8K2Q5CNWjg2gQD4DALKpuAKJ/rvI/9nVNu9r5ZfCu5VrtKTuicUeC/2X7mdrQmrt3ZkE8Mrw==
X-Received: by 2002:a05:600c:164a:b0:3e2:668:3ed6 with SMTP id
 o10-20020a05600c164a00b003e206683ed6mr267883wmn.2.1676905522896; 
 Mon, 20 Feb 2023 07:05:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm1370643wmo.15.2023.02.20.07.05.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] hw/usb/dev-smartcard-reader: Avoid forward-declaring
 CCIDBus
Date: Mon, 20 Feb 2023 16:05:07 +0100
Message-Id: <20230220150515.32549-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

To avoid forward-declaring CCIDBus, declare CCID_BUS QOM
definitions before its use in the USBCCIDState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/dev-smartcard-reader.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 28164d89be..be0a4fc3bc 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -278,7 +278,9 @@ typedef struct BulkIn {
 struct CCIDBus {
     BusState qbus;
 };
-typedef struct CCIDBus CCIDBus;
+
+#define TYPE_CCID_BUS "ccid-bus"
+OBJECT_DECLARE_SIMPLE_TYPE(CCIDBus, CCID_BUS)
 
 /*
  * powered - defaults to true, changed by PowerOn/PowerOff messages
@@ -1174,9 +1176,6 @@ static Property ccid_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-#define TYPE_CCID_BUS "ccid-bus"
-OBJECT_DECLARE_SIMPLE_TYPE(CCIDBus, CCID_BUS)
-
 static const TypeInfo ccid_bus_info = {
     .name = TYPE_CCID_BUS,
     .parent = TYPE_BUS,
-- 
2.38.1


