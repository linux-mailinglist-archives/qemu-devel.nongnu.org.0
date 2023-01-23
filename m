Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AF36776DE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJseA-00053Q-3I; Mon, 23 Jan 2023 03:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJse4-000531-8e
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:40 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1pJse2-0002Sq-J8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674464258; x=1706000258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhNTF3QDCDcr1faDyACdENyYpr5UW+kl+qZ031o1tSg=;
 b=ewpjRc/AjYXf/f8oAfw6+wfj8Tax6TLuACDvU189wuhNem6U3z+QREDw
 TCeYDN0CFFAnGfUMltYSr3G8op3hb/qJfKIz5XrPZB+FuYfdvt2v3Xm3z
 HDyZpfraCd32TtZy7REBWJemyLPnSOFmbw/dFU/1dXGgKOolVMIaBSe7P
 64NYJZS0O4LghQ8J86G5xf9nEvmN/Xx/3leITr11+VOsKlUGbejp+x09Z
 /qyH2r5pi1svzCLaDCZnJc3tFs5DgL4AnaRLHOVu4u/271WoJWW+G98+q
 aE+is0NFeDdTTar6fROsg5AoDe3FoAv5C7hht3pennJiIsx11KvPBEEnb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412227799"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="412227799"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="639057575"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="639057575"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 00:57:28 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC v2 1/2] spice: Add an option for users to provide a preferred
 codec
Date: Mon, 23 Jan 2023 00:37:54 -0800
Message-Id: <20230123083755.1038286-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


