Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAB61E6B8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornZ4-0000z3-Gk; Sun, 06 Nov 2022 16:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ornZ2-0000yl-TD
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:52:24 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ornZ0-0007lg-TH
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:52:24 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A6Ln46x018149; Sun, 6 Nov 2022 21:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=2bKmpY+Nlja6GdWNb0rSyiMEQpHJA0UZiSKBlRK2CKs=;
 b=igUAVwzWdczzjGxOAxnvwJjLpRy42D4j8k2v7o5TR3IkegauyrZZlQdTKBp9MBo0tbbj
 MdzO6dGVpasRN3IIJsSSPDldWV3SqGxTf6z4WxdiPcmVvXm7CMHAZNS6X+42w2axzo/Q
 cSHhcljaN7I6QnejOMEmMU2X6PowbRJ6n35BRtMv2+vr1mf5xz7Fzn0RAczmmm2vmYBF
 aiaGBN+egNta3NaHV094FHJC8FtIXktBpus8bfy40aLBjmC3y/mtbX02ZACUxcWw/01X
 4c27g83MLV7CUgcGMairPhfCGg6dztmu6lJ7Zlkk1NHEQNjYY1e1lbh5CJ6IaguWPcSl Mw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kphj8g727-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Nov 2022 21:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/HjhUAFBb8BikBa3aArjxm3gKjG81yMbppVwoRa3hhceWLJ05ENX7816ShWrjmJYWycg/okl2cgb8d/w0SvrCxvks0XjZxeFD6Il6oEkBqMvuVWDCv+ISaTb6HcOvRxVdSA8bI4OInrglPipHAilF3WaSYA2EzrNRfsX0GBsGyFtTw+jIfBG8i1I335IprfS9MT8Kaa8BKEa+MsozOkvHF1MEpNgSuEVJl861nK1hBKM1d7TKt1Lk6DOwZtOcaO6gSZmlbTcV5jGymQmWk1Z7Y2a21qEElH6XOvqMRGAL6j39PAzXch6EdBsVSkzdXJxSof+PPneLASY4sdR61vKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bKmpY+Nlja6GdWNb0rSyiMEQpHJA0UZiSKBlRK2CKs=;
 b=heOXJcIHeB9DULVfqOmccAbUWOZkbDOloG9ImQ3YWSQd5RM8e9AJosEEbxvlHxhuy15ubm0DeA1k6xQ9DR6pO0jLG0pxVAZl6rWb44ZmTJ9m8Uy3tZfqaMCpTSMpIdMjAgx7Dx2q06aMrnbzrzTjZd/Urxpgy7C7+0F6prM6PAhiMP0AIVwzPJXwZdoAH5ZPC0HQQRQxOfaWWeEpkD+GI2zZqlrWsp7okxt8k4KOJMsmb8/CgfJ0cA5rjaY5HziR8QwnwhOmG0siwdkGyAsEPGyFeq1JJOxUmKasV1NcD0L8d5uR19xuIgzHN+xK23d81dIM34o2uQBMubj/hJdhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6671.namprd02.prod.outlook.com
 (2603:10b6:208:1d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Sun, 6 Nov
 2022 21:52:16 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 21:52:16 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v3 11/11] Hexagon (target/hexagon) Use direct block
 chaining for tight loops
Thread-Topic: [PATCH v3 11/11] Hexagon (target/hexagon) Use direct block
 chaining for tight loops
Thread-Index: AQHY8INcqX7JjFkPH0mzXXG5xUG4d64vjyGAgALjMnA=
Date: Sun, 6 Nov 2022 21:52:16 +0000
Message-ID: <SN4PR0201MB88089D42B56DD5455E2DC70CDE3D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-12-tsimpson@quicinc.com>
 <a13e4232-dea1-3050-b0c8-a6cd0cec3137@linaro.org>
In-Reply-To: <a13e4232-dea1-3050-b0c8-a6cd0cec3137@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6671:EE_
x-ms-office365-filtering-correlation-id: 55fc66d1-c305-426d-73b0-08dac0412b89
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yc8X/m0tjUGid9GHPg7Ud0nEJ7bvohchs7hEPFE1ikJIHiHQXRCDf8iWYJfKJUXBPy5nJb2Skd4mcjQFaAfZTlX2H9r8uvPo9/N5FS+JzGzfq6XBNoSJ+N8WuNr7kDmCdlX8DGCU0lPdZSJJqOKRsyTpVyTnh/P6azzvdEVTF+BYk4ICwS8ttxgmjdhvnsi/6VdAlkrq6fQsOfx4/Ugd9SsU1PLYD3TzG9GRhL3T8hb10bJdXLhPKA9VKxIxXqYMTOiO78JfIS/nNSHEsDQuSzg/fJMVcV/fMlJE1jQjoFP6VWtX3LuNKoOglQ/RKWa0YQ7YM1WJcHvHSoYwoSh80DyEjEXUhQNKrOl+0SuZR/hTO19Fnigz/cJPfPQYDkBsmAdXq7f0zhO4j7v3o2VGuRxuksT5kYdiQF7iKrlcfcHFa37TpF0V7xR3f9g8qAs8PH6eFCo0knsmFfXWl6H9RIzTKGBxvYfdXABRt8sc83GqpHeAQORfFMfrVgnbvUV83CfgfV6mM1zpZQDZD5x0lv5aUdmUAroH8MKVirfaG+ir+Q6z3zbSmd1sk/9eUPwgH5CG18xPSJvEMuhhrmUK69HXetBAoj/d24r3qjuPoIvi5IR4jBYm127IsZOno0UQiIhaSQ8tqxbUfd6bGttG7JGd30SPfVnRsgDClfrQL2gfUQjj3bvHEZH8aELZAibqtN94SrGoxIbZo+Zg0aSGRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(186003)(66476007)(110136005)(8936002)(54906003)(53546011)(52536014)(316002)(55016003)(5660300002)(41300700001)(7696005)(6506007)(33656002)(66946007)(66556008)(8676002)(66446008)(64756008)(76116006)(83380400001)(26005)(2906002)(4326008)(9686003)(966005)(478600001)(38070700005)(86362001)(107886003)(71200400001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjREeHNEdmRpWVN1REFBcFowZVJ1V1pyak1vakQ5RVRLNDFxQVBpUEd6RlJQ?=
 =?utf-8?B?WVFKTWxyQzZOZkRvKzJSMHltOW5EL0pQczRibW01Vzk0cWZBQnY3aEdkb09n?=
 =?utf-8?B?ZmpESDBISWFkaFJyQWxCakZ3YnJHOXQ0bkpOVXUyeHBvczlzMUFQSVBmRnJO?=
 =?utf-8?B?cWJON2orc3k5YVVrVjVMZkZFaDM0Vk00MzlqTjFxcFBZaXFhVVg0TDBmUGwv?=
 =?utf-8?B?R2xBdkdhanpEQWZXL2ZFaGVjSFVlOEhRZ3Z3YUhVbzVxbnFmMUI4ZEtPSE44?=
 =?utf-8?B?NnppWlN0aGJ0cGR2bEEzUkV4S25pdkF3RWp4QjhBdUxqeGNKZ2VSMjQ4c0oz?=
 =?utf-8?B?V1VQWWZlekJhd0c5d01wM2hrNTE0S2kzemxWN25oaWd6WURGRU9JbFhBb1Fj?=
 =?utf-8?B?M0o0SXBXbFhYNXBFaFFzMml5cTBPT1FTeDJnbUtzZ01FWXhSTVFxcmFaQjRq?=
 =?utf-8?B?NjllMHBVNGJCT3VRbHB6VUZvSUtTZ2l6N1FSUjN1aG5vLzVqb0RJb1RTa044?=
 =?utf-8?B?VDVEZDJSZjg2YnZQdTZIZTBHUlVmakNteSswMjgxaXJUWS9hUTB0VmRod1A1?=
 =?utf-8?B?MXhwd0VpYkVnWXVwM29hdy9pMStheDN2UDhscFBPaXJFbGJJZlpTY2hqRENF?=
 =?utf-8?B?bllEUDJWWjk2V0pieitsc2JDTitFdGN4U0txR3U5bUFNRUdRZm4vSWdJZUVs?=
 =?utf-8?B?Y0J2Q1RFQVJ0ajdBNGRDeng3WG5xN0V4NUdvcVJ4OXhYVERvdCtNMXRFRGl4?=
 =?utf-8?B?ZEhybU5kTFkxc2J6UG05azZ1U1JVWG5sYnkzMWFiVExQZGRDT0dXdW5saTlP?=
 =?utf-8?B?d1VjQmxIUTcwdmh4bExiNy9pTkpsZ1NPYWllc1BHWkNiVTlNb2s0TDU5Q1BW?=
 =?utf-8?B?Q0ZORy9qT3JyaVBXOW5IU0ZKQlpTWFhsSXEyZGYrTkpCRWF4ZC9ZK0dXUkRH?=
 =?utf-8?B?NDhDRDRNMm9VTFE4NzIzTUpEVFNRZ2VxYlFFMEtyM01RazlhQUNwZW1uMGlz?=
 =?utf-8?B?Wll0RDNWRDlwMjNQSlIzOFQwU0p4WW9yYWdmY2NvQm56NlpWNFh4YjM0NVEz?=
 =?utf-8?B?K04rWjRxNnIxeTBsazByb2JWTXpqRHRjUzlNSGd1UlZjbzZwR3JPenk4bElC?=
 =?utf-8?B?Wk5oTi9WaVZJY0JQYkRyOUZDVm5oVWFwR0JrcDM4NktxUkNuWjg0em9aelpG?=
 =?utf-8?B?MVd0ZHpzVk43b0NrQ0hRdDUwUFozTTIvSHhQeUJNejE2eHhhd1VWYTBHTGE0?=
 =?utf-8?B?eXd6RDhmRGpQbVY2djg4UlluejE5UzQzWmNlT3JHNFBKbWU5bEd3Q3hwSE9B?=
 =?utf-8?B?U1ZRbVFYVHFoN3pUK1dxOEpzblFzWGlRQVJYWXhsMlpMZGw0UEMvK1V2UEhv?=
 =?utf-8?B?ZVh0VzMvVTlRdVRhT0g3NUtNT1RMcjF4eGRyRkNFQ3J0UWpTUkVHVm9iNlAw?=
 =?utf-8?B?N0hXWlA1WmJkU3VHZGJhRVJ2WDJUWVh3VjBNeWdaUmZUcG44dHhUNGdaN3Fu?=
 =?utf-8?B?clMvQnY2akMyWG1DTnhGOEFtRS9jdVowTmdQeFFSR3JGSHNnbUJESjExTGJl?=
 =?utf-8?B?UFBJelRTTk1mTEY5bzNuL0RFOFJsTW9wMGlhdVl2REVPbTNERFJRZ2JMZDNp?=
 =?utf-8?B?RG9FUWVaY2p2eEQ2NjNnN01rUm5IRm5zUGRmZSt5UlA0Q21uNWZMZldKM3lE?=
 =?utf-8?B?aUVxVWhZbkpsVW1CMVdjNWliaWZZcnVZVzNFeTByT2lHZzJOQnlmTHFqVlc5?=
 =?utf-8?B?anorSFpVK0tyanFzRVZ3Vm12UFZWOUJxOW8rMTRpUWI3bFh3S250OEdMa0dU?=
 =?utf-8?B?MC9adEhUdVZQc1grVENNRHNhaGJOeHZuVWNmRmFhdkI3UlpYMG0rRG53SGJq?=
 =?utf-8?B?WENheTd0dW5CMDFiMGM3SEwwdVpLcWpEKzJ2V0dsbCtONUJIVVRzNlVyZXNL?=
 =?utf-8?B?eVhXSS9XOGoxY2duZHdWOGg2bXFpV1lQNUhXZWZmd2gydW10U3FBRDMzeklI?=
 =?utf-8?B?ZFhoQU0zOWVKV05UTW5hMXJlMk85WGNabWZ5NytCc2JTMGt1NkVsZkc5azdv?=
 =?utf-8?B?VWFkdjA0ZitxVDVwdUJxS1RGNDdPWjUvUXlWc2hpeW5mTnFYZjcrcjVFd1Yw?=
 =?utf-8?Q?JyfPk8CDzUBq8vEC6zBmaBt1j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fc66d1-c305-426d-73b0-08dac0412b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2022 21:52:16.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMVz2vTpIRIOkiek2WQBXUilNHJJH1ijXfvSxG3/Zmgk6VwTgMUUTEIJxd3X22Ie5G1PxITHsLY4D6lBCbI6IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6671
X-Proofpoint-GUID: vFbPbUqUezUHcYVo4V395_EOf2659F3Y
X-Proofpoint-ORIG-GUID: vFbPbUqUezUHcYVo4V395_EOf2659F3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=707 spamscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211060195
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1i
ZXIgNCwgMjAyMiA4OjQ0IFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEBsaW5hcm8ub3JnOyBh
bGVAcmV2Lm5nOyBhbmpvQHJldi5uZzsgQnJpYW4gQ2Fpbg0KPiA8YmNhaW5AcXVpY2luYy5jb20+
OyBNYXRoZXVzIEJlcm5hcmRpbm8gKFFVSUMpDQo+IDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDExLzExXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgVXNlIGRpcmVjdCBibG9jaw0KPiBjaGFpbmluZyBmb3IgdGlnaHQgbG9vcHMNCj4gDQo+IE9u
IDExLzUvMjIgMDY6MjYsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IERpcmVjdCBibG9jayBj
aGFpbmluZyBpcyBkb2N1bWVudGVkIGhlcmUNCj4gPiBodHRwczovL3FlbXUucmVhZHRoZWRvY3Mu
aW8vZW4vbGF0ZXN0L2RldmVsL3RjZy5odG1sI2RpcmVjdC1ibG9jay1jaGFpDQo+ID4gbmluZw0K
PiA+DQo+ID4gSGV4YWdvbiBpbm5lciBsb29wcyBlbmQgd2l0aCB0aGUgZW5kbG9vcDAgaW5zdHJ1
Y3Rpb24gVG8gZ28gYmFjayB0bw0KPiA+IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGxvb3AsIHRoaXMg
aW5zdHJ1Y3Rpb25zIHdyaXRlcyB0byBQQyBmcm9tDQo+ID4gcmVnaXN0ZXIgU0EwIChzdGFydCBh
ZGRyZXNzIDApLiAgVG8gdXNlIGRpcmVjdCBibG9jayBjaGFpbmluZywgd2UgaGF2ZQ0KPiA+IHRv
IGFzc2lnbiBQQyB3aXRoIGEgY29uc3RhbnQgdmFsdWUuICBTbywgd2Ugc3BlY2lhbGl6ZSB0aGUg
Y29kZQ0KPiA+IGdlbmVyYXRpb24gd2hlbiB0aGUgc3RhcnQgb2YgdGhlIHRyYW5zbGF0aW9uIGJs
b2NrIGlzIGVxdWFsIHRvIFNBMC4NCj4gPg0KPiA+IFdoZW4gdGhpcyBpcyB0aGUgY2FzZSwgd2Ug
ZGVmZXIgdGhlIGNvbXBhcmUvYnJhbmNoIGZyb20gZW5kbG9vcDAgdG8NCj4gPiBnZW5fZW5kX3Ri
LiAgV2hlbiB0aGlzIGlzIGRvbmUsIHdlIGNhbiBhc3NpZ24gdGhlIHN0YXJ0IGFkZHJlc3Mgb2Yg
dGhlDQo+ID4gVEIgdG8gUEMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNv
biA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4gICB0YXJnZXQvaGV4YWdvbi9j
cHUuaCAgICAgICB8IDE3ICsrKysrKysrLS0tLQ0KPiA+ICAgdGFyZ2V0L2hleGFnb24vZ2VuX3Rj
Zy5oICAgfCAgMyArKw0KPiA+ICAgdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggfCAgMSArDQo+
ID4gICB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICB8IDU3DQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gICB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyB8
IDM0ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDEwNyBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9oZXhhZ29uL2NwdS5oIGIvdGFyZ2V0L2hleGFnb24vY3B1LmggaW5kZXgNCj4gPiBmZjhjMjYy
NzJkLi41MjYwZTBmMTI3IDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5oDQo+
ID4gKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmgNCj4gPiBAQCAtMTUyLDE2ICsxNTIsMjMgQEAg
c3RydWN0IEFyY2hDUFUgew0KPiA+DQo+ID4gICAjaW5jbHVkZSAiY3B1X2JpdHMuaCINCj4gPg0K
PiA+ICt0eXBlZGVmIHVuaW9uIHsNCj4gPiArICAgIHVpbnQzMl90IGk7DQo+ID4gKyAgICBzdHJ1
Y3Qgew0KPiA+ICsgICAgICAgIGJvb2wgaXNfdGlnaHRfbG9vcDoxOw0KPiA+ICsgICAgfTsNCj4g
PiArfSBIZXhTdGF0ZUZsYWdzOw0KPiANCj4gSSBkb24ndCBzZWUgdGhpcyBhcyBhbiBpbXByb3Zl
bWVudCBvbiBtYW51YWwgZmxhZ3MgaGFuZGxpbmcsIGFzIGl0IG1ha2VzIHRoZQ0KPiBmbGFncyB2
YWx1ZSBiZSBkZXBlbmRlbnQgb24gaG9zdCBiaXQtZmllbGQgb3JkZXJpbmcuICBUaGlzIG1ha2Vz
IGl0IG1vcmUNCj4gZGlmZmljdWx0IHRvIGNvbXBhcmUgdHJhY2VzIGFjcm9zcyBob3N0cy4NCg0K
SSBjb2RlZCB0aGlzIG9yaWdpbmFsbHkgd2l0aCBtYW51YWwgaGFuZGxpbmcgYnV0IGRlY2lkZWQg
dGhpcyB3b3VsZCBiZSBlYXNpZXIgdG8gcmVhZC91bmRlcnN0YW5kL21haW50YWluIC0gZXNwZWNp
YWxseSBhcyB3ZSBhZGQgbW9yZSBmbGFncyBhbmQgc29tZSBoYXZlIG1vcmUgdGhhbiAxIGJpdC4N
Cg0KSSBoYXZlbid0IG5vdGljZWQgdGhlIGZsYWdzIGluIGFueSBvZiB0aGUgbG9ncy4gIFdoZXJl
IGFyZSB0aGV5IHByaW50ZWQ/DQoNCg0KPiANCj4gT3RoZXJ3aXNlLA0KPiBSZXZpZXdlZC1ieTog
UmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IA0KPiAN
Cj4gcn4NCg==

