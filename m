Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B7B37FBDC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:56:09 +0200 (CEST)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEd6-0007mF-A4
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN1-0002QH-WB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMo-0000oM-Tt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxjBXIiwUsk+hse5zMCnX9XGKfKUwyxRJGBY/GxWjoA=;
 b=RGPluhZw8+wsRSAF/EeUQeWleSPTWj1Snx5ejazf+wyXBbzpC1AdJnlO5a7y9YGglIT56V
 4tKqrhwqT/AnzfF6tbK5OwktjEcZIPtZ07KfIPVgmf+MWH+jXCE60k/ByFqCG1kOrzbzSX
 yzZLzYmikTTfmRo7TsvPo9BIM+3Ldxg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-6WuGVLylNQaVIbgylxwGNg-1; Thu, 13 May 2021 12:39:16 -0400
X-MC-Unique: 6WuGVLylNQaVIbgylxwGNg-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so3181600ejw.22
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxjBXIiwUsk+hse5zMCnX9XGKfKUwyxRJGBY/GxWjoA=;
 b=rXAJZAp8mZSs8h1Ee+aqTya6ENbJvexUkAX9ybQ5WhJbwQrA2qwdghm/x6Fjn2BvyM
 QHVXLgodLrqklT8Cv4JJbi1KdAXHZx86eCp3Prm7PbDc9Krkrwso0qlv5KjuioOJsaZf
 d98Mro5ucAJYWdbu5kK4nvHfEC14SMwnpGJfLmojuFfAGpAL8vul1Nu6EYvHFjPQ3qRA
 poF8Evx7WZ9klJTupVR9PYa297/JYPnDUqc+1CGlxe6fGvqlqNt6Yk6LaOVsKTwkqn+8
 luXvB3dnZ0ldl9pgTrwS2yIBsb/GHTh3X+hgCYtZRxPWy4wZhVkVwrqUz4PBC6WvLE7N
 TMOA==
X-Gm-Message-State: AOAM533rV+JQKmoVQJHvj/93sJ5MDjbeFGnjnm9D6LjVVwT0hNBOhcs7
 OUKQ42pCqiKkfrWEbL8w8fSbhamA+Myxxaern/x3Gl+Q5lrA27uZC8qB6KSSqgz4y5eQbUh0NTg
 zVmm+1c7egeVCDqajm8RFazhVhPCi0RPWUOlNznfDepbPeKyfPGYOhTdoNZzphYCZ
X-Received: by 2002:aa7:d955:: with SMTP id l21mr50910805eds.118.1620923954789; 
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+qSalJJDt2JNg9zn0iZ+C/qHcv7Yl0RzDuccxLeSdACCCZgMRwF1QO1hCLOiH+aqf5ul2pw==
X-Received: by 2002:aa7:d955:: with SMTP id l21mr50910783eds.118.1620923954636; 
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s2sm2635684edu.89.2021.05.13.09.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
Date: Thu, 13 May 2021 18:38:51 +0200
Message-Id: <20210513163858.3928976-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Doug Evans <dje@google.com>,
 Hao Wu <wuhaotsh@google.com>, Tyrong Ting <kfting@nuvoton.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
this isn't advertised with proper Kconfig symbol, leading
to an early build failure when building NPCM7XX machines
standalone:

  The following clauses were found for AT24C

      config AT24C depends on I2C
      select AT24C if NPCM7XX

Fix by adding SMBUS to NPCM7XX.

Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Doug Evans<dje@google.com>
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Tyrong Ting<kfting@nuvoton.com>
Cc: Corey Minyard <cminyard@mvista.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..85c6a1a088c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
-- 
2.26.3


