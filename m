Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4096EFBA3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 22:28:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prlkI-0001jV-QJ; Wed, 26 Apr 2023 16:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prlkG-0001iz-IB
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 16:28:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1prlkE-0008AJ-BB
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 16:28:07 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QJuaer007351; Wed, 26 Apr 2023 20:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=QpennlaVFKQe3Y+L+RbUfJ2qOckXv9sXd+bbYUioWs4=;
 b=HkERHgsXysQcHvvkw5QPsL2uKk24fos/+Ln3QYJ7HiDpZJcRGADrPLcFU9Jia5qm1fcO
 A0N4tDJvGWu7GEcW3CQxEfSqYVxwd731iwGkYhJcvpBmf0QTCp7vk2XDtixNpLIcfyrn
 BQvesnNKJ2D7zntE53S4UPbiL9acfEiIj/H1K489YHO77q80tehYPK7yYgCBv6AalxqD
 9nLHwd/W53IzDCsduidbbKdjUys69+A1XT4tZ2GfVV9zkSWNam/kjNod2xuFpt0uc84z
 LwhY5wtdNQc/sII0cOByKOs5Y+H+7kEw/BPnifEra+EqSR/K/D7Yk37DrbR3HjwbQwrz OA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7237hasb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 20:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFCXS5ia7Q0LwDFlb2EynLwIh59gqRdMNThUhL/fmoJ2XUoPbPypIZaAjlJXoZuiV8FRL67k67AEqFmHPtT/2D97525iqxeGYuXNIN0TIWUXHvD5dvw48xPoaxW82pU9D9H4rBsxqcHyOPLCcmC2UGH9mbNkUsRnfZ80lTRVPMHO/yo4cqXpcxxEaqIo7dT4CgLcRsivgxUzOpww6LvYdj0Ym2KDH94+sPXovHznNEtzUs/8YtC6VXrgqfMiYUMkCd0SOJVlQrqdBwTqixwh0DcY5lCbgw4xRvE1XbIEp6I+1eh7A/wcgaYQzpxIjwha5zuqXv6MBCeFaJhHODpfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpennlaVFKQe3Y+L+RbUfJ2qOckXv9sXd+bbYUioWs4=;
 b=JxtFSM2oUXQn2staMWBzqAudt8STdCN8rc6cLsT4+9NwwpPXLpUck0nr9vBdIPGVqAvDCZM7/E6iHLVb5B2sxjuw+d0cqqnMEl5Gad74PV7a56lOUmJVVQtc8UvLQPGM806lcroXUtu5GeP88bczAYW7whJdmxJpHa0EWrxZOgbYS+xwfCwO5QdxlAFoHoYYb+hmWGwNZ87bh4u9b5moDVBmyi7uPDZC1GlDBStBqn+6aXXuDDZcHCvz9mDXCMB0qkQC4HohTbN3DPiI/kpeRaBtiEaemfSqhm8q7ZhTNkCm4tUUKK4AwzhkFZK/2y3E++rGYjQFNXhWmkYPbMT2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM8PR02MB8021.namprd02.prod.outlook.com
 (2603:10b6:8:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:28:00 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Wed, 26 Apr 2023
 20:27:59 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH 1/9] Hexagon (target/hexagon) Add support for
 v68/v69/v71/v73
Thread-Topic: [PATCH 1/9] Hexagon (target/hexagon) Add support for
 v68/v69/v71/v73
Thread-Index: AQHZd+cPoO5MDIvKr0ShQloK8kZX7a8948eAgAAdCmA=
Date: Wed, 26 Apr 2023 20:27:59 +0000
Message-ID: <SN4PR0201MB88086862532529245D8BBB8BDE659@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-2-tsimpson@quicinc.com>
 <31939260-4679-f582-f46b-ff79673b085a@rev.ng>
In-Reply-To: <31939260-4679-f582-f46b-ff79673b085a@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM8PR02MB8021:EE_
x-ms-office365-filtering-correlation-id: 77425199-00d7-4334-92c7-08db4694ba54
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yj1bccts46Yn/WF5SL69Rd525yFtt0Q0ECdLUmvZTsXu5KHb/g2ZPq1kvTuWhXv92lwX76Dti4GqMgRbZjGIPDkIPR3i7kFs282AD9tuxX0uLBrB/ZteaTksS+kv1CNE8hNqAkGm+3YiRsqkl/k4+xohr4Q7mnHO7/cYq2wVFBOseS6pJj4MIIJlQTw0k54BM66T7RLn0AItc6iLh8J79kS3eIhwLSea6LsfauhQQzeAx8WZVVE3Zp8qzEE7SrKJeb5T0bqNoQoftgyTuqf5bFRyf9jy9OzokmFVQtGo8Ce2J39S7hfdo5cBEpB9BxwmCbARoB5I+qPuZZn4Lg2UlbTUKw+FPHsSOBxyTFMnYSumPrAembSv5OwKFIPuVzwempU+aq57lQUFB3i1208Wb3IoIqvJzXt0X+3G5aZ6oZ/KCSCxbl5VM3bUw3fy8nOuACifM5ZeDFed71RB6lLChX5T/uyUrnipqDxqS4Rtp4TkQ3VYF9P9QtLA4ofOedFSMQlXN16IsdSGCmnENuVP8622O/8k9FQDVQzK00ed4qsYzNuP7fsNgdkNygkyv2ugSTxbVtSEScrraVug1EE3HG6tt70vBrxvB0bgKXwNCfqeUnIzXURHy493Ymgo+IdT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(52536014)(38100700002)(66556008)(122000001)(5660300002)(66946007)(76116006)(66446008)(8936002)(64756008)(66476007)(8676002)(41300700001)(316002)(4326008)(86362001)(38070700005)(55016003)(2906002)(107886003)(26005)(186003)(6506007)(53546011)(9686003)(7696005)(71200400001)(83380400001)(33656002)(478600001)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjNiYkZUSitrSEU3YkZmM1l5N3FxSkNvNkFhTHI2aEJDMkFZZCtVaFJ5cm9H?=
 =?utf-8?B?d0N0bG5DcGFHeDNvMTh2dXgzTXhteHE1T1VBeGhyZnlLMGpTeWtNZ1daZ3g2?=
 =?utf-8?B?QlFuODBIai9QblI0WDcvT3pkK1MzRUN3N0ZVZFRHK0pIc3BhQ3IrekJjZWcr?=
 =?utf-8?B?V2FIUzloS3BVZlRNQVRlTjNENmtXV1J1dnVzdHNyRzJtZC84TjYwSkNjbFF2?=
 =?utf-8?B?ZW9nSEpRakJqU0cwaWNZM0dvUjF6SVBOK0E1MmhFaXcwM0xrelNJbUxIVWQw?=
 =?utf-8?B?aEphUk4velpwZjViSUZLQUxYZnRmaFVucHE5MHBnLy92b2tYQzY2L0Rac1lQ?=
 =?utf-8?B?dFJNOUk3SWRLYkdWZ1k4eVJmL0QrQVVSQ0EyUkxJRGNiYk8xMmdEQ0xUQ0Y5?=
 =?utf-8?B?RWJwRVJyc3FlVktMS0huUmNkbElFVFhiMld4cngyZ0RMckxtTjFXSEZxaWk2?=
 =?utf-8?B?LzNnR3htQVoyQ2d2THNXZmEzL0FCcHhFVFNZQlhTNnljdGZiUndWZjB3OXFk?=
 =?utf-8?B?V0RDNXdnaXB0emQ5NGZVUThXSnZuOUgyL3Q3UElPVjBiTEhvR29KdU0yUDlD?=
 =?utf-8?B?SDI0M0RHWTlqQ1JCQTZnc29VbmhmOVdQcXhZaFd3L05hZ1RNNytNZWtsL3NQ?=
 =?utf-8?B?V3Y4MUp5STJHMy92STRpaWRWZGQrb0ljNFJvZHZ5VTM4UUkrN0JYZU9GWThp?=
 =?utf-8?B?WjJWRGl2YVBFUHhLRzRjdSszeHVWdmlNMWJyREs5emhoUEJyZVViMUViby9p?=
 =?utf-8?B?TmU2eng2WlU5dzRUU0txNjhPYk5LblJ3Rk1FRXJaVkhqazRNUU9ZNU5EK3do?=
 =?utf-8?B?UG9RenYxQVplUHQrUG0wWTU2YjVuWmloMlpYdjYvQWowTENLajhDYTlWZTFE?=
 =?utf-8?B?bVU3T1JwcGRYWFZyOW16MXJIZUZ0RnU0YmNVN1EvZ3h3QnJEWjh1dVFnam83?=
 =?utf-8?B?SDhscmJNT1ZqcVNrZm8ySEQ2YWFSS0FSSE50QWQ2U2tvSHlBeWxhYkQ4TXpu?=
 =?utf-8?B?WWc2OXpIaTFHWk41cGZiWnpzMGJPZzNBdlorODcyOGpTdGVPR3FYY2YrUHpL?=
 =?utf-8?B?Vm1VWG1Oak55RTc2YW5ZV1BlTWNVMlp6dkw3eUFZNS9ER3hPUUI5QWVGRlRy?=
 =?utf-8?B?YkpmQmVLcXZFdnlyMFlvcHpPU1lzeWk1NHcvY0dNMTc3RGFUREplbW1MQ1dV?=
 =?utf-8?B?d2pWR0lSZWxNU2ZyRTdFZGpuWjNZM2lRN1pLcGZqSmhmcEY5NGJKcmdoOU9E?=
 =?utf-8?B?NytLVGNPV0Z3SHFOblRQUlJkM2dxc0kvV0ViZ0ptVExnWG9yZWpMb2pFN254?=
 =?utf-8?B?aWNmaHozMHlVeUQ2Y2l1ak9oMmkxUXZwYThLZ1Q2eHAwQmxvTVpRU3BDNndJ?=
 =?utf-8?B?L1VnM3JPeFU2WVc4TmZmQVI1cVFuSER6eXVuQWRMb3BIUkhIUFFWS1FjVVMy?=
 =?utf-8?B?N3pPS1NxamthRWFJVlh2eFJnOWYwU2t6UFZjaUJkc1dzK2VJSUpZS0tzM204?=
 =?utf-8?B?Vk1KQUtTV2dSY0EySHhOenl1RmdReUVONXZDMEN1UTR2cDVaTjFoQkFvQ0FY?=
 =?utf-8?B?OUR1SGdGdnkrc1RvL25GMExwUGhnYjFtd1c3QXhVQkdxck9EWUovTUJOa3VF?=
 =?utf-8?B?Z0pud3Jubmo0b09qOWMvYU9Fd1RNUnhUcmJqRmFlWGpxZndWVTVWMmx1dTFY?=
 =?utf-8?B?ellONEZSUFhBN3NiSGppdmhnMzAyQ0VoTVhjczJKajhqZ0tzdlJiS040U0lE?=
 =?utf-8?B?K29STFE1MEcwT0V1ckdNTFduYVZQUFlid0xFWllXbUV2R2tmT0tSRXpuWnhF?=
 =?utf-8?B?MEFPdmY0Wm5BZG5BRVU2bU4rbkx1Rk1ocUp1MjFUazNTeDVpUkVhYTJEaHRi?=
 =?utf-8?B?bUJTQVFXU2x5S0NnWW9QZ0tIVVYxQXZ2S3dKNjV3Nmg4T2NkYlBrdlpsL2tF?=
 =?utf-8?B?T3UyLzhnRWxvTml4SVA2UXB3VExiMWZPYVg0TEFSZFRkaVJvN1ZLMmFyTUNT?=
 =?utf-8?B?T1R2M1hxdXRlQlFaQ3pkUVlKZnNORUJEOUNQY043U1YxOE1CdlpyemJ0TmRZ?=
 =?utf-8?B?a3NBM2lhY1V4MnlEMjBocUFkRkJsaFVUMTlNeGhqdGIvQ01FeFZDcUN3dnZD?=
 =?utf-8?Q?O14Z75zffn2ELSJ7jd1KkcqWc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oS7jDQNCrFaG9vt9nSlyS9yNOrz10pjvpULzAHCZS408t+ghuCFBQIzayg+KweYI2qm9FRiaRDs4fDzOxdvHYUGjF2+qmx79pk2sznsvqR/gwHobZQKofv6PdlAbtOxIibTL1YiP2T3C/TAC7Ng5tMn5zFX07KrHHG0EiYsq5OYHO+T1VTkJn2AGHCJL1ZQHlrsQKgj10Xv0ztKpLWPPK0aNxpvU8TGvlQnfwK10g2dFFe+VOw/l2TXjARS0w+hZm46hzfQXha421W18tmmVEn9renv9KVDRxvaabfi3Ajz9MO7bfmtSxzOCaDHrfVQ4Z+LtWxXhweJlgP4E0ld34r+BRFcl7OsEUy5w2DbY4HO0z/uJ0SMasckSSPKBKAMxFra2+nW0xuMeLJaDreJfuQfGwpWptHgFd29uPQEhgQx5hqxBAwv+xsnRKtob16FcdEoEs4NP2BCLH0GUTJAuTgOK6G3YmVDS9mHDAtMlqbE6SzTN7tGhjxBV6cPUNJ9EqNFHTbO/51sWA2i52TtZmFbVKwPcnHwWC9QYakTSxY4StIPq9XHa4bsbmO/9LeY9wMsWOLoScAT0bVP10KuS21CPS8JeMaK+Dd4Om9rWHwf06nIyU+Ob4mX96dLWaKdeg9c+3HywKJxDkR0rfxaGfgHnsCfj40XoJbYcqTPDO9GhtOPaxdsnXTAAUqD+U7uRrmF3G5kWnqELM+KL6S6H1nY/f/oV+t8FC7fUD7uraO2LUKK5qfWoBdvhqx48k+uEZ5bFHriozSCsKRtPQ9htbA2HQDTqj8nfzIkxMoPJWHYbrdVQhKIM8PBNhefb9UtS
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77425199-00d7-4334-92c7-08db4694ba54
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 20:27:59.8249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaSEkDg7mFN63LdYpokAeckmjAQ6Nu2tAfLcC+TNfhX1WbyDWXvTZKpI6HMYP8lq4EDBHtbkrk/TwSO7HD0pEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8021
X-Proofpoint-GUID: -tp48eGvOvrwpSBSJWjpjPLsGNPQzbUP
X-Proofpoint-ORIG-GUID: -tp48eGvOvrwpSBSJWjpjPLsGNPQzbUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260179
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNiwgMjAyMyAxOjA2IFBN
DQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmcNCj4gQ2M6IHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc7IHBoaWxtZEBs
aW5hcm8ub3JnOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWluDQo+IDxiY2FpbkBxdWljaW5jLmNvbT47
IE1hdGhldXMgQmVybmFyZGlubyAoUVVJQykNCj4gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS85XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRk
IHN1cHBvcnQgZm9yDQo+IHY2OC92NjkvdjcxL3Y3Mw0KPiANCj4gT24gNC8yNi8yMyAwNDozMCwg
VGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2Nw
dS5jIGIvdGFyZ2V0L2hleGFnb24vY3B1LmMgaW5kZXgNCj4gPiBhYjQwY2ZjMjgzLi44Njk5ZGI4
YzI0IDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5jDQo+ID4gKysrIGIvdGFy
Z2V0L2hleGFnb24vY3B1LmMNCj4gPiBAQCAtMjksNiArMjksMjIgQEAgc3RhdGljIHZvaWQgaGV4
YWdvbl92NjdfY3B1X2luaXQoT2JqZWN0ICpvYmopDQo+ID4gICB7DQo+ID4gICB9DQo+ID4NCj4g
PiArc3RhdGljIHZvaWQgaGV4YWdvbl92NjhfY3B1X2luaXQoT2JqZWN0ICpvYmopIHsgfQ0KPiA+
ICsNCj4gPiArc3RhdGljIHZvaWQgaGV4YWdvbl92NjlfY3B1X2luaXQoT2JqZWN0ICpvYmopIHsg
fQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgaGV4YWdvbl92NzFfY3B1X2luaXQoT2JqZWN0ICpv
YmopIHsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgaGV4YWdvbl92NzNfY3B1X2luaXQoT2Jq
ZWN0ICpvYmopIHsgfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBPYmplY3RDbGFzcyAqaGV4YWdvbl9j
cHVfY2xhc3NfYnlfbmFtZShjb25zdCBjaGFyDQo+ICpjcHVfbW9kZWwpDQo+ID4gICB7DQo+ID4g
ICAgICAgT2JqZWN0Q2xhc3MgKm9jOw0KPiA+IEBAIC0zODIsNiArMzk4LDEwIEBAIHN0YXRpYyBj
b25zdCBUeXBlSW5mbyBoZXhhZ29uX2NwdV90eXBlX2luZm9zW10gPQ0KPiB7DQo+ID4gICAgICAg
ICAgIC5jbGFzc19pbml0ID0gaGV4YWdvbl9jcHVfY2xhc3NfaW5pdCwNCj4gPiAgICAgICB9LA0K
PiA+ICAgICAgIERFRklORV9DUFUoVFlQRV9IRVhBR09OX0NQVV9WNjcsDQo+IGhleGFnb25fdjY3
X2NwdV9pbml0KSwNCj4gPiArICAgIERFRklORV9DUFUoVFlQRV9IRVhBR09OX0NQVV9WNjgsDQo+
IGhleGFnb25fdjY4X2NwdV9pbml0KSwNCj4gPiArICAgIERFRklORV9DUFUoVFlQRV9IRVhBR09O
X0NQVV9WNjksDQo+IGhleGFnb25fdjY5X2NwdV9pbml0KSwNCj4gPiArICAgIERFRklORV9DUFUo
VFlQRV9IRVhBR09OX0NQVV9WNzEsDQo+IGhleGFnb25fdjcxX2NwdV9pbml0KSwNCj4gPiArICAg
IERFRklORV9DUFUoVFlQRV9IRVhBR09OX0NQVV9WNzMsDQo+IGhleGFnb25fdjczX2NwdV9pbml0
KSwNCj4gDQo+IFRoZSBsYXJnZSBzcGFjaW5nIHRvIGhleGFnb25fdipfY3B1X2luaXQgbG9va3Mg
YSBiaXQgb2RkLg0KDQpJJ2xsIHB1dCB0aGVtIGVhY2ggb24gYSBzaW5nbGUgbGluZSB3aXRoIG5v
IGxpbmUgaW4gYmV0d2Vlbi4NCg0KPiANCj4gQWxzbywgZG8gd2UgbmVlZCB0byBwcm92aWRlIGEg
Kl9jcHVfaW5pdCgpIHN0dWIgZm9yIGVhY2ggdmVyc2lvbj8gU2VlbXMNCj4gZnJvbSBxb20vb2Jq
ZWN0LmMgbGlrZSB3ZSBzaG91bGQgYmUgYWJsZSB0byBqdXN0IGRlZmF1bHQgaW5pdGlhbGl6ZSBp
dA0KDQpJIGNvdWxkIHBvaW50IHRoZW0gYWxsIHRvIGEgc2luZ2xlIGZ1bmN0aW9uLCBidXQgYXQg
c29tZSBwb2ludCwgd2UnbGwgd2FudCB0byBleGVjdXRlIG9ubHkgdGhlIGluc3RydWN0aW9ucyB0
aGF0IGFyZSBhdmFpbGFibGUgYW4gdGhlIHNwZWNpZmllZCB2ZXJzaW9uIG9mIHRoZSBjb3JlLg0K
DQo+IA0KPiBPdGhlcndpc2UsDQo+IA0KPiBSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxh
bmpvQHJldi5uZz4NCg0K

