Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4BE6A41DE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcmj-0002Id-SN; Mon, 27 Feb 2023 07:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmf-0002I9-No
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:13 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcme-00019u-3w
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:13 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so3225763wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pf4dkpomuShNtDbIGeS4jqeuc3YeC/+4/WK63QVYcPo=;
 b=KygtJaO2t+6gK523+gLGwBeEc6ySuw81LzDx60R3KU2laBg2gQ8rYEa4vtyzk0a64W
 ldR2ZTSS5JY83VXlbJKin3rkEz4EtiW0adnG96cq+Mez2iB/Rj1ld1Wc9VwYiH5eSwPE
 jQdxKo4tOWadqvwZq6Z3vRMEsJXaxZt1uazCxnog3hhcVc3wkS2ogFx2P0WyC/gc92XQ
 8rXvrFiGMOIJZ51TX/p6xmzlhvhbKK03L0B3h7K3gfGz5ccyddurD73CunkPn8YSQv2q
 X93jd+oR481cO6Z+nfMU1F+aASvqLk6+R7uXPkdupuKDHZ54nqlTtdDl/LpsAK/iPnlL
 IjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pf4dkpomuShNtDbIGeS4jqeuc3YeC/+4/WK63QVYcPo=;
 b=1Fd/UczuVxz/NcgnSUvKVCmivNFwKKVQzkceaSMYBBUWHEhFBali5SeraGHhmmeWNa
 gP6aU48fD7ArROpz34/kNKFXAXQh2NygKA0ph4U+9qaqliGoG78Tu6DppCEgmwXL3WFe
 Kj16lzXnYp22/J4wqJzI+1XWqEH4pPhms7rCmcoJoCaEA0wg6HWwu+KyfvCdEuY4ZgxS
 V6iQhlXPxtusBfQxO5CKyV5yKov5p0RoMIn6bziO2aqq3a2JJUu69/bt9Xm6LDwEhxdp
 W9yxZRCBshE1dZB5LY9xgftqNfHjgi/L/no+y4laIYCMvKcEWKpX/t1qKp+IDszIC/5B
 PHHA==
X-Gm-Message-State: AO0yUKU9goY88w33S20c21WT7ihoWoNBWHCVlu3++DE5fBKbwpSV8aDH
 KOaefeqnB2krf6Q0A2N0FKl2K5c/YFqBcHCL
X-Google-Smtp-Source: AK7set8+d7GjcAYcv4kNNl6cSHIB12wa2dUstI/Exg3lmoiArHnmmty9x6nbnXAcTuUiYwQlfeNc3w==
X-Received: by 2002:a05:600c:2cd8:b0:3ea:d610:f068 with SMTP id
 l24-20020a05600c2cd800b003ead610f068mr10147239wmc.33.1677501550290; 
 Mon, 27 Feb 2023 04:39:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc416000000b003dc521f336esm8764583wmi.14.2023.02.27.04.39.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 003/123] cputlb: Restrict SavedIOTLB to system emulation
Date: Mon, 27 Feb 2023 13:36:47 +0100
Message-Id: <20230227123847.27110-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216215519.5522-3-philmd@linaro.org>
---
 include/hw/core/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 671f041bec..56cbe9e678 100644
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
@@ -409,9 +409,11 @@ struct CPUState {
 
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


