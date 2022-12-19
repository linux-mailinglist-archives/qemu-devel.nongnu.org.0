Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622C651234
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:55:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7LHS-0007ss-SG; Mon, 19 Dec 2022 13:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7LHQ-0007sL-HF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:54:28 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7LHO-0005IL-I0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:54:28 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJFmKAM025330; Mon, 19 Dec 2022 18:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=jL2oMM0kirHLRPtpeZnhoJq2huq1u3ghVHnSPxnRqzQ=;
 b=D9zCeNUzx+0qn8aBJWI1a512jb8RSuE77SZOYW2HxQccFcCiWl//XWWW69L3Fvq0wHJV
 J+A3fgdnJncrX/0AKliBbPQNSq1ngMxfGJp11uk7ZzxH7WvYRdTnprw+vWBIogcKuETB
 DgxuWDVggGT7SgAu7GjtMqREXQwzam28Jzc0aqNurpg3eSoEyUWUhTx51pWTzPgtzs66
 Sn7WPCzjLIv7tSt3vp3bsdPC5CAmwk1sYVf9lPwmDFJBJaDYaxpSO0JwH3H93XpKnk41
 hBNA3mttmM+wwlUpJe0mNtwHve4+R6NDdVU5osXX/zBF6LKokW5IZDdwS4Vvzr6wbJ8+ qw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mh34udc7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 18:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD9ShG0TR6mpq3v4GAckv6j4e7PJnF02+r6wQifliDz9Ac93Lw5XSjRvd2cEaUJvtBKFjj8+H0qCWczKbrdN4l4E7niBAhEoqbdesaGDEOjck2V6M/6qAYo/LPLGDBfJHLTpVrdrMQCOv5gdNJVHxEyi1L4yUHEG8+Vy4TJA1M/j5/EDl3gkSN4XUvOsMKSyrXrRO6GFyVFVviH3sCA20DvXKw6Gd7ByPC96ItcTAVRW72rssPJN0MIXoJYbz6RTw4+l89tIDu/DCjP8MBMCIqHvAWGjL04HMSZNJOUVgUEdX1rsFWEG2rhJlayt8oqLBo61CIQRPjcSOIx9wFTtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jL2oMM0kirHLRPtpeZnhoJq2huq1u3ghVHnSPxnRqzQ=;
 b=nz9Wgnw8hNfKqQmGq8t84n0Z3w5ZCCQvRzw+turWjV9mLW8BEswdqNHyBBN+73J4P2+vb2gVGNGS3lu5aftfI5WBjKiUhv/Tg8V+DKT3yTjs+GREYT+S/ZyZkVgnHF988xlpyJ2dgHIgQTFCj3UpAtnGoZV+vxruSxuy0ZItPcagSlqANY0ZjjbZAYGbdVeAIO6AYAHybfCD564YWrilwb3oDsbzarPeIVNJWpOKWXrW0wA1HXUG5h1Je7CryqFCvTIBo9YHOYdlYD23NmygRLP7vDm4VcOp8ojSZGKKS7dJo5D9oC2DGRULA1Fg7D2yE1SaijS8LHF4+36O0296Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB6516.namprd02.prod.outlook.com
 (2603:10b6:208:1ca::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 18:54:22 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%9]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 18:54:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Subject: RE: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Thread-Topic: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Thread-Index: AQHZEY/d4l7DwLBzykarvNsciXPtUa51BhyAgAB4jXA=
Date: Mon, 19 Dec 2022 18:54:22 +0000
Message-ID: <SN4PR0201MB880829F40FA01F4FC3526F31DEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-drLPfX-q7HT9j-b4CZYckzzht+akxvUsZjOmiS3D47A@mail.gmail.com>
In-Reply-To: <CAFEAcA-drLPfX-q7HT9j-b4CZYckzzht+akxvUsZjOmiS3D47A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BL0PR02MB6516:EE_
x-ms-office365-filtering-correlation-id: 6c7f4d89-c631-4564-e025-08dae1f2711b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K55wuEWRQm1qf+PiGlnyckOWoJD1PXKQ0yAe0A9IC+Val2CQmdZJxq9wU/64SAHgrgQ/uxBPwT3V3rzxxDlpOYNUl9Xj74b3qeFe+ZpUFWmUxNJo1jrpI55MzFisVYVJuzpAEeeqWtm2dli/lCdYZemFJIz5taP8BfWSqvX1jBrQej3803Jj3bksv+iLhoHyriTjouzDHOqBwJF/7XI14jzZwqb66w2cQTNGFXuD15OahZkp86Al2+UkwtZnqFkswgy6Z1OilY10ev+8XvWo0E9VYoaEuleVmFLjXDmRwBsEzRHarLazD/PlvbBRO+zj0lZ3Yq+DgVgArGO3Ps3EgXOFepZfBNHDRvVBBfkZfUz4cHYrjxE2GI6RBr85UMIRA93H2NZI8CHCsz9XGlSsmwrU5Wa2TylNRpqyfskQgLnC/ntBdEj5cLi/CJ8GM0HiuEs/fVxfo8Zm9OMvyfuVlamWcZNfK4ZpfHlfu3AjRSEFIm0jbOfr9W1k0yeInsaJudt6I68JylVEn3hIn5KTXbxqGTIaKYRx40U6W1oMNqBiA/VlpF+nQpK+diXk/OomQ6mnrEIXF8pBrAFBcxkhKDRARfMIO4BTKXfHwz5OEpvEkXfONJhMXlZQVTH7j/I1AbDA89UR6YFbtbLqoob+lL6NO8AN42WcMt5DBsProTi5WuuvPzjHtBrn/UNz1dn3/KZsT6YOlOn388rw8nT7fs3Y3B/D4Ew8nEePgoAZUrxdNT3GpzTPFdBSOswj/QoSTrRYyvIRs3v61QcbFGLcrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(8936002)(5660300002)(4001150100001)(54906003)(15650500001)(52536014)(6916009)(316002)(38070700005)(33656002)(122000001)(38100700002)(83380400001)(966005)(86362001)(478600001)(55016003)(2906002)(9686003)(7696005)(6506007)(53546011)(66556008)(26005)(71200400001)(76116006)(66946007)(186003)(4326008)(8676002)(41300700001)(66476007)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDFTVkRKZGJBUVlTK2Z1TVJETUV4b2hmTzF2dHc3TmxPRUZsT1VpSThYSjRP?=
 =?utf-8?B?N3BVeSsxSDhaaU55RGJTZVcraXlaV3U5K2cwMjNjNCtma3lDTEY4Zm40djdF?=
 =?utf-8?B?dEU3dGtUSTBvMkgrbmVsODF0VlhDbUxLVWVJb3FGOGJaMng1bG9kcG5Za0p1?=
 =?utf-8?B?Nks2cENhNTJHU3ZFdmg5bDh1YWtOQ3AyanJZL28xTVlySDIreEV6eFd6QjFq?=
 =?utf-8?B?ajY4aXBtOS9GTkJVNnE1RWZDVklIWWNReElNdUdnRUxtNjNYaTM2UUF2L1Bj?=
 =?utf-8?B?Rngrdkg4THlRZDZmRFlUY3ZOaDZWdWhaM21kT2tURjdXanhLbG84djcxcjdo?=
 =?utf-8?B?ZTZmbzBJQkZ2K1ZtTFFsMEROcGNxRVZGWVRSMTY3aWtHWFBLZ2hheWRyZzFk?=
 =?utf-8?B?V2I4eUFhZnRRb1NIbXV3WjZqMVhxZ3VFd2NUWWxOemhFSnZ0QzZJeGJGZU9o?=
 =?utf-8?B?UnVtak5YRFpITEVQTUJ5RVFMUWlZbWUrN2lqS3RZNXZrRG5SNzV2UzJTSHR4?=
 =?utf-8?B?VW1lVlVDTDVBOVJNRkV3cUEveEFHME1lTkE3SXZqMzB5N2VsSHBKa3FMamJm?=
 =?utf-8?B?OFlWWndZMVRsNjRYcUc5SHRIZHFNbDZnSlFNOTNMcElrRXNSdjk2ZzdGM0Nu?=
 =?utf-8?B?VklFSkRyUEc1b3J6ZzF0YXpSQUZBMTJ0TVlvdE9WWERNQ1VGMDBSOVMrMXRs?=
 =?utf-8?B?SkRrR0gxMVh2TEJVSmQ1Vk01NFpEODF5YTJRamRzUnd5ZmtiMTE5emVka3hF?=
 =?utf-8?B?emZMeEtNV2E3Q1lQUi82dXEzQTBJb1Z3bUd1ZTFUelQ4UXB3WE1YRGwvaE5S?=
 =?utf-8?B?d0gwUGV4NzJza1R2Njg5TjV4UERoS1hLVTBGcFNxUlhDOTZ6VjJoMUdKL2py?=
 =?utf-8?B?QWNtODhKY1FOemdVcFppbkNDYy9oQUpTVGlCMklnR040VXNtNzVHbjJGTWFw?=
 =?utf-8?B?a0o0eDl3NFA1ZWlZTkk4R00zRmZZa0FuazhSZEZFaGIxeXIvUmZzV3ZFcmN5?=
 =?utf-8?B?L0FQVW9Va1dNby9xcmVkMDdSb3l3TzljemlQcE5VSnpIODJmcHdib0dFMGlZ?=
 =?utf-8?B?aHphbEtZVEpoVHMxWUsyalNMVzJTVllOeE15OEhBOUxOT1ZNdm93Z2cvS0dP?=
 =?utf-8?B?aGVVY0xxM0RQTlZQa2tXN1RHTlh5Y3YzQlYzU1kzOGkzVncxdXVZdzB0ZzRR?=
 =?utf-8?B?YU1VaXByZjkzeURGMkk5TVZiSCtXdEJzUENzMm9XT2FkYk1ZS0JGNjMrMWR5?=
 =?utf-8?B?aW5QSmdKZCtyNXNLc2FYeVpqczFlQi80WndPaVVQb2M2VElFbm9yOWlPblRt?=
 =?utf-8?B?RE5qVWlRMThkdHNJRlhqVnlQdWxIYnk0Y0VId2xJKzlPbnErYU0yd0NPRDVD?=
 =?utf-8?B?YklaeVUrcllvNEt0Q3ZhMGRjK05uRmhvQXJwNEkvRXB0K0lLNmthRjdEZ1J0?=
 =?utf-8?B?QlRkNDJWRmJaL0pMUzl6YW5LWU1qNHNlQUo4TDZLa2doOS9YbDQ0L3BUY3hD?=
 =?utf-8?B?alM1NkIwdGdiUmlnNEhkU001RVlUd295RGxsa1h4dHQ0UzVsYi9Qbm5kelZ6?=
 =?utf-8?B?dWt0S0JPZEtLRWNjbXFVaG1QU2l1WmRHZGpsSDlNMkVzMlpTR3ZLNjlzbE1G?=
 =?utf-8?B?MU1rcW5veWFUN2xsOWg5Y2VVQUxTY0tjMjNZRUV1V3RiU1l3VDZ1ZkhVbkdP?=
 =?utf-8?B?ZWJHbWlYaGVvU3F3bVdldHUwZDdtTEY2UmNIcGZRZll2ZExGRWRwbm9KYUpo?=
 =?utf-8?B?ZWMwMms2Z1l6RmZZOFp4QVpyN0NyYUo4QlFCZExuMVoxbndFeGV5cGYwTUE5?=
 =?utf-8?B?TEpGZ3VHZzlaNVBjMDRPZ0VESEJOMThMOUtwWkFycjhtM05VWnhUTXI0R1lm?=
 =?utf-8?B?b2ZKMVNQZnk0bER1QzVjMWNHeGhQeEtJV0xiZEZpZDhadUZlT0UxRUpUMUZa?=
 =?utf-8?B?V3dIL3lMc05GUU1rZzBoSE9uZ0d5K1p2em94aDI3cTFlc2JZYkNRWlJaUWM5?=
 =?utf-8?B?QVRRYU1Ib3pXaHNtYStlZU00MVFuZDhlQzNtQlhwZmtYQkpwSVJWYkIxcVlB?=
 =?utf-8?B?VmF2Y3dQR0g0c256ZXpNbE9iOHY2TUJtM0VrYWRKN1l6YkJEZW5KRXBPNWxv?=
 =?utf-8?Q?NR0rvTVLzhggx40/7LoNblglu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7f4d89-c631-4564-e025-08dae1f2711b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 18:54:22.2177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFcTpXJBwWPQ3upmWMVjX/pftKO2hQNQMfdnZ4S4LAKxDVVizJVT9rOQWegMlZFIdyV7fegPjAV3/3bEMcgmcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6516
X-Proofpoint-ORIG-GUID: 8b4bSOjxecnLKAya6xXtFsJ_ojnqzq5Y
X-Proofpoint-GUID: 8b4bSOjxecnLKAya6xXtFsJ_ojnqzq5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190167
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDE5LCAy
MDIyIDQ6MjggQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4N
Cj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
ZzsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsg
TWF0aGV1cyBCZXJuYXJkaW5vDQo+IChRVUlDKSA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT47
IHN0ZWZhbmhhQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQVUxMIDAwLzIxXSBIZXhhZ29u
IHVwZGF0ZTogYnVnIGZpeGVzLCBwZXJmb3JtYW5jZSwgaWRlZi0NCj4gcGFyc2VyDQo+IA0KPiBP
biBGcmksIDE2IERlYyAyMDIyIGF0IDIwOjQ5LCBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdA0KPiA0MjA4ZTZhZTExNGFjODI2NmRjYWNjOTY5NmE0NDNjZTVjMzdiMDRlOg0KPiA+DQo+
ID4gICBNZXJnZSB0YWcgJ3B1bGwtcmVxdWVzdC0yMDIyLTEyLTE1JyBvZiBodHRwczovL2dpdGxh
Yi5jb20vdGh1dGgvcWVtdQ0KPiA+IGludG8gc3RhZ2luZyAoMjAyMi0xMi0xNSAyMTozOTo1NiAr
MDAwMCkNCj4gPg0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0K
PiA+DQo+ID4gICBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xZW11IHRhZ3MvcHVsbC1oZXgtMjAy
MjEyMTYtMQ0KPiA+DQo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IDU4NWE4
NmIxMDQxYTQ1YzNiNDA3NDQ0MGM3ZjFiNTQ5NDQ1NzA4Njc6DQo+ID4NCj4gPiAgIHRhcmdldC9o
ZXhhZ29uOiBpbXBvcnQgYWRkaXRpb25hbCB0ZXN0cyAoMjAyMi0xMi0xNiAxMjozMDoyOCAtMDgw
MCkNCj4gDQo+IA0KPiBBcHBsaWVkLCB0aGFua3MuDQoNClRoYW5rcyEhDQoNCj4gDQo+IFBsZWFz
ZSB1cGRhdGUgdGhlIGNoYW5nZWxvZyBhdCBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9n
LzguMA0KPiBmb3IgYW55IHVzZXItdmlzaWJsZSBjaGFuZ2VzLiAoSW4gcGFydGljdWxhciB0aGVy
ZSBpcyBhIHNlY3Rpb24gb2YgdGhlIGNoYW5nZWxvZw0KPiBmb3IgJ0J1aWxkIERlcGVuZGVuY2ll
cycgLS0gcGxlYXNlIGFkZCBzb21ldGhpbmcgdGhlcmUgaW5kaWNhdGluZyB1bmRlciB3aGF0DQo+
IGNpcmN1bXN0YW5jZXMgZmxleC9iaXNvbiBhcmUgbm93IHJlcXVpcmVkLikNCg0KSSd2ZSBmb3Jn
b3R0ZW4gbXkgcGFzc3dvcmQuICBIb3cgZG8gSSByZXNldCBpdD8NCg0KVGF5bG9yDQo=

