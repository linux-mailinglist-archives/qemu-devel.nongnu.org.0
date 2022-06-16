Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476D54D6CB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:12:58 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1e49-0003B6-HA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dxA-0005gY-7u
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:44 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:42124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dx8-0006Ax-6g
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:43 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FLpm0C016703
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=fQuZO+deAy8H8ePCJOQ5ayuz8vSU8mN54OiO4QQFUrI=;
 b=Ez99gHf9Pcg0kjF7vCDfo8egyQG4mt3Ln9QJ3BikzrYuK+IkcCi2PZ/Yjk0Q7pDttpC4
 Pe+rruOL1UzfC6k+IvJGOScRPVGGSM+3UB2YNkW8GpfSKrW4l92Y2v6dfuHLNuZrMYEf
 jjCsNvSH4PEI3oSvDzXz0UvkAn8ZXaT5uu8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gqd2bjccj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:40 -0700
Received: from twshared16308.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Jun 2022 18:05:38 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 182308092C62; Wed, 15 Jun 2022 18:05:28 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <samuel.thibault@ens-lyon.org>, <jasowang@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 4/4] slirp: Add oob-eth-addr to -netdev options
Date: Wed, 15 Jun 2022 18:05:26 -0700
Message-ID: <20220616010526.1895564-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616010526.1895564-1-pdel@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: aALStbiWUMWjNO19CJeXUQ6aQFkxw-gA
X-Proofpoint-ORIG-GUID: aALStbiWUMWjNO19CJeXUQ6aQFkxw-gA
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_17,2022-06-15_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7166425211=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

With this change, you can now request the out-of-band MAC address from
slirp in fby35-bmc:

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e229=
4ff5d31d/fby35.mtd
    qemu-system-arm -machine fby35-bmc \
        -drive file=3Dfby35.mtd,format=3Draw,if=3Dmtd \
        -nographic \
        -netdev user,id=3Dnic,mfr-id=3D0x8119,oob-eth-addr=3Dde:ad:be:ef:ca=
:fe,hostfwd=3D::2222-:22 \
        -net nic,model=3Dftgmac100,netdev=3Dnic

    ...
    username: root
    password: 0penBmc
    ...

    root@bmc-oob:~# ncsi-util -n eth0 -c 0 0x50 0 0 0x81 0x19 0 0 0x1b 0
    NC-SI Command Response:
    cmd: NCSI_OEM_CMD(0x50)
    Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
    Payload length =3D 24

    20: 0x00 0x00 0x81 0x19
    24: 0x01 0x00 0x1b 0x00
    28: 0x00 0x00 0x00 0x00
    32: 0xde 0xad 0xbe 0xef
    36: 0xca 0xfe 0x00 0x00

    root@bmc-oob:~# ifconfig
    eth0      Link encap:Ethernet  HWaddr DE:AD:BE:EF:CA:FE
	      inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
	      inet6 addr: fec0::dcad:beff:feef:cafe/64 Scope:Site
	      inet6 addr: fe80::dcad:beff:feef:cafe/64 Scope:Link
	      UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
	      RX packets:253 errors:0 dropped:0 overruns:0 frame:0
	      TX packets:271 errors:0 dropped:0 overruns:0 carrier:0
	      collisions:0 txqueuelen:1000
	      RX bytes:24638 (24.0 KiB)  TX bytes:18876 (18.4 KiB)
	      Interrupt:32

    lo        Link encap:Local Loopback
	      inet addr:127.0.0.1  Mask:255.0.0.0
	      inet6 addr: ::1/128 Scope:Host
	      UP LOOPBACK RUNNING  MTU:65536  Metric:1
	      RX packets:2 errors:0 dropped:0 overruns:0 frame:0
	      TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
	      collisions:0 txqueuelen:1000
	      RX bytes:120 (120.0 B)  TX bytes:120 (120.0 B)

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 net/slirp.c   | 13 +++++++++++--
 qapi/net.json |  5 ++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 231068c1e2..858d3da859 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -414,7 +414,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,
                           const char *smb_export, const char *vsmbserver,
                           const char **dnssearch, const char *vdomainname,
                           const char *tftp_server_name, uint32_t mfr_id,
-                          Error **errp)
+                          uint8_t oob_eth_addr[ETH_ALEN], Error **errp)
 {
     /* default settings according to historic slirp */
     struct in_addr net  =3D { .s_addr =3D htonl(0x0a000200) }; /* 10.0.2.0=
 */
@@ -637,6 +637,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,
     cfg.vdnssearch =3D dnssearch;
     cfg.vdomainname =3D vdomainname;
     cfg.mfr_id =3D mfr_id;
+    memcpy(cfg.oob_eth_addr, oob_eth_addr, ETH_ALEN);
     s->slirp =3D slirp_new(&cfg, &slirp_cb, s);
     QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
=20
@@ -1142,6 +1143,7 @@ int net_init_slirp(const Netdev *netdev, const char *=
name,
     const NetdevUserOptions *user;
     const char **dnssearch;
     bool ipv4 =3D true, ipv6 =3D true;
+    MACAddr oob_eth_addr =3D {};
=20
     assert(netdev->type =3D=3D NET_CLIENT_DRIVER_USER);
     user =3D &netdev->u.user;
@@ -1166,6 +1168,12 @@ int net_init_slirp(const Netdev *netdev, const char =
*name,
     net_init_slirp_configs(user->hostfwd, SLIRP_CFG_HOSTFWD);
     net_init_slirp_configs(user->guestfwd, 0);
=20
+    if (user->has_oob_eth_addr &&
+        net_parse_macaddr(oob_eth_addr.a, user->oob_eth_addr) < 0) {
+        error_setg(errp, "invalid syntax for OOB ethernet address");
+        return -1;
+    }
+
     ret =3D net_slirp_init(peer, "user", name, user->q_restrict,
                          ipv4, vnet, user->host,
                          ipv6, user->ipv6_prefix, user->ipv6_prefixlen,
@@ -1173,7 +1181,8 @@ int net_init_slirp(const Netdev *netdev, const char *=
name,
                          user->bootfile, user->dhcpstart,
                          user->dns, user->ipv6_dns, user->smb,
                          user->smbserver, dnssearch, user->domainname,
-                         user->tftp_server_name, user->mfr_id, errp);
+                         user->tftp_server_name, user->mfr_id, oob_eth_add=
r.a,
+                         errp);
=20
     while (slirp_configs) {
         config =3D slirp_configs;
diff --git a/qapi/net.json b/qapi/net.json
index efc5cb3fb6..7b2c3c205c 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -169,6 +169,8 @@
 #
 # @mfr-id: Manufacturer ID (Private Enterprise Number: IANA)
 #
+# @oob-eth-addr: Out-of-band ethernet address for BMC
+#
 # Since: 1.2
 ##
 { 'struct': 'NetdevUserOptions',
@@ -195,7 +197,8 @@
     '*hostfwd':   ['String'],
     '*guestfwd':  ['String'],
     '*tftp-server-name': 'str',
-    '*mfr-id': 'uint32' } }
+    '*mfr-id': 'uint32',
+    '*oob-eth-addr': 'str' } }
=20
 ##
 # @NetdevTapOptions:
--=20
2.30.2


