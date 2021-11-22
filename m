Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D6458783
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:53:22 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxaD-00047M-JZ
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWZ-0004F1-76
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:35 -0500
Received: from [2607:f8b0:4864:20::72c] (port=46683
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWX-0000yE-RV
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:34 -0500
Received: by mail-qk1-x72c.google.com with SMTP id a11so16418108qkh.13
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVL92mTvh6v8iF1R3vWkKRUUlyjnSFC3fOOV0v2z5ak=;
 b=I4B0dGE16e8GGX5KPhiJLJm7kAmblYHohvqe6SU0cwXXIARJrlEg/9f6zBSjLdm/Fd
 47/K9hgy4tNwnalJjqAavKI9+bWWqGwZBWqG0ZmXNyXhk023Z/DnFhhYxafJQtabcT9W
 Y943vRFxCEwbYbirjGG53tnMgoenxh2Rq1kvBkE2aPOpGav4U9F5xLdbD8psAr8SB1en
 1yE/NT6RYqfUzQAQdEM7uoHxTx3RPgsEuFtn66Eu1xi80v5HORZxbSDvZg0mXbJSSzba
 VMRQVAv0fSPsfaJooH9YeXxRr6yo5D0qvAPgYboN0HTNxisrffnHdrx3Eg1Wq2ggq4bh
 jO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVL92mTvh6v8iF1R3vWkKRUUlyjnSFC3fOOV0v2z5ak=;
 b=L41A7pkqv3I6jur04x4CmbqY0xUTcgJoNwOuc1qcOzDWr9h2rZYOALnUsbahhgn6P7
 ymVW4jknMf55yPmZWhCigZrYr5RoXKzIR7vtuxwKtNmBnIez5ddvqKDAmj+jMU8bVHwE
 7ZIoA9PjXusEovqrlYka0lckpNKeOtjVYQjaFCfCU1GuQdyq3CUPq/t4P0KXLABmX8PV
 YJMSS+4E9YX+YnK2ZuVtH8n3u9T97TB6INtuvUyDawLrO2p39EqO2EQ8D3hxE9nY2TDZ
 NxX5rgommPqRe+3qFaY96SBAedBWVIbV0f3Xev9yzaN1tb37N0WO25CeES2HLcs8isXc
 +t1w==
X-Gm-Message-State: AOAM5327hjesi8CfeTI3Z6/9NusQ3xr2cIdPLn6BqHo75kWC4LDCJ9V5
 7aRU9fp29ce6Fk87NR9B8U7qmn+yswzW3w==
X-Google-Smtp-Source: ABdhPJzJO7+38kVv+boOowRn0tnopMwGe4hD7SDOxbnLf93sKeMumLmQ/wSljH5+CgG14XO6AvQgFQ==
X-Received: by 2002:a05:620a:915:: with SMTP id
 v21mr44140257qkv.449.1637542172997; 
 Sun, 21 Nov 2021 16:49:32 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:32 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Sun, 21 Nov 2021 19:49:13 -0500
Message-Id: <20211122004913.20052-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Rebase to master]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 fsdev/meson.build |  1 +
 meson.build       | 12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fsdev/meson.build b/fsdev/meson.build
index adf57cc43e..b632b66348 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
   'qemu-fsdev.c',
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/meson.build b/meson.build
index 96de1a6ef9..0f92adea52 100644
--- a/meson.build
+++ b/meson.build
@@ -1383,17 +1383,21 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
-have_virtfs = (targetos == 'linux' and
+if targetos == 'darwin'
+  have_virtfs = have_system
+else
+  have_virtfs = (targetos == 'linux' and
     have_system and
     libattr.found() and
     libcap_ng.found())
+endif
 
-have_virtfs_proxy_helper = have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and have_tools
 
 if get_option('virtfs').enabled()
   if not have_virtfs
-    if targetos != 'linux'
-      error('virtio-9p (virtfs) requires Linux')
+    if targetos != 'linux' and targetos != 'darwin'
+      error('virtio-9p (virtfs) requires Linux or Darwin')
     elif not libcap_ng.found() or not libattr.found()
       error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
     elif not have_system
-- 
2.34.0


