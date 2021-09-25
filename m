Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FD418310
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Kt-00074v-Eb
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92J-0000PM-Kq
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:19 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92H-0005ho-VQ
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so36516143wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLzuxgLTjxaUP4zi8sBdv28yd73Nm8j1vjkLU2rmh+g=;
 b=SaZX5+axWdoNAEqaVs6F8TD8N7AxIfwQMcVy+pxC7HPXxx/qpTmFNIS8cXDA5Pjkog
 QFSskgw9znaSWXpRbTcv75DFTxQm7oHnNvLyeuf8Xi1lf2hhlsGm9i/T2EW6XIB2pov+
 9eHNIR2LGkzGROfbBUquu/TePfTejG4R2FkG/Eujb++9lO9YQ2cHMOXtUxbWBBXHo04u
 khfjO6apBgrXhYn9uhYhRaLxaL88B/iJvV5wxP7j7wvepaOmqmSJIr+RR9VIwavB+jCA
 jxAtkacEp2dkZUd8OSKTISEe8b3v+wxGnTxzQ4d0M6lDuGXng4D7z/FWPGMssfqnIKjJ
 4VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aLzuxgLTjxaUP4zi8sBdv28yd73Nm8j1vjkLU2rmh+g=;
 b=lPB/3D5lm8UXnnEvYE1zkNtFAwPt6j5dk1+fh4Vxjb8PMhmrwbZpmVXMbZD1yG6Blk
 uChKUXjlmEfpNHaVMrwED0CrEeg7hVx0C8FUOorgpAEBU6hXDuP3fjqZK7diBzVEZ8Eh
 Y7UmPLSCEyJ/C+scV8SdEM8uCkC2K/3td3WzLQY9FtWzFzb4wwsDtnBJRL7vrpAcazZT
 c4si3HgLJT++Y+KKv3ocNmYAuj7iVr0QeAyxy4LmrjGkH50eOwT1t7CawNGPH0KsCXHf
 Qg2V3xnJoq9/87SxKB4fZV2KH9xN/mOl7QufgaDPoRgsGwzjJ8SQsaiJt0wIujkQNCJK
 b9Rw==
X-Gm-Message-State: AOAM530YNYmuYwHYFklE/ogphxzvR3GYol7zoOWuObt7SOzHRsIJo5ct
 Uvtz2XLqM/0EOSzWSn60lLg/nIjWplI=
X-Google-Smtp-Source: ABdhPJzYPpUggr8HAA3tolud8uCGmSfmGWRHb6x82DTDa6g/c+WwUa8Abhdu1ikeiMFhIIjnDV6leA==
X-Received: by 2002:a05:600c:4fd2:: with SMTP id
 o18mr7448821wmq.126.1632581536473; 
 Sat, 25 Sep 2021 07:52:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c14sm11255196wrd.50.2021.09.25.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/40] accel/qtest: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:50 +0200
Message-Id: <20210925145118.1361230-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement QTest has_work() handler in AccelOpsClass.
Since no CPU are available under QTest accelerator,
this function is not reachable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/qtest/qtest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..903c39ec1bf 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -47,12 +47,18 @@ static const TypeInfo qtest_accel_type = {
 };
 module_obj(TYPE_QTEST_ACCEL);
 
+static bool qtest_cpu_has_work(CPUState *cpu)
+{
+    g_assert_not_reached();
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


