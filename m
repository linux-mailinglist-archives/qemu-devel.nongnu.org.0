Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF8964733F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Iw6-0003JM-1m; Thu, 08 Dec 2022 10:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Iw1-0003HU-4N
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:41 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Ivz-0006Gp-Lr
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:40 -0500
Received: by mail-wm1-x329.google.com with SMTP id v7so1354546wmn.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7RS6UvhOjqcYyu9Kw9e2FPYxya3Ny6m4Myksv2MLL4=;
 b=Jb/HWx35b+MtI6qBxIsRwbEw6joOnDCickQMBxUWMv8ACprcbix5ALhfED1cXn7zyP
 1e39u8vTM4eEAUw86m3FLwmt8IPHqE1LoYRyA0VP1apn/ZHnZrsoxZJYG/imRavJfplr
 O8PFqGz9twAjDzSFzgCvbXviB/s7n4P2xjJlqHXDyV+RoLEmUE+wU2HRXjaf5BoN9Pcs
 cyhnIASf7v2t63hX7ZpSLSFH9Mrn7NoQ/mwoVfizSw3m77UL4Xz0MOoxxN73ZeLtiVir
 o8CgfsmLIotwTbS3EfxSzBftxkvWvH1bY5hxcuVW30VPTET/qr9fXy6QGoGxJIDdLmxv
 g6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7RS6UvhOjqcYyu9Kw9e2FPYxya3Ny6m4Myksv2MLL4=;
 b=lehwYQdDO3MJhPJJkd47PVnYkDaJkpxCWqIQ8f9NVZLhEzQHIyAqzw8VfpcVNLSDuw
 D+6AzuoSWSf1esElQgiTNm2YB/eAEeB8+LRGSpxUxlaBujk1JOetKPmnWWFEmxib14qA
 ittLmLLqUo4nJi/TvM2ZVru7nq02CRhAGwOXXRmJfHEiLzukZPaB3CQrt+GGQQPDMuXO
 qIKzvvnpTi4J0xKgnB6ltjKCbWUUVY8KHwGjyY3BC2Ga5BoQ6Xk5ZbNqP9gq08d2H1b8
 u6opxGCjdyrq3brJtK7CwxLn/aauv746nXcgGTlxjoW3ue0SIhFjsPEfQVKBBZDgueWk
 t+/Q==
X-Gm-Message-State: ANoB5pmibUsY6qAMKZtfG4KClMsqY8LuTwXS+ofDE9H2MLRa9DNi2yes
 p+0OGR6otTgTwh74BTvMhA3ij5k7C9rkjPl+GbI=
X-Google-Smtp-Source: AA0mqf5GRks/FSj81VAor7KpuA/Da36aH3ckWQFqynuKRTr7/83Wm78Sk7brGSoOwvfQFhftwSqj+g==
X-Received: by 2002:a7b:c358:0:b0:3d1:f882:43eb with SMTP id
 l24-20020a7bc358000000b003d1f88243ebmr1952493wmj.10.1670513738126; 
 Thu, 08 Dec 2022 07:35:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003c6c182bef9sm7940862wmq.36.2022.12.08.07.35.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:35:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Chris Wulff <crwulff@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-8.0 v2 1/4] cputlb: Restrict SavedIOTLB to system emulation
Date: Thu,  8 Dec 2022 16:35:25 +0100
Message-Id: <20221208153528.27238-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153528.27238-1-philmd@linaro.org>
References: <20221208153528.27238-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
case of reset") added the SavedIOTLB structure -- which is
system emulation specific -- in the generic CPUState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..bc3229ae13 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -222,7 +222,7 @@ struct CPUWatchpoint {
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
-#ifdef CONFIG_PLUGIN
+#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
 /*
  * For plugins we sometime need to save the resolved iotlb data before
  * the memory regions get moved around  by io_writex.
@@ -406,9 +406,11 @@ struct CPUState {
 
 #ifdef CONFIG_PLUGIN
     GArray *plugin_mem_cbs;
+#if !defined(CONFIG_USER_ONLY)
     /* saved iotlb data from io_writex */
     SavedIOTLB saved_iotlb;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_PLUGIN */
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
-- 
2.38.1


