Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63947682A2D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndC-0002fM-9y; Tue, 31 Jan 2023 05:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncv-0002ME-Ns
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnct-0002Wz-Ig
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/Wl//0Bzl5LigAWkUtY0QO7uqjz/hoHdSO2xqPKG28=;
 b=DSNlbc/wG6NhSBGctieBkem/r2orubRQFX3Icg1up+ODiSGkC6jKiqbbkIWVKwqW6/Bwyv
 VAmhsh+0QG+/Nd5sX8WQykIwUuiuwg1pEO4amqZn4l0FbAgIhD4S663nLDY655TPH2menk
 ddpgJmv7UhwXP11rSptSJbS0prcC86U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-dhuyKKMvML-Mspout0oNgw-1; Tue, 31 Jan 2023 05:12:25 -0500
X-MC-Unique: dhuyKKMvML-Mspout0oNgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80854885620;
 Tue, 31 Jan 2023 10:12:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B0A4C15BAD;
 Tue, 31 Jan 2023 10:12:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/27] qemu/bswap: Use compiler __builtin_bswap() on NetBSD
Date: Tue, 31 Jan 2023 11:11:52 +0100
Message-Id: <20230131101205.1499867-15-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Remove the NetBSD specific ifdef'ry.

This reverts commit 1360677cfe3ca8f945fa1de77823df21a77e4500
("makes NetBSD use the native bswap functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111163147.71761-7-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build          |  4 ----
 include/qemu/bswap.h | 11 -----------
 2 files changed, 15 deletions(-)

diff --git a/meson.build b/meson.build
index 7e15a010bf..a03d3dbd3a 100644
--- a/meson.build
+++ b/meson.build
@@ -2030,10 +2030,6 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
-config_host_data.set('CONFIG_MACHINE_BSWAP_H',
-                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
-                                          prefix: '''#include <sys/endian.h>
-                                                     #include <sys/types.h>'''))
 config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
                      cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
 config_host_data.set('CONFIG_RTNETLINK',
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 32d5cdec27..3cbe52246b 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,27 +1,16 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#ifdef CONFIG_MACHINE_BSWAP_H
-# include <sys/endian.h>
-# include <machine/bswap.h>
-# else
-#define BSWAP_FROM_FALLBACKS
-#endif /* ! CONFIG_MACHINE_BSWAP_H */
-
 #ifdef __cplusplus
 extern "C" {
 #endif
 
-#ifdef BSWAP_FROM_FALLBACKS
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
 #undef  bswap32
 #define bswap32(_x) __builtin_bswap32(_x)
 #undef  bswap64
 #define bswap64(_x) __builtin_bswap64(_x)
-#endif
-
-#undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
 {
-- 
2.31.1


