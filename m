Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA74FF063
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 09:12:46 +0200 (CEST)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neXBD-0006EG-Up
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 03:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1102522971=guohuai.shi@windriver.com>)
 id 1neTjB-0000oM-NS
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 23:31:34 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:60606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1102522971=guohuai.shi@windriver.com>)
 id 1neTj9-0004jS-94
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 23:31:33 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D3IeRW006576;
 Tue, 12 Apr 2022 20:31:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XZiJe1ukz5ZO9+gQUHB1G2hkNQq5sUUbvHPlWiD7Ox8=;
 b=NrDQXQWlBtcEesN9hMso8+5BAoREcbd675OUDH57tcNgEKKe0Vda5ogZfc7FRfiSXoaE
 pnnr7/sxFgFqAeoY3LdHhgxds04kEY5jLAmgnyOJfGX4Hx4iQx+iRDkH3Boix4yriNj+
 L865vLYCMylbxNwmfIRJD4024TYVUu52EIiRsZ4M5kILG/jSkYCNfqDy3ICuymn/FSi1
 2qiYqiDdZlIBYgtH2wzP4xLQTG6c5xUeepohB7+5oMjO+NbADzjhG/4IxQGFg/stSBaf
 leLHFO/gXB5XFTHgC/gfYB56AusWyY8zCTm5xPDKmCGGO+k0BW5gnDOBMeM6TCWZUVQR Gw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fc0jea3ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 20:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ickt8AKFzIV4kw2SF6ZOTCcWCZK8d+/mkBmrOvwbTCnldykRCXWyFWxt9iS3qEz/SIMQEgby9hnatibM/SgSBmTQGlle7qoHSrFRW1Z4l4SLOwoZorvi01dkPnF7hr76WvGL4HWDYH9Qk34vcTQbYM68nnS3u2erXYiODyVyj1lddrU5Rc9ejz3M3u5T6Z6NA9xbpOChXUNCCSVZOs0fJtgyzdkC2qyZJ130y4Exmu281aPlMJjSLY7ufYcnq2pev0ODAwmCh+w/gfqSOmGpGQC8u6xh2ikdN8ia2inr+aRvPulYLOWKhJBP8jxt0bQNLpkfIxpKgdfnbwVy1x3aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZiJe1ukz5ZO9+gQUHB1G2hkNQq5sUUbvHPlWiD7Ox8=;
 b=OjRZCmoAGcYyCY+PYQhxqlRz+Y4n8a43ZANo2EDiHSd3Zv9E0ZV9Ziwhi3m4XI7cUJeExwRAcwAZ1pMYzFhfYjhzQ2WXPGQVVa/WG637guYU/ubQJqlWT8qdCRZNIWx9VXtIqwGqPGe9bWyBm4zLsiO65BnF6gMHZDrtZkM160U3W9beeG3BRw04KY/p4fbNTeW6aaLpTzUPMdhQP76hMqpg4iuKKqQJqOiUIBZ4GVAypRqjBL3nTLVYi0cVhfirEMrtUcLIqbFNp0uTmVSzgKw3nz+p5LiTUmH5X6ICDKOyo3TOgsOispOGmg56z8XBaYcqn19s6vxD5rS0KPKDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4454.namprd11.prod.outlook.com (2603:10b6:610:45::22)
 by BN6PR1101MB2354.namprd11.prod.outlook.com (2603:10b6:404:9b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 03:30:57 +0000
Received: from CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::21e2:284a:923a:3f86]) by CH2PR11MB4454.namprd11.prod.outlook.com
 ([fe80::21e2:284a:923a:3f86%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 03:30:57 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Bin Meng <bmeng.cn@gmail.com>, Christian Schoenebeck
 <qemu_oss@crudebyte.com>
Subject: RE: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Thread-Topic: [RFC PATCH 0/4] 9pfs: Add 9pfs support for Windows host
Thread-Index: AQHYTuVGJPFOJ1jeRUu3ZU7S5uI6O6ztLTWw
Date: Wed, 13 Apr 2022 03:30:57 +0000
Message-ID: <CH2PR11MB445450AE2D1666B623ABD1BAEFEC9@CH2PR11MB4454.namprd11.prod.outlook.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
 <1937840.tFbQv4iVWk@silver>
 <CAEUhbmVVnz7iFZ6RpW7V45b6xAVv-YxXWv2Esxu4YBZf4yA0LA@mail.gmail.com>
In-Reply-To: <CAEUhbmVVnz7iFZ6RpW7V45b6xAVv-YxXWv2Esxu4YBZf4yA0LA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80e8bc71-4def-4b2c-3f41-08da1cfe0607
x-ms-traffictypediagnostic: BN6PR1101MB2354:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB2354CDF48B8D46E8DE500C9EEFEC9@BN6PR1101MB2354.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: si5ZLdFqXDXy5d7CVP8/RBMZYjoh6q6l/+suqta54leG8Oj4qGN7U6Kh31SBfWo6HfTsJeNADcnpjwnbamiJi6TDhfNA9bUjYYRT0a4VilYLn9xYP/tDqf3u3Es5/JNUjfPdsq5KpxXGo4l1aVwwVC3mzXFP63yASrBgTH1pPJGXRejVuscOmEf9MHv3PmZdZco0pJSaq2nrwJac6BJVwNtCIaLAIgco0Fvgu4JFnDC9sA0dzjyRuZkSac7lbVvs+Jv3dgv1SAICwvWDmkRTFXV1/ClFwd5cZoJEFuOWRk5fZoeup7ZSbQ/J1GRcTIp0W0sZ/4OUW5jQclty+ij4I5/zmJeE588VM6iqXN+kZ21tOSkd52Y6sOR6AoJuoVx3q+dgTo+42v/a805aqVfECTLD7gBZ6uR0DLL1cDD+HWnMLMGxygIWknQUBjuJR5mYmBblTnt3DMCGHks6zvYWYcehNau7A4yOVTSJp5D64bUJCmQvrcjGZk+BqS1I1LwHI3huK16AMEIyqmZ1GzOyTW+P6457YhAM7ZLKiNZ5vAdAmzvED5ADXmtV2i343pml+wz+eD8nf9m6hTjtHh4dZRe9nV7b5CegG60fGcUe7+d/1Dlz740F7rSMj2xhu7p5BJFohGd10Y4uZzPTJbXWsGIp8TUvGJd1mbg7PVjPFf0LuGJN+Awv8I6PCTJBgGs0BqhmtvUSnyn1vOKGKV2iXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR11MB4454.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(52536014)(8936002)(5660300002)(508600001)(38100700002)(122000001)(55016003)(38070700005)(186003)(26005)(83380400001)(6506007)(2906002)(53546011)(7696005)(86362001)(9686003)(316002)(54906003)(110136005)(66476007)(4326008)(66556008)(64756008)(66446008)(8676002)(66946007)(76116006)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmdkWGxFY1B2cXFnaGFOemN3MlFzRzN2QU5EL0JnME8rSWNBMUlzdTZQTnlY?=
 =?utf-8?B?cWVsTGdMUVpLcjFoaXR6Q29wT21ORUNpODdldTBaYWxqYW02b2R5OUV4RTRv?=
 =?utf-8?B?clJ1WnZ2OE4zbmtyT3diZG9SL0paOG41YUx5OUJzK3p4d1JGemdJdnNWS21m?=
 =?utf-8?B?bW45R2xkZXdrNUEzVnZ1RnM1ZDkvb0xPNlpiamdWbjFaa043bndsd0pDZFNQ?=
 =?utf-8?B?YUQ2YlpxNU9xZVd4WVROK3ZKS0lVT0djY29MQUJPaVA3Q2dOam5wOEM5aFhD?=
 =?utf-8?B?QVBORGlER0MraCsrME0yakJJZm5Id3R2WmhrdFF2RVdIQkc5MXdEN0FPNXR0?=
 =?utf-8?B?TVlteTFKZ0VBZ2ZUb2F4dVR3MHBzaHlYMjR5ZUdtTXo1S256b1h3M3RSQW4z?=
 =?utf-8?B?bHl6YWtONEQ4N1NlRTU2Nk80UHZyUllyM1kxTzZwbklXMG9EU2hTVTRsN05k?=
 =?utf-8?B?TS9kWnoyQkV1c2xZT1lJUmUrTC9yVllGMnFJZ3hZSDhPc1pmVDRud3U0Zmw0?=
 =?utf-8?B?U0djQXdsb1BPNC9GUTJ4OVJFa3dnLzBYS0tpMms0RUpNdnhXam43RHZSQW50?=
 =?utf-8?B?TWtEL0tJaXBrOEQySUNRcm4wNDdRRVNsdzFUOUZvNituN1lRamJFaWVCUXhS?=
 =?utf-8?B?Y1I5eTlvaDBoMDI4OElVRjhmeVNEcDQycFNYSHprU2lrSlNJVWUxa3dhMVFV?=
 =?utf-8?B?S1lDYmhJdCt2Zi9sRkRNNmNTeGRnRi92TEF2S3Z2MVJCZHU4S29FdTZFcmtE?=
 =?utf-8?B?cE5vR3VqQlBtVlpRN3RMWVRZbllVVExrUTZCcjFGZ05SM0N4cy9icTd1S1Fu?=
 =?utf-8?B?VXR2WG1VSC8zaFA5RG80cmZEbEFra3JaNCtXVXJnNzAyNm9PaGpsU1l3QXZ2?=
 =?utf-8?B?TmJ2OGRQdUMxYlNXMnZ1QWZ0SjlOYy8wd1QyTkk1QW9UVCtSZklhVmF5Ykhy?=
 =?utf-8?B?N1M2ZTZCZkJMK2wwYVp5VEhWUnlIUit0Q2VnNnBrOC9kaTlYZXkwTStOcS82?=
 =?utf-8?B?WStmbC9FbElvV0dEa0w1WUZmUVZ1SkVtSm5TTXkyVHd4S0pWK0kvVzRXSXc3?=
 =?utf-8?B?RnpvUHk0ckZjNHFnWXpQbXUwUFlucDgvREdlcnNmZTg5VVR0dE10aHF0UG1T?=
 =?utf-8?B?d2tOUUFGWjZsa3FPSUtYTlBjQStwMjRycGh3ZjM3eHd5VjVRSG1MSDhFTkZW?=
 =?utf-8?B?eFVBMWZTNWxkbFdGNWVjc2JEb1M4dGkwVEhBMFE3bHB4WDVRZ2FNa1ZQMUsw?=
 =?utf-8?B?VWxRUjBmWUFJL2JzanNveWVrc2h0MWY0b21rMzBFcm5TUWFKUVNSWW1mMURC?=
 =?utf-8?B?akthcTQ2ZHVpOFJuQW1XRFhEaWdDZlBGNVQ5bndKdEZ3ME5kL2hORWJpSU9R?=
 =?utf-8?B?SFhBdzR3a3VOQldlZldmazYvbkhKSWlGZEdtOWFDNThYS2RNZEtNekRCUlMw?=
 =?utf-8?B?RVhGTmpOenJOajdLaW9yc2ZHQnZ2WUpOVi82d001dzBpUVdmZHF0UlJIajdY?=
 =?utf-8?B?dnIxREtlcVVGSmJNMU9hQ2FsRWRlNS9tenRIOTU2WjJobG1UeDkzTlVXckRi?=
 =?utf-8?B?clB0ZDRCTWF3UmVOckxGK0YyV01wSTY1NGMyU2thMkxRc2JHZlN2ayszY3VT?=
 =?utf-8?B?ekdHeDFRNTNlRkFkQlRmZUg5MzZCcjlkQTdQYURIZkNRbHJwV2EzMEE3NGtW?=
 =?utf-8?B?bjlWTlZMRVhHSVF5OVpJRVppUE9iUWNIRWdHZXltRS82QVFuR2tpci9rZEhp?=
 =?utf-8?B?MXgyUWZVM2JSOThwY0ZISWl3Q3h0NlVGMm80b2xmYlVScXVDbzZZRkg1eWp6?=
 =?utf-8?B?VmdBY2UxSVR5RlBPLzNnT3kyM3NkZW9QWHBBMnN0bnFEUkRUTzVLYUh0MVZj?=
 =?utf-8?B?UzhxLy9TaXQ4Rm5RQnN2eEwxNkpwV2FjQ3pEY3k3Vlh1MG8rZnhvMkxHNGYr?=
 =?utf-8?B?R3ZyUEJoRUQrZTBiSS9pcWxZWFJvajBvWG5xblV4Ym9aMEd2U0YxcGJRYWhZ?=
 =?utf-8?B?TnNvME1CTVZyMmdsN3BRK0szU2g5eTRQNkpQSGxkRTVrNm1XYVZVQTNqdTFJ?=
 =?utf-8?B?QWs5ZUlFSkszeW5CN0ZoSXFRTTd3MjZOeWo0MjJEaG5hS2pPNVBaaUlHeXZp?=
 =?utf-8?B?dVZ5VitOQmxOd3dDRHk0N0xiYThqNGU2OURQZFJSeFNaemZkM0RSNXQ0WGdN?=
 =?utf-8?B?dU1HMjhrT3VFRzFTMDI3dVFRMDBodXpEWmZuQ2lyY0J0WUl1SnI4ckdwTWkz?=
 =?utf-8?B?RUxjUE9ZdU4rdWpxMDM3N3IzeGxEUHFhZUhET0JSL3FqNW9adWxxeVh4U2JL?=
 =?utf-8?B?c0l1MmxhR3MraDQ3M3lrUHczSDZkNmc1VU1NOFp4OWVoaTF6RWhicDBxTjJy?=
 =?utf-8?Q?dTRU/oX3u4hUGo9Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4454.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e8bc71-4def-4b2c-3f41-08da1cfe0607
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 03:30:57.3661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weAgt7ET0Av/FEmdr9TpE26oSAqc6FroFgwRHJxUW8K4dt1J8Cif+M2Gokgw7BDM5XId96ha2AWwZ7iXnzPTVqD8H4KqM/rhtPHY9TETkFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2354
X-Proofpoint-ORIG-GUID: _6QLZAcQp0gUC0-GAWP0yO33KR8SgqNR
X-Proofpoint-GUID: _6QLZAcQp0gUC0-GAWP0yO33KR8SgqNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130018
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1102522971=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Apr 2022 03:05:15 -0400
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBXZSBoYXZlIDMgZnMgZHJpdmVyczogbG9jYWwsIHN5bnRoLCBwcm94eS4gSSBkb24ndCBtaW5k
IGFib3V0IHByb3h5LCBpdCBpcyBpbiANCj4gYmFkIHNoYXBlIGFuZCB3ZSB3aWxsIHByb2JhYmx5
IGRlcHJlY2F0ZSBpdCBpbiBuZWFyIGZ1dHVyZSBhbnl3YXkuIEJ1dCBpdCANCj4gd291bGQgYmUg
Z29vZCB0byBoYXZlIHN1cHBvcnQgZm9yIHRoZSBzeW50aCBkcml2ZXIsIGJlY2F1c2Ugd2UgYXJl
IHVzaW5nIGl0IA0KPiBmb3IgcnVubmluZyB0ZXN0IGNhc2VzIGFuZCBmdXp6aW5nIHRlc3RzIChR
QSkuDQoNCnN5bnRoIGRyaXZlciBjYW4gbm90IGJlIGJ1aWx0IG9uIFdpbmRvd3MgcGxhdGZvcm0g
KG9yIGNyb3NzIGJ1aWxkIG9uIExpbnV4KS4NClNvIHRoZSB0ZXN0IGNhc2VzIGNhbiBub3Qgd29y
ayBvbiBXaW5kb3dzLg0KDQo+IFdoYXQgYXJlIHRoZSBsaW1pdGF0aW9ucyBhZ2FpbnN0IHNlY3Vy
aXR5X21vZGVsPW1hcHBlZCBvbiBXaW5kb3dzPyBLZWVwIGluIA0KPiBtaW5kIHRoYXQgd2l0aCBz
ZWN1cml0eV9tb2RlbD1ub25lIHlvdSBhcmUgdmVyeSBsaW1pdGVkIGluIHdoYXQgeW91IGNhbiBk
byANCj4gd2l0aCA5cC4NCg0KTVNZUyBsaWJyYXJ5IGRvZXMgbm90IHN1cHBvcnQgZXh0ZW5kIGF0
dHJpYnV0ZSAoZS5nLiBnZXR4YXR0ciksDQpBbmQgZG9lcyBub3Qgc3VwcG9ydCBQT1NJWCBwZXJt
aXNzaW9uIEFQSXMgKGUuZy4gY2htb2QsIGNob3duKS4NClNlY3VyaXR5IG1vZGVsIGlzIHVzZWxl
c3Mgb24gV2luZG93cyBob3N0Lg0KDQpJdCBpcyBwb3NzaWJsZSB0aGF0IHRvICJtYXAiIGV4dGVu
ZCBhdHRyaWJ1dGUgdG8gTlRGUyBzdHJlYW0gZGF0YS4NCkhvd2V2ZXIsIGlmIFdpbmRvd3MgaG9z
dCBtZWRpYSBpcyBub3QgTlRGUyAoZS5nLiBGQVQpIHdoaWNoIGRvZXMgbm90IHN1cHBvcnQgc3Ry
ZWFtIGRhdGEsDQp0aGVuIHRoZSAibWFwIiBjYW4gbm90IHdvcmsuDQoNClRoYW5rcw0KR3VvaHVh
aQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCaW4gTWVuZyA8Ym1lbmcu
Y25AZ21haWwuY29tPiANClNlbnQ6IDIwMjLlubQ05pyIMTPml6UgMTE6MTkNClRvOiBDaHJpc3Rp
YW4gU2Nob2VuZWJlY2sgPHFlbXVfb3NzQGNydWRlYnl0ZS5jb20+OyBTaGksIEd1b2h1YWkgPEd1
b2h1YWkuU2hpQHdpbmRyaXZlci5jb20+DQpDYzogcWVtdS1kZXZlbEBub25nbnUub3JnIERldmVs
b3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IEdyZWcgS3VyeiA8Z3JvdWdAa2FvZC5vcmc+
DQpTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwLzRdIDlwZnM6IEFkZCA5cGZzIHN1cHBvcnQgZm9y
IFdpbmRvd3MgaG9zdA0KDQpbUGxlYXNlIG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhU
RVJOQUwgZS1tYWlsIGFkZHJlc3NdDQoNCitHdW9odWFpDQoNCk9uIFR1ZSwgQXByIDEyLCAyMDIy
IGF0IDg6MjcgUE0gQ2hyaXN0aWFuIFNjaG9lbmViZWNrIDxxZW11X29zc0BjcnVkZWJ5dGUuY29t
PiB3cm90ZToNCj4NCj4gT24gRnJlaXRhZywgOC4gQXByaWwgMjAyMiAxOToxMDowOSBDRVNUIEJp
biBNZW5nIHdyb3RlOg0KPiA+IEF0IHByZXNlbnQgdGhlcmUgaXMgbm8gV2luZG93cyBzdXBwb3J0
IGZvciA5cCBmaWxlIHN5c3RlbS4NCj4gPiBUaGlzIHNlcmllcyBhZGRzIGluaXRpYWwgV2luZG93
cyBzdXBwb3J0IGZvciA5cCBmaWxlIHN5c3RlbS4NCj4NCj4gTmljZSENCj4NCj4gPiBPbmx5ICds
b2NhbCcgZmlsZSBzeXN0ZW0gZHJpdmVyIGJhY2tlbmQgaXMgc3VwcG9ydGVkLiBzZWN1cml0eV9t
b2RlbCANCj4gPiBzaG91bGQgYmUgJ25vbmUnIGR1ZSB0byBsaW1pdGF0aW9ucyBvbiBXaW5kb3dz
IGhvc3QuDQo+DQo+IFdlIGhhdmUgMyBmcyBkcml2ZXJzOiBsb2NhbCwgc3ludGgsIHByb3h5LiBJ
IGRvbid0IG1pbmQgYWJvdXQgcHJveHksIA0KPiBpdCBpcyBpbiBiYWQgc2hhcGUgYW5kIHdlIHdp
bGwgcHJvYmFibHkgZGVwcmVjYXRlIGl0IGluIG5lYXIgZnV0dXJlIA0KPiBhbnl3YXkuIEJ1dCBp
dCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgc3VwcG9ydCBmb3IgdGhlIHN5bnRoIGRyaXZlciwgDQo+
IGJlY2F1c2Ugd2UgYXJlIHVzaW5nIGl0IGZvciBydW5uaW5nIHRlc3QgY2FzZXMgYW5kIGZ1enpp
bmcgdGVzdHMgKFFBKS4NCj4NCj4gV2hhdCBhcmUgdGhlIGxpbWl0YXRpb25zIGFnYWluc3Qgc2Vj
dXJpdHlfbW9kZWw9bWFwcGVkIG9uIFdpbmRvd3M/IA0KPiBLZWVwIGluIG1pbmQgdGhhdCB3aXRo
IHNlY3VyaXR5X21vZGVsPW5vbmUgeW91IGFyZSB2ZXJ5IGxpbWl0ZWQgaW4gDQo+IHdoYXQgeW91
IGNhbiBkbyB3aXRoIDlwLg0KPg0KDQpSZWdhcmRzLA0KQmluDQo=

