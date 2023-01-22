Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C626770F3
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 18:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJdor-00024f-Vy; Sun, 22 Jan 2023 12:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdoq-00024W-UT
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:48 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJdop-0005UN-HW
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 12:07:48 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz11so25222377ejc.0
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 09:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNV6Luq8syOfSpRqKm0ADXQJug9isKXJJADcOVA5Ux0=;
 b=caW6mi1ohgqp2yEKlFZundMAn+Ll1ggZcRNmwy0ogwvXNEY9yAT/uLXMq5NpnLNUKq
 f06Ayp6LDVUZXmIssG6v+1hqNWbH3Fdkz0Qa6Asl4dsrvH9ESrdNPWO8r+VhN0KcUqg3
 pTSdAQ7fycGUG9Tat0EbBEH8d6VxNiBxRfpdUOVhL6+S4xyljuTIbEB95iqxAk8p8p3u
 2XW6KpLud9d7OZJnfwSNdhtbwpr4s0A4E/loqLgHu/I1t2jz8qaQxUmCJv/tOVOP1iC8
 0MfoZIuTXrJKI0nfSpjFIPTLO9enOZIkztCzYRxe7i/zOP/G25mhWwdFkEoGlBUulJSl
 d3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNV6Luq8syOfSpRqKm0ADXQJug9isKXJJADcOVA5Ux0=;
 b=eOIA63KFyzO4KaxhJgMQ2dpyemaEsr3m1pRYaycjFC72cCSly6EEhD+eaGIOHvGN++
 Fd29Zeae+BYfA1mt2hgVpWiNeantgGbRF3GF25UowZ1OqlJ7V7nyQADcU5ALdTEQCQ0G
 GjKqIiLgC870mby4FJjj57Wj5cI4lLL7Lg4rhkKNHXqulTgAfc7PLw+/ozg966kbNmpL
 S7I/KE1gSmtZhI+P4tg+UsfiXxgBPn5RPqUhE65IDl1uT4+l/SWEiFvJ1sFj0aWRRxSV
 bZt2OnHYIlfOh9s3/+lvg1MR6zMx+lwifVL0guS0nCvGZb3VG86WQ1qldYUS9JN1jIF4
 k5Ag==
X-Gm-Message-State: AFqh2krVz6wGnNJSWWOHA5v/sEolDMKNyj58ih25pnLBIX5FYJaLhbHS
 PPulNvV7rhSYDqJbwqtvguqB1mD0YQcqDQ==
X-Google-Smtp-Source: AMrXdXtw6Tn2+Jme9sKZ5QYtBiHeX9tkcvCWYNBeKGbgMFrGx3/Gb56jTLY+WYde1Rd02JPwQwcdgg==
X-Received: by 2002:a17:906:4f93:b0:877:61e8:915a with SMTP id
 o19-20020a1709064f9300b0087761e8915amr15642627eju.75.1674407265986; 
 Sun, 22 Jan 2023 09:07:45 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0084d397e0938sm19670453ejc.195.2023.01.22.09.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 09:07:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/7] hw/acpi/ich9: Use ICH9_PMIO_GPE0_STS just once
Date: Sun, 22 Jan 2023 18:07:21 +0100
Message-Id: <20230122170724.21868-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122170724.21868-1-shentey@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Cosmetic change emphasizing that always the actual address of the gpe0
block is returned.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/ich9.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index f8af238974..40a20e01ea 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -348,7 +348,9 @@ static void ich9_pm_get_gpe0_blk(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
     ICH9LPCPMRegs *pm = opaque;
-    uint64_t value = pm->io.addr + ICH9_PMIO_GPE0_STS;
+    uint64_t value = pm->io.addr + pm->io_gpe.addr;
+
+    assert(&pm->io == pm->io_gpe.container);
 
     visit_type_uint64(v, name, &value, errp);
 }
-- 
2.39.1


