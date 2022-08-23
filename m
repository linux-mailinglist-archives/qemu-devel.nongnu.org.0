Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A857559E625
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:38:31 +0200 (CEST)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQVz4-0006UX-Pr
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn6-00021Y-1u
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn3-0000S8-2K
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e20so16933448wri.13
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6N1AbX7MwqXmaA4EDQBfETBnTJE+/4pDYB8PrRAcvMo=;
 b=rjDlQF8oMDrcZ5X7PK3IRzoV1MYnu5wLXpjgJb488id9SRARTSQZxuQy39U0AN5EdV
 5cFdWP97DMkpOPn9rlHSBUoakAC+H4FBPRehkhA12zlygZi3wumiFAO1hDR1D3qi6NtB
 9zdbdDnvTmfKVu2afHeggomjMLGXIGU/u9UafnOCl5KvPusCuT+7WNUx0gBDOT+JClb4
 nV3PbryLF4+BLJmmq+OZshsmGr9QqAXfQCyuSlYqw3BBrv1YzQR0k0nCBIm9DNIPcc0e
 id3koezN+zxnQNgijofagBEf7bmGBlMGhifZChYH4X5QuqVa5ugG9kFXVMioLb0K/6kL
 MHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6N1AbX7MwqXmaA4EDQBfETBnTJE+/4pDYB8PrRAcvMo=;
 b=A42JftV99kVFSbJZKNhuG47SMWqUY8ieOwfeWULUYQ2vKXEENpAoqmQoPKgZA9F7Bn
 o+xtQ/4di3tCiWOig+QrmCIw3EMrzoHeYpYettv/gn+g6WNcX5SLc6t7997fLZm6n8NN
 AwTjsIR/Cs7JZE3cS6YH9ScP6sjHjnnC747MxpHs29TRgHvSYdDcC+IZy/L2T/5eoknX
 LT2VcrtIO0dWAGWDeShmmGwHXlvJvtCd0icBOBXb9tas49IWC7mzDWuC/WHLHhbN7hEC
 E4OTKq0UgJ2KWT/pIt13Hcz2rI+9nSbA84OFhjJWeNsmRRKR3wiC5G+KFWlb71ZyqMIi
 +vgQ==
X-Gm-Message-State: ACgBeo3dWhNwBnHefPfAE/+cIakSqaXhgAyHsVN6l5AuzHJ2W1ldoupZ
 AkzOnFHTchE77IFtEHUu0ITdcA==
X-Google-Smtp-Source: AA6agR5Aoesy63pooLVM/uw6HdC3zjtqTRkP3XJXPE52+QuTSL19QPAMjQBXiQI+X89vd2zlAT26rQ==
X-Received: by 2002:a05:6000:1689:b0:220:8a04:69f6 with SMTP id
 y9-20020a056000168900b002208a0469f6mr14985031wrd.357.1661268363072; 
 Tue, 23 Aug 2022 08:26:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a05600c3b1e00b003a6077384ecsm22610948wms.31.2022.08.23.08.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:25:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BCD661FFBB;
 Tue, 23 Aug 2022 16:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 3/6] tests/migration/aarch64: Speed up the aarch64 migration
 test
Date: Tue, 23 Aug 2022 16:25:55 +0100
Message-Id: <20220823152558.301624-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The migration tests spend a lot of time waiting for a sign of live
of the guest on the serial console. The aarch64 migration code only
outputs "B"s every couple of seconds (at least it takes more than 4
seconds between each characeter on my x86 laptop). There are a lot
of migration tests, and if each test that checks for a successful
migration waits for these characters before and after migration, the
wait time sums up to multiple minutes! Let's use a shorter delay to
speed things up.

While we're at it, also remove a superfluous masking with 0xff - we're
reading and storing bytes, so the upper bits of the register do not
matter anyway.

With these changes, the test runs twice as fast on my laptop, decreasing
the total run time from approx. 8 minutes to only 4 minutes!

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220819053802.296584-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220822165608.2980552-4-alex.bennee@linaro.org>

diff --git a/tests/migration/aarch64/a-b-kernel.h b/tests/migration/aarch64/a-b-kernel.h
index 0a9b01137e..34e518d061 100644
--- a/tests/migration/aarch64/a-b-kernel.h
+++ b/tests/migration/aarch64/a-b-kernel.h
@@ -10,9 +10,9 @@ unsigned char aarch64_kernel[] = {
   0x03, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x00, 0x39,
   0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0xad, 0xff, 0xff, 0x54,
   0x05, 0x00, 0x80, 0x52, 0xe4, 0x03, 0x00, 0xaa, 0x83, 0x00, 0x40, 0x39,
-  0x63, 0x04, 0x00, 0x11, 0x63, 0x1c, 0x00, 0x12, 0x83, 0x00, 0x00, 0x39,
-  0x24, 0x7e, 0x0b, 0xd5, 0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb,
-  0x2b, 0xff, 0xff, 0x54, 0xa5, 0x04, 0x00, 0x11, 0xa5, 0x1c, 0x00, 0x12,
-  0xbf, 0x00, 0x00, 0x71, 0x81, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52,
-  0x43, 0x00, 0x00, 0x39, 0xf1, 0xff, 0xff, 0x17
+  0x63, 0x04, 0x00, 0x11, 0x83, 0x00, 0x00, 0x39, 0x24, 0x7e, 0x0b, 0xd5,
+  0x84, 0x04, 0x40, 0x91, 0x9f, 0x00, 0x01, 0xeb, 0x4b, 0xff, 0xff, 0x54,
+  0xa5, 0x04, 0x00, 0x11, 0xa5, 0x10, 0x00, 0x12, 0xbf, 0x00, 0x00, 0x71,
+  0xa1, 0xfe, 0xff, 0x54, 0x43, 0x08, 0x80, 0x52, 0x43, 0x00, 0x00, 0x39,
+  0xf2, 0xff, 0xff, 0x17
 };
diff --git a/tests/migration/aarch64/a-b-kernel.S b/tests/migration/aarch64/a-b-kernel.S
index 0225945348..a4103ecb71 100644
--- a/tests/migration/aarch64/a-b-kernel.S
+++ b/tests/migration/aarch64/a-b-kernel.S
@@ -53,7 +53,6 @@ innerloop:
         /* increment the first byte of each page by 1 */
         ldrb    w3, [x4]
         add     w3, w3, #1
-        and     w3, w3, #0xff
         strb    w3, [x4]
 
         /* make sure QEMU user space can see consistent data as MMU is off */
@@ -64,7 +63,7 @@ innerloop:
         blt     innerloop
 
         add     w5, w5, #1
-        and     w5, w5, #0xff
+        and     w5, w5, #0x1f
         cmp     w5, #0
         bne     mainloop
 
-- 
2.30.2


