Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C134B328
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 00:50:41 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPwDv-000680-P4
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 19:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lPwCo-0005ij-PZ
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 19:49:30 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:1844
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lPwCn-0003Lq-Bx
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 19:49:30 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4F6dz95k3xz8PbP;
 Fri, 26 Mar 2021 19:51:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=SwNfJAQKMElcEMMgYRQkkr9CUYU=; b=Bd8tlyuaG1qEVf2+GRD9sc0VncTZ
 S5Vb/i+xit1NuWGGlB5X42ythdZScbHY2E6UnvjtsuXpuZKC5N2qvq90rzys+shI
 6iJ/aA+1jwyuOZPJssRbjv7TI8ybItVVUQbZQ/JvXUSAbILBEHfKDuUigd59Og+A
 WkxukC3dpp2h+wc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=KNmkI9jwMh4H07jHL12V6uGhe0Rt0zUwDwFwoouZrIRhcMsEELd4a
 +/1m/oMPBxGbjH5n2W8Bls4Ub2UE0eZ3X6GgiLHdVzUjsUf7jHsknLXMtzXFuHMA
 +jzbW0+jpDsnAGIi/RdWhIJgAVDwSgTaeI8hUcdE2cXhSm4seH/eY4=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-39-142-114-123-227.dsl.bell.ca [142.114.123.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4F6dz956Znz8PbN;
 Fri, 26 Mar 2021 19:51:17 -0400 (EDT)
Date: Fri, 26 Mar 2021 19:49:12 -0400
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PATCH] tap-bsd: Remove special casing for older OpenBSD releases
Message-ID: <YF5y+MDiK2QInFA2@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenBSD added support for tap(4) 10 releases ago.

Remove the special casing for older releases.


Signed-off-by: Brad Smith <brad@comstyle.com>

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf674b1..59dfcdfae0 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -35,10 +35,6 @@
 #include <net/if_tap.h>
 #endif
 
-#if defined(__OpenBSD__)
-#include <sys/param.h>
-#endif
-
 #ifndef __FreeBSD__
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
              int vnet_hdr_required, int mq_required, Error **errp)
@@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         if (*ifname) {
             snprintf(dname, sizeof dname, "/dev/%s", ifname);
         } else {
-#if defined(__OpenBSD__) && OpenBSD < 201605
-            snprintf(dname, sizeof dname, "/dev/tun%d", i);
-#else
             snprintf(dname, sizeof dname, "/dev/tap%d", i);
-#endif
         }
         TFR(fd = open(dname, O_RDWR));
         if (fd >= 0) {

