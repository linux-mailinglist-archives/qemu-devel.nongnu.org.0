Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8348A30C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:38:15 +0100 (CET)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Ir-0006H3-FH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73HP-0005Fk-Pt
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:36:43 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:64746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n73HN-00013T-GE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:36:43 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AIjxJE028947;
 Mon, 10 Jan 2022 14:36:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=B1rbSCiqcVJbT+7sKP46eihhbuKExsDL0VE5BOuZxq8=;
 b=HntZ2xMmmEQE/OGWLMcMxRm2mQFlW7uCkC5ywK625bPkje/XCMDizOgxnZinsZlLUkR+
 PcSDoATkBnF2zPhL0coMVtmr+sfQbJQVd2QQ9XEKb+HfI7A5AruBHtECKEb7cQuENsIV
 tEopu9i+bdFH9iKLRz6mBxocVpB/GA2Cc1+rbkNg72mVz1nPRPDWPucETOyDU43LUPdg
 C8DR4RvL4H7cGIZ6/mxOY31rGVlpd9wifpLePk8eWlCmZAy3ztDdULIFcytKv4D2tlns
 qLSQIxYHHL/0KIWPSUQawpg5flOikj+0R/KpXQgvOkHTAz6GoVORXY+YS4VL5gZIFAX9 AA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3dg9rtt3h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 14:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3ncrcgBciMwtH+dsP7d2zJWwbJfnz3vbed761R+5TsaheXfKjBhWNi47uoCC6OoOS5KJq9uMseCLoKmb/TMixSLdDMcVSC8DWcdEr18t7X/OUU3bF6U4Gqd6IB2MU4+Mq/QkfY9Yg9lSh7uyYmNOZHu81IXFOzyyB/pxzolYYz99Iyh763fgNKZtES37q2GsEvx5YMKpEGwskRP+0QPR12wrn1PJY2stkp046xXLMdLMiyxcXyrCbuus/a8EV1YzWaPbjl34Yn+CxBUoBGarlE5YaJc29EAdwSmvZLPLwwfEr7yC6j6bgyHQc7sXHhcwPh1FlX74cQTchmSFMEkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1rbSCiqcVJbT+7sKP46eihhbuKExsDL0VE5BOuZxq8=;
 b=adcGyN4kMNvTCI5L6T+bRGg57av7186bDO6XV5WYZXdo47GGoDT4/toeJuPweWfLT6KiX3adpDVpMzsMZEV1VEKZ90Iofxv9OKz5WJLUfb8qBwlagZf3yS/iZvBVLG1rV9GgDpqCqZ0YNiU3IGief1/aaeTXMCR53E6O0YhT8FmBVR8+6jTyS9lZXu3friIqRTQyZONRWsEJpQuyfc9ab9mGuOpuZ+1ZGSWmdEuX3HMVL2Ffnc85XqCMcFLo6e1OyfX1PuL5U/tbKOOEwh0sTcaFSbQPqJc4lo1ipoToflQxhEIdIWHAVwRkdfAHujb3E93v8wqXStCzF6QVWNLDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB3746.namprd02.prod.outlook.com (2603:10b6:207:3e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:36:38 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:36:38 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/5] Clean up error handling in libvhost-user memory
 mapping
Thread-Topic: [PATCH v2 0/5] Clean up error handling in libvhost-user memory
 mapping
Thread-Index: AQHYAslCTexIUVU8PEm04h1374z/dKxb+8UAgADjrYA=
Date: Mon, 10 Jan 2022 22:36:38 +0000
Message-ID: <20220110223629.GA7976@raphael-debian-dev>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <552d2d59-9be5-83a1-9871-c140db768d80@redhat.com>
In-Reply-To: <552d2d59-9be5-83a1-9871-c140db768d80@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f05d9e3f-b11b-470b-d772-08d9d489aa8b
x-ms-traffictypediagnostic: BL0PR02MB3746:EE_
x-microsoft-antispam-prvs: <BL0PR02MB3746A1626106036015EF3B6FEA509@BL0PR02MB3746.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /7kG40oGiLn3I+ocV7gDUCQmVg8g48mt6oQOOmNdZp/kadXg9lRf6iM5YkSObmJtNg+11o4N6aA125Rk4qdPE1BoN3bZvz20mzaUMAMB+Sn3Ybt7LnAhVbTwLZcU2DgwIlg2merV05bFfdqplSQcotXAFR4up4EVm5rT8J2nuXLj8UG8h2GeGLZUqccpn3riKWWxTrwC0vpuDrmGYkwWKCbm/cuDXbflWdhbNH5mRgAApkxtiQkjX94GX2knKLZF7vy5gPlcjX4Gv6u4iCVI6g04wTFxsQdsSn0wUhIqZeuMhD9uxzmFo/8GA3mhBepPrpuUmcX9MNm9hlYTQFsqRFskf2OFj8O9hiTvU+V9EFbj75vT1ORw1nEMgVIF9Mv/UNGMecpI4L0EqYl5MrWh2DcccoDVUqYAb8isc8hVaD+jkR20XCgWs73QWLz57/nWFyWdKAP0Qv9+5vhHTA/9FJs00K5p4Acylhb3UzIIT08UtdvPSsCzsf7n1W0gtzt0IePg8Ki58JyHbos1QupP4wS9LlC7CJhvLxRcmZv/ZPsW/d5j+YAgi8d1AhJaPgxsKexe36B41upSeFDYRgL6wYmYAX3hzzaprSWex3oqnucsd1W+eml1AjzTvE2gUz1MoXC7mDaolTEnwFss6DkXcGMYCDMRZfe3p3PvO9j+marhzBrLjqvncYLM47bz/06Pc2FvZaL3PuLs2o1a03FKVfrxNVXVeJkgKsshhfUq6ZUtW6Pzg1PEi9u5M5YqgdgtdsN9/VEEMGkzemKAA2Ef/8leOe1ChdENbrVkHNdNMLs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(53546011)(66946007)(76116006)(91956017)(38100700002)(33656002)(122000001)(316002)(2906002)(66556008)(66446008)(64756008)(26005)(6916009)(86362001)(186003)(54906003)(6506007)(44832011)(4326008)(8936002)(508600001)(33716001)(5660300002)(8676002)(6486002)(9686003)(6512007)(966005)(38070700005)(4744005)(1076003)(66476007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rxQ9uRzAW9fppYHsAnkCqGwbJpPygJNJU1XtWxs59+w1OxI8Z/AzV4lLH4ps?=
 =?us-ascii?Q?himsusPTAp4pWGcMXCPzxVzBh3oNbUF07ERztQKcCtWCK55d6xYEWL6N0j6F?=
 =?us-ascii?Q?cevbf9818chCb9O1n0CDeu/YHIkL1yC53DQRIExIn7tnSJjmHLTYd4u2JWlU?=
 =?us-ascii?Q?MWmf65pQDmxL1qNJ5+/aV0eDinN8poPZPKv6fJFqSLrVixDjbQNx625oWmlA?=
 =?us-ascii?Q?qP6gmuswW0gOvSPDTumI6PtHQTvMKTKueUJwsFQfKLBJld49aVWLs9KG/u51?=
 =?us-ascii?Q?EMkSA1lZeXrJz++NjxM4ZG1gpFb8IYv9UzmcL8W7qtD5GR0ppkyQQF6YJw/d?=
 =?us-ascii?Q?CLCvaC77MsJRJBFFSjZfmDKk0BIOpvJ9YQ3bhZwZPRPJXnH9f04RFKQY//iw?=
 =?us-ascii?Q?sil2husnqk9Xecs94+0UCx8Z0IKvhl1LlBAAmw1Cm6seVUlLh+3kchTAf7eb?=
 =?us-ascii?Q?efUfTD/Ca5Q6da+ViwUVWV6Gq236aTI9tmcFRZVjZ6QUtdChP/RNyMfT4Emu?=
 =?us-ascii?Q?4S6M6sgpNNbWU5WuYMEsaG0L4ncoFl/uHjYv+2bavMImnQCDRIgybWbVviCQ?=
 =?us-ascii?Q?08MZJWCUC7iwaOEZaf5T5VCtFp68gSmwWJmIk4UGb5mu3Gx/xspfBkJLvKzL?=
 =?us-ascii?Q?JZV39q7cdkK7/GLmeN+VwYWFx6VP4lAUbgeBHaIcQBIFHsJzN+t+DkSXbcHH?=
 =?us-ascii?Q?HlskWjK+3+fSjmeGPzN/FKFDbpEbCFB3o2z/9EO04dkB4EnV9dl7PWMLW+K2?=
 =?us-ascii?Q?36msyia2eKUmr8kBZ39UUCxamiW6B8OgnArObmBvaIwt4FFEW2grbdfg1X7i?=
 =?us-ascii?Q?U7m9Vvy3N86pwiOc9pR3bpg9WRGl1KHAh/vdMOfBpbqktTiJ3XfVWYUzy40m?=
 =?us-ascii?Q?oqQIyOt4l8aOKhv6o0s6n/T1XOUQEGfyY3WLe8ViSNo3JSWtvEGCpbwWpAg+?=
 =?us-ascii?Q?ARyBR4R3vurHX847JJAPOm4VpuJ9PfXfW7sc/EJT1IkUX+D+iq5lNQXX4Xlh?=
 =?us-ascii?Q?weiWt+NZdEH0NYIR5M9YwiSe41Baexm0sN3tkWoQCRGpTC6nKDs8ryx/oI78?=
 =?us-ascii?Q?X8PW4Y79qJIlfYPyIsmfbgO5OzPgoDsYZSYnC9aJlotAMklkq+QlbDEqPwR2?=
 =?us-ascii?Q?S49+N84MeENT0J3izuVjsMtm5iXAqPxEZTYomtxuXSSzespYfCbO+gH/OE2P?=
 =?us-ascii?Q?SfSlZlCJlKIkEsiGiAfRIMLe0FuIFnKACihalpcfGkTMa5wzXuHf1vAWyUVt?=
 =?us-ascii?Q?M72HLHdyThBDAjG1DgNmdfJxMmxO5dGmeij+SM4YqTnputlscu3zrUw1ofOt?=
 =?us-ascii?Q?rqMdxx+83t+ExsI/wcW7I7S5morvr79K6UzfHvIETWbgUa8rqknsUVb5zRBD?=
 =?us-ascii?Q?QaHDmY2h4zj7KnI2FwJs4+c01kY2QLZSF0nQWb3B+lqkih6D9qW+v6G2+Axa?=
 =?us-ascii?Q?IIGAteOdFGDeY4kwGu1v9SoAhklOchMjHw0KfJ1KpMAWiynVw05wGEKTcmof?=
 =?us-ascii?Q?Xy2i2aeI9MbvaSUZpYT7T5gdUjCq3cFkRMGvXouzmTAbSMHjj63hfqZfChyJ?=
 =?us-ascii?Q?wy2X+oGo+D3FVBh5kwLYU/6wrrAn4OF3AWePaG7oevLkv7T3zKOe05WA4rcJ?=
 =?us-ascii?Q?bZHqPCP6jSStxJEXvfhXkPYWUh4ROttF37+tY9ZSKv95Ieyc4rzA8zZv+8qG?=
 =?us-ascii?Q?WUvVSKIei+CcwuEp8DMW3qapiaI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <706ECD06770D754280CA4C74873F2F36@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05d9e3f-b11b-470b-d772-08d9d489aa8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 22:36:38.6222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVc7TAXIXqjhkWq+0/NKeuXlLVbJycdp7THhUmrN4UJFjBCs+FRgDwLPZGxCr50dB1Kp2HA3YrQtkd05P1dP2/HRuWIV7vgdJE6Zr35/TLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3746
X-Proofpoint-ORIG-GUID: lDnmMidEiqIn4o6kAolR0oj2wn9QqUMA
X-Proofpoint-GUID: lDnmMidEiqIn4o6kAolR0oj2wn9QqUMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_10,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 10:01:36AM +0100, David Hildenbrand wrote:
> On 06.01.22 07:47, Raphael Norwitz wrote:
> > Hey Stefan, Marc-Andre, MST, David -
> >=20
> > As promised here is a series cleaning up error handling in the
> > libvhost-user memory mapping path. Most of these cleanups are
> > straightforward and have been discussed on the mailing list in threads
> > [1] and [2].
> >=20
>=20
> A note that we still want the fix in [3] upstream:
>
> [3] https://lore.kernel.org/all/20211012183832.62603-1-david@redhat.com/T=
/#u=20

Ah I thought it was merged.

I'll add it to the series to ensure it doesn't get lost.

>=20
>=20
> --=20
> Thanks,
>=20
> David / dhildenb
> =

