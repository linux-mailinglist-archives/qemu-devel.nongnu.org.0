Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE543255D8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:52:48 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLkl-0001OT-29
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFLj7-0000nf-Ts; Thu, 25 Feb 2021 13:51:06 -0500
Received: from mail-eopbgr140129.outbound.protection.outlook.com
 ([40.107.14.129]:26506 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFLj4-0005TT-7G; Thu, 25 Feb 2021 13:51:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyJz7sBY/58beaiqyA/cllAvkffo9ZhNFDbfX4KT+T2WrH+/FszXEw1p2YWTJMJYf4rjTm4TPQo6h+Qr2TrDoxdHTiH9nqeVou/zQwWAQ8nYLYAIgXknISceZSOCSZNcsIjXRSO6t4lNSyHt3SkG0554mHTvrQgsY/NnUf+bwRlXwLw71H/Q/wmn3PkxJI9N2L1k2NkaeEsixv1HUVb3DEZgWqam3xhPfy3AUx6e+8CCCu+XDObyVK04mFHUIFktH74qT9dyef0C/wUD2wKCLUVZhQyz5uvg2JUdPSNfUQpYS+gCVP4YTmNydTw5UgeCcAPl+l5iE1cx+/MUge5GZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzl+ckXexOy6x6PqM+LrFw+XjME6tu9F/Y9hDoUpXHc=;
 b=TZe7gVyIvQyL7XOgF4xv7noOjl0mZeoCuPbSj22jnpRZG3TM+qhVfJgBXIUKBLohcu/EpLQlZ/6Yqq1AhaAX1Bfk9zo3GDI57hdTVUGUj9Ob4VwdpIAKSal1PMl1f2mswJX5JDmMkUh2nEvSumIgaXJ6VwpSIfSHlavYB5WYEWLUiP7lflUwMIiOIIjCuNy43LyDqWTv+iqKDX8A98zR/ztSlrDs2lE4dK3RZYFRQKlNzV7hmUcy0gNZlvDVnvp9Gdd88gTsiYRZHxta+RzHEL7hgkyYyFb9SPiwEr+BzMzp+WY7SX3nrHmpJplsVzHlWD5E+89R1Nr0jAEmFwmuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uzl+ckXexOy6x6PqM+LrFw+XjME6tu9F/Y9hDoUpXHc=;
 b=ANWNok4R2J35X7di5aSkZGTt3jiIzQXsuP5JmCW1AlLWe9ax+uCdPrXqmPZ3yWplyBcVFXDkF74ZbzwgVEcX+/yZaS+6KmsbUMsqEmgvdTP6eLMt4JfUkMWPjbV0zXWOOifFgn7+kIQ5Uvqf0ckVzc6qzlvuthe2T1Eyg939Lc8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 18:50:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 18:50:57 +0000
Subject: Re: [PATCH] nbd: server: Report holes for raw images
To: Eric Blake <eblake@redhat.com>, Nir Soffer <nirsof@gmail.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>
References: <20210219160752.1826830-1-nsoffer@redhat.com>
 <f136b2e8-3510-a150-27f9-e69ba14e39aa@redhat.com>
 <81464e3d-c0ee-ac12-c43b-d0f7180db482@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6a714e21-0da5-7eb1-1350-277a25e23be4@virtuozzo.com>
Date: Thu, 25 Feb 2021 21:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <81464e3d-c0ee-ac12-c43b-d0f7180db482@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR0102CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.253) by
 HE1PR0102CA0066.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 18:50:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2e3ed96-129b-4079-f501-08d8d9be4976
X-MS-TrafficTypeDiagnostic: AS8PR08MB6709:
X-Microsoft-Antispam-PRVS: <AS8PR08MB670971933928052B888C4572C19E9@AS8PR08MB6709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Viq+0Sl/ygM0b6dUIOChrZQiRXbb4UEfqBp0MfRDYkS+aBm1MvylA7/Uz3MDI14ahzd28TkyX/Wqw8zAlM1faQNDJpS3LaO9o5j0ugbp30en6BfmJ7JbfRnKX+ItmpXCkEFUvj/dFrtwd0aId08rimzk5Umni1w9BDUuZPjI8TBJe5ZUSXp0Bk+tQw7sghXLy+hd6yMqZEQiR7L87ABvMxz89A+hIPsaPn2PUGCNqCDAUgoESZyGLw0m4WnL5TwgaiVxcJ7OrOZPzP5NAkpbZXwpFW+4e+OH5OTm+U0QWoDXDqn2WIi1uvbH4WttTQNN5IztMfZlw3opKrb7JfhDjA7O8pVtHpM6PIIW/Nyk1eVulH4zTw+7Ve3HgNCMfwfQOuTaLG1o0V90/jN7uVc2XAuuhLL0kfbrJsYpoD0548+86xQbB1XfVh5mpwb69duUcx4Le32HcYm3gSI+E8o+hVzRyu2YQ8sHMJK+S3Gpm5yvnq0YM9sbSETvHQXSOwyu6hOXb5gVGyCTB4By4My818loysClk5icoh804E9lfGsHtCHxaGJe3AcfXGatQbIg5K3Qj6IeBBhy5m3cReHqhwb74ZX8Tit2maBVpN/pg4PcjfpeSohIjk/LoFEwDb5iBN9Hkx2B4iy65GsgQy6GyymXLIp5+M+jfva5SxWLcqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39830400003)(186003)(66556008)(66946007)(66476007)(2906002)(6486002)(4326008)(26005)(16526019)(31686004)(16576012)(5660300002)(54906003)(966005)(110136005)(53546011)(83380400001)(8936002)(31696002)(86362001)(478600001)(956004)(8676002)(52116002)(36756003)(316002)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RkNsQUU2cjZHOWpUdVNjVzZoeTZSNGpudWQxdWI2NWwyNmFlQlVXN1gvU2lD?=
 =?utf-8?B?RDVuNnFYV0IyL0E1R1JKMzZ4RFRxYS8rWnpUci9HdDNHREdCdjZsZ0tGeWxY?=
 =?utf-8?B?ZGhITUR4UkljMit6S04vaWN1U1N2K3NydVFxUndFOG43eDZRdlhBdUZnZ2RC?=
 =?utf-8?B?ZmJIYUVBb2h0Q0NDTkVkQjhDQ0dhbUlDOWNDdUc3MDkwdklIdHdRcXpBV3lN?=
 =?utf-8?B?NjVzb29md2NnRG1aQTd0Slhhekl2UEt1cVQ3QXA3dlVldUhIWlNFbEtjemp6?=
 =?utf-8?B?UzZBTlpHT0h6Y2Y5TmpidjFOdXZSdU0xcTFTeHVjODlpWWtOaGtzREl2aFZT?=
 =?utf-8?B?OFRWVjlncFd2UUxMYzVPSTZsdURiY3ErTWNySW9tWWVzRm5Ddm5ldVdlSnFD?=
 =?utf-8?B?c2xySkNOeGdhZmpSUEdIcGdDNks3dFpZTWFLaWs4eDVScDVnZHppNDNKRlNN?=
 =?utf-8?B?aCszZEVoTHAzWDRES3JxMkxPQ3hFSWVtRm04NFRxR1oxb1FiUlZ0d1RVRFRY?=
 =?utf-8?B?dllUakJ2bXdtZFlLUUJ1VWFKNDVvajVHanRkYmExSWRmbVRMSURla0c4cU15?=
 =?utf-8?B?RDZMQTB6VG4xeVlZTnVKblVJTzc2bjhiOW1RWGhrYmZ6ejhnV3Z2MUtNbHdw?=
 =?utf-8?B?T1hPYTVTZG8yR29FL0k3N2ZkZ2FBY0lDM2Y5NHI0dW41b01rZmo3UUFkRVdC?=
 =?utf-8?B?OHB0SXVGRnNwd1lBTGNQdDBlUlp5UDMwZmMvZ0gwSDE2alMvMmI4TGtHZUF0?=
 =?utf-8?B?TlNDM0JZbys4bjZ0N3hRelI4Z3pvNEtLWTRtbFFySjRrbEwwSWpuWis4MWVB?=
 =?utf-8?B?cS9Md0NJNEtQZzdRdXNqTEQzMXF4dW5ZTEV2Y0RZcFJwRTRLQThJbnk2ai9U?=
 =?utf-8?B?Mno0SkdBK1VzZTZMNGRqWkpRakVRUi82WDdySU1YVVp5Vkp0akpyMGROVmVT?=
 =?utf-8?B?UC9nR3A0OVArQWl0OHZsV3daaU1kZTV5SE5UYlVJc0FNZlM0eUV6WWQwRXFx?=
 =?utf-8?B?VHdTK2tpYTUyc20va3hmVUZXSm5GZDFrT0s1NHRldHJFam5zNDl3QXZsRmtw?=
 =?utf-8?B?Q3Q0NnpadXBocWNrY2pDdXRYbnFJQUdSSGloYTN0cmN6SkFuN3M1TzRmb3N5?=
 =?utf-8?B?VzV5TUZmdEdaY1FTY1U3Q0RRTkVQdzlkMmJQYm9iSzN5Mm5YdUxKOStQaWlO?=
 =?utf-8?B?RXlwKzd4bHB4UFdQZXJ1T0ZhWk80SXVFbzlrdkpkR1BpRDZibFJGY0laT3pj?=
 =?utf-8?B?KzMxWFo3RVBkcjhVd25sdkxiOEJPU0sxT3ZJbzE1UERCSHF0dG52clpwend3?=
 =?utf-8?B?dW5QeUxnUFI5Z294S2dPM1BHTXcveUQ2VjU2VkR1b29DY2QrY3N3VmVmSFVL?=
 =?utf-8?B?amY1YWp4d05jVXJyYWs0WnhnR3RBZVRjR3krVGR1R1VhcXRxNUFRbU12U0xF?=
 =?utf-8?B?NnlHNk0vekdCMUNieWk0bjVNU0xzSEEzUHcyVHZDTjUxeDMrYW1KOGJvWFcz?=
 =?utf-8?B?aVE2d2FNL1J2RGF5L3FXUnQ4NDYwb2oyK3d6NSszTkNZUjdlck4yQWdJejRt?=
 =?utf-8?B?UG1zcWxjZEZHdFc5ZjBwQndrZmw1L055Smt6Rm5sNG9pZWxYUkZ0UXYyYnU1?=
 =?utf-8?B?RzBZWkErZ3ZUWm9yL1h2bFcrakpzL0FrRzEvYTVhWVhEVG80by8rT3hjUno0?=
 =?utf-8?B?RjY0YVl5dUQ3NC9Mc0ZabzdPVmhDL0ZxbHYvQ3l6cmNJS2xoVkM5U1FmM0lV?=
 =?utf-8?Q?lw+rnYyIsjt+H6EEwgQMN67HvjpP5iwvpIexUy4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e3ed96-129b-4079-f501-08d8d9be4976
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 18:50:57.3785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaSZ7cwzOTTGTC3B/IlTiJDyTg8qioJXz00q4+r19Hz/6XyWMDfVc4/0fgzaUijPxYiSjjeEb0Byba28cVFmB8ug7IaUtqYokTlSeYCsUgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709
Received-SPF: pass client-ip=40.107.14.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_NONE=-0.0001,
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

19.02.2021 19:58, Eric Blake wrote:
> On 2/19/21 10:42 AM, Eric Blake wrote:
> 
>>> To me, data=false looks compatible with NBD_STATE_HOLE. From user point
>>> of view, getting same results from qemu-nbd and qemu-img is more
>>> important than being more correct about allocation status.
>>
>> More to the point, here is our inconsistency:
>>
>> In nbd/server.c, we turn !BDRV_BLOCK_ALLOCATED into NBD_STATE_HOLE
>>
>> In block/nbd.c, we turn !NBD_STATE_HOLE into BDRV_BLOCK_DATA
>>
>> The fact that we are not doing a round-trip conversion means that one of
>> the two places is wrong.  And your argument that the server side is
>> wrong makes sense to me.
> 
> In fact, when I went back and researched when this was introduced (see
> commit e7b1948d51 in 2018), we may have been aware of the inconsistency
> between client and server, but didn't make up our minds at the time:
> https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03465.html
> "? Hm, don't remember, what we decided about DATA/HOLE flags mapping.."
> 
>>
>> I'll wait a few days for any other reviewer commentary before taking
>> this through my NBD tree.
>>
> 


I can add the following.

First, link to my research of block_status in Qemu: https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg05136.html

And about HOLE and ZERO..

As I've noted in the research above, SCSI may return HOLE & !ZERO:

from SCSI:
Logical Block Provisioning Read Zeros (LBPRZ) bit
1     If the logical block provisioning read zeros (LBPRZ) bit is set to one, then, for an unmapped LBA specified by a read operation, the deviceserver shall send user data with all bits set to zero to the data-in buffer.
0     If the TPRZ bit is set to zero, then, for an unmapped LBA specified by a read operation, the device server may send user data with all bitsset to any value to the data-in buffer.

So we can have an unmapped area that can be read as any random data. Same thing can be said about null-co driver with read-zeroes=false

Also, qcow2 support ALLOCATED ZERO clusters which reads as zero but data is allocated - they are reasonable to report as ZERO & !HOLE

And of-course UNALLOCATED ZERO clusters in qcow2 and lseek-holes are reasonable to report as ZERO & HOLE,  because they reads as zero and "future writes to that area may cause fragmentation or encounter an NBD_ENOSPC"..

So, all combination are reasonable, we just need to fix Qemu NBD server to report correct statuses in all these cases.

It seems that ZERO/HOLE specification is a lot more reasonable than what we have with ZERO/DATA/ALLOCATED in Qemu, and may be true way is move internal block_status to use NBD terms.


And thanks for CCing me. Hmm, maybe, I'll suggest myself as co-maintainer for NBD?

-- 
Best regards,
Vladimir

