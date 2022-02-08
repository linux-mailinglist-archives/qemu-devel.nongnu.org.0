Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA34AE039
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:00:09 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUme-0005Yz-8O
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:00:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKr-0008UF-8U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:17 -0500
Received: from [2607:f8b0:4864:20::42a] (port=43537
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKp-0000KJ-Q1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:16 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d187so19401177pfa.10
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQziwPFjJgRf1SMHEEYubQGyoFdOJoEaOKsr6/z4KWY=;
 b=gFZsnxGjj6rgke7eAHiGDB3OQ1RMIAJvwBuiJy1huFHixdKIWI3NDq0TsyY7wwZpmc
 SKHlcgYAZmPQb3XGqhuQB+YCiIdMas976mlx0DB+xwfQMjGQUxf30lkEwublxHfZBvv0
 uK47uUKTrNj/bfGjOtEceFt7PtR0JX/F9xCT5u9sAhsWYk6f5zEfep6COfkARn+4W2oL
 mp0jvDAX6Z3ZfmHKEh1ADGmVla2+4YJVX1w+88VF9GlSYGxRvrzfAVUWivwmVqzkZHNR
 zN1v3cKsA87j5mb0G8hVHiscngR2MUkDlJ86+Exwbu8L2rP9Y6EYjQkZ7HMSujdf38bJ
 KXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qQziwPFjJgRf1SMHEEYubQGyoFdOJoEaOKsr6/z4KWY=;
 b=4Yt/sPL586tTDJv3eXw4AurZ0nScDy+Lp/Erq8EkK6/HBLi8zfFB6nntjMFGHqMJ5D
 F9/E7Y3hezWTzMPoi8geeSBoZzCrdU8CVDUjnRL7+VdaNRFUdhUTwG32ud0DtVh6w2GP
 sXy4tzhHYlxB6s0pA/spestnl9RN+H8TOEmvSn8j3urbh9qZFzLCYSDygO3tMB7zxp/o
 i1gzU55Ei0p08DQ3LyCftbL+IP1mlkXVHeLP5rhvZGApNgT7QoA/9UsMJukmEcwaUqr2
 tEY7W6gwIErqjif34nh5aDlAhhJFsO3WIDArwH4429A6qCIq/ugyPKrsWSpftNAY9p4l
 yokg==
X-Gm-Message-State: AOAM531Gah+MmRoHNw1p9ioFv0auub2fJF6f8ID+8Nv/daB7Qj4li8Nf
 QaYEfNRUVyzBD0TwalStLtipml7TRhg=
X-Google-Smtp-Source: ABdhPJz1PrUb4Ek7aiMsrNxkpjZIPUFK1i8axmy+3sXzxzGbdHyZ/USUFNUSwmuq65RBU8PzK7KNlw==
X-Received: by 2002:a65:57cf:: with SMTP id q15mr3832802pgr.307.1644333794120; 
 Tue, 08 Feb 2022 07:23:14 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h6sm17563900pfk.110.2022.02.08.07.23.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:13 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 03/13] accel: Elide kvm_update_guest_debug by checking
 kvm_supports_guest_debug
Date: Tue,  8 Feb 2022 16:22:33 +0100
Message-Id: <20220208152243.16452-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 5 -----
 cpu.c                  | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 7e0fb884b9..924ffbde85 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -46,11 +46,6 @@ int kvm_has_many_ioeventfds(void)
     return 0;
 }
 
-int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
-{
-    return -ENOSYS;
-}
-
 int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
                           target_ulong len, int type)
 {
diff --git a/cpu.c b/cpu.c
index 97d42b6b2a..834e2b4cdb 100644
--- a/cpu.c
+++ b/cpu.c
@@ -350,7 +350,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
 {
     if (cpu->singlestep_enabled != enabled) {
         cpu->singlestep_enabled = enabled;
-        if (kvm_enabled()) {
+        if (kvm_enabled() && kvm_supports_guest_debug()) {
             kvm_update_guest_debug(cpu, 0);
         }
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
-- 
2.34.1


