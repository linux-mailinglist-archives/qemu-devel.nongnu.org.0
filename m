Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5862610A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiz-00088s-Sq; Fri, 11 Nov 2022 13:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYiu-000863-DB
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYim-0005Gl-HN
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so3651001wmg.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6dm7DBaeF2cZRUQRIT8/o6GsqUIEGkYXBsJF1ojYAj4=;
 b=AT72/gVzz/G3lnUWXnEtof6ozMWw4x/rYcZ9P5tmEt8Cu6ZfWVbPR4JWiqAOVi0kSF
 0ak7KsvpNktUhzJz13lTifofLWxlbO9X4d1qqHUooBLXsFL0hR7hekp1Olg2tR5cilU/
 b6iXsQt5WBuf6tozUsDooFYYVfGE96zxUHtmFAm3GhhF8htojljSqO2mDIwq8Nl1soof
 AlHzrb3HjERj8+N/Q7MbcLA0+qNFNrcU53c0MAAjvjkvFSpxkGADOGsIL0dlDR5r5ZkH
 HS7KEhrd9cniZIJbYVV7xIxugRsPJhb6XOT9LPSK288M1PDN9jDipvN3WExZ1ayAeDid
 Wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6dm7DBaeF2cZRUQRIT8/o6GsqUIEGkYXBsJF1ojYAj4=;
 b=kHSSr84yotxkQ6hyc+7UIS9kNKCrH5OVuzKBNX7w46gBVh3GTfpNItTFlG7eS7f+jK
 sku5ePojBcw0rASqc0SRiFQFZOc2Kc2e8Cbx7V9K3HvszylqDRPQrVW7jqrl28rl6tre
 0REzoI3ANa7iumMZQAs/46Jg1PwnBXVSO/Sw3g6i5dMkt2D/3sIz2LyaSlly66zvY2L0
 O8v7IRwM/mvMN611QYbSGDyfzQPJgvQ/6nAqtQYS408S2HnZqDme1S0QBKIDinQhmpNM
 6WY33TTLS8xt9VFqBBgTXhW7f0+AckTFC6X1ksYejb3oO0JWgsCclX9eJhtOVSfz9QvN
 Nx1Q==
X-Gm-Message-State: ANoB5pnWrRas4mn6YyTsQu6PLs9S+XaM5ifKwJ1i6L34wGaZVJhMkA0q
 GA95iNVU8iIeyiexRdS0ooTArA==
X-Google-Smtp-Source: AA0mqf4adk2iYCplPi3wAvPHF1xVMIQj2fVItCLPwnWdOm1lfV0nOh2WKkQbDjmIATX0J8JMy80aDg==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:4d14:5705 with SMTP id
 y15-20020a1c4b0f000000b003cf4d145705mr2152063wma.35.1668191143204; 
 Fri, 11 Nov 2022 10:25:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003b4935f04a4sm4435427wmb.5.2022.11.11.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30F011FFC5;
 Fri, 11 Nov 2022 18:25:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH  v5 15/20] hw/i386: update vapic_write to use MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:30 +0000
Message-Id: <20221111182535.64844-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

This allows us to drop the current_cpu hack and properly model an
invalid access to the vapic.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/i386/kvmvapic.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 43f8a8f679..a76ed07199 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -635,20 +635,21 @@ static int vapic_prepare(VAPICROMState *s)
     return 0;
 }
 
-static void vapic_write(void *opaque, hwaddr addr, uint64_t data,
-                        unsigned int size)
+static MemTxResult vapic_write(void *opaque, hwaddr addr, uint64_t data,
+                               unsigned int size, MemTxAttrs attrs)
 {
     VAPICROMState *s = opaque;
+    CPUState *cs;
     X86CPU *cpu;
     CPUX86State *env;
     hwaddr rom_paddr;
 
-    if (!current_cpu) {
-        return;
+    if (attrs.requester_type != MTRT_CPU) {
+        return MEMTX_ACCESS_ERROR;
     }
-
-    cpu_synchronize_state(current_cpu);
-    cpu = X86_CPU(current_cpu);
+    cs = qemu_get_cpu(attrs.requester_id);
+    cpu_synchronize_state(cs);
+    cpu = X86_CPU(cs);
     env = &cpu->env;
 
     /*
@@ -708,6 +709,8 @@ static void vapic_write(void *opaque, hwaddr addr, uint64_t data,
         }
         break;
     }
+
+    return MEMTX_OK;
 }
 
 static uint64_t vapic_read(void *opaque, hwaddr addr, unsigned size)
@@ -716,7 +719,7 @@ static uint64_t vapic_read(void *opaque, hwaddr addr, unsigned size)
 }
 
 static const MemoryRegionOps vapic_ops = {
-    .write = vapic_write,
+    .write_with_attrs = vapic_write,
     .read = vapic_read,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
-- 
2.34.1


