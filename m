Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36533C169C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:50:46 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WIX-0006Lb-P5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnG-0001Eb-UX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:27 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1VnF-0008Lt-5F
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id c17so10206543ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sI6h5k66J716vMMrZDkOf++e8ZaDHw1O6KwZgtD+eDQ=;
 b=OfR7L8eIScNfsU5n0Yh6hrUy+Z27phj5kztE5fmQLovB9C8VnEmfjQPvZV2aYlWuco
 STvb0hud/BwMA1abiZhwK/rVYZqmrol87brnoG9F7cNV1C9LWXJn7rWJSIWxsIFMh6CN
 2Cg7I/6gEKNETO1uVAUszvC0/0VtCNAjiJB9tvjzO/XH7ZQqvD6k8JracZ3UHzfKlqkV
 f0Mo9VvFgWc7ehv0smRq+ivbnBUkdeDvQz9QCwJvCvtl7coZTutG5IqWIflaJfA3OKnz
 +eg6TePLKr/Rs5hVmNqbQxudQuCd6WXvVXIujXLwadCA7QPtjHojsyuwXhtbPzX8zGxz
 Og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sI6h5k66J716vMMrZDkOf++e8ZaDHw1O6KwZgtD+eDQ=;
 b=MgHFSfQ8WSZcNA8A8DxYX/aBnsiTtrMlen6WGq7hPtsCbYyYkoh2KlUvyXRMAliiYB
 CJ8GR0iXXcKomFoBMUO6BETCpRr0bU/4FnF0B3U1jiGCStt1dTPaWWuZJbHDrVl2ttWt
 WpV+VS1kxAgr4LJB37yNi72rCu735TcfQokeElEBj0vWTtmCRS9tzu8J1HfTN38w6CcK
 LDFaFlANYNDCboK6FuuYYgdH8+4Q+fGYMtryTaPbozHrMvp250o1b3O662+twYQ0LMCs
 9XTZCfCI2XPl/jx5VF4YGEMlbhVGWyp/KXJdh1VZLPn2AputQyscfvf/v3rigtn2FiON
 7D+w==
X-Gm-Message-State: AOAM533d+LAQD8ukjFEnJ3uYs7Xp8s5zSJoevxvuRH91MazTnTcrefLk
 tXK07Fe82m8Jj1CFslJajnZWKlqBQ/I=
X-Google-Smtp-Source: ABdhPJz6YZqiW0UDElpx7y0nAxR4tJEbYTTI7NjJWvHhFtT2/W7FMc5hX7KAS2VgHrF6I2x6GyXF5Q==
X-Received: by 2002:a17:906:b851:: with SMTP id
 ga17mr31931473ejb.86.1625757502202; 
 Thu, 08 Jul 2021 08:18:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/48] hw/arm: move CONFIG_V7M out of default-devices
Date: Thu,  8 Jul 2021 17:17:46 +0200
Message-Id: <20210708151748.408754-47-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210707131744.26027-4-alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..4114aa9e35 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 528f71bb9d..062fe94b64 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -296,7 +296,10 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    # currently v7M must be included in a TCG build due to translate.c
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
-- 
2.31.1



