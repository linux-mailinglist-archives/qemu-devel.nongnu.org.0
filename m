Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4038F1D1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:53:49 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDps-0004Ay-AF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZV-0007EC-Th; Mon, 24 May 2021 12:36:55 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDZU-0002nR-6O; Mon, 24 May 2021 12:36:53 -0400
Received: by mail-ej1-x633.google.com with SMTP id b9so7564905ejc.13;
 Mon, 24 May 2021 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYlUDcbBxgUcTpH3YlxFdCaEX5vrfyOwZM1f/TOD9bA=;
 b=fOyPTICgqU+3lofnxPNIPQy9fMe/BUypD4pVE/4bwZF1GaARoax+L5RnVfuuykVnwy
 dDnuSUvP9YRY+F/I+fsccsf6uwpU2mIWB/ZVO0mcPZXL9pEa9QM9o9DjXvidNEvZ4YLB
 BUvUHve+D43gBaLrrTQorLl+c05jskBQKxaUb2PnqRNyN+V7HPykOs7VWR/TmRq+azRI
 UCwpqbqjzksI1HV0DjELAkCq0DUG9Kn91e20Y0w3m7RdEhBv4UgkTMRi0lsnjCW9gJZq
 GrkwQ0bMVG8IAvRLaeiaUX/CsEgTuxtP1hLbJMH2v2IplNkZlF93xGqw91UdEhs+aX3R
 4PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XYlUDcbBxgUcTpH3YlxFdCaEX5vrfyOwZM1f/TOD9bA=;
 b=kKwOUVWXfIB9xK7QbU5jXKY+oXM1C8M0A2Tx5kC2bptmdUmuAMJkx1oGuJFlDV+VcR
 l2AYdz5ZmS0YbsXxcWRTdHVJxoJ6+UH9nqy7Ik8SdG9a/oYu/2APAYP6uRpfcYJCYJGx
 pTxH5QSj1McZuRPZREFo9WbbRlUTZWOJZruNieWzB0uYk6RDG9LvQU8XdZNz61NJpWoA
 INI3JSzulaG9zroqg3HsfoqhW6l9zG9Att4liQCaZSNtRAb2Wz7rTDJ97NZXStZtMkFQ
 BNO8Un3SwXhEPEMZWPP/0rcJwM4vS9gVCCXA3dIxe1A64DZbHB4OtAZIBqyBwk216hEM
 lDRg==
X-Gm-Message-State: AOAM532GHWMgUFKDI+zFQBPH8kkvKWv6ZuejunkK29yH3nULBWbUSI2A
 tGlKgyuTBBMMVtv9PRYEb42+/e+rVW2pmA==
X-Google-Smtp-Source: ABdhPJyxyblcaKLWYwjQ5Y1oaKRtWKAydhMWfTI+gUdhueAQw80nFpQ6fo8WEbCvw3lFbmTv2AdYkQ==
X-Received: by 2002:a17:907:1b06:: with SMTP id
 mp6mr24579515ejc.292.1621874210475; 
 Mon, 24 May 2021 09:36:50 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n8sm7967684ejl.0.2021.05.24.09.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:36:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] block: check for sys/disk.h
Date: Mon, 24 May 2021 18:36:44 +0200
Message-Id: <20210524163645.382940-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524163645.382940-1-pbonzini@redhat.com>
References: <20210524163645.382940-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Some BSD platforms do not have this header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-3-j@getutm.app>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c     | 2 +-
 meson.build | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 0dc97281dc..a16a2840d3 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/meson.build b/meson.build
index 338ea279ee..82d0e6a224 100644
--- a/meson.build
+++ b/meson.build
@@ -1168,6 +1168,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



