Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DF4AFFCF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:03:08 +0100 (CET)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHv3I-0004Zv-Hv
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:03:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvx-00055B-6n
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:29 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45724
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuvv-00082B-0Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:28 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 9so3859148pfx.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=towQfqS0jMqw5GnfvXlTSNN7JfZiHl4TlvOHlC1CNHc=;
 b=NN1L2zC/McZb47pqln3giILB0k38X9STl+rHzZx/rjtpm8cnmfztB6+hxl+mA5IN+q
 mj4R2QAmDPAMGGM4HNpHpH/j3WGWCsF9CBPXvhk5j24A2DWcMgLPl1Mq5Da2c0cvTHHx
 etAhIpaM2fUd5B0oaBvb1D0lvppZJN9yd7cPj4IWU9Z9DnfQolwU1SCF26VXiws70iQI
 V3tqRv9JpY/eueoPXpo1gWuG6P8uucBbw8oHY7HlP0JUjVMIr5BAnYGGt/F/yccV1ctM
 sgp7B8XoIn9NpdaKe7GrgftZe17+WSTAHjA3NcoImuxla7+Q/hOvt4nBbDcu2S7pAOBS
 LCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=towQfqS0jMqw5GnfvXlTSNN7JfZiHl4TlvOHlC1CNHc=;
 b=D/7djAWcB4Dz91uQccGPsvsrnR+ZzRi5S09pg9IyGUPAFbIGEf+c6C9CxGAwejhhPH
 EOFjMKX8cdhMJ2j4/y7Eo6+XG7W1dILlvl4znwefUVb8AmaRQJ34FDZlgpPpCNGrIRpb
 SK2xcYff3fipQkg0ETJygkCqk2rHGf7kuj27EZ3TlFiEkERpNpEVJBcjXBGIyy0wsWQd
 DfZqo1BxLT08fmV9AuLtzRKAptEUwfF4H5d/uD08/tIozUYh9a3lEhkjIaNDhHm6a+5d
 UAwd5P8YjQHrdivpDR69Q1D6QtntfTemyTGTLlo6FVYgFJKnlk/aRtDOWTyRTVr4FyXR
 CuHA==
X-Gm-Message-State: AOAM532X4BU4o72dSudfVIa+SCAHcQTMfqk/kHx6aCy265dsTwc0sGzr
 4pRygw2a9CSqYabkA78DT5wDKVVCM9Q=
X-Google-Smtp-Source: ABdhPJzc5W2htK/qIlFFT4c8DaCwtKp4zS4jO5GtYEPGEpuXJPM5X2sMHT+Ks4kaTRUH3JR72XemrQ==
X-Received: by 2002:aa7:9486:: with SMTP id z6mr4390337pfk.76.1644443716635;
 Wed, 09 Feb 2022 13:55:16 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id pj8sm3208982pjb.26.2022.02.09.13.55.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 03/15] hw/tricore: Remove unused and incorrect header
Date: Wed,  9 Feb 2022 22:54:34 +0100
Message-Id: <20220209215446.58402-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

TriCore boards certainly don't need the ARM loader API :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/tricore/triboard.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index f3844be447..094c8bd563 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
-#include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
-- 
2.34.1


