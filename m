Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDC628EDD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijP-0003L7-B0; Mon, 14 Nov 2022 18:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouif2-0004Ov-Ff
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oubkl-0007Hp-Pd
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:52:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k8so19072419wrh.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHd8zxhEWMS6KIqmAVZx4aX890qE80yf7gTcg7Gu7kI=;
 b=vSmUrh21XSYhIdNbumaUWObM0wAhccG83A5HAULvxZJedXxcVv8h7edY9d9XQ70AoA
 wtbasPnwt96R1LxN+9ii0+xuT2jLYdLIrhKjTt2ALBaPS390DgjKgbhcZYhW4c+Id6pA
 h0Iu69lcbuA0y5ZlqWRp7q3osgV3NlVaINGQmb3Mm3r3UBDZqo4lT9fYF/NF1NWw8bDc
 3PZSLIPKtfHAneTnIQ3cFz010tcRHy3FsoPA5K2fYklRZVp9euZZTn+yLwUX/tivr4e+
 GJ37mYdPIL75p4RRY5kdW/Sb0P59pFGq3k0AS/S8zrKVpBwjNKMfydj/rg2GpCCMalpb
 JIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHd8zxhEWMS6KIqmAVZx4aX890qE80yf7gTcg7Gu7kI=;
 b=PW6ln4zwHrKMqvE2G0kivWliIUaEENIQEIFpYYG6S+S8DmgzkflieqGMDd8kdkjOhH
 wpYEjzA9Jpdgguhk43kwc/xqANncehsYx8qaL2/de+jzMKTIu20e6tl2AHbuLppnH1AQ
 A2Wrpvso78HH/0zlnkzaGNlNASMzf7gMGEYEYmNj3Ys3ewNxduxmrzTb7xk8bzBiqvvk
 9+8QRSdGNZ1afLgkVc7oLwBVGspO6HEsJJRbNcnhsRFNL/TeCSB3zNrbx962aQU0hrov
 WT0oXd6oH1F3zHeF5euPpEWvYoTF2BCRQHuRUwooIiAa8iMpfrwS7l5UaYLwuOjp7WZ6
 Rx5Q==
X-Gm-Message-State: ANoB5pmB8AeoL4tuIdhzDWswIFxgbDVAvmP0ZtPtwWz8kBN3fs3+irHU
 gGaUkgYcpZjVBGH6FKgSdSJjWOmm230xBw==
X-Google-Smtp-Source: AA0mqf4aw2h0oGUP5mYHzdiIXhKOClOzt67uyv0g+G7ZyvFGpoURdI07HQhxhAJybSH7NpzMndZAhA==
X-Received: by 2002:adf:f508:0:b0:22e:5149:441d with SMTP id
 q8-20020adff508000000b0022e5149441dmr7915068wro.661.1668441125978; 
 Mon, 14 Nov 2022 07:52:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m66-20020a1c2645000000b003cfd58409desm9039277wmm.13.2022.11.14.07.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:52:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 1/2] MAINTAINERS: Update maintainer's email for Xilinx CAN
Date: Mon, 14 Nov 2022 15:52:00 +0000
Message-Id: <20221114155201.425027-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114155201.425027-1-peter.maydell@linaro.org>
References: <20221114155201.425027-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Vikram Garhwal <vikram.garhwal@amd.com>

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index caba73ec41b..be151f00246 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1748,8 +1748,8 @@ F: tests/qtest/intel-hda-test.c
 F: tests/qtest/fuzz-sb16-test.c
 
 Xilinx CAN
-M: Vikram Garhwal <fnu.vikram@xilinx.com>
-M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+M: Vikram Garhwal <vikram.garhwal@amd.com>
+M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-- 
2.25.1


