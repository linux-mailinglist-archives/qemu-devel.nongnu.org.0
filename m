Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC912FD2F0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:45:18 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EjV-0005MQ-VI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egz-00040c-Cy
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:41 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egx-00047z-D5
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:41 -0500
Received: by mail-ej1-x62d.google.com with SMTP id g12so33861008ejf.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wootb/1eDmlPqGDLnEKTq4XqjiZhmmbPcYn7WSwlNhY=;
 b=GbOqRZU/cWZlej2cVbfYgEkB5DlZLDbpRlvcs8mmSxJ/1LQn+Dzp+sTyGrMX7KRXIx
 RAreaiVrCjTXRR/GYSGC8h0lxE7dVrlrU9V9d7Mp9Cqiua/176GDswXeEbAQd5k7qY66
 jVxt7JkYuB5McxjfHB7zYOq5NJcOE1dkGBzzW8oQS7bYc35I29wkdyDIcs3pImeQElHx
 Hb4eEgqt+D5tq1qCffNNyGW5UVGoulWg9crc9TU+FpFRdZGLn4NvvCv7WIMVEMflEiib
 UsHnvLCYozupCLsvJ73/UBypWp8JvvMcHQFhxiYSkZ3ZVjU30PKAD4rbP5/GQUOs3LIm
 HBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wootb/1eDmlPqGDLnEKTq4XqjiZhmmbPcYn7WSwlNhY=;
 b=WMEchTU2lyRIhytVu7yjACrJN16P0fVBNg7qXJUkmbM+Y3z/8iTVsXQjZvP1qQNzA2
 pOo5da67HkPE+bZSUgh96M+uMqckIx73KSzgxBjEuNnR7Jp/kpLFah0Zi7IoxHfj5uSi
 OJloPhBmqxAy4DXNqgMzWjsDYq3Ossk+WVwnCOsMBpRc+9e00o5yyKCjyw8AdJv0dMqf
 P5kqylBq4rVJDprOk6p0ClXs/7d45AVjy7I93nnL8OuatmJ0KDeIHZ/3zSJoKC6b7SLw
 oBxekshVR5uwRm7EKWt2VQikj3E9QyeGCH1Iky40mfPvGENWAL4u/wyQruQ4yDPchUu/
 1vDg==
X-Gm-Message-State: AOAM530s9+7FO/TBMcocgNDIc1ET6TIX0gOD9at/DUu+SAGxwnxEhFYV
 HuMLZdrpZ4YZzcTyNtHpn5PXxAQgG6djQg==
X-Google-Smtp-Source: ABdhPJxlH7yG1Uyj1udv2I2juAreN/UZ2kjIO5R3CQeOfifU4Wubkgv5YZPntFxNGrihmvn/zpXxcg==
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr6143085ejc.544.1611153758101; 
 Wed, 20 Jan 2021 06:42:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v9sm965078ejd.92.2021.01.20.06.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:42:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hmp: remove "change vnc TARGET" command
Date: Wed, 20 Jan 2021 15:42:33 +0100
Message-Id: <20210120144235.345983-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120144235.345983-1-pbonzini@redhat.com>
References: <20210120144235.345983-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: armbru@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HMP command \"change vnc TARGET\" is messy:

- it takes an ugly shortcut to determine if the option has an "id",
with incorrect results if "id=" is not preceded by an unescaped
comma.

- it deletes the existing QemuOpts and does not try to rollback
if the parsing fails (which is not causing problems, but only due to
how VNC options are parsed)

- because it uses the same parsing function as "-vnc", it forces
the latter to not support "-vnc help".

On top of this, it uses a deprecated QMP command, thus getting in
the way of removing the QMP command.  Since the usecase for the
command is not clear, just remove it and send "change vnc password"
directly to the QMP "change-vnc-password" command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/removed-features.rst | 6 ++++++
 hmp-commands.hx                  | 6 ------
 monitor/hmp-cmds.c               | 7 +++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 430fc33ca1..5b0ff6ab1f 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -68,6 +68,12 @@ The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
 Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
 documentation of ``query-hotpluggable-cpus`` for additional details.
 
+``change vnc TARGET`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''
+
+No replacement.  The ``change vnc password`` and ``change DEVICE MEDIUM``
+commands are not affected.
+
 Guest Emulator ISAs
 -------------------
 
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..d4001f9c5d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -231,12 +231,6 @@ SRST
     read-write
       Makes the device writable.
 
-  ``change vnc`` *display*,\ *options*
-    Change the configuration of the VNC server. The valid syntax for *display*
-    and *options* are described at :ref:`sec_005finvocation`. eg::
-
-      (qemu) change vnc localhost:1
-
   ``change vnc password`` [*password*]
 
     Change the password associated with the VNC server. If the new password
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fd4d77e246..499647a578 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1521,13 +1521,16 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (!arg) {
+            if (arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
+            } else {
+                qmp_change_vnc_password(arg, &err);
             }
+        } else {
+            monitor_printf(mon, "Expected 'password' after 'vnc'\n");
         }
-        qmp_change("vnc", target, !!arg, arg, &err);
     } else
 #endif
     {
-- 
2.29.2



