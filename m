Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A541830F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:10:29 +0200 (CEST)
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Js-00052o-LX
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92E-00008I-O8
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92D-0005d2-8M
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so36568526wrb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=MwgJW+yc7cOusjtImkFrJ2gnNtX5tK9JtKttyALTt8MXdcgv5cew7qYCTAX+CotMag
 1Ycbd5OTbO4hGdzinmZqax6dLZ0tgTssaA50jntUbIYxpr5feKiQ4DBCmsySC0HpguCh
 pMv3OyKKAgvWp/BFIjUBrNc8b1/DDuzXa8oxru0Vc8CmZMtONai9SfAzJv3PohPruCBX
 SlSnAex8v33qbEq5isQKK/SvwU9aQJeoI/lxQ4L8banpVypRjQkd8CE6dR/XSgP47Zzx
 anfUH0Y8gRs6BYkdl2k7RY4KosRaZrZE86aNrpJp/Rfq2MLXtlJFxLGfJs9ijIrQOVIh
 QMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=6P10YijR6w/p0N4Qg8NXsAPlSSt21T+JZ2HPRrDXAjCT99f0ES0ugWu/hv9linvM30
 BAix3a7BkHmncxb/XCP4w2jZrlmXJ+lPw/zb9BWE5s39vSNtP1p7ncASk2RuThP1f8O6
 riq/17YP495T1tN1Tgqy+am7ut9vZPx0AjL/MKgg6hiZEpOgz5C72GFmfEvFu6RTNbQt
 eelbDHQuk9wZQ1SuOYW5uSk+h60LWgzxR3KI7pCeInh+piXEJTFKvNFRFTXg1Ta1DIQz
 gzXNHrdgme+rWS19VWjlQQr3md/1h7ihBcHEyVkESbwNROi5bxY7t4PoijjiL/+a8m88
 75jQ==
X-Gm-Message-State: AOAM532yOJrGesZdpLYYN3RLspyZ6AuEoDB46PLJYbX6GFFpwtmeUc0z
 G6M5CGPk8ZtsDgJcj/D7kaWbNPIo5nM=
X-Google-Smtp-Source: ABdhPJz++mxK0aLTrnAeo5+QdatxDLpyJgp9NJ9xzEfzSXd8t8Q7OcH6swtbzrZOARYj20kiuxwI2w==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr7147880wmb.158.1632581531737; 
 Sat, 25 Sep 2021 07:52:11 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n26sm15815610wmi.43.2021.09.25.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/40] accel/nvmm: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:49 +0200
Message-Id: <20210925145118.1361230-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Reinoud Zandijk <reinoud@netbsd.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific NVMM handling for cpu_has_work() in
cpu_thread_is_idle(), implement NVMM has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289f..36296f79ff8 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
     cpus_kick_thread(cpu);
 }
 
+static bool nvmm_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+    ops->has_work = nvmm_cpu_has_work;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
-- 
2.31.1


