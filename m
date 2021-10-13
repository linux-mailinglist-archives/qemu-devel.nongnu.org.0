Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999842CFD1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:08:08 +0200 (CEST)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapE7-0004a2-BY
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIp-0004B8-Mu
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:52 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIo-0005DK-4U
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:51 -0400
Received: by mail-qt1-x82a.google.com with SMTP id i1so4195947qtr.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mn02ONNGtwenhLF24rtiQX06IODpNJXR8gRnHXMmUbs=;
 b=bqQG0jUBCG1LK4V4xMMWma6szjVS2NW5A2RXWEfJtiuPFWuueZ4v5r1Eo5avlpkIf2
 YBbjnU0bCttcjiaIVeniW55xqjuYhWiY2UscVfssy09vKO2qqLIVmSz+hsEH5IuwbRN/
 7A45JpalNViMWXneytXUwedA9IY+sTForH4SC1cBgeyeZdHvN3XUYERh41qzPCscIrRr
 W7wH7yU+X+j72D/sxIdblH68Qp8PVFml5OKZ7snlflMZwlZK8bDjC0PUew5UqZ7u1VAT
 qA7OqQY70WzdYGiWncelehgu5M6xWtRrQFCgQRHgjwlnCVDEOIb5y1Dews+RPbU+MNeL
 AL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mn02ONNGtwenhLF24rtiQX06IODpNJXR8gRnHXMmUbs=;
 b=fG+KcmphIQqkDDl6hVMuXfoZTptLfTDxwpf7gComS3Whi0Rwys41KYpQMWsP4FUU4x
 ivIyMFbic5vHR52UxxHrd1Y4WL9tl8p3kKh+NfdMxhIjZ+8pZqhISvrkYLgDThvKKf9F
 kX3nO1Q5AKlVMDV1YLPHhhabudCRBtGmUIaMD8Bk6xl6dJ+Zt8ZOgZ8rZp2Ca2BgJzan
 DLdPWrlirPS4S2UnWD9VM6rx5FtZ4ztXJN2BM+rXY+QjZHu9cefkM08RJi53ZAJmsxy1
 VF2g8Y81E0JXvj2rzG61ExSX8lXYmYEIyET61XJCwdG6PR48LyEfnlBsP4anfmBGffN1
 LzLA==
X-Gm-Message-State: AOAM531edvvg+StZjUxvJWKVwGwbkDFDYwOygQuSN51NomCv6wzFaoWw
 pek6+QVCojqGl1gj91100aSPPcXfaL8ydg==
X-Google-Smtp-Source: ABdhPJzlro7CBsgDuxZa05n18Jk8x5FxPAgC5PtrgsCNYkESZTjoTwSjySC532cAd043b7cE0mTMZw==
X-Received: by 2002:ac8:6b96:: with SMTP id z22mr2495837qts.311.1634166288334; 
 Wed, 13 Oct 2021 16:04:48 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:48 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Wed, 13 Oct 2021 19:04:05 -0400
Message-Id: <20211013230405.32170-12-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
---
 fsdev/meson.build |  1 +
 meson.build       | 17 ++++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

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
index 99a0a3e689..5e777b271d 100644
--- a/meson.build
+++ b/meson.build
@@ -1203,17 +1203,20 @@ have_host_block_device = (targetos != 'darwin' or
 # config-host.h #
 #################
 
-have_virtfs = (targetos == 'linux' and
-    have_system and
-    libattr.found() and
-    libcap_ng.found())
+if targetos == 'linux'
+  have_virtfs = (have_system and
+      libattr.found() and
+      libcap_ng.found())
+elif targetos == 'darwin'
+  have_virtfs = have_system
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
2.33.0


