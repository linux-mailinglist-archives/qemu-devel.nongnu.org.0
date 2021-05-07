Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56137666D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:53:11 +0200 (CEST)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf0uk-0000Qx-Dx
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf0tc-0008Pg-JT
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:52:00 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:26420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lf0ta-0000Wq-LG
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:52:00 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147DfwHt012238; Fri, 7 May 2021 06:51:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=proofpoint20171006;
 bh=sZxXbz6/v5ELu3LPUyTeSV+Llb7aaHAODUlUlRC+Wi0=;
 b=nw381pUAfA+EQRPGEfDMyac08nL3v6NhIejrbyYfJU3cJQJzOTiilSd+XPitERnKA8PT
 ma11Hf9RDxVqdj97YdnSppSzgNN0oNP6GUrsRiALChRI0DgftGgVks2p/trdl3qiDzgT
 IQm2eg9grKA2fpgxxJijEmkySVn2waRBVGL7teHJXOzkbY7d+ZRr0+k2dLaKD/lik1LM
 eflsC8diuGjV9NT+TKrUXGhGybv2N08YQ6oN5TE8sOiG5ctEfVCP19+jpyNKd3mKeuXY
 4AMFIj9uZ3mK5oFvVVQZSjaktOGQrplQ89R1orJ76MQp8iVgxPkVz+lTvGRY5AtFoOu5 gA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0b-002c1b01.pphosted.com with ESMTP id 38csqpsbnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 06:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvZ8WBajn/1ri0fePTTnciUbxdvDHvJ7cy+wmokrSBlSqLzckhpMn5i3ArxeA3Zg9omrlM9GB3ra9kY1C874rdn5IyoZ4yCKkXom9uEs0n4bg/d5lp7SPP1gsUQzCzHjoJr+lIiPRJeJsMtNS6sYLpGxpR/68YXmTEcC1/hbqeNsh0GGsQlqj/SmaX858VqvmAsJnDIlTH6NpE+UHNY6J4i3jh9SNvCtJ7ujja5Xg/XW0t10Hy4p832z5kUZ1uDV4OEShiolZCHY5RI9VTJbsv+hcUz9Sx6DDsatQe1/HSm/COVLXZK3Wky1vvzfIOFZlS21BryvbMI4sx5X87vkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZxXbz6/v5ELu3LPUyTeSV+Llb7aaHAODUlUlRC+Wi0=;
 b=X8pt6UFY1UgB80bRjyrF2SBawKlTDp+rVjUMVojGXvTfimLnsqI/oAiFMhg8KheH+tZQEKHbHd4J421q6CXLFg0xQMOC+8uY/xqjfeor2jXgjbp5XeKihokXv1fCP4FV23Ga72Hjd6Jsr/tbnt2UJ6YS/nDghFq0n4fhCQdWCtJwLyEcxeOQT8yRWl1SDOM/o1GLUIoBUR+wnUoXzl7pMzbiDVlCsJK9mZuaAEmvitpePZxc+079T9uoIKMRkR9vdLvpyBmoDwBPPbiZQ8bmI7YeNxKCfULOoxCLMmOcEzIA/5zPExFozW3jC1Ko4WOmdL730Vccd7voaC9XCnHDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32)
 by CO6PR02MB7844.namprd02.prod.outlook.com (2603:10b6:303:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 13:51:52 +0000
Received: from MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797]) by MW2PR02MB3723.namprd02.prod.outlook.com
 ([fe80::3591:14f:bb39:4797%3]) with mapi id 15.20.4108.027; Fri, 7 May 2021
 13:51:52 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: question regarding QEMU adding overlapping memory regions to VFIO
Thread-Topic: question regarding QEMU adding overlapping memory regions to VFIO
Thread-Index: AddDR/aFSv9jmdx9TKe5+OpCTvxxcA==
Date: Fri, 7 May 2021 13:51:52 +0000
Message-ID: <MW2PR02MB3723B94416375A06F6F69BB08B579@MW2PR02MB3723.namprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a254016e-fd84-4451-4cbf-08d9115f44dc
x-ms-traffictypediagnostic: CO6PR02MB7844:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR02MB784446C0944E31C8E85252748B579@CO6PR02MB7844.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VE7nm+0ck9GZo4vOKAEiBZZGK1gEFTdXNNfhCPLAqu4K/Fe5urmmdfBQ1cHoCPNSpfl8PB/o3fk149P9Wh/OyTBRFouzncJm0T+Jebhgs8sRZi9pkbt4mSru3mxsOyID+74I3oht7QuQo/RoXqW5SPORo3d4Hx2VNlWuM339okswBmq2ytbOSKJ81bbZePPcSKMNcGpeLkCG6XHV1AgJq9kkg5NI7YVOMKAVuq+kM0gt83/jFmp8W7ytF3oWLJyUQ9xxYB5njsjSiEAlJjue9w1gx43orUDZUSDS223DHx08JRLYZUQEa4nd2f6RhslgrTEwTR1Cwssjs9Q+IykhY7B+YJNtqO3nULNW/1cjchWAO/Dqtv0FCcWrTipLoChqPSsnUfvd7HZo7vG2cl9RGsYqThGek1cdctbRSPGL3ACNALVN9R65zYLjF6tQDubeFli/9YCdyPqNHK6d36q9VrhE0GTKSfXwizi3MDIeTrSoLiM/cdHNGTAVultg6UlU2vEGTREgCemtdtk7Vb8AOyoU0X1fH5Wm3OgQbjD3NHwWISU5K5hAPA4uqYDz2VGSoVWLu+7dHcmh2gCDLhj+7tXBVyDpYetYQWcnK+OZoPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3723.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(366004)(396003)(346002)(376002)(8936002)(26005)(71200400001)(7696005)(44832011)(478600001)(122000001)(4744005)(38100700002)(66446008)(55236004)(83380400001)(6506007)(52536014)(8676002)(54906003)(4326008)(86362001)(6916009)(66476007)(76116006)(64756008)(66556008)(66946007)(316002)(55016002)(107886003)(186003)(9686003)(33656002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oQLmRvCMdIxMqn3CQ1d7jUm6KV0VcinO3mPVa3XkEV22J74L2NJnnNT1zWGe?=
 =?us-ascii?Q?OsmfLy1sw+tB7ZEsuw3ICE6Wjvd8+MZ6dfQiYiiRy/mrW4Eac5u4maRj6JWw?=
 =?us-ascii?Q?l1eL8+KkTMD4qtmlEUajiEqyNTxtTMMDMLrW7q0myKxDZSzXba0sE+WcId1v?=
 =?us-ascii?Q?bS3q4+6JIP9wPZmYyLFmnbIExPSLArbtUUcWWlHAX6Lbtlpzq/wCbdD2TNYZ?=
 =?us-ascii?Q?4eoeJRhij0gFZDFg3kN3d6ViusfLgsypC/DOsDbRoHLZH4jAZomMx1cLopgW?=
 =?us-ascii?Q?QbLK+qFk9QAqAFwvVbMdPblKWPkWp1iNyj0D26YsuKqv7CLqhC4Fsv61SjqX?=
 =?us-ascii?Q?85Fbqj567xsCbU27w6LsMAzr2a1ob7xgNGFxyypisWUOHn2YlrZBvyHifAbY?=
 =?us-ascii?Q?7TAwpRDu/F8EsYNpMX6JJFc6Pm/8FE96g4gQzjbQ65Iq753fzByXPedZ+wgT?=
 =?us-ascii?Q?CtgmGqm8piTogsTIzbS7J2bQcdWFznUmxAakUGc7qE3uWn+0ztZn4bN7P2RN?=
 =?us-ascii?Q?SSfbBXjqLcNGp++sXaWkJSRtoD/uf660PXwDThVBZJHkE63xGVlG/TGPyn5i?=
 =?us-ascii?Q?XGrdP96VzKvjAgXKP1c16pBm/nXKLqS7O9/5SO9+9FaBIk+ugzbHM/i0MQKb?=
 =?us-ascii?Q?yW2Bn1q9JN7Hj8kbXfsLSN4McgH6AZqTynKHcu2bt+4zbfJUlVfRT672zMvz?=
 =?us-ascii?Q?Pw6SEUnKcd8d83ZBAwyPNNOYfPaxFGik8ZR5fbVSeNrQvAnqAIT43Vr8nKvH?=
 =?us-ascii?Q?2GG19LzWP+sLs4VKSR5UmHOfzEIkG3vFRFJQ5/G1KcdKNKUySgMbstxRw8dy?=
 =?us-ascii?Q?RofN1eVNl6aAh48C45bSrJb9IWHj6uOIPjfERnmf8YiC9iTYhtaw2uc8Yr8n?=
 =?us-ascii?Q?DCaRdJKSeyGu3Pg02aQ2pCzkt1BbuN2xf3DTEomCfy+H2gLq6BaLTP35VpwW?=
 =?us-ascii?Q?Amv6WSOli0hyvX6oMa01YiilI1g4kWoOETJIuaWIdfxQGOAqUW2F+3E9gv3F?=
 =?us-ascii?Q?BN9Crae157WkD9pfj8XFxOnF4ReaZ4PRivfqReY2+S9mA74Iff+ENwWvlgus?=
 =?us-ascii?Q?h00zQE+BFs3Tuvy3LrscKLeFLE0RiXCj8/VW/uAZfrSMEDDVmOCW48xRcEnU?=
 =?us-ascii?Q?26Z5RLZ9pt/mraH3DFUHvglY2Fh27P1uLmfDNIJPN6lhTORiUGbCYmgu7qsA?=
 =?us-ascii?Q?ZzHMdZTIVPm0Bk3iEKh6uyeE/L4ixQNO+qyg0PPPwGLOgDxBiR0XSRIutRn9?=
 =?us-ascii?Q?9kSVukw/53eIruQ+qsEVCRBNzp2kDs4wWDO3LH3vEE+ket/plMi7OO5eZfDM?=
 =?us-ascii?Q?YlA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3723.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a254016e-fd84-4451-4cbf-08d9115f44dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 13:51:52.2600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNFABnMrmW6ojTeYS4mNMaonbCCc63oa8s9nrAMbX4jyctUwT0Zd8vxXAzjlTBIRs1HvZZLkyhUa4B5fHfAXJBy/wBzWa5hO1J+HGRsRpzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7844
X-Proofpoint-GUID: FdNOlc6wIFPuJZpB-NgKkpmcem3rjHUv
X-Proofpoint-ORIG-GUID: FdNOlc6wIFPuJZpB-NgKkpmcem3rjHUv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've noticed that QEMU adds overlapping memory regions to VFIO, e.g.:

vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xc0fff [0x7f6702c0=
0000]
vfio_listener_region_del region_del 0xc4000 - 0xdffff
vfio_listener_region_add_ram region_add [ram] 0xc1000 - 0xc3fff [0x7f66406c=
1000]
vfio_listener_region_del region_del 0xe0000 - 0xfffff
vfio_listener_region_add_ram region_add [ram] 0xc4000 - 0xdffff [0x7f6702c0=
4000]
vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xc0fff [0x7f66406c=
0000]
2021-05-05T09:38:16.158864Z qemu-system-x86_64: vfio_dma_map(0x557b8fd281b0=
, 0xc0000, 0x1000, 0x7f66406c0000) =3D -22 (Resource temporarily unavailabl=
e)

Region 0xc0000 - 0xc0fff is added first and then region 0xc0000 - 0xc0fff i=
s added again? Is this legitimate? What is the implication of this? Is the =
previous region replaced by the more recent one?

