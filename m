Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401355485FA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:36:18 +0200 (CEST)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0m6z-0001WQ-Bh
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o0m4d-0000YN-2c
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:33:51 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:56978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1o0m4Z-000096-Su
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:33:50 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DEpCGv010423;
 Mon, 13 Jun 2022 08:33:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=h6Ch6h+DiTIRbDzxM4coeRCY520Q8g8NcO+5ijTCduA=;
 b=kdnUsveHZnj6AJr00gEje/PHMU94TNqJEzC2jiXgRet0ENhfZDI0kF+/WhR/WICeE1eK
 D/umijSlatgWn5o4ib3fcexKqmPH0JkO36Fqn2SLeYeNc/d7eDqvxXmC7bEFDCXEzERU
 gHBWmTeqFaaJEHlL/VAYzfWOk57xYZgrIkrCwtGoAGNam/alU6TVtpk42kAmRlAh7JTR
 iPm7Wtegcpwip/Zh1cZjbS6otkQPJ4Cu/W0UXuYqcJGfDAjd54Uvc52BTcLj7Wf6Zy7N
 I6sdpBK8JCv6VccPheaheZbwS6W/5T3NCZDb9Txvb1+R6ElwEFYwdOjaxyMJqjRLXoyP RA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3gmrkakw3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 08:33:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu5Attn1Z8WaYhhLesfknKOkMysB99sYxI41Ycrw8/yW8fi6Q1QNg+PWPqI96RJQxwifIaxBXGgJBJSxoKm3iIc2isE/VfaSSVQ2S5U/VgRIcNHRXbUI2ygzZjdxJ0a6pL7fStU9QPHpksewLj6jKViknoek0mGt2duBfn619NEd+/d5kTqI95q4GDvfBvuAnfqRBGeNXxZyneVCLSbBkTuo0qq6Bm9oNs3rCGC7DBVfmwOcaUZXU3HnzA41k4pRyVCW5rAsMUGbLK26BWYWoaETeudE9khyTNoc/Bt/k8HwEt/JtuEy3hjQvVK1RRbSjFsyFby6WyhrbrWEZrAuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6Ch6h+DiTIRbDzxM4coeRCY520Q8g8NcO+5ijTCduA=;
 b=fOir80kcrPf2AbbFOcETONBHK0NXwAG0q/pQrNPlSIV96unWmYnnKzvfZL90jJCouvmCgrMHPvyeXhnYlwuoUK+z0LJXyNATo06ra+11bzBBytekhKCcilpFXBGlATLoKhqA6+2tsk9S1lpnz2SiPhfa4rJTL0b9nfDtT6b1YwYuGNF+bw6L5l1s4FfSezm48pYdTdWJuWaEsWyDZsxjkk1EaAemPdLoA15lPKEleRhhPD7FuLhmVbUHkQRrlPsl9seH+ekFDq6lGRq4m1b+HPsqIkKCw7m9k8qTQ8rNxuvu4lk+gNLftCHjDdz8AvWy6EiXKVpvTUt1Nl5m5jhLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (20.181.248.140) by
 SN1PR02MB3743.namprd02.prod.outlook.com (52.132.200.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Mon, 13 Jun 2022 15:33:36 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::898c:892a:2385:3df6%4]) with mapi id 15.20.5332.021; Mon, 13 Jun 2022
 15:33:36 +0000
Message-ID: <2081c641-80ea-00a9-b42d-3ef4cbf6b387@nutanix.com>
Date: Mon, 13 Jun 2022 21:03:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v17 6/8] softmmu/dirtylimit: Implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>, 
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <cover.1646243252.git.huangy81@chinatelecom.cn>
 <a650dbf80c9415a9d4054b6e1f936170cbfce9ea.1646243447.git.huangy81@chinatelecom.cn>
 <1e117589-1719-0d11-099f-9f3392e0ba6f@nutanix.com>
 <f98ae9a1-8d47-7995-ae0d-101c626c3be4@chinatelecom.cn>
 <f0e09ec4-7d16-b022-0949-4599a5378356@nutanix.com>
 <fb42912b-e3f4-f0cb-fb16-671ba75bd7ef@chinatelecom.cn>
 <Yo5RiqKWuwZPY6Iv@xz-m1.local>
 <CACGkMEsiLUxEKD=o23aaHzo5AVy-vTRPKhxtT6-cTT+ETtdpaA@mail.gmail.com>
 <3cac02a4-5c2a-362d-4035-e82d66097107@nutanix.com>
 <YqdKsNEkWsS3XDvf@xz-m1.local>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <YqdKsNEkWsS3XDvf@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf28505e-054a-4089-8456-08da4d5214f7
X-MS-TrafficTypeDiagnostic: SN1PR02MB3743:EE_
X-Microsoft-Antispam-PRVS: <SN1PR02MB37432423CE17572A3424AFCFF6AB9@SN1PR02MB3743.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UwOR+bUpHnBj+LEqsMldLwlad5hkiXhW1XdHx5BAp3G1VtTwkgYMEmqB5GZb8mWPIYq7NAEfwqxXhfDudNJUd569iFkIAmvOVZiiSQFMbes02wdQDESn7xNGAri59/QudXBm4mX7W6XSvAEKbxIq8D5MLtEjnux9lr2n5Bgysg/73346qayhrNWKtjBa0VHdrsseEP8xp4Wz5XcSNaw/dvhsXO6TSWvMh+2ZBMCRhUIZdveIEBXRj33RIUfIEcjxYJRAg0QYmoGBg6yKhNqfBk7v8VYxYJliWvDLtSU+eZTb2FHgvKqL3CjZmd6iatWyqv6S9ymA/n0Q6laV37zqrTPywz4MfDgccvM14TzGx9ytZ6UM0zqCro21ejGw6u1wlGwHuF4bvj+8qSC7U4xO3CwBh6D+G0ld33C5NAMtPUNIKcKHvWxPMX0HLCKFQdBdZdphEb+dVYjR8WOBc5JmVWHaitxDM8h4V1FCb3vsH2Lc22ucjjudtBAqWuozMO9Re9Fp10ly5I59UVnWaMaHDM2AQi98PmSozKSsR2pkm8RTtjK023gWqrk5+qYym0r+7+rlY6bm9kwkODog8sXCUT5w2lVVbaqSO6tMr7/GuSsiNFqDSK/ZxNOOVTw8KRUA/WUFmnQRV0RDL6LvP34Jj4bmeFlNqRC5IuW2gOuImQ2JKykTKVNGsKAUXVN0LjJcA0c83Z9sKT+d3zYjaE2+jmfxCTWr/8hmleV1BMxhilo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6486002)(8936002)(6512007)(6666004)(2906002)(66946007)(38100700002)(86362001)(66556008)(508600001)(31696002)(6506007)(186003)(5660300002)(7416002)(2616005)(26005)(83380400001)(316002)(36756003)(53546011)(31686004)(6916009)(54906003)(4326008)(66476007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTc3T2VhTnhIaEprNWx6SmgxNCtNZW5MV25xdllFdWRVajVZZHhEMFE5NnN3?=
 =?utf-8?B?cW03UGNjajJUV1hZVW04MFZubnJ0N0tzWHZFc1U2TlkzeXU5TTVCdW9uT3Ir?=
 =?utf-8?B?YmhXV0lYbUM5dXdRTkdDc2pnbmR6TGt0NTlMK01yVzhMaW1WR05KQU5iZTN2?=
 =?utf-8?B?OU9pRUxVRFVCY1A0a2MvNndCVGNiTHFGeXdGbktUYzhsd3FJbkxHMDUwaDRZ?=
 =?utf-8?B?M1l0WmpRUjRNdkt1UCtId1lMc2hHN2dUYmM1a2IzR3MrbS9rU0lBR0x5MzMy?=
 =?utf-8?B?RFUwOTVQSzJWZ0xsOFpVOW4wY0F3WTZWTy91UG02bUZpbEE1S3ZoNm1sZG93?=
 =?utf-8?B?U002bnBHTlQvcUl6bXFLTHRRcDR1UTVMRkpyNUZWY3BVaWxLSUxoaE14c1p5?=
 =?utf-8?B?Vi8wM2FETTZzZDFpN0IzR0lsQmhsZzlDTXgwQ0xyR0RCVVh0dTkrZ1RDYk1o?=
 =?utf-8?B?NUVmRytpMXZhc0hEeUt5c3ZpVG1adHdSWEd4bTgvUFlpSzVZbDlQR3dSa0RB?=
 =?utf-8?B?OW01Y0lJMXVhWmRTWmtxK3VsSXJQUmZnRERmcHFadmtzMlV6ek1QNEFkTVdX?=
 =?utf-8?B?ZkZLOFptL1AvREo4SUxDa1F4SkpQalViNkp0bG9PZzhRZU9OenluZnNENkhv?=
 =?utf-8?B?NmNHT0YxQkJoUUhhbElHcEVZWWhXak9iQUp6em5vYjhuWGd1Zml5S0F5VU0x?=
 =?utf-8?B?Q1V5SGREYXV2VGRndGZCOE9YWGV3T1JUUEM4OHJ4ZVd0dUhHckhnY3pDOXVx?=
 =?utf-8?B?dUZBSEtMbnNzcnVJeHJPQ09yLzdNUWJ4YlZId0d6bkpvclc5OEZ6empycHNV?=
 =?utf-8?B?WHNPYkZFVjh6SWdEcXdCcWtPellwUnNvaFB0RERHTWR1UkRYdGFVZjFCZ1pw?=
 =?utf-8?B?N0hoakNtbnRvWmU4d3dpd3BFVUdqQ2hWYjBLNTUzWDZYcC80UjJLQmRDZlVr?=
 =?utf-8?B?L21sTjgwSzRsdllpMFZ1dGJVd2Y2L0Z4Qm5ET2QxMlpoMUt5OGQwRkxYTFRt?=
 =?utf-8?B?aTRzVlpPZjdhMTRDTlkyQUJvNEljdmNsYlhyNmVLOG5TYXNGZ2hFcXRtN3BT?=
 =?utf-8?B?ZlMvZnpYVzNDWnZyVDAyWFVjSThLbUJ0aXNjTmdIb3ZZNFRWZ25kZFRJZmd3?=
 =?utf-8?B?KzgxZFJUUUlIdXdUSUhNemJ3bEtKREQwL3V6YWk5Wm5KaElMVFJ4R2dpalQ1?=
 =?utf-8?B?ZTVkdkJZL3VkMGQ1eVI2dWc4RUlZTkVrVkxYYi9XeHRoQktOemtkOUJqTUZL?=
 =?utf-8?B?Wmxsa2Q0elUxRGpxamExTkszQ1poSFc1cm8rbnI0cVJFMlozUVZ0WURpbUor?=
 =?utf-8?B?R2Y4NFAycGh3MFoyVzFuKzdsUkdVNkdOWHZ5SDloL1JPbW5ydTBtU3FNS0g4?=
 =?utf-8?B?VjRpSVBQTG12RDlBMXJQLzZTUjA5V0RTSlpDYjRwbGZ3L1ZncjJZRkgwdVQv?=
 =?utf-8?B?OGFINGN1UUtZeFQybUQySklMU3ZpYzVWc2V0bWY3c0RCUzE1VDBseTdmeFRz?=
 =?utf-8?B?UjJlTU5wNTVMd05kZVFMdUpsclJHaCtZakdKK2RQSUVLdXhvQ1gvU1ZTaWZy?=
 =?utf-8?B?K2loakNhQ2xGWi9jV3JORy9iQkFOVzJZeXd3dTlhZkhNdXprK3hsSHNuMFdy?=
 =?utf-8?B?YzhodkFuekNzT3d6WW9zZERwY2twcENFaHlucmVHT2Yxa3NtYVlodU9iUGx6?=
 =?utf-8?B?YTZmT1Rta1g5eDJOMVZmZXdSNWhGcm5OYWtJZ1k0YUE0b04vOVU2Z0ZtY1Qv?=
 =?utf-8?B?eFVlNUVHbzdES0h6MFNDTW1EbW9ZbUJvYnA3bXNlZ0RvUlV1NHNlTW1qQkts?=
 =?utf-8?B?Wk9MTjU1TzJrWU00RElyUnJHdTNkZmZaSENIQzFyVnRTSHBPc1BvQ29Oc2Rv?=
 =?utf-8?B?RUYzcEZLZ0Q2SEx6QWhGcnU4MDUrSTliM241aldyVWdJQklHQXVEakwxVkYr?=
 =?utf-8?B?cE5oY1hkeExVbVFtNzBhK0I0b3hTcm1MTUpPM1RMKzdVVE9qcCtaNElma0RG?=
 =?utf-8?B?d09aak41YUhxU09JSDRDc2hGb1p6MUxIdUlmNjJBdDY0dFVOM1k3bXhSa3hR?=
 =?utf-8?B?UkprM3U3R2dDVjd5T2Qwd2dZV1VBdVlDZzFhbm1sbWJGbjM1cWIwZ3ZPM2lj?=
 =?utf-8?B?OGZnOFFlUXhzM3pvbjhSRTBsa1NGM3gxT2FpWk1aRmF0VXlUMDRNa01GNCtv?=
 =?utf-8?B?ME53eml2VEQ1YW82NitCMmxndks3WFVaQmRLQmxQQ2lCbitJWG0wdnl1Z2Js?=
 =?utf-8?B?VHFpQi9tY01uT2hCUXFQY2N3QVpsUk9NYTQzVWdsRlNScnp4c1FtNXlKTEdF?=
 =?utf-8?B?ZVR5K1dDbis5Qm5sWkJtelBjNnFWeFV2aUU0emNRcUpwc2czRUdQUFlVL3Zq?=
 =?utf-8?Q?AFZPLzhjnsD3O1ZQ=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf28505e-054a-4089-8456-08da4d5214f7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 15:33:36.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj38Vh4vWnz69hTd40RWyE/JiVugATN6KT5v7CN9xxg5C5t5CovPqpztL0FutwSv46yjC90U9pkpdd4j6flHz8DKy9lDP2tndQFnC3eQoos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3743
X-Proofpoint-GUID: ZOQMP3FUAVZPZp_PK3YZX92EYmvyjg_i
X-Proofpoint-ORIG-GUID: ZOQMP3FUAVZPZp_PK3YZX92EYmvyjg_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=manish.mishra@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 13/06/22 8:03 pm, Peter Xu wrote:
> On Mon, Jun 13, 2022 at 03:28:34PM +0530, manish.mishra wrote:
>> On 26/05/22 8:21 am, Jason Wang wrote:
>>> On Wed, May 25, 2022 at 11:56 PM Peter Xu <peterx@redhat.com> wrote:
>>>> On Wed, May 25, 2022 at 11:38:26PM +0800, Hyman Huang wrote:
>>>>>> 2. Also this algorithm only control or limits dirty rate by guest
>>>>>> writes. There can be some memory dirtying done by virtio based devices
>>>>>> which is accounted only at qemu level so may not be accounted through
>>>>>> dirty rings so do we have plan for that in future? Those are not issue
>>>>>> for auto-converge as it slows full VM but dirty rate limit only slows
>>>>>> guest writes.
>>>>>>
>>>>>   From the migration point of view, time spent on migrating memory is far
>>>>> greater than migrating devices emulated by qemu. I think we can do that when
>>>>> migrating device costs the same magnitude time as migrating memory.
>>>>>
>>>>> As to auto-converge, it throttle vcpu by kicking it and force it to sleep
>>>>> periodically. The two seems has no much difference from the perspective of
>>>>> internal method but the auto-converge is kind of "offensive" when doing
>>>>> restraint. I'll read the auto-converge implementation code and figure out
>>>>> the problem you point out.
>>>> This seems to be not virtio-specific, but can be applied to any device DMA
>>>> writting to guest mem (if not including vfio).  But indeed virtio can be
>>>> normally faster.
>>>>
>>>> I'm also curious how fast a device DMA could dirty memories.  This could be
>>>> a question to answer to all vcpu-based throttling approaches (including the
>>>> quota based approach that was proposed on KVM list).  Maybe for kernel
>>>> virtio drivers we can have some easier estimation?
>>> As you said below, it really depends on the speed of the backend.
>>>
>>>>    My guess is it'll be
>>>> much harder for DPDK-in-guest (aka userspace drivers) because IIUC that
>>>> could use a large chunk of guest mem.
>>> Probably, for vhost-user backend, it could be ~20Mpps or even higher.
>> Sorry for late response on this. We did experiment with IO on virtio-scsi based disk.
> Thanks for trying this and sharing it out.
>
>> We could see dirty rate of ~500MBps on my system and most of that was not tracked
>>
>> as kvm_dirty_log. Also for reference i am attaching test we used to avoid tacking
>>
>> in KVM. (as attached file).
> The number looks sane as it seems to be the sequential bandwidth for a
> disk, though I'm not 100% sure it'll work as expected since you mmap()ed
> the region with private pages rather than shared, so after you did I'm
> wondering whether below will happen (also based on the fact that you mapped
> twice the size of guest mem as you mentioned in the comment):
>
>    (1) Swap out will start to trigger after you read a lot of data into the
>        mem already, then old-read pages will be swapped out to disk (and
>        hopefully the swap device does not reside on the same virtio-scsi
>        disk or it'll be even more complicated scenario of mixture IOs..),
>        meanwhile when you finish reading a round and start to read from
>        offset 0 swap-in will start to happen too.  Swapping can slow down
>        things already, and I'm wondering whether the 500MB/s was really
>        caused by the swapout rather than backend disk reads.  More below.
>
>    (2) Another attribute of private pages AFAICT is after you read it once
>        it does not need to be read again from the virtio-scsi disks.  In
>        other words, I'm thinking whether starting from the 2nd iteration
>        your program won't trigger any DMA at all but purely torturing the
>        swap device.
>
> Maybe changing MAP_PRIVATE to MAP_SHARED can emulate better on what we want
> to measure, but I'm also not 100% sure on whether it could be accurate..
>
> Thanks,
>
Thanks Peter, Yes agree MAP_SHARED should be used here, sorry i missed that 😁.

Yes, my purpose of taking file size larger than RAM_SIZE was to cause

frequent page cache flush and re-populating page-cache pages, not to

trigger swaps. I checked on my VM i had swapping disabled, may be

MAP_PRIVATE did not make difference because it was read-only.

I tested again with MAP_SHARED it comes around ~500MBps.

Thanks

Manish Mishra

>>> Thanks
>>>
>>>> [copy Jason too]
>>>>
>>>> --
>>>> Peter Xu
>>>>
>> #include <fcntl.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <sys/mman.h>
>> #include <sys/stat.h>
>> #include <sys/time.h>
>> #include <time.h>
>> #include <unistd.h>
>>
>> #define PAGE_SIZE 4096
>> #define GB (1024 * 1024 * 1024)
>>
>> int main()
>> {
>>      char *buff;
>>      size_t size;
>>      struct stat stat;
>>      // Take file of size atleast double of RAM size to
>>      // achieve max dirty rate possible.
>>      const char * file_name = "file_10_gb";
>>      int fd;
>>      size_t i = 0, count = 0;
>>      struct timespec ts1, ts0;
>>      double time_diff;
>>
>>      fd = open(file_name, O_RDONLY);
>>      if (fd == -1) {
>>         perror("Error opening file");
>>         exit(1);
>>      }
>>
>>      fstat (fd, &stat);
>>      size = stat.st_size;
>>      printf("File size %ld\n", (long)size);
>>
>>      buff = (char *)mmap(0, size, PROT_READ, MAP_PRIVATE, fd, 0);
>>      if (buff == MAP_FAILED) {
>>         perror("Mmap Error");
>>         exit(1);
>>      }
>>
>>      (void)clock_gettime(CLOCK_MONOTONIC, &ts0);
>>
>>      while(1) {
>>         char c;
>>
>>         i = (i + PAGE_SIZE) % size;
>>         c = buff[i];
>>         count++;
>>         // Check on every 10K pages for rate.
>>         if (count % 10000 == 0) {
>>            (void)clock_gettime(CLOCK_MONOTONIC, &ts1);
>>            time_diff = ((double)ts1.tv_sec  + ts1.tv_nsec * 1.0e-9) -((double)ts0.tv_sec + ts0.tv_nsec * 1.0e-9);
>>            printf("Expected Dirty rate %f\n", (10000.0 * PAGE_SIZE) / GB / time_diff);
>>            ts0 = ts1;
>>         }
>>      }
>>
>>      close(fd);
>>      return 0;
>> }
>

