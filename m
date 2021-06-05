Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F839CA3A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 19:35:31 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpaCo-0005IA-7v
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 13:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1lpaC1-0004ZR-80
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:34:41 -0400
Received: from mail-co1nam11on2042.outbound.protection.outlook.com
 ([40.107.220.42]:11360 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1lpaBy-0007hF-SB
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLESsMzPEXL2OU41SGUdxa0YehqILKUPJQb7JuogZp+ooAwe15K98PQjHocDRClnaXCmKZZSRDrDBn/EruyrEtwkA2Z73dASl8IxQlidwCn35LxTeLBgX8TQK42tR1TfXwxpO3bjADjQH2pXW8VSYaR3hUVYuvmtPgbD1vEvFZGOPn82klhLh0KKIeKBMjGkjI5exRDsvEsUktKw5QoVYYC7hUCnfOMUgsMfNH9LznSZOk+erqG4f1y/Y9YuNH5HjrKjCctYxFPxPxZ8XYLhRfysdsbAEfPg8v9oWo/GNQrb1ItNxKbHe5W7538XVtuqgADBUyVxfwyKTgZuojCqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUY2EpUOJN00SNvE9pLEz+CLdXulmC3um+rtz7Q1bH4=;
 b=ESRU6ShetW9nFuxnJn9v6FQ8C/uFsng0Jbfticipa29oDMRxDObxcTsVAgfrO2ZqbPRwtwsN7j6RH+f5bSaT6Vv8J22fNI+8vcxdsuqfjF8fvnVxbVo6q+WCzWdGnYH/qPczgyZegzIiKOzYjZWiPfCIbQ0A4ycDkzRrXB10zy8XkGJLIJ9FbzG7GnDIkJlUH6vUSxUSAnl4Jo41hoMm5P28AyHhiApR26QntTAKHX/h2UfqADeys/tmho2jf0IDRcR6r1anYws9k1jm2zPJu0frYiBvse0GSXnUgz7K8IiNhqNMNaD4TOgxTYRrdoR691qbTTCM6eBqCwTEp6NejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUY2EpUOJN00SNvE9pLEz+CLdXulmC3um+rtz7Q1bH4=;
 b=Fk6+n5o5YZglzo3kDOQBro736hUkoWa38svEo27phXijPK2Lx7Wxdo2kjiuOTxF+xzqCtnUCZyvpIyXQ/51grgGcA3njn4Kqjl6ghK30Leaz82KNmgUJCsTPb7lkOVqOKU4fDyYWaBciYVdZMMr7+wHwIOaPRDulOdOImc5okko=
Received: from BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19)
 by BY5PR02MB6068.namprd02.prod.outlook.com (2603:10b6:a03:1fe::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Sat, 5 Jun
 2021 17:19:34 +0000
Received: from BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::2196:718c:a639:be1e]) by BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::2196:718c:a639:be1e%4]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 17:19:33 +0000
From: Gautam Dawar <gdawar@xilinx.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/2] vhost-vdpa: remove the unused
 vhost_vdpa_get_acked_features()
Thread-Topic: [PATCH 2/2] vhost-vdpa: remove the unused
 vhost_vdpa_get_acked_features()
Thread-Index: AQHXV1/P1cJhWdYjeEWNFro8/RD916sFrpTA
Date: Sat, 5 Jun 2021 17:19:33 +0000
Message-ID: <BY5PR02MB6980AA337402F4FBD3F14301B13A9@BY5PR02MB6980.namprd02.prod.outlook.com>
References: <20210602033127.40149-1-jasowang@redhat.com>
 <20210602033127.40149-2-jasowang@redhat.com>
In-Reply-To: <20210602033127.40149-2-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [122.176.224.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adf837f4-3e36-44a3-6a14-08d928461657
x-ms-traffictypediagnostic: BY5PR02MB6068:
x-microsoft-antispam-prvs: <BY5PR02MB60688A1F90E7B3DBE1FC9DDCB13A9@BY5PR02MB6068.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:316;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fQyt12qyMbB0mzJdDAqv19t9Z6opG7IxhrwFXF9InKvFeESAw6u2Do6VUZ2qr/+IIwdHbnlma3wnezyNeqZTVzPDdGgTPUoj6ysWaXPbxMz6ANj3Q9vTaXKB8qwf0/5OAvXAlLJIyLHPCxY4iaUxF+ZAnWoKokd165CuLDaF9CFx5ceDTk7X0802vBuYknjivYAG85LK1qx5QQgMsnuQXD9CtesK6R8/WCQAXm4KRjN3MqTMHmnx8Rklwd+hFfmHcfS2+mD2TMg5mrAzO/F845KQibsO2/VasT4iwSZ/whay8A1JveT/32fqfzz6wf4+aaa0SQI3XAV/hpaV2MyyFRlOtx6k4+7qsDoFx1jO+77WUxac6louCaUA3SWrHKR2ggil1t5bF2dr3dkc7garwMs6lwCL89RxANYBHIa7ylyGGIASn39brJbkKdAa1LMEUUMVnt+Gw5wuY69YoQcwsRC5+BhtKuB7Bf3HyTT4Q4HLtvZtBcTxaO/zHFdDfvhjWbvaKwbOCE33mbPUG6ZQUM3EbRpH9OMN6j2L7lHyzXXs9MfIUQ/2kYr+y6gLuRmaz+n8o7ELOLAfm7ahx6mveFUnSloA+HmlEbhEFjiBhcs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6980.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(38100700002)(5660300002)(122000001)(4326008)(7696005)(186003)(2906002)(52536014)(66446008)(316002)(64756008)(76116006)(66476007)(66946007)(8936002)(478600001)(66556008)(83380400001)(110136005)(71200400001)(26005)(55236004)(33656002)(86362001)(55016002)(6506007)(8676002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DDJ2GCAVdkXR0JbhlcDXiWh4rV5Ydaag3zffxok7lEkN+qPJNy/eK38l/J8M?=
 =?us-ascii?Q?qsieh38oe6UXWk/zXLB1k9TMZaYIXV8rIAFksd1eYmT3HDjNYvOd7UNaUiWb?=
 =?us-ascii?Q?jT5LRpOkUmhZ6vg+TklsocIJ7P75zhOoKvYbHiwtvO3Ty2QKa4ybeWFxa2im?=
 =?us-ascii?Q?7RsSRWz60W5Jn1LAEbwHvXy7FC+GcGrvIRGgUw4ab14lIOTGcQqNZ1dP7nAe?=
 =?us-ascii?Q?p0+WhMGg/gukFRqSJMond0v0TagN2H2CSBfWiZWy/ryoLIl7ZpyYds5FilWU?=
 =?us-ascii?Q?jfcswm83Gtrp2W2HvYU0b0ynqiTUKISjDy5jxK3wCd0wQ6x+rwLEvY9AAplz?=
 =?us-ascii?Q?kV/42ndHBpQN1XrmQmEW8TWxUQnGNc8yIYq0cUa3wgLJp4UD1z8MpnPM0RXy?=
 =?us-ascii?Q?AvjVAA3mUk5OroWrFtYyAZYyJROwh93as6pIlTkHdpdVWxAEJfoRGbia/27u?=
 =?us-ascii?Q?xe3zsiQ0RneGUqMAmBOgY7aJEwAhfZpI/iWGtEr02j6NMrKjPlv4biabazik?=
 =?us-ascii?Q?nq1G6stIULmlhSHh7D6c0gZM30FL07TYRVod8dBCYD9ab3EIIzn20kwFCGec?=
 =?us-ascii?Q?oXNewBgLQ892QFDey086UXcnit4dMU2QwszNEcG870HdB5tb/tPOuQ7Vrqbm?=
 =?us-ascii?Q?h+uulqFfVMltuENU7SZ1vqxb5WVhjdmg+OysrYoH/go9AQ2QBuCbPyTfvL8Z?=
 =?us-ascii?Q?fZoKvoianLQilygSmf0j5sb/7YCFJHeZP9P7ybb50xY7k76RsD5EBepmzjtV?=
 =?us-ascii?Q?j4dz4XSiwYA2At/1V5hGXqHHTljlmloQmRQr4rJX5D5jg0o9VxN/xsMGvk6o?=
 =?us-ascii?Q?sYSTRRPfjqycxbpKe/FCAK2cvmAhR+9OUwTo1R5YQRDkwJgBq3tn7hQtzdo6?=
 =?us-ascii?Q?zmQIuSTiZELLKyOpa45Ys5U0gZHK45A9vYvS3f5QsQ5UBL7/8W/kx2M8LuwF?=
 =?us-ascii?Q?T308I5593Y9nQQ6Bw5uRSE+GbPWz2yIrhUOXmF9OvXAkQY7ZWW62c3dYcIUf?=
 =?us-ascii?Q?KF9627yHuV2ALW0kDd1IS5BvF5l1U1sYONObIv4UEUmh/4VSQ237YRgrL8R5?=
 =?us-ascii?Q?G5b9EznmZLHHbKXwln+C6ac7ZuIIWya1loVvLV3hSNZlNsWdkvP4qpwSUsO/?=
 =?us-ascii?Q?jYAE+nHu087D503fxR3piqz7Va+Jp5UcrWeCawXhAPT1R5YXJKMuZVqQyPrA?=
 =?us-ascii?Q?9jlqkKnrvBG9h4GDRDiR8Kf3q8RbDOaeBFKiBLi1GPUeJUQbVTOyBjm+wIxC?=
 =?us-ascii?Q?xh9sF6BkKRO0g+eRRbdBlyJ3yybSCxOep7G6MXqeiEtvLnNzTWR7KNoTRX7w?=
 =?us-ascii?Q?inNwLvp+ZGoo2xLFNy1m7ghD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf837f4-3e36-44a3-6a14-08d928461657
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2021 17:19:33.5353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpECA1I6XcgVdya2klWmBbJer86IX0N2Clm3jC55l6N43uA9+B4JmNZrv5QBSTGqTUCyhPtwwlNOoWKY6u5h7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6068
Received-SPF: pass client-ip=40.107.220.42; envelope-from=gdawar@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "lulu@redhat.com" <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No user for this helper, let's remove it.

[GD>>]  These patches seem unrelated to me. Do you think they should be par=
t of one patch series?

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/vhost-vdpa.h | 1 -
 net/vhost-vdpa.c         | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h index 45e3=
4b7cfc..b81f9a6f2a 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -15,7 +15,6 @@
 #define TYPE_VHOST_VDPA "vhost-vdpa"
=20
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc); -uint64_t =
vhost_vdpa_get_acked_features(NetClientState *nc);
=20
 extern const int vdpa_feature_bits[];
=20
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c index fe659ec9e2..8dc86332=
a6 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -66,15 +66,6 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *=
nc)
     return s->vhost_net;
 }
=20
-uint64_t vhost_vdpa_get_acked_features(NetClientState *nc) -{
-    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
-    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
-    s->acked_features =3D vhost_net_get_acked_features(s->vhost_net);
-
-    return s->acked_features;
-}
-
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)  {
     uint32_t device_id;
--
2.25.1


