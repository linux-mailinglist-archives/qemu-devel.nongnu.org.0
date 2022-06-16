Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2054D6CC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:13:05 +0200 (CEST)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1e4G-0003GT-TF
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dxC-0005l1-2C
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:46 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:30134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7166425211=pdel@fb.com>)
 id 1o1dxA-0006DO-6G
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:05:45 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FLptYS020294
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=kMA2m3pCu+76vVAwTXXezag0fOdyLjIOWKRvxPwCYLc=;
 b=RcoP1I/RU4gr6TM/iQC8Of9QmjLXJiu3DgMuYU2UErYjwnQPdmkP27AI1qpRyXnXDwq+
 Hb1H721DFA2A7r8+0TjNutCeruKKIvzTol/17OuiCyuY9k9klK4iyDid0wk7JYMbr+1z
 +KvYnxgcv+2Ey5FWl7tSpPMhP/xGHq/WeXQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gp8awp8ky-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:05:43 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Jun 2022 18:05:40 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 0FA588092C60; Wed, 15 Jun 2022 18:05:28 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <samuel.thibault@ens-lyon.org>, <jasowang@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 3/4] slirp: Add mfr-id to -netdev options
Date: Wed, 15 Jun 2022 18:05:25 -0700
Message-ID: <20220616010526.1895564-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616010526.1895564-1-pdel@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: BYJwH5eaycw5D0AvNQBOJ3ZNxfYDdJKW
X-Proofpoint-ORIG-GUID: BYJwH5eaycw5D0AvNQBOJ3ZNxfYDdJKW
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_17,2022-06-15_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7166425211=pdel@fb.com; helo=mx0b-00082601.pphosted.com
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

This lets you set the manufacturer's ID for a slirp netdev, which can be
queried from the guest through the Get Version ID NC-SI command. For
example, by setting the manufacturer's ID to 0x8119:

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e229=
4ff5d31d/fby35.mtd
    qemu-system-arm -machine fby35-bmc \
        -drive file=3Dfby35.mtd,format=3Draw,if=3Dmtd -nographic \
        -netdev user,id=3Dnic,mfr-id=3D0x8119,hostfwd=3D::2222-:22 \
        -net nic,model=3Dftgmac100,netdev=3Dnic
    ...
    username: root
    password: 0penBmc
    ...
    root@bmc-oob:~# ncsi-util 0x15
    NC-SI Command Response:
    cmd: GET_VERSION_ID(0x15)
    Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
    Payload length =3D 40

    20: 0xf1 0xf0 0xf0 0x00
    24: 0x00 0x00 0x00 0x00
    28: 0x00 0x00 0x00 0x00
    32: 0x00 0x00 0x00 0x00
    36: 0x00 0x00 0x00 0x00
    40: 0x00 0x00 0x00 0x00
    44: 0x00 0x00 0x00 0x00
    48: 0x00 0x00 0x00 0x00
    52: 0x00 0x00 0x81 0x19

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 net/slirp.c   | 5 +++--
 qapi/net.json | 5 ++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index 75e5ccafd9..231068c1e2 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -413,7 +413,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,
                           const char *vnameserver, const char *vnameserver=
6,
                           const char *smb_export, const char *vsmbserver,
                           const char **dnssearch, const char *vdomainname,
-                          const char *tftp_server_name,
+                          const char *tftp_server_name, uint32_t mfr_id,
                           Error **errp)
 {
     /* default settings according to historic slirp */
@@ -636,6 +636,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,
     cfg.vnameserver6 =3D ip6_dns;
     cfg.vdnssearch =3D dnssearch;
     cfg.vdomainname =3D vdomainname;
+    cfg.mfr_id =3D mfr_id;
     s->slirp =3D slirp_new(&cfg, &slirp_cb, s);
     QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
=20
@@ -1172,7 +1173,7 @@ int net_init_slirp(const Netdev *netdev, const char *=
name,
                          user->bootfile, user->dhcpstart,
                          user->dns, user->ipv6_dns, user->smb,
                          user->smbserver, dnssearch, user->domainname,
-                         user->tftp_server_name, errp);
+                         user->tftp_server_name, user->mfr_id, errp);
=20
     while (slirp_configs) {
         config =3D slirp_configs;
diff --git a/qapi/net.json b/qapi/net.json
index d6f7cfd4d6..efc5cb3fb6 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -167,6 +167,8 @@
 #
 # @tftp-server-name: RFC2132 "TFTP server name" string (Since 3.1)
 #
+# @mfr-id: Manufacturer ID (Private Enterprise Number: IANA)
+#
 # Since: 1.2
 ##
 { 'struct': 'NetdevUserOptions',
@@ -192,7 +194,8 @@
     '*smbserver': 'str',
     '*hostfwd':   ['String'],
     '*guestfwd':  ['String'],
-    '*tftp-server-name': 'str' } }
+    '*tftp-server-name': 'str',
+    '*mfr-id': 'uint32' } }
=20
 ##
 # @NetdevTapOptions:
--=20
2.30.2


