Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B0E4AB734
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:06 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH01B-0006Hm-5g
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysz-00063u-Fj
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:35 -0500
Received: from [2a00:1450:4864:20::42a] (port=36529
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysu-0002JC-Q0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i15so732960wrb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyD35wj+M9wCKuPYo/oN1VkE+12kmsRLo0hvXa1frww=;
 b=YiuEmoT4ZPZ4rrRIyE/zZpCyVPiTdQUKjqz0bue3MMIEyW4GhKRjA68butSXTSL9ys
 X4lcMqc5urCEVVrZCUDiUi7atFBFamY8qlqbVKxrbuAJKsNWbmeNGbQoxYXeG4efk81q
 T1ZTpcK9sBo/COnBj6yJ2MMpQ8bMXrt3h/TUpxRG1GTMjVKJi2k7ohXVI5TuKYJ//u4r
 5ULFknX3eGa9EFngaG6vJYTwKHYdqy72hu4Z9brU16Fh+/FdlcivVbEb2zAQRAQHL0W+
 02wprnGf0HNIGGNKHcYZ5VEvbnzbLxBbsWloa/RH4FQ2tAEKtHHGn94WE7dlYc0yXf/n
 uFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AyD35wj+M9wCKuPYo/oN1VkE+12kmsRLo0hvXa1frww=;
 b=FL9RscV2Le4UIElLId2E98bdMP93dKGml58agObG83HGKfG3QphFDHHpqOsSPof5DA
 msSZxAuK1irXV6xO1IuhKzQy3ZC09JYhKGm6ZcC6hGqshJWetv2D22I7s6j1c7YqaWw3
 ryrtnSy0UoFLMLiARJWlWduA1UQ92+L8AN5u0qxGuDcNNRcH/4RNn0mY1p5gYCELDtA2
 ScJyPeBWNgTL1nz5gj4p1TctjhZPzEMaFZNhlDGAMshYhA/N2tyQClFrh5OVi1pLJ2Vr
 xtH8g9usWkNYvCEIJ9XnBex4OdxjZYwdRIM3GHXwF0PK21MkVIF7+ZWV+pU5GES6vfCt
 NgEg==
X-Gm-Message-State: AOAM531tyAoZMOlB4q9WPyPpbM+qhsjBWbZIYlXj/VkjImKQdxZ+LvmK
 Hz+mijlgl0UHezDhO8hvemhKZjQFj+A=
X-Google-Smtp-Source: ABdhPJwM5RQ+6LQ4sHBcvEPQ3BIC+mPaevT80YLZJDBfvuCL9UF/S1dQBzuDUI+Ns9SfpjsSf2xUSw==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr8744567wrq.41.1644220565244;
 Sun, 06 Feb 2022 23:56:05 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f8sm10751548wry.12.2022.02.06.23.56.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:56:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 21/21] softmmu: Build target-agnostic objects once
Date: Mon,  7 Feb 2022 08:54:26 +0100
Message-Id: <20220207075426.81934-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Various softmmu objects aren't target specific. Move them
to the generic softmmu source set.

For our 31 softmmu targets, this is in total 330 objects
less to build!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/meson.build | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018ab..d2badf203b 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,20 +1,9 @@
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'arch_init.c',
-  'balloon.c',
-  'cpus.c',
-  'cpu-throttle.c',
-  'datadir.c',
-  'globals.c',
-  'physmem.c',
   'ioport.c',
-  'rtc.c',
-  'runstate.c',
   'memory.c',
-  'memory_mapping.c',
+  'physmem.c',
   'qtest.c',
-  'vl.c',
-  'cpu-timers.c',
-  'runstate-action.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
@@ -22,9 +11,20 @@ specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
 )])
 
 softmmu_ss.add(files(
+  'balloon.c',
   'bootdevice.c',
+  'cpus.c',
+  'cpu-throttle.c',
+  'cpu-timers.c',
+  'datadir.c',
   'dma-helpers.c',
+  'globals.c',
+  'memory_mapping.c',
   'qdev-monitor.c',
+  'rtc.c',
+  'runstate-action.c',
+  'runstate.c',
+  'vl.c',
 ), sdl, libpmem, libdaxctl)
 
 softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-- 
2.34.1


