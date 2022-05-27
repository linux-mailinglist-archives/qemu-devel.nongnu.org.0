Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AF536512
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:55:52 +0200 (CEST)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucJa-00042b-Rs
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8A-0002Ud-FQ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc88-0003rG-Pw
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p10so6350604wrg.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFdPsByYSEBzYukReKoi3Exni0nk2UbuM37vz3BeS0s=;
 b=o5apqtu1IVmgpuMSCKmDrnYxCMmD1l8OiU4qVj2uyRCGrvbateLd0oDy9+Ym0kWY5W
 JwKG7SJsmmTCkdgS7E3/Za5MJ79DXlfGOB+Y1E/os7XYTmKWgigSBpp6nlcAKlPs0ZQg
 udDc9VopRufSogkUo6hoR0/mIx3fko5OLamTJE7FX/boNMmrV34zXVk7k2cL0kprVKQj
 ita7gqXLu9JfC1C6h+lXF3IFI9Qgq0MY25GrbAw+NB7Cvbe3s/O7RM53SBwmfhILQiHA
 RGQsX3Yn2NcVJb9m333l/NnTEScsxXNoYChNcAgsRci6y4PAKx8ukG2gB33VldPF+/Rh
 lJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFdPsByYSEBzYukReKoi3Exni0nk2UbuM37vz3BeS0s=;
 b=AIEgGZs8k0u/peyQLcQes9rjNqOvgw+x9yFrpsFY3HkeFdGM/zTvlwU3gc4o715WsD
 GjSE0S0EKjOPVvZgGuTZQSodnSOraDPfJ171TAPRk6CyrsOJXQVA2xR1/Ygy2fZ2RdrH
 p1Usex2mG3TXYOK1VJRQlRD4sbK8Q9wkhkevd0JwrdbPNzaotgR+0jZ7nMkDp8VIAcod
 P9iEPBe0PfeQ6MqHZjULmAmD2PWztx+vDzADZ6xewn/9Xt7sKGTv4o0Pbxcl69gk9pOK
 vv2QvX4/RvtBhZkISiqUwdPi4obFoJOcB9bUvLjinL+7MfQY9QHzWZkJ8Nokvd+wRENf
 /ZSA==
X-Gm-Message-State: AOAM531KsQEy9Rnuo9IzSjB2xYTGS8bDpgaS62aBkGkkUdJkQiGLJTRi
 8b1257jOAmIXjhqW7azLSNCEcw==
X-Google-Smtp-Source: ABdhPJzMLBjajKA1bhn/t6Os+E9YfZ5sPmAy33IwAFDvJRgLwhvQoyuwa1BjfmaAwIAfAq19BExAAA==
X-Received: by 2002:adf:d1a1:0:b0:210:1ed7:b3ae with SMTP id
 w1-20020adfd1a1000000b002101ed7b3aemr2051002wrc.650.1653666239127; 
 Fri, 27 May 2022 08:43:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a7bc84e000000b0039771fbffcasm2447778wml.21.2022.05.27.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:43:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 534BF1FFC9;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 17/33] tests/tcg: correct target CPU for sparc32
Date: Fri, 27 May 2022 16:35:47 +0100
Message-Id: <20220527153603.887929-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

We do not want v8plus for pure sparc32, as the difference with the V8 ABI
are only meaningful on 64-bit CPUs suh as ultrasparc; supersparc is the
best CPU to use for 32-bit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-7-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 691d90abac..59f2403d1a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -70,7 +70,7 @@ fi
 : ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
 : ${cross_cc_sh4="sh4-linux-gnu-gcc"}
-: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
+: ${cross_cc_cflags_sparc="-m32 -mcpu=supersparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
-- 
2.30.2


