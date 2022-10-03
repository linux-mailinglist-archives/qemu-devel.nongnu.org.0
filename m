Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D45F37D1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:32:47 +0200 (CEST)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofT3O-0008AL-6F
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7g-00022Z-EW; Mon, 03 Oct 2022 16:33:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7e-00042l-Vv; Mon, 03 Oct 2022 16:33:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s30so12488379eds.1;
 Mon, 03 Oct 2022 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=esjrdO6tFoXNdgvQ5sf5q9mcRjXABjPQ0oasuQnbjLo=;
 b=Ke2rzTfMNylrmC+FuF8s2MFomuZWXD8l3jLTc7cNAESJrICBpqyCAw2CmHzAjQ825x
 dKw4I8YDYyWJEif21lFgCzvCkqhx4yYVaei6z/x0Zj0GksU4v9G2gH6kuscbJAqLusbl
 qGWVooDpmyqn3iuksMjnN2gTeDhR/AO9Gwm9QvOF2vMSCRVMb2TeyGm6pOaX4GuUxvMQ
 narH6pAxC4A2F5bFj1TI7Ima/iMRqqPtsAZNvH4jDvQN3rzyunaogbuE490r0K2bzsRg
 PP/7fTjz3puAtgu5lExiCoIYxVFO9IhPuVT9eCQQau1WG3sNh5ivmkN4IxMQn8f9jSmL
 WWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=esjrdO6tFoXNdgvQ5sf5q9mcRjXABjPQ0oasuQnbjLo=;
 b=OaNd7QGj1EFTFziSovF5PqQLOYo21wmrTI90n0WectlQikJGeT7L6L/9KDb4lEIGsx
 JViXCcX3hVz0gf1pMwZzgtFZIhbkQrTkPly1p5Fu+Pvllei2LbmEwKqfIr6uCAxesT6M
 ERIE6nGAqaRdT2PgynFOYT/PE7FyPAtLHUddgKEQPauu37tQXBpa04t3Fjn6MKg542rW
 LLaD8EvNMhgAmPgM7CQnHNf3mo/TtFy77liexEQYqvg6kueCIZNNbA6QAdf8AxKygiWk
 cdAFmtHX7CHTzvKD7YHAqelu1ueZPBVjWacPKeV3+JTwEayPlXmXOGF4RPSrO7xqKoAn
 yonA==
X-Gm-Message-State: ACrzQf1vihqyNF6fCPdo8bIwuubOA/aL4Rz+t3HFvJNTXPMyUv7ZmjgB
 iA84XVYqCnCxLwhnvseJKTN1j/evtIk=
X-Google-Smtp-Source: AMsMyM7QJY+tawzLtVodSKUEXCGCqhPA8YqsxxvULghsVqw9UyhTEWlU6bQA3ndFpW21DbzQhnJvGg==
X-Received: by 2002:a05:6402:164c:b0:459:1e2e:e742 with SMTP id
 s12-20020a056402164c00b004591e2ee742mr3630524edx.125.1664829184448; 
 Mon, 03 Oct 2022 13:33:04 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/13] hw/ppc/e500: Reduce usage of sysbus API
Date: Mon,  3 Oct 2022 22:31:33 +0200
Message-Id: <20221003203142.24355-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

PlatformBusDevice has an mmio attribute which gets aliased to
SysBusDevice::mmio[0]. So PlatformbusDevice::mmio can be used directly,
avoiding the sysbus API.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..496c61b612 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1023,7 +1023,7 @@ void ppce500_init(MachineState *machine)
 
         memory_region_add_subregion(address_space_mem,
                                     pmc->platform_bus_base,
-                                    sysbus_mmio_get_region(s, 0));
+                                    &pms->pbus_dev->mmio);
     }
 
     /*
-- 
2.37.3


