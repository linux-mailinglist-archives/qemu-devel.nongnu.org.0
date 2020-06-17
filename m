Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B41FC5D5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 07:53:47 +0200 (CEST)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlR17-0004Hj-UF
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 01:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzc-0002SX-JK; Wed, 17 Jun 2020 01:52:12 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQza-0004QR-Vg; Wed, 17 Jun 2020 01:52:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id j10so905982wrw.8;
 Tue, 16 Jun 2020 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVuLqYtrt8uBmV3Fe5GFgsc46Ji8iMLXSf7RHd88kek=;
 b=TkG8TMhYWoQITYmkpaaGXxj/jjXLjT5vKou76sPlni18jhHCCVkYNKi4UeyB4+z+r6
 R8AoGbx0CXZAA8uhi6qMSYUShvsuC6C2YTTjbTYM6xy1gpmotrL1u5NYqi7pyDzVV2+g
 Y2+4GFIhxalzodHzOV3AuyJxLlm1WgEcxj1ny0PFMUgzBul3C6efC/6YlFGlK7ixwVzo
 zwk0CkLfE5NpsUrc3qNsHfOOO/KlPcopgaM7OwaaSsEhER4dO8H3qZkWeSc30DuhjaS9
 yD5JGsd6WctCpgNOCuaPDWMVziUduk5Mu3b6V+FGJ7aUU/Q3CoG3hC2M0lCEdnGJFtdc
 Jbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BVuLqYtrt8uBmV3Fe5GFgsc46Ji8iMLXSf7RHd88kek=;
 b=iHdqbn2AYg2cz50aCbWy+iMkkD11OP4VGlh6NhXQBRinq9x1SR0ya1996yw/XSF0gm
 NRLr9nikn5vttx2A2FONkq1a4opT9hXUi3bcQYQa0XViAypg1eS9Bz39KwNSOhRpNCUE
 jOqsNvAOnaXXwuMIBYxZYC5WPBNOZZc545fROfy+71uE7YROXZwfuve1XwomwI0Ap9O1
 3XDXavX34+AeeWiSRbQ3FmJ5hxNff4GadJhgWyk3udILZ+/iJEllI/ce2NrRq7tzpDwe
 LKocpXr949i/TyVOcLdBAySA/TQFm8n3pfEpP/t1wcZXNy/mQ5/lyfjsihumVZt0Q+nh
 FnTQ==
X-Gm-Message-State: AOAM5334Y9eUFl97cU2QQC0InR+ETj46aTko1Kkk06b/ESRhEr4x7xGm
 WIeRlX+eV/CObJklGVNjCnB6U4e9
X-Google-Smtp-Source: ABdhPJxuExPOi7PPH2IVu/prdgJ9Gu9IjA9bNuQiW/VAq7AbdAvBuoSq7eOGQ/wQYTBOlGla3Y0wRQ==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr6645493wre.275.1592373129146; 
 Tue, 16 Jun 2020 22:52:09 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/14] hw/watchdog/cmsdk-apb-watchdog: Add trace event for
 lock status
Date: Wed, 17 Jun 2020 07:51:52 +0200
Message-Id: <20200617055205.3576-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a trace event to see when a guest disable/enable the watchdog.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/watchdog/cmsdk-apb-watchdog.c | 1 +
 hw/watchdog/trace-events         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 1541365914..5bbadadfa6 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -225,6 +225,7 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
         break;
     case A_WDOGLOCK:
         s->lock = (value != WDOG_UNLOCK_VALUE);
+        trace_cmsdk_apb_watchdog_lock(s->lock);
         break;
     case A_WDOGITCR:
         if (s->is_luminary) {
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index ab94d7df50..3124ca1f1b 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -4,3 +4,4 @@
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
+cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
-- 
2.21.3


