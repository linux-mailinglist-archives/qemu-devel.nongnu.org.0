Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9266FE5E3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 23:00:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqtY-0000CQ-CX; Wed, 10 May 2023 16:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwqtN-00009u-6s
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:58:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwqtL-0001bO-3L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:58:32 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKlVHW006025; Wed, 10 May 2023 20:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=TYOtwpDYZxuQV/k6uQP8mMK1aI1ga67Smi9iY8+nTVE=;
 b=kUqNqhKgEEI6J94i4xMPWMA34aUUPszDFbFwxwUkgGVSdQxqaksyjMudUmx88dM+yAUz
 y/HbO8uN91+L3Y87hlkF+Kb2LjMH2N1x1nKpaYn5aAn0ReTp7EbisFoZGWpy54sFbb/m
 qlQ+vBP3msZSoaBh4BSBUd7fi3lAFtRdw0iihh4c1+8/hOsXfLZvS3of+iXxgpv1sMvX
 DNsrezJGc+ot/c+2AGEE7ZTPqqWuCk7i074Rs5QWTeULZNjEnHNAfpAFniAS2EWmDulD
 EAe9mGyLg9pNlcc7UULCrNwgW9TOxxTcRIRoRUI54ZuXvOH0LsA4906jDGArhJjEe2cY vA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg5mpsqdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXklO2s9VmYhGJzGomfsww/ZGtG3X2uAwPPY+B0PF4QsnVT+FdLsv9QdK57SyHR+Jdubp+nuAbFSYKkyuIuYMgvWk/j2OuZskXZpEkUhOsUmMuQB6Y/9xEYbfwBHvrrNUa7VrqBIAqeG0BRo1Rr4BgM1Gp0DqjfH6NwvU1ievKPWw4ODEjkFIg2pW/VcUvkqt8lmdpSya4tb81IO7Gfn+VundSmns9pMCi7FS4ybopGTjKUMAaLOXx+tA8V+EgHH2Ffz2E0M7DfQ6j3qA4JStPB79JrRauUjBUSVSPyRQMk0wdoRTJUGTUyfaPldXt44xTKyVhffECNzoZA9QgRbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYOtwpDYZxuQV/k6uQP8mMK1aI1ga67Smi9iY8+nTVE=;
 b=mX3lyWPU5sVC5DJBbHTrfs2nu3Q9OXicbymrNZQTyjr6Q/esy27okwGBd+UZco34+rJKjGlAHCqRh6ZWf7IvIXkD5qpVW7h/rztFyyRAwhZz1dmgUgbGH5l/kUTlsOKkLd3UEARqU2B0JTyRZkxF5efse15hyYkzkPxNwa92X/yrZkNPXX5IkzUUOd88RzPB1UvMxKzc7/SGpEsCLGPHpXPGWUs8csFY6VRucuMNkKaaVrmui7MyZuTPAnTWLbjkZfoj9gIK9JjSVKcYH+IoR/wpdbTA+4yvlknfchOhlKSM7MMbUv5sh1L9R8CoI7lx9rvl3iyd673OaLnB1LvFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6580.namprd02.prod.outlook.com
 (2603:10b6:a03:210::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 20:58:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 20:58:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Thread-Topic: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Thread-Index: AQHZeVld12ZCBRkIvkiottFe26z2L69BQpkAgAFz2ACAEVo/8A==
Date: Wed, 10 May 2023 20:58:21 +0000
Message-ID: <SN4PR0201MB8808854605274990EC367E01DE779@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
 <3ee5308b-b25e-813b-4223-78aef99e93de@linaro.org>
 <SN4PR0201MB88084AF677C669CA50E08E12DE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB88084AF677C669CA50E08E12DE689@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6580:EE_
x-ms-office365-filtering-correlation-id: f455904b-1c29-4055-7893-08db519949ce
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iaNe7fNmnH+0KNHyqGIkbp99nfcCE05uMLYJuhnTSWJ1sPvE/j8p6M4JVOUYt4Uq6ueCLzp233oayHA45hWnmagpXWhj8vhsSXwKYkShpx4jp39vjMXGEP9I8HJOVPIZ88z9UAZJ52v0IbMcSpwZJao//hDxUedYWmAhZls6NANb8GSAXPBinHEYdcWApoXpuc9AzqYLN5idhVwy+nisZP6DxKSoS8POqy8d6H4yRHx/McnKronLMg3ujr6s5ivRXsifU+kThM6dLnbm3JYDY3c2ok8ix1jKmC8wfTp2moUm12GFvvXNklurIDNRt+7dFiI2sPlDmZRkZxR69KcHi1xEZVgPESTnxo/YoyCoj3/93HJEpK7hS/DmaRGtGcv5bqjz2k0mxgaaQXhQeCrP42P7C3PjaZk5dC271d6+95ZRU+CVuN7aItZvm0/IWx9hxE+hITkMSzBNi8/aibvzDNOwsVoRk4dX1z5/1A/H44mqL2uc+ZAlzvqpEB+5dhJWm1JqAcpCQocqG41vA60Zket2f+isdyrcTm8N1VSQf+Q70nWqN6+vTrLV7E0ZxdKRor1C2cMHJTYEy4i7NGv4n+D7b9ta4bpY6OAMOe4HMiQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199021)(122000001)(33656002)(41300700001)(186003)(26005)(2906002)(53546011)(107886003)(6506007)(5660300002)(9686003)(52536014)(71200400001)(38100700002)(38070700005)(8936002)(55016003)(8676002)(110136005)(54906003)(478600001)(83380400001)(966005)(7696005)(86362001)(66556008)(4326008)(66476007)(64756008)(76116006)(66946007)(66446008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGtmZlY0bDVYRXRLTzJQNXh4b3Ntdmx4SHUxeFQyRTBsdjhWNHRYZWVHQVl4?=
 =?utf-8?B?SnlwN3o5dXFmZTE4cll1MElzR04wUENxVXlBNUlnY3NGRGpPZzBGMWkydmYv?=
 =?utf-8?B?Um5uZDZsNFpaMlVrVW1TMDA0TmNEUHhYSnl5cEhYdFpCendyWnRicDQ1akNB?=
 =?utf-8?B?WUZ5TUtvUjd2b0dzQkxkMmVOZmZsem5OUkpyUnVMNFZmaXRBa0hQbmx1Q2p2?=
 =?utf-8?B?SkEyQ3UzbEtmNTJ0ckR5S0hRUzJPUEVPUVJVclJCS0RUcGdVTlJwVkRTVnVP?=
 =?utf-8?B?Sk1ZR3huRDBTT3NTOHduaDhTQnB0dFRtcnFhdlM1ZlN5clhrYjhlOVlEOW1z?=
 =?utf-8?B?MjhjQ1VpaEJSNHhrbS9yeE90aWxzc1lSTzBhV0lnUTQweFBHQU1lV2JXbVE0?=
 =?utf-8?B?WTVCcFVvVWlReERNS0dEOWM0MmU0UHg2QVpkK0VGRDcvZUVnRzlGa2plZCs4?=
 =?utf-8?B?ZE5QK3ptZ2FLNzRXU1NLeS9VSmJYYnEzeVRjSzFRWW0rUnk3Vll5dTUvRjlm?=
 =?utf-8?B?Q0c5K0l5ZjR6aWxuRE90QVpYOVFkZVIrcG01NmI2UjBlbno2Ui9vakVaL09s?=
 =?utf-8?B?QnBRZllRQm93RzI4NTFSNVd1MmxWT0ZoR05vR2FuNWxFRVUrOGo5Z08weEZS?=
 =?utf-8?B?aTV0QlBaRndMd0ZJeXEzSHF1c2FNRkJzM1Y3RDFhU1J5NUpzNkFPREcrb3RK?=
 =?utf-8?B?TnhDc21WOFRyaFl2NFpFcUNCcC9hZVd6Vno2YmNDZ0xLamNCODJtbGlNL1ds?=
 =?utf-8?B?Z1lMR2pUcWZvc0k4WFNxOVdzbXRLVHFycDRQOVNtVDI1RDUrSWpqQ1NoVHU3?=
 =?utf-8?B?cCtLVzJWT0lmRlRSendaanovRDFFaVNZbERDVzlKREl2eHdSc2pDM1pLWC9J?=
 =?utf-8?B?ZnpWbFpnZFpuVkdjSUtKTyttMFdoS2dKcVh3UzZLR3dWZ3VJMGowZlEvajNv?=
 =?utf-8?B?dnRZNFZqN3pSK3MraTQrL3Nydld3QjhoQnVDT3VIdUNJd2EzRjlJSzhWUnFi?=
 =?utf-8?B?bk93WkNxV2JYeHpJL1hTRXg0dnJTN1dyWGk2M2JMaHZia0p3S2NMSHlkVGhR?=
 =?utf-8?B?NEppaXJzNE5nbTRUMkNhNHpDQkVIRFFsNU9HZmpLOFJBdVJWT0VPUnRoZjNK?=
 =?utf-8?B?RGVXRFlzd2lLWEJQdjBGWnpFZUJ0MXdKNUIzYmJLb3N0RSs1RjlabWVLQkV1?=
 =?utf-8?B?TGhDSjNScGtwMktYQ2tDSHRsNDlsYUdHbVNxZU5lWTF2VHhtK3U0MldBdzZE?=
 =?utf-8?B?YitpS0VCQ293ODIrSnhFRFRxV0xVRTdFQVBlSW4zYzJtTlBDNzRWUDJVS0hW?=
 =?utf-8?B?c1VteTZOY0ZJTWNoQ0d5VldLeU9KUGVZNk9OdXoxbnZYbmxUQlhxeUNsa2M1?=
 =?utf-8?B?aGFmeG92by9EdWJSVzVkLzlUenFHVnp3VUV0NlFnOVU2aGxnYUlwTW5MOFZo?=
 =?utf-8?B?WVdwVlVZV05QTG5PUVhETlJ4ejB6ZzF6NlllQjNRWGNPenZ2bnJWMUR4ci82?=
 =?utf-8?B?RGx4bElTSUMxSnVlN3pHdUFIOFFWdlRuTkRNSko2WDlueHA4V3hqOFBZQmtL?=
 =?utf-8?B?aXdQYTFCaXhKd2w3WERsYVEvck43aS80dENpYmZpbjVxOWIrMkg0QVFZZXly?=
 =?utf-8?B?WnBLSTZDQnJmOUlRcU9pRW1GR2ZFUkZDZGEranNSS1RNV3l4azVDcXF4akdL?=
 =?utf-8?B?OXZPbEpUMnA0RzVqTzFMRS90eVRJMG8vdlUzUUFEd0pteG5ZenlFVmZZU3Fq?=
 =?utf-8?B?WU5RZFdpSmh2T214YW9hNC9QRGREdUVFTlkrVFVWY2gxVHVZNkhYMnoyRGhW?=
 =?utf-8?B?YkkvTnNvbU9jaGJOTXFLM3V4VmlhNjdWZWRIZldEdjZsL0FHWlhQV25aM1E5?=
 =?utf-8?B?alFCdFdXVmpXbzExdnRTM3d6RWVtaThZbmJ3UWdRZ09JUlJ5NEx1TWliZjlG?=
 =?utf-8?B?M1lvU3BXakc4SUcwMUE2a3BMelVvY25xcjVoalUwem5EZHYxNWYxeFZLWkYz?=
 =?utf-8?B?OW9XcG9kV0NkS3M0eGFBSGJkTUtCREx6RmkrSnl6K0JIQWc2c0kxd1dUdFZW?=
 =?utf-8?B?OS8rM0pWQnV0engxTWJKaGQ4S3V1Z0ZnMGNEY05TZ3llN1dtSjNsODJmbmgx?=
 =?utf-8?Q?2K8tcrtU8UBP6zLEF8DIwGDIE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: N1osNNG5wTh8pjypL+8VE+qZ5HgFmP6W3mlGA7h716RXaUKrYebJnDADF76WINAN1q6hapPtcl+K/wP9QNjs/AlHMM9x3fjGp/2Ns/3+OfDAWxXDE6H/Zw7AmohrWJzLYjR96+Ti4avPardhukgoCOBhWUMl/DaiyrE9pcg6r/bKOct34M20ule3WoEKQUfkXopRuT5yrElSQt3Xe+JGUviPuILwZNi1VLc4akNHOL2BQbrcVDPBp8xDkd9Orrg82YYmjxUUOV8w+lBaTQJWtWAXHcTN+kr6AqndntVDz16j0KyxB1h4DNmLet7dxweFPdA6auBhPyROZUX8qdXYavmdxInTSUPMaEhmaA8YBZGhUfFCWsU51uvfbD+mQzzp+zVAEhmsWK/ytDmsKasIZgvOVt20Y/RUrpDEE0p3gaF0dHPxxM/DPXpzkPNvSk9sBwgu7QfG5zk9CN9VhVF8Lpk45hYmu7qrNea4oKCuKJ9IYS5CKkpU8XVFUc5KMP17yFkKW6DxqSvIJkJV168SMk6h3QRVc6baLeIGPsFn6fD+XnMoRrfKSeELN1mEcxu/YyluTOI6/wmqzB4K1X3aCI8aFMHJ2gChsWV6rR0DqDH/epZOQ/M7NuRq9nrcilB/v05XtbtKXFKgMHztcw669oWihrarvz1i/kr8a/CsJ2AHFNMKhxJTR0Ij9DZxFdNaZriWa2bb4rin9nJV4BSHkzEJyeY/A7ev2Ww2hP8uJjUPXhRB5NF6BNvnGPqoMHcokKpBAG9f3TsPUCqRoQqvr0xaLiuNJbYlEYJu/dbi3jgg4SU7Xq4+yEuZa8Beg0dF
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f455904b-1c29-4055-7893-08db519949ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 20:58:21.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVclUqOfAL3r/NhFT5maYESIJStQ5hFC/4X7qfM+EwQSZLwtDGARerxXMwJLwwETq+uxwfC3hPrOGmbW5XcDEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6580
X-Proofpoint-ORIG-GUID: 7RcBqenxBN5HQE-b0XERI0whTMl_C6wx
X-Proofpoint-GUID: 7RcBqenxBN5HQE-b0XERI0whTMl_C6wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=806 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100171
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDI5LCAyMDIzIDI6NTcgUE0NCj4gVG86IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgcWVtdS0NCj4gZGV2ZWxA
bm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQGxpbmFyby5vcmc7IGFsZUByZXYubmc7IGFuam9AcmV2
Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlu
byAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJFOiBb
UEFUQ0ggdjIgMC85XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgTmV3IGFyY2hpdGVjdHVyZQ0K
PiBzdXBwb3J0DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4N
Cj4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDI4LCAyMDIzIDQ6NDUgUE0NCj4gPiBUbzogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+
ID4gQ2M6IHBoaWxtZEBsaW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBhbmpvQHJldi5uZzsgQnJpYW4g
Q2Fpbg0KPiA+IDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykN
Cj4gPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDAvOV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIE5ldyBhcmNoaXRlY3R1cmUNCj4gPiBz
dXBwb3J0DQo+ID4NCj4gPiBPbiA0LzI3LzIzIDIzOjQwLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToN
Cj4gPiA+IEFkZCBzdXBwb3J0IGZvciBuZXcgSGV4YWdvbiBhcmNoaXRlY3R1cmUgdmVyc2lvbnMg
djY4L3Y2OS92NzEvdjczDQo+ID4NCj4gPiBXaGVyZSBjYW4gb25lIGZpbmQgZG9jcyBmb3IgdGhp
cz8NCj4gPiBUaGUgbGF0ZXN0IEhleGFnb24gU0RLIEkgY2FuIGZpbmQgaXMgMy41LCB3aGljaCBz
dGlsbCBlbmRzIGF0IHY2Ny4NCj4gDQo+IEkgZ3Vlc3MgdGhlIGZvbGtzIGF0IGRldmVsb3Blci5x
dWFsY29tbS5jb20gYXJlIGJlaGluZCBpbiBwdWJsaXNoaW5nIHNwZWNzLg0KPiBJJ2xsIHdvcmsg
b24gZ2V0dGluZyB0aGVzZS4NCg0KSGkgUmljaGFyZCwNCg0KVGhlIGRvY3VtZW50cyBoYXZlIGJl
ZW4gcG9zdGVkIG9uIHRoaXMgcGFnZSBpbiB0aGUgRG9jdW1lbnRhdGlvbiBzZWN0aW9uLg0KaHR0
cHM6Ly9kZXZlbG9wZXIucXVhbGNvbW0uY29tL3NvZnR3YXJlL2hleGFnb24tZHNwLXNkay90b29s
cw0KSSdsbCB1cGRhdGUgdGhlIFJFQURNRSB3aXRoIHRoZSBsaW5rIHRvIHRoZSBsYXRlc3QgdmVy
c2lvbnMuDQoNCkFyZSB5b3UgcGxhbm5pbmcgdG8gcmV2aWV3IHRoZXNlIGdpdmVuIHRoYXQgQW50
b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4gaGFzIGFscmVhZHkgZG9uZSBhIHJldmlldz8gIElm
IG5vdCwgSSdsbCBnbyBhaGVhZCBhbmQgZG8gdGhlIHB1bGwgcmVxdWVzdC4NCg0KVGhhbmtzLA0K
VGF5bG9yDQoNCg==

