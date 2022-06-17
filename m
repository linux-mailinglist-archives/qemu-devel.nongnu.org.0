Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF054F284
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 10:08:50 +0200 (CEST)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2728-0002Pb-Rb
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 04:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lU-0005at-3s
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:36 -0400
Received: from mga06b.intel.com ([134.134.136.31]:28798 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o26lN-000779-QT
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 03:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655452289; x=1686988289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o9+NNdSQwQKKLbfESMJlGiAkUXXjAOfy7EXgOwiurck=;
 b=kNOQXtyPIE5XzXB3lCZONneNiMWjpeh00AaNhJmxqBN2WmOs04OOlZ1K
 gU9jFjqjirOFyYe5BFO1fr7KyI6+C5ZCQopN+2boTP+qcAxO0M7bdDRRr
 718JSfNBmO5oflKeEgR16ellBmjg4+6UJSO9QgM9Dyadz6ZuHM85wcGiX
 FtcnZ9osnrfx1sQugUL7j8AL5zzYTIoJjYaNu8r05ETJYhkxPqEanW2VT
 my1sqdW6ck/V/nEly9HDVVNU77GU3zQSI89mxmtwt+e3Xkrjav/wO41qC
 50OZIN44lXUGmLKUzKn0wY+f92WRGr7FncZS4LavZ4aAwvSwegDK9lE2u g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341102165"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="341102165"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="641936759"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 00:51:25 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: [RFC PATCH 08/12] qapi: Add FilterUbpfProperties and qemu-options
Date: Fri, 17 Jun 2022 15:36:26 +0800
Message-Id: <20220617073630.535914-9-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617073630.535914-1-chen.zhang@intel.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add filter-ubpf related QOM and qemu-options.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 qapi/qom.json   | 18 ++++++++++++++++++
 qemu-options.hx |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 6a653c6636..820a5218e8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -444,6 +444,22 @@
   'base': 'NetfilterProperties',
   'data': { '*vnet_hdr_support': 'bool' } }
 
+##
+# @FilterUbpfProperties:
+#
+# Properties for filter-ubpf objects.
+#
+# @ip-mode: if true, IP packet handle mode is enabled(default: true).
+#
+# @ubpf-handler: The filename where the userspace ebpf packets handler.
+#
+# Since: 7.1
+##
+{ 'struct': 'FilterUbpfProperties',
+  'base': 'NetfilterProperties',
+  'data': { '*ip-mode': 'bool',
+            '*ubpf-handler': 'str' } }
+
 ##
 # @InputBarrierProperties:
 #
@@ -845,6 +861,7 @@
     'filter-redirector',
     'filter-replay',
     'filter-rewriter',
+    'filter-ubpf',
     'input-barrier',
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
@@ -911,6 +928,7 @@
       'filter-redirector':          'FilterRedirectorProperties',
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
+      'filter-ubpf':                'FilterUbpfProperties',
       'input-barrier':              'InputBarrierProperties',
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },
diff --git a/qemu-options.hx b/qemu-options.hx
index 60cf188da4..3dfb858867 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5080,6 +5080,12 @@ SRST
         stored. The file format is libpcap, so it can be analyzed with
         tools such as tcpdump or Wireshark.
 
+    ``-object filter-ubpf,id=id,netdev=dev,ubpf-handler=filename[,ip-mode][,position=head|tail|id=<id>][,insert=behind|before]``
+        filter-ubpf is the userspace ebpf network traffic handler on netdev dev
+        from the userspace ebpf handler file specified by filename.
+        If disable ip_mode, the loaded ebpf program will handle raw
+        network packet.
+
     ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
         Colo-compare gets packet from primary\_in chardevid and
         secondary\_in, then compare whether the payload of primary packet
-- 
2.25.1


