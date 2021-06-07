Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4F39E2D4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:20:03 +0200 (CEST)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHys-0004iu-Jy
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqHxR-0002vp-4b; Mon, 07 Jun 2021 12:18:33 -0400
Received: from mail-eopbgr150108.outbound.protection.outlook.com
 ([40.107.15.108]:23022 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqHxM-0007i5-5u; Mon, 07 Jun 2021 12:18:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTV5mK93vkxFqiTO5onzvd2WLU71un18arKxpxCOdVEtC9uUPId8nErPVj0yG3NYviRWp6IzU2D8apwtOhnHkKbHPZMdBejIO59OC5IpeD68g9dctryDA8oUUXvgigRi65cqjdXj1eum3r3azAuut5dwi1NaAoOMrz3qD2o8d7COYqvK7zhU1ZBSB1EANtX221198zdyrk9s2XWYbiFFlrZd2DrFYXN+P3T4XjQX/4wbpN1l/5AmaJ2lOtuYYVu/YvTha5JgW0t+o6UmNKz8LVTF2w8WPa+yMK3rMp6j0pBSo8Awl/taKmLoA5q1trOIYJx8tHuRB4SuA4nVLajdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qux1/rGNH220/JkcmBWJ3UnYD1wINdBt1mrdwIK2D7Y=;
 b=cDNV9ltEyc+A93gJzIGv4xb1oUjokXe3yY5HdLJnlY2+xmALU2s+tkDNIhdMCRJgGqPJwcQCXmIFfevoBaN/g8KMFtunCX6AAQra28DKMlLmtKrt34X5YbRBx3YQKHDtSkc60KaNyUZ0N+fJMpKkP3Fo+tmKEN8Gy8pzLSzSSagqU74HIa3Biu7VJVabELy0jgyHFsewwjI8iTl2VkfWG1NO/bfZOUNwMZ6ULm8xbm1kkfCzv/Y/JIVixL3nc//uQnNDMSQTHmC6qBXxG/xW/AGIYyNEjLUYTsK80ePsJ533NL2skiFzl2RqscPMJkKwFmCS9SJqz2eeUjmZPkChPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qux1/rGNH220/JkcmBWJ3UnYD1wINdBt1mrdwIK2D7Y=;
 b=d4QHjtXtXwRy7qLg8By0aWFUVubYpVAuQwabOIzg7m9JCr/paDfGtdxRq7Ouhlygap6wz4Td1o+l7QNN2YfFrXQWaN76HyBaNKjqQozOT8oHQDqnD46rMtAcRGg5niK8Hmub5W0lPDryl6XljTnq/0bfOU+kOLIOmbLbcJSDpv0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 16:18:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 16:18:25 +0000
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain> <YLd33jBVl5k3RAZK@redhat.com>
 <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
 <YL42y/CZIFJ6ICLB@redhat.com>
 <c8a57c4b-544c-a5a6-728e-390a924d34ba@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fecd8d65-b4c5-481e-ea8e-e9a8cb523a39@virtuozzo.com>
Date: Mon, 7 Jun 2021 19:18:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c8a57c4b-544c-a5a6-728e-390a924d34ba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.227]
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.227) by
 FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Mon, 7 Jun 2021 16:18:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecd8cfd2-6af6-457f-18ce-08d929cfe0a2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070AC4324EBBD2B40FC7AA2C1389@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XqXl30fbngGssHdd09CWSbyPtxdVLrQFEBXuaoTvoCxygXofou1pLq7neu9Jj+SqxFPowUBSL4os9MehGn/NgECRSXjZU3/hATAfjVlMG1uqHe4eyx7GsAGjTprPF3KzWHDNvsIGxc/JIPeeDio+zp9k0UKPfUBV00gC7b9RU6QyvsJoBkhLT3y0djF551ExBfFP5f2J6WfAS3yg+PlyoOpVSDBsxpB7t4wHvwfZBc5TYdYsXmAKOXuCEGF5Ze8Fv0tQiJTtIlJKWW57aO5gmkusTCkxBA04VQKmRSSn3XDQ8DeSnctxMb/ba+UvrVRgx8p7XFOWN8W8HdPqBCMx93I1mzU/C310GdMBN95zdIDaqxz7kWyvY3Sw6D4OdlAS1aNXz6D63X1tZK6maYnH3jkv2ZmlpsGdNLaFhmaFy2zY5ChNAr/NWIrBkEx2/CVYuBhFe6JVjtZLAVlaxUJpfZ/eycqputZmNLXiIt0lA08adXRX+DHx9SWlbT/grIUnDQJPUgYwPiE6LrKNDZ8qbedOT9phkFsIk8454vcNFI7Y+zPIzOEC7cyMB9iZs8L2vk42X9Je8/ZWY984BIGtD9FHdOKMrxSUHK4PG8LDrNAvYSDqxOkrlLmuHPH8Io3YAr3dwPqPNmUaZwze2IErH45zK0Xn+3f4oh0eZ9s4NLpResFKJtp2+VEamb5ADrt/kfx8Na1lA5gLtP5o1Wkvr28qQq8RhmdEY0w2tJbWGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39840400004)(86362001)(31686004)(2906002)(16576012)(316002)(110136005)(6486002)(38350700002)(38100700002)(53546011)(8936002)(8676002)(16526019)(4326008)(66476007)(66946007)(66556008)(36756003)(83380400001)(52116002)(6666004)(26005)(31696002)(2616005)(956004)(186003)(478600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFJmOW9iaUxBMjhZVzlqdGlSckhvLzlXcE02NUlwempIQjYrckFpTi9MZ2NF?=
 =?utf-8?B?TElud0RRRzRzWU16UFVDbkZWcS8zU1ZBdmxVcTlTY0lGb0ZKV3VrQ1NFVGJs?=
 =?utf-8?B?L1BCZjFCajNlcTNJYkIvZWkrQ1NLT2dkKzRqeUhvaTBoRDZsbjMwbENOSkc2?=
 =?utf-8?B?T3JPZmpsT3MwQThRVi9Zem5uSU14VXNsOVYwbzAvLzZXV2dlQ1BOeUJ6Vy9a?=
 =?utf-8?B?L1ZPUHBxOFk4UUpYcVpxVXg1cHFKWTU3bmFWbjVuZENxRlRKWlBsM25sZklU?=
 =?utf-8?B?aGttM3FhVGNiMVNyTDRjVGdZeVRCZFovQUFqTm9BUE5aQ1hHR3ZWRUlWRXFD?=
 =?utf-8?B?ZC9iNFE0NmhIemRMV0oweUh3TkRmQ2l4R0M3K2NxLzZRT1NsRnZtV3RLRFJh?=
 =?utf-8?B?RnhQcnUrQUg3M29HbzFVcWVSc2NUSDZUekFqVmNQZXpTNjlOUG5RMmsxWkJs?=
 =?utf-8?B?NlFVR2FoY2xPa2FwUm84Mm16d29WRHBXdWw1TFJCTHVyWWJNUXQwZnZSQVBS?=
 =?utf-8?B?MEVNczlpU0VCdXVyK0RScll3OW9abzhvNWVXUEZXb3diZlY4K1Y1U0I3d01r?=
 =?utf-8?B?U045Q29SSFU1N1pQZ1JmSmxGTFdpOEVraEMxdUh1dy9RZ21EcjJGajljdnpw?=
 =?utf-8?B?QmthMUQrS1p6OE9mRTF2elhxUmVJbGlUQmprZHRzS0VickFvU0hvdnFKRXNE?=
 =?utf-8?B?cCs0MjUydWpvTWdyZFZtdmo1Mm9idjNzd1RnZmlpb0FtU1YrYmlnL3NFUXRp?=
 =?utf-8?B?b1ZqZEdoODlhK0liN0hWcDhsWGtXQm5YenVCNEowTTgvUTFNL1V3TlNYWGxO?=
 =?utf-8?B?M2diK0FtcnRBbG5KdVRGdFk0ajdNei9HcXVBZXpJTVdrVHI5RHJ2a2FBTmZW?=
 =?utf-8?B?L1ZSUlNBS2UvM0NocFBWVUN3NlJEKzNUY0d2dS9HUklLR2tzMUsyUXovUnhj?=
 =?utf-8?B?aXRBTnpFSXh5ME4xWVR1d252eTNDTDIrUTRnd09nM3BGdzJmeU1PZEZWZ0xz?=
 =?utf-8?B?WDV1Mkd3ek9BTzlpYUNMRzB1OGVMbG5MV1VvZzd0RFh0YnFlVm1FVkZHQlp0?=
 =?utf-8?B?TVZKSXh1bHVqeGtObHVDVVRUM1pjWk1ObFo3WHVBb0FYRXNGcmo3Q1BaaUFH?=
 =?utf-8?B?dDR1L0ZZL0J0Uk5aR1dSRHE0VnA4eDVuL285OElkdC83RnA0dzBqVjkzTFpO?=
 =?utf-8?B?eEZRc1pIWHV6cVl2RkYzbXBoY2hRWml0djRyMm1KckRHcXhZS0pralIzYXpw?=
 =?utf-8?B?THhHMUpjL09Rd2Z0QU1mVS9WSFhza2xoUjF5VTR3SjUrUEVQblY4Ky83THEy?=
 =?utf-8?B?dklkbDZXV29OYnZOV1dkN3RraG1KK25FcCtRNGpxVTd4M2dCVnRyQi9GM3JL?=
 =?utf-8?B?RmIwNHJOS3VtVlBCeFhUNS9Pd2Q3djlwNzZMVFFkcDJ6Q2xqcjVrL1FHNTA0?=
 =?utf-8?B?bTdQYldCZ3JXRXROR0RtRVVxRnBBTU9POGJGRlJtU2xQV3RBOFVIK1BrM1lt?=
 =?utf-8?B?cExNaGpJYTFKWHpGWHBFZUF2eW14cUtvRDczVStHZFdnTFEwOGN4VThjbGkz?=
 =?utf-8?B?TjI0NjVxcnp3bldyQWVoK1lWaVRNTGxGTjVMR2krK2ZVaVlzWUxKUEk4cXFv?=
 =?utf-8?B?N2NIMTRkeml2MUM1ekZHOFJXVzVNWEVSd3JTN1FIWmlNVElMejdwZ1U4bGpD?=
 =?utf-8?B?K1NrMXZwamxKRFIvY2ZGOVErQkxjd0JsZEkxaVcxRkRRZ29XTlpHN3NTU2VN?=
 =?utf-8?Q?tzwE71/OvWR5+twqvAGcBIdF7p86znnv493GCfv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd8cfd2-6af6-457f-18ce-08d929cfe0a2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 16:18:25.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5HcM4+UG71Dq78B/Dda65J45hfELV+bIt60Qj4jq2MVcD5NAH+FTBFeEAFAS5eVzyKBcETlWStatjb6qbJ2c7U8m6u1wUGwtWd1jMOuQz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.15.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

07.06.2021 18:16, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 07/06/2021 17:10, Kevin Wolf wrote:
>> Am 03.06.2021 um 09:38 hat Paolo Bonzini geschrieben:
>>> On 02/06/21 14:21, Kevin Wolf wrote:
>>>> Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
>>>>> On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>>>> Hi all!
>>>>>>
>>>>>> This is my suggestion how to refactor block-copy to avoid extra atomic
>>>>>> operations in
>>>>>> "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
>>>>>>
>>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>>     block-copy: fix block_copy_task_entry() progress update
>>>>>>     block-copy: refactor copy_range handling
>>>>>>
>>>>>>    block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
>>>>>>    1 file changed, 53 insertions(+), 26 deletions(-)
>>>>>
>>>>> I posted suggestions for the doc comment on Patch 2, otherwise:
>>>>>
>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>
>>>> Thanks, fixed up the comment accordingly and applied to the block
>>>> branch.
>>>
>>> I'm a bit confused.  Vladimir said in his review of Emanuele's patches
>>> that he was okay with patch 7 and that he would rebase this
>>> refactoring on top of it.
>>>
>>> Vladimir's main complaint for the s->method state machine was the
>>> extra lines of code.  Here we have just as many new lines of code and
>>> new parameters that are passed by reference.  Kevin, can you please
>>> look at Emanuele's patches and possibly unqueue the second patch here?
>>> It seems to me that it should have been tagged as RFC.
>>
>> Sorry, I was not aware that Vladimir intended to rebase this one. This
>> has already landed in master, so if rebasing the other patch is a real
>> problem, we'd have to revert this one first.
>>
> It shouldn't be a problem, I have already rebased on top of it. I will re-spin a new series with this and other minor (and hopefully final) fixes soon.
> 

Thanks, and sorry for the mess!

Hmm, actually, I said

> OK, I'm OK with patch as is. Finally I can refactor it later on top if needed.. I'll try now do some refactoring, you'll probably want to base on it, or vise-versa, I'll rebase it later on top of these patches. 

So, I considered both variants. Then I sent patches, everybody in CC, everybody were silent.


Honestly, I'm a bit confused too. I find my complains valid (independently of me being "I'm OK and can refactor later") and you agreed with them in general. I'm an author and maintainer of the component. I do refactoring that makes it simple to follow my suggestion. So for me it's a bit like doing your work for you. And you ask to roll-back it.


Still, misunderstanding and the mess with two parallel conflicting series is my fault, sorry for this. At least I should have answered to your series when Stefan gave an r-b to my series.

-- 
Best regards,
Vladimir

