Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A0418B70
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:33:17 +0200 (CEST)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUchw-0001en-4c
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcd7-0001ew-WD
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcd6-0005ne-Kh
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id i23so46572562wrb.2
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aP21aGayxNLidjUWldaRN+0yZT8srWWtopHXNcPvGlE=;
 b=nK8j5q7s3lNrxn2ZCDxUrIuPEkSH/7y7u01mDGg/44cRc++4us6+nCNT71y5fi3NFr
 eR+ZaGDQhx2TE+mq7VmNNca/PpkVImdtgfOgx50yuLON2ClQpdlaz/0ZXsL5re2leAwS
 /6fpcUzIFGG9i4Hf8/e6Ay46MBPvDKHugAdMwJkEsl3eRlHl1c2quQU/dIx0Wjb1I4vR
 0J7/Mqc3JQXBNEMPJtenzCNKyuku98xUMe9qkmLH3W9iLCGdvvnFczu0EBjTVDSeAkNX
 MeTVo/PA6US6SKxLJquLcyMGiIBsy3bUXSxng1YZJbaV4JO/i6iRUIOk7d/7huRXdZ5u
 0V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aP21aGayxNLidjUWldaRN+0yZT8srWWtopHXNcPvGlE=;
 b=dryHWveeopDaexy+t1MDC1o8QuL085m6VRmqT0U7MIFjTWVj+0/SPYwakzrW2F8qve
 nyhiumQ6xSNYV3aJuPkHvWdiNiqrlNv+qiHE7qD2m/vx9f9MDse2Gbi8Yavk/wClmFqh
 0HHkXEfyUpzfYGJVROfj2Y+nj9kZDdA8CqCmIyUoC7+W1sxqjc9adpx4fDt/FAp+02xe
 eZsw2jVN30bQG7iq1QMoq/Y8aybPg+Rzdw3XVTlrtv5PmmuGWNnv2dloaqw/VRstkMFQ
 3jih/VHiAMzPyLfxVLBFtV2Z9qc4swFqq/EvEep+h4gu1aJ+UrbHFFoDVk9mnIi2YsRQ
 GqHg==
X-Gm-Message-State: AOAM5305qZhdhwsrPhBYLGvvkrSMSMbf+1A4SuYDORHvQoFCOA0hk8cy
 flOA6/lFSzW3FwJb6ASbot6w9aER6UI=
X-Google-Smtp-Source: ABdhPJxVG3UVyimD7YFqZkBt1o2mVO1k3I3OoG7AUQos+QiFs08HhrrH54AU/rmX2HJtY7B55O2vpA==
X-Received: by 2002:a05:600c:3b89:: with SMTP id
 n9mr12735670wms.186.1632695295288; 
 Sun, 26 Sep 2021 15:28:15 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z17sm14413513wml.24.2021.09.26.15.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/40] accel/qtest: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:48 +0200
Message-Id: <20210926222716.1732932-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific QTest handling for cpu_has_work() in
cpu_thread_is_idle(), implement QTest has_work() handler as a
simple 'return false' code. Besides, QTest is a "dummy" accelerator
so not much can be done on vCPUs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/qtest/qtest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..eb5a17cef18 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
 };
 module_obj(TYPE_QTEST_ACCEL);
 
+static bool qtest_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void qtest_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
+    ops->has_work = qtest_cpu_has_work;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
-- 
2.31.1


