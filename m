Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7696A4441
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6w-0001HC-5K; Mon, 27 Feb 2023 09:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6m-00013x-Ej
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6k-0007wd-MT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:04 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so3885133wmc.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5kASCm86qS5mH9bMZLw45mjOputGQxu7Ksj6xUnov3Y=;
 b=DlJi9cub52j163cUeyRCLo6dXhHnCdbZ5/ppIhZcrPJ34+QMb2KDbR9X2jh/3AgmJA
 I5Z8a5W84nT2aJeB4MLEBMj6phvOMDnkmqNMazzoHZbs/GlsvsKAC/dO4A0Uul+p+HL5
 DO/BBOO18lEDyAeKh+z1ZuY/hTTcgk6/0pE5LHBZNIMMmqkK2MylQeqZsp+0ig4tUaXE
 C1MFZFABa4O6FA1uzJ5rMqaR7+FDtsqBbDLhy4HE0is87LfesKI8t9wf+MfF+Kraj5e9
 KYK2ioNl8qSgI/7Tbr9KVal9LCfCx4o7BHDFNAzlpt1TO537tKjjPvCLpUtIsdVdt96s
 Axfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kASCm86qS5mH9bMZLw45mjOputGQxu7Ksj6xUnov3Y=;
 b=r/++WMYLXaURiuWndCBJZB0azYQK0+8BPxvxTHdni78mZOXK04/AQYopTvw4aiSOWG
 Lq/XEiE6rh/mC0gNQvX7oAvmNqpWB6+0LjPEDwDdsO9Pm1zRCNOpZwB/1TbgpAAeV8oL
 WLekZgZX9O27EznXUWJVouzIovZh0y222dlwwEexIKB84HLnfTqhOJb7Zgn+7rVJt0Cg
 RInSpLQ700ER5EAEr9FI+Nvu1FP/x5Oc1JQ+X636Lg6XvjZ02hA8J7SD1Z9uJYFob26q
 25MS52Z9TJ5WkfZFZlwPtNGT2ukkA+I6LIWzAKjtC24oKfgC+kF+Qg6B3H4gvapdh7YY
 IFwA==
X-Gm-Message-State: AO0yUKX6dBKsHlnw3eT8bbEFu5AhhtSH3YpNyx9JhPXdASmZCq6hqH/c
 xunP4j2mecCyW44m0zCapzIIuUkihb3uSFkJ
X-Google-Smtp-Source: AK7set/B7IwSxPui0ZhTaVH4tThrskCE52G4IYjjA0uWxs3OJoBcbrdcIMg21Hzq0d1dHi8d7PESIQ==
X-Received: by 2002:a05:600c:4da2:b0:3ea:bc08:b63e with SMTP id
 v34-20020a05600c4da200b003eabc08b63emr10631414wmp.2.1677506640929; 
 Mon, 27 Feb 2023 06:04:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003e2066a6339sm9029832wmf.5.2023.02.27.06.03.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 029/126] accel/kvm: Silent -Wmissing-field-initializers warning
Date: Mon, 27 Feb 2023 15:00:36 +0100
Message-Id: <20230227140213.35084-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Silent when compiling with -Wextra:

  ../accel/kvm/kvm-all.c:2291:17: warning: missing field 'num' initializer [-Wmissing-field-initializers]
        { NULL, }
                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221220143532.24958-3-philmd@linaro.org>
---
 accel/kvm/kvm-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 79b3d58a9c..86f7523833 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2361,13 +2361,13 @@ static int kvm_init(MachineState *ms)
     static const char upgrade_note[] =
         "Please upgrade to at least kernel 2.6.29 or recent kvm-kmod\n"
         "(see http://sourceforge.net/projects/kvm).\n";
-    struct {
+    const struct {
         const char *name;
         int num;
     } num_cpus[] = {
         { "SMP",          ms->smp.cpus },
         { "hotpluggable", ms->smp.max_cpus },
-        { NULL, }
+        { /* end of list */ }
     }, *nc = num_cpus;
     int soft_vcpus_limit, hard_vcpus_limit;
     KVMState *s;
-- 
2.38.1


