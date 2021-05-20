Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081A2389D05
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:21:30 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljb7h-0008Io-4V
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2N-0003OW-3B; Thu, 20 May 2021 01:15:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2K-0002Xx-SV; Thu, 20 May 2021 01:15:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v12so16184423wrq.6;
 Wed, 19 May 2021 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=trGsGaryNWUPxAJDqUIpevE5ZbWH+x1Qd17FpqljBXA=;
 b=AHnpVKmwyHn+wNukIPjogA6Hkn8d1dioPdVLsZvuaYcQaSfNG+Ku+jDM1G9nm+r6RV
 RmGLf6+rYeeG1E2lQw3ShzO80YPxyiadK8BAJ/BsrKxlfDr7IwLoH+HpqyzZn+/zEl98
 c8RxHV0XbuHY27dFqq1XD5F1FM1u7wke3vHz1mCApubSh3skua3LVaZ+DJ4C4mzgTWPz
 r0RymMS5AEuZ262UNDF3TinQ/1URa929gtMyfinmI4U10gSS1PCzIkGx8YxY5RZSzkHK
 b0wZxH9kOmhHmqqYQ/zVeC2x+108z6eTj6PTVwSPaIfY8F6iA/mPYO7QIrjKvkNXKvZr
 QjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=trGsGaryNWUPxAJDqUIpevE5ZbWH+x1Qd17FpqljBXA=;
 b=Lgx15aaI2Nv4wws15gw6FpwXFNkWVaEsqP7fOnh1Bd91KaWXf3lrNtIGx7vchBziRO
 pF2WdwUIsJbXR1O2TFIaDtWsn3P5LbBIYW0SpuEugtEUmT1LbM5uhVJJdW40p4K7yERe
 UjLLPxnM6pzAJkGHTyjQY2so/mfAwhrsrjzL6VT+jInl79ZD/Y8Zf137PsOAa9mHQ7UA
 pY0tpzbN2fBnduT2E2I5kT5DoRrnrpmV1YgEQiL5nmWjEMD0g1cUiFWRuS2QHs9HGcB4
 rzSLRxwjw/w280QEoamUpawE4CrnwNtSPFNRGBzhq2FlZeGO1bxhKgjd8ZbLhT5A/NS8
 qjTw==
X-Gm-Message-State: AOAM532sJ1zZOeaYnyMH54vYc5CuQT49t23+T7Xx1PFTzJ8OwylTNicz
 p0ZLWyzs9GVxroU+ojgUjCoCVeVN264qCQ==
X-Google-Smtp-Source: ABdhPJwAs938B/qTch6yIjZy5/2PxuGX5dTuRq0Q/X5uFzXlk2G8Of//2cBPIk6n4YRgU9kjr5W1GQ==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr2155073wrw.272.1621487754552; 
 Wed, 19 May 2021 22:15:54 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p5sm1730612wrd.25.2021.05.19.22.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:15:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/core/loader: Move 'write_rom' trace event earlier
Date: Thu, 20 May 2021 07:15:41 +0200
Message-Id: <20210520051542.2378774-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520051542.2378774-1-f4bug@amsat.org>
References: <20210520051542.2378774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is more useful to trace the event which will happen,
rather than missing an event that failed. So move the
'write_rom' trace event earlier.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a541..b3c4a654b45 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1142,6 +1142,7 @@ static void rom_reset(void *unused)
         if (rom->data == NULL) {
             continue;
         }
+        trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
         if (rom->mr) {
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
@@ -1160,8 +1161,6 @@ static void rom_reset(void *unused)
          * CPU definitely fetches its instructions from the just written data.
          */
         cpu_flush_icache_range(rom->addr, rom->datasize);
-
-        trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
     }
 }
 
-- 
2.26.3


