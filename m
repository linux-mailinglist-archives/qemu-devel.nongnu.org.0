Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5763BE50
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyGs-0006CU-Qq; Tue, 29 Nov 2022 05:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ozyGk-0006C9-1c
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:55:24 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1ozyGh-00049b-Qe
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:55:17 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT67MIq024065; Tue, 29 Nov 2022 02:55:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=Qu5MzQgX4t+aXPSkgOYkTarCWSaQOHnYjoEy0o2AZN8=;
 b=0bS68Nc5vzbrH1gZ+CBmGrCbuYwJug+rZf7mfpN0FsZbChMBgfd8gD3QECs/hJHQOvmD
 TxHRpctPH0axxcMzcglj3t7paqYDO3dAkG7BXEh103urZdBRHlfMkk8XFE0QK9fKqG/z
 GL3OhJqrAuq4g63MwtVR3F6pRPMOpFYcEjuLyb0/Kq3C2RjtBpqujgBdBbGqFC/U08g7
 Ex38rNENPKFoALJ19J88o6TOZ2eZGr2in55iKWgMDMpg8bBngj8kpwLdcexWYFQtSTIb
 BXGPzrN5COOfLd3SCdBzpEC82izTtYv0fGpi/YRZcrEzuPsyZ20x0FZ3MZas3BGXNKNd NQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3m3jrn6ke7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 02:55:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ8iKfK/nTfktyV5HFowIarN/tEPmLVmLVILVtyr6l3WcQyXTKQKB7KEKmxuddF0Ftj/8/fDQUp+BruJi8Pe0kKt2d6AHvOJmF3lR+eooZGggB6nXt08L5y6hlrBL7GRz+DjX1RfdwtuvriUqF3XwkyYVLXBPdgCzt/2MWVnHfFvmb2ifs3DaX0h9WEpqUqiVU1qjHOI8irrHmHNJGxGfLOlg8uy51TYvwjD+bhahpm+NxD5KuPxvSGoQWtYJ89Wi1lvNxLARh7Feu6+ZYpPVnKKNVKIR4of6oTIeUNnEsdHAcGRApvMFwyah/0Yb0y3EpVtXqyWTNbvSOQewCXVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu5MzQgX4t+aXPSkgOYkTarCWSaQOHnYjoEy0o2AZN8=;
 b=dyytkfTtXuc/843RD2FkqJjRMGXEhCxZRFOF2ozQmJRGXw3RjE3uXyQqfYFEVB60IkAAxZzpE7SlPbs4TwXf34wzNDUC1zDhb8+RxKV+75isfMQD9VVYtj1SwuUSWeTfopJMqDL70+3iLR+J1Rd+zA2HVK5eY3y/y/+gbc3JEJEpel9VCSqvQrQBUd9eDOHLM1CUC5Bv7u31klI3h+/3O+if4rN7x4O+pTT/NGECouTIiKdgK3zFFRgsmONMqPtXuPhCxAU2O+k8OoC8USOFqJcPbiItxfwzQSDMSznYL6DneZTn7WkosMWIk2C0l2gEG99Or9uc9XPEmzyh/ddfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu5MzQgX4t+aXPSkgOYkTarCWSaQOHnYjoEy0o2AZN8=;
 b=QeTXOn6P74KRr3Wr7INEdk1/73iM84Q/AFWLjBLUWyOVCMCtegD0Igg57m/0s9DadoPvtV3yk9Il6ZUAR2e+bEXPgqsmpMR1rtGPXPNTSNdz5FsTpn0SkgTSdMv6mDtJ+4fiZxVM7O4xHNaVHvfFOedv6sHDE6OwJyHJjBINzfhFBwz+fjulCoymiuZMPHKildQcWCwQUiZb5IrealHeodCECLA/k3l92ty6UJcfmDEHbmUrlsxUfk+dIXMIFXNbN+OY5tSO38xpRQV888d6Zv0GewEqrQiruh+t7XqpUJmMoxTensuRwo/OH5U34GT10bfx2jA3PxLJEg4FrIeUrg==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by CH3PR02MB9555.namprd02.prod.outlook.com (2603:10b6:610:120::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.6; Tue, 29 Nov
 2022 10:55:10 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 10:55:09 +0000
Message-ID: <aaf17b45-ea8a-cd93-008c-b43b68532ef1@nutanix.com>
Date: Tue, 29 Nov 2022 16:24:58 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/2] io: Add support for MSG_PEEK for socket channel
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
References: <20221123172735.25181-1-manish.mishra@nutanix.com>
 <20221123172735.25181-2-manish.mishra@nutanix.com> <Y35gyiCk/Kjdd1Lq@x1n>
From: "manish.mishra" <manish.mishra@nutanix.com>
In-Reply-To: <Y35gyiCk/Kjdd1Lq@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|CH3PR02MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: bba217c9-417a-42f3-c6c5-08dad1f82ee6
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jx93u8R23pYMs6p0lCgTGSJQhHjhsKeM7ZDLtLKNb4sTWQ0JQEEzCs5VqCbgju14pHnJJ/MAMf51YKXM6WYcDh7blKMQRjvpikkuxlDPzCk57xEHiXI/fFBh52nkFhk4feFx99qtd2HFmBT62mTofPF5sLUuxVFt+qjsYAyELwgteGA7xNJFIYoN05NI4hP6ej5/NIobSha9zTc9vzUlEJScrXzSuDA567ZinbEqOIjbil2hvbBJYjzTPBTT2ilc0mswgw2p2CMQ0sdwJaPEhIn/IdLtOuyiAwvGwLEWH+LaT9zuIvJT+4tbEOTWSVORjWEBTRf0lWqBMQumBzJidndBK7s89UOiOW8Q4MJvz0jxIMYyD8Q+YKtfBNB5hDG+DfRBUxZG4vgMI8P42RDTUCyiy7nOZ3OZA6bm+1t3cOzELaY2p7Jvg++I9bF88Bgo+YCCXiE8mVTLaPuMnKo60zgxko0YBH+5sprSPGN9rXNPNkh+vpuYapw9oaaH/wLcdnVwmmgeQQKypR5EsDyL+ZzWF1/GmFcqE20JqbEBGNEFEzzubsL1vrMlCufH1S9I+bVbEXwrQKqd7yAn+YIu3MT7TAJGQmPndvaWcwAbViEtMvQ/NPUFTSRmi2LbOBYJkBdq58nVWNtjllDfMNwPzSEFtwnlKLMbzHx/RYKLRMaEvqoT5ZLZMnSqxEWjTQ59zoc3U52WVWtg2ATq8q0KZYYuEmjr5KqkKhYgunyyIA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199015)(478600001)(2906002)(4744005)(31686004)(41300700001)(316002)(8936002)(5660300002)(6916009)(66556008)(66476007)(8676002)(4326008)(66946007)(53546011)(6486002)(6666004)(36756003)(6506007)(2616005)(26005)(186003)(6512007)(38100700002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlBqM0JHVjNDYW9sS2tKdklwV3dOZnFJdms2eE82TG5XRVFSeXRWK1VsK1Bu?=
 =?utf-8?B?TTRxbndVZ2FEN0J3dytPMUhZc252SzRMeDZNVmlneFhxSkFhSy8zVzZKUmUr?=
 =?utf-8?B?OXJaa28vNDFvQVd5L1BadmM0WFVkUndtNXFGdTJORlNRQkJ2MUttTDdBY1hI?=
 =?utf-8?B?QkNxV3NvWUlXUHBQcW9sMzdiZHFDRG5TeFdDQTB0SHRsVkJBVC9ycktkT21L?=
 =?utf-8?B?THZVUEtPMjgxaWcxQ1NpVUZ6WWRvWk80cDBEQUhhRlhTNFBmTFZTaDR1dGdO?=
 =?utf-8?B?MWRuNVZYL1h3TWZSSU9Nb2RRdEZaaW5UWUFIRlpGcmlvcW85V0NzUzFybE9Y?=
 =?utf-8?B?WUVYenZFOExrcFB6N2hNbWc2ZS84Z2R6L1JMZFd1cVplN3VGMEU3R3ZxalBW?=
 =?utf-8?B?YnBEc1ZnK3E5T0RCM05jMWdVSDYxd3c0ZllObXBqamdLckpicis0K1J0RWFZ?=
 =?utf-8?B?VHJmSEc0cjJRbDNxUFhoSVVpTnowd3dEeERDV1ZkNzgvTEJYWkk5R2JIMHJl?=
 =?utf-8?B?eGUzT3BRMm90bVVZcVJZK1prYURQSTdhWFVRUWtVTm96YWcvQUJ0cS9vNEEv?=
 =?utf-8?B?NWtGYUZ1RWViZFg4VDgzLzg5NTQvZ09aeTMwck0zNlFxVTVGMENqYWYzalR3?=
 =?utf-8?B?N1BiV3cwb29ZbTUycEEwWm1acDdjSUYrM2g0Z3AvS21WS3NJWUFmWDVtU2Jq?=
 =?utf-8?B?QStoZ2FuVVV3L3FKSWQ0S1VRU3RQMkt0TWJUejc4VnJIZWxQdkRBU0R0VkRz?=
 =?utf-8?B?UFlyNENmU0tNSDdiRXJhamM5eU5PRFVweGM3MEdtZFRTbjRLOEpSd2pyZnpL?=
 =?utf-8?B?RzROZ1BEWlA2MHNqYXdoMFNBYjk5UE8zZG9IcytWUEJrbGp6Vm1lOHQ3TWtB?=
 =?utf-8?B?amlsdnphU09wWkpJYVRUdEo3N1VqYUwrRTZXTkI1amxDZnVOWnlialhGclI1?=
 =?utf-8?B?SWVUcHM2K3ZQUVFvaEs2RHV4Z1pLQ2x1YjJRcHBCK0ZyY3NtRmg3RDA5T1Rr?=
 =?utf-8?B?bXhGTHZ5OXR0ZzlGNG5jK3NHbVIvMlFic0NGckllLzBQaVh5QjB4WnU4K09t?=
 =?utf-8?B?SUlZUEpEN1lYRmFtUGYzaVM5NERtSlZJRlV3WHppOGFsS2h2TnoxenhQaytx?=
 =?utf-8?B?QTF2YWR1d1dRMzlpNFhPMndFZ0pIdU94WVd0aGlzSk9hUDhEVStpMmtZNVBX?=
 =?utf-8?B?SlBucEtpMlk0VWZ0YXJoVVd0Ri8zdTZpQkRabENUdFlyMGUyWXhZOTNXbGJR?=
 =?utf-8?B?OXROVDkrVHJRKzluWWI0YjZydlBzSkdEc2t2RWRIeGJ5SjY2SlVRUy81UHor?=
 =?utf-8?B?QUxyV2J4a0tNeWlrT0VLSFVrbmF1TDdEU0k4VHlkY3puRCtNVHRxL0ZQM1N0?=
 =?utf-8?B?Wk9lS2tEdjVoUkU1Z0haa2Q5dWNvdVpJKzJsT2ppQjFJS0gweXkwRUlVRjhk?=
 =?utf-8?B?M2VGMzJVSUVWUG8wQk4zMkJ3QzNLVmUwQmNXVDhiUythdTA5S1k5R0ZLSEI4?=
 =?utf-8?B?NHp2aFJpUXJNZ0phNjlwY0NJaWhUSVR3dzc1TWJkeW5yWUs2eGt2N1NNOXUr?=
 =?utf-8?B?RVYrUExqRjZRRklWQWFOT0lpVVdDelhtcUVxVXQxUHFyMTV3Z21PN25UNW5i?=
 =?utf-8?B?eGoxRkNEd3l4SEE3SUkyVXNpVk1LSVJkUWhtcG5xKzd2eml1eWVUZGxyTzNL?=
 =?utf-8?B?dlBBME9lbTErYmk1UWpqNnZVVFpMeW13bUVLYnJWRkZnVVcyeVA5aHNWYlBt?=
 =?utf-8?B?YU1TQ0RVZFBqY2lCb3Q0LzNwT0xDV3I4WUE2TmkvWTNnSjRUemxUYkRPMjBG?=
 =?utf-8?B?NW9GU3FVaS8ybm1EUFl6N1FwV1JIeDdiZXFSRGVTayttMyttY3NJV2pWWHRa?=
 =?utf-8?B?bkszd3AzNTlLYi9PZmRFTU16YXUwMHZUUlJ4cW1LRUFRSzdpejJrenRNRzdE?=
 =?utf-8?B?cG5EOUJ0TXE1LzQzZnF4Nnl1STNFK2ZKa3RaaEZ3aW15NGlxYXJRMnJvYjBG?=
 =?utf-8?B?UStVMkdibUhCWEoyaWVQZHVJVkdOSlAxRnQ2alI3U3Iyb2hhd1RkRE1hYW96?=
 =?utf-8?B?YWxQNi9ZSEhLT1lKaWs0QmF3Q0k3WmpvUnZJdlBzZ0FHT0NmczBHNEdGSkNk?=
 =?utf-8?B?VWpkYW16ZGRUNTlwYW1sT3kzQkp4ZUs3OXV2Sjl4SUVBNUQ2VUw0SUVaRHNT?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba217c9-417a-42f3-c6c5-08dad1f82ee6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 10:55:09.8452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqpOqJ6FLBPJBT2SLZI5ltPFwWQmurJvJbTVt3QJlgm6aU/Wwi7FcjyEEdrUNPhrsSJN8H62zqUaFz1o2qLSCC39LZCazf/gXxZgJBdBWaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9555
X-Proofpoint-ORIG-GUID: mHZ-HfiPXgMlKrWsJV99-v4yHBxPMJlU
X-Proofpoint-GUID: mHZ-HfiPXgMlKrWsJV99-v4yHBxPMJlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_07,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, SPF_HELO_NONE=0.001,
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


On 23/11/22 11:34 pm, Peter Xu wrote:
> On Wed, Nov 23, 2022 at 05:27:34PM +0000, manish.mishra wrote:
>> MSG_PEEK reads from the peek of channel, The data is treated as
>> unread and the next read shall still return this data. This
>> support is currently added only for socket class. Extra parameter
>> 'flags' is added to io_readv calls to pass extra read flags like
>> MSG_PEEK.
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.co
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
>> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
Hi Peter, Daniel

Just wanted to check if both patches in this series are approved or i need to update few more things. Also Peter, for your Review-by to be included do i need to send another patch version or it will be taken up whoever will be merging it?

Thanks

Manish Mishra



