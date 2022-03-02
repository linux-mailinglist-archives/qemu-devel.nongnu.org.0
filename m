Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44764CB09D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:03:24 +0100 (CET)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW84-000521-10
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:03:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxd-0005ce-Vx
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:39 -0500
Received: from [2a00:1450:4864:20::333] (port=42940
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxb-00085N-Q0
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso2053457wmr.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FAP8anOWorF+Rmm2oJQLE0W4TFL2c2lUXLkzNZ7iIa4=;
 b=oLPlWkwxfJty/dbg5PY7plwC6PrBCHm10kp91hOkYV9bOXdk0RNEhGgq5HV3m1WeSk
 3lPcTTRzAtVrng4n/aDD2M8/R2HHheM4zDki0bg7iQP+sW7EiilOvsmAdm+mxrtcZ5gS
 UdqSg81jCCUAuUIT5/5eWqOm4HJ5INY/C0tNiz8RPBMV3XgG1mclrZQizwpIQlymPtPE
 nJFKbUGCLUjyQwDD97v6Jr0bHTdY4XNLQIDfUBDzHCkF0G/2zmxDC8slJFypWZaf1Ytb
 g19EB42s4ltfvWqJ5Cn1HmXlp0iQIbTHLOCWdsO3f5nEu+e+xbHbkiFWIAysC8nd3os+
 oYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAP8anOWorF+Rmm2oJQLE0W4TFL2c2lUXLkzNZ7iIa4=;
 b=kkeiCZ4Uki5NsyQ9WzxQDFDTW+kDv2xC2lonpsNvVU37pfdeYqiEyt1I1Cm5qU5OhX
 4K/YYo2gy1YvdlV82HdSpH83nW5wdhdFtmbY8+p6AIbQbCgzSx7zyPd3xmgelcR/Nrsu
 nJfMCw8CHRgPXPg7PLLZiI3YRNYLkPt4ktClIGpfjzVbhpFuK3alMUHhMERR51JKaMan
 Cn5YbJk79nsSMYzb7UtONu4lLk8uR3NHfkq9wztYl4/auI1KVLizD2fq4H5W3yo6Ow+Y
 Np+CeRYDo0RttQGqn+K6KmJxLMR5gAZKSwM1n46YQIqGiVpsWNq6Q61GqD5v/tjiFn31
 GlIw==
X-Gm-Message-State: AOAM532KJW9Fq9mJwY+QK8ODlaW1hWk+s2Rlj4dM2oVhz5wmJdAEKYmb
 68TX18cHlJxZr6aps0UYkApoTSckHZULXg==
X-Google-Smtp-Source: ABdhPJyZwF3KWxqWOxnroNqhYwR19Y3Z81UywGGCXk8rJYfcpWQQapn2kG6DDYaIT+i5ynKRvI8XMQ==
X-Received: by 2002:a1c:2544:0:b0:381:18a:a46d with SMTP id
 l65-20020a1c2544000000b00381018aa46dmr1338590wml.26.1646254354529; 
 Wed, 02 Mar 2022 12:52:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] hw/arm/mps2-tz.c: Update AN547 documentation URL
Date: Wed,  2 Mar 2022 20:52:06 +0000
Message-Id: <20220302205230.2122390-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The AN547 application note URL has changed: update our comment
accordingly. (Rev B is still downloadable from the old URL,
but there is a new Rev C of the document now.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220221094144.426191-1-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index e287ad4d06b..4017392bf5a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -32,7 +32,7 @@
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
  * Application Note AN547:
- * https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
+ * https://developer.arm.com/documentation/dai0547/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
-- 
2.25.1


