Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C267537235
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:42:32 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNrz-00006A-A2
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq5-0006aT-75; Sun, 29 May 2022 14:40:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq3-0002FH-KP; Sun, 29 May 2022 14:40:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so6426782wrb.13;
 Sun, 29 May 2022 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A9DKwKFr4BttRAjg5sxJylENPhkCHOeKkbPe1bC18QI=;
 b=TEyl2iYStp2J9X3TVh/UUFh2ART9a7NV9G5SHAu3lpuX0Em2NDPFpuyrGTQpXw8ltY
 2vztXKrz2ndxwFufj0YipHHiEGsG9xMDsr92WGwB3pv9sNsKdJBJzAXzPhxLFYzeE/vS
 cwJaIaHHSch6ESfsDWQPII4NQP/+oNIa2cJsEu0+hL/ynDMf/rq2FvsNnQyOgLrSTDnM
 gr9D9UF8nGoDHBq5wYAOU91CZFrOPfevgP6SZ3JwfabWV3d9qtGe3OkN0sox6Bx4Quta
 CY7wiyrXrHUBOTubZAMYBN4WZskB9rR750RG0N2Okyri9/JWfQdwqgZp6Liajo1+wOCs
 Vn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A9DKwKFr4BttRAjg5sxJylENPhkCHOeKkbPe1bC18QI=;
 b=vj4W8eZGFuUqOOwb5vm1uWh/YhYcad04078wyNc3sjjXly6v0JS2uxjV9Z/0as/l6U
 AsM19jF1MvdAa1NUi17IAGZ9G6Jfb3eFSLbPkyv6gg9qQUAx0BApbzeZxcpUQil4Aqse
 RsOC7XNUZNS1OB1PIvvO9KIG+dxZ4StG5E/CnjsWo0Zb2VFyopuTInTrkKHCLu3kx1CN
 DKwm5A/aDll+jBTx2fJDDxIkzVZxZCf3k1SrM2Gg4xi3Sgq+i6nFjiDR9ZqB5AU52zo6
 VjlSA6GAc6A4oFPlAB4ftCfOVgc/oq/Z0nBwNPjQt2B7nCmcQxiUw8zzgOB5BeThcXDA
 /GUA==
X-Gm-Message-State: AOAM532CnLwWytdO4SKY+E8tgy60odc7wfGJnX+20wjxnAxgeKJDWfd+
 T76FHV7Xfi8eNcnLvSeYlbf2GPHNy2ZnCm4W
X-Google-Smtp-Source: ABdhPJwR81yqDl92u/aRvWVmH1Cxdn32/i8qym5F+rrhJJWaK/sPRDhBHR2PvCA1VPRaSy3tx5E+Fg==
X-Received: by 2002:a5d:6dc3:0:b0:210:89d:30bc with SMTP id
 d3-20020a5d6dc3000000b00210089d30bcmr15079518wrz.272.1653849629514; 
 Sun, 29 May 2022 11:40:29 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b002100e86319asm7341049wri.78.2022.05.29.11.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:40:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/3] QOM improvements for rtc/mc146818rtc
Date: Sun, 29 May 2022 20:40:03 +0200
Message-Id: <20220529184006.10712-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

v3:
* "iobase" is now u16 (Philippe)

v2:
* Explicitly fail with &error_abort rather than NULL (Mark)
* Explicitly fail with &error_abort rather than NULL in existing code (me)
* Unexport rather than remove RTC_ISA_BASE (Mark)
* Use object_property_get_*u*int() also for "iobase" (me)

v1:
This little series enhances QOM support for mc146818rtc:
* makes microvm-dt respect mc146818rtc's IRQ number set by QOM property and
* adds an io_base QOM property similar to other ISA devices

Bernhard Beschow (3):
  hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
    fails
  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
    property
  rtc/mc146818rtc: QOM'ify io_base offset

 hw/i386/microvm-dt.c         | 9 +++++----
 hw/rtc/mc146818rtc.c         | 9 ++++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.36.1


