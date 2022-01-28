Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87049F04B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:02:07 +0100 (CET)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFeQ-0006bp-Om
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003Zh-HO
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: from [2607:f8b0:4864:20::f31] (port=33549
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005OA-QO
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:53 -0500
Received: by mail-qv1-xf31.google.com with SMTP id t7so4498459qvj.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vZzu/37AUOxsP6nKwgFuXoXcH4tiFyEGy9E9ksw3YzU=;
 b=J3bSYydkQXlUp6c37K0XG4yuQ5H6mFA2pqMVzaXbGgkLU2TPnbkTz8l/XOamxp+vWI
 31/tz3hNBOaFLuVWyEn1dhx13ne5+5U6V4T2rRFfe8QaaLL7q7RY9znkbMQLUj7yEIV1
 HU9k2gVO7LaSo2rrfijvPbsg6qMwoNScIBYBpS7QpDjM/P12ZaTggLX8VJ5TpeQ7U4IA
 ZK56eDJl+5Ru+NQFds+i4VkcYCLqV/W3Dg+p2rKs70iu0B7vyTljV1C+Z1PvteMbcOit
 Uo0edJZ7WPaZh8/bIzceJfrphXDPXyTuogpdVafrmruucNEQ6ZBauNQqBrrykZr/tHG9
 nrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vZzu/37AUOxsP6nKwgFuXoXcH4tiFyEGy9E9ksw3YzU=;
 b=auBIb1buYttGyz3iRR0WNQYGx6HtLsFGMvI43+6q7Jz3v7/RnjUXkZy3F4rMAscWFM
 7HCJ9c8nyVxw1HdiY0TO5+L02Mchp/4fcfrVnq8dcjkQUGr/yxVDDruDiTLA9Gyaj+a4
 AMEM+eyACaMov0iBlBDiSKj8IJJRVTgsTGaiQKFitfg/mG+4suIyu97dv02SbijMPHN3
 z5ApAU6PaDY4cxHkB15XlREh07qpS3TEryMtESAv4aqzKn6/fRaQxGIVWuFsfs804Z52
 2edWoLxU95z5JZiPUs8DJ29iEH7yq52p67IjnE1rb4RXYXmOQBlv6QLAsBzdgRNQ4MaZ
 1YmQ==
X-Gm-Message-State: AOAM532pCxjTfhvvdWtVOalTmO8HX/5fO2HW28pcGv3ATruFSjguliJZ
 xaPZx5rsP0WKvsU6DUcLmesx0uli2m+gbQ==
X-Google-Smtp-Source: ABdhPJyHsYTkFeqHNJ9hdTmUzCOaWdxAfFQNDhP8Z5DpPo/2Tj4+PsQbzjxvr6tYo3pRrJHz5ab4CQ==
X-Received: by 2002:a05:6214:e68:: with SMTP id
 jz8mr5712760qvb.124.1643331396555; 
 Thu, 27 Jan 2022 16:56:36 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:36 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Thu, 27 Jan 2022 19:56:10 -0500
Message-Id: <20220128005611.87185-11-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf31.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Rebase to master]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
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
index e0cfafe8d9..726c618982 100644
--- a/meson.build
+++ b/meson.build
@@ -1420,17 +1420,21 @@ if not get_option('dbus_display').disabled()
   endif
 endif
 
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
2.34.1


