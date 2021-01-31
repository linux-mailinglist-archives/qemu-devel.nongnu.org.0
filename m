Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0C309B81
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:11:16 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AdP-0007EV-9n
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASI-0007H8-Gi; Sun, 31 Jan 2021 05:59:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASH-0000OS-2n; Sun, 31 Jan 2021 05:59:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so13424182wro.12;
 Sun, 31 Jan 2021 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kNgfhjPiw9171QK4YrLx8o/lKUJjzdxMB/0DtTDI5HQ=;
 b=qDjRF+0ndp85DpCMzIrhPpNfUsERWwiOZI7/uwPu1ErC9b8kl/ykCGgGrxlg4a9Bsl
 r/WmJmM75cJjlvhWXh0UIhpVBgF0oD6uDr58SF2Okr0t66zghYgcVzpgkCF8QHBuA4jO
 Mn7yPQYM0WVm3BdD7T1O62lMHo0xJCJ1Hc2aC+GNc2CBMm/3s22fGi5zasxYyyobf9cR
 JQuMGg+QN6hM+mj8OWkmMOQqYXNkZchvWRFn9CmVPdqkPUixwym8ClHDKAzq0Z/Ji3yP
 jfhKHAT4XbxRuUR0jKfsjrKVR0f3BZOourWAM7IeuFtdhQm5ylugxrb8H/FizUKPFxyV
 dylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kNgfhjPiw9171QK4YrLx8o/lKUJjzdxMB/0DtTDI5HQ=;
 b=i0fYjD3ehY5fslx2YVOuKnZ+Qhr2Fk72fBapSyHayL9RlubW+Upd6z8nZgzVH2l46a
 wJSDEUMyYwTNnraSfxC4a93/hpWDy3i2E3CWS8kNX/Da3AgqxPu3bl4Vf4Bm3OpiF+KC
 zjUDE4QHfuI2W56NXhAKJ/+gZpquSB0DFo2s34gCJslIKB/eFQsi7ROSjxFO7EnMgrfQ
 ism6fZhsv/nWeGPJnqlZjw8WgIciX1oMMrc17PtdoM5yBGxIBOC0nQ1cYqpMl1EXTSZA
 D0BewRuoKnJVRRkTDJ8aYwt8Rc5aj4wav6rTdj3RnfpGT5V8mzBdOT0ztXmFpF34bsAd
 IXZQ==
X-Gm-Message-State: AOAM532eqtGQHnAjlyQv8XJmHz9wiAIBZuOG45spCCiN2pRAG1cTJDg6
 iThSo/HS27sXMK4JLbpBbFZGuhaNZzc=
X-Google-Smtp-Source: ABdhPJxZCR+z+3577SkyRfEhG9RwDBvB5aUFyHvyoZzotMTiYVS/VSwCAnlC1+7O2XFjRiGKzDAGng==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr13397588wrd.118.1612090782910; 
 Sun, 31 Jan 2021 02:59:42 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b4sm22732200wrn.12.2021.01.31.02.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] hw/arm/virt: Do not include 64-bit CPUs in 32-bit build
Date: Sun, 31 Jan 2021 11:59:15 +0100
Message-Id: <20210131105918.228787-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
never been available on 32-bit build, see commit d14d42f19bf),
to fix:

  $ make check-qtest-arm
  ...
  Running test qtest-arm/device-introspect-test
  missing object type 'cortex-a53-arm-cpu'
  Broken pipe
  ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-arm/device-introspect-test - too few tests run (expected 6, got 5)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 399da734548..f0e9d7dd7d8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,9 +199,11 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#ifdef TARGET_AARCH64
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+#endif /* TARGET_AARCH64 */
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.26.2


