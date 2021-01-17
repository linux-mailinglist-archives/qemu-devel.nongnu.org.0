Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDEB2F94EB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:33:43 +0100 (CET)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dny-00065V-Qe
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dga-0008Ey-J3; Sun, 17 Jan 2021 14:26:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgY-0005Lz-Sy; Sun, 17 Jan 2021 14:26:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id c124so11718468wma.5;
 Sun, 17 Jan 2021 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRYX7wbIVKKy2xsQ0SOHg/10f2SElgXUvILpXN/GlbY=;
 b=lpPEyFuXuoafu/yi/Nqa55IIFSScEH1LM1s99Q2JEy5YXrYuZYLY1/LVTSuU369szr
 GG91IPMKGJStj2z43+4segzsyxdD31ASCqPzMDsVM1obfyhx4L/d94P+/+M89uwZbauA
 n3UWb4wcvZsd+7/zRF0MDjCHwjR2jzzZIeaMHe3sUqEfGIYnrlF/NBjAnh64oLilH4M5
 ffEGLK2HAq/Ax9odiPh5vQtVKvwylVFWC9pH+5G6doaOAxUzKycwsNvJm+SsXr5vl5pa
 hga79J2/seUXvJNkyrSiJmto2tiMe7Y6HfoYywf3sp5SlAcCRei9UHD8DoswqWR0AN8z
 nDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DRYX7wbIVKKy2xsQ0SOHg/10f2SElgXUvILpXN/GlbY=;
 b=jDeCf3lja3Hb5QncILWfM41RN6wD3tn/Y3b0rQIj3MJFRmSLpo2q909jKZNepu9LO6
 /oa9iXny4Z77aouduXYYXO3JSIPErXmiawVB2TB3M5qO+LtRVxs6Mfp+cQiHT0jt8yRk
 5tcYZGNZkj1jpipknwKFuxO2OZKciCtH4pSUxzckXcW/nRX1AkFx2i3DA92MW1u7cST5
 WEHJ39A2Yd2sY+X0msaUbEMkEmFZ0cYzar9ovF1HgD8BB76GEjFLj4Zt5W0t6Af47gUJ
 C51hYkXgLrnCGGtb8spx2NRHmHp8tu6WGp1+Ofy1HGsJNNLrKdm6I1oZgnJissXkWqvs
 tSbQ==
X-Gm-Message-State: AOAM531947AiNRa/FyF3mHjkfJ+WK867nSvOEmT57AlfzwuII5iwO1Ls
 M/Bpuaxn/xPt8Bl3uOkCexA=
X-Google-Smtp-Source: ABdhPJy4cdiAJh+fC43tbu5pjvny/oXmQebYPEcKMKLunspdGaFCEQAwtWyCGO89YQa/dK69ZtsPYQ==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr14828497wmg.66.1610911561170; 
 Sun, 17 Jan 2021 11:26:01 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 14sm21096877wmk.37.2021.01.17.11.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/20] hw/misc/iotkit-sysinfo: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:39 +0100
Message-Id: <20210117192446.23753-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/iotkit-sysinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index b2dcfc4376c..8bb9a2ef8b2 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -120,6 +120,7 @@ static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
      * This device has no guest-modifiable state and so it
      * does not need a reset function or VMState.
      */
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     device_class_set_props(dc, iotkit_sysinfo_props);
 }
-- 
2.26.2


