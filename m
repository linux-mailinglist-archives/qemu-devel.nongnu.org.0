Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81724626134
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYj0-000899-0j; Fri, 11 Nov 2022 13:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYis-00085y-Qo
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-0005HJ-9B
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a14so7511139wru.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tP1tnCJDD0/845PJkX8UHaIw8B4BsTZ1dk/TTCfeP/A=;
 b=vJ1rwERzDeVM9w9TlVKCP2hiWVh1iLspt9v6fmbJ/bOmZ0c0zfvLuuidoGIJSrtxFO
 uBQhfcMWWMJN1xW0B5xDi0ygmkTAhyN7vJE8UNwQnAWYWgX0bjTlH8+fpKLcCRg4YuMW
 04MX9PIj+M0SOpiN6jP5RMo6S6D+yjTEltHM+bU4F1cN5mHCZR8bG8UX7vLfLdCArMHr
 QdqtkoxRb8sv3lYCXzzH7uGz6bHGPIpH9K7Mx7cyUHb5uhyjvfpSe9ubf63GLGzB0Nex
 F7YZj2zFVfzuIeOViaD3ZXoNlBP+QCXQOE+wz2/KfGIDF8lHqZciHqdlZfO6kWy30mWH
 Zu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tP1tnCJDD0/845PJkX8UHaIw8B4BsTZ1dk/TTCfeP/A=;
 b=AD/Zz0RORLEUEU2FKg4ENrYFDkYiWM6ild+g/kzWd/8mPfYwohBTEJdk3rXsX/5P+i
 5KXbOoGegXvJK5oct0zywlMDJtsyB3MWeVqu6LLR4V+cnDM7yXy3dDXNhyVKxBtM+JSM
 JbcsGxVWJzq+zhoiAZ1OAO6DeWtG8bdvKjkeV6rXty1QMwORvP6V92fSyBZ/jwzL7pL4
 dQTYWJa587hY2JFo+L8AyBrquVYVvKtx0yRzvkHy7Ie1XrBQR5Qa6sFiMFjvIjTxkODZ
 wzpvHY6OqAd/+RfcXxgFtxBFo6ryjj5QSEG8bfYP5jhgZfqNmprA85MPGFVOcfTfHEeH
 WdOQ==
X-Gm-Message-State: ANoB5pnymt4wOwW3LCuqpEO8xotjifWmkXVP/zn6iiU2Umtlv2zeb9Vf
 AiFKf6Q6K7jmWLnJ5TCLriDsL/QyTL3omA==
X-Google-Smtp-Source: AA0mqf4HHAGlsPb/Vj8JukdDMMhYgu2CQUc7AvHhrqQvGYmMS1LzmuXMjDojknYtfGngHoKltsKwsw==
X-Received: by 2002:a05:6000:1a54:b0:236:8dd7:1925 with SMTP id
 t20-20020a0560001a5400b002368dd71925mr1977037wry.662.1668191143953; 
 Fri, 11 Nov 2022 10:25:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x10-20020adff64a000000b00236883f2f5csm2514835wrp.94.2022.11.11.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 47B061FFC6;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 16/20] include: add MEMTXATTRS_MACHINE helper
Date: Fri, 11 Nov 2022 18:25:31 +0000
Message-Id: <20221111182535.64844-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We will need this shortly for machine specific transactions for the PC
IOAPIC.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/memattrs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 8359fc448b..b92f11aaa4 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -104,6 +104,14 @@ typedef struct MemTxAttrs {
                              {.requester_type = MTRT_PCI,   \
                              .requester_id = pci_requester_id(dev)})
 
+/*
+ * Helper for setting a machine specific sourced transaction. The
+ * details of how to decode the requester_id are machine specific.
+ */
+#define MEMTXATTRS_MACHINE(id) ((MemTxAttrs) \
+                                {.requester_type = MTRT_MACHINE, \
+                                 .requester_id = id })
+
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
  * of some kind. The memory subsystem will bitwise-OR together results
-- 
2.34.1


