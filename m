Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76AF65F109
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:22:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT0N-00039F-13; Thu, 05 Jan 2023 11:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pdel@pdel-mbp.localdomain>)
 id 1pDT0G-00034i-3c
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:22:04 -0500
Received: from [163.114.132.7] (helo=pdel-mbp.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdel@pdel-mbp.localdomain>) id 1pDT0E-0004hC-I7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:22:03 -0500
Received: by pdel-mbp.localdomain (Postfix, from userid 501)
 id 2639AC3BBC1; Thu,  5 Jan 2023 01:13:49 -0800 (PST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: samuel.thibault@ens-lyon.org, jasowang@redhat.com, eblake@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH 1/1] net/slirp: Add mfr-id and oob-eth-addr parameters
Date: Thu,  5 Jan 2023 01:13:45 -0800
Message-Id: <20230105091345.49757-2-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105091345.49757-1-peter@pjd.dev>
References: <20230105091345.49757-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 163.114.132.7 (failed)
Received-SPF: none client-ip=163.114.132.7;
 envelope-from=pdel@pdel-mbp.localdomain; helo=pdel-mbp.localdomain
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This adds mfr-id and oob-eth-addr parameters to the userspace netdev backend.

    -netdev user,id=[str],mfr-id=[uint32],oob-eth-addr=[MAC address]

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 net/slirp.c   | 19 ++++++++++++++++---
 qapi/net.json |  9 ++++++++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 2ee3f1a0d7..97c83d99f7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -413,7 +413,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
                           const char *vnameserver, const char *vnameserver6,
                           const char *smb_export, const char *vsmbserver,
                           const char **dnssearch, const char *vdomainname,
-                          const char *tftp_server_name,
+                          const char *tftp_server_name, uint32_t mfr_id,
+                          const char *oob_eth_addr_str,
                           Error **errp)
 {
     /* default settings according to historic slirp */
@@ -436,6 +437,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     int shift;
     char *end;
     struct slirp_config_str *config;
+    MACAddr oob_eth_addr = {};
 
     if (!ipv4 && (vnetwork || vhost || vnameserver)) {
         error_setg(errp, "IPv4 disabled but netmask/host/dns provided");
@@ -609,6 +611,12 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
 
+    if (oob_eth_addr_str &&
+        net_parse_macaddr(oob_eth_addr.a, oob_eth_addr_str) < 0) {
+        error_setg(errp, "'oob-eth-addr' invalid syntax for MAC address");
+        return -1;
+    }
+
     nc = qemu_new_net_client(&net_slirp_info, peer, model, name);
 
     qemu_set_info_str(nc, "net=%s,restrict=%s", inet_ntoa(net),
@@ -616,7 +624,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(SlirpState, nc, nc);
 
-    cfg.version = SLIRP_CHECK_VERSION(4,7,0) ? 4 : 1;
+    cfg.version = SLIRP_CONFIG_VERSION_MAX;
     cfg.restricted = restricted;
     cfg.in_enabled = ipv4;
     cfg.vnetwork = net;
@@ -635,6 +643,10 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     cfg.vnameserver6 = ip6_dns;
     cfg.vdnssearch = dnssearch;
     cfg.vdomainname = vdomainname;
+#if SLIRP_CONFIG_VERSION_MAX >= 5
+    cfg.mfr_id = mfr_id;
+    memcpy(cfg.oob_eth_addr, oob_eth_addr.a, sizeof(cfg.oob_eth_addr));
+#endif
     s->slirp = slirp_new(&cfg, &slirp_cb, s);
     QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
 
@@ -1171,7 +1183,8 @@ int net_init_slirp(const Netdev *netdev, const char *name,
                          user->bootfile, user->dhcpstart,
                          user->dns, user->ipv6_dns, user->smb,
                          user->smbserver, dnssearch, user->domainname,
-                         user->tftp_server_name, errp);
+                         user->tftp_server_name, user->mfr_id,
+                         user->oob_eth_addr, errp);
 
     while (slirp_configs) {
         config = slirp_configs;
diff --git a/qapi/net.json b/qapi/net.json
index 522ac582ed..7aa1ea0496 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -168,6 +168,11 @@
 #
 # @tftp-server-name: RFC2132 "TFTP server name" string (Since 3.1)
 #
+# @mfr-id: Manufacturer ID (IANA Private Enterprise Number)
+#
+# @oob-eth-addr: MAC Address allocated for an out-of-band management
+#                controller, to be retrieved through NC-SI.
+#
 # Since: 1.2
 ##
 { 'struct': 'NetdevUserOptions',
@@ -193,7 +198,9 @@
     '*smbserver': 'str',
     '*hostfwd':   ['String'],
     '*guestfwd':  ['String'],
-    '*tftp-server-name': 'str' } }
+    '*tftp-server-name': 'str',
+    '*mfr-id':    'uint32',
+    '*oob-eth-addr': 'str' } }
 
 ##
 # @NetdevTapOptions:
-- 
2.31.1


