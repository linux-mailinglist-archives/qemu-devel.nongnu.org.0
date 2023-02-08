Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E004268F443
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7H-0004GB-Pp; Wed, 08 Feb 2023 12:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6y-0003go-LP
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6w-0000o6-VD
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kPbqxOjC1Fp1Du88sVlCoM09v1WlV98R9rPPhknYA0=;
 b=RyyRcjfSYnv//NCi4YDlyokQcrmvkoBhF2hfy0sHnynH0toOhmDDg10p4SxnaN7EQ7jSGE
 qm54AQAUF3KaUAokv8RzvgYrxnczSEVMG9wXkSE4/Aype2GowsfToi39QLHfdm+F9/VJjB
 OFpTeK6Eq1o5+e2QzOWX79DcZNmdztg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-H0vBsFrnPUKGrD8yh-Zpsw-1; Wed, 08 Feb 2023 12:19:43 -0500
X-MC-Unique: H0vBsFrnPUKGrD8yh-Zpsw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ge13-20020a170907908d00b008aac038968aso2392250ejb.21
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kPbqxOjC1Fp1Du88sVlCoM09v1WlV98R9rPPhknYA0=;
 b=ZdD/TQUngxiYw5M86LwlC3QsqJfCBlNFdd7OcqqWEjDCk0Pf7ClqaO1pseTN5BU/TE
 EYkKeMp2y2HVm2ggyJ3T4D4KplAF5qg4dJC3QvoBYHAAH/L4RKegNpDNwcOFERynGq3v
 nHACbVyHBcofx9Lprcm73Vjy8LpOrd86Bn407N6VUZW7nmGVfShZo5xGPEvrNjLg1rMf
 NtMatLZ3xS1RJiDy/oBRticHupRLUSTNk/ZGfhcIj9AvceEBCzrAzbj+FXjgCXU7/98O
 yM3l3fjA5fEFfx83Xtiggk58jq0WISvoZI7NR/YHt0e12BuwMJ4Rn5nF0Yw+GbsouVeI
 sTQA==
X-Gm-Message-State: AO0yUKVwZODrgmJo15EOK8g9ZYXvQsl41VM30K9l8z3h0UGOqqVxvgrY
 SWsxJd8HU3fY8pmVtj8yo8uDBIvi2VIXKjdtkzxYc3D6DqciAkrXSe2XUyaDfDHrhCnmVTSqFkn
 5k/j7APhss6Aka8E3UtZ5R2fPbvyM7lbzJNzCcK6JdxCJxctUzxBW6IRggsm4cgXiLbVVnQ6N
X-Received: by 2002:a17:906:1182:b0:878:605b:ffef with SMTP id
 n2-20020a170906118200b00878605bffefmr8993653eja.55.1675876780846; 
 Wed, 08 Feb 2023 09:19:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/KBb2MrW0r5967WSLGWz1Gh+xdGj89XHQi/O7o5CPalBYg4dmyREs/n3/ivzIAiK+e1zrmbw==
X-Received: by 2002:a17:906:1182:b0:878:605b:ffef with SMTP id
 n2-20020a170906118200b00878605bffefmr8993630eja.55.1675876780465; 
 Wed, 08 Feb 2023 09:19:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a170906a09a00b007aece68483csm8556592ejy.193.2023.02.08.09.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 04/11] vl: catch [accel] entry without accelerator
Date: Wed,  8 Feb 2023 18:19:15 +0100
Message-Id: <20230208171922.95048-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Avoid a SIGSEGV and return an error instead.

Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1439
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b2ee3fee3f06..06c9c931565e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2204,14 +2204,18 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
     int ret;
     bool qtest_with_kvm;
 
+    if (!acc) {
+        error_setg(&error_fatal, QERR_MISSING_PARAMETER, "accel");
+        goto bad;
+    }
+
     qtest_with_kvm = g_str_equal(acc, "kvm") && qtest_chrdev != NULL;
 
     if (!ac) {
-        *p_init_failed = true;
         if (!qtest_with_kvm) {
             error_report("invalid accelerator %s", acc);
         }
-        return 0;
+        goto bad;
     }
     accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
@@ -2221,14 +2225,17 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
 
     ret = accel_init_machine(accel, current_machine);
     if (ret < 0) {
-        *p_init_failed = true;
         if (!qtest_with_kvm || ret != -ENOENT) {
             error_report("failed to initialize %s: %s", acc, strerror(-ret));
         }
-        return 0;
+        goto bad;
     }
 
     return 1;
+
+bad:
+    *p_init_failed = true;
+    return 0;
 }
 
 static void configure_accelerators(const char *progname)
-- 
2.39.1


