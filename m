Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D624765FC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 23:35:08 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxcrb-00029t-Nm
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 17:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmc-0003FN-WE
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:59 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:51928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mxcmb-0006IA-Eh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 17:29:58 -0500
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFIIB8f015985;
 Wed, 15 Dec 2021 14:29:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=DRnTi+hD3E/W+a5jt/ix5aSP1scxtVGeQfv7uJYY7P4=;
 b=jhKsAC9P1WA5xs8Vpc6dRGJSy3ohfmhhDnlKvchpULy6E54rxcFFUar0WAdQ3CWHm0Z1
 8TrS6MfI+MGPyjZ4ghg/qJk9jhS+/OdcHZYgGDm5aEVys7db6rrkV7uxf17pdvnWI1hb
 Z45WdyrzF0q2qgTD5+6JGm686kScr1Flj+0yym3plSXrkf1J00/sbidapXe3NBzRv8cC
 tzQrw33bT4MACEaqqSjEFXshIjDyofsqyrlwfXiRlvXPwWkvuWKres9iOyxLT8/cK5/9
 I/4D3slTqgJid6z6RcTCHE4Wlvz2fec8ez82DFQO11pflZof8EeHjk1PnmCnC/PVP6jx YQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cxyjak44x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 14:29:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylfl9Pr8G59XJ9tOcb63+sPcKs9LNZ+djnYsL2rgM7KsI6CS9ubluQ6n00TXBCOOdnLlAV8O6Is+EZsiWYo4Zn4BsfyCedo/VxrKeIKvSZYyz1eaexj2XYAxoX4EYYCBYIzSGFQsDMyMBOv4aeu0lrpbB2LN6A7XNigWDnE/Vd0Inymc0TdYyNeyMUs+DZaz2qv2jQr669d7i5L/r6LswQcAeMs1AkOFt3tOhQUOjpkcTj014IiGEu55XxCNesMUEiuIBQLaA8cQxiE3pSm3TuLqOVZzblwEXXpILvLEMH4gVWU992BEYWRiVh5axl8wlwwQt++TSdGfQE0/VBRR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRnTi+hD3E/W+a5jt/ix5aSP1scxtVGeQfv7uJYY7P4=;
 b=PojVSibEdcnbKz1ebBjnAl6VhXPiMVljwh7lou6SY+XDCQm4+FmpJ63D7xAwSs2XB7k1Rv5RXhHC8eHXVzUMFG+VLO2JwLESxwsB61wpkLSAWOmJ1VqozTv1GnBrQIFI7rORcvbT6z646nnX7pdx/5sflwds/VkWMe6GY7V+nV/ssEii6H0CnWr3jzqDMdiHRPR3dTq1Wggbky/ROOuveYc0QiVacQS21PWX5gjo6Io1EoCbBYN4u1gDd10QWTGyFN5brqf3Osr2tyOW5wqpb4G1chHdvqxLBkzTuhltAVEHxGTi3jSvG1Mr1VJIJ+p3sh6ZSaRrMQKQkYWUI5T9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5457.namprd02.prod.outlook.com (2603:10b6:208:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 22:29:54 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%8]) with mapi id 15.20.4778.016; Wed, 15 Dec 2021
 22:29:54 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Subject: [RFC 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Topic: [RFC 4/5] libvhost-user: prevent over-running max RAM slots
Thread-Index: AQHX8gNI53k9Bg5QmEieESPv2JrCRw==
Date: Wed, 15 Dec 2021 22:29:54 +0000
Message-ID: <20211215222939.24738-5-raphael.norwitz@nutanix.com>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
In-Reply-To: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85e522b5-dd2e-4b4c-a455-08d9c01a6af8
x-ms-traffictypediagnostic: BL0PR02MB5457:EE_
x-microsoft-antispam-prvs: <BL0PR02MB5457707C7DC3A260CEA95746EA769@BL0PR02MB5457.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8kgYyxImiaYVa1wVEMWCWn3J6HY42bxW00m0Y+6KiH2lwTbQO1dCEJNkAFTGY/kkbAQp3iBZAD57HU38rIXlBWbQVTJqTbn3WUTDv14WGe+5jxn55gOrvzNIlrtNrJidrI/qfL0okapeK4sHkr5NjemotrJvGmATcddpG8Il28/W7gpVyiHmHMFPcrluSTckE0VtEW/5+ztgJ836TKLXzy3gU1mIMJ5EQbP/Pizf+kaNP368RsBI7SNo/W8Q17tVT3G1ett9DJVMMWlvS1TISFgjySQoctMYVeKPnEX4EmZx8GdK8Op/QXSKihaYNvArCnDIj4tYiR3RUtiA27jLgu9GqyqwQpP/ZtvbBjrW55ifqJhrsZq3sjoFLAx7Wq3FH7vPPIaf69Vsxo2mjDLnLjuzPGJi3SrWzd/A9zF9Njqsf37Hxz0sZUcFhcIyQE2rb8ZY/QTm+ijlPFErHBLqPjoIHgUpv4eIUQdIBa4PfYOu53A7CoEZkEyxzvqh1TP3E9gKREaI9t/qXCGtLL7lgBGWYzFJK1+wqlRd/2kyPINFa1LvxuCvHERSfPTKsKFiJE4lRyftCGvoM+70ZTOTqu+48m+YxfGLQKl/HiQLsjdcRSr/2wb309GiU7NktxX91//2V6nceRXAOjOUI+vfg1tfAIYaBLs0NGzq/+LPS3xb7DIcFMNbQ+28ZkXzlvjvJZgvCvganDCXUHblzQvPzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(8936002)(6506007)(8676002)(26005)(1076003)(107886003)(2616005)(316002)(110136005)(122000001)(54906003)(5660300002)(38100700002)(86362001)(38070700005)(66946007)(186003)(44832011)(36756003)(66446008)(4326008)(64756008)(66476007)(76116006)(91956017)(6512007)(66556008)(71200400001)(6486002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?96zjDwAxBnfc+miFQoHUs8qW+9BZ1ZhWUJj323UObmRwf1FZtPvKGhugdM?=
 =?iso-8859-1?Q?x7jfrBv56aduQ6H5HxWXrFcg/Kq0iolllKl0gI3v8BT/JBWFJlbm0SJXxl?=
 =?iso-8859-1?Q?i7x1KByCp2iQjjyli5VM8pQFagrAadZhQNaPwa0BAk2H2ZuCy/wMTdfUvf?=
 =?iso-8859-1?Q?VHYkBTx+4Y+OalechaIdu2NO9UkqZ1k09a7+lmUeRhK3lCfz14NRXHmOkW?=
 =?iso-8859-1?Q?Y9aP8pH1csaZqKIeGLI6vT4ejV9/Z2gvAVrkE2+d5qHKw8eBPSoVgImqia?=
 =?iso-8859-1?Q?z+549qECDctpUD+Kp9Y+8ufXMzfbiJlAg5az3SMrVRM+n34aKHF2xQEPj5?=
 =?iso-8859-1?Q?6TCPND/v9M+PYTCS3FkFkc5S93zgV0VAdMcpttlPSNC/ZoYNawPRJfZW7g?=
 =?iso-8859-1?Q?Kzfi0fa64YbPKgU4a3YwroAaRGhAeUTsorP+25HJrygunnMDCKG3jf/112?=
 =?iso-8859-1?Q?K8yJGDCc4eqATruW/LgjCr1FAzEXFr9NfqZ+YmAO3LjB+P+jD27rsO7J7m?=
 =?iso-8859-1?Q?WxHE85rbfQZqYV8EBTTo9aWkSNZ9/c1IPS+7VKAbjVRGknsgNyCneVyaUC?=
 =?iso-8859-1?Q?BM3lDIk+9yB83zGFyLSAxSUUD4yGCE64HJWtFjnUZ19H1EoACZfjv+croz?=
 =?iso-8859-1?Q?+C1ojyvbkNAydbcJRS5Qxhydqdk5lb8Hu0DIa0pF8A03o6n7S3uAsk9dV4?=
 =?iso-8859-1?Q?STY5Q7WB5GIjRAeJRuOuzGAeFGa+7jn6aV4/d1XhAzCqvXpzwVY+tM+tEU?=
 =?iso-8859-1?Q?y0F0YNSUusEnJGiSQ/JGo/ZXishFBv99eFS4neoBPBkq67qlYX0o/miBxf?=
 =?iso-8859-1?Q?CXhtlWpXUfujG3K54n9Bnat+DQqds0jU+Prz9PRbVpUr599HUHEuzDliDM?=
 =?iso-8859-1?Q?UIpHy9iehlhzMzS1xP4zURBi/iPjIpMqOHTDptZTkLE41ZomGrWsG+YdjE?=
 =?iso-8859-1?Q?cpHV0RXzlrgNUTI8iqb/AND2Y6d0er8H8SzUsotYQRgBruc3+/U6/5Be8m?=
 =?iso-8859-1?Q?/iQIqN0CnYuOOL4r8FzNQ68lmo+Krk6RZPHn5MifhBXLdRE8/25V1jdXQM?=
 =?iso-8859-1?Q?OYprcE4KubDIc/uDl5i35eDxQb/oMvHJebCRIZU9YN265Bu/iUwunsc7/C?=
 =?iso-8859-1?Q?EEa6HIyr+LBKtMsft3aSCEKmBXZuVXCxvD6VhhBrs/RXX+oygKLq41inRT?=
 =?iso-8859-1?Q?cqJ0tnmfIrl1NHQUX5yoi08N15ifiDj+Z6KeKbsWCfI4AQ14G5BqnT34Ky?=
 =?iso-8859-1?Q?taE96m620Fa40PpLzVo4F1j+F3dhC0F9NBOviyAXzUlwjJh1ejASDLYjAA?=
 =?iso-8859-1?Q?h04e+GN7XjMUYwbJKdMRWWTXNFyKUz8McBx6e+pSgRXS+peUjK2/JwwEtp?=
 =?iso-8859-1?Q?NkRX7uqWJiLh2ykJFQsoKDLBVLJET9YErqWTEWz6JOAh4/53NfBtFjJXtn?=
 =?iso-8859-1?Q?25lrjoDsmONRL+yUpdEq3uurqJkEU8KEEv17BhxYLO6sJInH3myHxp2Yvb?=
 =?iso-8859-1?Q?YkaAMMZSOKMph65IH1fq3rEVNpgBpKDbpT8T29ju8zd1v3pf9w2crwcLTf?=
 =?iso-8859-1?Q?pPiU+GfH49hTKon2q0F4FyOAEqamzhyvQrGWM+t5m+MkYH9Dn/dY5Gyz/5?=
 =?iso-8859-1?Q?YNkqYT6J6/kv/83No4Z7+3xZ9N2aesURF8OZynMjKJgQAzBpX1c684xKVy?=
 =?iso-8859-1?Q?domwVLLnQK4JKsIwcLpfpkUBa/dY0wgd6dy0XLucFeiPgYRX08rI4TxQ8B?=
 =?iso-8859-1?Q?B2kG+m3pEn4XO0jgpdNsED7aA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e522b5-dd2e-4b4c-a455-08d9c01a6af8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 22:29:54.4694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Zqxzs5cLlNQQKAYrIxq6v0b1s2xaYjMOZSyrdpcoDJgY2Pw6QZO1ZAX8aQejkInO/I/rPSa0BZnq308LW/AyoiUrzZRQfWXgX3bqcLo7As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5457
X-Proofpoint-GUID: T1N_RgN1rAqBeDWigQUrj14CHv0NE1uP
X-Proofpoint-ORIG-GUID: T1N_RgN1rAqBeDWigQUrj14CHv0NE1uP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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

When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
libvhost-user, no guardrails were added to protect against QEMU
attempting to hot-add too many RAM slots to a VM with a libvhost-user
based backed attached.

This change adds the missing error handling by introducing a check on
the number of RAM slots the device has available before proceeding to
process the VHOST_USER_ADD_MEM_REG message.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 subprojects/libvhost-user/libvhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvho=
st-user/libvhost-user.c
index 714cc7e08b..74a9980194 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     VuDevRegion *dev_region =3D &dev->regions[dev->nregions];
     void *mmap_addr;
=20
+    if (dev->nregions =3D=3D VHOST_USER_MAX_RAM_SLOTS) {
+        vu_panic(dev, "No free ram slots available");
+        return true;
+    }
+
     if (vmsg->fd_num !=3D 1 ||
         vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
         vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
--=20
2.20.1

