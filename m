Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC74900C6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:22:33 +0100 (CET)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JXL-0002fV-An
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNh-0006eB-EL
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:33 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:9588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNf-0003MC-DE
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:32 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GJKdlr007012;
 Sun, 16 Jan 2022 20:12:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=PrPEqpkJrUxgZcmBNVlhHwOUKrXUdCP3grhsT1Ye6zw=;
 b=GqacF2OuOvJpXuJb2S5G/fxRMIkGOCCTKOzfCM1KALBdy4z82YwFqOvkgoNPYCQyq4vM
 NXV55V8pHDGwGDKI8zOdTlMQMLLj1Qd8YyCdzgGi4pSpskiaYYaTrPnkqBg9HP9xZDEs
 zaQFIgp245bFuihhQnL0px/ewVaYN3lEZeThADfQ9JuDQLwgeEiRs96sg4HPHOP/jWFA
 JCrmb7cZ08E/ywI0e9mYwtXiwOBV4sSSv+7hfvK4MpR9WkHTPdA/3hr+zsb2VN46sJ1u
 +jFStKRbfRNrDxWt4UVX0NgHCCBgdMo4Gh/5+/FOf0ujX5CdCCvVhs0/sQxX6agnPNV4 xA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkufw2heu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDv8RtD+8GIN/QOZXeGSmDuTv75uE1Dj3iFG6fVNduVgchDVk7LwJk/xNVGCSK314NOS0nf2cV73BaTrGMuiWPH9gOFT2HqQokkqsmaBM5FUpL6oTNQXkGRsPviZ+8lvrQMtJGwMyun/qw/0Le6W8SYi+7oBYfBo2l0H9c9p5vkb6RAcL+mWn2mIRHCXVMEhu6/QMFTQIM9PsDZWz/47ypLPjcUfISXMgUWixcvdgzrIeYRgaF1cjf3u5e81++fkOm4W0FP4maQhutROhp9CXmiESAX1wtpwOmzbcM3J6aUdJxJ3svkQo+O0hklWvfPHa7P63oeoWQIBIeh8MypIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrPEqpkJrUxgZcmBNVlhHwOUKrXUdCP3grhsT1Ye6zw=;
 b=XLAEiImGfAcn4KWNC5Kqk4RC4PERs6+jX5jYVWhqot7aSjrckspICoyWmyqp2Qj3YOlNmK51kp4NJvfKpzoySqwpPIYJpCSshRplWf6ITKBovezcZg6z8DLpxIkpGZdYNpjCDZ47Nix4FnXP9EUgs3n2hnIkdlApLL3MtgrIrQRPaezGBkUnyKbXbTSCJApIheyohmQbFVJeReJFZee3zVsIqD15aVSaf339skKZYdqkig3+nofASxS/ycOwsswfcf3qiHZVhASbOSQ1IOgGjPdfhQd7h68exqnjM+oYuOtekcfl1gXKZwkmuDPY0bwHQjwOyiAP+55o2oU1vUNzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:24 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:24 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 1/6] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Topic: [PATCH v3 1/6] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Index: AQHYC1hui2c7rDhyxUuUIehSKkRCNQ==
Date: Mon, 17 Jan 2022 04:12:24 +0000
Message-ID: <20220117041050.19718-2-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6ec0696-5d86-460c-2aee-08d9d96f90f6
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB801839F8948C0E1DD65893C7EA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e04NlVeuHK9pwIf+dqFt1iu5ypl9Mn4fW8ydRv7Jt+bD/kSeczGfgyykGSIb9dpPrVzUr+upFwLxd++BhHNhRPsSKwoPHTHmTqvb6xt0gX+mSdGhoNTGEOAilGKEpf2T4yDH/sFtXB4IqC+Nlo4G4u2pEUUmjBzx6CVMbFX41/cBMYef4dMhNR87i85i7E+01l4/lPzeAK3vy7Dg8Fwt3l+4WmIil7+WMfBHxILhV/uKp3uaQ94UhRIIIeXqtmqZXW8g5cnsveHlas4cSpm3cM3sg631qz7zI0O5L59e+oeT1itKbzzHDUCRggOw0hvAjYcF5UL7ywBCz+MdCjNpQ5gskaqQOyxecz5G/80KkV87JNDpQaJhymnfgA0hz6L1uhpsRwJ+ZglnkjcUNu/xzU7nmEtQcFFHLtdxiYPhIaXlUcUuaAy5ZQhIaOwUn8RvlVEftX9IOOnxdmJb4t52Je9mY25uKz2mHbGGwOWqn4Spi8hFLjE0Bx5ck9la5L9KYkvfX6mBBoY3AeV5zhXlVnykYgsoZ7PA3l57ULOLRY3wNvXjLLr/AXAfImfx2EfwDIQ1ZhXu1T8iQ4aBDOenvVPQTc12Ewj7BBTC0p1PlsBrjNwNfvrrl/jDTOZweHDYlAjHK/D6qlmkkuja0PRfe7vV2Bnxcacm/ep8KGbDQwbmA9elw62XTIrXl6FZKErWtGjyJsKZh1cFz1aeexx8JQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?W07qHd4OMSEHJYESVgCfkv3h5F+Tr9nLNSVmo7BTvZKaa1ZrLpwm4qR5O+?=
 =?iso-8859-1?Q?3BaHr63EhB7g8pcVO14HtabjowztBz1C9P3H+mOk2gE2WU0WRv6lNcfZcm?=
 =?iso-8859-1?Q?agHIOmpgmavKBwFqPerTDyu4OL50qIWtkvCuJedyGUJVsj+HiVniwvo+II?=
 =?iso-8859-1?Q?hJKR1uUAPmSAGxcPGEy3GJ8XuUGzhfLCDxgM8zPCrhUmdx2E9riQk/Q8mC?=
 =?iso-8859-1?Q?WuEmIwoFzwMDmeNTB/1c14LW9ose9a8xbGuAoEViInu3IUdMke0+zjNscL?=
 =?iso-8859-1?Q?I6ykrolWoh1PzUvzBTdoVxiIkBeyZ04iCaWk9QqdJoCh+6rvnKEqZwWjM6?=
 =?iso-8859-1?Q?e8nv2hy/vzMO53AhSnaQkCPn7DykV/Fy3D2lloHTVdAt1kU/i/pW8GPmpo?=
 =?iso-8859-1?Q?Oh44Fd5EyhUJ7fMwkZ9lbzST4xLkOoPFNxzk1nnbDdgOYX6tTcBBYdjHCV?=
 =?iso-8859-1?Q?7Za9O3k00GqkxBIlRReBwRQdxPan+gT7tmzpD534CdRjBq8zQoPAthT3U1?=
 =?iso-8859-1?Q?AeUJoiorArUOXBFLPQkCsqD6lEjyGGNAGSg3F+gpjCyHLCTKq2mP3SF2o0?=
 =?iso-8859-1?Q?khU9eusDke9x5+7DIUWlcT3W0tNs8KGYp9SdW8VxO/sd94tB3pjfQ6/Wo0?=
 =?iso-8859-1?Q?sBAXYNTuxx4SJam5tX6K1n4GpWLpnvNzW9Wkj7XsTlksxpGQOuFvDAgAfM?=
 =?iso-8859-1?Q?QbB2ixw1epOvsqgMhO2gSf13TZOOTpGRYlIdczowDtm+ywYM94vUmfLzxN?=
 =?iso-8859-1?Q?n2muRuggQHW83PSEk14rbXrhD02LN+jR19oIrETfSJ8zfNxapKuDSvHABU?=
 =?iso-8859-1?Q?uDzqEmot0B4sXgWViyRJb9DwtOjTSYjNYdF+YOz2em00jBMWnu3HKHZ/xl?=
 =?iso-8859-1?Q?ICEC0XpFsxTSstBeRVBzPHi/NBmcc5Vt3Gep/nbTz4aKXGw/X1cxR0kVIj?=
 =?iso-8859-1?Q?wcLV917i9rCdSTVThZSSF5ODTXEjz/5DwmvHCeuyeIhDoUHqtdLq3THht3?=
 =?iso-8859-1?Q?JRBd3ZQC3OIJnDdj5Hv/AA02LZd+TqxPozx8bGPKSgCAVEVt20vcAzwUP+?=
 =?iso-8859-1?Q?r69OPOQbotxMP9xLcASXeByw/mNmPLdmgvxNgfrBhqakGenRn69zyIV2GR?=
 =?iso-8859-1?Q?xDaz1etk3YAioMQEuo4S5it3b/xxFBAGHRnv6b66zzIhBI0ffQZvMJOLQj?=
 =?iso-8859-1?Q?Y3wlZ5stEzEVfwXxqCHJ0QiqOx+IxxkYSEglA2hJDMuJIFNsFd98nGVmrl?=
 =?iso-8859-1?Q?NVtMrS5lNBlk+69u+G0AzC2QvorqXW35Tktyo+zZAeiejBrM7EunW3GlgV?=
 =?iso-8859-1?Q?xaLiN57d4z4MT/raE9gB5WkwMhQGcq/12gFiSG3r8DtnwGE3h+DwukHqHI?=
 =?iso-8859-1?Q?HdPGHecsVMb8VmFp8sqoMv7d0E2sPlgpVxHhEzTt1mXQyl4pCJ8pbq9gu1?=
 =?iso-8859-1?Q?3ad2RI7HJhdO66wgLfy7owDJj78eQUi1Hpg/Z8eJFSCJv97uiulV+Mv2Hu?=
 =?iso-8859-1?Q?oemidyEe9jc+oa/kmvMCsIqtOiys/bsHs2z4ZIUsT3kh7Cj6/fT105InwJ?=
 =?iso-8859-1?Q?lS6aPST2ul7KuCkn7suOyw8WOFh1CF5bYvABg6LI4M9OnqLnsjZUWoWIyT?=
 =?iso-8859-1?Q?oLzSYxm0tWr2BB5HtUkaSN4aLjbLLOKVp4uZKEgE/O/IQggbWfqoW0ZekN?=
 =?iso-8859-1?Q?HEP7i01d/lsNGqARbAZDvaVWR/51XJ72raS+rYHCVZc2p1V+fl5mOQY6gw?=
 =?iso-8859-1?Q?JRyEgNwCp+3rl13HgzZtpc42k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ec0696-5d86-460c-2aee-08d9d96f90f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:24.5972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3AJbkiiN7+RKkX2PhDKiZtLGD8YNBQ94C1isu095jo8OORk0qqQB/N/+SA1n4Tnl1DdqSBDGddVJiybjTUkOFhLb7YOhGTof3R1M0QzY3n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-GUID: hdVziY2nT9hZ8HgZW9tAIDpR-Kt8Pt4G
X-Proofpoint-ORIG-GUID: hdVziY2nT9hZ8HgZW9tAIDpR-Kt8Pt4G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today if multiple FDs are sent from the VMM to the backend in a
VHOST_USER_REM_MEM_REG message, one FD will be unmapped and the remaining
FDs will be leaked. Therefore if multiple FDs are sent we report an
error and fail the operation, closing all FDs in the message.

Likewise in case the VMM sends a message with a size less than that of a
memory region descriptor, we add a check to gracefully report an error
and fail the operation rather than crashing.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
 subprojects/libvhost-user/libvhost-user.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 787f4d2d4f..b09b1c269e 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -801,6 +801,21 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
     VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_region =
=3D &m;
=20
+    if (vmsg->fd_num !=3D 1) {
+        vmsg_close_fds(vmsg);
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - only 1 fd =
"
+                      "should be sent for this message type", vmsg->fd_num=
);
+        return false;
+    }
+
+    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of a=
t "
+                      "least %d bytes and only %d bytes were received",
+                      VHOST_USER_MEM_REG_SIZE, vmsg->size);
+        return false;
+    }
+
     DPRINT("Removing region:\n");
     DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
            msg_region->guest_phys_addr);
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvho=
st-user/libvhost-user.h
index 3d13dfadde..cde9f07bb3 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -129,6 +129,8 @@ typedef struct VhostUserMemoryRegion {
     uint64_t mmap_offset;
 } VhostUserMemoryRegion;
=20
+#define VHOST_USER_MEM_REG_SIZE (sizeof(VhostUserMemoryRegion))
+
 typedef struct VhostUserMemory {
     uint32_t nregions;
     uint32_t padding;
--=20
2.20.1

