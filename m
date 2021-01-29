Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D4308875
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:45:11 +0100 (CET)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SD7-0004S5-UW
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rna-0004qk-68
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:46 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnY-000667-L5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:45 -0500
Received: by mail-ed1-x531.google.com with SMTP id n6so10098401edt.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IobH1KJ6mGisgw/tAQlnKjDO+QJUnt//1InQBRilGMk=;
 b=vZCMF4sGxalNIulKhDd8datZmClK98ltcdWQFvnpyt8+7BaCuRVxqMNbwS3w8iXfc/
 tT+GVBGG7Qg4S5exNVLVVwEsFAy5HDUXBSQ1R8tBdlTLjt60Il1n4vxxp3d+rCWqHoXl
 WNa6OsPttsJXXCTcZ4tctmiZa8XTOTvyU73qBY5sLORBBs8yLa1Uu0nvf4JHXdo1eJJW
 N5ueSjvGjI3icEHImYj2llG/dkNVSNDQUcCX7iFcc3G+iVSqBoLWSKLWeNokbOnrznEJ
 chk00MsXyyIUfoWsfFAcCOoR/SFtXUtbIVtHFqqCHqwiaY9Hn3wizN547IU9EzwFvFqv
 ncXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IobH1KJ6mGisgw/tAQlnKjDO+QJUnt//1InQBRilGMk=;
 b=uOL6WsTR4jfhBbqlpOxYK/Xuuu8kFVpuc1YXr2tPkgsi/yL8JjXhlGy7CeZ8sRqrG6
 lYE4NXG9d1h98lylBtzaKqV/BXmxw54syVl2RwV74gTJ/mcG2NhpHbBxBlo/tp8pDkv3
 +Oi+XkJtkK9OLyXSSjzyuGvZVySESoc+kO3T6sCSdl9woDsAIjo43kWYlJ6jA334vRCM
 m5dH33u9wO0qFp5vU6xdGGJYnlqp+T1L65ke6wbCDLUc8JD0QFU4aQ7KIMWcg1aBOdN5
 CvTVgCHEq0OIexfGNXEXSWGLswWhM696jS6UrX6jU8cn/mgdt5kgwyEdCM+fHW03H/bC
 FbLw==
X-Gm-Message-State: AOAM533OxWjyXUcBpvOgJe4w+pjs1aMkqEWHyYTmZIcKsmi+VohiD4kB
 klhNdqUlHUOHUvaXoPzFIUevR9f2KoPfTQ==
X-Google-Smtp-Source: ABdhPJyGOt6Fvc7wIRgEfxyORzoewlZo18x+o/Cu2VBm7t/iqHZsoHS9Y817yTC8yG1xw6oFFJ1f8g==
X-Received: by 2002:a05:6402:757:: with SMTP id
 p23mr4541305edy.245.1611919119742; 
 Fri, 29 Jan 2021 03:18:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] meson: Restrict block subsystem processing
Date: Fri, 29 Jan 2021 12:18:05 +0100
Message-Id: <20210129111814.566629-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
index 4e694e78a0..0bebab037c 100644
--- a/meson.build
+++ b/meson.build
@@ -1794,29 +1794,31 @@ subdir('libdecnumber')
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



