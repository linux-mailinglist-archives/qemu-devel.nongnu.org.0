Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8C48BF69
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:02:38 +0100 (CET)
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Yab-0004wj-GG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:02:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7YYN-00049m-6c
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:00:19 -0500
Received: from mga14.intel.com ([192.55.52.115]:32554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n7YYK-0006Bn-8B
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641974416; x=1673510416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G0ZWTxgAzw1cuqTxb7y2KPMP61JSPM4rd1leP4HfOiM=;
 b=dtY7bsUD1vOwex78N5zCa8GcikT3kabWc8EoA/PHHhhh2hOSmQeoUYAz
 GDc7lHpitzq9YdzB1fyT2OrfBpTUwdcYY1GQdh7m/pvsOCidGt34tlcU/
 HtHKqBLryJgCS1RAoqO+/ruCRb/Ojinp/jyWhHvqvPwVH7q1NfEM8mkYm
 exWFJlqBxx7uDp01j4M+QBa5Bd78bALp6uR7FK2PCGijppSLEpEbNdJYP
 a+IJvxtu/IlggqqClyzUbzr2H+U+jivpnAGkEnp0qYKPyjcMfwiibb7Kv
 tiSyp6ckAOv+RiR+8o3mSC5XDm+DNBBvOx11n9Vbmmsz83x9OB3UMNExm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243883174"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="243883174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 00:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="558635299"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga001.jf.intel.com with ESMTP; 12 Jan 2022 00:00:10 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: pbonzini@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net
Subject: [PATCH] sgx: Move sgx object from /machine/unattached to /machine
Date: Wed, 12 Jan 2022 11:55:17 -0500
Message-Id: <20220112165517.4140482-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 DKIMWL_WL_HIGH=-0.595, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Libvirt start, it get the vcpu's unavailable-features from
/machine/unattached/device[0] path by qom-get command, but in SGX
guest, since the sgx-epc virtual device is initialized before VCPU
creation(virtual sgx need set the virtual EPC info in the cpuid). This
/machine/unattached/device[0] is occupied by sgx-epc device, which
fail to get the unvailable-features from /machine/unattached/device[0].

This patch make one new /machine/sgx object to avoid this issue.
(qemu) qom-list /machine/unattached/
device[0] (child<host-x86_64-cpu>)

(qemu) qom-list /machine/sgx
device[0] (child<sgx-epc>)

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/core/qdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..4154eef0d8 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     NamedClockList *ncl;
     Error *local_err = NULL;
     bool unattached_parent = false;
-    static int unattached_count;
+    static int unattached_count, sgx_count;
 
     if (dev->hotplugged && !dc->hotpluggable) {
         error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
@@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
             goto fail;
         }
 
-        if (!obj->parent) {
+        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
+            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
+
+            object_property_add_child(container_get(qdev_get_machine(),
+                                                    "/sgx"),
+                                      name, obj);
+            unattached_parent = true;
+            g_free(name);
+        } else if (!obj->parent) {
             gchar *name = g_strdup_printf("device[%d]", unattached_count++);
 
             object_property_add_child(container_get(qdev_get_machine(),

