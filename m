Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F02F94EA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:33:34 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dnp-0005eK-9X
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfk-0007dV-O3; Sun, 17 Jan 2021 14:25:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfg-00051O-At; Sun, 17 Jan 2021 14:25:10 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y187so12067502wmd.3;
 Sun, 17 Jan 2021 11:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgGk6yPxUB2DXYQxZxUZbUfoW7pWWFaws3b1nVoeQJI=;
 b=bqRm9TOuPkd2JJzuiyB3+fC/IaQmbzS4vjNWsXGFo8+5Mflus030NR2kBkBcyAY/TY
 dX3c8vZ7mTigiWmGz1TjoZtig2/ssKmjq325+fujlQL59FlqKNOSopcsHzOYrOaSepVf
 4cAzYJILLGjz+GqgDA49atJK3MjD4tSF2eM5Ob1d0QiXVE0XTaHHwDfRTva9SAAddjDR
 8on2onc7unLskg1eeRVvy6qMjk+UCmlJZRW1lMCmco3StadumZWmL6EidgQVa2Cci5Ng
 Yxlzv7LoOeScwOMTeFppoXhfkx+A8a+7/anoWV68P/Nc1kWtENblYlvDQGnX8OgnS2Rg
 qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wgGk6yPxUB2DXYQxZxUZbUfoW7pWWFaws3b1nVoeQJI=;
 b=bvJisTFXWKpJ2Sb1f+rIHH9YfUR6OxvqnyyUW+3TcAWUPijTwIvLU6TbngK9nHELHr
 jnH/dF203lKWDqwQXo7no1VMZJDUnapiAOGROwkyjdYZFw3C2PEDIOn7VdbaZiJzYApC
 +dsuN22q8fbyV0oFjXpMZpoDg06+mfUS7BpSiiyvE1M6/P61Sq1FcZZoseS7KpPnEQUy
 DNTzZl3twq9z07eJew2mdWwvvEoFcExyaFEzj2re76o4yoiTiSpLORzbVineKDOQdgxu
 XVliurjkkpc8nZX2CN+P9m9FkeJ3KwC/YoAtLA1qjYh33rTPcLfDc0i12vgHFJLdg/qf
 1Mnw==
X-Gm-Message-State: AOAM531LwC8KxVgqfUzZKnPYPk0yY6pg027Q1qx2RKJheQzUG9BgIEjG
 bSLxugjMBRNgmgrZ9jmH7Ik=
X-Google-Smtp-Source: ABdhPJwpd7o10gr0UWFsvUMmVK3jnwDM/gu8QrHjDx+1/Q3pAUJsv7+0OC7//09bWuFgQ+VEzCWJFQ==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr9888944wmg.60.1610911506845; 
 Sun, 17 Jan 2021 11:25:06 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g132sm7677099wmg.2.2021.01.17.11.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/20] hw/arm/armv7m: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:29 +0100
Message-Id: <20210117192446.23753-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

The TYPE_BITBAND device doesn't have fields to migrate.
Be explicit by using vmstate_qdev_no_state_to_migrate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reworded (Peter)
---
 hw/arm/armv7m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8224d4ade9f..41ac1b88ab4 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -347,6 +347,7 @@ static void bitband_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = bitband_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, bitband_properties);
 }
 
-- 
2.26.2


