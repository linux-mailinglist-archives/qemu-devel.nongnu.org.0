Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CC41171C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:32:34 +0200 (CEST)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKLR-0001dc-LF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9b-0002lx-VL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9E-0000nc-DS
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so30193771wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c0SXbXziBile1wgQHLBqPegTCinRFtAwKimdChj13Yo=;
 b=gn5nMGunONNKaxeCZA7gE+eZOfsaUo/5ku54qxMspd5ulEDij6yTf2XxMVCPIAGqVl
 nIVB2B5jtTFmCTvdtm/M7/Wy+HnKkXbrC54/HG0IQSfkbK3koKCUoq9bh9yVxmT3wjwG
 t0J4RQ9dsZJUwBXFzjKq28yKIcKottxxM1h9EWcxPppVdttxlRT6w5GEp/xgdCgqDgxd
 PAZWltnpVVKn8clFhk1f5rymWlSsXRLMsGpteribpDuHkb+nLYn8w6pfWzDuGV8zbxP8
 9TQbBIM3HYYP4p/6aLabxotW796NaqDGN5ODBto3iDm8MOgVnJ/g3JSotGjxHra8/qSV
 iCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0SXbXziBile1wgQHLBqPegTCinRFtAwKimdChj13Yo=;
 b=kDYj8HUyFEIptOIUEuZHkUKQfU4++Y4jeoYkLEZy7aDg2l8KZy2yTzHEL5LTc7Nhiu
 ZJafilBU6RIZsJf2nvWKCRN45gQ1tkkO9meQyUWOPIPUGf+zVPwciVEbYxw+ATS8gMCV
 e8fe4AqnZVXD/22r1UE5IpQHV5kf81CgSJkVDbwCn3RfC0vCUAEqABqnwptlHeNr/xhm
 31w8hjXjl+u7ry+RBu1GnDEB0SNP4yeji2pjB1Co09rX6EG72ccugfPEpUpJ0NyipGyA
 THm0//hTFkD8nGv3EuOTkKLb8wPzKc5psmuKbixXciwgmcv7COvL0bIROUz8V7Jgadyb
 C9XQ==
X-Gm-Message-State: AOAM53250t/6BY58u2yjN7LeZvynDUrd/DzKdehdK7iQ56ZB1YqyS8/d
 egTa6rewnvKaiBsDeXoZTjGvtBIHAvnYNg==
X-Google-Smtp-Source: ABdhPJzZd2VNquOEuEMQA8leIEW07gwYwmwEMw/5ZuWvANRzK2CWu3ZVORygj7qXJ+vMeIHR0R3+Eg==
X-Received: by 2002:a05:6000:11d1:: with SMTP id
 i17mr29086777wrx.424.1632147595094; 
 Mon, 20 Sep 2021 07:19:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/27] hvf: Add execute to dirty log permission bitmap
Date: Mon, 20 Sep 2021 15:19:28 +0100
Message-Id: <20210920141947.5537-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Alexander Graf <agraf@csgraf.de>

Hvf's permission bitmap during and after dirty logging does not include
the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
instruction faults once dirty logging was enabled.

Add the bit to make it work properly.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-3-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be9896..71cc2fa70fa 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ);
+                      HV_MEMORY_READ | HV_MEMORY_EXEC);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE);
+                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
 }
 
-- 
2.20.1


