Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB6169A29
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Feb 2020 22:09:22 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5yV7-0006NL-6r
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 16:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1j5ySv-0004Eh-UF
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1j5ySu-0001gR-J0
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:59518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1j5ySu-0001eg-At
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2020 13:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,477,1574150400"; d="scan'208";a="230945816"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2020 13:07:01 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] net/colo-compare.c: Expose "expired_scan_cycle" to user
Date: Mon, 24 Feb 2020 04:58:05 +0800
Message-Id: <20200223205805.26412-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223205805.26412-1-chen.zhang@intel.com>
References: <20200223205805.26412-1-chen.zhang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: Daniel Cho <danielcho@qnap.com>, Zhang Chen <chen.zhang@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

The "expired_scan_cycle" determines colo-compare scan expired
net packet cycle.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 48 +++++++++++++++++++++++++++++++++++++++++++---
 qemu-options.hx    |  3 ++-
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index ec09b2a524..10c0239f9d 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -48,7 +48,6 @@ static NotifierList colo_compare_notifiers =
 #define COLO_COMPARE_FREE_PRIMARY     0x01
 #define COLO_COMPARE_FREE_SECONDARY   0x02
 
-/* TODO: Should be configurable */
 #define REGULAR_PACKET_CHECK_MS 3000
 #define DEFAULT_TIME_OUT_MS 3000
 
@@ -94,6 +93,7 @@ typedef struct CompareState {
     SocketReadState notify_rs;
     bool vnet_hdr;
     uint32_t compare_timeout;
+    uint32_t expired_scan_cycle;
 
     /*
      * Record the connection that through the NIC
@@ -823,7 +823,7 @@ static void check_old_packet_regular(void *opaque)
     /* if have old packet we will notify checkpoint */
     colo_old_packet_check(s);
     timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-                REGULAR_PACKET_CHECK_MS);
+              s->expired_scan_cycle);
 }
 
 /* Public API, Used for COLO frame to notify compare event */
@@ -853,7 +853,7 @@ static void colo_compare_timer_init(CompareState *s)
                                 SCALE_MS, check_old_packet_regular,
                                 s);
     timer_mod(s->packet_check_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
-                    REGULAR_PACKET_CHECK_MS);
+              s->expired_scan_cycle);
 }
 
 static void colo_compare_timer_del(CompareState *s)
@@ -1018,6 +1018,39 @@ out:
     error_propagate(errp, local_err);
 }
 
+static void compare_get_expired_scan_cycle(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    CompareState *s = COLO_COMPARE(obj);
+    uint32_t value = s->expired_scan_cycle;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void compare_set_expired_scan_cycle(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    CompareState *s = COLO_COMPARE(obj);
+    Error *local_err = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &local_err);
+    if (local_err) {
+        goto out;
+    }
+    if (!value) {
+        error_setg(&local_err, "Property '%s.%s' requires a positive value",
+                   object_get_typename(obj), name);
+        goto out;
+    }
+    s->expired_scan_cycle = value;
+
+out:
+    error_propagate(errp, local_err);
+}
+
 static void compare_pri_rs_finalize(SocketReadState *pri_rs)
 {
     CompareState *s = container_of(pri_rs, CompareState, pri_rs);
@@ -1129,6 +1162,11 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         s->compare_timeout = DEFAULT_TIME_OUT_MS;
     }
 
+    if (!s->expired_scan_cycle) {
+        /* Set default value to 3000 MS */
+        s->expired_scan_cycle = REGULAR_PACKET_CHECK_MS;
+    }
+
     if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
         !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
         return;
@@ -1228,6 +1266,10 @@ static void colo_compare_init(Object *obj)
                         compare_get_timeout,
                         compare_set_timeout, NULL, NULL, NULL);
 
+    object_property_add(obj, "expired_scan_cycle", "uint32",
+                        compare_get_expired_scan_cycle,
+                        compare_set_expired_scan_cycle, NULL, NULL, NULL);
+
     s->vnet_hdr = false;
     object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
                              compare_set_vnet_hdr, NULL);
diff --git a/qemu-options.hx b/qemu-options.hx
index 3832d0ae8a..8069428c73 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4598,7 +4598,7 @@ Dump the network traffic on netdev @var{dev} to the file specified by
 The file format is libpcap, so it can be analyzed with tools such as tcpdump
 or Wireshark.
 
-@item -object colo-compare,id=@var{id},primary_in=@var{chardevid},secondary_in=@var{chardevid},outdev=@var{chardevid},iothread=@var{id}[,vnet_hdr_support][,notify_dev=@var{id}][,compare_timeout=@var{ms}]
+@item -object colo-compare,id=@var{id},primary_in=@var{chardevid},secondary_in=@var{chardevid},outdev=@var{chardevid},iothread=@var{id}[,vnet_hdr_support][,notify_dev=@var{id}][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}]
 
 Colo-compare gets packet from primary_in@var{chardevid} and secondary_in@var{chardevid}, than compare primary packet with
 secondary packet. If the packets are same, we will output primary
@@ -4608,6 +4608,7 @@ In order to improve efficiency, we need to put the task of comparison
 in another thread. If it has the vnet_hdr_support flag, colo compare
 will send/recv packet with vnet_hdr_len. The compare_timeout=@var{ms}
 determines the maximum time colo-compare wait for primary packet.
+The expired_scan_cycle=@var{ms} to set the expired packet scan cycle.
 If you want to use Xen COLO, will need the notify_dev to notify Xen
 colo-frame to do checkpoint.
 
-- 
2.17.1


