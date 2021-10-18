Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523614323B5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:21:58 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVOf-0005x1-Dj
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8z-0007iy-11
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8g-0007xv-3h
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:40 -0400
Received: by mail-io1-xd36.google.com with SMTP id h196so16920594iof.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/r2gH9ObhuBG8UYqMNl21ZIK0oU8t5H0kqWj19D/1o=;
 b=AtNOY2GfiNPa52gkLxYZmac/IxHN8i79U3kBgAkedRrtqXOS/b6+JXElSvyQGpDukP
 sneyDvv57kXg/8pbM3iHHI+rukoN2ClrjpLa3pP5YMloypjrrNFkAs79Vmw+s7e0klbg
 TorhgRgG83+ho7PlldfJ8MIKY89ZZEHSGSeFuDxryVTjNAyf9obmQ8T8AUJjeTOn4ZUr
 lad8FrIfJTDfKQp0K/oP/+MgKXYrrTQQzQzGz6VhRwgQGz6WYIxvW5aDPGTtVHxQV90E
 2SieJhIiKY6gSsNRoK/feHCD/+vPHQtJgGs63jxXnOeKs8HDrT9VHiJ0OnHq3Emn/lQw
 e+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/r2gH9ObhuBG8UYqMNl21ZIK0oU8t5H0kqWj19D/1o=;
 b=d+hSXIN7QVv2PlTYLL7i/LVdb9wCCZRQR8h4emt1la5nNmCRQwIhBa3sf1IAJIpnEf
 rvNWmHtmS3bV4O2BKmvPcPmpvmPE90klppTGbBYi4HU9DZB39zdOBjmcz0RrFVmQRU/d
 4BmDE5GF/mVlJmqLE8fGXsEbkm5+6IeIYu2m4joc80B9yrSxBlJwGytYOlrzTQ2SC9ov
 ziD8FcUv7dr8fFwJmz+W8r5bzC/7IRxnt0BATUkVz9JzNLJV9oYOH3G/I8pL3IIrY8Cq
 cHB6PRJLCFNJzq7zt5tC7wtBNuAYJD3bNGZ1QA/h9pj57Cw7SKJI6lwuSfmudlFp2dm1
 QbGQ==
X-Gm-Message-State: AOAM533i38s/lFf/k2sMNzWTEtCg1X1e9lrMiMvAecR8fdBswE9iqSVO
 cFsvK0rTXx43ccndC/FVfoavSskYSuU=
X-Google-Smtp-Source: ABdhPJxjB+0zxO6xL6RyfoCMLOVPVUDkZoBLGFRIItXKdbF0SDkrcy/xYDlxzy+hXMWPZDlHPPu6iQ==
X-Received: by 2002:a05:6638:204a:: with SMTP id
 t10mr477816jaj.62.1634573124795; 
 Mon, 18 Oct 2021 09:05:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] meson: *-user: only descend into *-user when configured
Date: Mon, 18 Oct 2021 10:04:45 -0600
Message-Id: <20211018160458.1976-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzinni@redhat.com>, Warner Losh <wlosh@bsdimp.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To increase flexibility, only descend into *-user when that is
configured. This allows *-user to selectively include directories based
on the host OS which may not exist on all hosts. Adopt Paolo's
suggestion of checking the configuration in the directories that know
about the configuration.

Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Warner Losh <wlosh@bsdimp.com>
Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/meson.build   |  4 ++++
 linux-user/meson.build |  4 ++++
 meson.build            | 12 ++++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 0369549340..5378f56f71 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -1,3 +1,7 @@
+if not have_bsd_user
+   subdir_done()
+endif
+
 bsd_user_ss.add(files(
   'bsdload.c',
   'elfload.c',
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682..bf62c13e37 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -1,3 +1,7 @@
+if not have_linux_user
+   subdir_done()
+endif
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
diff --git a/meson.build b/meson.build
index 6b7487b725..5e7946776d 100644
--- a/meson.build
+++ b/meson.build
@@ -40,12 +40,15 @@ config_host_data = configuration_data()
 genh = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
-have_user = false
+have_linux_user = false
+have_bsd_user = false
 have_system = false
 foreach target : target_dirs
-  have_user = have_user or target.endswith('-user')
+  have_linux_user = have_linux_user or target.endswith('linux-user')
+  have_bsd_user = have_bsd_user or target.endswith('bsd-user')
   have_system = have_system or target.endswith('-softmmu')
 endforeach
+have_user = have_linux_user or have_bsd_user
 have_tools = 'CONFIG_TOOLS' in config_host
 have_block = have_system or have_tools
 
@@ -2595,10 +2598,11 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-bsd_user_ss.add(files('gdbstub.c'))
+common_ss.add(libbpf)
+
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
+linux_user_ss.add(files('thunk.c'))
 specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 
 # needed for fuzzing binaries
-- 
2.32.0


