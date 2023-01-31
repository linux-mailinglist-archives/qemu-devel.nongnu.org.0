Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67F682FBD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:51:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrvU-0001R3-KQ; Tue, 31 Jan 2023 09:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMrvT-0001PF-AD
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:47:59 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1pMrvQ-00065b-SJ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:47:59 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VBCpGh024245; Tue, 31 Jan 2023 06:47:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=content-type :
 message-id : date : to : cc : from : subject : mime-version;
 s=proofpoint20171006; bh=jXJXTSYx/xMhbRnp/X47E8iQw0AzDSsfB4cRarE0hso=;
 b=bzWR0D1GXW1LNxPQH0hO1lwDw2x99+Vn8B8lheoFCCemLF3XONSJqNdebJj1HW4s3jde
 vVLIYq/5oUgsYtKAyZoivvFauazJpkRTwQjgFHZcby9oYTKb/4hTGM3knPbw+xPsqab4
 /0NwjqK0HqFdWzJEhfjQIW2NctL8tf8bKsDV2jsc+alUVkthdXX2z/giqI+D7PqrTNZX
 hz95zVAVxlCmyYW24DGNdENsiDp0Lq5g82H2Dj2JSQakoekDvkRDuy60S+73zIsBe63q
 X+1aL7d4qonRfvHH+ca859okSsFD/sEKXnq0SauF8iTZPLxrUm2dXUmFkGQMe3gbHc8C aQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3nd0ge0qsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 06:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mL6AzvHaXVrZwbp8xNpYXNdsfTjt5vd0sB+NtPn94epK+TdZjSyhta1r8gPDrRlNOwAZWYb5Un9ei9b5am7mC9alLPhKLQ3nRCA1dSGHytDJpUoIZs53/dsfbn9z+5EzkNBaE23QVX8qT21lkRtTkPr7HCPHgnUFcydG8pNFcs2dyaLg3y/O90r47ai5EUZYZDhvIB9I1vx/XRtLpnBIsNaIt3IN2bZEjytpAEUArudWYTKW3T6YSgtWPfbBBIdczFfau7fp70+pBWiyUn+JHv89t//z7l9FtgOd8uSZShxQGMloEbEjS8EdHVP9aNBf7m4Fs4O1IzJVuHQAWSCxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXJXTSYx/xMhbRnp/X47E8iQw0AzDSsfB4cRarE0hso=;
 b=LYt4D6URAOlIoMj1jlUCakP+riNm/MJBgqXYuMYDVoNbZ4W2nqEn9rpdpJ6vDyp3Ha4b4HGsI2SxYmbkUoBtUvjzZVRJ0pYdiXiK0S+CeOxAXuqZes/8fYANX9YudDCZaH2++sim/kP38ITlhafUdGMB4yDIz5oUHxquDbwRThgZxGci/J2x2bo3scbdjf6HJIWccoEdvs50iGXwmHKTeZFTff4XGt6vr/H/N8phf+L4UvPg4I5fJbk8UgD2HkCszjfPKgbpZhpMk9e1WgvbL3+a1DZpDiGeDsfCfBM4ZZ1RRlzATXkOhaiHVtXO4X5txC5wICe6ZcsD8jmxX+sOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXJXTSYx/xMhbRnp/X47E8iQw0AzDSsfB4cRarE0hso=;
 b=QiboFKOCBhOwBbVtqNf8byGjJMZSqhB9Xpt2dSLeNYnSYMXLCUcl5o2gmy2uQBITxDC0i3TlvSZdfGrmvZgXBW+hon0BZ62vJDgWMoDfVeC9BfI1sMhynp5BRZh+XfvMwwRCKE24ao+eG1YhR6xv6hfiD+0kTH6tvjrc2fVaK8Z276gxJ/UoeX7SQkF9xbaOsCulDC64H7KXC4cMULwYyWmKAHNMMFLOG6ixs1iwy/5+LjCg8Be1pwY/f9O2mf6h1estho0eODlEWAOUa+x4WGkOeoNnVA9117lW8xv7og5ze7BZ8D5J5mVtTx7vR7lmjdj8f4Gf1ZL7wvLH5gJHfA==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by MN2PR02MB7070.namprd02.prod.outlook.com (2603:10b6:208:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 14:47:49 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 14:47:49 +0000
Content-Type: multipart/alternative;
 boundary="------------uuu0ZH1kqsNxFNZ0C9ahnyVT"
Message-ID: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
Date: Tue, 31 Jan 2023 20:17:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: qemu-devel <qemu-devel@nongnu.org>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt <flosch@nutanix.com>,
 carl.waldspurger@nutanix.com, Prerna Saxena <prerna.saxena@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 rohit.kumar3@nutanix.com, "Daniel P . Berrange" <berrange@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
Subject: Expose support for HyperV features via QMP
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|MN2PR02MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5250cf-2172-413a-8b99-08db039a1f94
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ak5VsL7S94vpH/cC/5AmoveGEQMg7zkwiK8tsrZ+i93SRKHXmjMs6WXMcyJo1uqijxqbKCMrKo3nlVX0qeMb/FNgJpbUtJHs1NFcRRz3OS2XAV2xDYZnjORnjyt4x8HS6y/mwmOXO2db+ASic+FK2YystWkl4scHo17tOAZyspTjbuasDpORUttj7Q+PkJIUxRPcpAJKDX22zpj7OLomEVgNCw41z7nJeNoQDj/OfEIeguhYWl8LAa/aKzlIXR++SvzkMIWdJO1skgbYV9PoWqsy/bttbIW0yxu4CVFyiMpJXvjHNEPi7qLMmeE8foOF7Es+lw7Dvhy9aPYxJ3SM3k4yaunBmZVR3kR30cUNcH7prqGgSRm/h4Y2Wr05cLSxEH+2dHm9taJ59KvbJd+Q6UREosVPOFVy9MaGfo3qouuh/QHQ9R3cECcFdV4TfRp+dfTyMtBKoO0ji73VPjGlJJF5mLLovVHZ82n0OLNVBRKrCg+cPisp+4U1ZtFLzeUZMDrbRfQVjkXeQUbH//S6yDneCp9FC1ZTeuqIUtCjsIuE0+SsiFA4kfYAk09p8l8EKwhEFE9SFhytzJWrHwLDtnulEmd8QU7GIN4zlxf/HYA+9Ardt21ua4coiUGiiQ+Od9LEKpBPdtYFphYso2UUe+lR06tz15KacZCiKjd4SHILFCmLyGpvStcCJnj8G5xDb+rqyoh5V6XEjGcrekmjJphSGejgFBsB/+frMv0F4Vo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(38100700002)(4326008)(6916009)(66476007)(31686004)(8676002)(8936002)(41300700001)(316002)(86362001)(31696002)(5660300002)(186003)(2616005)(26005)(6512007)(54906003)(33964004)(6666004)(66556008)(66946007)(36756003)(6486002)(478600001)(6506007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3B1VFYzNTVJVUJXUlk4aGZpMHBDZHFtaHpqOVp2bDZVZCtWblhKZVFtRjJ5?=
 =?utf-8?B?NmltTllxcGEvN1FubTZSU2o2VDczT1pGVEpMaS85MEFmQUNwaStYekZlZlBM?=
 =?utf-8?B?V2cxY002cXBlQnJ1OTNBS3lhc1hUSE5VYUVhVXZRTDM0a0p0aFdjOHh1V00v?=
 =?utf-8?B?a3dKR01wSDlIV3VqdEtnaDR3UCtUM0FxbmI4WDM4QzFZcG5PYmZnSTAwRDZr?=
 =?utf-8?B?MGxLWlJBNlMydmdkZ3pSdFBhNWZMM3V6ZE5KdHZWVFZmNGlPUFFLZUlFVlNp?=
 =?utf-8?B?OHkvM0tqZ0x5d3Mxc0hvZVRxRE1zVW5mWksyZW9nb1hGWUVDNFFCQWFtTTNY?=
 =?utf-8?B?Tm9iVVJTcFhPNE5JNTdMRnRXRTNDWE9aNGJVYXY0cTZUWHBrTmVmNmNxdUpV?=
 =?utf-8?B?Mmo2bmROU1ZUeE4vZUFvODJyU0hOYUJSSnR1ZWN3blRlSVA4V2FkcEZnTzJJ?=
 =?utf-8?B?MFNxVDJ5cDNjOVN5d2RBTWJuL2FvRFE4RU1SLytRenBzWXhSZVhIMXhiRURB?=
 =?utf-8?B?elpvT2o0akw1NmxqTDFJZFZ6NnhCT0g1QnhQSnc5RjN6NG85eTNrMTFGV1Nm?=
 =?utf-8?B?S0lSRVJBWkVtQmJadWNjM0l4b2g1MmxsK2tyYUF1Y2dIZWZjU1RmaDRzVVY1?=
 =?utf-8?B?RnJ2MEdzV1lsd3FYQ3FudzRHT1ROcUt1OHVLWWV6SE9GNlZ2VzJsUVJ0QnZs?=
 =?utf-8?B?THUwNGRHb1VtVmtTQVRFdzFwZTJScWY5OWE1Wk42Q29xR21GelBRWDRmRndy?=
 =?utf-8?B?eU9FSU0xQTRSVzlzbGtUVVFCWUhTMDQ2ME10ZEVNdWxLZkJtMDlEQjZSN1da?=
 =?utf-8?B?VVUwNUcrc2VFSkUvdU5qb1B3VEgvM1EvQnZ2STdLNzZjK3VvTDNrem85a1Bw?=
 =?utf-8?B?STZoOEFIVHNrcjN0QUhNTCtLSmE4UEtLQzRWUjY3cWtPUDMzT2VMOStKdmJt?=
 =?utf-8?B?Snh5NGszT2FoZEZ4NzdwTW9iVTBTNTZGUExNNkhWRnZ1MFVOd2tSb0N4cXU0?=
 =?utf-8?B?eWE1czl5RytZNlg1OE9OZkc0NDFpU2k4WTdBeGV3eWlicVZKSTBTeG1iZGF2?=
 =?utf-8?B?K1h5WS84OTh3cUlWSG8xRW1CL0o3UkdwSE1FYWYwcTRlMDYxNXhTbkUwaldi?=
 =?utf-8?B?OG5rN0hrUTlNSmtGY1RjZjN4RHJNSzMwbERkS2VSRDBCMTc1UlZEdW9mcDY5?=
 =?utf-8?B?cW1DbFdCUTF1Y0tMQURucHAyUlg0VmlFQmpMNFk0TFFvNzcvUXBwd1FzU1Zt?=
 =?utf-8?B?ajNZUVdkUjVNSjRFZFdPTDMvOFFhZjFEaU5wZFRiMkdGR1VzdFMxYmZ6ZU93?=
 =?utf-8?B?dFZDY2xZemdFVmRodUgvUENxVEFsVzc3b1RJT0k0RFZBWFpINnkyMGpoQlBx?=
 =?utf-8?B?NWtGZ2kzdEhxN1VieVIwRWVqa0xVOTN2b3Q2WmpZYTJWWFFZMlR6enBZcU5q?=
 =?utf-8?B?bDdkTHFZeU5ZSVo4a0pXZHJSNWttRmo3YS82M3UvWERUM3BYUnBpMjk1TWJq?=
 =?utf-8?B?RTNOY3RCOG1rZmk2bHA2bEFEbjE3bWhSTWZMcEJpTjFCZlJoMW84R2tocTVX?=
 =?utf-8?B?YW9jUHA0VkJLNkJRdHdsdXYveEwvT1ZIblJzS0dTMVBFWTRMeFFOVXQ4b3Uy?=
 =?utf-8?B?NUhhOHU4YllNa0VHY0c1dUVYMGhCSUkrelNCdjcwSEY5dXlXeERzTiszM2Vk?=
 =?utf-8?B?dG5XWEI3ajZOOFFrcW13MmNRTnNVMTc2RWlRcnFmZTRvcVZ3eDk1SWRtYW11?=
 =?utf-8?B?dnJONVNuY29hZlA4aWMrS0tJdDl6bUcvYjk3dTVQRlZkakJOTXBqdW1MUTZ4?=
 =?utf-8?B?NkVJVWhMc2djK21hclZ3cmdQb2dWQWx3SUREMFd6Zk83RUthRnFhNFVJKzFE?=
 =?utf-8?B?WGF6UjFpK0lxMUVNQkV4MWxwa2w0UGFNemx4bGhYRTBTTGNuK2Z1R3AvK3BG?=
 =?utf-8?B?c0xjOGs0cnFzUWRqSmFMaVYyNFVNVUpHT1hYUUM0Y0FzU2c4THAzQWtxeERt?=
 =?utf-8?B?VkVyemFpTFNXNnh1eklQYi9FajVoSGlkVDZIaHNhU3lVMldjTkxZNkdVWWNv?=
 =?utf-8?B?NUxyNzNRWGQ3dGdQSlZreTZoQ3hGNjVYVlAwK0g0amhadnhMODFoajF5SGZ2?=
 =?utf-8?B?RVFmQU5CNnNub29wMzZ5SFhYUDRCcHJQeUxQWEJzekNmOXF6N2JDc0dFa09G?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5250cf-2172-413a-8b99-08db039a1f94
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 14:47:49.6808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV9QpN1b/IADvsyPy42ZpNH+hGjDSWG2FWrFbxy1a+pBxopob7tm6ED8y52nh6NYNtJ7xh+XkCLG/OudX/Y5crw1tt+EntPfjikCCtS8JK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7070
X-Proofpoint-GUID: JVnI5zfjD4EZ1VHcCV7-toQfR7YG5Txn
X-Proofpoint-ORIG-GUID: JVnI5zfjD4EZ1VHcCV7-toQfR7YG5Txn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--------------uuu0ZH1kqsNxFNZ0C9ahnyVT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everyone,
I hope everyone is doing great. We wanted to check why we do not expose support for HyperV features in Qemu similar to what we do for normal CPU features via query-cpu-defs or cpu-model-expansion QMP commands. This support is required for live migration with HyperV features as hyperv passthrough is not an option. If users had knowledge of what features are supported by source and destination, VM can be started with an intersection of features supported by both source and destination.
If there is no specific reason for not doing this, does it make sense to add a new QMP which expose support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl) for HyperV features.
Apologies in advance if i misunderstood something.

Thanks

Manish Mishra

--------------uuu0ZH1kqsNxFNZ0C9ahnyVT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font size="2">Hi Everyone,<br>
        I hope everyone is doing great. We wanted to check why we do not
        expose support for HyperV features in Qemu similar to what we do
        for normal CPU features via query-cpu-defs or
        cpu-model-expansion QMP commands. This support is required for
        live migration with HyperV features as hyperv passthrough is not
        an option. If users had knowledge of what features are supported
        by source and destination, VM can be started with an
        intersection of features supported by both source and
        destination.<br>
        If there is no specific reason for not doing this, does it make
        sense to add a new QMP which expose support (internally also
        validating with KVM or KVM_GET_SUPPORTED_HV_CPUID ioctl) for
        HyperV features.<br>
        Apologies in advance if i misunderstood something.</font></p>
    <p><font size="2">Thanks</font></p>
    <p><font size="2">Manish Mishra</font><br>
    </p>
  </body>
</html>

--------------uuu0ZH1kqsNxFNZ0C9ahnyVT--

