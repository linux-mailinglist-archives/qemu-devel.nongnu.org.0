Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FC264FB9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 21:50:32 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGSaV-0004gw-9c
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 15:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSZO-00036m-1Z
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:49:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44486
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGSZM-0000Zc-Hm
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 15:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599767359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvsBQu3DI4XVEHjUAoI1cF91AFkzecmjdcKRXIM09Is=;
 b=Ym1CDDt/Mv9TKfML+8U/GENcJKd9DmK5j9zmNIl8I4RHU9go7U7/sh4RpkqPEtL+RL1Tnn
 Ab/6Vqeu0Hss5puwop9JST+FpWfC2c3wbwEg2crvMWmfEYYYiGE1/1RhkCW75TV0OwRl8I
 c+5jwW4j/WHr2O0NXuTMTwo7GHjOIgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-wAYbjAnYOYq7YwcULULqNA-1; Thu, 10 Sep 2020 15:49:17 -0400
X-MC-Unique: wAYbjAnYOYq7YwcULULqNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C5E185A0F8;
 Thu, 10 Sep 2020 19:49:17 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2C547E8FD;
 Thu, 10 Sep 2020 19:49:10 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/18] chardev: Move PARALLEL_CHARDEV macro to common code
Date: Thu, 10 Sep 2020 15:48:46 -0400
Message-Id: <20200910194903.4104696-2-ehabkost@redhat.com>
In-Reply-To: <20200910194903.4104696-1-ehabkost@redhat.com>
References: <20200910194903.4104696-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro is exactly the same for both Linux and BSD, so move its
definition outside the host OS #ifdef blocks.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 chardev/char-parallel.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6c..390d03506c 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -47,6 +47,9 @@
 #include "chardev/char-fd.h"
 #include "chardev/char-parallel.h"
 
+#define PARALLEL_CHARDEV(obj) \
+    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
+
 #if defined(__linux__)
 
 typedef struct {
@@ -55,9 +58,6 @@ typedef struct {
     int mode;
 } ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj) \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
-
 static int pp_hw_mode(ParallelChardev *s, uint16_t mode)
 {
     if (s->mode != mode) {
@@ -182,9 +182,6 @@ typedef struct {
     int fd;
 } ParallelChardev;
 
-#define PARALLEL_CHARDEV(obj)                                   \
-    OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
-
 static int pp_ioctl(Chardev *chr, int cmd, void *arg)
 {
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
-- 
2.26.2


