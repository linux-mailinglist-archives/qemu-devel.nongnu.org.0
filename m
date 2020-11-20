Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65172BB2AC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:32:34 +0100 (CET)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBCz-00034I-Sx
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1kgAVu-00012K-AF
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:48:02 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:31548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1kgAVp-0005EL-2d
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:48:01 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AKHca4X031894; Fri, 20 Nov 2020 09:47:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=tB0JnB8UDlU/90I6WOlnSGnIitiOUiXPoice1UeGPq0=;
 b=Gv+IghBuXmFUzFOf/I47gCBTh/Ns7vuvfPgktPmE+LBAnSkRrLG1A3HUfBD5w3UMAvRJ
 IIu1nsgh6dUvC9ObilpORs29FVs86iJ0Y+o0Imyy+0tOnoJTtSV5MR/tcVAWXCqetF5m
 8Cq1o3Mf7KbV09TRJsRp77Ru0RmuVyfdQjM4VFdCjpqOpsVk06R+CT6iLrQaLsvXMsE5
 6RwazBY9lzJCmDYA0McxYt7a7FIeSS8URMjZq61GZ67ykFyi+6zRx9U9nYsnQCrNLLyx
 FMP1HikIJexCsdbyOqDXioGhbUZzy7GeENLZSdvDBNFkaPd1a6RRWGojn3U8vRTrN/8R bw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0b-002c1b01.pphosted.com with ESMTP id 34tfeme8v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5Vp7WtJpUp2qyQ3P/Vbl6/tYPzml5V1E/gjDap+ldmFJH4DpBHLuypbskGdb3KAxlmmsCzEbmWku+dc1i21z7ty35eADr5pcyCDfq+YknL0K4e48Swuh1hZJ8GdEh0g4Ve8w+kCnfLE6w7DUHgSWoJoIQvvKO5euvq3Ph6sZ7NVzKMViS7wlQxgmKhAsPIRKOYOVSksXUo4t4zITLNgoNnmPOtfKujfuHz0UCAAi7QXBk+BMC7zQCgzoF1WwxmWRdxoSrl6NokeQ6L07IjhhMZQoFJYEAG52RFSc2UKPF1PlDhfvoHwqMyRG0YOPvYh9m5scAmPldpxjHoqGWwhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB0JnB8UDlU/90I6WOlnSGnIitiOUiXPoice1UeGPq0=;
 b=OrL6Oa8a0QKD9XpBq5yudWRJDe6YwzdX9fGRM3+SokO/nKPA1OWDIUVNek9xiRNJ/fn11qQvKXR8Vw25z+Mo7lNNP+7+4id0775S6CriIoDcbAFRZ9HN0aiQAUw4C4HPAcZeRu2WExe67njxYM5S8o5wePNB68OKhr9ygOZqCL2BnICuLbv3jmFQPI5nO6aSaAKVENsqOv7gkQZno163/dYdFOyymzhMNHczRwpj1nlrGZ9Fj6GWo673dT8p3bY/tgufj6bx2OHq+imP0n8bAhrjFpF6XeFnH1zUZSy04pPUJiTZIBrpjlG4hc8bGGPdQTj8T1BMGMG6WdZ76fd/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB5508.namprd02.prod.outlook.com (2603:10b6:208:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 17:47:49 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::90ae:f92f:e09b:224d]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::90ae:f92f:e09b:224d%3]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 17:47:49 +0000
From: John Levon <john.levon@nutanix.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] virtio: reset device on bad guest index in virtio_load()
Thread-Topic: [PATCH] virtio: reset device on bad guest index in virtio_load()
Thread-Index: AQHWv2VDM1ssTaX8G0CJqVSq/AILrA==
Date: Fri, 20 Nov 2020 17:47:49 +0000
Message-ID: <20201120174704.GA438509@sent>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [88.98.93.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4edb9d3d-33de-4334-15b3-08d88d7c65dc
x-ms-traffictypediagnostic: BL0PR02MB5508:
x-microsoft-antispam-prvs: <BL0PR02MB5508AA8720EE589BDEFD402297FF0@BL0PR02MB5508.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hZ24MOPU3rd7WLuGejq79tq1l88n/qaWpwg7F1aWBr2y3hA1qjRq9Oxiy58a2nzWq+4dKofX6wAmGzL0TNp3nHm4XdswbNMQOYm4zo3xtUVxQFeR2dBvtOr7cTJXJkJkN9ceWGKy/yGuxzy2clPYa8CHX31zS33rtnRClj/uivxTVb6W0nU5QGuZBPKgJp868xoQ1oKKePLmxyz5XsW0YZT0WqvmVAbGe5RZCT3oTm9YNglRymTaDxE5E0cmxLN8n6n3Yx4BMhQBCwuuJuykpNTrP2TTQUc5010ULtlXlvqJpYLvhjY/E8mAscShse2T1YZw35kHlu/Iawl9dsBE5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(376002)(39860400002)(366004)(396003)(136003)(6512007)(9686003)(5660300002)(33716001)(6916009)(4326008)(6486002)(71200400001)(1076003)(66476007)(91956017)(33656002)(66556008)(478600001)(66946007)(8676002)(8936002)(76116006)(64756008)(86362001)(66446008)(2906002)(44832011)(316002)(6506007)(186003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1wxIG3HUai+eALoNTaNA+33oQHym8kcz/eohNz/q+yWH2Xyh8qm+5fYMy8uhDHLfK5DhlEZyWGot+eM4QryR+VE9HtXOzc+oH+ss9kPlEQQaWq9YVcjHLv8ddATVsaP2zqxHaLn2L6l5bBTNa7clRvY4Q63VQ7iWNB1zwvjmn4gvB3VSvN5W+lhhUG/OkHMOw5uxf7kD8jtUz6FAHaq1eHyH21FPephkoCWv09IEnxhLHKLzMGR9MWN80KoaeqXG11UvvldOaJ7x7zhjuVZKCBz3+vQApOGQrv73DhliLoSslwajXQ4uEz9jYMA+EWJNOKhcMApKVptnaboCRvkpn+usppp85b/DVc+88UD2aZqPcXSLlIWbMXQKEKfh38mmU0cyg+NbNJraNY11AKXqrgcMrCfxpuiyKnUz2uHx6hB5quTeAWiMDy66XQF55vveZF8wi6vaccxYrd3fF0MV+S0YZjZ+Lb9AcKF8Ba/981kSEX0DPm6sUkhUl4FkuadMDkcqJbLMTxM0JuqmNm0Z7mYKw8xfm3Cs2UaacWW1zLFSzUlvG4ufEHNDKo3lIu8MFcSkYlhX0AopOsARHK/InO2Y+odDyflPaBL/oWdVCeMZ8LMm2pgZejRe+N0jszgy6+YwRr61fFRJDM5Z4bSi2Y3P1Qnj0FsBZEbJegGbhjXRoNzgA7Y/47p9iX8rBucvJe7Zw02Bpwhx48/DczGrfh86TRZp2WjvQBYrN+OC3Pt4aK3XH54J8vAmJUIX/32ok2IOSKmT+sjor9iG0NJvLCkucC3hrZnG5LA9GpIMyRf2SUn6C7hqmnR252ZvmFMQLvU+zCXV6NKL/0m+oS8drcvdfcudmriyr3osOWy/FeSXsh/Zj+q2W6AgMwpMQKEwJi16acOy/VO/+EzcsN6qbw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9AE922B44322A14CAF4FE5C1043F1EFC@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb9d3d-33de-4334-15b3-08d88d7c65dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 17:47:49.5929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4D4iXPHytoBTtx6TyA3T9R0OyWaJTFErr3dPiQj+BY0qa8lSUyKYBWgLgGjrXviJ3srh5iOwlFZX7stdmSPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5508
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
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
X-Mailman-Approved-At: Fri, 20 Nov 2020 13:30:54 -0500
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
Cc: "levon@movementarian.org" <levon@movementarian.org>
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

