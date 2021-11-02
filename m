Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A020442EF5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:17:14 +0100 (CET)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtf6-0006E5-P5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhtWg-0002ty-M0; Tue, 02 Nov 2021 09:08:30 -0400
Received: from mail-db8eur05on2126.outbound.protection.outlook.com
 ([40.107.20.126]:60512 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhtWZ-0008Ji-Vv; Tue, 02 Nov 2021 09:08:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i19QGgNFVLI/ROMp9tYQPgqrttoRa+Ag52wRcTr4siq2zAVBt0iKz4Vq0C8FcrQhOMgZ5uNz4PWCN0w1Vk4RWEQLkYCZAH4GPq3pI731pL1Uj8XDE057QexPHVaEAhcgodPkIENvRwT63/cSTWZ8LR2P5OtRugy5oQhOqfWteeJqgKYdWJYZp4rGqWexlpnsxQBoXURv6/jT55Wj16s8j2GpdKCG9IRWxZxgIlZLcYyzMT+HelJE0g136K/lDWL7WJxokOuneH9bskD1grO4DnJGYJUpOf/iNQmo+LAk4vhM4GqT4PSPUguc9+FCHkA1ouGhBbqJ7YXLi1LEEqhK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P43yePMd7Zd71uSQT2BwNXjmDpGma4NcW9fK2+nMDM=;
 b=hepghHpZP0urzTLtTim53JrLmXXQQgdjU6w9LNUj018XMFsZaAO6vmgiLV6mprgy5ubFUhqVMN3reWIMhLn7JPhBn5GOoq/wNon369CAeszSyzhAxZ+tCPJRMqcjVa5jhoBGRVJ4zexaG1/J3Lkn6IZxmnX4DebRSRIdISbS0a9lUcya2hBfV4hDZ0rarnUTi/UeH0SWuZho7fygceImkXSR9L5JIKKNST6l90XpABVPlhSFAYdWqMP9aIDDZd9DOl8PAivAL4LUERXp6XM/JgoezgWnwNro0Dbjo1FxrupXSyBzHheTUCEBoH8417RGS3W74/wQpqbJEu1haGdvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P43yePMd7Zd71uSQT2BwNXjmDpGma4NcW9fK2+nMDM=;
 b=AHxlsoUWGNetAj3F72JX+anYs7oXuWBlY+m8UEt7Lc3MvdG83g7C0y3/DRlIcHPZhJ4ISKlNdWA0iSfpTN5tX63ib9KcP2/Ek08B7j7/1AV0GVLIwDnv9FU3Rq6Xxjie7JM4lsS5bcZ42G8+u9TIvOyF5e5DrlWQQe7IsQ18JoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3031.eurprd08.prod.outlook.com (2603:10a6:209:45::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 13:08:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 13:08:20 +0000
Message-ID: <dd430e7e-d45c-038f-d571-9be2a0823ee2@virtuozzo.com>
Date: Tue, 2 Nov 2021 16:08:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 00/15] job: replace AioContext lock with job_mutex
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS8PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:20b:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 2 Nov 2021 13:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d506c695-e70d-49ee-32d1-08d99e01d7d9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB30311376366C9A54E3BBE137C18B9@AM6PR08MB3031.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzzUBJdHSN+Hi9MszwwTM/NFp0W7YRu8RPlR5N9Mg+p1Jstf6fR16m3k/N3kloLVTtCPTWMJuYv1urNpQ7PcrMJoT1859aXNnPFBSd5qQ6u8wOYr9gYhIIVSJnbNsYTW5Hr2z/f1fgwjbgHevM4HhTAeaLaD35BGgLc86byruLPAtPV5M4btmmDgZedAY5pjcMYSHG1ZaoEkGQKpfjHI1g9g5l31gU0eypB5dqSgMwIYs8ZHYWlfIxNOEvnGPjbyKYYwBsDRicSdU7NgpVZ38KjcyiUCtAeLEJPVVP9NCy2pq9jnG+y9VphR+zOLnMekf6JkRkDpdCGMCmt/v5w0O8GEkAp183mYWEhv4Q+qwqvx+zk5Exzb7idy0mlpXJCRwfxgJvmcqKYs+tu7NvztJTJCNEolxtEtJIi+bIzs+A6kzmcJwG5BfFj3TY2m17Dhdv46MsYBvpTvGCJjmHSrWE0tMcw/pHnevL2MwszWrz9Pc+bprqsHHfMel9pC109AFnK+swXtreJTBh8kAMFxIIiXc3G/Ix+Fjs88JvMSl/78osUinAuuI04fiR8mRUqOdL8YQ9xPBTB0a52ddgmu0Rr3BhsgKGs/TcaD1DmOJyWjgr8x65QrqWItW4pO445zVtAOsWYvWGDEBxXZxgOLdp4XR01CDlVeItruQJ4Bu089R+9Mqbcp7FWk+dM4ocUfM77gFl/rUr0erA8mNABDrkNHffng7yQxTOnyogQgMT8N/pQXSAcw+a+r1wYX/eombH9tJSCH7F56z9hMRyHqPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(316002)(54906003)(16576012)(2616005)(956004)(8676002)(83380400001)(7416002)(8936002)(6486002)(508600001)(186003)(52116002)(38350700002)(5660300002)(66946007)(66556008)(2906002)(66476007)(26005)(36756003)(4326008)(86362001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjZxZUtDeUFLRXVqVm45M2lkN296ZGsySVBKZWFYaXJHZ1JGbXR3MGFBVkF1?=
 =?utf-8?B?ZFBUL3hya3hQeXBYdmpmMDh3S3F3dC82QXBBYVVXOEZ5Y1VldEk4eXJ0aE1a?=
 =?utf-8?B?cVRuSFF3L1FxYUlOM0djWWRNdHA2VFZBZWZFdG1LZU9IakFqbHh6b0VNY251?=
 =?utf-8?B?eCsyNFZhY0VRWmY5bi9aRmx1d2IySWRjcjd0MThCbTgrdlVlcVJSQXJzZjZs?=
 =?utf-8?B?VTNhQnV6NUU5Q3VwSjl5b09xcXBHSldGNXQ2QXdvK0ErdWFNejE0VUFtbzJ6?=
 =?utf-8?B?YThxYjVlRkdCS0ZJcm1nM2ZZMGdlZS9MS3liaUZweGtmQ0NvamlSemQ3TW9T?=
 =?utf-8?B?eDU4ZE1KU2lWWHNlaFl3MWZaZmlWb2lscU9jaDdkTlIyaGUyUnBTRk0yUExU?=
 =?utf-8?B?SkJiQnZockpIYy9QeE8zUHBZWGREbm5BWENTcVh4cjJualN3eERQTVdoVXVI?=
 =?utf-8?B?YUxOUk4wWUVEY1JFL0JQQy9IanJrZjVpZ2ZlNHA2T2s1MngxWTJzb2ZKK1Ja?=
 =?utf-8?B?L3FJd1IwYnVCK1liZ2dvNjc0M0ZtS2pvTEdzd2psd3hTL28vYSswWlBlQStR?=
 =?utf-8?B?OGduRW5LOFkwN3pCbXZIMk90MkNOcHdWQlJjMWNtb1JESGtwMm95QktGWVVk?=
 =?utf-8?B?cjBYN3dkVWRSdEhybXJEaXhBMG1ZU2lJTnJxckgzcXVxdndRNUkvNHNqTk9I?=
 =?utf-8?B?N0xCZ0EyYmdsYmlQdnloWS9FR2lFdnNIZ1h1TWFFUTFDZG1JbFNURHBJTml0?=
 =?utf-8?B?NE1lS3pvOXlObkxTNnFXbzBybWlhd3V2ZUtYSHYxL0xLT2c3aGhOaDEvbkdH?=
 =?utf-8?B?SE0zYmVHUU1JZzdpNUxZU1ZrU0F4RFNpdDZBMlQ1S3ZzOUdVY3BKbVZCNTVp?=
 =?utf-8?B?THdBdmdZdmw5bFBNZFZ6Sm01bk45WmhGYmt1cGhGU1ZSOWFNZ3RkalhRZmln?=
 =?utf-8?B?WEpSb2lQdjR2K1ZxSmF0eU1TbThTbC9ieHhycWFNU0F0VEVsQlF0OEZtUUoz?=
 =?utf-8?B?allXNTREZlpvU0hleW1naUx3SnpRVkJUd0kwMytac25xMHp6VWdDb2pNL2NH?=
 =?utf-8?B?K0E5dGlnVlNGeTg3UFNZTGpqbGw4NXhmWFZlZXhaU0xEbUVhWjRIVXNZRUlu?=
 =?utf-8?B?aW1GMm1DV3EvUWJXTmk2ak9QVk1YK2pwK2RGMGpsRHNiU3NYRWhXQ1F0cEdO?=
 =?utf-8?B?enBTVW9BVStEL3laMXBqeno1OTQvc04rU2tva3ZPWm1CaHRuekh4N3FOSHM4?=
 =?utf-8?B?OHJ0ZjFVeHpoeS8vRG1Oc0NjaURJblhXbHVPZ2prbUtRQldLZXlJQ3lRMjZR?=
 =?utf-8?B?eE52bDY0RFhGQkpjNzBTYmlnenpQa3QyYkVGeEZWY2JnL3ZFL3pHaXl6RVE1?=
 =?utf-8?B?eTJKa0tRSzNRZ3lZeXIyMHdPVE5nSEQ0emNadU1RTXpLRUVEQzZPL2hRa0Nv?=
 =?utf-8?B?aFJ4YVZVVE9TN3d1WkpPTkVzRDFVaGd0VExockdwS21UblZVR2NNeGZQZ2lx?=
 =?utf-8?B?VzhxdVlweGlTZmxId2Y3cWZXYXNHRkh0UTlrZVpKdnUva2wxZ1hkbzJvYTFu?=
 =?utf-8?B?VGRiSmxlL2dNdi8ycXhtVnE0d1c3N0MzNWttR2cvUXZ5Wk8yb25OWUJ4L1Fh?=
 =?utf-8?B?TDEvVzIxZXcydG9FMlJjUS9Bdk8zbUZuZ0hwWDRBRW9lem1JTldFN0htVDYy?=
 =?utf-8?B?TnVUdXRITFErditGU1pNYllEd3dSNURNTWN3bW5Ud25kRXpHNHRtNmVtdGhS?=
 =?utf-8?B?ZFl2YVNodXhZUTQxRTFmZjlrcHJheTlocU10QzRUMkdjVWR6NlFQSXZxRFl5?=
 =?utf-8?B?VDJFODNac041NGR6YzVtR2l3cm1RSCt6ckZMQldYdEloWm9VUUwrVGUwR1FQ?=
 =?utf-8?B?Q3pPdGV2NE5yZXVQUEM3S3NjeWRWODdaRUt4Y1c0NTdZbnM1U1l0RWxwdzdH?=
 =?utf-8?B?c3dnbjRlNmQ4NkhlWjVlbUFBMDNnVVd5R2cyek5MWklpelhkb0JjaGJRcEY0?=
 =?utf-8?B?WGFCUHdjUFFMUVJSMVJIYUw4ZHBtbUhJVlJmUzduK3JaT0g3ZHRhUWNSQTJD?=
 =?utf-8?B?VlhDcWg4SVY0YUNZYlljKzFtVjJ3ZFJRYnFMVDY3d1d0MGlYVTkrT3Z3NFN4?=
 =?utf-8?B?VGM5U25qUS9nQllwdGhZT1B5YUd4WGJTQUlBeFl6elhtN1FaM3JPVWV6ODV6?=
 =?utf-8?B?QitLcW9kaUFJVjRIVUx1MHBFNkRkVW9PZ01DTWxUKzFwRW1ZN3dFNnFOWnpW?=
 =?utf-8?Q?faNAMaewRWBCgxnE7Ptvzx9Ybo4+tgXx7DJihiZnBQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d506c695-e70d-49ee-32d1-08d99e01d7d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 13:08:20.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvBHmSu2RuTctkoKP6z6IOeL0AVJIgkvE7YWR9EolT+l/DqadAH5Q2YT06nurwkD46wLJrhknMwqzyp5yU2YZvBRT/myqo8RHODrK69KIfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3031
Received-SPF: pass client-ip=40.107.20.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

29.10.2021 19:38, Emanuele Giuseppe Esposito wrote:
> In this series, we want to remove the AioContext lock and instead
> use the already existent job_mutex to protect the job structures
> and list. This is part of the work to get rid of AioContext lock
> usage in favour of smaller granularity locks.
> 
> In patches 1-3-5-6-7, we split the job API in two headers:
> job-driver.h and job-monitor.h.
> As explained in job.c, job-monitor are the functions mainly used
> by the monitor, and require consistency between the search of
> a specific job (job_get) and the actual operation/action on it
> (e.g. job_user_cancel). Therefore job-monitor API assume that
> the job mutex lock is always held by the caller.
> 
> job-driver, on the other side, is the collection of functions
> that are used by the job drivers or core block layer. These
> functions are not aware of the job mutex, and delegate the
> locking to the callee instead.
> 
> We also have job-common.h contains the job struct definition
> and common functions that are not part of monitor or driver APIs.
> job.h is left for legacy and to avoid changing all files that
> include it.


Honestly, I don't really like the idea of splitting:

1. It's not a functional split: for some functions we have a locked version in one header and unlocked in the other. But actually they are the same function. I'd prefer such wrappers to live together. All the declarations in the headers are about one thing: Job.

I think, splitting make sense when we really split things, split objects into some separate entities. But here you just use different header to group functions by some criteria not related to their action. I don't like it.

I think, it's enough to specify in a comment above the function, does it need locking or not ("foo_locked" naming helps too), and different headers doesn't help to understand code but make it more difficult.


2. I don't like file names:

"job-driver" for me sounds like something about JobDriver struct. "job-monitor" - unclear. You define job-monitor as functions mainly used by the monitor. But actually they are used by other code paths as well.. Also, jobs don't directly relate to monitor, they are abstract, so no reason to establish such a relation in file names.



-- 
Best regards,
Vladimir

