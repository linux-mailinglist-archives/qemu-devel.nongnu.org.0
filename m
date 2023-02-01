Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29743686E52
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNI4r-0007A0-3x; Wed, 01 Feb 2023 13:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pNI4o-00079J-VI
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:43:22 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pNI4n-0001ZT-64
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:43:22 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311FTApq031680; Wed, 1 Feb 2023 18:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=NC6zvQz0+KavNU/KUzUECm0jyQSPAf2EzK9ZQzKVJNg=;
 b=XW7oVeRO9B+TgvlX56/+BEK+Oe+cG/vcpRWq5oPQ/HaHBq44EWGaXmOLSG0jekJ0SFCg
 YgiLMXUqnekb4Fg5XMhqdDqn0K+d0dKWU+4Gw1AkEFb9PnKAsmgWek1XtE3p5VLJB14l
 iPNk+CfZPL/WvMUFrB+gAiFcl7rNFzbaW82GusIqenYnDc/+n8jlP7W7LKH2ugWdm/tq
 4gWtqvVjR2wpwXLTDCei5OQd9PaqnDIBlvFxBTUUIqoJSpoRVRgXbQ0SOIUh473EEdsQ
 DKxNCWxRY5JY01CEsOAS/GnZ8WFndu6S1lfp2gQGnunQNEpb5Cybh38CRLRoY3gpmjsE LA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfqsy8r57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 18:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwYSduk4YhQorCFFyA7Fneq4nH4V9TM48yakW7T7mrTlCSm933EdUHWOjk9bL7W18y55aYqNCwKk8tTHzuAKhKi4dhrqwxLbGjwFVjkd4I5YXnz+RlLMrQqtr3sYcOV44qCwkyYCv8jL1aq6wT6KciROLmyWRLKo2YHvTJJ8QZCokI5iPGM8zbGkw6qJ0wScywbUKb6i7dNeUlbEanJKwO7gf19cGRlZHwJw+ZzoLWSgTTmLoJI0PhCDrAuMGG51biv7cugol4edRMEB5UqIdUftTm93Y+wWFLYKP79P0rxUTVyvKvXEIxTJNTqg9azvbBzl1zcM/XdkJzPHzLj9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC6zvQz0+KavNU/KUzUECm0jyQSPAf2EzK9ZQzKVJNg=;
 b=Gs6ORc977q5N4LENoQy5AcjJ4wUjjwifMYfCPw/PnavB8POwTRwMOndI6YdBM7yV5Sl3zJmWR/e+RNMAniwSLHpiFrkZ+/iPnEejkbQUgTQRFefGUExopco04Yi8Ks6RJND9/z/jLQrHDsUPjSONuPjsnk7WnoTXTxns7kxfdrVrwaoYbsuNU3PcIxJe4MIGTgFga8SmOgjCIoUDg/iFI/Wo/flSgYK4NyRM5SmrkwZvByuuU/pkQkZZ+NiL51SJscuUi4o0BBfgEnLpuOi82fRYDvBCrcSA8fQhI/5JitEUeEMqq6FrC9uUFDAa6bzBKjdQOXe4/AZ38v/NQ1xhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB8841.namprd02.prod.outlook.com
 (2603:10b6:510:f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 18:43:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%9]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 18:43:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v5 03/14] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Thread-Topic: [PATCH v5 03/14] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Thread-Index: AQHZNcdSGuOC8XuKD06kXGI2N+OpHa66BjUAgABoEaA=
Date: Wed, 1 Feb 2023 18:43:15 +0000
Message-ID: <SN4PR0201MB8808ACDB7F0A57FE93D84266DED19@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-4-tsimpson@quicinc.com>
 <c87a9757-5caf-cbd7-13c3-6afc08ab4af2@rev.ng>
In-Reply-To: <c87a9757-5caf-cbd7-13c3-6afc08ab4af2@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB8841:EE_
x-ms-office365-filtering-correlation-id: 433a12b3-68ad-4e1b-1e30-08db04842e03
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBBffAbfbnhYdJYvi4a2tSNxDXvFoJGmPhVSPNtsa5j12oD0aeg3zZT8j1WEDKY+tMvPEj2o5LTkO59qwQokY5GkR9bp+PUjdVW/nBTMUy2/V1sIhfZ/N+Qq/94gt1CqXLGGHJanRDB0GanSV+KnIWExEE5DBxekhra0AwNxJLGNGbYvwiUIpw9tnyRTvxJHAvmJhaAvgaSj1QcE1l7ejlNnm1ULCGgNrD1Wok188WVtfZ2B2sSdi4bAC/roRhffu17YG7GVpJYhmlSf9ffe6xbuthcVmmPHnkN1sikyG2k1B1Dak8FpvXkjsjUhS5dt2VTiW9PW/CuEfz099apleNEZIdXF6IzCp0SfjUiXwPHlNwA4+PDEcnQUtKkJs+Jo410upsPxs5syOzJSsfX5mYyxc+HBIxNc+ma5VON9VnYgcZwX8Y/hz7xQ9FoMqvZ2x/yyPUOWR9LxmCpk+BGJ0jnhOmunxiN09/31/pStCtIAl0Js8NMe2mcWA8MRP5Cq1EJGAn7wop5bwAZcgWjZUwJwsHmae/by3zJ3uSbvUuXW3QNHu0gPv08tnEFYOi5k5SwMzQ9RDmWON2xXXf1ls81odawZHTVacJj3dQlVcPnpJIkGop2z2S6XdyWMnOweLR4X7yPFed+lmKq8OPR3r9hA6Hi8rXJg5JSzt36WtIGyL8AJN4RXT5MmZyF/SEZLUTrcSWVfDzWfni/ygxJZWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199018)(52536014)(8936002)(53546011)(86362001)(6506007)(107886003)(26005)(478600001)(7696005)(38100700002)(186003)(38070700005)(4744005)(71200400001)(9686003)(122000001)(5660300002)(54906003)(110136005)(55016003)(33656002)(2906002)(83380400001)(4326008)(8676002)(76116006)(66946007)(66446008)(64756008)(41300700001)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkRDcHdBSis4djYyOS9WeGJFUnZsdmJISVZMcEFXZ2todk1qL3Biblg1a0hE?=
 =?utf-8?B?WUx6ZG83cHJ3b2MxT1hvdDFWSFcxeXdHSUVFOS9kbForWk41ZFpZazNKbGdC?=
 =?utf-8?B?U0FhbXFMb0V0MWRMaW5taEE5OGFmM1VoUVVCZmJhbmEzazF2OXBmeG82ZlF4?=
 =?utf-8?B?VlM0b1Nrc3MwT25qbGR5cTVUVzJ4TlUyNkQ2bE5CQVJUWjl1cXJSL0t5YXFl?=
 =?utf-8?B?aHFYWlY2ZkdMeEpQVFVWdStsVURxU2dzOVMrOVNGdVFteVZvT210SmZlNlE4?=
 =?utf-8?B?Zk1oUFgvaklaYzlUcHBycDBQWEhVVXozNTJZQlMvRWFRa2FRVUwySGdKNkg1?=
 =?utf-8?B?ZGFkY05TcmNwencwL0dvYS95UzQ2Z0Nnc05WNThUYWZYZVJWSnRiQUhOT0dk?=
 =?utf-8?B?b2UwR2taL2VwakxnODdyZlVJNnBSbGxoZXpwRHZadm92TElHTWluRTY4VmVz?=
 =?utf-8?B?NmNSYm5zTWVLeEVRemdxQVNXZFpTdkVmMGNqaG5SMGpXMlQ5K0Fzblh1SjZa?=
 =?utf-8?B?Y1VBUHl6Uy9FSXJCMThYSXRlZm4zMTJqdnBudGxZWmhzWm0wbEtHU2NzQWJh?=
 =?utf-8?B?aGJyMnhoWGMxc3pWOEpNWmZOOEdLeDFzT2ppYzNocGgrZWZBaFBaVWd5NW1u?=
 =?utf-8?B?OGx4Q1dWK3VJbDdSMERPaW5kSFFBanZJNU5pNkRLaFV5YlVCd0tyUVZmVUpw?=
 =?utf-8?B?MnpRQk9zSzdmRWNQc0RNVnZsN2NvblJmL004OGlNWTZpMDdqd000TEh1WkVH?=
 =?utf-8?B?dUhhWERkZjBmZVhtdDk3cjFvZ3NoeWQxTVhDc2xuY2I1Q3VnWXNSVDhWSGMr?=
 =?utf-8?B?OExzQzdYcmdHUy8rN0pPNERacWVhTTNtQk1ZeDFKUFR5aGJxdlQyczJkTHYy?=
 =?utf-8?B?akxJWTJZYlhMZUlrRUNPZHdsUnJ6Sk9GM3ZoSk5oR096a3dXRVRBQ2h0Y3Nn?=
 =?utf-8?B?b3B3blFNZXByRVc3Njh2OGpjaHkrNGtraDZYaVZzSFd5L1AwVVVETVFGbk5Z?=
 =?utf-8?B?QWRFbXUyQmF4ajExUFlzMUlQWVNLM1NsZUlPczE5YlVLaCtoVFFUNll3VStw?=
 =?utf-8?B?WnFiWlRyYTA3WDdldHAxMHhWdGpwc0kwWHdubjBHMWhXYzdHR2U3MGRLK0E1?=
 =?utf-8?B?Rno0OWRGN25Odm9nbHVvODBzOXJnR0c3OVpBZWV1VmlvU0xUKzduaXNQV1Bw?=
 =?utf-8?B?eUl6Nm5mNzlNYzRodWxaQjB4cFlxejNXbUxvVERXZmxvaGVUaVF3cWxDSndI?=
 =?utf-8?B?cm41ajdVZ1dTL0wzR3d1RDhtN01TV0NNMHpYRG02QUt6bFI0Z0hOU1grVktK?=
 =?utf-8?B?empLandKT0dsU1Uwb3JIR1dTYkRhcng5THN4RXFzZ0hpcUpvSnFmZFk3a2k2?=
 =?utf-8?B?aHdKS2xVdENDVWV5eEo5a255OHhEU1N2K3RtT3ozVllTbnd3RmxuQ2VPdGcw?=
 =?utf-8?B?TDRIa3l4OWtMOWNVQXFaeXo5bzlXUUkvOUZ0S0Zhb3Y4VXpOMFFYTmx4eTV2?=
 =?utf-8?B?RHl5eW5qVGJpdm44cTl0bURGeTgwSXNLVTdaUDBSeG90dkRzWlptQ3NLV1BN?=
 =?utf-8?B?N3BabVI2Q0dtbGZhdG1nM3BicTRsWHlpWisra3ZXZDVDRk9yWW5TZlZDQmZL?=
 =?utf-8?B?TnNjeWhoWnlzK2w1bUZIb3NUV2pFTU5RVFNuM3A2ckROeTBaejV5R3h4T2JG?=
 =?utf-8?B?NkpJNjhxejdpVEUxQ1U2OXJ1Ukh5U0hjTUJvT1Z4ZkxUbGZjSkZzYlNzY1Bz?=
 =?utf-8?B?S3l3MXVXdnlveVZpUUhEY3hjNHpuQkphL0UydDJLNk1wcExra083OE5xdW9z?=
 =?utf-8?B?VUMvNDRCOFlLamRzTGR5ZUN6YTFTcml2Q3h3cWh2bDExZ3YwdklBOWNlZDcw?=
 =?utf-8?B?RHZ1UVhQUVpIa2E1U1U3a0NzVkZNM1hIWURFakV4THJxbHBZY1BjSlV4Mmh3?=
 =?utf-8?B?aUtMTWNVQXROSlBxMlpwWWJrWXgza2FxWUI5aXlpeTRKcVNYVnc5M3JsNEdw?=
 =?utf-8?B?S3ZrOUozdDVXLzFxN2pmbmR3SHppaDg3Y2p0ejJrZE5uUWltc2dVOVNBcU8x?=
 =?utf-8?B?UklxbGJvOEE4OEI5MGdxTDdEajhwamgyazhRNHlzZzUydEVXbk5xSTUwdGlX?=
 =?utf-8?Q?4FKoxeHNGfRMlLQQ+b6M8DKb1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Sk0z8aYO7jy0dwXucDW3QoH9fcdbYY+X8lWmTUvogok4Lw8YnE3t5fh71so9PlZ8nwSvEQZReVbqn3qbqx255U/9+SAU6OqpeJnkhpnAI4nsYIJRgsZQsZOO8p0m3TEpe/gEgDtxFXlKPrS+I74itzZk9ek4upsrIADy0jGCuL5ODVUjDIM0R7rjxDoj2Dg0E1GH6ENxhMm87udFeWgQ9d2vkstQ5MDZNHoYSOHoTfPhaUsAIq1Hl6KgUA4Up1IrwWe1sCgiR/AEd0ac/sqg4EmedkumOxU8GnVYYpp6RIMRwbhGJjEQfbZ4nJxxAt5YxnEocc3Ho7e9e6oIyuegIc5fRav1XoGuUxZMKHNLGObxTNZZQd0ypFMCThrYhh+FrmzMna9/tz8NYqQbtc1tcRK8bLMIK8pOMg1bntdi345KmpAq/Rhp7Qss2U7acu4k7jfkiFQ9KyHOEViYMYr4BDOVYiPgkJHa5RPxJi1Lg2T554mrEu2MifAiUo7lWWNmJdBdskNgNpXjkdhmUvxKqUvdptMPADfAV2teQlyJce9Oy/YV2449zpLhnAiq9pueR27Tfm1p9qHR/eQ0RVFbumoOJe98va9mweAiK7isc+SNaB76PU6HPlmZ2Y+aayHdsjnTgqmS7LWLi/NTGkeFCHj/XjenfMO1jiwaprCPZbztmouR7tvBWPCh1tMo6yJoVEkl/N7wtr6aOe3a/DtZXGJrTjlh3SKAZwM/yN2qNO0/BxVEOxH+VOKdU3YDGSfBnKZCQUm6m52uJRwJ+eXwKfmyB+sJ0pV7QEhkjA50GcIOkSw40Cdxe5ogRHJN8UKA
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433a12b3-68ad-4e1b-1e30-08db04842e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 18:43:15.7051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1eUQ+PKka5o859pdwpZo8V98om13B6GqF+oIlpmaT01fF3qu7HCNmq+nPQbIS7+KJC4wfHMQCNz1L3V8vC6gDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8841
X-Proofpoint-GUID: IxKtol3GbjTjF2aSfGPd82e-o1LtQEyq
X-Proofpoint-ORIG-GUID: IxKtol3GbjTjF2aSfGPd82e-o1LtQEyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=475 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010159
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAxLCAyMDIzIDY6MzAg
QU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiBDYzogcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcGhpbG1k
QGxpbmFyby5vcmc7IGFsZUByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMy8xNF0gSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIEFkZCBvdmVycmlkZXMgZm9yDQo+IGVuZGxvb3AxL2VuZGxvb3AwMQ0KPiANCj4gT3RoZXJ3
aXNlIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCwNCj4gDQo+IFJldmlld2VkLWJ5OiBBbnRvbiBKb2hh
bnNzb24gPGFuam9AcmV2Lm5nPg0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gIEknbGwgbWFr
ZSB0aGUgY2hhbmdlcyBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMuDQoNClRheWxv
cg0KDQo=

