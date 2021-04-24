Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A136A239
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:51:55 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLVa-0002no-KG
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3f-0000fY-G7; Sat, 24 Apr 2021 12:23:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3e-0004QM-17; Sat, 24 Apr 2021 12:23:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id g9so35399398wrx.0;
 Sat, 24 Apr 2021 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YeGCMDACSQTp0mRPeTtaNv5FzsBb7YC30+puu/9npP0=;
 b=XuLXwqSX9rVMrGPsE/vDcT0Whkr/0C2J8zlWGD7B0VMbvH/uZ5A8x2YeEgS5nly5R7
 KRHGCwZwYIbloJ8L1a8KRyX4+3c8Uv9XPbBiwKY1EOW6+1/6oUvPjpfanmxx2EsD+MeW
 d9xaBbrD5if6RI8hTDpX8YIJwhERxWnNS8ynTOLuAjmqCd3/nXWIFAiXZB6XgB5fZtaw
 DBj3UgysifTr3GUbZOVz0fMwRsAUAPKi+X/JPzA75Jj+b9taUb1kXebeGO7nF5o667ai
 V3k8DV8+71d8vhWIws10QIQqLDgeT0Im/DrDeik2xWkW+9MmzaiXVfD9AStM+J31+vkd
 mmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YeGCMDACSQTp0mRPeTtaNv5FzsBb7YC30+puu/9npP0=;
 b=JuGhPAZhu+/5G4au0upVjdGeQpIQOUE2jG4YQcjx/Y9HRhPdmWxB14Qq13fS4Ovn/r
 g2QrFnleGE/IdjkjfwdTJ9mMVV7NkLcyOUNN1bgg+5fYMzGl+iXFpGsORH5hGUKdIUs7
 kfLKc8udimkmmrudnyqu8ezWwMa8c3TnSWWeueHhtSNL/olq7NKUUqMxCz4UNYI4K/kP
 oARiQ5dscZC32UFGI/N12tSPueC9NfkDjfBZBi7shxkuPjhbveI/OeBxlqr6Ftz8y7x8
 ZcpUIP7igFVfwQg6rpevVVQVrnu4mWQiSCpDSyn8dlLErSLxWdGHDK/8mVdUe04JfZxq
 Sesw==
X-Gm-Message-State: AOAM530Fk8SfMUkH+e0+LB8Z3C+w3QM4yXN5UDAEm0vvrTmuGWsRGwQe
 Q1uoGJlkVE0S8Nwoa/MUzdiNKIFt1z4iIg==
X-Google-Smtp-Source: ABdhPJxlLzpMBjzXP3JfSTD0OBnyGfkwiHB0RmAf8Szty5iLk7wVIPw+GFQhK/SvUTCwvzkZtTbWFQ==
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr11947552wrs.395.1619281379519; 
 Sat, 24 Apr 2021 09:22:59 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t63sm10998616wma.20.2021.04.24.09.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/arm/armsse: Manually reset the OR_IRQ devices
Date: Sat, 24 Apr 2021 18:22:29 +0200
Message-Id: <20210424162229.3312116-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OR_IRQ device is bus-less, thus isn't reset automatically.
Manually reset the OR IRQs in the armsse_reset() handler.

Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armsse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2e5d0679e7b..7fd3fb77620 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1668,6 +1668,10 @@ static void armsse_reset(DeviceState *dev)
     ARMSSE *s = ARM_SSE(dev);
 
     s->nsccfg = 0;
+
+    device_legacy_reset(DEVICE(&s->mpc_irq_orgate));
+    device_legacy_reset(DEVICE(&s->ppc_irq_orgate));
+    device_legacy_reset(DEVICE(&s->sec_resp_splitter));
 }
 
 static void armsse_class_init(ObjectClass *klass, void *data)
-- 
2.26.3


