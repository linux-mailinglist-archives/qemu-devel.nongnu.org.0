Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A534AD883
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:07:42 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQDc-0008Ig-Nq
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-0000ib-RJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::336] (port=53048
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023t-5q
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id v129so8397744wme.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=le1kGG0BoHfz96RIYHeCxoomGYMoeJRnTLdNe+CpqI4=;
 b=Ih+uk4lB9A5JfkfRvg4eV8DDhFX1rsc9iThyGNmRfxYVddgfIIcD7o3G6ROf2ynpRR
 l+MbA7pq83nt7IKUx50FV0RVFt9wNCWkMD4C0qxOtjVj0dUHjhT8UkfmbsmGEIpkzPnO
 91vIRYRQHvLyaYmiesfQnBkqsqJ9D5mA2IEpA2PDPC2xDYMyU0bjoJAUTBN7IKp2hQJe
 VP3Q94d07SMvnXnsivlKIBSv0yJvxm7yDP9yr5UFzeDwEx6YOLrMAd3u7Gmp2t1YA3he
 V5Z/rJw83SPmrFlOH2YlRt0cyyGExHnkTgMFd7ykon6iQjAEwFHgnoj2k8QWcbX8UV+r
 LI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=le1kGG0BoHfz96RIYHeCxoomGYMoeJRnTLdNe+CpqI4=;
 b=Kfo3cfxsMY2hNUTQlDwptllinycxzUhXy9SrnRUB2oWBXkr9HygTcVe2DI4qEi0Hou
 RzP7p0huvcDV4wszByZcuwmeUEZimCApNN2Wq6HNn9VfN3PCNm7zq4/j0wE7TLNPKxmc
 mJFAKuY3tJc7mNClD7iNIJAAJgWDtgq2gncn7KJzqmtclE7mDprkpdGF4e0JN4c8z9ZS
 UaiQX9WyVhLz5dTdKThliFAQO88hlHOu5ml6XcqN5cVEVvDN+SfeEH5Z1m/KTvyfkg+b
 5fkGILxAodpKCGCd35Gs7fTrTLEsA3djZfNqi1H3+nhK2kxVaocCE5aXwqj9LlmNgkrm
 2kCw==
X-Gm-Message-State: AOAM5332p1/utt7Y5M/FDmFMH7xUOrFud4mSV5k3XpVLCFQaLtK2/cXo
 Is5X2xt9Hde+t2/n7nN3rD75P7QIAT5KDQ==
X-Google-Smtp-Source: ABdhPJxN7xHKK0cpowy+3lp2m3iLKvDGEyV5vJ8Mwt7CUEICI95c689pvhBmzw54G22rJcV2b0fCFw==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr776476wmk.140.1644320394794; 
 Tue, 08 Feb 2022 03:39:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/39] cpu.c: Make start-powered-off settable after realize
Date: Tue,  8 Feb 2022 11:39:16 +0000
Message-Id: <20220208113948.3217356-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The CPU object's start-powered-off property is currently only
settable before the CPU object is realized.  For arm machines this is
awkward, because we would like to decide whether the CPU should be
powered-off based on how we are booting the guest code, which is
something done in the machine model code and in common code called by
the machine model, which runs much later and in completely different
parts of the codebase from the SoC object code that is responsible
for creating and realizing the CPU objects.

Allow start-powered-off to be set after realize.  Since this isn't
something that's supported by the DEFINE_PROP_* macros, we have to
switch the property definition to use the
object_class_property_add_bool() function.

Note that it doesn't conceptually make sense to change the setting of
the property after the machine has been completely initialized,
beacuse this would mean that the behaviour of the machine when first
started would differ from its behaviour when the system is
subsequently reset.  (It would also require the underlying state to
be migrated, which we don't do.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20220127154639.2090164-3-peter.maydell@linaro.org
---
 cpu.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/cpu.c b/cpu.c
index 016bf06a1ae..3ea38aea707 100644
--- a/cpu.c
+++ b/cpu.c
@@ -196,13 +196,33 @@ static Property cpu_common_props[] = {
     DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
 #endif
-    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static bool cpu_get_start_powered_off(Object *obj, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    return cpu->start_powered_off;
+}
+
+static void cpu_set_start_powered_off(Object *obj, bool value, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    cpu->start_powered_off = value;
+}
+
 void cpu_class_init_props(DeviceClass *dc)
 {
+    ObjectClass *oc = OBJECT_CLASS(dc);
+
     device_class_set_props(dc, cpu_common_props);
+    /*
+     * We can't use DEFINE_PROP_BOOL in the Property array for this
+     * property, because we want this to be settable after realize.
+     */
+    object_class_property_add_bool(oc, "start-powered-off",
+                                   cpu_get_start_powered_off,
+                                   cpu_set_start_powered_off);
 }
 
 void cpu_exec_initfn(CPUState *cpu)
-- 
2.25.1


