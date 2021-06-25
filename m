Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0B3B4269
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:21:18 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwjtd-0001jA-Bj
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrO-0007cf-QD
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:18:58 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrN-0004VG-9w
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:18:58 -0400
Received: by mail-lj1-x22f.google.com with SMTP id k8so12007060lja.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=gtdORX/Lc1UAm+r9wIb6v8yFJiA3dxGeuTUthAA5zdg=;
 b=DF74QdlOlGF7Qhq5F7Xee72l7r5TUM05JjtTFsPQE2Qak4TRJit5dE12li8MIZiewM
 iwMtrvL4Dh+4PVjdI+xOmR8v0xMO2BBmr8ImcslORZ9ITk21ACLyJztdC2rSbSAxqkiB
 on7uld/Z9GpuIp813NFE97o45mvrqj8wcEiD9Hs89KUUFn3m2IJZ8DYtovHmwguy8SxM
 csvkxruuIjoKC+VIazy2AIBIzyib9gEqUkC2z4JKgpQY2fwPhFU0hb9n0KnSmq+yD7L9
 wohngJTdh+FL6lu1AiLpLlXyibvNHKCXQOUkcVJ2BU2fm0wxoxbn5bA0y1E3bpu+rl5T
 kwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gtdORX/Lc1UAm+r9wIb6v8yFJiA3dxGeuTUthAA5zdg=;
 b=Nr1lnlV7/g6RUOKPx6XyNasLBMyAadmVtJrpYTGm00dTpvZcnMP+ct/JODebxfP+pL
 IXRSQHbUMq/CiMVqyGLEgRw4zm0KuZ0BXxvdCSfPKRv/Astb3PxRQWpVK1gexRq5gCZZ
 lDlNeuTjzYXuBBUe6zVHnW5CIgeiBs/9SqKhwNXPPGBnz7iNeCTXSr5rwZSIUDNs36th
 6QCOG0b7fgEfocO1DIWGNtrAVfeeoTf8ZdBM39PNv4wrtAesuYSdkYB6i6MZ+HdlnXcr
 rNoUz8djRe7HrN8lWtFheOggs4pOZHtfBzrukSS486snpzrBit8EWS+JKj+Gm+AdWoTp
 dXGw==
X-Gm-Message-State: AOAM5314DroS+9lzkPyurQ7cERO6QnCEqfI69hujMLa0XGs6GgQ4NOJ6
 Ej/JHKIuLC1j+6rPINDxtA7pB36WwngAkw==
X-Google-Smtp-Source: ABdhPJz+B1udrikY6iXIsZrVjBnlMciLWo+QsKuhze81dteSlvM+gglgKgoHN1e8TsY6P5awl9Aq5A==
X-Received: by 2002:a2e:6c1a:: with SMTP id h26mr8004059ljc.34.1624619934333; 
 Fri, 25 Jun 2021 04:18:54 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:53 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] arm/virt: fix machine poweroff
Date: Fri, 25 Jun 2021 14:18:40 +0300
Message-Id: <20210625111842.3790-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested against the latest ecba223da6215d6f6ce2d343b70b2e9a19bfb90b
and ATF code. Patches fix 'reboot' and 'poweroff' commands issued
from linux.

Maxim Uvarov (2):
  arm/virt: fix irq mapping for gpio_pwr
  gpio_pwr: use shutdown function for reboot

 hw/arm/virt.c      | 4 ++--
 hw/gpio/gpio_pwr.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1


