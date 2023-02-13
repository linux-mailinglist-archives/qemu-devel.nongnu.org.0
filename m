Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C596941FB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQk-0003pm-IL; Mon, 13 Feb 2023 04:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQf-0003iW-CN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:21 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQa-0002n2-Nk
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281636; x=1707817636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNTP7tofs2TK91IKiUrDYmJLPEIRl+0PcGF1dFFrCtU=;
 b=CN2Yp6YH9rB0uvdNM60lLXNWzIRg1hW8fGXb+uCJ0eDxkuPinQzdEqfP
 95mpn2pkiu91DZSPzkzIlYzB7IJYbq5eDN3AR0NTrw7/j2wJQmCNoXGDP
 wfBkIojRutE4RYasUWUCB6/oTc/Nb++spVR+GGXX5LUeQGDgRxdhpBTYg
 MJQo06dmcev1VOaSozIe9nukh1X/VTEL2hQ0CGdjVrEDHv10dim4SqW7o
 HUJBUBJpOj/mUCJEppSdBWhdx8zN/dvbt79ptrqIQMWZwnDRe8rYu/pSo
 f0KpJFwXQIvtms6ugAMYJxsEtp57c84RftYfHvtb9k/+rj50sY0WvgsLx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487306"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760697"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760697"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:15 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 50/52] qemu-options: Add the document of hybrid command
Date: Mon, 13 Feb 2023 17:50:33 +0800
Message-Id: <20230213095035.158240-51-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

Added the detailed introduction to the four hybrid options with specific
examples.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 qemu-options.hx | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8987972a8d5f..2bc7a5ed51ed 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5611,7 +5611,84 @@ DEF("hybrid", HAS_ARG, QEMU_OPTION_hybrid,
     "-hybrid cluster,clusters=n"
     "-hybrid core,cores=n,coretype=core_type[,threads=threads][,clusterid=cluster]",
     QEMU_ARCH_ALL)
+SRST
+``-hybrid socket,sockets=n``
+  \
+``-hybrid die,dies=n``
+  \
+``-hybrid cluster,clusters=n``
+  \
+``-hybrid core,cores=n,coretype=core_type[,threads=threads][,clusterid=cluster]``
+    Define a hybrid cpu topology. Currently, only i386 PC machine supports this command.
+
+    There're 4 levels need to be configured: socket, die, cluster and core. And the
+    thread level is included in core level configuration.
+
+    Hybrid and smp cannot be set at the same time.
+
+    As for now, hybrid cpu topology only supports differences between the core and cluster
+    levels (please note the differences between clusters is caused by containing different
+    cores), and it assumes threads, dies and sockets are the same.
+
+    These four level options must be written in the order of "socket, die, cluster, core".
+
+    For example, the following options assigns 12 VCPUs which contains 8 Intel Atom cores
+    and 2 Intel Core cores.
+
+    ::
+
+        -hybrid socket,sockets=1    \
+        -hybrid die,dies=1          \
+        -hybrid cluster,clusters=4  \
+        -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-1    \
+        -hybrid core,cores=4,coretype="atom",threads=1,clusterid=2-3
+
+    '\ ``socket``\ ' option is used to configure how many sockets in the machine. Here
+    '\ ``sockets``\ ' means the number of sockets in the machine. If this option is not
+    set, the default is only 1 socket.
+
+    For example:
+
+    ::
+
+        -hybrid socket,sockets=1
 
+    '\ ``die``\ ' option is used to configure how many dies in one socket. Here
+    '\ ``dies``\ ' means the number of dies in one socket. If this option is not
+    set, the default is only 1 die per socket.
+
+    For example:
+
+    ::
+
+        -hybrid die,dies=1
+
+    '\ ``cluster``\ ' option is used to configure how many clusters in one die. Here
+    '\ ``clusters``\ ' means the number of clusters in one die. If this option is not
+    set, the default is only 1 cluster per die.
+
+    For example:
+
+    ::
+
+        -hybrid cluster,clusters=1
+
+    '\ ``core``\ ' option is used to configure hybrid core topology. Here '\ ``cores``\ '
+    means the number of current type cores in one cluster. '\ ``coretype``\ ' means the
+    type of the current core. '\ ``threads``\ ' means how many threads in one current type
+    core (the default is 1 thread per current core). And '\ ``clusterid``\ ' means the cluster
+    index list that the current type core belongs to (the default is all clusters have current
+    type cores). This option cannot be omitted.
+
+    For i386 PC machine, the supported '\ ``coretype``\ ' are "atom" and "core".
+
+    For example (clusters=4):
+
+    ::
+
+        -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-1,clusterid=3    \
+        -hybrid core,cores=4,coretype="atom",threads=1,clusterid=2
+ERST
 
 HXCOMM This is the last statement. Insert new options before this line!
 
-- 
2.34.1


