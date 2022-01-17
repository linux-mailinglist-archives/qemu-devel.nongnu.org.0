Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C974900C2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 05:17:52 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9JSp-0004zo-Ll
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 23:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNk-0006gO-Mn
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:37 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:12278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n9JNh-0003MU-VC
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 23:12:35 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20GNl9Et029596;
 Sun, 16 Jan 2022 20:12:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=44ZrRvmfbahsg+z/gNtfg7Ej5XPa8KWTStWXi8F7Qwo=;
 b=J8O5gy/kSKd1zwycuIjiNIBONLGx7yCQZ4DdjYrA6PQLDRUf44ppJeW926eu4r299pgs
 He5t05Rph+BzGGJYC7oupyXap8/p5481JezPXPb1HWgRp8Z7GPJMfFCOUYaxBUHUnG9x
 NCjorU5kr9ibr2P04SaCEjg7bf0UizF5FRfgJ8Fj6t5kArdO5mI4htvLBbLCNlknAaRj
 30olSKRqxNV7vUSBEg458Ccwj5pn09tYgS8SW6H7gAZCmp8ulBRxrcKU/COPbB0U9qdW
 RIfTeD1+CCi0GvXu6wXuxOkSmvEaXtj4Nffrmj7Cs7SgKlNmcYOTd/GJmfrQMZFQzfad tA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dkxfjaate-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jan 2022 20:12:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1uPUd6vkJFCW8RCpm8SDODPhEH32BZFX2P3OMWLSLPClz+Zw8kWKXJ4l+Dt6pB6VyNtB0uCV0ctGeS3yHhvTCOol5tdYYpggZTcgyhPIMvtFnzHKc+0+wXyVa7pX4jzhk8eBY/kO/70l+U6ylf/mMQgCn4Ar48gbI4PESDWHsJRzAc94CK16Gm2jJysHhz3oQ2oDfpB90qLTGJ28AvI1d3cyFTtbYNMW+LOyLEIN+uzqrdRZn0+BDdtL+cMZ6iURbG+YQ15JokLKxxKVXJobBQPoKljW+Z7bjtDiMMCvtrzeXHqQ8mJQi3ESXvEZA1stVbz/5hV3e9IGu41+leRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44ZrRvmfbahsg+z/gNtfg7Ej5XPa8KWTStWXi8F7Qwo=;
 b=fqkLVCddqd1rV9h7VBMQ9w8inASBt2D+HbSTE7P4wB2DVMgsA5h93Stjt7umdYSCejpd4RfKU+rCzaJdR7AlSSe4qXr34l0xrCeBC/nrF1d2x3ulab8NPLrDj4+98rK1/BdfCfmXha5k1UoZr4x7HHWmdUxlL5786q/6fZ1EAxf5t6txzP6gbXbwhKrHGEab7o6PBncxMwRutvbFwKS1sPltvO3uO6BsKJhXwJIcn3fLeNZR4SvLq4FnGeT/eFx6pHnSYMDNqQtxmsV60+NHy5JDpXHw+qfO99qYgIbQUakUXYwzGnXrlhj9cwkdglfJPK2M/VcRRM4BLK09IfseVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8018.namprd02.prod.outlook.com (2603:10b6:208:359::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 04:12:31 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::4ce1:59d7:578d:7e75%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 04:12:31 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [PATCH v3 2/6] libvhost-user: Add vu_add_mem_reg input validation
Thread-Topic: [PATCH v3 2/6] libvhost-user: Add vu_add_mem_reg input validation
Thread-Index: AQHYC1hyG2brQEFqgkq/5jE3B/5vvQ==
Date: Mon, 17 Jan 2022 04:12:31 +0000
Message-ID: <20220117041050.19718-3-raphael.norwitz@nutanix.com>
References: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20220117041050.19718-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba68f2a-a107-4c61-5843-08d9d96f9519
x-ms-traffictypediagnostic: BL3PR02MB8018:EE_
x-microsoft-antispam-prvs: <BL3PR02MB8018D81D54C215ECF6F10376EA579@BL3PR02MB8018.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AHQA6lyQ7kmoqoI8LtYEZh2zgdwXHJglUM6ph0zASVDJU/c1S5bUQ3Sw+feywj9Um2YhC7Y57z4L5CzeAQJJf1U9lCX3F3GS8Gf9UuRm36uk/GszIHZ/hE5SMvLkmQ9L3EMD71sASjpDeedbxTvASIy546KHJYlTAsD4WoOKUF0Bi06d3NKFeXDoGtRtP/QVdHD72sWGG3kSpbxJP88ARoEhGceNcY2NzH4FR7v/OoGEixnW7tHauZ3lIpsw6DlRcInkP7HDRJ6jB8ywfedhUyyl80BIR6ZI0AsK98jYTSwnLjawZLdCkH8zoxRB6uYrZB3jLcLn6FfXDxb/uc1KDJm2x24pTVy/xS87rn0mksK3TLqL9xKw5QFnGdP0oM2Y6F89tjNrms66Y5Oj1h+ZHToqmWbwpRvcgJY2xnOK11NF/74tveQLdhhzbDcIMTHRAaiuD2XaI2DLMIeje168BKdqvClxGkGEhB5DtbS1PYZIMvN1k1HpE07Hv7m4yEqb7rmDwp24EwoL/VzMofy1mCfMKEeiY7frIxV2BCnlLtyIJ9CZj8gsQJdo2h+3LE5dWNNFAIYed8X6GbrqWqRYihp/UmAzoPq3Tq5qsk9rgYO32kCDsmnfSCxQyC0LhbyjeG+VyiGIMD1sEccrtL0loCc4temm4IHg8S33kpEB7a426cRjY39vo9Jaow4X5xVU5gRfDnKeuAgcGnqI8k95PQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(508600001)(66946007)(1076003)(316002)(71200400001)(64756008)(83380400001)(36756003)(8676002)(76116006)(66446008)(66556008)(6486002)(66476007)(86362001)(6506007)(8936002)(44832011)(2906002)(26005)(6512007)(5660300002)(4326008)(38070700005)(54906003)(122000001)(110136005)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0jPQQO6ZAPMAkjVbBNZuJPJ5yu0L+2OnQBhhVqrrDyFemua/2MrxEVcC8y?=
 =?iso-8859-1?Q?Yifjyo3OoIEPOrYiQYqCBxv+fdiEQHKMAKaw355/oOlTEfeEzvj+G8TrjD?=
 =?iso-8859-1?Q?sB7KTIhgbOAQNfR3CUcDNWdsWi1eHktZxbXl7WgB4uSNNYm84tgSLSnV1Z?=
 =?iso-8859-1?Q?FyGeHs4EHuwBqoVAFIbFkroAZpY1UBlb84CANwZh9DqwOdQnmCKQe/Fxt9?=
 =?iso-8859-1?Q?iFWyAEWGOHADbi7l1IZNrxGhRvAE0HPBqcPJmitAL24NDFGTYdUbVw2sdn?=
 =?iso-8859-1?Q?MQBaJNl0af0U5Vre2PC1sFbPKokNPRRsE5Sra3zpBRlB8jh5VtcJJNfdhb?=
 =?iso-8859-1?Q?7+q/c7HxRVB7/ZB0ZzrQZ2mMX0H5HQqoVCOBv/KOBCFlhOQ1KNa15cMGF/?=
 =?iso-8859-1?Q?2qYhNmuZBAn0bay6g8etyfC3lPD3eiFZQ8RLMoolOZqj6c9aMO5tq+py+W?=
 =?iso-8859-1?Q?D1aCUvSL4NhOffx48MDEX8+P4MnNQ5uPQyw4GXADsf9gOVz8JZHNYzhkym?=
 =?iso-8859-1?Q?4UQ+Q4OhilY2jtuMr3bqmoVObv+Gx3OSeAsyoXiKNjgty+TP3buDElOX+E?=
 =?iso-8859-1?Q?Wt9kq3lGLGBZJGaN0wqZoSoRM6HeuLXmLM9UY+5KPzgZTvqEBpgFtOkVvV?=
 =?iso-8859-1?Q?4tZIfMCA5773CSjsm6sF7TNvRa+n1PGd0SsBGhQNbl8eWlpuG4JL6+ivv4?=
 =?iso-8859-1?Q?cKbmjkNNgNYL91GBPADV+oNEuXtp7RHYx+5sCx4NIDVhZaO8K9APerTUt5?=
 =?iso-8859-1?Q?nTyCED1LP3a8nVnaW8FughsmraalsvwtYFo5pDkmKlnWLaKtDbyHt3K9w7?=
 =?iso-8859-1?Q?g4EnsAlM8dioIOsSTy2BKStRuhBVXLw1WFJQnku/w7kp0Jr0LAErR9gVnO?=
 =?iso-8859-1?Q?Mey6egnv6XEWHVHRWNltO5gORJmh6wEGLWSspL9zT1BtRZUOa60apXY0kI?=
 =?iso-8859-1?Q?NOMyGJlzTulb9qKCEwjmGEkRmTEG5OxMy6WRG7N0NIvXXdO5qgooixLQVB?=
 =?iso-8859-1?Q?j4oCvBAGlSa7Bx6g24IMnN1NjLrg5HkZ5/S9FpPXKQGpqbQdrZg8IeyO9P?=
 =?iso-8859-1?Q?a3M5tOb7rW7lzhe0WeJeb9a9dGMWKNpKITChDDLRYUq2WJ0hWmEJXCL1wA?=
 =?iso-8859-1?Q?LGmcj8VT1PVDoJ1FKrjg+ZsWfc0mEGyt6Nut1oyNS3CnXrx85vR/xA2qx5?=
 =?iso-8859-1?Q?IwRjM5MPOB8nrN5npsilBE+Gxr3X8cEBvj3/E89KpQDrL5qeY9aBjH/Rbo?=
 =?iso-8859-1?Q?ZHTmeMdGec09odh/VyliFIPdXVA8PXzoyiE2U5l1dZFzAYjmmSmoGQ/ZGN?=
 =?iso-8859-1?Q?Hcy0cfbs45xg/+Ffj07jwF/rAluPTLn1OZpvevhqs8qBf9u54wpuXSG8Qa?=
 =?iso-8859-1?Q?H+F/jHBGmbeiOhZ5dF86SaTf8MT6EEBKYylisIdcCHuTx2XELAvBMjdsfe?=
 =?iso-8859-1?Q?kWjKlpHMLqZxhGVHoqkgtyquDhUc21VXmK8aDh5lmnqM6KPc5gljAaulZ+?=
 =?iso-8859-1?Q?jHoZFDdRpwQCbMWs3o+te6xg6+cx74xDd+XgDe6F43WA4nCAOVug0jth3X?=
 =?iso-8859-1?Q?K/QuOQvzetzVef5Fh+MnBsGiggY/+BkDekG2NXtN/bphI+K4vBJdnMD/jY?=
 =?iso-8859-1?Q?H3gZhx6Sjud3tm8eyDFugDpkOgyCxsTMApNsiZvO5H+Ra/R5aCPwbKABMg?=
 =?iso-8859-1?Q?qTTR5YJQ7uvyUxlDHySzqrmY4b5WeiCbd5djOSXRtnDx7X2XHq5ciQ9O0D?=
 =?iso-8859-1?Q?QbzkZX9ZEzrSkFCWRxqkW89Aw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba68f2a-a107-4c61-5843-08d9d96f9519
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 04:12:31.4905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0L/QL38zNFDb116IJfA8NCpzF89Fiwu0d4w3cBGf0Cy6HXKIVzePYPFzljiKVgJsLo4Z1IRGGnzZGRjb7N3Bro0BW/mOS/N0KLp85SjkNUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8018
X-Proofpoint-GUID: 5dfyRWRZQOAF5GMYXIADfxvGsBApSwe8
X-Proofpoint-ORIG-GUID: 5dfyRWRZQOAF5GMYXIADfxvGsBApSwe8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
VHOST_USER_ADD_MEM_REG message, one FD will be mapped and the remaining
FDs will be leaked. Therefore if multiple FDs are sent we report an
error and fail the operation, closing all FDs in the message.

Likewise in case the VMM sends a message with a size less than that
of a memory region descriptor, we add a check to gracefully report an
error and fail the operation rather than crashing.

Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index b09b1c269e..1a8fc9d600 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,21 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
     void *mmap_addr;
=20
+    if (vmsg->fd_num !=3D 1) {
+        vmsg_close_fds(vmsg);
+        vu_panic(dev, "VHOST_USER_ADD_MEM_REG received %d fds - only 1 fd =
"
+                      "should be sent for this message type", vmsg->fd_num=
);
+        return false;
+    }
+
+    if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
+        close(vmsg->fds[0]);
+        vu_panic(dev, "VHOST_USER_ADD_MEM_REG requires a message size of a=
t "
+                      "least %d bytes and only %d bytes were received",
+                      VHOST_USER_MEM_REG_SIZE, vmsg->size);
+        return false;
+    }
+
     /*
      * If we are in postcopy mode and we receive a u64 payload with a 0 va=
lue
      * we know all the postcopy client bases have been received, and we
--=20
2.20.1

