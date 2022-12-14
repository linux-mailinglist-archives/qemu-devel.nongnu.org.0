Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F864C4DE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:17:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MwD-0000Li-6v; Wed, 14 Dec 2022 03:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p5Mvu-0000Ar-7S
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:16:14 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p5Mvq-0000nD-D1
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 03:16:05 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BE5fbOk014323; Wed, 14 Dec 2022 08:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=EXmzNiMNMf8T2gKFpuVbjd7tcdavItHFd5qmD3VqeiY=;
 b=VmSzDS2gM7YlKJ9f9b5BCjGAEN7qF1PRDoZxgaziTt72E2szrQ8a15a5h4oOGmLqJ6NY
 CaIZGhmwt27lui2j7g0Peg4MO4fgcKTF4mHc5bQhqUwvw0xCb+UOSorRjA/qj/AvB2FC
 gCwRyEN0q24zOP3fUsb2PlVDKm6POki0UTB9Y14GOP4jZ+1bY2iW4TJsI8VqG3r3FVu0
 MmJSlq0o/nhzpTlefw3FGzUtVlgYfI604Tibdw0CcDW3OFIzG2A9A1ofRHvVNHVV7Z1E
 FzGlJBVIl2W75lB/H9NlWZma+9Id/U76PNzgnCrx/SPCOrIlnJ7fw7xd8zw4c1blBukL Kg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rf8fhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 08:15:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK7QOu4LaTAgIp/eCz0K9wPF/LY8jbs+u6pwzxqjpiO5hdcrPGOSPtgoHi/Ld2eEYybv63Dl2lncp5pnr7Jplvzz832J9hHWFcGN+gUjcyRLPpg9LR1cx1e3i4R5knQK9RBCMXkFX7/ZWNoRN8CsmEplVDp3rS8uGfYouw+23ut28zOP36dn3AIvcdrXTXd+499XdM+INTmpN9g/e3runhijlOh3UNFWCjnTyZaiIXBOWRR5v9uRwOsya7DGL7+kcE3E2iPBpcnwIIqvPQDKVlLhFT9MCtMYGZ8UN+HWA0Uh7bdKpTY7DGaGE1yFFY0014ZN3SEidiDU8D7GCBGbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXmzNiMNMf8T2gKFpuVbjd7tcdavItHFd5qmD3VqeiY=;
 b=kFPPPT1dcwwXVHSM7HrLCAD2wEXmhRSjwkRq8Pp9yaI2D1EQR/aZ/CGfxcwKy6TU0MTA101xBBwz3K7rQF2OVrHLupeTj5FSLAJFuzNg0jfs46lv30v7PTP6Wug41m9vci+8uzTLp5WAOyo0bCmWlGxtp88J4R5I9Sj6BpraNyYPxBK2hHnos4HzajCh5+TORtTLJoahfsWfUC2MXytbwqlKsTx0ehQphDEzgEXANOlyaRbvNeuoNBPk709XP2iNYWzX/eivlUK6D78/IIf3uZ7oVqfGdebYvr2NzYUQBXPsWIwpn+pyN55EzsFTPWPD6ZsihPZv/beQEcXMEMVsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by PH0PR02MB7702.namprd02.prod.outlook.com
 (2603:10b6:510:56::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 08:15:55 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:15:54 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Mukilan
 Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
CC: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas
 Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>
Subject: RE: [PATCH] configure: Fix check-tcg not executing any tests
Thread-Topic: [PATCH] configure: Fix check-tcg not executing any tests
Thread-Index: AQHZChU2J1nWdSd+w0SColBFhcaq+K5iIk4AgArb9GA=
Date: Wed, 14 Dec 2022 08:15:54 +0000
Message-ID: <MWHPR0201MB3497FCADE612BE1B5D152BD5F4E09@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
 <3abe6ca7-a0eb-f2cf-aef0-3f4b16478285@linaro.org>
In-Reply-To: <3abe6ca7-a0eb-f2cf-aef0-3f4b16478285@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|PH0PR02MB7702:EE_
x-ms-office365-filtering-correlation-id: 7d4f0603-9455-4227-c96a-08daddab6c09
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wla3TV18geQdI1Cfvji4O7/NlsvAGzsBskoLwRDekNdeCQ1fp6+vCMb+dD4hLnuHh/mcF9tMQ2CJDxM6vdTlVCfNBLHcmKDg21tKcvGfh3jQpeAbo5aOSUxnY7UPKTsAzdT9Izn2eVd2jHUYkAJipZ0uRc+GG445m78Yp/SrMbBntZXhoAMc9CdD+jOrmjt97UQkxoShQmjWa2bX1eA9pYTyx1/HC4ikfmJQbICUUQ2i/zGVS8PKBYVIUKKdVRCMhmKCFXojvkR4encs+pSy8vn5sP+7DJLIeahGXZO5pwZLjLi5pk/p7yFE+WBxGYIZRpHLZe8Qpqsx3kzmCBR0hZCd0MOETJpIFl1TNv91MKuU+qJ6q4RNK/vMM2N7B5JK0966Byw91kaj7J4GXIDRS2XORqddcgV14tedoDnSBX3elRDeKUD+q+nI2xEhNtAFe6XRNpJMJTVv/Zjv5EnlEprdqh6wuxQl2uEWwnC+K1UJLO/7sJuRIt4Yuru4m4FhYXW2pT9WzrFk1tyC0/BY188UcPkMepkabVGP3Ou2WLljKyu+xCFhZlchYQNWbNoq6S0Kkp6jRv4vIy9QYwgze46cwT85V8M7KKaKv94cpphE/i4xOVvlbgmnnGBvyTPlHdRofpmiI0Po9l5xpXm1vCP8JjwvTE4qb5XPb8BaUk39CWnMkk5KeFM9A3UNKEiy9Vs5C8/uq6qr2GYtzbvyM18eI5n+6uJsFWDW1aWiS8p250FvZGJ/jUxSdziZLLWnu9a9PacXwiL9aIZdXiAiTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(33656002)(316002)(54906003)(26005)(107886003)(122000001)(55016003)(2906002)(6636002)(110136005)(186003)(66946007)(66574015)(71200400001)(478600001)(76116006)(8936002)(9686003)(52536014)(53546011)(966005)(38100700002)(5660300002)(83380400001)(66446008)(38070700005)(64756008)(86362001)(8676002)(4326008)(66556008)(41300700001)(7696005)(66476007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHNSWG52OFpkL1dlK1FVQXI3dTROQ2QzL0JBUytBWDlVWExwcGh4NGRBOXZn?=
 =?utf-8?B?aTlTM1dNZWhMN3JqemhvdTNSaDVaK2lrbGtZTGtBMW04Nk5qeUJDUHVOcEY1?=
 =?utf-8?B?bG9XOEJhdkIrdk9uM3NMbFhiU0RTbGw0ZnlmQVN5RUdFNURjelZTaEpOamo5?=
 =?utf-8?B?Zms4MHdBc2t4TEcrQzV4eFh3WnBrcG9hODdKTUdCcWpYVHVyVlYwOXBPa0Fn?=
 =?utf-8?B?UVV4Vk5xNmlEWHpFYzJaK0dvemcxbHU1RnVLOHpTWWdScllMNGpGYXZXVEVJ?=
 =?utf-8?B?U3dUem8rWnNpeU95Uk9QUDZ6SHFoYlIrZURxT2xqVGJmTXlXR0hZZlVsUkln?=
 =?utf-8?B?TTJqdUlQU2FoQzM1TTZ1d2lzYUhWNmVLZzdQTWhaV1RIeXFkWnZDVTY2dmMy?=
 =?utf-8?B?TG5keklyQ0NuNkhNaWxwOTJVNFpuaC8yUldCdWVaZkp2eHU0Z3NNdnNLdC9h?=
 =?utf-8?B?MVV0bnF2ckNnVWNYZGd3UVl2dmtwSXFtUy9LWVlqaUZoYlV2NlVUTzV4b25y?=
 =?utf-8?B?UUU1NzJQNEFtOTEwQmJzSmZwWFRzLzdHZFdpZEYyOTV3Y3hGVTIrUktYZUFT?=
 =?utf-8?B?ZFZDbDNZcW5tRlMxZ2ZYMndXSmIrVWhadTN2bXpIWUZlQkxxbzVhTGZXVkxK?=
 =?utf-8?B?WEdSa2RQTDRqd0VKQVYycmhOaHJPS3JvWWhiS21RM3U3UDRFMnkycXJPMk13?=
 =?utf-8?B?YTVjSFB5djEwZGxwb3g1a0NSZDFxVVZrTk5DU3lYdzRpQUh6YkhCMXpnYk9u?=
 =?utf-8?B?TU9iYU1yQ0dTNU1Zc0E4ckU2TkdnNTZIVVQzQnUxelRmRDNVK3RjN0ozRUE1?=
 =?utf-8?B?blo2NWE5OG9GbFJuekRPQ2Q5dFd4QkJUT1JtRE5lcHJVVTcwRlhmN2dXN0pk?=
 =?utf-8?B?Q21RRW0yUm5hRGxnRWNtNXNzdk5oRU42OTliaUJRU3l2NndpN2J0Rytiajdk?=
 =?utf-8?B?czJZd3pObDAvNWFtSUdSRUMzQ1dxSTl4WFhDNmJkUG8rM0JyV2tsV1c1WEdE?=
 =?utf-8?B?V3I0UCtvNCt4RHJRM1FGK1pLWXBpM2pKS2Z4clBRck43cGR2dVZnSXQraFFz?=
 =?utf-8?B?SlYzSEgvTHN6UXJsbFBYTUVrSjlPb0hUeFVIQklESC9qMkU4RGdXekc4Nnp0?=
 =?utf-8?B?eU1RSWQraUZaK2s2ZWV3Rnh6dHN0YzYvV1BZa2NYUzN2YkIxazlGN0ljeXg2?=
 =?utf-8?B?T3IrVGFsYTBFOVd5KzZDaTlOeW9mUkk4TVk4SVlaU2pESEViVmg4aUhpN05p?=
 =?utf-8?B?Y3IzOUdtY2xqVi95MUpuVTNhcHI2OVNhNHp6cWNaUEtDNktXd1JVMlhXTEM2?=
 =?utf-8?B?KzBEckNXT2oxMGl5OWZKMkRDSVpzNUJCWk5jYnA5eis3RE44WXFlVU9qWnll?=
 =?utf-8?B?aUNtRkliRzA5b2k3TG0zM1ZxU0c3cVlNL2NXZk9kemR3ZkhQZ1d3V3gvd2gr?=
 =?utf-8?B?b0VCM3pBc2VNTnE4SDFpVzFocU9XN1BycFhwZjEwd1pHbW5iS0dNZkxsMXp5?=
 =?utf-8?B?a1lnVUcvMU03MGR0UEYxajNYSnBYVWxldVY3eE5WTmlpTHdLSGwyeGNxWnRl?=
 =?utf-8?B?b0JQeno4K014cENXQXF6YnpZaGY5MzZJZkMzL1J6aU40UExtRVhRbk4rTzZI?=
 =?utf-8?B?RlpwRnhKNWZhVHNkb2Y1U3BxVUp3YlVJeGFDL0hNMmJuZHpVVTV5SUFlMCth?=
 =?utf-8?B?MEZCanBQc0IyZnkvTmxVTW9wZm9jSGMzMy9ZRmZRV25qTWE0Qit4Y0k3TTYx?=
 =?utf-8?B?NDJHSWZoVnF0Ukw5dVVSK0xHM2Nxalh1d2RHcEZPZFUydDZHMlFUTVlSdkVw?=
 =?utf-8?B?eTlVWlFxTGgxRTNSQVUwWWtDNlZKZVFrbExvTEhxdHNDSlRxRHpSNUpBeHFP?=
 =?utf-8?B?UnFBbk5vYmEvaVkrNnh2Ymw5bE54TExZcWdiMm1INThYcGxkUmJYNFNHOFFP?=
 =?utf-8?B?SmMybExpa1ByeVdTbWJlb3dlaXhmRkJPdGNiYUozS2NXenpXR3FYU0Z3YXJu?=
 =?utf-8?B?UlV1SDFpeThzSlVaeVk4YlpEMDBQak1hQzFILzJGNFhBVEp1dDI1ZTdObzY2?=
 =?utf-8?B?V3NZWW1lZ3hGWkRoalVKUFVxclJXeW9nUTlqR3lqaXZ4NWxSKzc3Vm5XL3BF?=
 =?utf-8?Q?nGGhsKT93n0slaiiXjCa95K2Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4f0603-9455-4227-c96a-08daddab6c09
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 08:15:54.7448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUutdcJUcHIZWRl3QMwsoIlu+UEqUYWiTLz65gOU5jCExKzfkuXMkQrbX4jPP1CEsgjWZDLrXeLBRYDIy+p6rhy6vMykYFeOUUaHYN10z34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7702
X-Proofpoint-GUID: mumckn9Isy7epg-FUdfiCiUp5EuElvC7
X-Proofpoint-ORIG-GUID: mumckn9Isy7epg-FUdfiCiUp5EuElvC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140063
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

UGluZy4NCg0KVGhpcyBwYXRjaCBzdGlsbCBuZWVkcyByZXZpZXcNCkxpbms6IGh0dHBzOi8vcGF0
Y2hldy5vcmcvUUVNVS8yMDIyMTIwNzA4MjMwOS45OTY2LTEtcXVpYy5fNUZtdGhpeWFnYUBxdWlj
aW5jLmNvbS8NCg0KQmFzZWQgb24gbXkgdGVzdGluZywgIHpzaCAoYWxsIHZlcnNpb25zKSBhbmQg
ZGFzaCBzaGVsbCAodGlsbCB2NS44LCB1c2VkIGluIFVidW50dSAxOC4wNCkNCmhhdmUgdGhlIGJl
aGF2aW9yIG9mIGFib3J0aW5nIHRoZSBjdXJyZW50IGxvb3AgYWNyb3NzIGZ1bmN0aW9uIGNhbGxz
IHdoZW4gdGhlIGJyZWFrDQpkb2Vzbid0IGhhdmUgYW55IGxleGljYWxseSBlbmNsb3NpbmcgbG9v
cHMuDQoNCmRhc2ggdjUuOSBmaXhlZCBbMV0gdGhpcyBiZWhhdmlvciB0byBzaW1wbHkgaWdub3Jl
IHRoZSBpbmNvcnJlY3QgYnJlYWsgc2lsZW50bHksDQp3aGljaCB3b3VsZCBleHBsYWluIHdoeSB0
aGUgQ0kgYnVpbGRzIGFyZSBub3QgZmFjaW5nIHRoaXMgaXNzdWUuDQpCYXNoIHNoZWxsIGFsc28g
aWdub3JlcyB0aGUgYnJlYWssIGluIGFkZGl0aW9uIHRvIHByaW50aW5nIGEgd2FybmluZy4NCg0K
WzFdOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvZGFzaC9kYXNoLmdpdC9j
b21taXQvP2lkPWViZmRkOTdhMTBlMzRhNWU3MGVhZGZjMjFlYmZjMDMzZWY5M2E1NjMNCg0KUmVn
YXJkcywNCk11a2lsYW4NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPiANClNlbnQ6IFdlZG5lc2Rh
eSwgRGVjZW1iZXIgNywgMjAyMiAyOjM3IFBNDQpUbzogTXVraWxhbiBUaGl5YWdhcmFqYW4gKFFV
SUMpIDxxdWljX210aGl5YWdhQHF1aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBC
cmlhbiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykg
PHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+DQpDYzogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPjsgUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmc+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgVGhvbWFzIEh1dGgg
PHRodXRoQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBjb25maWd1cmU6IEZpeCBj
aGVjay10Y2cgbm90IGV4ZWN1dGluZyBhbnkgdGVzdHMNCg0KV0FSTklORzogVGhpcyBlbWFpbCBv
cmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkgb2YgYW55
IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQoNCkhpIE11
a2lsYW4sDQoNCk9uIDcvMTIvMjIgMDk6MjMsIE11a2lsYW4gVGhpeWFnYXJhamFuIHdyb3RlOg0K
PiBBZnRlciBjb25maWd1cmluZyB3aXRoIC0tdGFyZ2V0LWxpc3Q9aGV4YWdvbi1saW51eC11c2Vy
IHJ1bm5pbmcgYG1ha2UgDQo+IGNoZWNrLXRjZ2AganVzdCBwcmludHMgdGhlIGZvbGxvd2luZzoN
Cj4NCj4gYGBgDQo+IG1ha2U6IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2NoZWNrLXRjZycNCj4g
YGBgDQo+DQo+IEluIHRoZSBwcm9iZV90YXJnZXRfY29tcGlsZXIgZnVuY3Rpb24sIHRoZSAnYnJl
YWsnDQo+IGNvbW1hbmQgaXMgdXNlZCBpbmNvcnJlY3RseS4gVGhlcmUgYXJlIG5vIGxleGljYWxs
eSBlbmNsb3NpbmcgbG9vcHMgDQo+IGFzc29jaWF0ZWQgd2l0aCB0aGF0IGJyZWFrIGNvbW1hbmQg
d2hpY2ggaXMgYW4gdW5zcGVjZmllZCBiZWhhdmlvdXIgaW4gDQo+IHRoZSBQT1NJWCBzdGFuZGFy
ZC4NCj4NCj4gVGhlIGRhc2ggc2hlbGwgaW1wbGVtZW50YXRpb24gYWJvcnRzIHRoZSBjdXJyZW50
bHkgZXhlY3V0aW5nIGxvb3AsIGluIA0KPiB0aGlzIGNhc2UsIGNhdXNpbmcgdGhlIHJlc3Qgb2Yg
dGhlIGxvZ2ljIGZvciB0aGUgbG9vcCBpbiBsaW5lIDI0OTAgdG8gDQo+IGJlIHNraXBwZWQsIHdo
aWNoIG1lYW5zIG5vIE1ha2VmaWxlcyBhcmUgZ2VuZXJhdGVkIGZvciB0aGUgdGNnIHRhcmdldCAN
Cj4gdGVzdHMuDQo+DQo+IEZpeGVzOiBjM2I1NzBiNWE5YTI0ZDI1IChjb25maWd1cmU6IGRvbid0
IGVuYWJsZSBjcm9zcyBjb21waWxlcnMgDQo+IHVubGVzcyBpbiB0YXJnZXRfbGlzdCkNCg0KV2hl
biBwb3N0aW5nIGEgcGF0Y2ggZml4aW5nIGFuIGlzc3VlIGludHJvZHVjZWQgYnkgYW5vdGhlciBv
bmUsIHlvdSdsbCBnZXQgbW9yZSBmZWVkYmFjayBpZiBDYydpbmcgdGhlIGF1dGhvci9yZXZpZXdl
cnMgb2Ygc3VjaCBwYXRjaC4NCg0KQWxzbyBDYydpbmcgdGhlIG1haW50YWluZXJzIGFsc28gaGVs
cCBpbiBoYXZpbmcgeW91ciBwYXRjaCBwaWNrZWQgdXAgOikgU2VlOg0KDQpodHRwczovL3d3dy5x
ZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2guaHRtbCNjYy10aGUt
cmVsZXZhbnQtbWFpbnRhaW5lcg0KDQpJJ3ZlIENjJ2VkIHRoZSBjb3JyZXNwb25kaW5nIGRldmVs
b3BlcnMgZm9yIHlvdS4NCg0KUmVnYXJkcywNCg0KUGhpbC4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBN
dWtpbGFuIFRoaXlhZ2FyYWphbiA8cXVpY19tdGhpeWFnYUBxdWljaW5jLmNvbT4NCj4gLS0tDQo+
ICAgY29uZmlndXJlIHwgNCArLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJl
DQo+IGluZGV4IDI2YzdiYzUxNTQuLjdhODA0ZmI2NTcgMTAwNzU1DQo+IC0tLSBhL2NvbmZpZ3Vy
ZQ0KPiArKysgYi9jb25maWd1cmUNCj4gQEAgLTE4ODEsOSArMTg4MSw3IEBAIHByb2JlX3Rhcmdl
dF9jb21waWxlcigpIHsNCj4gICAgICMgV2Ugc2hhbGwgc2tpcCBjb25maWd1cmluZyB0aGUgdGFy
Z2V0IGNvbXBpbGVyIGlmIHRoZSB1c2VyIGRpZG4ndA0KPiAgICAgIyBib3RoZXIgZW5hYmxpbmcg
YW4gYXBwcm9wcmlhdGUgZ3Vlc3QuIFRoaXMgYXZvaWRzIGJ1aWxkaW5nDQo+ICAgICAjIGV4dHJh
bmVvdXMgZmlybXdhcmUgaW1hZ2VzIGFuZCB0ZXN0cy4NCj4gLSAgaWYgdGVzdCAiJHt0YXJnZXRf
bGlzdCMqJDF9IiAhPSAiJDEiOyB0aGVuDQo+IC0gICAgICBicmVhazsNCj4gLSAgZWxzZQ0KPiAr
ICBpZiB0ZXN0ICIke3RhcmdldF9saXN0IyokMX0iID0gIiQxIjsgdGhlbg0KPiAgICAgICAgIHJl
dHVybiAxDQo+ICAgICBmaQ0KPg0KDQo=

