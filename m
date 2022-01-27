Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808849E75A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:21:39 +0100 (CET)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7Wk-0008Ok-6O
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z2-0005nh-Us
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:48 -0500
Received: from [2a00:1450:4864:20::42e] (port=38415
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z1-0008F5-5y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c23so5576526wrb.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1aqUKgcmvQE8aZsdzTIh/HJBOol3bJPDnt7wTDARukc=;
 b=Cn44QfOnJG+10CY0wnxF80pK+FJRySFh9/1bfa4BL5l2M+oH7ur0a+xftzVc7YNVjd
 u8uDJ64ZooHtrDZkWCJIGe7SmyjBHp4nIwiUpJKNuPlyWDeXJry1LUyAun4S8mN8A1+K
 ZwUxEcaZvI2P2NogO6KiRQWS+vzpdsIqphkuru6ZYE+tn1cOiRS/Yc+KOwcTJVnmhHZM
 1UVmfDyN9yDt68K07b4L7NkGho+sZ3mMRIzx5/smGJktS/xG4d84dbBiJd/etTObsZSY
 NkcFFfr75gZQ62/DRguCgQ4d0a7zKLXBQaDW8DHp/vamIzTtE7CqWar/ZOJ5uDhHLPUs
 I3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1aqUKgcmvQE8aZsdzTIh/HJBOol3bJPDnt7wTDARukc=;
 b=4PBD0gc+cZnN59RsLLmqB81HCI1bmDgOsHu1BI740Cp9/DVW2AYgIsXmhH1aNB9QVE
 ZGNvdpmseom4so/AN067cpKO2JRML0NMgAZdwN+bAcQbsGWi5IpA0hg1HSdW2M7zCumr
 VjrpcP8c+3KE0b3J8SzeCYcDpb7X+kSVZfRjetQinw+fbZ7bCAXdLyxf20B3XWGOGXNG
 iTT7TsZ3f8swTjPal01j5CzP72shHs3MtFZtz08KJunuLlQFpqaF4XjHA7PQN/242yQX
 jBHKhjMBj/UozJAqF5LuURNLSa8q0YGP1thbNvWA1G6VS8OsY9f04s0XDM3JlW42CSqJ
 YJ1Q==
X-Gm-Message-State: AOAM533MOOaMpGpk98wJK/SbbwuCXpKvzsGevl3FIAJMluMPGcS3oHcM
 CXfZgu74WbxI8vGptS55rBan2g==
X-Google-Smtp-Source: ABdhPJxzrJPJ6/lsmeC1NuTompfTb7puHVRrsVOltIrdK38AzUsm425C8PbOFc69wLOHr0O+0Wz3ew==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr3516389wrn.276.1643298405897; 
 Thu, 27 Jan 2022 07:46:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/16] cpu.c: Make start-powered-off settable after realize
Date: Thu, 27 Jan 2022 15:46:25 +0000
Message-Id: <20220127154639.2090164-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
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


