Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FEC3FF145
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:23:12 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpUd-0002BQ-Qq
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNw-0007m9-Kh; Thu, 02 Sep 2021 12:16:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpNu-0000fb-30; Thu, 02 Sep 2021 12:16:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id x6so3801007wrv.13;
 Thu, 02 Sep 2021 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0fp1qqpF59XMbIIHxComfWKKQIg8VIlTwHVvhBN59A=;
 b=G8+gv7/l02p+3pIOfkKqyIa3SJNJqqucn0S8o/siAkKaxmFM5RO224iTEbB1+wTzyT
 yH9VCpxFWBr0t0GXhQxQRUuO0CaUa3ZzEf3celJhLqjAbDckl1E6mqaq2dCEttikPZRW
 NTgh0ED5VO3rDtoACT4pDd4RK9nfKb9VvyIT09l58j9YQUutJPWiW1YUvmfRQD6MaciO
 hgQld4iTpFhaM+A7V2MEdU+/ZRnuTgXC5fBFAjpnxBcFkFzPQ9ZRGDj/1+tmyCyow8jw
 rBfrG9A0yoltXZKggfPRhQMqdG2T5CPTN8x3VdAjvEoK7uauTkkWkCFDPZbLzkrywDXE
 DO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P0fp1qqpF59XMbIIHxComfWKKQIg8VIlTwHVvhBN59A=;
 b=pmnUdRxMha45efwjXUO/dsKxsr6JCDkIRHNQj8i5k6DeBtqAwDe/KY9soa2ubf1C10
 Rl+jUCVyGjTOF6f2v99eCpux7OQW32r03/cZmhyQbktwdw7fkfHvk/SJcG1BjMTzZuML
 G6Y0MksreaRO94P1UCFs1hTmsKZL0gkNUjUhdx3USpHiI3KnnpaRLvQW0k5ciBJOG1Ga
 gnEasJNNk/RN18hU75lHCYxNTBGs0LiW9ZWr/j3uu09SudHMBWO79N2rLN6sy6PhI7NA
 lO8rPrpkRae6DIZ9mOIXbQRe1F4YwQBn/jaNq1lcGoZsKrZtEW8dbl1HEY3NwFwlJ8NN
 nUuA==
X-Gm-Message-State: AOAM530+5TpOWtjDFn7uCOnkiKxdtULFsxWcU68pii7rjLmpWBS+EoJt
 W02B5SiPVdJSxxt0xAP1ns9aumg52rE=
X-Google-Smtp-Source: ABdhPJxqYVZz8Vtdq+1rVuHAugWlbrJscT37rU3tWfkU/lcfKzRuzJ6gBh5u/Yi5SNrMElUTWFem6A==
X-Received: by 2002:adf:d191:: with SMTP id v17mr4847443wrc.345.1630599370860; 
 Thu, 02 Sep 2021 09:16:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l1sm2293844wrb.15.2021.09.02.09.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/30] sysemu: Introduce AccelOpsClass::has_work()
Date: Thu,  2 Sep 2021 18:15:17 +0200
Message-Id: <20210902161543.417092-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..de83f095f20 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,11 @@ struct AccelOpsClass {
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
+
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7e2cb2c571b..2a61dfd6287 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,6 +255,9 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (cpus_accel->has_work) {
+        return cpus_accel->has_work(cpu);
+    }
     g_assert(cc->has_work);
     return cc->has_work(cpu);
 }
-- 
2.31.1


