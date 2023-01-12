Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BDD6672EB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxIQ-0001RD-Do; Thu, 12 Jan 2023 08:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1pFxIL-0001Qe-B1; Thu, 12 Jan 2023 08:07:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1pFxII-0001wo-Eb; Thu, 12 Jan 2023 08:07:00 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CC7x1W018817; Thu, 12 Jan 2023 13:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=0avxbW2YOXKExWPGFwwkPiNOfZm4EQI6yYVT6z2Y0wI=;
 b=EkkXaYkVwGo+BlWG4bmgnlS8Hjyl8boHhDv6P5mp4JhH+nOKzbDnc7SVCi5PSLMpSsgd
 n26nWUCPxqyuNfbOoy82DKiwNv4hkMw36VXP43evyTJhSzMRatDj85UMAMdkRT24kqqV
 k42NJ50Fp1vbOthTpqLty53eOOBl8dNwcSnLx9PGnfjZ+fbgM4Muj55HQvC2vvl5xf/Q
 OQOK/1ruBn1ZfO28kZATJnpIFVIhpPN0DcQUWCuurnsOuAVH4G7SKPqZhvIJ3KAI65rl
 DOTPDqFsd906toqY585v3s91vOv9w0mcWjd8P7YJqz38x/gIEzUFqKRoQMKnrD9LDMTZ 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2hkbspjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 13:06:53 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30CCvWNd015981;
 Thu, 12 Jan 2023 13:06:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2hkbspja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 13:06:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4v+U1+V7iVFsQL1oiUw4pW4ajqGqaNZ02dVGCBRHx8Wu+Bpp5OtT6It6+jrWee4dp+2t2rHacqdaKQzgIHt7kwPLmgx4ItIi4mb6w7soB/bA/DblsbTrG8lE8gLAYqdZSzKhqrNJ0I+Y0qm7JVsShZMI55Q9dr7yTLqsVE2iHIHcFQ3xjJwEF1P1VuUJfaS+moeRPOyXypA2YrJNajbMHlSEcQhuGw9iTb+MHuNqipx/UKd0cEF6pGBiltlkY3TAwFSW3+rIBYbTpCEXune9nB7uB9SRg2HgNsXgrLn83hG6PfX2HePAkmH2eXtZKzhaz7kCw4ZEnliqATDqfTJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0avxbW2YOXKExWPGFwwkPiNOfZm4EQI6yYVT6z2Y0wI=;
 b=iffvvXRSUCDCvdToIkz6d+2pN6vKOQYh7t0+8Cck4j5z92zleO6W7y90Wag1DQKYBVT4sbrcWIjj7OJPG18ZLxeb4xnslsL9TnByv4JXOUreEWvpt8OEsTC9/Of78OkoiW4lVB35Hj4C8KM3+9k5fL1PUDHAtlRgM4aRYe57p3nDXktaEjMSvpmUsXbe/L/CwuXiYO/iFamBr9iO4Eyo5EFEfPoVq/gWex2+OMecFEFKlLjNjOrU6GuqQ4890Ju9cxqMXMWCqkGmome+M2AwOxohghTuO7bUGt5CIQadgDlgI4lmwFEhG53q8+QiUeg7V3tkrnqgN8QJwG5p5E2e1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by BLAPR15MB4020.namprd15.prod.outlook.com (2603:10b6:208:272::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 13:06:51 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::5d05:f8cd:79d8:844f]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::5d05:f8cd:79d8:844f%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 13:06:51 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: Daniel Berrange <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Danny Harnik <DANNYH@il.ibm.com>,
 "idryomov@gmail.com" <idryomov@gmail.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v4 3/3] block/rbd: Add support for layered
 encryption
Thread-Index: AQHY/MrkNGdiKjTzz06pLMtgfSZ3bK6bDzkAgAACn2A=
Date: Thu, 12 Jan 2023 13:06:51 +0000
Message-ID: <MN2PR15MB348836909E481EEE26A1A1288AFD9@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-4-oro@il.ibm.com> <Y8ACAjd0S9q8sS0k@redhat.com>
In-Reply-To: <Y8ACAjd0S9q8sS0k@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|BLAPR15MB4020:EE_
x-ms-office365-filtering-correlation-id: fb1ec1d8-28a2-495a-4257-08daf49ddee8
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FODlOJZNR374KW+Uq81uFaPsJubqEDx2f4wWzEaU4njcnHEvUpgrxjzWU0k66UhtjExlIObFKGMNu6n2hrOKBguutBnvLszKtD9F7svxRqyudZgK56DcfPyGSoWg69Y0IwzgFyVqu+VOXNwaTH0hJ2Wo/wYxEN3V20vPx66t4vcJrWyURFLrBIzS2DPZekvvVoTp/mCOVO9jh1PnLgz3vLgTqmnqOq4ksvQNrh62uKz7/jfObMdyT33LM3DTE4kqm/AP5s+WCz0NaxMmagXRQo0eI5h8j6Q9fufOKMRvoWd1KFhe+0AK+vbvnZJi48z5T/bv6kcd2KdRhLtpJ906AkgZyxm0y37501/gtJBRlk5Pbl+L6+OnH2OBv8T+hx1BbKr4Jb5L0KdMxs0VAuOEw10Tq7xS6SzXvAMJn1uhwzuakLAiM0fkLfmaDZ4skRCHrm4iM8kb8cs2SrO/h42UVFMf5OlqRdMVh0au7ofvIcQBiX9HytcLOtBpOe5vOHNW9AMx4U1kftTaacg36yQDR9P5r/+dduiAK4f4BuBmzg4GCSWRU+fNWca5UCH9CAxThY5MrWTmDTImj8FIdbPG3kVV505JKg7gum53IowapJdVa9TnCTdCvFQsU+aQv8z0SKlT6Yo6mvSqXXQXvFIUOT4+eujE/f2UTzUmuPDwYwPlqhbA8267K2dNJcEZjQeP/vU9hr8daet04vcCJG1tpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(38070700005)(9686003)(4326008)(478600001)(33656002)(38100700002)(41300700001)(86362001)(71200400001)(54906003)(316002)(26005)(55016003)(7696005)(66946007)(76116006)(186003)(66556008)(8676002)(66476007)(64756008)(5660300002)(53546011)(66446008)(6916009)(6506007)(2906002)(4744005)(83380400001)(52536014)(8936002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTc1OWxuTm5GNlBKUDRYM0dzbFdVOEg4bFBFMEZqZ3VId05CMGoyajhyUVp3?=
 =?utf-8?B?V0g0Vy9ETE02dEpMVzBMdHd4TTQyWEY5N0tXRk9lcExrMk9PNE02S01RMHEw?=
 =?utf-8?B?cG1kYm1NOUNkMmFiSzBuNExLNjEwYWFLK0xGdG9STFNPeWtpa3FHTzErSjdr?=
 =?utf-8?B?TGJMbTlvbWpHT3NlcG16aUkyOVo3QjRINCtLNFcrQ3E4SGhEZEVBaHM0MHds?=
 =?utf-8?B?UFB3K21BR2JlT1FlU1A3RDZuMnh1bFNBZEdJMlVQTTQ2TVN2TGY5YVlTUmJZ?=
 =?utf-8?B?a2dUUXMwY1JoazIxNnlWUk1DTy84bGROdy9HWGwyWEFxS3g2ZjQvUkwwdlUy?=
 =?utf-8?B?R3hxay8yeUVpWVZMSU9ISk9vWmJNNWk5Z1RIZG9tdkVQTXFqeXFUZVlGaDFM?=
 =?utf-8?B?ajg4cmxTMVFaNFBxT1pIOTZpVU85RjJWcStOQ2VYS0xjR3VVTDlBSTZhWFE3?=
 =?utf-8?B?cVA5dDBRckNnUTRhQWtZaUhHd05razRWWHpIVEZyUXVaTS9NMFh5RkVWcmZ1?=
 =?utf-8?B?NlN5V1dPSDVXRXNDQTRsQnhFb2wzTHZuZ1VOUXJBa2ZvdVVmUzJQbGFFZ3JF?=
 =?utf-8?B?b0R2YmVNQXg5ZlJ2RFJ0b3hGUDBiV2JXQWlxdEpvWVM1dC9QNTk0V0ZHN05v?=
 =?utf-8?B?VG90TkNydXE3N041Rk12UmwyNlA5T2grUjhxanF5V0tmS2Fyd1NhbjJ1aWE3?=
 =?utf-8?B?Ni9qeXBuYWI2amM3NllNaW43bEtvZ01lMVF3ZlRRUVpiQWhQNU9mYWFIWDdr?=
 =?utf-8?B?a1AzL2RDajdWNU41dHJsSjJoOG0vQTFEVVU0VWJJS3RaMkorb1dTaTQxbjZy?=
 =?utf-8?B?WWlQQWhtM3JUSXl6NStMNU9ONE82clFacGpxdjZCSDUyNmUwdlora1czTnZz?=
 =?utf-8?B?UTZTd1JMeDNEdEJ6Z2gzTlZoYmx4cHlWTmgwMWNkSGRvcktlaE1MQUFOSmpN?=
 =?utf-8?B?SU04OGp4R3JmdFdzWVA1UjM1TFJ2b1VRcmVVby9jdkR4ZmNtUkZjekFCWWoz?=
 =?utf-8?B?S3B4ZnN4R04weDZLT1ZvNzdYaHlFeDVIUVpXRlhTU1hJOGwySy82a1VJSG5G?=
 =?utf-8?B?aFFpR1dXNjRCNTRMbnUrOWZrKzV3SjgyMEpKbGUyd3FWM1BuUTUxWUF1WUUx?=
 =?utf-8?B?YVJGSTBkOTB2S2ZoS0FsU1ZPOEFhaG5UVnJXTXZxNnZlZU9YMm9PS1NaVWFL?=
 =?utf-8?B?UjU0UFlwWUNla0ZqOCsxdGlWZWFBYXFRSFdkQVJacTVadlRFYTJRbDRrekdK?=
 =?utf-8?B?RFhtWGtuaytBblcwOStHbWJUY1BrU3NEN3dQdXI2U2dLcUhjei9aNE9idjF4?=
 =?utf-8?B?OWpTdnhYTFRHWk9lZFhDQWd5Ujk3dVMxSTVENmtZM1BMYUJVTGZNb2RZc3ZU?=
 =?utf-8?B?NDlPVlFJKzFMcHZUTGZQc0dXaEFSWUR3MFFmY1lEdGlGanlHeGlQQzI3RG5t?=
 =?utf-8?B?R05YV25pSkxHR3gvY053Y2xOS0FTSEQ3T0hjUjhscUtROG92UFZ1OE4zNjdV?=
 =?utf-8?B?SDMwYXQvdlVpS2swblNBOFpOQzJaU0VvNnlITlk5alVyaVZoc1lqSTVScWpU?=
 =?utf-8?B?TUJQN2lQblBJNmk3dGt2QWRqd3FrVkhWVTh2V0RvVkh1Zmd4RFZLbkVaeVdJ?=
 =?utf-8?B?cjRGRFA0SlpINjZQamZMbVcvNlFWMi9CM1V6RGMyd2xSc2wyMFJKazBsNDlO?=
 =?utf-8?B?K21nVDFOQ1VrNFU2a0sxdVlYL3hGYldZaHk0aVpPZHd6ajNieVVDTnFOR2d6?=
 =?utf-8?B?b04xOS92TnlaM2IwS1BOQ3FvdlE5VGkrTnV1ekFWWGFtODRxc2xzUzg4alpV?=
 =?utf-8?B?cllLb25OZ2hLekFmLytJWDJRZW04S3l3RkdMaXFWQXdCeDB6TjRLQUVSQlBQ?=
 =?utf-8?B?VXltdlBaWVBBSGJxeDlISzIvZklDRFNBTTR6dHZYTmZQMW9GVXZsTlBIaVJt?=
 =?utf-8?B?eGgrak9WNDAxZnlkWHBhNDgzNWYzL2hjNWxRZXdJMmtxVGpPR2ZzS2Z3S0RQ?=
 =?utf-8?B?c2hrQmNsOUxrUmRJaVptbk8rUG1kMlVXUnRTR0JCRUxTSGQwSHlFRHN0NXJj?=
 =?utf-8?B?TG5zZDlaS0RhRlVxbE1PWk5UdGY3STlHWmxnSk9CRDJCWTVoT2xXcFpJNjN5?=
 =?utf-8?Q?fPxo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1ec1d8-28a2-495a-4257-08daf49ddee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 13:06:51.2840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oITa1PbMmUa150UudNTMS0nA1EUwoo4d4R3MDJN0phZ/oFLc0murtFZOx22THUL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR15MB4020
X-Proofpoint-ORIG-GUID: HoE2pXz9SDHsPaFMEiphsJJwoinoDw8b
X-Proofpoint-GUID: iMJtvs6XPqaNiv9U_smN0r24giTltEI1
Subject: RE: [PATCH v4 3/3] block/rbd: Add support for layered encryption
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_07,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxlogscore=801 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8Op
IDxiZXJyYW5nZUByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgMTIgSmFudWFyeSAyMDIz
IDE0OjUwDQo+IFRvOiBPciBPemVyaSA8T1JPQGlsLmlibS5jb20+DQo+IENjOiBxZW11LWRldmVs
QG5vbmdudS5vcmc7IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgRGFubnkgSGFybmlrDQo+IDxEQU5O
WUhAaWwuaWJtLmNvbT47IGlkcnlvbW92QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxd
IFJlOiBbUEFUQ0ggdjQgMy8zXSBibG9jay9yYmQ6IEFkZCBzdXBwb3J0IGZvciBsYXllcmVkDQo+
IGVuY3J5cHRpb24NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGJlIHJlcG9ydGluZyB0
aGlzIGRpZmZlcmVudGx5Lg0KPiANCj4gVGhlIGxheWVyaW5nIGlzIG5vdCBhIGRpZmZlcmVudCBl
bmNyeXB0aW9uIGZvcm1hdC4gSXQgaXMgYSBjb25maWd1cmF0aW9uDQo+IGNvbnZlbmllbmNlIHRv
IGF2b2lkIHJlcGVhdGluZyB0aGUgc2FtZSBwYXNzcGhyYXNlIGZvciBhIHN0YWNrIG9mIGltYWdl
cw0KPiB3aGVuIG9wZW5pbmcgYW4gaW1hZ2UuDQo+IA0KPiBJbiB0ZXJtcyBvZiBlbmNyeXB0aW9u
IGZvcm1hdCBpdCBpcyBzdGlsbCBlaXRoZXIgdXNpbmcgJ2x1a3MxJyBvciAnbHVrczInLg0KPiAN
Cg0KSSBkb27igJl0IHRoaW5rIHRoYXQncyByaWdodC4NClRoZSBzaW1wbGVzdCBhcmd1bWVudCBp
cyB0aGF0IHRoZSBtYWdpYyBmb3IgUkJEIGxheWVyZWQtbHVrcyBpcyBub3QgIkxVS1MiLg0KU28s
IGl0J3MgYSBkaWZmZXJlbnQgZm9ybWF0LCB3aGljaCBjYW5ub3QgYmUgb3BlbmVkIGJ5IGRtLWNy
eXB0IGZvciBleGFtcGxlLg0KSSB0aGluayB0aGlzIGlzIGltcG9ydGFudCBmb3IgdGhlIHVzZXIg
dG8ga25vdyB0aGF0LCBhbmQgdGh1cyBpdCBpcyB1c2VmdWwgdG8gcG9pbnQgaXQgb3V0DQppbiB0
aGUgb3V0cHV0IG9mIHFlbXUtaW1nIGluZm8uDQoNCg0K

