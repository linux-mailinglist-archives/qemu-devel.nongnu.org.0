Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A28C2F94DE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:29:46 +0100 (CET)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dk9-00023X-BM
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg3-0007qh-Fk; Sun, 17 Jan 2021 14:25:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg2-0005D6-3m; Sun, 17 Jan 2021 14:25:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id g10so12049085wmh.2;
 Sun, 17 Jan 2021 11:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wX5YisuWL/1kxfpeKOV4oTMHdWldWIq42qYJ2gfj7dc=;
 b=o70zgkLCjTk2UunB4bDarF1cLu3Jbi3yIP7VJDK7c11SrDRhmIV1yLNUdenmCjok8u
 4ADSSGJ6qzqcc5l7sZO87WbUkT1bQekPohWaF331aijg6hXgpjmGh9WGnH6VEgLMQOkO
 mWyu/4neq/W1ekNPxcPHi3H1kTToXfUH9cwmTF23l0OoV5i9Kix8CDi9hXz9MaZxtpeV
 g2Z82AJbxVOrPQUSWdq2cRU6FTqfCJYXIv0kiazkBEZhqiNsOanbpt0RxMRUpDL7zns9
 9oDaTS1eQ5PuTUwHQ4gJLaIVJFurBATIV05O0YiAc1FnEPPcNkONEk2KQC7IDaNn26Mn
 KYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wX5YisuWL/1kxfpeKOV4oTMHdWldWIq42qYJ2gfj7dc=;
 b=Fpk9SIzCyYHNVllfYWtW4JJBig+ZKIdr0G3upcivLqSwera/Qv8eL1P9koP7pJy5Ug
 6NzjHDvE+7nubVxKk2HS3yWiqEb1dqeV/sq6BSaIsKpX4M2e4AW5u0Kr0ZyB8iJR/tPJ
 o8mGZXHXpjJ2oZ4/b/1MC+wQh2v1rCCCgFwJ8i1fWnpUNZVhTVweQjrqLbzXjTXPAu3z
 7U6VO0FtJN0HTsZxcBmTEidqKK14NFxDYH5/x/s9HbIoO5+3YEAnIuEI96ko2pqPLhNP
 YEnG2zezXQxx5nRsXl94bgUCQgSsFzBe2Ym6LiFHqpWr7+r67DdHRlTq9dBeMuwXqMgd
 dywg==
X-Gm-Message-State: AOAM530iPcl5ceZsfzR8+Hq0WpkQG3hP67ghPZFlbcx9jmHTJGrMpWGA
 0GoPlcetrSBglHMNP/Feu9Q=
X-Google-Smtp-Source: ABdhPJw5tInLIHrxS25OFyOXfZ0TxV2j0sp/xO2VJT+x5kdUNjd34M8oQ5/ZX1VSSeyeFHBh8CdBVA==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr17103434wmk.70.1610911528446; 
 Sun, 17 Jan 2021 11:25:28 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y13sm25915641wrl.63.2021.01.17.11.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 07/20] hw/core/split-irq: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:33 +0100
Message-Id: <20210117192446.23753-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/split-irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/split-irq.c b/hw/core/split-irq.c
index 3b90af2e8f9..a7072f922cd 100644
--- a/hw/core/split-irq.c
+++ b/hw/core/split-irq.c
@@ -71,6 +71,7 @@ static void split_irq_class_init(ObjectClass *klass, void *data)
     /* No state to reset or migrate */
     device_class_set_props(dc, split_irq_properties);
     dc->realize = split_irq_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     /* Reason: Needs to be wired up to work */
     dc->user_creatable = false;
-- 
2.26.2


