Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D3468DBE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Dec 2021 23:42:26 +0100 (CET)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu0DA-0001ST-MZ
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 17:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mu0C4-0000cm-B5; Sun, 05 Dec 2021 17:41:16 -0500
Received: from [2a00:1450:4864:20::432] (port=43961
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mu0C2-0005gr-T5; Sun, 05 Dec 2021 17:41:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id v11so18479816wrw.10;
 Sun, 05 Dec 2021 14:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Do+gkwFWgZjsboWWGNyZl6ctAqJWluyDrT9V2L5cqvc=;
 b=akHJoyzEUhZeaihrm5g9629IkxpmGn6OnGILFd0U9jcq+sqWCm+oM0WtykNm1a4LO3
 2vBUAh2hJNkMeX3FIlhTXWmxJP6cE7GoJw+TjgIx9FXIRz44Tw6D9d5w8iyYryBY0l3A
 G7mO3jRALeWnvwvR+plyPxyv9DKrLi/OOvab7HKXS1biPBrzSY38KR5HwrYSs5Exwx7N
 0JgvWdw/D0zhbZAL9tRd/neBmLrrAU2zjzssAvdztHqCQ83Olu9yUgk1LQUgxZTUX8Nk
 48SIG3LNJ8R6n0i+yGUkYICC0GUUNc2WuHRf5F/Ae11FaoypVOKJZP7kAdX49drSWY7D
 4wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Do+gkwFWgZjsboWWGNyZl6ctAqJWluyDrT9V2L5cqvc=;
 b=wxJ6121ahtfzq2kbRPE9ObktXBb5oalFFWVr/An5bSKRfV4q0myTcvN2E5h2rwYSQc
 mfsWEHPT1ccJU60mqZy/ycUznrir00CbqcKbnGkrH5cRxLoijQYxvtBvZFYBiEDQ/lPR
 lhhAlLKeImkXWpeKtrcvOG1gGjtRtRrm1XW5ZpjvGKJMmLk0o8nV2ekP0mHEl0qAeUQ1
 HmXPCoIm8lLujkf20szyJaUBjytSrfiiUxW+tv+Ni/ovSu81HCMX4gFJjlUG0VLLxiXv
 LiOtbVtnkkGudC4IlOu9gHl8UR86pI3LWPBgOSyEtMiiqW3X+7mS1g1ZHhZVZiasWAPA
 nuvw==
X-Gm-Message-State: AOAM530/nhM1Se5e/+UbWG7ps/ZXszkmxITKR5ILZDx/XRDuaonawQ+J
 gIrBcdIohIwV4TevigmH3SQft3hu4Bc=
X-Google-Smtp-Source: ABdhPJxDP5C8N3O5VCSygYwcOhuo93D/LekwtwRP54jWSUgwRXfNyTOuitQgXe8orgiL84YPBiaEXQ==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr38523122wrz.545.1638744072561; 
 Sun, 05 Dec 2021 14:41:12 -0800 (PST)
Received: from x1w.. (82.red-83-50-95.dynamicip.rima-tde.net. [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id n7sm9650403wro.68.2021.12.05.14.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 14:41:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/avr: Realize AVRCPU qdev object using qdev_realize()
Date: Sun,  5 Dec 2021 23:41:09 +0100
Message-Id: <20211205224109.322152-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_AVR_CPU inherits TYPE_CPU, which itself inherits TYPE_DEVICE.
TYPE_DEVICE instances are realized using qdev_realize(), we don't
need to access QOM internal values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/avr/atmega.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 0608e2d475e..a34803e6427 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -233,7 +233,7 @@ static void atmega_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     object_initialize_child(OBJECT(dev), "cpu", &s->cpu, mc->cpu_type);
-    object_property_set_bool(OBJECT(&s->cpu), "realized", true, &error_abort);
+    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
     cpudev = DEVICE(&s->cpu);
 
     /* SRAM */
-- 
2.33.1


