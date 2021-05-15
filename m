Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD7381A3A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:44:06 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyKb-0002nX-OV
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEU-0000dG-3H
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEP-0006E2-Ik
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=YnyndHzT1F+5eL+YVZjVpRNRP/RBsz4Ad2K1OwanOX4SDX9fR5wfzqagTG/XtXr8pHEjf+
 PTG1LOqfWZs/CTw3luCSjDhQGB9iDgGlZEn8bp9+LMAsihnEMLhD1DdWT1Jzjj0wy+xkwl
 P/huCsEFrY2vSaB/7KDTMWyU72FFjc4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-jZIL_WpFNv6cUHYZBRwsEQ-1; Sat, 15 May 2021 13:37:39 -0400
X-MC-Unique: jZIL_WpFNv6cUHYZBRwsEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 z64-20020a1ce2430000b029016d56f15ac0so182947wmg.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lraw6SQ0lVBa6CL2zdvdg82NgOtgQKcG7wf/n9cOxMc=;
 b=rh2swxMslYvc9FlNR6IXAorRFElzK82bPPZId5m2nl/DfmUjoSLAdN5k8BB5ZfKRue
 1FCdGEhBWkKoifkVkYtwjKrt9UjAl2EqTy2Cnyp3VUWbQDcD1mNg3njhD5vgLdFjDzD6
 Q/eHWQJcPS1qmqJdncCJX8qpqeqLCI2SXphU3qP5C/JWOIESEqhajG48njrjlWJw/oW+
 piSMmchmarkuzjBqzRCRRCdHvS0pppRZz8drT7W2gzTJvu2k6ndJf5BQ0/fLWjHf+kYo
 xASA70huE8wWtfw3YM46XkPRh8wXMCYm70V0I8NY+dXRWSrRmItExz2Y1Ub3emcJiHSY
 B7fw==
X-Gm-Message-State: AOAM530jytm3uidynZ96gCegaHOwbtcSx//+LjMpiR0s9yK8F0czNqXf
 ijokac8xRcmrr9t/WQ+Ap6dpAPjus/tPX2LNNw+kmsT4YXUSZg/peH8GmdOwYzLfrGGSgcwds0V
 8zQg1D+7/GffTWkNxRypFs8qUjrNwvvs8McIAczqSuAjpTyaadJFJGR1hLGwDp5Co
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770248wme.39.1621100258056; 
 Sat, 15 May 2021 10:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyBs6Pteko4o0DW+BGZzQDrEJAvsFdZpZXCrww7Nd91irtzV2sFZ5IkQXQu4bTw46PafCWbw==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr3770224wme.39.1621100257888; 
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm10019081wrl.13.2021.05.15.10.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] hw/arm/Kconfig: Remove unused DS1338 symbol from
 i.MX25 PDK Board
Date: Sat, 15 May 2021 19:37:08 +0200
Message-Id: <20210515173716.358295-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 85c6a1a088c..5827c092b28 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,7 +386,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.26.3


