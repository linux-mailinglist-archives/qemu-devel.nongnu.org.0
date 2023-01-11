Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE8665417
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 06:58:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFU73-0004p2-Ab; Wed, 11 Jan 2023 00:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU71-0004o5-Rs
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:23 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pFU70-0005Bd-9e
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 00:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673416642; x=1704952642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhNTF3QDCDcr1faDyACdENyYpr5UW+kl+qZ031o1tSg=;
 b=KUWgMpBmo9qdr8pV2oU5tDqhQvROa2waxpQh5O89mFK+3Dy6korKW75X
 ardXcBI2WOKGvZFZzE+xNF2Ph3BLItz0HZzmnmvAKXJdIV4icHwzXHChP
 yVFLHvn98sGAfjNDNYzIf0H4qBtD5IEBJGBLGriixDUT8KJilgMyECNV3
 oUH8f78LpTMfG6BBk2jiaB+xipwUx11oQt82qjhhdYFJfbGQV1MqXTHRz
 NhA7CggTS7AI4w6aa+upbTH7OpWl2jDK1pF8spviCSqYFB2bQ7dfy8kKL
 305R++XkV9cBVbmoMc6JGenzw3lugUCbB7LRhoPEZdfz+yw8LOUPLtEkq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="311147388"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="311147388"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650621153"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="650621153"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 21:57:07 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v1 1/2] spice: Add an option for users to provide a preferred
 codec
Date: Tue, 10 Jan 2023 21:37:06 -0800
Message-Id: <20230111053707.781484-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230111053707.781484-1-vivek.kasireddy@intel.com>
References: <20230111053707.781484-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=vivek.kasireddy@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Giving users an option to choose a particular codec will enable
them to make an appropriate decision based on their hardware and
use-case.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 qemu-options.hx |  5 +++++
 ui/spice-core.c | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3aa3a2f5a3..aab8df0922 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2142,6 +2142,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,streaming-video=[off|all|filter]][,disable-copy-paste=on|off]\n"
     "       [,disable-agent-file-xfer=on|off][,agent-mouse=[on|off]]\n"
     "       [,playback-compression=[on|off]][,seamless-migration=[on|off]]\n"
+    "       [,preferred-codec=<encoder>:<codec>\n"
     "       [,gl=[on|off]][,rendernode=<file>]\n"
     "   enable spice\n"
     "   at least one of {port, tls-port} is mandatory\n",
@@ -2237,6 +2238,10 @@ SRST
     ``seamless-migration=[on|off]``
         Enable/disable spice seamless migration. Default is off.
 
+    ``preferred-codec=<encoder>:<codec>``
+        Provide the preferred codec the Spice server should use.
+        Default would be spice:mjpeg.
+
     ``gl=[on|off]``
         Enable/disable OpenGL context. Default is off.
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 72f8f1681c..6e00211e3a 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -469,6 +469,9 @@ static QemuOptsList qemu_spice_opts = {
         },{
             .name = "streaming-video",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "preferred-codec",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "agent-mouse",
             .type = QEMU_OPT_BOOL,
@@ -644,6 +647,7 @@ static void qemu_spice_init(void)
     char *x509_key_file = NULL,
         *x509_cert_file = NULL,
         *x509_cacert_file = NULL;
+    const char *preferred_codec = NULL;
     int port, tls_port, addr_flags;
     spice_image_compression_t compression;
     spice_wan_compression_t wan_compr;
@@ -795,6 +799,16 @@ static void qemu_spice_init(void)
         spice_server_set_streaming_video(spice_server, SPICE_STREAM_VIDEO_OFF);
     }
 
+    preferred_codec = qemu_opt_get(opts, "preferred-codec");
+    if (preferred_codec) {
+        if (spice_server_set_video_codecs(spice_server, preferred_codec)) {
+            error_report("Preferred codec name is not valid");
+            exit(1);
+        }
+    } else {
+        spice_server_set_video_codecs(spice_server, "spice:mjpeg");
+    }
+
     spice_server_set_agent_mouse
         (spice_server, qemu_opt_get_bool(opts, "agent-mouse", 1));
     spice_server_set_playback_compression
-- 
2.37.2


