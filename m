Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79477409EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 23:08:51 +0200 (CEST)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPtC6-0004nw-3w
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 17:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0890d8c2ea=lukasz.waksmanski@dolby.com>)
 id 1mPtAk-0003tH-FD
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:07:27 -0400
Received: from mx0b-000fd501.pphosted.com ([67.231.152.235]:10286
 helo=mx0a-000fd501.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0890d8c2ea=lukasz.waksmanski@dolby.com>)
 id 1mPtAf-00048S-HO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 17:07:24 -0400
Received: from pps.filterd (m0000695.ppops.net [127.0.0.1])
 by mx0b-000fd501.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DHILRa001458; 
 Mon, 13 Sep 2021 14:07:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolby.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=DLB21-02-2018;
 bh=bBxhhIo1cxEe0vV1HMOtkA1ZujVhJ2PYtLA6kJf1hYs=;
 b=Wc1na9aLChFJqadf/bg+ZUxefKUAzdU5UmBDWCvU2HXWsO7r4yaX4U/3yEwRJ4x3VVPG
 bZGs7QlZmNK1WRcFAuMCqMM/SK4PfB+8k1mru515rI/CcI39GtHQHcsaVhbfcKQtmdcj
 lCODWQDk+AZmmO+GJzt+orkbOS5KvB7Zt/XE57EbO9FCx6dMo3H9saqg9Bk9g5EyBFVJ
 e6MEYdubtznJsNCi5lzJXPvL+Apkc8bL/D4hxfwxIr+9kNGe8xKl8/Qe6owhpujKuQM9
 WkoWT7GC5vr1xOwdSvwWgOCigDDO+mBXy9DB05weZzQZxtw/C0DVlSU8pyQhbENofXPV EQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0b-000fd501.pphosted.com with ESMTP id 3b282y16e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 14:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ic42eOD2M19fjL9SSZQBL5IMmi3wO/I9zFi9UGp/HeqIBXDQp/1aEzQWhPkE9DG4l3sh5LyJJGpRtg2Bwq9lUp9yi8Fu5XwMrdkhNzlXDc4VwtcODBxBbfZNaCKW2oXNE6GrJ3t9qspS/McoAbowEjUebtV58mLbEfz4sX5syO0I6dptZtWpGpp9QtYy/z2OVoyj7qUHQbvJtq5UGaEJm6TQxRad6Awt9mXzmT36vrUp4pgB4hCfIdpIM8QcZddiWaoSfnd9wrTHEr0hpQZndYB016w5BLElS1nKduOfwqVgzjGk+6LW95viC9jMul6JqBQKwOb2u2qNIEVoqPtdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bBxhhIo1cxEe0vV1HMOtkA1ZujVhJ2PYtLA6kJf1hYs=;
 b=GJ3lq7vR9QMGhdvAcZbmc9K8ba8aMjrU3x53thMaxkiKdvI8JivV8S93DCukvMK+YmZZq1/Y2bga4kvWm3Oc3aeff96/Q97Yy1nmRm6ceJyQwCM9aKllnP8zeFskS7xDGwg9KqQ6d+NBOhuNrU3Ayac9F2Q1gfbRwGZJLByL1WQkw0UqKvQEgg4V6COSTPiG5mpzuYVXGf6tnJK2dVlHDBDCR8V3uLrsOwueYL0+bsdumtSc/+f+LxZ00FPFJvMO6m2DIFcjCbgpsEVOdOmphYlB0EgPSd8p1r0eDJneFasTLd2Gsxf2iq90xY5q6Nnf7jjR2CnB3HBuQhB1myC5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dolby.com; dmarc=pass action=none header.from=dolby.com;
 dkim=pass header.d=dolby.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolby.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBxhhIo1cxEe0vV1HMOtkA1ZujVhJ2PYtLA6kJf1hYs=;
 b=c3v2pN3unlVRZgMGOS4IiOLvnLdoRjLcvRxoBzT5XdNngVg3qjPE4lPB4kNMPU23l3of8mEfYCRZ4fTIjNYOq3gKQoc/x3s/DIkuAkZCUKCdeVrN4kNOWt+21dDvLo6SGeOK6VqeODa+UIq+SN8E/1wccqxjs7rc/6aeBQY5YAw=
Received: from BY3PR06MB7922.namprd06.prod.outlook.com (2603:10b6:a03:3b5::9)
 by SJ0PR06MB8311.namprd06.prod.outlook.com (2603:10b6:a03:388::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 13 Sep
 2021 21:07:10 +0000
Received: from BY3PR06MB7922.namprd06.prod.outlook.com
 ([fe80::f130:f9ed:5a4b:4267]) by BY3PR06MB7922.namprd06.prod.outlook.com
 ([fe80::f130:f9ed:5a4b:4267%6]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 21:07:10 +0000
From: "Waksmanski, Lukasz" <Lukasz.Waksmanski@dolby.com>
To: Brian Cain <bcain@quicinc.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [qemu-hexagon] Error mapping file: Invalid argument
Thread-Topic: [qemu-hexagon] Error mapping file: Invalid argument
Thread-Index: AdeozIwi+cc8yHW7R+a4XjyGoi0IxgAEBf2AAAEfmsAAACbFEA==
Date: Mon, 13 Sep 2021 21:07:09 +0000
Message-ID: <BY3PR06MB7922A9D183A690D22CE02098E0D99@BY3PR06MB7922.namprd06.prod.outlook.com>
References: <BY3PR06MB7922F6CE4B3A9CE21294B359E0D99@BY3PR06MB7922.namprd06.prod.outlook.com>
 <2a203934-a688-f879-17ca-2c59ec40fab0@amsat.org>
 <SN6PR02MB4205F58D299FB23AE59105CEB8D99@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4205F58D299FB23AE59105CEB8D99@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbHdha3NcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04ZDgzYjg2ZS0xNGQ2LTExZWMtYTEyNS0wMGQyYjE2M2RlYWRcYW1lLXRlc3RcOGQ4M2I4NmYtMTRkNi0xMWVjLWExMjUtMDBkMmIxNjNkZWFkYm9keS50eHQiIHN6PSIxODgxIiB0PSIxMzI3NjA0MDgyODE5Nzc3NTYiIGg9IjluVXFzR0lWZzVudWRIRHFvQUZBdDI2TzVaOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=dolby.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97c4209f-15e9-4266-9ebe-08d976fa737c
x-ms-traffictypediagnostic: SJ0PR06MB8311:
x-microsoft-antispam-prvs: <SJ0PR06MB8311C94406636FCCE65786BCE0D99@SJ0PR06MB8311.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cLRBkGAzEAoJKVmwfnEIWgUyDsh8SDznKrGxSmDzkqe7HYP04fPpB/lToKuGj0woskdHwsceUkQH/EPceahm6HGeYm/jqa7JASCaoDrj9ffZFTyHMs0tYaQUiUSsGbhsjooOf+JOqnHUWV1oLnpvsJsctsO/5KFvIh5rqVFAgQFTKe1JudKPsRv1UHB4J2KnYvouod1DCEsJkmjKavmlfrJMercfMfIma/lsAFKzrStY9xtq/YjwTxHscyFFlnzHNNPJfBAwxLjv0AnM501k+ySbYTCPr7SuYIacctnmo1vTZ6TeymkApKhc8N3rYzxfyTmlSdVD8KxyuqInoU2mE/PYMWYIBctPS32iSs8NVEZWuqSEHJB9Okx4iKoqCsOK7BBdVS36e84uQ35/in7pHoTkc7SAbirT3A0AHaTS8kcPyw8XGvAkh7tL7G3Ijolo2RSxSokD+v3YB48WzEou/58sRMd8FRQlChZc7qIY7T81PSSxVmlOgbFPbtvswzzCeYd2X0pV3/THxd1eYGC3DuK4K1HMySHeh6fiMPdkk0Q7tUgE+N/FTkWz6Gp4dgum7NcswPL809VoecCzVExX59bxG4y461OTrDDnx2ZLb1kRJPvqIlaMqDDFN/swZoY2HPxFXX8ySwwMzqZJ2BnfoB6rKLSvneE3ERkx9wvGV2TLnKDgL9FVOTU6FduUrUfmjNzTDptjNzUSyUl0ix1ReMEbOQT55hOjY6QQQ/N5LPrpLI97nr443V8XnVFlLggaj7bTorJB1agU0c3d7dLyeKGMaGE7F9DZunx9zdOZp6c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR06MB7922.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(8936002)(6506007)(71200400001)(66574015)(966005)(66946007)(8676002)(55236004)(64756008)(4326008)(66556008)(122000001)(7696005)(53546011)(186003)(26005)(76116006)(38100700002)(9686003)(38070700005)(316002)(55016002)(52536014)(110136005)(508600001)(33656002)(83380400001)(66446008)(2906002)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cElFdmNpUjN5aHV2clF0MW9FMVI4R2VnTyttTXYrN3JPT2MzdHRlZGhORlVB?=
 =?utf-8?B?VVBRNnF1WmJzWkw2K3M4Z3JoSWdCWHBPTnhDTlV1YWZEcjQvNU9IWnNDVm52?=
 =?utf-8?B?YWFFK0F6VGYzSUdkNGVIY1pLaDBSSzUzOXJkWnlSdGt4NVNsSWpJVnpTWWwy?=
 =?utf-8?B?VUJramE2R1FiTnR5SUsvM0NEYzZuQWFVRXVoVDVKbWZqVFpMT2Qrc1Z4TlA0?=
 =?utf-8?B?eFM5OWJiMXhHczRjL2JwZStZTXJOZGhFcjFDZkovZVdNOFkrV2FwZm5XK1BR?=
 =?utf-8?B?YUh0RFNPWlltdFlpRXk3VzNUNkJwZmZ0Ymcvai82Nm5EYnpLcDd6LzY4c1Ja?=
 =?utf-8?B?dFNPb2w2dDRER3prTEdCUVBFMmpFL1FGblNOMk1vSm9oVlVlL3JWOVpCYTRL?=
 =?utf-8?B?MmNHMmlObFhQd0daVW1ZbVRvelE4NVNiclRsRzY4L2l2cVJZY0JKMS81UnVS?=
 =?utf-8?B?OVdOOVNPZ3h0RmR6L2Z4Rkl0NXQwRXYxUW03Z2NGVHpDWWwxdmI5Ukd0Ly85?=
 =?utf-8?B?WEtVREFjejU1azBHbnZtRzVESkpSTnZjNEVGYUZLdVR1bFNpK2xjNTVkQlBY?=
 =?utf-8?B?aW1PRVd3YXVnVHJ1ejdtTHA2RDZvWGZaTHBXZSt0OFplUG9ZRUxUVjM2NUMy?=
 =?utf-8?B?K0NaMWZ5bzBTeXo4RmZkQlBKMWtSZmJLb0ZjNWp0elFLbmRMckJQeDNvMjNV?=
 =?utf-8?B?bWUvNHloZ2hmZFUyRlNjM2U4R2gycTIzV3NtNFM2QUM0ZnRUOC8xcEp5YUNF?=
 =?utf-8?B?YkUxaUlWaW5OZ3ZWWFhNZDZvMldPSXlHMTgrM053T2RxSmhuZk5kYVRHNlhS?=
 =?utf-8?B?VitnMi9aU3VmVkIvSU1mK0wvbTZGb0x4RGFLejh3V1pLZVZqemJzamhaZWJW?=
 =?utf-8?B?US9hSE9SWk4rWkF5UURlcmNhZ2QxMHYrM09SZ1ZhTXFiYm40NUUyeTNCVWw1?=
 =?utf-8?B?bXBGclFNaStRbUxNMDFNVUVoZFBqc3pscmNTZURTbjJCN0FrNXlva2E0ellK?=
 =?utf-8?B?WURnS2ZmM1dGUnloRlVMeVVyRWh2QW1GdzJnVHFsSnJXcFNWSUVjeExKMExH?=
 =?utf-8?B?N1RId2pxckhqMW5GTnNvQTc5V0xuM1NJbmI3RHh2ZEZJbmZJczM1QXd3WnNv?=
 =?utf-8?B?SzQ2V1M1WDJjT0MvenBzK3ExdWFnQzZzMnNRcS9sUlMxVHpTZldFcWhUd1c2?=
 =?utf-8?B?ODJMNGJwSVdVdTNGcFRsckpySWxwZzFBV2tPQjJzaTcwYXJCbjYvdnMyQ3JB?=
 =?utf-8?B?SmswbndsZ2RiSjVxdDR3RUY1VXNyQkV4ME5EblNZc0lST0V4VGMvd2lkY2li?=
 =?utf-8?B?Z3dsdm84WEVOY1VpZ0Q2R1BvYXVQSnVMOWhPUzhjcDJTYVZoL25nZHBmZ09l?=
 =?utf-8?B?TVBXUjd6dFF1M2RidUpET3JqRFBOQWFvSXVpUnFLVzZOU1Q3WnFGT1VmMGFP?=
 =?utf-8?B?QVRlRE5Bdlh2b2FOMC8rTG5RTzBMbWxsOFV0YVRhQXRHUk1LSnJ1c1c0aEla?=
 =?utf-8?B?T3RhWGloYXkwejF2NXVEWU1uM2ozUDIvU0xCdWtKOThhZWF6aSs3V0hDUHRU?=
 =?utf-8?B?dWd0N2ZOaU9IbU9YZitMRGtUSWJwd0ZXcEJKV0JPK3VhckQ3RFVKRWhlWEg3?=
 =?utf-8?B?MHl4QzVEbE85QlkwNHFhbUIyNjdyNUlTbUY0MzY1TVVvYW1xNW9leENZVUx3?=
 =?utf-8?B?VHExWjlqeU56Z09IY2RZckMvV3R2eFA4a3BKNW13MlJSa3p2NFVFNHVScHF4?=
 =?utf-8?Q?LdFlbHjx/RIpSSeRGas05XSTwBbX2+Yrwvj9kSK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dolby.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR06MB7922.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c4209f-15e9-4266-9ebe-08d976fa737c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 21:07:10.0158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 05408d25-cd0d-40c8-8962-5462de64a318
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pa4tlxcpFrz+GOUuIAaDU/FtrVejvLN8Jrwtt4AkDOV3mCiUYfDCfepc4tCkgxUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB8311
X-Proofpoint-ORIG-GUID: bfrlYkpEh9VNvzOnbCef4q0jrmtF_MKT
X-Proofpoint-GUID: bfrlYkpEh9VNvzOnbCef4q0jrmtF_MKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130126
Received-SPF: pass client-ip=67.231.152.235;
 envelope-from=prvs=0890d8c2ea=lukasz.waksmanski@dolby.com;
 helo=mx0a-000fd501.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmtzIGZvciBwb2ludGluZyBtZSB0byB0aGUgdG9vbGNoYWluLiBJJ2xsIGdpdmUgaXQgYSB0
cnkgdG8gc2VlIGhvdyBpdCB3b3Jrcy4gDQpIb3dldmVyLCBJJ20gbW9yZSBpbnRlcmVzdGVkIGlu
IGJlaW5nIGFibGUgdG8gdXNlIHFlbXUtaGV4YWdvbiBhcyBzaG93biBpbiBteSBleGFtcGxlIGJl
bG93IChRdVJUKS4NCklzIGl0IHBvc3NpYmxlPyBXaGF0IGtpbmQgb2YgbW9kaWZpY2F0aW9ucyBx
ZW11IHdvdWxkIHJlcXVpcmUgdG8gbWFrZSBpdCBoYXBwZW4/DQoNCkNoZWVycywgDQpMdWthc3ou
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCcmlhbiBDYWluIDxiY2FpbkBx
dWljaW5jLmNvbT4gDQpTZW50OiBwb25pZWR6aWHFgmVrLCAxMyB3cnplxZtuaWEgMjAyMSAyMjo1
Mw0KVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBXYWtzbWFu
c2tpLCBMdWthc3ogPEx1a2Fzei5XYWtzbWFuc2tpQGRvbGJ5LmNvbT47IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZw0KQ2M6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NClN1Ympl
Y3Q6IFJFOiBbcWVtdS1oZXhhZ29uXSBFcnJvciBtYXBwaW5nIGZpbGU6IEludmFsaWQgYXJndW1l
bnQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbGlwcGUubWF0aGlldS5kYXVkZUBnbWFpbC5jb20+IE9uIA0KPiBCZWhh
bGYgT2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIg
MTMsIDIwMjEgMzoxOSBQTQ0KPiBUbzogV2Frc21hbnNraSwgTHVrYXN6IDxMdWthc3ouV2Frc21h
bnNraUBkb2xieS5jb20+OyBxZW11LSANCj4gZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgQnJpYW4gQ2FpbiANCj4gPGJjYWluQHF1
aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW3FlbXUtaGV4YWdvbl0gRXJyb3IgbWFwcGluZyBm
aWxlOiBJbnZhbGlkIGFyZ3VtZW50DQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0
ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQbGVhc2UgYmUgDQo+IHdhcnkgb2YgYW55IGxp
bmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBDYydp
bmcgSGV4YWdvbiB0ZWFtLg0KPiANCj4gT24gOS8xMy8yMSA4OjM4IFBNLCBXYWtzbWFuc2tpLCBM
dWthc3ogd3JvdGU6DQouLi4NCj4gPiBSdW5uaW5nIGluIHFlbXUgcHJvZHVjZXMgZXJyb3Igc29t
ZXdoZXJlIGluIG1tYXANCj4gPg0KPiA+IOKenCAgfiBxZW11LWhleGFnb24NCj4gPiAuL3Rlc3QN
Cj4gPg0KPiA+IHFlbXUtaGV4YWdvbjogLi90ZXN0OiBFcnJvciBtYXBwaW5nIGZpbGU6IEludmFs
aWQgYXJndW1lbnQNCi4uLg0KPiA+DQo+ID4gQ291bGQgeW91IHRlbGwgbWUgd2hlcmUgdGhlIHBy
b2JsZW0gaXM/IElzIGl0IGJlY2F1c2UgSeKAmW0gY29tcGlsaW5nIA0KPiA+IGZvciBRdVJULCBh
bmQgcWVtdSB1c2VzIGlzIGxpbnV4LXVzZXI/IE9yIGlzIHNvbWV0aGluZyBlbHNlPw0KDQpZZXMs
IHRoYXQncyByb3VnaGx5IGl0Lg0KDQpJbiBvcmRlciB0byBidWlsZCBMaW51eCB1c2Vyc3BhY2Ug
YmluYXJpZXMsIHlvdSBjYW4gdXNlIHRoZSB0b29sY2hhaW4gaW4gdGhlIFFFTVUgY29udGFpbmVy
IG9yIHRoaXMgb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3Rvb2xjaGFpbl9mb3JfaGV4YWdv
bi9yZWxlYXNlcy90YWcvdjIwMjEuMDkuMTANCg0KLUJyaWFuDQo=

