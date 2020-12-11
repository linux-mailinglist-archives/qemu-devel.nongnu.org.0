Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10342D7A98
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:13:25 +0100 (CET)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl2q-0004f6-Qc
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knkyF-0000zG-76
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knkyB-0005Oc-WA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607702914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=smGZ4uoTxcDPT9XrWX6LfVfOjoTcKzZnOgpZ3j32N64=;
 b=M46VzMHlGiLU6fkPEXodo7hGQomcg+IZoLJisGQ2YE8qq26pds5nU6Pkg0FHFqBH6YDanV
 4pAbcXmpg46ApmMFAtFNR08i7srwd3G2elpJeoPVw4JO1y+8i/wVCRUfqR3Mcx6AvMl6Ym
 wPI2IXVQNodBLm5GVfGj7UPx6QW/UBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-SHj6I2p6Np2LLsdh0miftw-1; Fri, 11 Dec 2020 11:08:32 -0500
X-MC-Unique: SHj6I2p6Np2LLsdh0miftw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD1AA0C04
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:08:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-134.ams2.redhat.com
 [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDD986F7E5;
 Fri, 11 Dec 2020 16:08:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: add support for remote power control to VNC server
Date: Fri, 11 Dec 2020 16:08:25 +0000
Message-Id: <20201211160825.102679-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "XVP" (Xen VNC Proxy) extension defines a mechanism for a VNC client
to issue power control requests to trigger graceful shutdown, reboot, or
hard reset.

This option is not enabled by default, since we cannot assume that users
with VNC access implicitly have administrator access to the guest OS.

Thus is it enabled with a boolean "power-control" option e.g.

   -vnc :1,power-control=on

While, QEMU can easily support shutdown and reset, there's no easy way
to wire up reboot support at this time. In theory it could be done by
issuing a shutdown, followed by a reset, but there's no convenient
wiring for such a pairing in QEMU. It also isn't possible to have the
VNC server directly talk to QEMU guest agent, since the agent chardev is
typically owned by an external mgmt app.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx |  4 ++++
 ui/vnc.c        | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 ui/vnc.h        | 13 +++++++++++
 3 files changed, 75 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 104632ea34..c009c4466e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2215,6 +2215,10 @@ SRST
         transmission. When not using an -audiodev argument, this option
         must be omitted, otherwise is must be present and specify a
         valid audiodev.
+
+    ``power-control``
+        Permit the remote client to issue shutdown, reboot or reset power
+        control requests.
 ERST
 
 ARCHHEADING(, QEMU_ARCH_I386)
diff --git a/ui/vnc.c b/ui/vnc.c
index 49235056f7..7a1003b3ff 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "hw/qdev-core.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -2039,6 +2040,17 @@ static void send_ext_audio_ack(VncState *vs)
     vnc_flush(vs);
 }
 
+static void send_xvp_message(VncState *vs, int code)
+{
+    vnc_lock_output(vs);
+    vnc_write_u8(vs, VNC_MSG_SERVER_XVP);
+    vnc_write_u8(vs, 0); /* pad */
+    vnc_write_u8(vs, 1); /* version */
+    vnc_write_u8(vs, code);
+    vnc_unlock_output(vs);
+    vnc_flush(vs);
+}
+
 static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
 {
     int i;
@@ -2121,6 +2133,12 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
         case VNC_ENCODING_LED_STATE:
             vs->features |= VNC_FEATURE_LED_STATE_MASK;
             break;
+        case VNC_ENCODING_XVP:
+            if (vs->vd->power_control) {
+                vs->features |= VNC_FEATURE_XVP;
+                send_xvp_message(vs, VNC_XVP_CODE_INIT);
+            }
+            break;
         case VNC_ENCODING_COMPRESSLEVEL0 ... VNC_ENCODING_COMPRESSLEVEL0 + 9:
             vs->tight->compression = (enc & 0x0F);
             break;
@@ -2348,6 +2366,41 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
 
         client_cut_text(vs, read_u32(data, 4), data + 8);
         break;
+    case VNC_MSG_CLIENT_XVP:
+        if (!(vs->features & VNC_FEATURE_XVP)) {
+            error_report("vnc: xvp client message while disabled");
+            vnc_client_error(vs);
+            break;
+        }
+        if (len == 1) {
+            return 4;
+        }
+        if (len == 4) {
+            uint8_t version = read_u8(data, 2);
+            uint8_t action = read_u8(data, 3);
+
+            if (version != 1) {
+                error_report("vnc: xvp client message version %d != 1",
+                             version);
+                vnc_client_error(vs);
+                break;
+            }
+
+            switch (action) {
+            case VNC_XVP_ACTION_SHUTDOWN:
+                qemu_system_powerdown_request();
+                break;
+            case VNC_XVP_ACTION_REBOOT:
+                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
+                break;
+            case VNC_XVP_ACTION_RESET:
+                qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET);
+                break;
+            default:
+                send_xvp_message(vs, VNC_XVP_CODE_FAIL);
+                break;
+            }
+        }
     case VNC_MSG_CLIENT_QEMU:
         if (len == 1)
             return 2;
@@ -3374,6 +3427,9 @@ static QemuOptsList qemu_vnc_opts = {
         },{
             .name = "audiodev",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "power-control",
+            .type = QEMU_OPT_BOOL,
         },
         { /* end of list */ }
     },
@@ -3937,6 +3993,8 @@ void vnc_display_open(const char *id, Error **errp)
         vd->non_adaptive = true;
     }
 
+    vd->power_control = qemu_opt_get_bool(opts, "power-control", false);
+
     if (tlsauthz) {
         vd->tlsauthzid = g_strdup(tlsauthz);
     } else if (acl) {
diff --git a/ui/vnc.h b/ui/vnc.h
index 4e2637ce6c..177380cb5e 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -176,6 +176,7 @@ struct VncDisplay
     int ws_subauth; /* Used by websockets */
     bool lossy;
     bool non_adaptive;
+    bool power_control;
     QCryptoTLSCreds *tlscreds;
     QAuthZ *tlsauthz;
     char *tlsauthzid;
@@ -411,6 +412,7 @@ enum {
 #define VNC_ENCODING_AUDIO                0XFFFFFEFD /* -259 */
 #define VNC_ENCODING_TIGHT_PNG            0xFFFFFEFC /* -260 */
 #define VNC_ENCODING_LED_STATE            0XFFFFFEFB /* -261 */
+#define VNC_ENCODING_XVP                  0XFFFFFECB /* -309 */
 #define VNC_ENCODING_WMVi                 0x574D5669
 
 /*****************************************************************************
@@ -450,6 +452,7 @@ enum {
 #define VNC_FEATURE_ZRLE                     9
 #define VNC_FEATURE_ZYWRLE                  10
 #define VNC_FEATURE_LED_STATE               11
+#define VNC_FEATURE_XVP                     12
 
 #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
 #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
@@ -463,6 +466,7 @@ enum {
 #define VNC_FEATURE_ZRLE_MASK                (1 << VNC_FEATURE_ZRLE)
 #define VNC_FEATURE_ZYWRLE_MASK              (1 << VNC_FEATURE_ZYWRLE)
 #define VNC_FEATURE_LED_STATE_MASK           (1 << VNC_FEATURE_LED_STATE)
+#define VNC_FEATURE_XVP_MASK                 (1 << VNC_FEATURE_XVP)
 
 
 /* Client -> Server message IDs */
@@ -515,6 +519,15 @@ enum {
 #define VNC_MSG_SERVER_QEMU_AUDIO_BEGIN           1
 #define VNC_MSG_SERVER_QEMU_AUDIO_DATA            2
 
+/* XVP server -> client status code */
+#define VNC_XVP_CODE_FAIL 0
+#define VNC_XVP_CODE_INIT 1
+
+/* XVP client -> server action request  */
+#define VNC_XVP_ACTION_SHUTDOWN 2
+#define VNC_XVP_ACTION_REBOOT 3
+#define VNC_XVP_ACTION_RESET 4
+
 
 /*****************************************************************************
  *
-- 
2.29.2


