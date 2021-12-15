Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E142D4765F3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:33:01 +0100 (CET)
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcpX-00060I-Rs
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmb-0003BJ-9a
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:57 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:58992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmZ-0006Hi-8R
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:57 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFH5dmK008497;
 Wed, 15 Dec 2021 14:29:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=PtGCuDxEckuBK3yvXOYSpj25gDw5Q+j+tkyOlF4kfyY=;
 b=2pJpVp/RF15U7C8t+cn5nTFAgYrbvgbI+XU/bdj77zpC30p5Sc9PIQPx2VJXhPxjdKEm
 eijY9Cd+lQgByh/v3DJNR7bHp5CxjCMKE0N1DJKUPcXbLC1HJTEUY9Giwi4YhAn3ybeD
 MThy4Ma2U7LY97c0FtEBxe7gkwoST9UgyRmtV1bOlRhYFMXCHB/TlTXz3k92K9raP+03
 bU1ELXeSdW11xr2GS5GH2JPKYlEtbkmbF6qEZ8chCxy3xDoehHNiRP6EKZhvu1FbZ3M/
 fQ5b+ndYXTxudhDXfqgIyZ9pAeVRbitXMURqXXYhp2VOGsFXn6wKaNPTu0rcJMByxp8A Jw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3cxxf6393b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvOZqoV94Ac7eZEhrElIXy+6VUNIOBN21nBkgz+OsZqfCgWWm4azz9VJX3ybu6YNWoltRjP1cS5gYmIwhp+hd5WekRm939P84rXwW+bFhY2z6++5IJLHs0MSvbO+IS1F7ve650ivnNPteMvGkN7ljXqcYDo6k0yE5VTZDxQrtGFtnGPQLEyMn1eDY0KXFL15bY5iw7uAE+iZRhrtFAWtApdwfXfDwAnSsNs6P3hAC/abpSVn+BlFc6hh38zunRrKcmKDxMi9oZuL1mMpFF49mERq2X840jq+bArdDs0BUPn4jiXf65nf0/px8b/hW2JjspqLxFb021tZlITuWocVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtGCuDxEckuBK3yvXOYSpj25gDw5Q+j+tkyOlF4kfyY=;
 b=ZGpUCbBgg7Nc6AAzeGDfceFd5eZIfexLdUgVuzYir+tBrY2uXEFamh9qbTR7MT+Lf/IU7eVrm6s+JMzJzI4I4Mkbds3rkQGOatjTuY2ioBla/q5U7NNzNwBcehdrlnwh2Rz8yXpvrAH1saGdWUnSQowdf08PeIXwflBNpKL/Z6Fp7rsGyTioF3dfRx+V4ftF8mit+Gwm8o2uHkkso3BOpbY11t14tUixPsxUFt9t1JwKVP2tzny7KYE5YRq9MW8pLOrK1ddPhObuDNP+/TzJrffpPQvYHr3a5BBiJcJEBBd1+1onn+4eizcpzYfLoPKToyD0oXDJMagHQ4Vz5pR2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:51 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:51 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 2/5] libvhost-user: Add vu_add_mem_reg input validation
Thread-Topic: [RFC 2/5] libvhost-user: Add vu_add_mem_reg input validation
Thread-Index: AQHX8gNGk6f5/sQJ8Ue54jIOt+owBw==
Date: Wed, 15 Dec 2021 22:29:51 +0000
Message-ID: <20211215222939.24738-3-raphael.norwitz@nutanix.com>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b17b2e54-ab69-4ce3-9dac-08d9c01a6933
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB54571F1E9663693DEEFEF71EEA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +/tU3TYNBkUCwGzdJL3sictKPF/UDtgxs/paHL3N+MNHG4i1AE5vPSELU2fcRObZaOkL4U9rCgjJ5LIZinSIs+RzIiF0PTjO3yeRUNTpLJ5cSsOlNxb0r27PjC+SbfETWvr4p1unxreHVcZ1zDyZMGBRRlu2E6JOsY7Pf9fBxfL9BrhqjuqLMXZ3Tq63W/tDo1QRNRVqe5zCxezoJPvdL3NbLO248taBUqqzCxJtPnl0RF7Wl58ksqlBb4GRRhoOThw3Mao41euNjoRQUteD710eejSqATZvmNW9yVa2hepE2G6tRXog5XOB9lL/70zsPbs652Me6kfJybIEpfnXH7XZ8By0Q7uufvcKm2jfQdrsFSr/YSWgvU24ltzAjXfRPsOKL4W7GEJTgYloaNkQGd2p4A3SvjicUbZPbPq7o9hyGonlOrrPBCrZY4dGRXNyskb5s1+cadIP+aL7Dtud2oVsXzHoqCiH9et4g0N2GZqFvAjowAuJ9Qd0iatCRsl/kexRm2FP34t9tWi/3KyWqW8FLNkvl0uzu+7+5pB00P0otgMED8mQee2WfciYKdDGJno+wuX8LlQo5/od2n0bnqvtmFavnS0cypFtnD+lKMGjtwc9S1VPjKSZr0bXDf92fY4/vwsl+hSwC9HoQWmFxS+tSu0f7DralKr1oUaGNsgP09FxQqjFlfiogL/f9Q2zKG+zfBQue1p4ZeUgJd6uKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(4744005)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?y91f1m+zcW5UOaE017oshSpqTGUnPJpFbFYtZ4X1YrFfKpVmH4RvuGj7h8?=
 =?iso-8859-1?Q?ugQr8ln/gzwxf6bCNRtHInRtnYl2SN22OXYvhnghX9I3czJSZWm3p9w/hT?=
 =?iso-8859-1?Q?dQFRGlXVGHbudBwZmBaC82n8kUB+3DVicGfhRAA9P+X8qUtXP8PTA2jeTS?=
 =?iso-8859-1?Q?l9zhr7JW/srkcGKdYF5sF2sN54ompwf7t0UHbXX9el+ljiWLizFSqVMlIO?=
 =?iso-8859-1?Q?ddWRuLVegxzmezPMsMunzu4VcIOGwoRa4ijQvhKVctfMsyQ5USg31sNqh3?=
 =?iso-8859-1?Q?W6D8smjng/XJETNgHtLhd48y9uU980ywGKcKE/xdxalt8olC1KDzqawBhg?=
 =?iso-8859-1?Q?4LioyPhl9KARXtpwJy8SnF+3jJUb5vQCqvpKtUMEvmo5KrSxPFYK1SKMCe?=
 =?iso-8859-1?Q?4WZT8hmhqYNnW6DqsZJVmb5s87MWcrotfmFt6sYq0t3ucOhPI4msOzuyjd?=
 =?iso-8859-1?Q?6Np6A59Qyb7IRDoUgMCSUzyaNBLClkn52vf7F76zxLwv+U0IojKzN4pyQO?=
 =?iso-8859-1?Q?zZ2NHL3JwoclNnumkHLjmH+0JiXKxgPKWbnsBFVeBGqqSPBmgKN4N8QJCX?=
 =?iso-8859-1?Q?voYEQ3FuOfnFOVJS59VkgNmR4vZhphJazHM3l5GYYcXGxHrLm5rtkdRChX?=
 =?iso-8859-1?Q?PtHPmCpt+xVy6k/j5OHbHL+qPcuMSm6BiYNcyDqz5qmHlZ51I6yz/Unt/X?=
 =?iso-8859-1?Q?ZK6Wyu8HxT1PRIj38V/YAnzYYWA/jyR384ZofnoM8qTdMTRqp0JMeoxxmS?=
 =?iso-8859-1?Q?2UfQIjoZ+UN6FNEvanYeg+OUaM5PiCyGvoLsTAR7zguL9lgT9ZwBcMOIYQ?=
 =?iso-8859-1?Q?0avdxfsdMNlDr4Zn9WfBgdtusCepevmKMnj9xynxGBpykzwIKQlUKAxsK1?=
 =?iso-8859-1?Q?ZIJd4qfeT6DMgGIHt0a60EvRW2OKpBTNWUUrXBfaB2o+aoM399IgpgXNlZ?=
 =?iso-8859-1?Q?gkig6vVVKVHoZiMuHMmG6F2SsytY9v46C6gR8CuBrmBrQLbIMWnVlc4rVL?=
 =?iso-8859-1?Q?ehGgiTX78oqG2I5pIU1phOiuyo1Ra0xmvjSXiZ/OOM7Pzms5ryiybHgD1N?=
 =?iso-8859-1?Q?mEn0cH2XpRMLBMLPJm3npbiKJvUwsGpgucgWyIKDGR7MdKgo0L6eJvztl9?=
 =?iso-8859-1?Q?Xg6XWeGF8RbImlYHR12cGYiNe70AViYsMDL4pJMLH0/NlU3pkMCelyl1W5?=
 =?iso-8859-1?Q?BwLfX8p1lVMUUzcyqTUrApqylxqPqB1Ek3Kez7/to6bXOXzKA58wErXs3r?=
 =?iso-8859-1?Q?YTdPAL/KymElG5/AYMDrBf5aI1upfUD7VP9whQqdb3DmT1ZHyqFhqeaxfJ?=
 =?iso-8859-1?Q?gww20oyUI4p1esk7iz285D5tI/uOFoUidKoQMgFDVF1k1llQOIVJlQNmrV?=
 =?iso-8859-1?Q?whY9xPn3q+e0TlEk3WJsrV1DXE2fomQ7d+s28I1DOyQBv3yzBizpnhtoNF?=
 =?iso-8859-1?Q?F8T/orfrCGJ4luGP/gUpYB6enaUuJjAfQ3Kz2Sfp/e/bWZG8n4RjyFeJBj?=
 =?iso-8859-1?Q?fsIbUkM00DMzvnYbOJis8CMoHAItY48ak+sN/a/rvlx7Hc0rF6tg19sdbj?=
 =?iso-8859-1?Q?xJwlVj/RvitfWTsJAjtkKRIKGeyofNWVDGZG/r44ky1zNjeD20/QD3cVee?=
 =?iso-8859-1?Q?K0HVdk6rbdlN0/La1f6M3O3ivhOjLceIqm+5U9isK6I+vzTHtB4Rs3yh1K?=
 =?iso-8859-1?Q?+xqNvQDnUgmkBWIIoiOmZsPXjmJqsFXmNHZZ0gqicpGesOmyJUkv4SCmWy?=
 =?iso-8859-1?Q?g7gYdFUmv0gg4oMn1Azh0cyto=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17b2e54-ab69-4ce3-9dac-08d9c01a6933
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:51.4825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqtvyHq0sP7Bw8c0SGfDwIunvUbLwwc0GQBOhRMvEu9ZpcdPKJkhgv2DZ1BnC+QM4ArSl5nMtWR3P04a96cX++qcjqeM0R0vMqs44f4h+yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-ORIG-GUID: hZM6CoT45_Jw9tLeWm75MtGo6A9z-AC1
X-Proofpoint-GUID: hZM6CoT45_Jw9tLeWm75MtGo6A9z-AC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 573212a83b..80ef335254 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
     void *mmap_addr;
=20
+    if (vmsg->fd_num !=3D 1 ||
+        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
+        return true;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 va=
lue
      * we know all the postcopy client bases have been received, and we
--=20
2.20.1

