Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE4324725
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:51:21 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF304-00005s-DM
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vr-0004ff-Gl
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vm-00060n-W9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3qKRL/5hKgwJjLrl6DX6z760KxMHjG0maONNBBWZOo=;
 b=KshQCUPQussEcAAXYLu727fzSayvbYnG85geCUrHlz8uOeLRkAmiqvmmBhdrSRyRK/8Dnm
 mDacX0axItYLCkdo7sf32l7MD30H8cpEJdTVutCTS34sExCMtPegh9gayLFCZl/uaa8Un9
 Pie6gz4s70xirJtjWN04bpy3VcUwwFk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-0Recl4SiO7iAWrivQbp4Qg-1; Wed, 24 Feb 2021 17:46:52 -0500
X-MC-Unique: 0Recl4SiO7iAWrivQbp4Qg-1
Received: by mail-wr1-f71.google.com with SMTP id l3so1687014wrx.15
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3qKRL/5hKgwJjLrl6DX6z760KxMHjG0maONNBBWZOo=;
 b=OTznzQSs+qnknJ5r5BAf+u0eE54vu9g1ayy1e9vOfxS0VIkRyfeGBQXEOejbFckZFM
 41z9sv4/drWUh8LaQJ/ShgparUjP8z5dXocazuPtdp/p1MxxR+x/4C+KwaUXvLibnlBv
 tSB0k1mqriedEC9Qt5qzNqfl4qshcI5o9u5HxNbfJjnK+SiR6maBzylupFH/MkdpwgYH
 BRZrHM3Q8ugUfgcPs93CWq0fXOHVaY0F0cM2sGk5ySPRIvUL2ZGnPrG1wwQHf5NDf1j1
 Y9w7amnZ9d9TmmM1Mip3f1BWW+jsXf5kyVnqY7aVAzNyxy68/Z3Cjew7Gdpw3KwTbWZf
 YLbA==
X-Gm-Message-State: AOAM530CLORhKVxxTCF8rkwXWRCoG5TzfGild/BNa6aywqItDGPieFcN
 J4aHrg/hDRT+dZOhhw2Xaulo4mH+UYRuk3fE2y61AqksqNIhDSUIAssoIKvJeWXsESwpKZHPUSc
 tGs4yPOchwlx/fQqTinyodvAtzyEeG0y8ToqAxwOYvn8r8wGX9K6MvgLz5ZyXEoNo
X-Received: by 2002:a1c:f019:: with SMTP id a25mr246705wmb.125.1614206810010; 
 Wed, 24 Feb 2021 14:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ+LuWPaYSFLObDEA74/DDMFN9RFH/Udtvzcf51ajVQ+91j2B9aI4fPRfdXCuPOpXN8X7TwA==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr246680wmb.125.1614206809872; 
 Wed, 24 Feb 2021 14:46:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm4758201wmq.15.2021.02.24.14.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:46:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/4] target/i386/cpu: Introduce get_register_enum_32()
 helper
Date: Wed, 24 Feb 2021 23:46:40 +0100
Message-Id: <20210224224643.3369940-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224224643.3369940-1-philmd@redhat.com>
References: <20210224224643.3369940-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce get_register_enum_32(), similar to get_register_name_32().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu-internal.h | 4 ++++
 target/i386/cpu.c          | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index be688cb393e..9df24c482ea 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -20,6 +20,8 @@
 #ifndef I386_CPU_INTERNAL_H
 #define I386_CPU_INTERNAL_H
 
+#include "qapi/qapi-types-machine.h"
+
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
    MSR_FEATURE_WORD,
@@ -55,6 +57,8 @@ typedef struct FeatureWordInfo {
 
 extern FeatureWordInfo feature_word_info[];
 
+X86CPURegister32 get_register_enum_32(FeatureWord w);
+
 void x86_cpu_expand_features(X86CPU *cpu, Error **errp);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 219d7652524..ffa342171ba 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1476,6 +1476,11 @@ static const char *get_register_name_32(unsigned int reg)
     return x86_reg_info_32[reg].name;
 }
 
+X86CPURegister32 get_register_enum_32(FeatureWord w)
+{
+    return x86_reg_info_32[feature_word_info[w].cpuid.reg].qapi_enum;
+}
+
 /*
  * Returns the set of feature flags that are supported and migratable by
  * QEMU, for a given FeatureWord.
@@ -4548,7 +4553,7 @@ static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
         qwi->cpuid_input_eax = wi->cpuid.eax;
         qwi->has_cpuid_input_ecx = wi->cpuid.needs_ecx;
         qwi->cpuid_input_ecx = wi->cpuid.ecx;
-        qwi->cpuid_register = x86_reg_info_32[wi->cpuid.reg].qapi_enum;
+        qwi->cpuid_register = get_register_enum_32(w);
         qwi->features = array[w];
 
         /* List will be in reverse order, but order shouldn't matter */
-- 
2.26.2


