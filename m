Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B481689C5D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxTy-0001tF-Bg; Fri, 03 Feb 2023 09:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTo-0001sT-UY
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTn-0005tV-Bw
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6206658wma.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZif2it4bxphJIlcF0dFkRLHSBXoWvT693QwJQjGzNo=;
 b=e65UkPC5QmpQDXpDZHki8/zuv9g086olkHcGAS66BX1U36sGP9oqOQf4gfvLXbmgWM
 ist1JU9OllFI7yZCBz6tNz6Ha/Ggei4zZSLQlDvRC+oetWcabyhOVeDcHTKcfE/DeOXT
 UlGqCAdz7du7/qgnw12RyoKAAetuy1z94c84H3hjNjLeW+PcZ5U7DVDaMLJ7lxhPexoJ
 7jWJoIXNxbYR1XVgjE4nrS34K2iwKa+Fty3/Y9CwuYFmLH5RIrznYxJNDAPD8lsJEfUP
 P3jb9eGztYmj2MmzbdXCcLIFEU/loAdFWayXAa0CLBy7FJIdV3Cx8dFVHr8zwUYJFjJ3
 r1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZif2it4bxphJIlcF0dFkRLHSBXoWvT693QwJQjGzNo=;
 b=mnaKCuqcNvVOgfbiinkkqR1XH6YB49E3VmsvAlI4Gv4vCzEjTt+T+rrZ7xgv7ouU8B
 Yl4sDGDxRHMskJofr1hNbnBA7GrnR1TWDkUxG1DhTw9+DVNqzhd9ARmuEqfmzCNAhTqj
 T1IR0103VIqM9jK44lXzQ28zblSZ6h/X9T2IR1w9ugANznbrwL8kxewSK1PA8hHuzdND
 n7n4zax26ueq4wyy2/Z2QNvQBX/x6FZxFv+Pm0cVj9B9efMqDyZVzF+aOwstMJxt7Hzd
 WiSOWa1jWWygqaShc5Wbp8ggFgJLSEAFhmZ/lvkHrkYq3ypJdG0lV1NYSohkFTtcDS0D
 9R8A==
X-Gm-Message-State: AO0yUKXiPMkMcf4557MGpmt3ddxwbwu551D+dzbNqA0PI27r3WC/bMiD
 CP1UIPeJDz3kIJZl8yCpLxZKE+BTCeLyjpaR
X-Google-Smtp-Source: AK7set9blUJXFTFwonzntANn6BA7jPJxh/f4xqrWpo/W0C/r+bbJ6zSRo0JaeEAURLj7oGV8HqFe7w==
X-Received: by 2002:a05:600c:3491:b0:3db:fc4:d018 with SMTP id
 a17-20020a05600c349100b003db0fc4d018mr10875768wmq.40.1675436153732; 
 Fri, 03 Feb 2023 06:55:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfd083000000b002bfbda53b98sm2162717wrh.35.2023.02.03.06.55.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 03/15] linux-user/syscall: Do not open-code
 qdev_unrealize_and_unref()
Date: Fri,  3 Feb 2023 15:55:24 +0100
Message-Id: <20230203145536.17585-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

(See commits dc3edf8d8a "Convert to qdev_unrealize() manually"
 and 981c3dcd94 "Convert to qdev_unrealize() with Coccinelle").

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..9299f71126 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8642,8 +8642,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         if (CPU_NEXT(first_cpu)) {
             TaskState *ts = cpu->opaque;
 
-            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
-            object_unref(OBJECT(cpu));
+            qdev_unrealize_and_unref(DEVICE(cpu), NULL);
             /*
              * At this point the CPU should be unrealized and removed
              * from cpu lists. We can clean-up the rest of the thread
-- 
2.38.1


