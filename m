Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B1420087
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:49:36 +0200 (CEST)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwFb-0003U2-8M
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9D-0003Bj-Ux
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:59 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9C-0000n9-CN
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:59 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x7so50488374edd.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yqw/945/MMuiqJfE7USyGnzWaaT3DCE0yzcYLl8IjNI=;
 b=LrpJNFbO/D7P3/sXQ/2dfENmCKnlkytzD96FFFyNpmeyodzhfaA9kljUQHtdyTWxvH
 mfH85JDfBKqkcsKxm1I50Pjzt2i1Y+oHn3gV5WoMWz/UojTHIu97dYYwGvJ9soomuBu+
 aH7JmJL7PGMwUl4O5fqpiWlc8R1oKhMXcaV6yn+8qtxBt1gMM8KXxNUhK+dfG5aO7a/H
 hdXzOmFRHetByKi7wDh7glVinoNlJad1lkzZ0pL6qqZBP9HMyXwV4MX53QiojZYINjoe
 XNZtjsMDB+7lTUG3/ra4jtq4z1Q5GplLufTyPcQl+awEHXAQn4MHVuxE8+YrH/MFeZsb
 hrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yqw/945/MMuiqJfE7USyGnzWaaT3DCE0yzcYLl8IjNI=;
 b=IgIc7gP0C5Dwh3CsrS5ruUr+8/bIvDwpakz8xbjqmayVJFdrM9EtsIXCUzBO9BTDsC
 5SX4pZHBr+GZeLiziOpzJTPUxg02GTImw0XY/TGe0cwxMmlStoU912rfVF0eko91TgDO
 H0SOTQV9Vqt5IdLysF5Sgz7gwk0IozbBpSrl9mk8lvWxHUmCHeKF1pAnD25mo8a0nAw+
 FVPwgGLkdgvecWRhV5wKKXagnec3IBAQCRXzdz0K1zP53UE5MIZ6Cf23HU0t4jWdY2zT
 /fNnVL+dl0AwCAmqMV537USaMeDia/jd6owKKR2KRhpLEWbEAZ2WZimhlfwtjKW+R6c9
 9u9Q==
X-Gm-Message-State: AOAM533WwffM9RNo48Ux9bLpZ1VBTOoh7Oqrg6c8yiJZJc05YEFc1vR9
 /E0uWljro9S0CPsvHlqtJ5Cuq5STt/Y=
X-Google-Smtp-Source: ABdhPJwZwqgxyMJ+k52ae2XE0La2RFYoC5m+C2pHjYswTwQRiBk6Vfz+vEwu8fbk5XyALUplga9Dkg==
X-Received: by 2002:a05:6402:50cc:: with SMTP id
 h12mr9704254edb.112.1633246977077; 
 Sun, 03 Oct 2021 00:42:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] machine: Improve the error reporting of smp parsing
Date: Sun,  3 Oct 2021 09:42:26 +0200
Message-Id: <20211003074250.60869-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

We have two requirements for a valid SMP configuration:
the product of "sockets * cores * threads" must represent all the
possible cpus, i.e., max_cpus, and then must include the initially
present cpus, i.e., smp_cpus.

So we only need to ensure 1) "sockets * cores * threads == maxcpus"
at first and then ensure 2) "maxcpus >= cpus". With a reasonable
order of the sanity check, we can simplify the error reporting code.
When reporting an error message we also report the exact value of
each topology member to make users easily see what's going on.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210929025816.21076-7-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 22 +++++++++-------------
 hw/i386/pc.c      | 24 ++++++++++--------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d8f458db60..e38ab760e6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -782,25 +782,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, cores, threads, cpus);
+    if (sockets * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, cores, threads, maxcpus, cpus);
         return;
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f24a1d72ad..9216ad163d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -749,25 +749,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * dies * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies, cores, threads, cpus);
+    if (sockets * dies * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology deprecated: "
+        error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, dies, cores, threads, maxcpus, cpus);
         return;
     }
 
-- 
2.31.1



