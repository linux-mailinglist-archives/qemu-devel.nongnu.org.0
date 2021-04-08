Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA9357BFA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:51:34 +0200 (CEST)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNZk-0006Zk-GG
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lUNYB-0005sx-Ul; Thu, 08 Apr 2021 01:49:55 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lUNY9-00036L-0C; Thu, 08 Apr 2021 01:49:55 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1385ndLo116125;
 Thu, 8 Apr 2021 05:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=d9e2mkCEdiPASWMSOj9IHb5wndOpxIyaY3tD9K8y4vk=;
 b=QF9D4AM+ot5rAvRGiW1xsYVNP4b7wmQwReUbYEcR8lSTCt46sqw48ZowiOKAggJO2iHv
 2Y7q2dRKhVsuAks7LEugZ0rvPUhptg/EY/QtA+WGF95l1SAG7aavOpXd/bnVoGrfGA69
 UlW1MLX2LYv1kNicZHEFgXO9J6kKyHmzK+yc9jaDJeDw7kkq4FfMRuWJJdDPXy1EL8cE
 zwaPlHmaFTOojZdLY1x66Dz8TxszAs3m/zQzi4RGOSJIlK8BhG9khzDqVimTVpZGq5Hy
 KOoDE5ek7iOhhumfLVjSAc1HuAi1QJVnJCOgzLzWub55Rs1VU8eXYcUwp1JP4hNFqY54 Tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37rvas4njm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 05:49:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1385e9qu055333;
 Thu, 8 Apr 2021 05:49:38 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
 by aserp3030.oracle.com with ESMTP id 37rvbfvf6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 05:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQSyJ4+V/yja+CrH3bRPqRmp68eC537Jw9v9WpLf4BSk+DVwXvPz7iv/Q0ZsPlD8uskJ5XXPkCBwkoCyByp37rv/BbbRC4A3wCvr4luSbW93gJ/lvh5s9M5JCKYSjsGBQHCOisuQw7kjHbS9/EaC/cMpMjR71nRabjK6/GhjqYTTw92hmWP27aTUiEvX7XmFVcsS3NXvbsfUgFqnruD/rbkc1N66veIc7QyqKEEqSyl51OBBCQtJ0KxvRj4VZexsGrkZjxaVRiweCPX5h9yQeQ7gO5yeNRZtAAtTQOFF/dFVGAFPufp1PDd+4ahorLNRus+NfY9l5DZp7J5W6fzTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9e2mkCEdiPASWMSOj9IHb5wndOpxIyaY3tD9K8y4vk=;
 b=ACrU4XwAxgarFJDSJCVUS9fcG8+9evMaXA35q+YV8vY7Cuweeo7gxZMxfbb9FN78Adb6HYgmRVvtOyVIZ/wVtfKiKzUOxJFRY2NmaOM48ibBGPbhrb0XM51f4zIyqWxo0Ry6R3CYf0gpNBsq7dvwHk/uyjJRqWYgVjXXOM6/wkQBFnCRPKfF/eC4mGk5lP5mGjIuv1smAFVMU4ZaiA+JOK/Xj+Y/1g+G5CDqUpDHnPfMne1zvwFQL93i+HhMrZK/H6G8nwm9BjbJnqyTrbDvSY9E9cCfVlgTkDPPoDX8MLl46bftXMIYBW5Pc94EQ/N9v/KenPxH08lN+obF1aXVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9e2mkCEdiPASWMSOj9IHb5wndOpxIyaY3tD9K8y4vk=;
 b=aejD+83OVGmd17w6Rjrg38ktzTz5qlFGijQaVcu+IepNF7iyQolvReH1rpC443uiviFfWo+6KMWlrlvJIUB1bXQNfbbyevzppymlFEoPkragDY43VMjAmy7MqEnCNV3nA/skH6/wNJz6/lq9TKbDGG26qZiL1xrGN/1phPScVqQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 05:49:22 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 05:49:22 +0000
Subject: Re: [PATCH 1/6] qdev: introduce qapi/hmp command for kick/call event
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <20210326054433.11762-2-dongli.zhang@oracle.com>
 <20210407134016.u5vdwuji6b4jvtxu@habkost.net>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <792699a7-15e4-7814-5c31-991bbacb52af@oracle.com>
Date: Wed, 7 Apr 2021 22:49:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210407134016.u5vdwuji6b4jvtxu@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 BY5PR13CA0030.namprd13.prod.outlook.com (2603:10b6:a03:180::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Thu, 8 Apr 2021 05:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db54ef78-570f-4484-77fe-08d8fa520f79
X-MS-TrafficTypeDiagnostic: BYAPR10MB2744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB27449F0135402B70BB8B0041F0749@BYAPR10MB2744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U90Xg/4T8WelzQFX0B84bDNq/Nt3Tt5I+2gqpOE6Jq5wdCjKt5w/LgeN6TmHcLx8ibi+t70lE5yq2rkq1bASOkq0CN8sYfdiTxRwX5ifh2p4O543Lnfl7GenYMvieZ3f+MuRIWrL78pxsKF13VylCHo5ja78PH3rd8Ykn7NkOFJsl+hq7GOvQSTgqDXlxWKGVf/ohRjwdbznDPndl+4wmTMujBMctLedS9X6ho6Jb+6Z5NJFeMSIsPLH2OkML955N3kYNJtKujjhT8OQUtR3AThEEIiJtgydstT4uhWmaBpI9jx1vrk4du7eIQe6pUUxhJ76LHV96FLMeACjw/e/paXG7w8GEQ5duALKI2KpepEGsP47h29Mh8AgKTkIzsm7BzGOCn71AhUPGe6/GsWTohW4OPOpfqODLkpLXVNszLjH6xxWA/J1tNGzaMpo34iHhN6+iEh4K5YpWM/J0uh8uV6U94Sm4+5WU4/DZpAz6rg+ustBTL3FZEdaF/HKv1H9M5iZfEqaq7+aANWpXgMC8gT+5qQxWu5mCLsGyKdQj2coHzbG8d1fPb1qh/hi+oMCbm6VGfgMHbJKwePixVRocc0IirvU5lpD7DSPQ+1WBtxM3IO0wbJ44PFR7xOfq/OSM5wQnEUd527RVcTu1ui4vHe6JDYZ9xWkqJieLGN6lJ5scH5Gc20vxTNIKh/PU2Aw1ITwR2c3V50b0HeFV5+g1/D56U1pPfkKa8VFnguP9L04Tp6qFhLJkO1NyRlDUHYLLY/cT3JHQKPkIqX61q+6x3K0WM1+oU/h1w5+w/QyyTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(396003)(39860400002)(376002)(478600001)(66946007)(31686004)(7416002)(66476007)(83380400001)(6486002)(53546011)(186003)(66556008)(31696002)(966005)(2616005)(44832011)(2906002)(86362001)(316002)(6916009)(36756003)(16526019)(8936002)(4326008)(5660300002)(8676002)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OFM1d2E1ZVhaTnkxdXluZUxhMGlIMG82VElmbnN0bno0TmNqbEY2bnh3akMr?=
 =?utf-8?B?SDJCQjFjT2JvWHU1SGxaN2RmMWN1S3JHVy9USk9zYmJnUjYwOFZCellJSXhh?=
 =?utf-8?B?V2l3MzZ2Qnc0ckVWOE9jSXlhcEl6OThjbENXSnIxYndjTUVmZHpuSVd3SnVi?=
 =?utf-8?B?Vmtzd2lORGQ4elNITk9hM0RURHBKaytaT29RNFBlQkk1Q01jV0NuRVJUNDcv?=
 =?utf-8?B?a3VucGFLQyttTFVXb2dMT3RyTllyczhLMXJFZkFRU2hnTUFjTS85c2RNWTRZ?=
 =?utf-8?B?S2tRWXVyQTRZejdDQ096UStvQmdVV3dyTEJFOXdtU3RMaUZVb0M3UUg0azdC?=
 =?utf-8?B?SVhMKy9ISisyRnUxVnU3RTBYMGt4UGp5Tno1YVp2UnB6V3JEUXpVRXl4eDZr?=
 =?utf-8?B?cjVNMnhNVWdmQ0ZlL3lGQ1pNaCtkRlNTeTZOYmk5Q0tVVnhmR1E1VlJVUGND?=
 =?utf-8?B?N1BPeFdad0JIRFJUbDZlb05aUitMcDdhTFBmcUtmSGZlSXVvaGQyNVA1ckFy?=
 =?utf-8?B?Zi9nYUdDblFkMWNaamlDNXcrampVWmxaVnRjdVUwV3NUemRvL05lM0N3RGlW?=
 =?utf-8?B?WE1ON2dibUtWd05jeE9YUDVQUlMxS1MxaWVlVkdLRVVUQTFlUGJGbVliQ2Z3?=
 =?utf-8?B?bDRvU0J0ZWo1MXJoNWJaV2NHNS9BQ2pTZWx0QWNlMWJiMThmVFd1dTlHNmkw?=
 =?utf-8?B?YzI0WXVIWkdtb1JRaEVpcUVYWE5pdWlLVXlNdk5lWnJ1RHFDYXJjdk5ieHgx?=
 =?utf-8?B?YzJKMm1mcURSQTNENzZ1Yzh6SUJ4djNzUUhxRUZ5ajBneFdSQ2Z4VVJNWTZH?=
 =?utf-8?B?N25CS2VxZTBEVG1ld1NBOVQzdjhJbjRaS1gvSnlnNlNKKzlKUVN6UXBxMUhL?=
 =?utf-8?B?eGQwZURzYlhqcUR6WlpBb201M3EwK1pWN2NjbCtKczgveTNwY0ZyMmtBYW1r?=
 =?utf-8?B?UWpCa1g3L2dwazhrSGJtMUdTNmhWaWJNTU91WWlaNGFSNnNSL2gyTUJiNDcr?=
 =?utf-8?B?QjhIVmNMZ1RxekNQYnlGYnBscnEraGdJZWJ5WWRMOVV1TDcwN1RMcmtDQXh4?=
 =?utf-8?B?UVkxWjRWa0xBZWpTNWx3T0hmQjJVQTc2MFBOOE92bG90TFpSeTIxOGhzaSti?=
 =?utf-8?B?NlFtb1htTHVRQWhWcU9kRWVnNEdCalY4N0s0cnBhU1o2eE45aW0vcVVqOWpo?=
 =?utf-8?B?MmdWRlF5QzhwSlgzcEFFZjdJR2t2NkM4Z1ZSNDlJK2tBYXEwMVAzU05GbDYx?=
 =?utf-8?B?MWZqMjExS0thUkpHK3RCdStnNnlxZkVZVWhLZkZGUGw3Q2NVTzNxcXM1YTAz?=
 =?utf-8?B?L2NDdlV0ZEF2YVVZMjJJaUNKdUJxNThYMWhyQjg1aU16T0lDMnhRenZIY0M3?=
 =?utf-8?B?aUhrUmRXSlZ6Q2p5L2xNb1p5QnFCOTBJU2xHekN2NHZadnJGalRRenVjNHZJ?=
 =?utf-8?B?d0NhU0ZvWC92WGtHSndEbU1kdTFNZ0gwd3lSV1h5bXJzN1k5ZEozdFlBNTdr?=
 =?utf-8?B?L3N1cnJ5Lyt6U3hwOE52VHVUaTB1THh3Vjk5dng1TUdLbnpCaFZ2OWxiaVAz?=
 =?utf-8?B?ajEzZDdCalc0MmdwZkFPYmFKc0R3d0owTGcrck5pNVRiZGkrWEg4aitDMkpx?=
 =?utf-8?B?dlBtc3dCOWhUM0VyejVKTFd1ZUxRUHJNQk8xNmhHbEJGZ3FiK1JhYXlhRk5m?=
 =?utf-8?B?akF2SU1ZYlJ4YlJlWHMvc1ZJMTNRRHdvVG9CRXB4elo1UkpNWUN5dHltbXFq?=
 =?utf-8?B?UnlIYnRHQjc3SGpKczdRK3hpOGdIZkxMdVpQcEcyVEVvOHVTdG1rY0pxdjNu?=
 =?utf-8?B?cERNSlJYbmJCRTdSa1RRdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db54ef78-570f-4484-77fe-08d8fa520f79
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 05:49:22.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiZC1fCo6RY/haHukVUp4Rm090f8kmkFxuFV2UjANA1Tmq5HbGTK2hn3dX5E++9J06zTK3AT+2AuB6I0EHpXyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2744
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080039
X-Proofpoint-GUID: CTYEdY7gSupiqgOt54R1ctFeGDAkE1BJ
X-Proofpoint-ORIG-GUID: CTYEdY7gSupiqgOt54R1ctFeGDAkE1BJ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080040
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/7/21 6:40 AM, Eduardo Habkost wrote:
> On Thu, Mar 25, 2021 at 10:44:28PM -0700, Dongli Zhang wrote:
>> The virtio device/driver (e.g., vhost-scsi or vhost-net) may hang due to
>> the loss of doorbell kick, e.g.,
>>
>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html__;!!GqivPVa7Brio!NaqdV_o0gMJkUtVWaHyLRwKDa_8MsiuANAqEcM-Ooy4pYE3R1bwPmLdCTkE0gq6gywY$ 
>>
>> ... or due to the loss of IRQ, e.g., as fixed by linux kernel commit
>> fe200ae48ef5 ("genirq: Mark polled irqs and defer the real handler").
>>
>> This patch introduces a new debug interface 'DeviceEvent' to DeviceClass
>> to help narrow down if the issue is due to loss of irq/kick. So far the new
>> interface handles only two events: 'call' and 'kick'. Any device (e.g.,
>> virtio/vhost or VFIO) may implement the interface (e.g., via eventfd, MSI-X
>> or legacy IRQ).
>>
>> The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
>> vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
>> on purpose by admin at QEMU/host side for a specific device.
>>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> [...]
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 605d57287a..c7795d4ba5 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -129,5 +129,6 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
>>  void hmp_replay_break(Monitor *mon, const QDict *qdict);
>>  void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
>> +void hmp_x_debug_device_event(Monitor *mon, const QDict *qdict);
>>  
>>  #endif
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index b83178220b..711c4a297a 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -124,3 +124,33 @@
>>  ##
>>  { 'event': 'DEVICE_DELETED',
>>    'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @x-debug-device-event:
>> +#
>> +# Generate device event for a specific device queue
>> +#
>> +# @dev: device path
>> +#
>> +# @event: event (e.g., kick or call) to trigger
> 
> Any specific reason to not use an enum here?
> 
> In addition to making the QAPI schema and documentation more
> descriptive, it would save you the work of manually defining the
> DEVICE_EVENT_* constants and implementing get_device_event().

Thank you very much for the suggestion!

I will use enum in json file.

Dongli Zhang

> 
> 
>> +#
>> +# @queue: queue id
>> +#
>> +# Returns: Nothing on success
>> +#
>> +# Since: 6.1
>> +#
>> +# Notes: This is used to debug VM driver hang issue. The 'kick' event is to
>> +#        send notification to QEMU/vhost while the 'call' event is to
>> +#        interrupt VM on purpose.
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-device_event",
>> +#      "arguments": { "dev": "/machine/peripheral/vscsi0", "event": "kick",
>> +#                     "queue": 1 } }
>> +# <- { "return": {} }
>> +#
>> +##
>> +{ 'command': 'x-debug-device-event',
>> +  'data': {'dev': 'str', 'event': 'str', 'queue': 'int'} }
> [...]
> 

