Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBA0416FA6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:54:26 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThuT-0003Dt-Ph
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgG-0003Zm-0O
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:45 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgE-0006Vd-L7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:43 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d21so25364663wra.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=IrGQXkW1n5HXVXm8l3rQZkFcWUN3GlQa7CXEGz/UbfUi8EvXCQbYCJ9sO0dgmdN709
 SM/jH8+yBDg6sC6/ThbReQvDWwtCGZqALiKVqgaxE/naCXd9Q0/fpS8U3E2GdhO88VA3
 hkRZqc35BeK4s3T/yxOFRf11qBqv1ZYbq0zgn3j/SZua9u6G4r0i7boQsWyncihUJLGP
 rvY0zojKDT0mXSVMzqyxBerdzsE63j3HqYzGIMxng9f0Ufu18FaIKuKLwAzY1V4kyfoG
 QZXkDV+Bdf2XQFwscX5fwn3C+Cg7lBPzOV8WMtqrmeJEh86OcRdQVSrj8s/vTlCRWPKu
 osXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=3EedwViIV9fKAJuVJWfOABTsjpZeN0B0bY2M8Koz1bXdcKkX8zTAsQt9ConJyucZOR
 c2kJ6DbKE1YV9EEt49ObDZvYvxDmXhnkNUh3YPAB8BtYwrl0N8pVRQkIfaIvsOoDCKlE
 4SgR1DGTe3RFHLom35sA8yTULlhX9NI/Xc49wd4WoqZRYjO9PX9aX6oO1fW3WH4gcyba
 2tZKVO4ofqOQ1fevZbx39qhsbWmVOvsjU/AxGbc/4tfJo3c/TQSDRZG4+9zrN0ZqGzV8
 TUWJ0rRfQUkVDFdJESaA2ScN0bxcQ+MeNQJtiWwhmX02GUgHpTQwfKpgggBQYgHo2T4/
 386Q==
X-Gm-Message-State: AOAM533mUj3QhWSB+I5ak0xNWEC5VPLzxtJN8RnpJpox/Ga7dblL2mXd
 fiFYmxiSVsbFQnxamLp0eEqvceJqiEY=
X-Google-Smtp-Source: ABdhPJwDDNnd4J3DU7bH6DJfW2OgZOqw0H9ZdyajHTI5slOWsSAXNc3DrbyWYgWXp+6lzcgzKuLJIQ==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr10367662wrs.175.1632476381266; 
 Fri, 24 Sep 2021 02:39:41 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x21sm11744898wmc.14.2021.09.24.02.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/40] accel/hax: Implement AccelOpsClass::has_work()
Date: Fri, 24 Sep 2021 11:38:18 +0200
Message-Id: <20210924093847.1014331-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific HAX handling for cpu_has_work() in
cpu_thread_is_idle(), implement HAX has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax/hax-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b23..5407ba17eaf 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -74,6 +74,11 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
+static bool hax_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -85,6 +90,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hax_cpu_synchronize_post_init;
     ops->synchronize_state = hax_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+    ops->has_work = hax_cpu_has_work;
 }
 
 static const TypeInfo hax_accel_ops_type = {
-- 
2.31.1


