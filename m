Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CD284AB2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 13:14:52 +0200 (CEST)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPkvj-0003WU-Lz
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 07:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPku3-0001rF-Tk
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kPktw-0005LY-CC
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 07:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601982779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZn95L6kUsLR6YDfNvagiwYZibhPsdA0FOVQExAddoU=;
 b=h1zOXEv8l1/XHgPm7JLRj6xCnn5dZIOBJ4ZPDOAMA7uxZiOaHcuRitjyUTErumA7VYfluC
 9yKKrSVId8uJ9AbuCgOetABEU3j4StlvSv8neJU2lHeyqiEO2d1AbXQqM1UtuRo/kTVyzW
 x9GDBNfe+dTTNgIjUB5qC6id4LeBe4c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Mqka_BOkOaGpLUWfWFpfIg-1; Tue, 06 Oct 2020 07:12:57 -0400
X-MC-Unique: Mqka_BOkOaGpLUWfWFpfIg-1
Received: by mail-wr1-f70.google.com with SMTP id g7so412547wrm.2
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 04:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZn95L6kUsLR6YDfNvagiwYZibhPsdA0FOVQExAddoU=;
 b=Q03ck9OIDgNpWfiEiankjpIUGa8MZEE3BseEc53yEWqyORD9igfjDg6d+S783oDo+H
 7TWaVo6WEkKWK298D7aZkBZt8id9ti0gwUPHlHpEkism9tbgKW0eP+lSGk8L89MrY4bY
 LnLQsDnojyaCD/Ts/D7tlPqUfcM5go94L0R9BQhV20HQL340ShS+/tpnG9dMXoC3Wber
 UBhQYqwaKr2fxRZcIDHuSpOz9pTYCJLU6XjZK76FDP2S9uJSAsWmmY8nekE+R3twfH71
 3IPm23INyLPvXcPJQLiC6Yet0xJA1Cn8EbPwzt3UhmWMDqQ4SVEGtQYsF7RoDPufFwQV
 34LA==
X-Gm-Message-State: AOAM532G8jDoxpkK/xMDLTvOQhZxuTX7p97iWCVWoDjJLRxgbPBUjoIq
 DdvyxrAhVh3+lHHaZWflY8FozCt4KwLSeh4cJQ3w+7EPnb0ENWJNrjlsGrAzOhbCCVKhTrxDQhs
 m3nSlmk5krG9WJa8=
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr4507354wml.180.1601982776502; 
 Tue, 06 Oct 2020 04:12:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCqSBFskFiADjiN4Pc7xQWdQivth2NlmZ5Ob4Em3X1XDJJqOZhhZo1aViSo2LgL+HMbfGBLA==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr4507335wml.180.1601982776271; 
 Tue, 06 Oct 2020 04:12:56 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id a17sm4063654wra.29.2020.10.06.04.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 04:12:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] io: Move the creation of the library to the main
 meson.build
Date: Tue,  6 Oct 2020 13:12:16 +0200
Message-Id: <20201006111219.2300921-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006111219.2300921-1-philmd@redhat.com>
References: <20201006111219.2300921-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Be consistent creating all the libraries in the main meson.build file.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build    | 10 ++++++++++
 io/meson.build | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meson.build b/meson.build
index 55966c3b60..70545efd74 100644
--- a/meson.build
+++ b/meson.build
@@ -1064,6 +1064,7 @@ block_ss = ss.source_set()
 bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
+io_ss = ss.source_set()
 linux_user_ss = ss.source_set()
 qmp_ss = ss.source_set()
 softmmu_ss = ss.source_set()
@@ -1328,6 +1329,15 @@ qemu_syms = custom_target('qemu.syms', output: 'qemu.syms',
 # Library dependencies #
 ########################
 
+io_ss = io_ss.apply(config_host, strict: false)
+libio = static_library('io', io_ss.sources() + genh,
+                       dependencies: [io_ss.dependencies()],
+                       link_with: libqemuutil,
+                       name_suffix: 'fa',
+                       build_by_default: false)
+
+io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
+
 libmigration = static_library('migration', sources: migration_files + genh,
                               name_suffix: 'fa',
                               build_by_default: false)
diff --git a/io/meson.build b/io/meson.build
index 768c1b5ec3..bcd8b1e737 100644
--- a/io/meson.build
+++ b/io/meson.build
@@ -1,4 +1,3 @@
-io_ss = ss.source_set()
 io_ss.add(genh)
 io_ss.add(files(
   'channel-buffer.c',
@@ -14,12 +13,3 @@ io_ss.add(files(
   'net-listener.c',
   'task.c',
 ))
-
-io_ss = io_ss.apply(config_host, strict: false)
-libio = static_library('io', io_ss.sources() + genh,
-                       dependencies: [io_ss.dependencies()],
-                       link_with: libqemuutil,
-                       name_suffix: 'fa',
-                       build_by_default: false)
-
-io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
-- 
2.26.2


