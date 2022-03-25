Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17584E6EB7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:17:08 +0100 (CET)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeC3-0008K0-QJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:17:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2T-0007zc-4J
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:14 -0400
Received: from [2a00:1450:4864:20::52b] (port=46729
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2Q-0000XQ-8t
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z92so8132075ede.13
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MTfTM5YhwEohgITY6SYuE6xcO+g6Qsatyh2PCd2K4s=;
 b=WjPc7X+tvMG6aDnvS0Rwr6lgh+cSW+N/pF7/ZNS27Zu61U65tZX3LS16hpJk7zQ/ib
 g7kH3RX5iAQzyAG4LnLhVIhiB6in2XjokWuj6f0fpAAeuBrp31ZtwzK426aup7WPIWXg
 5K1f0OHK4Hp+qn5Y8zBrr7vUPpajJuLwTPdgk8ho9Wml3wW+5lmmaDlvNenI5ZA3RYQL
 XbAf7e+kUay0YtV4NZFNVXQgDspZVrYa8KIs5CtUpRSNhu3pyYM/9ELFqa4LMsdzy52B
 YSRH0KKRAtbfz4xQzpv3SI+U9D8ZUdLEx4tbokuWWLHp1pdOdx8GSZMdsVfyCy3ncv8i
 Sm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2MTfTM5YhwEohgITY6SYuE6xcO+g6Qsatyh2PCd2K4s=;
 b=twBFk3YdwuhVKhBmHMqo3oIqGj8srpVFxXwH5n1OcWk3nPcFwqxkYJRdHxMXPOG+n2
 9jFkJlNFt92XVRKClRUTWMUx8+WxZUTj9M2Kaz33kzqtmWBueiynL3gmpVan4SIrwmQg
 ZT+8VGIBfgoxrPPIEbQ0RYGhNOaRbexSRtbG3JMewn8s0HFvJRfHdhzuIou3L9k2kQeN
 qsS4H55mB2wzxUK+8WPhRzhXDJei8VSJr8CskZxie3lIoKyCD+DydoAqhX7YX9VHqzRQ
 fw/xy1N1MOkbskyu1UPvwe6s1BgzBqAim0qL4+TRf09/MCH3Mt5Pra1vfNhQqvL0OhJU
 um9w==
X-Gm-Message-State: AOAM5302IX8ZzxX0vtOao3LTc2eRQubvcf3YfWXGjiCrs85Nm5r5s1f8
 YNh2ugondpIUwJ9FU9bjeHnVkk13v6s=
X-Google-Smtp-Source: ABdhPJwazMQQ0SKXFHaTDksvYrhYe/Z0+YtZFxg82jSgT/q3byW/9cLGTkmbeP9dZ8oGbJ56HfTmUQ==
X-Received: by 2002:aa7:c755:0:b0:419:2f66:e22c with SMTP id
 c21-20020aa7c755000000b004192f66e22cmr10906888eds.381.1648192028850; 
 Fri, 25 Mar 2022 00:07:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] target/i386/kvm: Free xsave_buf when destroying vCPU
Date: Fri, 25 Mar 2022 08:07:00 +0100
Message-Id: <20220325070706.271291-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix vCPU hot-unplug related leak reported by Valgrind:

  ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
  ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
  ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
  ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
  ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
  ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
  ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
  ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
  ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
  ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
  ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
  ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)

Reported-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Mark Kanda <mark.kanda@oracle.com>
Message-Id: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 06901c2a43..7396b430d7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2081,6 +2081,8 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    g_free(env->xsave_buf);
+
     if (cpu->kvm_msr_buf) {
         g_free(cpu->kvm_msr_buf);
         cpu->kvm_msr_buf = NULL;
-- 
2.35.1



