Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467F865F8AF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 02:09:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDbDQ-0001WW-Ke; Thu, 05 Jan 2023 20:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pDbDP-0001WA-5g
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 20:08:11 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pDbDN-0000Lu-8Y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 20:08:10 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3060xVdC014157; Fri, 6 Jan 2023 01:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=8D9vRnvWzDsrlV/tUhkatTNXukjUG6CXIwevIyxaECQ=;
 b=Vbd+NYyZCbFs19B1VoeHLuRD1OHohBMgvRJQnjNthFALUydi6L8ezoRL7nXpcn+N+UWZ
 cYdDFg9e04GrILlBGPqVRdo398Sl3E5F+5wOwAyPw9OUYunBk1KtM7RFvMLXKup70a/Y
 UCpZaIG0iTV80h0cl7UCCCoRxTaBTQ6YZbzAw3H6jxACG031YrQ2Y7XV3xSsx27USlKC
 9G8a9Jr8s2mLnPvL4LgOJgSL7NPQz1Hvb10jVnh8Nq/5vTBgYBgMHZNTbokWo8+S2M9w
 Krp+WSx65X6AC7y2PhYc5VmT5MtKheK3RtQSPuY09mbhMoArpW6akVMEUEA7p/3TrAhI 0w== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx9jfg0jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 01:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5ClkkNUzvijTEBmkVUTWWn5Vw5b0ojCKYoNBBBhYWhAfNasa8OIYzYh1GVK99e9vvUPbmNxGvMr4n3haziB0F0ib+YaB4OF051hN+rbzuH8/OznnAGXVU2FVxjNXbU9orQQZ+/iyXxdXfs6Gpxzh7nWe222hulIV4zxa8vtHXy1s+eTBTu0lMmSiwKBFn+7B3wcfP8gz6CGJP2fq5Kz6LqvtSv/1jn1r9VwjfGlpm1CV64W8jlVXBg8LW2h+pD6kGa29MqDXFRgkyX94EUvOnQeO+d1M8VE1Lfwc4u4qXMvJSarqaXNR7/kF6aNw3a+MjjmPgZg9CwxBj+fNcdajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D9vRnvWzDsrlV/tUhkatTNXukjUG6CXIwevIyxaECQ=;
 b=cOvyeyW3dk+fz9hKXRrBmvta4tRTLEM6773uHKcMqIk2PvBNvF0Tw4wf/cwPVU9h7i4Cr0pLc7uzMjInenPYYsR1E+JbEQjys7Dlo0ahN2rANJnMyPxok2qWI8CpILtibhmHwbIiw3gKqx2oHGbtkQFRs/ilxPFkpRw6GqL6QqK0Dkoj5Y1xnapaLhcd1z8ineIWuMBixDbczRV2Un/GgaQCXdvhifi5uHC2tVLtViUSVvyBSYly4w7VFzJgcsf3vpFoiCA/fgJeTi3Vj8b7ZRTJaskxVbjsNxQwSkuDA/XoILDZiKCHTwx7gkmqGetYTnT8yCbPTZgyFOgGGHBTJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by DM8PR02MB7893.namprd02.prod.outlook.com (2603:10b6:8:30::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 01:08:00 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::8951:a14e:4e55:e959]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::8951:a14e:4e55:e959%5]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 01:08:00 +0000
From: Sid Manning <sidneym@quicinc.com>
To: 'Richard Henderson' <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, Mark Burton
 <mburton@qti.qualcomm.com>
Subject: RE: ARM: ptw.c:S1_ptw_translate
Thread-Topic: ARM: ptw.c:S1_ptw_translate
Thread-Index: AdkgXLziuM3BStbISnGE/4d6gqc13AAa6raAACPXc6A=
Date: Fri, 6 Jan 2023 01:08:00 +0000
Message-ID: <BYAPR02MB55099839E05FC89E5EBB9D9EBEFB9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
 <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
In-Reply-To: <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|DM8PR02MB7893:EE_
x-ms-office365-filtering-correlation-id: 88d1b106-5bc6-4d09-aef5-08daef827495
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0XcdQx5eZntGnTTkPCXPln/nK9JPJVFoMKKNRtqu4QPyWZu9NOzaWTHUYZCtgQCSfYAWzt0uImowc8AoY5i4RcFPfARyboOBlfqd+taTLrjTvVTRxjeLk3wVpxzj4+MY2XSM62U4cB56lp1pMFW1N+lZgFn0QjQataHh+4akWyonwM1xVG0Kxpx31NR4OEwtlu2/2pzIkewPYBsgtoxz2Vd69sYDDyllp8ECeeJZQ50cpsaberBeYgZOpRJlASTBZyxrZk4mssgeBy1L1MjV8EfjbeJaZXr/o5C7S/RnP2DOPcfT9KTYWD48/0jn6Sk7qau+42G0U9NU6lXGsT+bBgtIWqfj10euhBH95r0ky+72hPmuWjshF6giUIaGkL/wnBT5kPm7A0uByd9gkFwMQV19NnOvMbHuIOzp2vPWP5hoWZYhHelbDT1UDWt5HjwWllcMrOaLPDteNS8+nlX7iid/XB4LQvFFXHn2/aaz+6lbozJQHbqrDPoe4Q2H5FN0PmKvzo/4eoLftLHELPTPbcfiuD4KLj2ozNwEH9zF54+Pd6hOWt83qyQdmNQumeyHVHW0Cqd5VTKSGAf0LscoECw6lJXEzSuQDxqPSI8aOeHr605qXpXSI+KdKe7eU25tH8/eYb+CFcRcw9SNYVDIXL2Sta/MGiOVBqLvfnkxtpkAUa4hZ6AaUhy8Kj38eKFEocfQcD5/H2b09O6DO0BDlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199015)(9686003)(122000001)(54906003)(316002)(53546011)(107886003)(71200400001)(186003)(110136005)(26005)(8676002)(478600001)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(4326008)(6506007)(7696005)(41300700001)(5660300002)(8936002)(83380400001)(33656002)(52536014)(2906002)(38100700002)(55016003)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnRTaGlHeTgxRVZOMnEzdllFdkIwMlkrS3BpWWNWWks0QmErZWJQMVZZNXIv?=
 =?utf-8?B?WFczVHBhbjhqTGZ6K21lUS9oWi9SY2kxSFJXQnYwVnZZalJpNUlwd1VBcCth?=
 =?utf-8?B?YjFkV1VQL3lxRkF2Z0lyWFJYUjFWdHJrdGhyZkdyMURtKytwbGR2RzlpNEVJ?=
 =?utf-8?B?aTU0WlhxVXJYQks2NmZOdjd2cWlRNC8wME9wTEJyTTF0ZVZWQzN4QUpQZUVn?=
 =?utf-8?B?UndLWXVqTWNMUEhhS2R5MmN1M25XcG1PSjJvYnV2TGFpU0YrdzlJY3NnNWNj?=
 =?utf-8?B?TTVlVjdZZDFlZzRFNzlyYnVJd3JhTkR4QkpvN09oYUlEVVg1NmxMNHRjK0wz?=
 =?utf-8?B?d3JoUU9pR3VQcDF4Y3hKWUlZdGx0enRqaDBBTC9wYXVJK3ZBcVJLZVByRis0?=
 =?utf-8?B?U3JlbU1CMUhVNzBEZkYwKzBhczZWbStIeE1hM1pJTlhVa29tdlFKWjNrMEtv?=
 =?utf-8?B?anFlNXczR3MzUjdoOUYzMHFoN3A3aDl6Zkt2aVEyeWljTE82YjlkUU5meG9p?=
 =?utf-8?B?b1JBR3A2RDlaQmtOaFBEWWR0a3ZPU1RvN1NPcEhnSVJkdEVBaVF6TEk1VjVP?=
 =?utf-8?B?Z1lRbXBZMWpIRW9hMHZLZTZBYXYrNXppbHVQSS83bCtXaVozbFZRYjByZnlZ?=
 =?utf-8?B?eVhIcFc2b0o0MktHaFZ1ZlNSQ2lOcmhmeXFkVUMrOWdOOFowVFdWSlladmpC?=
 =?utf-8?B?TndBTHUrV21YdGRYS0lnZFBxL1oxczBpNUtkOU5QVXAwTGNkZ3JlTk82bE5F?=
 =?utf-8?B?Qk1sOXIyZ0dFT2oxK2FFYlJPcjBWV01QWWZCQVB3Tk9BbzBoS0NtNTJ5NnFm?=
 =?utf-8?B?M1M0aWY1TDdKUFZDTFNOVHZsaFREcjc3a2Nhc1pQQ1RjUEE2ZnpkWEFCWFBG?=
 =?utf-8?B?RWEyNWc1dHJlKzEwNW51Q2YvL1RKZmZhemUyNE5kanUxT2xhYWJadnRxaTY1?=
 =?utf-8?B?b2haZzJacEdhQkxUaXVUMzFhd3VhUHgrV0w0bXFlOHJyK3JpODdZeTFNTVFa?=
 =?utf-8?B?MnkrWXd6eGlQdlhtWmEzVGhQWnh5Tkx5SmVZWnIyZHZUVHFSZk5ObXNlc0Vk?=
 =?utf-8?B?S0VXczBsM2tPS2pPN201OWFNcFNvZjVjVEFaZDdNQWNiVUhORjFwUVlJc3hK?=
 =?utf-8?B?cW9tTVNKcEJVN0kzcFhyKzA5RjlSVXFhTytLUG9iT1JoY2s5UldYajJDaGxM?=
 =?utf-8?B?bEdjL0dZYWFrclgwdEFiV0hVU0JxNHRiVndGMStPanYwVXVuUFdkK3VGUThH?=
 =?utf-8?B?L2I0WTJCa0h3UU1GQzhyeStoSkJsaWI0aVVsUE9rejlFYTJjMzNvcFFkQlFk?=
 =?utf-8?B?cFAxQTh2MmFYOW9SaTlIeGs2VUJWcEpicGE0NmY0TmNWKzNoZU8ybWw4bGU3?=
 =?utf-8?B?Um1zWHdvQko3QTVmUDJ0SFJCRXZCa1JneDRXanJneG5YYVFJOHFrRG1uOElU?=
 =?utf-8?B?MGJTQ2hwY2NBMnY0eHBOL0ZuM3RIak5WZFViTEFhTm1lblFkLy9uM0VWWUYz?=
 =?utf-8?B?M2p4OURHd1NUVndueGVkM0EvQ3dDWmtOZklXMUhEdUdyaStHaXlNSkRCU3pm?=
 =?utf-8?B?OFhSZXp0OHlNdnRqdm5HSWsvdUsvN1VvUGpta3NYczh0RWlvK0o0cFVKWHg4?=
 =?utf-8?B?S0VJMGlHTlNNK0pPVUM0S1YvVVk0TENtOTJxbC9BMCtnenBIMzdlSDZhZktI?=
 =?utf-8?B?bTd2YzNEVm1Bb3FDa3pvVEVMQTR3RGhkNXlTb28yQllwclpxTThBMnFhNUJ0?=
 =?utf-8?B?TXc2TXdjQnZsVld5emxLa3Nhd1Q2dDZyNzlwR0tzQ3hRYmNQNGMwRmN6Z1ht?=
 =?utf-8?B?c245YitsNmNVczVUMHpEUlp1NHFYWnpXbmpLVkNmYVhrY3llUUFISHUwczRJ?=
 =?utf-8?B?elFncTRuQnVKTVllTlBWRXBXa20yMWtCUjZZcGdVQUJLQ3hXUUwrTUN5Vkpk?=
 =?utf-8?B?WlpaZE5jVzZ3Tmx4YzhBbUUwaHpzNEZ5NmdEZDAyVVdyVTgwZmd2TUxXVHRu?=
 =?utf-8?B?UFZ6MytYV1E4SnZIb2ppaGw3blFFY1Q1Y0pDZ3JIU1JQU3dhTXljOW5XMC8v?=
 =?utf-8?B?ams4TGNOclRIQ1NjU1BSUC9GYXBISWdlNlVRN0ZPZnBDdE9CaVlyWVRVK3N3?=
 =?utf-8?Q?3kr4HDOUmVBI0qZYKHWUYV5OE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QsaOypIoSVOwrLGwu89H9Xc43/afZCszqWcyB3MFHLa31lfesWiC+EFRZkz7S6fvl+grmLV4mRUHQlboCG7lwulsTDx35cOWtigpojenrR1AQ12Uctk7XaELR1J6uYoTk2WhJTvUVHhNPMM8Z/hjbpWihYAkgVyJGHG9uEIGgcQXrHv/qtMbPys30uB6AUt5+DEJMk0OfgqGREF7utFtLosf6XkGDSsjb1QPjx0q7fff4Del/s+IfBRd+25fDxc4ZOEFcXSsegSD08HBiDnuGbUBU/TnjLUqa8AhK0JwgJ//3ccb0/RdaS/b6XJzOiHyZrbC4yW6hCO9KI0OV1A3J8hQ6ZlnpaUDkXAb+nwOf86+ixffBeb4TvMc0pudPgYnZ0uYIPKHQQRs9+p8ioainMEjrZSe7JriPn4h14k5TPDBAgKq7exPwwrO+fWggSSOI5/8o1tIN4frOkMwR/rQVDHr4DxnSuhFin/pW4RA8yjqCi2RYbnXmbEXOeKZdvsrU3W7oztFFZF9pLExke9EtVdtHWKOiNKPl+5boPInR7i2sOAGgqV8C3VHWDCP+ToW5nfMaI6CPs2Cg+36/zrknLZ0Yk9DMYnH3J7gGoi1+HjejIeKpwsuB7T8EJwTSQGqgh7Fpxc9G7FDrfkTSnD5UXXuKliEPKcYQgpKMyAXqQrQvB0h8gKPmWNZ/6OpV5pK8JRMWR43/kIlsfJElEYPlY7wQ9trUU7JN7IMBq/Ll777zXWpw9ij/kVodlvuoqjkPM1pESk2bg6n9ffXgDzKsvOv1MB2COL5zgqbKPg5twskvqRC6cXRpLjcKqSW9xYc
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d1b106-5bc6-4d09-aef5-08daef827495
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 01:08:00.6475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+Lgg6RQ/xiCXa36zn+ZpSSJ4/t8APDETdcFjkAmM+8n47gIh6s8pO9zVUJqekYYAuSYHdydk0Wo5x6WeZowBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7893
X-Proofpoint-GUID: Fbz49HDMc3x8ttg_XJzn-wvw_BWHfqkc
X-Proofpoint-ORIG-GUID: Fbz49HDMc3x8ttg_XJzn-wvw_BWHfqkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_14,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=574 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060006
Received-SPF: pass client-ip=205.220.168.131; envelope-from=sidneym@quicinc.com;
 helo=mx0a-0031df01.pphosted.com
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5
IDQsIDIwMjMgMTE6NDIgUE0NCj4gVG86IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNpbmMuY29t
PjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsgTWFyayBC
dXJ0b24gPG1idXJ0b25AcXRpLnF1YWxjb21tLmNvbT4NCj4gU3ViamVjdDogUmU6IEFSTTogcHR3
LmM6UzFfcHR3X3RyYW5zbGF0ZQ0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVk
IGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4gb2YgYW55IGxpbmtz
IG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBPbiAxLzQv
MjMgMDg6NTUsIFNpZCBNYW5uaW5nIHdyb3RlOg0KPiA+IHB0dy5jOlMxX3B0d190cmFuc2xhdGUN
Cj4gPg0KPiA+IEFmdGVyIG1pZ3JhdGluZyB0byB2Ny4yLjAsIGFuIGlzc3VlIHdhcyBmb3VuZCB3
aGVyZSB3ZSB3ZXJlIG5vdA0KPiA+IGdldHRpbmcgdGhlIGNvcnJlY3QgdmlydHVhbCBhZGRyZXNz
IGZyb20gYSBsb2FkIGluc24uICBSZWFkaW5nIHRoZQ0KPiA+IGFkZHJlc3MgdXNlZCBpbiB0aGUg
bG9hZCBpbnNuIGZyb20gdGhlIGRlYnVnZ2VyIHJlc3VsdGVkIGluIHRoZQ0KPiA+IGV4ZWN1dGlv
biBvZiB0aGUgaW5zbiBnZXR0aW5nIHRoZSBjb3JyZWN0IHZhbHVlIGJ1dCBzaW1wbHkgc3RlcHBp
bmcgb3ZlciB0aGUNCj4gaW5zbiBkaWQgbm90Lg0KPiA+DQo+ID4gVGhpcyBpcyB0aGUgaW5zdHJ1
Y3Rpb246DQo+ID4NCj4gPiBsZHIgICAgICAgICAgIHgwLCBbeDEsICMyNF0NCj4gPg0KPiA+IFRo
ZSBkZWJ1ZyBwYXRoIHZhcmllcyBiYXNlZCBvbiB0aGUgcmVnaW1lIGFuZCBpZiByZWdpbWUgaXMg
Tk9UIHN0YWdlDQo+ID4gdHdvIG91dF9waHlzIGlzIHNldCB0byBhZGRyIGlmIHRoZSByZWdpbWUg
aXMgc3RhZ2UgMiB0aGVuIG91dF9waHlzIGlzDQo+ID4gc2V0IHRvIHMyLmYucGh5c19hZGRyLiAg
SW4gdGhlIG5vbi1kZWJ1ZyBwYXRoIG91dF9waHlzIGlzIGFsd2F5cyBzZXQgdG8gZnVsbC0NCj4g
PnBoeXNfYWRkci4NCj4gPg0KPiA+IEkgZ290IGFyb3VuZCB0aGlzIGJ5IG9ubHkgdXNpbmcgZnVs
bC0+cGh5c19hZGRyIGlmIHJlZ2ltZV9pc19zdGFnZTIgd2FzDQo+IHRydWU6DQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9wdHcuYyBiL3RhcmdldC9hcm0vcHR3LmMNCj4gPg0KPiA+
IGluZGV4IDM3NDVhYzk3MjMuLjg3YmM2NzU0YTYgMTAwNjQ0DQo+ID4NCj4gPiAtLS0gYS90YXJn
ZXQvYXJtL3B0dy5jDQo+ID4NCj4gPiArKysgYi90YXJnZXQvYXJtL3B0dy5jDQo+ID4NCj4gPiBA
QCAtMjY2LDcgKzI2NiwxMiBAQCBzdGF0aWMgYm9vbCBTMV9wdHdfdHJhbnNsYXRlKENQVUFSTVN0
YXRlICplbnYsDQo+ID4gUzFUcmFuc2xhdGUgKnB0dywNCj4gPg0KPiA+ICAgICAgICAgICBpZiAo
dW5saWtlbHkoZmxhZ3MgJiBUTEJfSU5WQUxJRF9NQVNLKSkgew0KPiA+DQo+ID4gICAgICAgICAg
ICAgICBnb3RvIGZhaWw7DQo+ID4NCj4gPiAgICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICAg
cHR3LT5vdXRfcGh5cyA9IGZ1bGwtPnBoeXNfYWRkcjsNCj4gPg0KPiA+ICsNCj4gPg0KPiA+ICsg
ICAgICAgIGlmIChyZWdpbWVfaXNfc3RhZ2UyKHMyX21tdV9pZHgpKSB7DQo+ID4NCj4gPiArICAg
ICAgICAgICAgcHR3LT5vdXRfcGh5cyA9IGZ1bGwtPnBoeXNfYWRkcjsNCj4gPg0KPiA+ICsgICAg
ICAgIH0gZWxzZSB7DQo+ID4NCj4gPiArICAgICAgICAgICAgcHR3LT5vdXRfcGh5cyA9IGFkZHI7
DQo+ID4NCj4gPiArICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgICAgcHR3LT5vdXRfcncgPSBm
dWxsLT5wcm90ICYgUEFHRV9XUklURTsNCj4gPg0KPiA+ICAgICAgICAgICBwdGVfYXR0cnMgPSBm
dWxsLT5wdGVfYXR0cnM7DQo+ID4NCj4gPiAgICAgICAgICAgcHRlX3NlY3VyZSA9IGZ1bGwtPmF0
dHJzLnNlY3VyZTsNCj4gPg0KPiA+IFRoaXMgY2hhbmdlIGdvdCBtZSB0aGUgYW5zd2VyIEkgd2Fu
dGVkIGJ1dCBJ4oCZbSBub3QgZmFtaWxpYXIgZW5vdWdoDQo+ID4gd2l0aCB0aGUgY29kZSB0byBr
bm93IGlmIHRoaXMgaXMgY29ycmVjdCBvciBub3QuDQo+IA0KPiBUaGlzIGlzIGluY29ycmVjdC4g
IElmIHlvdSBhcmUgZ2V0dGluZyB0aGUgd3JvbmcgdmFsdWUgaGVyZSwgdGhlbiBzb21ldGhpbmcg
aGFzDQo+IGdvbmUgd3JvbmcgZWxzZXdoZXJlLCBhcyB0aGUgczJfbW11X2lkeCByZXN1bHQgd2Fz
IGxvZ2dlZC4NCj4gDQo+IERvIHlvdSBoYXZlIGEgdGVzdCBjYXNlIHlvdSBjYW4gc2hhcmU/DQoN
ClRoaXMgaGFwcGVucyB3aGlsZSBib290aW5nIFFOWCBzbyBJIGNhbid0IHNoYXJlIGl0LiAgSSBk
b24ndCBoYXZlIHRoZSBzb3VyY2UgY29kZSBlaXRoZXIganVzdCB0aGUgb2JqZWN0IGNvZGUuICBB
IG51bWJlciBvZiBjb3JlcyBhcmUgYmVpbmcgc3RhcnRlZCBhbmQgdGhlIGFkZHJlc3MgaGFwcGVu
cyB0byBiZSB3aGF0IHdpbGwgZXZlbnR1YWxseSBiZWNvbWUgdGhlIHN0YWNrLg0KDQpJJ2xsIHNl
ZSB3aGF0IEkgY2FuIGNvbWUgdXAgd2l0aCB0byBiZXR0ZXIgY2hhcmFjdGVyaXplIGlzIHByb2Js
ZW0uDQoNClRoYW5rcywNCj4gDQo+IA0KPiByfg0K

