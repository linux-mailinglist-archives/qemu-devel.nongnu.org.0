Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD46DCFB8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 04:30:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm3lc-0001Nc-Tx; Mon, 10 Apr 2023 22:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pm3la-0001NS-V1
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:29:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pm3lZ-0004FZ-9E
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 22:29:54 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B1TlMI004204; Tue, 11 Apr 2023 02:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=lIOIq6kwObyl2IE5bYid+hitNaVx/LKPMELMU+L4c4g=;
 b=VN5UJfmOUN6/clMxmeYLUTrIYAgLy1e4/vVc64WFsSqrRXtmrU3HB/sG5H2lz9r0e8KB
 QrDwIpsTaUJXJ6IPrl2T3lpPnbgty+pnKITq9JJZYeMKlfpim8+PeX41Z86YC3LjiO2k
 +exk4Owln71pYkJ/RkANCDbgT7dJRoHOxzHdoyLcAdgU/ZdAs1n22iw+SI3xxtTN8fWs
 Wls/Y56iUKAU4W38EpAvGEi33PJFhYb5KT8Hfc4wYV8XSY7XuN5ilO4ZJXrNHWGJZQS0
 UIBPgHiQqLLf6KwuRqS9ht8H81ihl6rdJNLXUJadDmiGodGI1Do3j4a60YiZdT57auDQ vg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvmb3h7ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 02:29:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csv6PXR2pefzRArPY7taWnez+eaOlnpx0bvoH19ZKlBPe42cx2r93UmNkDPgYxoWifc3kNXJfaQurhy7MwOQor4g9e745T3n9NQkeOHZeOCjMAk+Xjb7Kho2fPQlEYpapXGsknrOCNJg7osj5JOjxscKwI8CRZWYs+dWDTjM+/zyw68Y3PRmy30jkLnQU8zEoluZIZ/f6H0tr6I5a+kV2roNhXbrgaRoebRtyVfggqdighSGGoIBt4pCMc7lUyirHHn4DnzOydEQx1Dy6DEmOseSBVQnA6Zb3oogNo3Jouz4B05uorbUbNpxlAOewCX5LRaLzBM8lizasqMiajt5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIOIq6kwObyl2IE5bYid+hitNaVx/LKPMELMU+L4c4g=;
 b=U1azL5a01dcvtuqq3dv/ALsDsUZb1WhPQdehMHmH9ixM+xqOAjoYhmsm1bVoiZ7MnNpMjXCbUngI6NPv8xIZu2h/eQyHWuBt4aezCkQrf3lUz0s8A5vJ0KqhhWDyZ/SDd1oDi8OaQfvmWcKjNs81kb9FF5rgh7kBG0ijI92aP2wVhJ4HMq5bGBqqwe4ZA43Gp8ENzstI7S9AD+fZUdsRq1YRd/GfrvvEsCcug/plrvCEfg5ZuPd9ykP8c+j+8EEdXVGmlMg8tAPhP1xgPZtQ/L4aAoVxCTFDRQyKNrVzNcP/JcOhY6kHpIoORJ+WYwj9nhHr+g9bxBzolj77WaH2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7632.namprd02.prod.outlook.com
 (2603:10b6:a03:321::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 02:29:28 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 02:29:28 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Hexagon (target/hexagon) Add overrides for
 cache/sync/barrier instructions
Thread-Topic: [PATCH] Hexagon (target/hexagon) Add overrides for
 cache/sync/barrier instructions
Thread-Index: AQHZa+pooF1YjCbTtEuFIt72wmCpt68lUmwAgAAPo7A=
Date: Tue, 11 Apr 2023 02:29:28 +0000
Message-ID: <SN4PR0201MB88080603B7D90240DB17C2C3DE9A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230410202402.2856852-1-tsimpson@quicinc.com>
 <0d07641e-f37d-3589-58c9-d992ab70a985@linaro.org>
In-Reply-To: <0d07641e-f37d-3589-58c9-d992ab70a985@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7632:EE_
x-ms-office365-filtering-correlation-id: 9011c7c3-b86e-415a-1d57-08db3a349338
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4C2R/hUlmbboNgxwRS9Hyna+tqgOHkJTcnV3QJaALZHcqUuX5TDGdjtSmHQTD7iTvYKMOzXj4qSITBVGo0Bx6QNOZ8j3MJ99lSp29Ftzj/PbzOGPzylW8abNAm6zL2s3hpiJcs6OiixpGyGb5nuoxyZgdGuupRNj60nRHI+bvzhlnMSZoF2latFEk0AuB3K2o4VK6+rmwwPSTmRaDchJBWPV/z8CufDzVVrOpqrqlh8dr7P+alUUQnnH+dMD/aSq9yBTG/Or9Hs975gfOqbJcakQ8kd7MgQ4Q+IZweZoQJ2biEH+5tiNHEyeqE0NwUJ/AGg3cAWOp7F+jnSj1rPnB7uqEcjhREiQx2O1tV8IQXaz7UcfqOaevwJXJ8OoNiwBXvB+YZZwccvrgR00xf5lN3MFbJoYQNWLriN/75mrasGA+spcF7ZUJresO7Gsxmx7r+HWgUBvDNPT9pUUaxyb0+JIOf+Tsioe/9iNIQReV5+fjwG/NcexSBVTsZ5qX3Rd1zf/TzEJbe07YyGh1BAThA/QPp96OUBAZi5/qVhP4muwr1c/QiIbOCNFvsZ6U6lcc4u1vwJFdx6MkCrtXODXhxeeBJTanCzGjCZEqh+bCNAeELY1gpRW79FNjOLopAZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(71200400001)(7696005)(478600001)(33656002)(55016003)(86362001)(83380400001)(38070700005)(38100700002)(122000001)(107886003)(2906002)(54906003)(110136005)(316002)(9686003)(186003)(6506007)(53546011)(26005)(66446008)(64756008)(8936002)(66556008)(5660300002)(8676002)(66476007)(52536014)(41300700001)(66946007)(76116006)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejVuNFhwMGFkOGRVR0JVeHc2djZCbDZxQVRoZHczRDJjajEwTHhOSWF6WVhl?=
 =?utf-8?B?MXh6YzB5bjA5UlpHQVpTcTN3c1lteTFQL0tsVnQ4MlNrbVl5MXpFcWZ5VUNB?=
 =?utf-8?B?OWRodHVYOGY3UDhDMU81ZWl5aVk2THR6S0NKUkREMHg4TXcvWlZyOElLWis0?=
 =?utf-8?B?QmVWSlMySy9JVTFXUGJtRjhSVHpNamNHSUNMMmlVcnlZcXNXQUZQVGZzZFFV?=
 =?utf-8?B?STZZSGJ2WlMydkJHNzIzbnpBYWxvc2V6ZkJKaml3emU1L2xtb1hsT0RGZ2Yw?=
 =?utf-8?B?c2hJdlpUSjZTdFdBRVRvMS9mZmZaQ0VJd2hoRFNkR2dDR2dHWFdQZ0YxWlRB?=
 =?utf-8?B?ZEh2Tko3Z0llOXdWTTVYU0V5RWxWRlZmU0NTbHgybWk4bllnMWkvSVg5WGkv?=
 =?utf-8?B?UHZiSVZZUU92Wk5LNFFZZ25KcVB0WVhkTnFFRGV4S0VQQmxscWNZa04veThq?=
 =?utf-8?B?VVNrNGlnT1VKbzFyejlxNFVmb0Jqdk56L0FybkhLNjQxZlVYc2RXN1JldDVI?=
 =?utf-8?B?empkQkNTWWlqY3dtc042RlE3S2hITWR3UmcveEZ5SmUweXQ4UmlZOXk1emty?=
 =?utf-8?B?UnNmWThidS9jRmR4MXVXQU5oNHNuTzF1RGJ0RStJTk9XOUMxQ1J6SFBMSFNx?=
 =?utf-8?B?RkJiOVh5cFBDMUtVWXlVQ2dLR1pPZUJMMHZOMGNIYi9SSUVQUDJ2VXBEZWMx?=
 =?utf-8?B?eUlIVm5iQ1ROQVpqcFpUcmNpQ3Y0QVpwSWc4WGxiM1llSTgvcnYyTHA1Vm02?=
 =?utf-8?B?T0syczgyT0U2c1hnbEprKzVEM0lmUmFLRmhUa2RIaVhPejVTT2FBOW93NkYx?=
 =?utf-8?B?RjlpSmU1dEgzY2RhRUZYM0xMT1I1eHVkemU5eFp4NnduNHQ0RE5rSldKazB3?=
 =?utf-8?B?T2IwT1l2ZDk4TDl4OHVNUVFpRyt3VWo4c1U0VkdLT0RQU1RXangvZkQ2QmM3?=
 =?utf-8?B?NGg3Z1hURkRGQVFQeXdYZi8rcG9KTXA5ZEZyYk9FdVBBM3d6WURtZ3Zpem11?=
 =?utf-8?B?YVYvb214YkhBR3NRSnFGY2l5MVIzUGJ4NEtBUWQ2dy9tQW9kMnhrRXVmemNO?=
 =?utf-8?B?YSticjdtaFAwcS9OYy9Odm8xRVhhQWVORk0wTmZhTlJzWFpKOG43VkZIbEF4?=
 =?utf-8?B?N0Y5VTRZeXdLL0QyVEgyZkdoVG8rRVE4T3dNa05KUjFzMlI4Vkp3R1cxbnZU?=
 =?utf-8?B?RkxLYXRXQjVjdTV0cFNJOEFvb09rVFpreW5CeEdUZ2M2YXlZYWpxTDlqV1Js?=
 =?utf-8?B?R2ZhNlNQVldKbmwxWXVWVE1WZVdRQXlQcEpmMnhlV001NFNMaW1kMEd0aXFZ?=
 =?utf-8?B?bWxGT25YVDVRb2s3d1VUSHlsMVRxVWwyanBBOTBBSngvV0xrdTdKK2dianhx?=
 =?utf-8?B?dGVVTXV0elNzRGFPNXhaY1dEbm9lMkJUTWVST2JCazlQejhNZU91T3JBQldS?=
 =?utf-8?B?ak0rdFh0S3VmbFYzbjhXZGh6eTZRSERoRktlNGY1N2hpM095V25qSjlHY3JS?=
 =?utf-8?B?OWJKMzd4REtQRU5zcDRNb2hXSjc5S3k0bzY3ajZjenJwQjNYYVJiMEVCQ3ZB?=
 =?utf-8?B?MTBIZUVzOC9jSjZvK1VpYTlkQjhETnZJUmMxdnpZWjloYy9sNFF1QXgrLzd1?=
 =?utf-8?B?c2xlMk83WjhjNG1UNHBkOHAvVFBoakptQXE0cnJFc2hmOW42L1lIMlV5TE96?=
 =?utf-8?B?R1Fvam8yV1AvU01XS3NsVWViTUQ1d1ZxTmRrUXR2dEp4QVppcEdySnZYMXVE?=
 =?utf-8?B?YVFqQnpEelRMeEVzSTJFRG1mdXhuVVBxaTMvRHFIS1dScjNUNzUya1FnODgx?=
 =?utf-8?B?MmxaTTA2eEJYa2R4SU9RMmMvMnVKNkdEOTI2cWhVOW15WFcwWExkM2k1K3Zl?=
 =?utf-8?B?ZmIvK1FPWk1UdVZLMldoT2tGY2lEaGdBclVNWjl6WTNjTTFqT2UxQXZlSHhX?=
 =?utf-8?B?U053QTNteVI5OUhzYWJScXgycVd4TEk2dEpxNExwcDlkeDZCQzBoN04zOHdq?=
 =?utf-8?B?REZnY2ZkQk1vUHNJRkRHUWUzaDVFYlMvdVMvSmd0RDF0OFU4SjJWN1prOHUw?=
 =?utf-8?B?YVN0WXgwSnd1eklXUDRMMklwNGxwNk5ndVpzYVBQV01JdFIxbHNvdVUwRzRK?=
 =?utf-8?Q?D02ynsAUvqsL8J4SsXSGoArXW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: er2dN3DrIfvWr3xTULmdHUfFQERLF5w9iZ9qMCnck4ga8mBLl68FlhlnrRxKsl65jcGCxhLGkchocWoDnq9CQCx0d/dpv7TDyIbF27VqG6GpAUXIfXTA5sy69VGvx6fbgsnhRmSqUGrSJPsaM8Sd1UUEYUvBhYNr3NneyjGpD6F5kzydT/KoNEwfD2OQe97muPevDhXUZXT9okiyX39QfGKodVbJVZ/YFYd9XDJat3DxCn29LKNbY0Lfk8Sv6+HW5ltVhaM02Cxx3P9/ByeK32LtLRSyNeWyEvfiu6bgH1wEu1ponLaHQca58e7bZ3OFYBNabqlW38X/qBMowIqf+d8pQdFfMathnwIxmhVALCXTWEP4o83296uhxnt9mjCphvOtnz/hVdez2+l98mB5i3aOQk5+aMchmkVMbZOCfidmOKwqO5aOXbpZpq13Rsjqhyvmr224coOF+kQg/K67BVCLAN2rirR2dmlLdmVMX4Qa+1qLB0ED9YB6LnqJ4VLG1kJNeYFJYemde3q1aVTQboJ5wmt7TYW77GHLdc0boBMcP0TmiwV8xbId4akSdzwc41dm3VkUZWa1SNdiRhmMwvJU7WyLHNtvvofunUWzeqY4weuXHuvF7b8gKbdGKoPUYbVJ0803Q9s20QbF2HqiEWoiOaw4ElKnhEZ/MIMdxuW+bMaZ9suauUYGjbPv3gnL91BhDPLAo5ZcCLzEbq5nSCunUBHZ2xfdDe4j4w+wtt9/81Ia7zamD95OU1bLNlVvR+ZjOwUEV8I+QHKemGiLPMaMgI1jNoNPdI8qVL8CtNMH6p+GgrMSLPcbb6jMG6St
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9011c7c3-b86e-415a-1d57-08db3a349338
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 02:29:28.5487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YdUh7bqGeLeC0M4LT/7Kzc3l1SFS7l8I3+enmVOQIhjeSbWu6z9oFlQcZGmuE8BNpuPcm9Qp4gzMfFA+qB2UFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7632
X-Proofpoint-GUID: qpWc_jbQIOHHedGLQNdmhCYRUC7yM8El
X-Proofpoint-ORIG-GUID: qpWc_jbQIOHHedGLQNdmhCYRUC7yM8El
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=556 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110020
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwg
MTAsIDIwMjMgODozMCBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgYWxl
QHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29tPjsg
TWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVy
cmlkZXMgZm9yDQo+IGNhY2hlL3N5bmMvYmFycmllciBpbnN0cnVjdGlvbnMNCj4gDQo+IE9uIDQv
MTAvMjMgMTM6MjQsIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+IE1vc3Qgb2YgdGhlc2UgYXJl
IG5vdCBtb2RlbGxlZCBpbiBRRU1VLCBzbyBzYXZlIHRoZSBvdmVyaGVhZCBvZg0KPiA+IGNhbGxp
bmcgYSBoZWxwZXIuDQo+ID4NCj4gPiBUaGUgb25seSBleGNlcHRpb24gaXMgZGN6ZXJvYS4gIEl0
IGFzc2lnbnMgdG8gaGV4X2RjemVyb19hZGRyLCB3aGljaA0KPiA+IGlzIGhhbmRsZWQgZHVyaW5n
IHBhY2tldCBjb21taXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbjx0
c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRhcmdldC9oZXhhZ29uL2dlbl90
Y2cuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggIHwgMTggKysrKy0tLS0tLS0tLS0tLS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFJp
Y2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiANCj4gU29t
ZXRoaW5nIHRvIGxvb2sgYXQgaW4gdGhlIGZ1dHVyZTogSSBiZWxpZXZlIHF1aXRlIGEgbG90IG9m
IHRoZXNlIHZhcmlhYmxlcyBsaWtlDQo+IGRjemVyb19hZGRyIGFyZSBub3QgInJlYWwiIGFyY2hp
dGVjdHVyYWwgc3RhdGUsIGluIHRoYXQgdGhleSBkbyBub3QgcGVyc2lzdA0KPiBiZXlvbmQgdGhl
IGxpZmV0aW1lIG9mIHRoZSBwYWNrZXQuICBUaGVyZSBhcmUgb3RoZXJzLCBlLmcuIHBrdF9oYXNf
c3RvcmVfczEuDQoNClRoYXQncyBjb3JyZWN0Lg0KDQo+IFRoZXNlIHZhcmlhYmxlcyBjb3VsZCBi
ZSBtb3ZlZCB0byBEaXNhc0NvbnRleHQgYW5kIGFsbG9jYXRlZCBvbiBkZW1hbmQuDQo+IEV2ZW4g
cmVjZW50bHkgdGhpcyB3YXMgdGVkaW91cywgYmVjYXVzZSBvZiBUQ0cgdGVtcG9yYXJ5IGxpZmV0
aW1lIGlzc3VlcywNCj4gYnV0IG5vIGxvbmdlci4NCg0KSSdsbCB3b3JrIG9uIHRoaXMuICBUaGUg
b2J2aW91cyBhZHZhbnRhZ2UgaXMgdG8gYWxsb3cgdGhlIFRDRyBvcHRpbWl6ZXIgbW9yZSBvcHBv
cnR1bml0eSB0byBmb2xkIGNvcGllcyBhbmQgcHJvcGFnYXRlIGNvbnN0YW50cy4NCg0KQW55IG90
aGVyIGFkdmFudGFnZT8NCg0KVGhhbmtzLA0KVGF5bG9yDQoNCg==

