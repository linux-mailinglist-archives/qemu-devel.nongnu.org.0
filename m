Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AA2859D4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 09:48:37 +0200 (CEST)
Received: from localhost ([::1]:60260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ4Bg-0002yw-Do
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 03:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tgolembi@redhat.com>)
 id 1kQ49n-0001g6-Ve
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 03:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tgolembi@redhat.com>)
 id 1kQ49m-0004CR-0Q
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 03:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602056797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8tYXi3g5F74GoT0lgG+2tf3jMZcKVc3qwVYcue1dVg=;
 b=PFMhmV61Y3wC7tFY1GhpFF96etr+tYV82AjfVsuYUj8WTdT9JBoNTHT3WAzk/2BK2SJUKL
 bCGPOvjgdNSeKiv1IRk6UtvTrC9pLjhBA8xusYImtmIJDIAz4CqzJ1kgQoAJJBarxGcl2J
 VKNTAhLjzW7/e8JXVwTvF2VtB93Le6Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-ESWC4GIGNFWOXoyZ42CsXQ-1; Wed, 07 Oct 2020 03:46:35 -0400
X-MC-Unique: ESWC4GIGNFWOXoyZ42CsXQ-1
Received: by mail-wr1-f69.google.com with SMTP id y3so620887wrl.21
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8tYXi3g5F74GoT0lgG+2tf3jMZcKVc3qwVYcue1dVg=;
 b=GdHp32TMe1RyE68ipS4oTQ0JYHl7zQXgWvSrLeqvOTs8gA70AN1hFYkpvCCUgPZrfH
 vdNKuNLIfA1195phnS+oaKZeDl0pWYLx6LGT53VcZKuNn+/xVwj3My66pHTzLOANz8fn
 7V1oTxtQ303+xH0+5RTmytVPZQ8mTzpuiT0wMucutdWKuBZsBuJiHkWqvw54YOcBD2SX
 TgU+GTfOSWztZJo8MUciVmEkUB3QxSPHpbYs+wKvu11xCeOpwva3ge3LUkLzu21zj+le
 ia1hnqB3waBSoRGMwisL3J0U0YvYoA5RdsYplb4DIEfUwj7qAECXX7jRbKVelY5IAjCi
 JD+w==
X-Gm-Message-State: AOAM532HjuvAxbIVZ42YqK7/bw7fue1yd3VzeqcSdLoi3tqtIErH8CkN
 MlAd5J1Ms1cw+s8flm8Z03wi3wW7Bz8yzH5BigwbkvKc8PZjvnF7O1hHm8PemCl5Eu1JqMwj6bp
 i2oGPaOqFGxvMbl0=
X-Received: by 2002:a5d:4088:: with SMTP id o8mr1971016wrp.112.1602056794376; 
 Wed, 07 Oct 2020 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIWO/rkkfuIeOu2ZUSNneEfZszHKZTDUpQx/BEAgszu5OQ2CvGaHyZH6LkVvrkv/OAGQLzAA==
X-Received: by 2002:a5d:4088:: with SMTP id o8mr1970992wrp.112.1602056794119; 
 Wed, 07 Oct 2020 00:46:34 -0700 (PDT)
Received: from auriga.redhat.com (ip-89-176-41-222.net.upcbroadband.cz.
 [89.176.41.222])
 by smtp.gmail.com with ESMTPSA id o14sm1505615wmc.36.2020.10.07.00.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 00:46:33 -0700 (PDT)
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] qga: add command guest-get-disks
Date: Wed,  7 Oct 2020 09:46:29 +0200
Message-Id: <2e6124e94e56dc7c5e914e645998d435ad92de06.1602056784.git.tgolembi@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602056784.git.tgolembi@redhat.com>
References: <cover.1602056784.git.tgolembi@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tgolembi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=tgolembi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add API and stubs for new guest-get-disks command.

The command guest-get-fsinfo can be used to list information about disks
and partitions but it is limited only to mounted disks with filesystem.
This new command should allow listing information about disks of the VM
regardles whether they are mounted or not. This can be usefull for
management applications for mapping virtualized devices or pass-through
devices to device names in the guest OS.

Signed-off-by: Tomáš Golembiovský <tgolembi@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c |  6 ++++++
 qga/commands-win32.c |  6 ++++++
 qga/qapi-schema.json | 31 +++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 3bffee99d4..422144bcff 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -3051,3 +3051,9 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
 
     return NULL;
 }
+
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 0c3c05484f..0dd16315d7 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2457,3 +2457,9 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
     }
     return head;
 }
+
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index cec98c7e06..1ba8f19efc 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -865,6 +865,37 @@
            'bus': 'int', 'target': 'int', 'unit': 'int',
            '*serial': 'str', '*dev': 'str'} }
 
+##
+# @GuestDiskInfo:
+#
+# @name: device node (Linux) or device UNC (Windows)
+# @partition: whether this is a partition or disk
+# @dependents: list of dependent devices; e.g. for LVs of the LVM this will
+#              hold the list of PVs, for LUKS encrypted volume this will
+#              contain the disk where the volume is placed.     (Linux)
+# @address: disk address information (only for non-virtual devices)
+# @alias: optional alias assigned to the disk, on Linux this is a name assigned
+#         by device mapper
+#
+# Since 5.2
+##
+{ 'struct': 'GuestDiskInfo',
+  'data': {'name': 'str', 'partition': 'bool', 'dependents': ['str'],
+           '*address': 'GuestDiskAddress', '*alias': 'str'} }
+
+##
+# @guest-get-disks:
+#
+# Returns: The list of disks in the guest. For Windows these are only the
+#          physical disks. On Linux these are all root block devices of
+#          non-zero size including e.g. removable devices, loop devices,
+#          NBD, etc.
+#
+# Since: 5.2
+##
+{ 'command': 'guest-get-disks',
+  'returns': ['GuestDiskInfo'] }
+
 ##
 # @GuestFilesystemInfo:
 #
-- 
2.28.0


