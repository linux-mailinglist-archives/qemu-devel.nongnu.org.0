Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC60F2F94F3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:38:48 +0100 (CET)
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dst-00044f-Op
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgH-0007st-Dc; Sun, 17 Jan 2021 14:25:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DgF-0005GX-LP; Sun, 17 Jan 2021 14:25:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 91so14457927wrj.7;
 Sun, 17 Jan 2021 11:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pKKkrFO8F1VopBGRhEeTOsmc/pmqYXz+y2wSUuToQKs=;
 b=abdd41j0opUWZIuUA79sZKaCfzJERrHUNPpBxp+ZHP9t5WKnzb5qJ/cv5+00yp9P3/
 yc4hBydIt/XHqiy2exOUhN60eGoeP36HdCZo/tb1kZCJvZfbjNBQ5WDlyVZcRvcyI8Mn
 WVrMYcYcgCBQCKUobw2r6oXPrKWtBDGPEfQAqzjQ+J4rXQ+ikAhLLjR+5d85ecbEmp1M
 d+KW1onX1CQ5tVeq++cvABJvIN6othWtak6A8KyB6IWpySztCN5T3Cl8yMagC6QUGdBa
 xscbS5h6OHkcwHunFjNt5cUpDuwlGjhavY5pRCoo3POvPzUEBogQ0WUqiBdeYUav7tCN
 Q64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pKKkrFO8F1VopBGRhEeTOsmc/pmqYXz+y2wSUuToQKs=;
 b=r87EdGk6ZaVpDBJ9/Vvco7UeYO30KR6822+Gz2qf491lbAAMkYgUZQLXTpq6UFyaP5
 3fRpb+0/U5E0YwNLaxi1EHejhBPku4tksy325bxurt2oVnsQPoRCoPT0Zwi3ak0VDbQ5
 e8xz7PW1+bReooXmNww7vOMe9gMIWYEC1aEl08ZgUvUkGDulhL7xfMb0ghxcwcIwgbl1
 gM62uuF1rZSMXpqpLFBNE+P5nrAXiU4wiw5cHUavFI9MqWgmRhRjEU599DXqvzL57We/
 Be0bkPfJBbrmiTA034vIMDNGuq1cue4mPanr7Da+qxvVjE/FcgD7yJWqEgI70atGi8t1
 eHzg==
X-Gm-Message-State: AOAM532MxHmrn0Ly043bhgqwLOUepe5sEUKwxTbFDGAIC7CxDd4SIh4e
 k4tRqE+uX5NapBytUP1lx2Q=
X-Google-Smtp-Source: ABdhPJxGbiZ+QMxA8NFrJPa/qsSqN3k1USt0wHaekZ09igWMoTfvqW83Tbzp8QuMl1lP5mFX7q6a0Q==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr22023842wrn.179.1610911539529; 
 Sun, 17 Jan 2021 11:25:39 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d7sm13672923wmb.47.2021.01.17.11.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/20] hw/cpu/cluster: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:35 +0100
Message-Id: <20210117192446.23753-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
 hw/cpu/cluster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index e444b7c29d1..95653a643ad 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -80,6 +80,7 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
     device_class_set_props(dc, cpu_cluster_properties);
     dc->realize = cpu_cluster_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 
     /* This is not directly for users, CPU children must be attached by code */
     dc->user_creatable = false;
-- 
2.26.2


