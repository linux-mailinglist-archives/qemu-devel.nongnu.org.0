Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870EA422F0E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:21:27 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo86-00042k-Iy
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnSh-0006va-EL; Tue, 05 Oct 2021 12:38:39 -0400
Received: from mail-eopbgr70121.outbound.protection.outlook.com
 ([40.107.7.121]:4994 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mXnSe-0005Jp-8t; Tue, 05 Oct 2021 12:38:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jyuhll3NI7lQU2yOSQVzrm83BYqpw2ipXmHyUzcMpNNY7gYOKGIxn5gxgr0c6m7ugk+jAD2qeu851MtZH0ouWtZwevTUzIBwUi+qJesB3Gt/G4Wg2BsNX2/Yc20uOB1LojimETPnxZh4ttTRUWnbCK8kBLQOb/dtKT8XDfPonILZY/YnGfhkZISgrOFIqwWxzLpSfl6qjbZ62S1TK97iOLVh4j8fpK44oZR/Nm8xs4/sMmoqzQLhR9YB1H4JLySHi4JpRl81oyzst79A77YHaipKZHBqGSLDRA3syNTuOwCNIOGXZ/vcjSbQs0qV6pxRvcyzMvSF2h3yElycCWE9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60RDM8ki8wxK/+kY4Ka8KaN+kg5VF527JyrFbNwqLAw=;
 b=BO9fK3dBukHI16I2QGX4WwQ5zAOknO7trVXpDk/S1WccuMQC68p63Ji63LoS7afbITafHGK9avdxDrfQLGHI+m/FpavzD8g2JITT33VKKw89ilUQ53PajCKAOp8XWrMGqE0GQBiwncHQ9L7dTX3FqVxdN3T3oGIG5LQmVi6e808rueTwm1qzU6dn9H8p2FZ7OuobTs9shIYEyS+4bGSs62DYQajbVIPvlUKJSB83w/eM+1v30ezI6uOmpIUJrMSA5FRx44zlfUc7M3eN+HBRl9gG/BSbBfw8VunP9QHz77xsSUY1mrDEEJ6fNKzy8ll+zoZLiG/FpqDFy6ILP6zbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60RDM8ki8wxK/+kY4Ka8KaN+kg5VF527JyrFbNwqLAw=;
 b=dTjEDT2qccrl25O7W64oAAxlOk6qUPFaC7dC/DMU/V5p22N3GFPAsMbmxKyTN1j7PXL+kPyvR/Selu9hxaGGdT4w/uQtMJKOpS9pKvNzQMmI4NfZNBhfozgEcf9AZOxI4XxjuLrBRI+nn2/Xd6OYUlKqRzEwP6A7q/GvfStvNpI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 16:38:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:38:32 +0000
Message-ID: <49511519-9976-a34e-394c-dee2ea8b5e3a@virtuozzo.com>
Date: Tue, 5 Oct 2021 19:38:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/2] block: avoid integer overflow of `max-workers` and
 assert `max_busy_tasks`
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20211005161157.282396-1-sgarzare@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211005161157.282396-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0049.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.207) by
 AM6PR0202CA0049.eurprd02.prod.outlook.com (2603:10a6:20b:3a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 16:38:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097268b5-34b3-4ebb-df5f-08d9881e91a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470409CDAA1058E4919F233C1AF9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKdKy2p3luKLosNyjdZfglXQuTH4AK/lSYxFgiZgdVOlR8w7geQ7EuZnuGCfls3M5gJYiOV7jn30jthebSMPQEvxZNvzqCrAONnQpc9TWB6++5BjUG9JyKfKy9AJgMOT0CpZTRB3Begl65Mc5j29LAD8H+lu2KOOHLtUWbaAUNA6kNA10+JGc2F+w97c1mb6lcFQpYnhf++7UzH7VRDnnmbcAsOM/3lS7nsp+FHgiibYPf9iFvwzu9QpjKZOYD5B7NQGAIlTQpkLiwHcZtHhs62/yjsD4YigqdFaIuHe7JU6KLSftdAEBbSCTzFD9vRriCanBlKFNjptyf/5CC0A1bu6I2BCp0xYDhtPQExKhY0tCFKe/yDWDGiRUboYa16kPBf2tbJuvw1clqp2RJPFxkubGW2kbPuvjHmwJUg8REgBG4VBAf97R2L3aKq/e0fh4IXpgrFX3TVeqCb2iS+mFQBblqu/tzi7OFqM78BVnfFmj1zZH4xUPabQprV90dMtYy3cL6x7g+zN1Xr6KMBrndSIixjyYUqu54EHkQGjB3/aOtLLEUkecdw2o9wN74qBmvYLUR3XRYnfUqEXMo8QBWpANxhXa716ZZ2vrswbG+UdB+3Xy1oY8SkqUiFa3utax1kkz494fXA6yksg9oAlRKb8E8ji+X7VzCUHCSX9Gusm0nxMrTH40yvU7mmSNTl8zr640avCMDmACiwhn4j3O3avKlerFOIZTbe5f3sFpcZmZGaebPwctlI54W2R9EV4CxmSq7ShLeFQeepgIFcsAe914wjqwpr4IQD+fz/Fcgcu3Fv7PuiflCK5fZlMMMVBGDvaqkJmJ7tAha8g4Y013pxmy3Rn/F5lgnE95jmoq/qOKjVsDMaivfqJ8EimsJlJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(966005)(54906003)(38350700002)(508600001)(26005)(38100700002)(16576012)(5660300002)(186003)(316002)(31686004)(86362001)(4326008)(66946007)(8676002)(31696002)(8936002)(83380400001)(6486002)(52116002)(2616005)(66476007)(66556008)(4744005)(2906002)(956004)(81973001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWpKWE9RejlhS2FrVTdZTDY5Rm40bTg1MHgrT2E3MXUvVW1tcllKeHJkcTdl?=
 =?utf-8?B?ZWZlczhCZW1EcTY2UytveFg5NnloVndVZU5qZUdQck1Ed05QcGcwRXZlQWph?=
 =?utf-8?B?Vm9xT3VzK05lcjlDTjZPWVJJbmhVZjdOMVROc3d5eDdDbUdzc3I3eEVFRFVx?=
 =?utf-8?B?UDVQYjlPa1MxNW9WeGd2TkpvVnc3SHJISGNMRFQrc3d2Q0VZN1JFMmVwL0Zk?=
 =?utf-8?B?TFJQWmVzV2VNVVIycmNBVmdiWnF3SG50TmpRL0RWSG1LcU1aOTdSK3hsMlNO?=
 =?utf-8?B?RGp0bkNFazNRV3Y3cTlldUNUU3FMdlRLOExOT3YrdnZqOUcwd2JTdWdYY3pq?=
 =?utf-8?B?WldkNGtrbStoNDRjQkNCcFZSdllRWGw3WUtwOElhbWZ2aHFZK05QaDZuOHVP?=
 =?utf-8?B?bmZLQUovWmlGVmV4RXZSUG9nK0tSZzNscDFCRkNCY0FNNlZLL045WnZWQ2Mw?=
 =?utf-8?B?ZHhNSENVOUxDdm0xWWwyS2FVa1F6TE1ZUzhRK3RiZkttT1Z5cTEvYi9qNHNh?=
 =?utf-8?B?ekw4U25TeUVIL1pFMkdMY29ybnpWWDNzYmM2SGZqeFBSZXVrT1Q4NVBUTVJF?=
 =?utf-8?B?c0dwSEhXWUdML3FVRmQzbitGZFlJZGRJYXFNYmZjM0NXK21CN2JDbjFQb1Qy?=
 =?utf-8?B?eS9ZckNZOERQK2N1NlpiODFvWmtUbUsvd09sK3pVNHRNTDgrWDRuVDZLZ0I5?=
 =?utf-8?B?d2ZuRlEzVkNnMEpua00rMXRRM2dzMkJMOFpqYmVoUjlHamc1U3RCRVZWYzZY?=
 =?utf-8?B?KzhDMUJ4TDZ6R2VTT1UxOEt6L2tCQjRRVVgwU1ZLQ1JFMHZvcG9FbTRqcE1P?=
 =?utf-8?B?R3haajAyL1VzSW15OFBHck5YUXVXaWVSMHgyZFZvMWZXeDdaTHNpQVhxcmJM?=
 =?utf-8?B?ZERSRmxDTkJmdnhoTkZsdXZBbGIvVzBYUlNTMExmYzcrcXlSdHFYMVhrREtu?=
 =?utf-8?B?TVdSK0lJVlFPRmFsZzExN2dWV0x6ZHhIUEIwRTAwVER4V1J5a2NxVSsrWlha?=
 =?utf-8?B?ejJubFdDWGdRY3psWnZ3QnBpdDQwNHpBbmZMODF3MytlcEMzTDcxUExhZW5S?=
 =?utf-8?B?SjhtS2tISkpIRlJHVURkeWMyM08yR0hGMXU4TGxBOXdjdGlqYlFYM3pWemxR?=
 =?utf-8?B?eE9SK0UwY1VWM0MvbDI1cnVPQUd3M2pGVU4vRm5aVlZWaDlOaHRTRGIwWWpX?=
 =?utf-8?B?RTBWZytjQ3V0TjNBZnQvc2Flc1dlSnBlUVV3SWRsa3B4MWlXUy9wZE1lZ3I1?=
 =?utf-8?B?ZjlkNXpNNjE4VjI0T1BmdnZBRmY1aTN3NUtuWWdwaSswSG1JM09VMjVkMTAy?=
 =?utf-8?B?M2pqS1lzd0xySEpkbFord3NYdDBCdDdOTXBHZkVCTnk3K2NYNmR1Rlg3YzJT?=
 =?utf-8?B?RjN5NFErS2VCamg2cy8wT1VXVkV5N3AxU1lNaFlrTHRXTzVrRFZNV2NmY2lk?=
 =?utf-8?B?a3JDQXY3R2dTR0JEb2lMWU8yTWlrOG1TdG93Si9KVXZpWnQxQmNkaXN2NnJN?=
 =?utf-8?B?N0ZocjdoNWU2SE1JYm5NTlNTOUJ1UTdFbnNaRStYZ1NnaDFGQmt4c1VYSno3?=
 =?utf-8?B?cmFWM0ZEUTVteWt6K2JBTGdseXg3cXQ4T2c3U0tsdkd4aGRsM0t6NitnUmti?=
 =?utf-8?B?TEdzZ1NPUGx0SjFaVFdsd3RSbVpDN1dzWWdKaHRwM3kvQUVSNHVvU1gzZWNY?=
 =?utf-8?B?TGNseFlraWFwT2I2aHVPbW1XeUcyZ2NxUURxeEJXdGdZcHBidWQzdEJDMUNt?=
 =?utf-8?Q?m7pNV4lH4P29OH04/VyXIapXQpTGvQLEpKBS3sC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097268b5-34b3-4ebb-df5f-08d9881e91a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:38:32.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJEmnYztJvtIwURaAsKLmdxGhFRXo44MY3nIZDquWEmBu/oLzHFAkrcwNV8IloJ8gqguo90of3u/kpeeHKVtwB8WUOMYSNlJyRSFSmYStjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.7.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10/5/21 19:11, Stefano Garzarella wrote:
> This series contains a patch that avoids an integer overflow of
> `max-workers` (struct BackupPerf) by adding a check and a patch
> that asserts this condition where the problem occurs.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2009310
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Stefano Garzarella (2):
>    block/backup: avoid integer overflow of `max-workers`
>    block/aio_task: assert `max_busy_tasks` is greater than 0
> 
>   block/aio_task.c | 2 ++
>   block/backup.c   | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 

Thanks for fixing, I'm applying it to my jobs branch.

-- 
Best regards,
Vladimir

