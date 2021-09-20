Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B154117A4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:53:54 +0200 (CEST)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKg5-0005d9-Ey
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9b-0002lq-S9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9F-0000nt-4V
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x6so30159139wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sFTdYfwW6b0P/b9Km2EVlduVHBBgi2g9eSVhZ+7nQY8=;
 b=dz3umfXKJA1R4kKSHzyujB9fmfm28rtMGvLdguF5BN2TvyJ00Yk1Jr9Uips86ucObU
 TqiLp7Uq5kNtTZ4rnwgZWgiAutvoJ7XhGyqOV4dmqvt2ewEOPr5gj9Cz793gKxx8rclN
 QYnVjdy13YJhBRiq/nbbU8mUg6/MqLC7AHmSb91RTqI9qY8Be+8kU/CkPCjACPJ72enr
 6VqQ8R+2Vkg6cPjLHKmNFJrCyCMwWlZbU9WIAHhDdiYav2sR30BVPd5XZnxPtpswwmUc
 ycUX0FGLf2cAF2noINjuBzQ9Vf4BN/6eewKGEzjXPRdB75uWfaQTLTguNlwp9o6BpIEr
 BmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFTdYfwW6b0P/b9Km2EVlduVHBBgi2g9eSVhZ+7nQY8=;
 b=BaQ+549npIq/hFjhmmBoWXhH0hKMQbF3vnRscFLQvjQYmGZnjaMqFM/ra9e5JpKJbB
 5nnvMHYoIjB7JOJk/F08Q6DnGm6lJyHxM502GJQ1eapqhRKF3CDdWYEuwGeJIGDY4f/q
 moY1K3Qt9jsZU11KBd1MTrkIhynSvIdcHeG5TbINi+xeql2DoG3KB9iDzokhEOyUqiZ1
 NCVZbFxQaEhieO3123BsBzmQ21WYD+hIBJ4mci+qV8SlxP2IE7+OyTlUzAEj0OMzcWDi
 zxxmXBSJPidtc+GRfEHUEA3tvBMiRYjmrfNr0P6WfbDsOfSGKvop5J2ZlNfucoXAoofX
 Nbkg==
X-Gm-Message-State: AOAM533dfJQ8zj+4Lsm2E/IzmPDD7Zrc9JY7FbP/agoGP5whkRIj/BJ4
 Ub3u6qVjTZ7nedFDYBYFVE4CAd1TvlNNDg==
X-Google-Smtp-Source: ABdhPJwvUECHP8OgCPFlPEsdHHALvq0sRHISI1MtIN4+J9IXt5VqX6EKndaF0Jjok1eQ3kMmPiUeTA==
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr13489426wmg.47.1632147595753; 
 Mon, 20 Sep 2021 07:19:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] hvf: Introduce hvf_arch_init() callback
Date: Mon, 20 Sep 2021 15:19:29 +0100
Message-Id: <20210920141947.5537-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

We will need to install a migration helper for the ARM hvf backend.
Let's introduce an arch callback for the overall hvf init chain to
do so.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-4-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hvf_int.h  | 1 +
 accel/hvf/hvf-accel-ops.c | 3 ++-
 target/i386/hvf/hvf.c     | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 8b66a4e7d0d..0466106d160 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -48,6 +48,7 @@ struct hvf_vcpu_state {
 };
 
 void assert_hvf_ok(hv_return_t ret);
+int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 71cc2fa70fa..65d431868fb 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -324,7 +324,8 @@ static int hvf_accel_init(MachineState *ms)
 
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    return 0;
+
+    return hvf_arch_init();
 }
 
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 79ba4ed93ab..abef24a9c84 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
+int hvf_arch_init(void)
+{
+    return 0;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
-- 
2.20.1


