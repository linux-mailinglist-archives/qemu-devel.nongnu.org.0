Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40E35957E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:31:44 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkgB-0002Hy-Gg
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZZ-0004ty-TR; Fri, 09 Apr 2021 02:24:53 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZY-0001k3-FI; Fri, 09 Apr 2021 02:24:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id mh7so6823201ejb.12;
 Thu, 08 Apr 2021 23:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eG5k+RY3W5mxHR/DqHIpbCfVA2UEY0rp9HYfHHycg/Y=;
 b=AKqMgHWJ0Dqoft8I68l+hHmWod18M96s8AQnYgCnFdnj16WSwkn3EmOf7PMSXBysus
 xeKhkfdDG6paOAyl7YUvFC9r34cPqf7appmaSXxTiU90eUD2P4sQYkJpR3YCYxiHQOFT
 ErH43D/swNpqz2cE+/YMxuqmSEivM0i6EHdv4pH22eMSFnQp+UpaDQKuLahbWOwUB9Ri
 usp9u2ZpWKbJowtblXTEOC1d3ceyGyUdURLJ7eAnQCvaIzD+3j4E88Rp4jIp2HRUzJFF
 0p/O/mGra2b464Xh8FQePIHCwj3fRk7Lb6ijBbbaAEGKKva42NT9RDMwFxjpm4LfQY1Y
 iA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eG5k+RY3W5mxHR/DqHIpbCfVA2UEY0rp9HYfHHycg/Y=;
 b=n6QYPJQZqPoOPJZ4IdYBlgFAIIv5QfGFWLl0L/MoREV7VqTXtwAQm87Gci+ywoqjHf
 frTP6EmIY3KJmGSzYfQP8qQI2qJth6piHE6oQHAnmA1VAWgZRbAS6XrYGuBCYKja5HRZ
 5dlc/uj9073tnDSNy+gJdqHNUiD3oPILzgMiWOL/3+390PnwXF1/et5akPvafzQLizut
 CszT2/7oFvXgLiUS2MCA7j4wC0WD9khKlDe7pCiPEv+5WNjifM4FCrTb7IVIHfyo+D1/
 kLUchu3I7xiNaFBwjtOmGr035WBGNHw9ktQBgmKIDHcBZxFKyIEAi5gg8POFeOd/nPmU
 LuDA==
X-Gm-Message-State: AOAM530/R8vF1o4wW/voE6YcGoGBwb8V+VUVRPLwCEzAIX0WoIYMLwAF
 P4v24FpmCcxnjsZQey6BNd2w9iYLs2jYmw==
X-Google-Smtp-Source: ABdhPJx5kAPr4OgDeOSgUmG90BXSCAhUQ2ByiPvx1WfHMVigRm5yRX97xnI0Zn6bGIEnLl4N26IeAQ==
X-Received: by 2002:a17:906:ff41:: with SMTP id
 zo1mr14664036ejb.19.1617949490535; 
 Thu, 08 Apr 2021 23:24:50 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u15sm834765edx.34.2021.04.08.23.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 9/9] hw/core/machine: Reset machine clocks using
 qemu_register_reset()
Date: Fri,  9 Apr 2021 08:24:01 +0200
Message-Id: <20210409062401.2350436-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the documentation mentions:

  Note that if you are creating a clock with a fixed period which
  will never change (for example the main clock source of a board),
  then you'll have nothing else to do. This value will be propagated
  to other clocks when connecting the clocks together and devices
  will fetch the right value during the first reset.

the clocks created in machine_init() aren't propagating their value
because they are never reset (not part of the reset tree, such
TYPE_DEVICE).

Register a generic reset handler to have them properly reset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/machine.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index e8bdcd10854..2817fe6a567 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1234,6 +1234,13 @@ void machine_run_board_init(MachineState *machine)
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
 
+static void constant_clock_reset(void *opaque)
+{
+    Clock *clk = opaque;
+
+    clock_propagate(clk);
+}
+
 Clock *machine_create_constant_clock(MachineState *machine,
                                      const char *name, unsigned freq_hz)
 {
@@ -1241,6 +1248,7 @@ Clock *machine_create_constant_clock(MachineState *machine,
 
     clk = clock_new(OBJECT(machine), name);
     clock_set_hz(clk, freq_hz);
+    qemu_register_reset(constant_clock_reset, clk);
 
     return clk;
 }
-- 
2.26.3


