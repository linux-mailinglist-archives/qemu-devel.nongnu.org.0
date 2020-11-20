Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293942BB402
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:59:02 +0100 (CET)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBcb-0000MO-41
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1kgBV4-0003zR-9o
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:51:14 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:22886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1kgBV2-0006j7-1F
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:51:13 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AKImJ7b024800
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 10:51:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=tB0JnB8UDlU/90I6WOlnSGnIitiOUiXPoice1UeGPq0=;
 b=pF8/vun0DR+ZWu+HLXBy+1BGFQLgio/mXav+5VfplIywZWXry2gkEN86Vt+4fWXgQXIs
 eAA2P7SnW7Dmo7S69PD9zsRG8lO1oIiVOtlbuKJR4lyFSppFESFDK94xPir6diZo7g2B
 AG4PjglVb5llpbLjtG1huwhjS2skdskvQltbIqd5RRxCJ6VDuY7rvcqApvybpmhDaMDU
 HXVWCBbzIcqphLQrrUw96OtJCGO0vzeRvL1Wo2MJ/sT2hgrE8XyAKCRTa4jKpXfQUDV/
 y7Po1evKnDrQbtNJBFDMaXstFDjpzCLa8Ytn/ytEdAFildOfehW25NgUc8TOH/TREms0 Ug== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 34tfemecxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 10:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaVudFkMgxeuRpoTya8C8Nbv0YQeLaMwWEJB/ziU6aW5s9o4KFznzHjnOkBIRtFAtRu5a2RCx+SBqr8CT2xJoPQFFEaqST2eoek1HH2ZS5ZfVf2hmdZZlkMNEbwZCk0mQYgltB4tT1FmlSsBQbvZOfXwH2NFQTa3pgwUrSmqIxe2+0aY9wFmHidn8QhjW8GoUzvPc/V9fbd1VrBhcJdYpOB9kZ/42jRQKdepCniPEQ/QBXurFyMr5P6+6ttLRi334k9ySLTUT4MwgtCyDANLrqdB/ucC7D5W+9NQiQjN0a5U7WRB66aFO96qBvVwJI+PVaiwFjxqIwbiz7ldSj9GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB0JnB8UDlU/90I6WOlnSGnIitiOUiXPoice1UeGPq0=;
 b=m+1Zr+Q7TvvetVb3BqpmfKyCeKSJeHF6nkBFFRJTpNBxWHX81uhNHoPyHQlt/Z+7eR0LkvqcSuS95qI3LIP3qSoE5pbXJhpOzNutjFDumIFArYV/nq0InAMfEPVJ0Q/5TQk+/QDuzBFDnKWAw5MCvuSlvJ2F6XFzfgqJPqDmpuVbB448CPRU9IJM8hmErWYNWIectiA88qYUAZZkPOdo69MDVQZ+EtTLpRK9xbNg1486P+EAU+ZU9WlFM2TxTMA2WaJNsSIcwi+n8xWxlDVVRSh8TgxfAcG/GFFJJP4f0X8XwrD/i3x/di7j6rNrJQ+cby1GkAMefliaigycaMhfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB5378.namprd02.prod.outlook.com (2603:10b6:208:83::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 18:51:07 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::90ae:f92f:e09b:224d]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::90ae:f92f:e09b:224d%3]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 18:51:07 +0000
From: John Levon <john.levon@nutanix.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] virtio: reset device on bad guest index in virtio_load()
Thread-Topic: [PATCH] virtio: reset device on bad guest index in virtio_load()
Thread-Index: AQHWv24bP7fTvZ3cMUm4/S0ceR8LMg==
Date: Fri, 20 Nov 2020 18:51:07 +0000
Message-ID: <20201120185103.GA442386@sent>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.98.93.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48c32341-dc66-464d-0664-08d88d853d91
x-ms-traffictypediagnostic: BL0PR02MB5378:
x-microsoft-antispam-prvs: <BL0PR02MB5378FC8DBC4586D520555D3E97FF0@BL0PR02MB5378.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: woEkcT0begilEoIZCF0qssL2Zz0G0icztoKwW7/6vrFBOJRhgcKSYi2c34/25iMfP+X/68K73lwlb6rfsQWobMhET3cw7l8dStQgP8qXGfUVUfV4itzB/R98sPD94rMFm59hpkxkGPkWtk225toTOpALz/2G3y4nXVRzobljAI4Fx3R5/xXxVB5f7gEw4Mh9qGK5gSs6tbQgbuoMdKBnGFXvGCOA4907z3eZzRM9+XYwurUcxyOEyjJ7/lHYLYb++7sCrhn9cjJwKR91eRHDHU0K60cmfCckw7d/Q+CxfnuuoIQXw5V8T4UWz37nMLXaMBus/aC8zcJABzCB+V3p9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(39860400002)(366004)(376002)(346002)(136003)(6486002)(186003)(6512007)(316002)(26005)(33656002)(9686003)(33716001)(478600001)(83380400001)(6916009)(8676002)(71200400001)(91956017)(2906002)(8936002)(6506007)(76116006)(44832011)(66946007)(1076003)(86362001)(66556008)(64756008)(66446008)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aSpsPTdEI7ln32gm3KUyFkKi1CLEH+1zlHGjRqfsGNKtiwtksl1NdBnVOG8aYEbhGKisXB6huDcV2QmRU2yv/w0H85hyVCO1a6QodUX6eSqjwIbG0QgnLCP7FvCE3tX4P70dLNIrvFLWEEo6oGT8qOY3+kB9lV8+y53E4Qrc34JaUrdheOSuX7qBKLOJxMN4z7Kw7CdaWTkBOndC3KTN7hpWj8y/wNtE5hSnf2oYerKVbyREe+30vTdUcX7kHynxAG56JL4j0XmuqSz2fr7AuWCUUHxPwBClqAZ/NXYZF1B5PTP/Z2lBYhc6tZmxPKluu5DuELJThs2+sS0qTIgrILMZRCqPjV1f5KLKdk3CFOSUlJ5niVameCVkPf7ZUaCQgJLXObaJYDju4d4OjzkZsUkjJkxUY3QvUqi4Ob1CWsZoZRk7DKsNjWwD1t7CRXd7eRb8ZzztJtiPYjLjUWMV5HHAnaX71+FTwoeFfZbLyFz1FTMK5x2KgQkCRjJr9YBEadooPL7q67fTeaad13UeCZ19KTk/6wzfJP5VdIoUSaqxmcWoy9iboNoeXdQ+VGWID4HPSlbJhIzQIvodAfNrZM+SP8AfzTPZ49af1TU9LZ+vxgi+fIcbEPmVNsdCnK8VoWop5hJcHHqnJEXgii1sIj5VcVZs6jB9GluHqJMqoF8HEv4A7y59N51lfdc0lsZgEF2RpnGn4rcx6V0F/FRr/L9tFAJhGmThk/BMLvicxLrwEGDidImhBEkZQ/NBNXzXz+9zhUoPcVjNG+LjLYAuKoCmO7OJ51jyua+QjVc1E2o2+PK4Lx7d1pkmGWxIg2ytSyc48LU0Lv1+BdpX+cTrIfuPL/WoOOilJZSDI8RHB3X722PH/PSQWafcR5qqy0K5raby6odbj2j7p3fcyqWnpA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA5355C4EB0AE04C9230E5E470E36FDD@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c32341-dc66-464d-0664-08d88d853d91
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 18:51:07.5446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybVvYIQ3j4SIa6y6HhLpXcdh3if74OatXZv0P6u0DaGbqQq8uf8PY5+idDN6IdP4Y2P3KRhsnBG2uz22Pq1RBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5378
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_12:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


If we find a queue with an inconsistent guest index value, explicitly mark =
the
device as needing a reset - and broken - via virtio_error().

There's at least one driver implementation - the virtio-win NetKVM driver -=
 that
is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successful=
ly
restore the device to a working state. Other implementations do not correct=
ly
handle this, but as the VQ is not in a functional state anyway, this is sti=
ll
worth doing.

Signed-off-by: John Levon <john.levon@nutanix.com>
---
 hw/virtio/virtio.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..eff35fab7c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, in=
t version_id)
             nheads =3D vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_av=
ail_idx;
             /* Check it isn't doing strange things with descriptor numbers=
. */
             if (nheads > vdev->vq[i].vring.num) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "VQ %d size 0x%x Guest index 0x%x "
-                              "inconsistent with Host index 0x%x: delta 0x=
%x",
-                              i, vdev->vq[i].vring.num,
-                              vring_avail_idx(&vdev->vq[i]),
-                              vdev->vq[i].last_avail_idx, nheads);
+                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
+                             "inconsistent with Host index 0x%x: delta 0x%=
x",
+                             i, vdev->vq[i].vring.num,
+                             vring_avail_idx(&vdev->vq[i]),
+                             vdev->vq[i].last_avail_idx, nheads);
+                vdev->vq[i].used_idx =3D 0;
+                vdev->vq[i].shadow_avail_idx =3D 0;
+                vdev->vq[i].inuse =3D 0;
+                continue;
             }
             vdev->vq[i].used_idx =3D vring_used_idx(&vdev->vq[i]);
             vdev->vq[i].shadow_avail_idx =3D vring_avail_idx(&vdev->vq[i])=
;
--=20
2.22.3

