Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0052856F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:33:15 +0200 (CEST)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaqY-0001iK-FV
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqapL-0000WU-6L
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:31:59 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:61726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1nqapI-0003jA-1J
 for qemu-devel@nongnu.org; Mon, 16 May 2022 09:31:58 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G9ex6F032383;
 Mon, 16 May 2022 06:31:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=1NwS4QQLhghBlC/oawXlc1zQFwTarM0YvNbxLG4Lfg8=;
 b=d5JjwnHHM518JxIU84QSdRvmNFoBDtWDMJZuZyEAdlxHC6buReCERtVd8qoo/apI10xm
 rdRIonAipxF5GkljNkDPhNqbPgLwr1LVDyk25uSDm706sXaavkxEo4zvAGufkZ0eYzM6
 wKy/dUDZa4qhO3srhjQcnpq0HF2tCESwxhDjfkaFscRf9RBchF+mccy8i5HtNUGMkU1K
 3bdzrce9Ji14ykizn19wsraBn+53FeLscszhRn28du3SveuzX7Q15Tarw/rLELb9pwq3
 +4DTuhMqA7+EtaKtP0hJ+YMMxiiJqqVaV2Cnp851aimYuvxMnLnFVoGtidKqUl9LOZbx 0g== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3g29y93gkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 May 2022 06:31:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRmOWGO5bdjnzi11/kexITXKkDn7q1EUVEaDO6afhhBzadtAm69EEbLUBux2R9LHfD/wjSYekonfF3bskSQPfQJENo4VP/yWMkHIl4p2enUa8U7m8yyRAclzVOWc9jM/wXT00BgO4ZrQc4QVRzMq0jTNK/eIJQRI9QAl0/d234kXlsnuRvxzCZyLRtuPP1yPeAil56PcXxkprfcGcVRTR5L6LCUl4LjzsWq9hlU+aBdmlowZqujrR3AAiirrPDbOEp6Zcr3ZyczMMapkT1lxKSpr6zjUkuCPWH+17pYoBsp2eIdUjns0Bh2eDw7Ibqw0Ry+3QyjMKJjDZEU/JmmmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NwS4QQLhghBlC/oawXlc1zQFwTarM0YvNbxLG4Lfg8=;
 b=GV/4AGB2FphhwTjrwYRxxZg730ZSUalgEj6jIh4/pPJBXYTpo8CrzYwPE43eq8UvxQTX31UfdAI88leUVtBL15DycqEXyMxmmJ1hMFkjI7u1P4V2taQtjGPm/BNuXp8qyqK1Uyuq6XUUoauKgto1fb9GurcxAGopK2WUh7RzOO+UyqAj7N7QkUBsbGlFYkPX68UilOBp+0+D8zKS9t+huLeYThw3D0gyVir7cw5o3ssK7Id2n/Rn0FHu9mzX5u2uSehmQd9bPM6PnxyX5ftj9IgdvYbfvCVuBnxYx1sc8kEwTDh/W6/5tdp0UVmO2wqpdKJL8C8gzdgcUXvW2457QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by DM6PR02MB6779.namprd02.prod.outlook.com (2603:10b6:5:216::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 13:31:49 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::7ded:77cd:1553:412b%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 13:31:49 +0000
Message-ID: <922cf9fc-e15d-ad86-ba95-05aabbb00f5f@nutanix.com>
Date: Mon, 16 May 2022 19:01:35 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v5 13/21] migration: Postcopy recover with preempt enabled
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-14-peterx@redhat.com>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <20220425233847.10393-14-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::19) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c4a5bff-c9ff-40f0-5267-08da37406e1b
X-MS-TrafficTypeDiagnostic: DM6PR02MB6779:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB67790178CCE00159B6D40E24F6CF9@DM6PR02MB6779.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZQvQ15KZX4rcDnWa/3fBt/gvT6hzhsPSl5LCOdfJKYurazmQUsEEQlnvrXWdW9XmvaAtIX+KDNvTrh39tWjHzwdNreMp16o+tjJNkE2RSxMidXXHzh0GiUP1c02VhCuLhABD9Tw+NgTbAOCgB3ip88gEXrKvtV4w4CnkLiltYXNvqOp605VKeFzOmAS7gmBWF8wZv/O4aGVs7R9mgp6dWZAL3qXgIIPKWTEPc1hf3vyx7AUW4knJ+LHoXl06JraE1iM9KbiF5F7IQ+cz0aZOl4sbXATpjGcE1Xwhg7hAMeayD9iqxS8/sMVE/ZpVHa2qPCpwrhpmYV6FAZcCmDKWNLc6SSHTY486Zwc0fxEcy/YmqZPU1K5f/UbhkYwd4ZfJ9/xLBwP4ZalFyBEGT1XfgZtC7SWHmvBHpaAn+dtoS2FELU1+1gnVSKevUkOqEiC74K7ze72H6hYf/kUCLc8wJQ44n6e2C0xJn6OexLr4yfMwSW97ouBmIqSBG9vgJdJorMZSPClx4sJmdfVJJdFCToKDanXWFAZTBBlW0+GqxlkwD6L48Y4ISsyVJTKNY25nWhy6FQDSzI2NsoPROfWVgWaMjDmuwl3v/jG2B1KLBdZ2++oSaHBt+c7Hsg+MkSmt62f3i6ONPOWXFOwTd9ziNi1+c7glNO6J2yfjiLFvpnkvBZBPwTCdxKYDg5FzAjvQHHGLZHQj9gxMp9n3BnphRnvp/6VJmCFmLzamOxaS7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(6666004)(2906002)(2616005)(6512007)(316002)(66476007)(8676002)(6486002)(8936002)(508600001)(30864003)(5660300002)(36756003)(4326008)(66556008)(86362001)(66946007)(54906003)(31696002)(83380400001)(31686004)(38100700002)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGYxdjNpR1o5SVJlUFpsM2xKcGgrdHhRSm5uUEYxQVJyNEFLeDFnamQ5a3Zj?=
 =?utf-8?B?T3NaT2pIdGlkdXd6MVpZcUdzNkRsSWhpOFBneGFwVWZFVXRjZ3RsZHBLYjJN?=
 =?utf-8?B?bE9QWkY1NVhORjRtN3NxbGlNWGxHcVhkWUozelRZRkZ2TjlaMEhWOUxRdERN?=
 =?utf-8?B?TnM1aTgvSkw4dENBRnc3WEJMaWUyK0czRGptVHo2N2ZhL1Zlcm1BR1NZVXJP?=
 =?utf-8?B?Rm9yQ05XbEFHK0ZtVm1pY21hZXFhUnlvMmx3b3d5RE5EMnNlVHE3ekZ3SjFH?=
 =?utf-8?B?b2dCS1N4eEJrVDluVUdZaFIvZjRuaG5ZdC9DbkZOaUxrUm1KcFNDWVhIbW5j?=
 =?utf-8?B?aXg2dkFuZFFFUHBxaEUzQzlCKzQ3ZmR6bkdwYkZ6OW9aNk0zem9HRnF6SGRZ?=
 =?utf-8?B?YWdwM2dsdkNwUDl6L3RjeTlOcWUvQlZlRkMwY1NBRVd2Q2MwS3orWFBJQ0hF?=
 =?utf-8?B?OWJMYk93aXdNN3hUcTBzV0J6ODQvQitsbXdiZ3BOS09Pb2hobTNSS2loUWJN?=
 =?utf-8?B?TnJkZUdUeXVSV0FQME9nN2VlNnZvSGJ3Yk5EYmVWMWpOb2h6TVl1YnlUNFhQ?=
 =?utf-8?B?TTN0cDhVU2hrZlEvRUQ1elgzSFJUS05ETTZsaGJML3BiUVhqaS9vaEx2T1JD?=
 =?utf-8?B?NFVpd0pRY2piWjhueTFtT1NDaEdJSndOa3d4ZVZMenRhOU94SjV2S2VuS3hE?=
 =?utf-8?B?UE9KMFk1dkljNXdzVXRNVTVuVEJ6eHhKbkRLblg1SHZsa1pONHFWM0s5R2lW?=
 =?utf-8?B?NmRxbGVZWmp4a0FzNDRSazNJbXhWRllFTy9DdStYN1RZZG5EOVFab3V2bTVo?=
 =?utf-8?B?Zm0vajNGaVVVLzJYSFZleGIxRmxXWFM2S243N3hPRGltQXlrVjRVenNmU1ow?=
 =?utf-8?B?TjN1ZGlPT2M2TGwzTWx2VVdMbzB6NFB2bU9xREdPcUR4M1VBcHlXQS8zUyt3?=
 =?utf-8?B?cjNYY0MrYUYyNk5WT1dFZEpuK0dvT1RBNkUwQTB3RG03dnhEOVkxU0Z3THBV?=
 =?utf-8?B?WDVZMitSL1lFWnZGenkrRlczZnMzQ3lGN1BCNVN6UG1NejhNUTBsdmQwZTE5?=
 =?utf-8?B?NUtsRElUNytIYzhxK1N1RXB4eWRsUkowQllBTy9pMmE5U2VwV3NEdWd0SW43?=
 =?utf-8?B?YkoyQWllU2w1NUZYYkFWRnJWbFFSempmNDB5djFPNk1xRGEzcnZvUXpEQVN1?=
 =?utf-8?B?VmlHYitCbjJDYzgrVGE0ZjlCVmpUbGdGM1Z6STZUbytKb3BCdHRXYXc0ZDd2?=
 =?utf-8?B?OTdwM1B4VmtQOXJqWU5HY0xITXVWRzg1eDZwOUd2S0l3aWVYRVVydXA3VXVE?=
 =?utf-8?B?emgvdkRnTjZkTWZoRzU0VFZ1SE5kRDlvK3ZCcTRNbjhsYnR4VjFaTUhBNkxP?=
 =?utf-8?B?NlZ1aVhIUjh5bzZXdjdoVnpSTmtJZ0lzcU91WWV5VW9HaC9MOXhnYkxPOE83?=
 =?utf-8?B?cXAzVVc3UXc4anJQRnZZRnBLSzUweFkyejFTUzljU1I4cW1tU2JTN2JXZmVj?=
 =?utf-8?B?ZEhoamw3VC9pNlBucE1BanNDL3RySmlIN21zNTJNVTFTNHF2SWdib1QyUXgv?=
 =?utf-8?B?NEhLQkdESDA3VjBFei96dWQvZkY0cDZ5SHdjcXJheUN3cWJBcDE5WldRemNi?=
 =?utf-8?B?b2hPdHlvM0tvL1M4Slk5dHJpWENsQ29SdzVzaDRZVUpScTYxWm4yWjQ0UmMv?=
 =?utf-8?B?NWdqSWI3SWRNOGRCRkRUajAzd0hQWkxSUmE3Vzhsd2RPNTZ2L2tqU1dVRFZ6?=
 =?utf-8?B?SEljMnhFRHVoM1JSVitpNzZLVThTdS9vVHRGS1llSU5FRmZNME9MalU5Z2VI?=
 =?utf-8?B?TVR2dW1XQkZ5Y0pZbEtMTWJmWEZRZmdWVzAyeFh1c25RM25JV0x3K3hnMUYw?=
 =?utf-8?B?VHFiN1ZTNjhiMllWOGZaWE14d1ZnMUZxeTgxejg2OGcvRWg2U1BmdWpPbngy?=
 =?utf-8?B?ZEtCUmVRNnJ5dC9JQXYvbEtJclFlMW9mZmdKeXJOeXpWUnFSK3J4NERrNUpa?=
 =?utf-8?B?QXdSTUVKbUFiV1N5d0Q2MTl5VmpsN1M1ZjFkbXI3YWhiQ09jQm5udVZPTE9h?=
 =?utf-8?B?M1p5UmF0S3F4RkgwT2J4Q0RVYU9DU0FNSmVMc3NhZTVhTjFhMmJUVEEzTkc1?=
 =?utf-8?B?eFg0bDhvOWtwM0tiekF4NnI0SkloT3h6ZmZlYXFGdytsN3IwMWZzQ3M0UXlx?=
 =?utf-8?B?RGd4Zy90YVdBMWJIQkRmbGw3R0pFUngxV2MzVXBuU1ZSdGNxNGhCZitFVExH?=
 =?utf-8?B?bkkwb25xcXZ1Tm92cGswZ2x3VTNyTW5FLzhUL1lWWnJncTdkT3VPdmozNitK?=
 =?utf-8?B?MXV3THVMOWhlUzM3Z0hubVNKTzdlRXpZOEhtTHIrdERoQlVWR0hBNG1WUW82?=
 =?utf-8?Q?/im+qAZxRYjhb4Ws4TAGI1ydJ+yrjKl4x+gLaDVfN91DP?=
X-MS-Exchange-AntiSpam-MessageData-1: 75TJGEsdi20/tMtCA3IAUP7zYjYyIS0fgjs=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4a5bff-c9ff-40f0-5267-08da37406e1b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 13:31:49.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhaVvaDUGrFQ+e1/TZDadeymThfhCOzesURmZrBxb+mToMSvfDd59/DWd8Sk/u6zRKpFo5/xV2SeTxSiIRvn7bF+LhlHuxMjjLmtgQYHF9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6779
X-Proofpoint-GUID: J7-CTnzrt3JVJLX7plpIVV8SjZXeq_il
X-Proofpoint-ORIG-GUID: J7-CTnzrt3JVJLX7plpIVV8SjZXeq_il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_09,2022-05-16_02,2022-02-23_01
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


On 26/04/22 5:08 am, Peter Xu wrote:
LGTM,
Peter, I wanted to give review-tag for this and ealier patch too. I am 
new to qemu
review process so not sure how give review-tag, did not find any 
reference on
google too. So if you please let me know how to do it.
> To allow postcopy recovery, the ram fast load (preempt-only) dest QEMU thread
> needs similar handling on fault tolerance.  When ram_load_postcopy() fails,
> instead of stopping the thread it halts with a semaphore, preparing to be
> kicked again when recovery is detected.
>
> A mutex is introduced to make sure there's no concurrent operation upon the
> socket.  To make it simple, the fast ram load thread will take the mutex during
> its whole procedure, and only release it if it's paused.  The fast-path socket
> will be properly released by the main loading thread safely when there's
> network failures during postcopy with that mutex held.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   migration/migration.c    | 27 +++++++++++++++++++++++----
>   migration/migration.h    | 19 +++++++++++++++++++
>   migration/postcopy-ram.c | 25 +++++++++++++++++++++++--
>   migration/qemu-file.c    | 27 +++++++++++++++++++++++++++
>   migration/qemu-file.h    |  1 +
>   migration/savevm.c       | 26 ++++++++++++++++++++++++--
>   migration/trace-events   |  2 ++
>   7 files changed, 119 insertions(+), 8 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 8264b03d4d..a0db5de685 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -215,9 +215,11 @@ void migration_object_init(void)
>       current_incoming->postcopy_remote_fds =
>           g_array_new(FALSE, TRUE, sizeof(struct PostCopyFD));
>       qemu_mutex_init(&current_incoming->rp_mutex);
> +    qemu_mutex_init(&current_incoming->postcopy_prio_thread_mutex);
>       qemu_event_init(&current_incoming->main_thread_load_event, false);
>       qemu_sem_init(&current_incoming->postcopy_pause_sem_dst, 0);
>       qemu_sem_init(&current_incoming->postcopy_pause_sem_fault, 0);
> +    qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
>       qemu_mutex_init(&current_incoming->page_request_mutex);
>       current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
>   
> @@ -697,9 +699,9 @@ static bool postcopy_try_recover(void)
>   
>           /*
>            * Here, we only wake up the main loading thread (while the
> -         * fault thread will still be waiting), so that we can receive
> +         * rest threads will still be waiting), so that we can receive
>            * commands from source now, and answer it if needed. The
> -         * fault thread will be woken up afterwards until we are sure
> +         * rest threads will be woken up afterwards until we are sure
>            * that source is ready to reply to page requests.
>            */
>           qemu_sem_post(&mis->postcopy_pause_sem_dst);
> @@ -3470,6 +3472,18 @@ static MigThrError postcopy_pause(MigrationState *s)
>           qemu_file_shutdown(file);
>           qemu_fclose(file);
>   
> +        /*
> +         * Do the same to postcopy fast path socket too if there is.  No
> +         * locking needed because no racer as long as we do this before setting
> +         * status to paused.
> +         */
> +        if (s->postcopy_qemufile_src) {
> +            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> +            qemu_file_shutdown(s->postcopy_qemufile_src);
> +            qemu_fclose(s->postcopy_qemufile_src);
> +            s->postcopy_qemufile_src = NULL;
> +        }
> +
>           migrate_set_state(&s->state, s->state,
>                             MIGRATION_STATUS_POSTCOPY_PAUSED);
>   
> @@ -3525,8 +3539,13 @@ static MigThrError migration_detect_error(MigrationState *s)
>           return MIG_THR_ERR_FATAL;
>       }
>   
> -    /* Try to detect any file errors */
> -    ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
> +    /*
> +     * Try to detect any file errors.  Note that postcopy_qemufile_src will
> +     * be NULL when postcopy preempt is not enabled.
> +     */
> +    ret = qemu_file_get_error_obj_any(s->to_dst_file,
> +                                      s->postcopy_qemufile_src,
> +                                      &local_error);
>       if (!ret) {
>           /* Everything is fine */
>           assert(!local_error);
> diff --git a/migration/migration.h b/migration/migration.h
> index b8aacfe3af..91f845e9e4 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -118,6 +118,18 @@ struct MigrationIncomingState {
>       /* Postcopy priority thread is used to receive postcopy requested pages */
>       QemuThread postcopy_prio_thread;
>       bool postcopy_prio_thread_created;
> +    /*
> +     * Used to sync between the ram load main thread and the fast ram load
> +     * thread.  It protects postcopy_qemufile_dst, which is the postcopy
> +     * fast channel.
> +     *
> +     * The ram fast load thread will take it mostly for the whole lifecycle
> +     * because it needs to continuously read data from the channel, and
> +     * it'll only release this mutex if postcopy is interrupted, so that
> +     * the ram load main thread will take this mutex over and properly
> +     * release the broken channel.
> +     */
> +    QemuMutex postcopy_prio_thread_mutex;
>       /*
>        * An array of temp host huge pages to be used, one for each postcopy
>        * channel.
> @@ -147,6 +159,13 @@ struct MigrationIncomingState {
>       /* notify PAUSED postcopy incoming migrations to try to continue */
>       QemuSemaphore postcopy_pause_sem_dst;
>       QemuSemaphore postcopy_pause_sem_fault;
> +    /*
> +     * This semaphore is used to allow the ram fast load thread (only when
> +     * postcopy preempt is enabled) fall into sleep when there's network
> +     * interruption detected.  When the recovery is done, the main load
> +     * thread will kick the fast ram load thread using this semaphore.
> +     */
> +    QemuSemaphore postcopy_pause_sem_fast_load;
>   
>       /* List of listening socket addresses  */
>       SocketAddressList *socket_address_list;
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index e92db0556b..b3c81b46f6 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1580,6 +1580,15 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
>       return 0;
>   }
>   
> +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
> +{
> +    trace_postcopy_pause_fast_load();
> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);

I may have misunderstood synchronisation here but very very rare chance,

as both threads are working independently is it possible qemu_sem_post on

postcopy_pause_sem_fast_load is called by main thread even before we go

to qemu_sem_wait in next line, causing some kind of deadlock. That's should

not be possible as i understand it requires manually calling 
qmp_migration_recover

so chances are almost impossible. Just wanted to confirm it.

> +    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);

Just wanted to confirm why postcopy_pause_incoming is not called here 
itself.

Is it based on assumption that if there is error in any of the channel 
it will

eventually be paused on source side, closing both channels, resulting

postcopy_pause_incoming will be called from main thread on destination?

Usually it should be good to call as early as possible. It is left to main

thread default path so that we do not have any synchronisation overhead?

Also Peter, i was trying to understand postcopy recovery model so is use 
case

of qmp_migrate_pause just for debugging purpose?

> +    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +    trace_postcopy_pause_fast_load_continued();
> +}
> +
>   void *postcopy_preempt_thread(void *opaque)
>   {
>       MigrationIncomingState *mis = opaque;
> @@ -1592,11 +1601,23 @@ void *postcopy_preempt_thread(void *opaque)
>       qemu_sem_post(&mis->thread_sync_sem);
>   
>       /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
> -    ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
> +    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +    while (1) {
> +        ret = ram_load_postcopy(mis->postcopy_qemufile_dst,
> +                                RAM_CHANNEL_POSTCOPY);
> +        /* If error happened, go into recovery routine */
> +        if (ret) {
> +            postcopy_pause_ram_fast_load(mis);
> +        } else {
> +            /* We're done */
> +            break;
> +        }
> +    }
> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
>   
>       rcu_unregister_thread();
>   
>       trace_postcopy_preempt_thread_exit();
>   
> -    return ret == 0 ? NULL : (void *)-1;
> +    return NULL;
>   }
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1479cddad9..397652f0ba 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -139,6 +139,33 @@ int qemu_file_get_error_obj(QEMUFile *f, Error **errp)
>       return f->last_error;
>   }
>   
> +/*
> + * Get last error for either stream f1 or f2 with optional Error*.
> + * The error returned (non-zero) can be either from f1 or f2.
> + *
> + * If any of the qemufile* is NULL, then skip the check on that file.
> + *
> + * When there is no error on both qemufile, zero is returned.
> + */
> +int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp)
> +{
> +    int ret = 0;
> +
> +    if (f1) {
> +        ret = qemu_file_get_error_obj(f1, errp);
> +        /* If there's already error detected, return */
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    if (f2) {
> +        ret = qemu_file_get_error_obj(f2, errp);
> +    }
> +
> +    return ret;
> +}
> +
>   /*
>    * Set the last error for stream f with optional Error*
>    */
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 3f36d4dc8c..2564e5e1c7 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -156,6 +156,7 @@ void qemu_file_update_transfer(QEMUFile *f, int64_t len);
>   void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
>   int64_t qemu_file_get_rate_limit(QEMUFile *f);
>   int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
> +int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
>   void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
>   void qemu_file_set_error(QEMUFile *f, int ret);
>   int qemu_file_shutdown(QEMUFile *f);
> diff --git a/migration/savevm.c b/migration/savevm.c
> index ecee05e631..050874650a 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2152,6 +2152,13 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
>        */
>       qemu_sem_post(&mis->postcopy_pause_sem_fault);
>   
> +    if (migrate_postcopy_preempt()) {
> +        /* The channel should already be setup again; make sure of it */
> +        assert(mis->postcopy_qemufile_dst);
> +        /* Kick the fast ram load thread too */

> +        qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
> +    }
> +
>       return 0;
>   }
>   
> @@ -2597,6 +2604,21 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>       mis->to_src_file = NULL;
>       qemu_mutex_unlock(&mis->rp_mutex);
>   
> +    /*
> +     * NOTE: this must happen before reset the PostcopyTmpPages below,
> +     * otherwise it's racy to reset those fields when the fast load thread
> +     * can be accessing it in parallel.
> +     */
> +    if (mis->postcopy_qemufile_dst) {
> +        qemu_file_shutdown(mis->postcopy_qemufile_dst);
> +        /* Take the mutex to make sure the fast ram load thread halted */
> +        qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
> +        qemu_fclose(mis->postcopy_qemufile_dst);
> +        mis->postcopy_qemufile_dst = NULL;
> +        qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
> +    }
> +
>       migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                         MIGRATION_STATUS_POSTCOPY_PAUSED);
>   
> @@ -2634,8 +2656,8 @@ retry:
>       while (true) {
>           section_type = qemu_get_byte(f);
>   
> -        if (qemu_file_get_error(f)) {
> -            ret = qemu_file_get_error(f);
> +        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, NULL);
> +        if (ret) {
>               break;
>           }
>   
> diff --git a/migration/trace-events b/migration/trace-events
> index 69f311169a..0e385c3a07 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -270,6 +270,8 @@ mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, int cpu, i
>   mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
>   postcopy_pause_fault_thread(void) ""
>   postcopy_pause_fault_thread_continued(void) ""
> +postcopy_pause_fast_load(void) ""
> +postcopy_pause_fast_load_continued(void) ""
>   postcopy_ram_fault_thread_entry(void) ""
>   postcopy_ram_fault_thread_exit(void) ""
>   postcopy_ram_fault_thread_fds_core(int baseufd, int quitfd) "ufd: %d quitfd: %d"

