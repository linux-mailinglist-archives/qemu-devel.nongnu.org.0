Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F16F6D7985
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Dv-0006Mi-In; Wed, 05 Apr 2023 06:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Dt-0006Lo-6G
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Dr-0001z5-Cn
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id r29so35613444wra.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6NW9VhhS5fLeVwZeTyWWyTbAHfvPOC/r0zI8X/AYhw=;
 b=FrtFKE2hFxCwSIOxwL7fJNJgclFtRZYFCKSwPQeumlgt6bklL8ZJLOhaxRanBaGmBN
 sSSdwoBuo0PWQIPC5aVYpH3V4lrlZrxSnF6ec08aPzNngc+4NCJth/v+YEXjEI5hAYZ7
 deplHkaFXLIdswcAyfQjoGU7HHGPGzJHJzztDL7n6LAkZeMYnyvPoi+3fXYTgBgP5XWs
 cPr7wmMyCDh4HsAHrXF/xlBABJq7EFQwNi0Rj4haWnYMHlXIAYY+Lsa8OGwO4Mt6ZR/d
 e7uyZyaesG4XjKKufoRM2SpXpgdAnFrSp25xtnMkjXzs/M6Ow7DNjd1C6Ovjn8q1Umho
 74DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6NW9VhhS5fLeVwZeTyWWyTbAHfvPOC/r0zI8X/AYhw=;
 b=mitwX6sbQ91tYx1e7DIQcPH1gMU6+aakMMAC91vfGAw+7U/NKKetW9h4yDEC3V4g3r
 DNko2xDEgTjZ7mnyegtd0AQ/iAayPzs5EJXtgU8jS+PtW/shkPQkWnj1pPDe0L4wTD1E
 96LSxVxAIjvGcUyMWwPMuP77BvG47CxHE6KjhOl19etOCIhhstgTdnJpQDu2gxpveei+
 EwwGG926fSH78WohETunCx2fWExyDgPeK+JukddNHSROx6AOToN3sCKnxWvpmWKZPAgc
 OWX3ktRt8Cg/1ZF9vCQ/pN2kfitfXy2aUYS6JgbdHnmOJlvhHcPVDwqSTpqcQUp9Q/yM
 TrzA==
X-Gm-Message-State: AAQBX9fbEg27yFcJeAzHZOy7CHNJNtbhPN+vhpYepFWer2Y6ohEoih0o
 Y2qK7tTOhcO8cinvv6VEoPZKW+3qnVGApSmocpA=
X-Google-Smtp-Source: AKy350YkinPPwbt/c64vUzk9lM4SXacH8xjrAIzv8V1BeCK80tQHniLUzIE+5w/+4XbN335yprpGWw==
X-Received: by 2002:a5d:4d11:0:b0:2ce:9819:1c1e with SMTP id
 z17-20020a5d4d11000000b002ce98191c1emr3913343wrt.30.1680689913858; 
 Wed, 05 Apr 2023 03:18:33 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adff849000000b002c56af32e8csm14637033wrq.35.2023.04.05.03.18.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/14] accel: Fix a leak on Windows HAX
Date: Wed,  5 Apr 2023 12:18:00 +0200
Message-Id: <20230405101811.76663-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

hThread is only used on the error path in hax_kick_vcpu_thread().

Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hax/hax-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 3e5992a63b..a2321a1eff 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -205,6 +205,9 @@ int hax_vcpu_destroy(CPUState *cpu)
      */
     hax_close_fd(vcpu->fd);
     hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
+#ifdef _WIN32
+    CloseHandle(cpu->hThread);
+#endif
     g_free(vcpu);
     return 0;
 }
-- 
2.38.1


