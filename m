Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD34182F2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:56:54 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU96j-0007rG-Na
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU925-0008E5-4U
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU923-0005Sm-Kw
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so36536051wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=G+GmU72zjpBNcQjaJkUxR7Hm9Y3LE8KiQt/SI3NeS6OLKULhwLAVtEcL4ZDR0Jag3I
 9Iqu7RniWGbPuunBaeHSb4uaOW1HdC2SIyhodow0oCFW0XZoRHzN/zJPKDXAUsrTJYbM
 o0tDzvkIczPzHnDbHc0znNPAZVEXTt+qBGmRo4pyGYCa3HQJ83meRkO9SVxoKlo9UeJ1
 nIqgFF+VvYvmGPzkpUox87plIThC0qe8NZE+3Q2d5FskCrFpydmZtE6Xb6AqInYZwrDa
 YbNDzLTFdcU1ZqZ6fDRMfqsaJAvDTGh4DXeDd8S8Htmyi/O/u1OIGLRJSsN5WaOPH7nW
 CM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I61ARzsVO4/KzAGYtcJMZn32sXSEJVm6F+jp7uLlVMM=;
 b=y+QRCZUBf/3uoctnn3NihU/cB/g5gLhIs1sQAF1qY99TQ1oFwFOzR4TuzuXwlRE3bg
 1SsY/mBGR46NThSAlijsvYYBXvJ32PNNHzI+NhoiMJVDHLkKwdjnZ4ECjbathBl99viG
 ddNefxv/adgNs6mvrFJYpNHlxzyWdFb4AtusAeZi50QVyTiU4UeZkrO3Zi6brxDOuBK/
 ajAtsS52B2X2kUbLXZHdyEOUVQfeYUBr05LIuU7xDniZyk+F1thsrZx+8VtTBzVvlxlF
 v+qWdV1AFhCFGCRo0IsfjOfy3o2zRrXvfjlbhTaz4eReI7N2HnnxsTFu25hCr/Wsr5Ei
 oiDg==
X-Gm-Message-State: AOAM533rbQAG/tBQze8e4RxuwuDAJ7+Dq0RkQpdkZRJ+gexPwLCJnrj0
 IwHHpc65NdNK4LTeUCt4163f6uPs6BM=
X-Google-Smtp-Source: ABdhPJzkjnLgo6lRvy/ft690imOHBkl2yBKGxN4EX4PM++nl4LReYCioSoopkYZjVGMaG0ouAce+jg==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr17319095wrw.289.1632581522279; 
 Sat, 25 Sep 2021 07:52:02 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 20sm16920479wme.46.2021.09.25.07.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/40] accel/xen: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:47 +0200
Message-Id: <20210925145118.1361230-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific Xen handling for cpu_has_work() in
cpu_thread_is_idle(), implement Xen has_work() handler as a
simple 'return false' code.

Acked-by: Paul Durrant <paul@xen.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/xen/xen-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..fe5a37fa2e6 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -215,11 +215,17 @@ static const TypeInfo xen_accel_type = {
     .class_init = xen_accel_class_init,
 };
 
+static bool xen_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void xen_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->has_work = xen_cpu_has_work;
 }
 
 static const TypeInfo xen_accel_ops_type = {
-- 
2.31.1


