Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEA510963
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:00:11 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRM2-0002Lc-Jn
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIC-0004d5-LW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
Received: from smtp117.iad3a.emailsrvr.com ([173.203.187.117]:36910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIB-0004eG-3Z
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp31.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 8AF92248F7; 
 Tue, 26 Apr 2022 15:55:45 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] qga/commands-posix: Log all net stats failures
Date: Tue, 26 Apr 2022 14:55:25 -0500
Message-Id: <20220426195526.7699-5-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220426195526.7699-1-adeason@sinenomine.net>
References: <20220426195526.7699-1-adeason@sinenomine.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Classification-ID: cc5ef99f-0605-4056-825c-a202bb8c6ff8-5-1
Received-SPF: pass client-ip=173.203.187.117;
 envelope-from=adeason@sinenomine.net; helo=smtp117.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Andrew Deason <adeason@sinenomine.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

guest_get_network_stats can silently fail in a couple of ways. Add
debug messages to these cases, so we're never completely silent on
failure.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
Changes since v1:
- new in v2

 qga/commands-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index b91fdba2c1..cc565e0dfd 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2764,20 +2764,22 @@ static int guest_get_network_stats(const char *name,
                        GuestNetworkInterfaceStat *stats)
 {
 #ifdef CONFIG_LINUX
     int name_len;
     char const *devinfo = "/proc/net/dev";
     FILE *fp;
     char *line = NULL, *colon;
     size_t n = 0;
     fp = fopen(devinfo, "r");
     if (!fp) {
+        g_debug("failed to open network stats %s: %s", devinfo,
+                g_strerror(errno));
         return -1;
     }
     name_len = strlen(name);
     while (getline(&line, &n, fp) != -1) {
         long long dummy;
         long long rx_bytes;
         long long rx_packets;
         long long rx_errs;
         long long rx_dropped;
         long long tx_bytes;
@@ -2812,21 +2814,23 @@ static int guest_get_network_stats(const char *name,
             stats->tx_errs = tx_errs;
             stats->tx_dropped = tx_dropped;
             fclose(fp);
             g_free(line);
             return 0;
         }
     }
     fclose(fp);
     g_free(line);
     g_debug("/proc/net/dev: Interface '%s' not found", name);
-#endif /* CONFIG_LINUX */
+#else /* !CONFIG_LINUX */
+    g_debug("Network stats reporting available only for Linux");
+#endif /* !CONFIG_LINUX */
     return -1;
 }
 
 /*
  * Build information about guest interfaces
  */
 GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
     GuestNetworkInterfaceList *head = NULL, **tail = &head;
     struct ifaddrs *ifap, *ifa;
-- 
2.11.0


