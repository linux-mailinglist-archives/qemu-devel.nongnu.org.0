Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B972FD2FB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:49:08 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EnD-0001kX-8C
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Eh0-00041S-33
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Egy-00048c-G1
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:42:41 -0500
Received: by mail-ej1-x62c.google.com with SMTP id a10so17228818ejg.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9cLcyWzjeqPDEQMswGpew8id28jh9kRkPo24Eqj/hq8=;
 b=MdN5i3QTmbgAUdzDtDfbKDeSNvHHFpwtsA9XsAaysmzO/H9cjpRhOom3snFtrvXnTh
 fo3RSbCUeTVZIJRixRWbtkxtkkCXH8mKRmSm/wbgvCDgHznKPYQxKxui6YWkMTwCih0K
 6RDj0z8qJY9zLXfitNRY0MVtFNAyA+mKRba7v1mXfVwlGxXOw7kORW4EfSYTUac3cLLa
 T99wFYrf9dhCm53JyEK/e14xfopZyl+mDX8LfHkCUHX1JyECSUFuNe73akRc1wChqpdl
 fis8vdPvLEOKL+2HA9enFP15cMzMLgNQAQ3H6egvbZeBmmjFoTS6tra5j6VTXLNFSCz2
 4Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9cLcyWzjeqPDEQMswGpew8id28jh9kRkPo24Eqj/hq8=;
 b=rpnydj1phjVYKz/rLcLB52M5lYj30P/yTHoT1+lb0QgSgY1mIvf5h3rdGwsgviOTL/
 LDVFBDfPzbKfYIpypR8ssDjxbzMW/3XQkHBtdTOxIt+aMoiV21fXjsMZLJRuUN+gF+W4
 /RRiKsDEPes4e4Pvo9CsCcUrPGGFw8oeN/2S6FZfleSezeMADpq8N0gwVo+eIVIm1/zL
 rgzaw0faAJb0UVJWVAUKV9Kui8nkyLh+EzDd+0IheL74mpjMLjh+KUvNuIBa/f6Ykqft
 SORKQWrB1C1WhRptOmts/5vpwSSz4EhGN3v8E/WsbmOgde9vx8JvUoIfTB4/1twulrAl
 W1eQ==
X-Gm-Message-State: AOAM532vzhyilB+/H30w5ynwVrH00nvNhekmrcyO/7wEiwRiziCddBAH
 awEIFC5co9R5XYTcyaCy32aRmczZD4RN4A==
X-Google-Smtp-Source: ABdhPJy52Ykyk+/S60ZPoy1Z+qNe2f3N5mYyL7+ZQPOrYSF39J1ywGCSD5LrSbmnw1rmqBtGP5k+Ng==
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr1853306ejb.489.1611153759165; 
 Wed, 20 Jan 2021 06:42:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v9sm965078ejd.92.2021.01.20.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:42:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qmp: remove deprecated "change" command
Date: Wed, 20 Jan 2021 15:42:34 +0100
Message-Id: <20210120144235.345983-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120144235.345983-1-pbonzini@redhat.com>
References: <20210120144235.345983-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst       |  5 ----
 docs/system/removed-features.rst |  5 ++++
 monitor/qmp-cmds.c               | 51 --------------------------------
 qapi/misc.json                   | 49 ------------------------------
 4 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e20bfcb17a..651182b2df 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -131,11 +131,6 @@ devices.  It is possible to use drives the board doesn't pick up with
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-``change`` (since 2.5.0)
-''''''''''''''''''''''''
-
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
-
 ``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5b0ff6ab1f..c48266724f 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -53,6 +53,11 @@ are automatically loaded from qcow2 images.
 Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
 documentation of ``query-hotpluggable-cpus`` for additional details.
 
+``change`` (removed in 6.0)
+'''''''''''''''''''''''''''
+
+Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7b..990936136c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -251,58 +251,7 @@ void qmp_change_vnc_password(const char *password, Error **errp)
         error_setg(errp, "Could not set password");
     }
 }
-
-static void qmp_change_vnc_listen(const char *target, Error **errp)
-{
-    QemuOptsList *olist = qemu_find_opts("vnc");
-    QemuOpts *opts;
-
-    if (strstr(target, "id=")) {
-        error_setg(errp, "id not supported");
-        return;
-    }
-
-    opts = qemu_opts_find(olist, "default");
-    if (opts) {
-        qemu_opts_del(opts);
-    }
-    opts = vnc_parse(target, errp);
-    if (!opts) {
-        return;
-    }
-
-    vnc_display_open("default", errp);
-}
-
-static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
-                           Error **errp)
-{
-    if (strcmp(target, "passwd") == 0 || strcmp(target, "password") == 0) {
-        if (!has_arg) {
-            error_setg(errp, QERR_MISSING_PARAMETER, "password");
-        } else {
-            qmp_change_vnc_password(arg, errp);
-        }
-    } else {
-        qmp_change_vnc_listen(target, errp);
-    }
-}
-#endif /* !CONFIG_VNC */
-
-void qmp_change(const char *device, const char *target,
-                bool has_arg, const char *arg, Error **errp)
-{
-    if (strcmp(device, "vnc") == 0) {
-#ifdef CONFIG_VNC
-        qmp_change_vnc(target, has_arg, arg, errp);
-#else
-        error_setg(errp, QERR_FEATURE_DISABLED, "vnc");
 #endif
-    } else {
-        qmp_blockdev_change_medium(true, device, false, NULL, target,
-                                   has_arg, arg, false, 0, errp);
-    }
-}
 
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ccd7385f..156f98203e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -238,55 +238,6 @@
   'returns': 'str',
   'features': [ 'savevm-monitor-nodes' ] }
 
-##
-# @change:
-#
-# This command is multiple commands multiplexed together.
-#
-# @device: This is normally the name of a block device but it may also be 'vnc'.
-#          when it's 'vnc', then sub command depends on @target
-#
-# @target: If @device is a block device, then this is the new filename.
-#          If @device is 'vnc', then if the value 'password' selects the vnc
-#          change password command.   Otherwise, this specifies a new server URI
-#          address to listen to for VNC connections.
-#
-# @arg: If @device is a block device, then this is an optional format to open
-#       the device with.
-#       If @device is 'vnc' and @target is 'password', this is the new VNC
-#       password to set.  See change-vnc-password for additional notes.
-#
-# Features:
-# @deprecated: This command is deprecated.  For changing block
-#              devices, use 'blockdev-change-medium' instead; for changing VNC
-#              parameters, use 'change-vnc-password' instead.
-#
-# Returns: - Nothing on success.
-#          - If @device is not a valid block device, DeviceNotFound
-#
-# Since: 0.14
-#
-# Example:
-#
-# 1. Change a removable medium
-#
-# -> { "execute": "change",
-#      "arguments": { "device": "ide1-cd0",
-#                     "target": "/srv/images/Fedora-12-x86_64-DVD.iso" } }
-# <- { "return": {} }
-#
-# 2. Change VNC password
-#
-# -> { "execute": "change",
-#      "arguments": { "device": "vnc", "target": "password",
-#                     "arg": "foobar1" } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'change',
-  'data': {'device': 'str', 'target': 'str', '*arg': 'str'},
-  'features': [ 'deprecated' ] }
-
 ##
 # @getfd:
 #
-- 
2.29.2



