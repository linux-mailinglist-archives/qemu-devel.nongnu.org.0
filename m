Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCED583909
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:54:41 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxPs-0004Ww-RE
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGxDV-0006Xx-Bj
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oGxDR-0002pk-9P
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658990507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZqWFVWhIGLvP4Lw52dz36eIjGNfhlyIxEkxopxiKIOY=;
 b=Bc60mz/w3nAYLG30ODMFDHLDdf581ji6vtxEVKzX526jrz3AR+LkiKbypT4LS6OLm9NIxo
 hNhrR/wkSFzXV0QtwyKvTreLttQCG/JfIW0TlWjSfrWUDxkyV/ogjv8O6+4GgMYZqtLT33
 pjt0YVY6QwvGrGDB8XSF+OfF60hu2y0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-YVOGHf0CN-aNmtbFXw-wpQ-1; Thu, 28 Jul 2022 02:41:46 -0400
X-MC-Unique: YVOGHf0CN-aNmtbFXw-wpQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402270a00b0043c0fed89b9so520623edd.15
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZqWFVWhIGLvP4Lw52dz36eIjGNfhlyIxEkxopxiKIOY=;
 b=v21Cmjr2otmxiaVeU97R/5KOmVIdgXWJjkGaSBHzgqUXZtSZ5H0eFo171kImsJNRKY
 UwsGNfuNU5J5QTsxw3Nu23hq0WDMCfh9IrDHl1VvoOQnwSy5JlNSOnDgMFs5wWQcSJFo
 BC2urMOv+AazFWEgNJyHKyZWBRnvT5WtNPZ5mT77Z8WwrioBipldeC/Mf16ZiZ64yW56
 qkLrNlP+w+QCCo0PeVZ2opfFGBS2W7UcxMqfLsYt2/PIohGiGBx89g1AF1/5xL7sO8dq
 5FwaXNNhV4r+wWaH8osli9fmRYhmKvCIMOWkUS9aOcYqvsWN2wxjoLgpf4wyQkCRxecd
 k9KQ==
X-Gm-Message-State: AJIora+ySqrkqdBLK3rRW3bDpZTxE5LR2ttn57+Bx5rmjVSVlwj24lBv
 UnMuzfhIIWXjsKNRTTK+w85OkA/VM1+dJeI9+vYF27IETTXLG4e+Vc/SR99MB9q36uq1S6f58DQ
 zVfaNfV7XJPZcoUjSVZK50Clsdthv/7nJk1N7R9so9PFwVGHo6D/tDtDK7KCKqmSqIoo=
X-Received: by 2002:a17:907:2bc6:b0:72e:ceea:862b with SMTP id
 gv6-20020a1709072bc600b0072eceea862bmr20726705ejc.134.1658990504997; 
 Wed, 27 Jul 2022 23:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uccFG2O8RA1Py4P4zH3LMc8q+2bkl/CT7zlTAoZLpeoBJZyzRgId0dxdus1GvU/NfJo6anFQ==
X-Received: by 2002:a17:907:2bc6:b0:72e:ceea:862b with SMTP id
 gv6-20020a1709072bc600b0072eceea862bmr20726692ejc.134.1658990504668; 
 Wed, 27 Jul 2022 23:41:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 ff3-20020a1709069c0300b0072ab06bc3b5sm53353ejc.34.2022.07.27.23.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:41:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH] ui: dbus-display requires CONFIG_GBM
Date: Thu, 28 Jul 2022 08:41:43 +0200
Message-Id: <20220728064143.209559-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without CONFIG_GBM, compiling dbus-display fails with

../ui/dbus.c: In function ‘dbus_create_context’:
../ui/dbus.c:47:20: error: ‘qemu_egl_rn_ctx’ undeclared (first use in this function); did you mean ‘qemu_egl_init_ctx’?
   47 |                    qemu_egl_rn_ctx);
      |                    ^~~~~~~~~~~~~~~
      |                    qemu_egl_init_ctx
../ui/dbus.c:47:20: note: each undeclared identifier is reported only once for each function it appears in

and many other similar errors, because include/ui/egl-helpers.h only has
these declaration if gbm is found on the system.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build    | 4 ++--
 ui/meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 9b67db0d67..38403d2892 100644
--- a/meson.build
+++ b/meson.build
@@ -1697,8 +1697,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires glib>=2.64') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
-  .require(opengl.found(),
-           error_message: '-display dbus requires epoxy/egl') \
+  .require(opengl.found() and gbm.found(),
+           error_message: '-display dbus requires epoxy/egl and gbm') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
diff --git a/ui/meson.build b/ui/meson.build
index e9f48c5315..ec13949776 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -81,7 +81,7 @@ if dbus_display
                                           '--interface-prefix', 'org.qemu.',
                                           '--c-namespace', 'QemuDBus',
                                           '--generate-c-code', '@BASENAME@'])
-  dbus_ss.add(when: [gio, pixman, opengl],
+  dbus_ss.add(when: [gio, pixman, opengl, gbm],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
-- 
2.36.1


