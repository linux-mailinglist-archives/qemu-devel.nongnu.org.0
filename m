Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F331432C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:48:29 +0100 (CET)
Received: from localhost ([::1]:60066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FKW-0004Bo-Ov
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCY-0003Uv-J2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCW-0006ET-W0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:58 -0500
Received: by mail-wr1-x435.google.com with SMTP id n6so5554421wrv.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dg48Ob9geP1PBy6hPV4AOns0Z45eJt/YNg8Br5vKXJQ=;
 b=IyS2qlvAUK7d2UAcm1PAa28dbC9ccaz4mqzL3o9Ub5lhwZJ6aGO/wqxGZnpT9G4wKY
 7uRX5frN8I6jFTKhf0FB3D9McLHGMuQ2VWVFXljd77wPJaSFvVNUrxsJSHqoWSCfCxzK
 GAQQ6XB7tEab0D2vFlrdbP9lMd2+GsscWeiTpf26TNoGnV6YPEpuWiJw74FgqNP93wjz
 m0bK0/0STY7rCD46pvj2Wn6vBUKFLCBeLgTUp7MuZgid7PBcPQMEiPr2/a9SUTr7gnKc
 0rNRhiJqAAgQF5PdM7k0eTrigWhReQuUpQAwU0tkvOOD+sS8fHpuVReBFF/zspGC/N5T
 xuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dg48Ob9geP1PBy6hPV4AOns0Z45eJt/YNg8Br5vKXJQ=;
 b=T+stOlkEDqg0VeGmzoIGI8JIf9nwXhX9WXxZI/HBNQzOP0sN/PqY/fzfLo0PYDJ2tQ
 f0cku+XwuW8tqw9vNa8RitaewibocZSzQJ+CVHJVWifCvXanFH7pjVVAePy8TO/hMevL
 S2kG/OahklDvHeLCDfhqvyh/knibGePjRidrUv+9/a3mg9Vf4206Zw58UUhQmgkT79DX
 cNre5bs/kU/SjMbpla7Sj3KlszRnjDKYMw44cO7V2gyKwDlzIf0YhavFWr6ccsepwrVm
 EjBAyv5/hMOHSUqn9dvqMiH/HPa2wkQlqnB8cgcJ5fxW7hL02ZaxeX9pqKomsdzdHO9C
 fn0A==
X-Gm-Message-State: AOAM532q4KOXIWn1y21/MFSNB+iT48E6xR0ovMex9hVAU1NpPAnWmnBg
 UxxzRMgCKWowQrx3YkNANI2ZueuGAxf15Q==
X-Google-Smtp-Source: ABdhPJxnu3m5X/1EkBhtQLPMlo03VKM0PYbMvyGLnpAZszsRgCpORlMaAZaD9iGuPUMOxg0Zhuqn9w==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr20744869wrv.128.1612808635646; 
 Mon, 08 Feb 2021 10:23:55 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/46] meson: Restrict block subsystem processing
Date: Mon,  8 Feb 2021 19:23:09 +0100
Message-Id: <20210208182331.58897-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Avoid generating module_block.h and block-gen.c if we are
not going to use them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-6-philmd@redhat.com>
[Extend to nearby files and directories. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 48 +++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/meson.build b/meson.build
index 4cc3ebb827..0ca73d0102 100644
--- a/meson.build
+++ b/meson.build
@@ -1877,29 +1877,31 @@ subdir('libdecnumber')
 subdir('target')
 subdir('dump')
 
-block_ss.add(files(
-  'block.c',
-  'blockjob.c',
-  'job.c',
-  'qemu-io-cmds.c',
-))
-block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
-
-subdir('nbd')
-subdir('scsi')
-subdir('block')
-
-blockdev_ss.add(files(
-  'blockdev.c',
-  'blockdev-nbd.c',
-  'iothread.c',
-  'job-qmp.c',
-), gnutls)
-
-# os-posix.c contains POSIX-specific functions used by qemu-storage-daemon,
-# os-win32.c does not
-blockdev_ss.add(when: 'CONFIG_POSIX', if_true: files('os-posix.c'))
-softmmu_ss.add(when: 'CONFIG_WIN32', if_true: [files('os-win32.c')])
+if have_block
+  block_ss.add(files(
+    'block.c',
+    'blockjob.c',
+    'job.c',
+    'qemu-io-cmds.c',
+  ))
+  block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+
+  subdir('nbd')
+  subdir('scsi')
+  subdir('block')
+
+  blockdev_ss.add(files(
+    'blockdev.c',
+    'blockdev-nbd.c',
+    'iothread.c',
+    'job-qmp.c',
+  ), gnutls)
+
+  # os-posix.c contains POSIX-specific functions used by qemu-storage-daemon,
+  # os-win32.c does not
+  blockdev_ss.add(when: 'CONFIG_POSIX', if_true: files('os-posix.c'))
+  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: [files('os-win32.c')])
+endif
 
 common_ss.add(files('cpus-common.c'))
 
-- 
2.29.2



