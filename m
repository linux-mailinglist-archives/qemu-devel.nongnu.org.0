Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15930C959
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:19:22 +0100 (CET)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Gn-0005lH-Jc
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu3-0005fj-Is
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0002If-Jn
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a1so21442145wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qBYzZonn4pEeu5HCg3gqbs/tT/khWqfB6p5+DdEP3kM=;
 b=P1HEWrhYD0B3pala6HaiI2TU4fqBnbkgHQpOD3E+YQAV1xjL3eXLJYI8ocTxFETD2r
 8WkETTNtoUvUzdikLq40gJ7a3dYnUFrpnxonjcmhqcMVShhlYXGmyQe1acDfg8Sgb+SC
 2o2qoN+06eiIWKYR8KfT90gUFkkK+1hCCio3UOwS9UgPXBJwayAo7dFmlFVQdLiVVQcN
 1oI/NCLPCzaheiMPWKCoOE23VYZXPxjEn6ypu0t9eQui0V9IDZgMz2FLBtX3w0wJwstj
 JyF4BUDOccFVHVK41J1SjRmPMQK5OWB4AzjbrkqNdM1LYq/F0EP5qSYWUKrCpjR1et6y
 BA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBYzZonn4pEeu5HCg3gqbs/tT/khWqfB6p5+DdEP3kM=;
 b=I8BZhR/wGVkWbA69FDEdlXiewX2VBg5gtMHi8hIC7vzOjTHlK52nwMRzTFo9PYWbML
 45ZAHtvJ6q3bcBC3HbSrG7jpOtbRwoxxcFn7Zv8YBVTmcIFN6fUjDdQTlaK13LmnLDPT
 hWYvCwvB5uqGqK+ax7bBLX2U5YQXTFV4TaL8r420QoRVaPA041B3049UBrm1khUSRIzt
 c5VXxZJCxpRf+kwAfHGZ87vb2/DgIAjCjT1suyYqnM7VfK+3fSqT3joS0VSKcGxw0HVU
 n6GMC7w22anzAB6YAZypsyuIKnEVWU39gHKkhlycJPuE7WXiqC8BnTfARbkBHqA1g6lo
 cZBg==
X-Gm-Message-State: AOAM533Lv5JW7MvSbIjXG6UwAQ02CIpoqap4JKHqbIHeiw9CSEQgmINO
 47yRT2i/JBDTRmPqOUoXW5c2sHXuMvbxww==
X-Google-Smtp-Source: ABdhPJxh+slPFyj7+j1HxeG4MpjccUnAYbpwjNnvJraMsv1zoxqxUJnsRk1Ac5LHO4Dmlmjf0ZLYwg==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr25122558wrw.305.1612288538611; 
 Tue, 02 Feb 2021 09:55:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] hw/net/can: ZynqMP CAN device requires PTIMER
Date: Tue,  2 Feb 2021 17:55:16 +0000
Message-Id: <20210202175517.28729-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a dependency XLNX_ZYNQMP -> PTIMER to fix:

  /usr/bin/ld:
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o: in function `xlnx_zynqmp_can_realize':
  hw/net/can/xlnx-zynqmp-can.c:1082: undefined reference to `ptimer_init'
  hw/net/can/xlnx-zynqmp-can.c:1085: undefined reference to `ptimer_transaction_begin'
  hw/net/can/xlnx-zynqmp-can.c:1087: undefined reference to `ptimer_set_freq'
  hw/net/can/xlnx-zynqmp-can.c:1088: undefined reference to `ptimer_set_limit'
  hw/net/can/xlnx-zynqmp-can.c:1089: undefined reference to `ptimer_run'
  hw/net/can/xlnx-zynqmp-can.c:1090: undefined reference to `ptimer_transaction_commit'
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o:(.data.rel+0x2c8): undefined reference to `vmstate_ptimer'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210131184449.382425-6-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..d4cec9e476c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -81,3 +81,4 @@ config XLNX_ZYNQMP
     bool
     select REGISTER
     select CAN_BUS
+    select PTIMER
-- 
2.20.1


