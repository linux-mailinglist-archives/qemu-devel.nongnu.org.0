Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE2D371528
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:19:32 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXXv-0003sj-MN
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXTW-0001m9-R4; Mon, 03 May 2021 08:15:02 -0400
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:46999 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXTS-0007Sr-Db; Mon, 03 May 2021 08:14:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE1AilFmXS9y2Y3TAWBkw83kc8Vix7uIFxiNMFoKXkVHr0rMVS1fCpA28oxrEwXVBKsSfZUAmKBySRsc+Gx5QpNzuF7jKAZHbuQsUZiBcMwR4YjVnYtzd/5pFrhMeKxLVd/RIIIyX6j0h6tZQ1aefujR9w+aG4SaMASd6r9bPvcOKAHQac0+++xGZEqbC9MlZb0GSq6sFfw3dobr0AP02+g3tLAMNqmgaDLxR3hIOVbZ4LjAkjEwnWGxqJt3X3xQfLfBupvIv/dpgLgRkK2yfMQyebbNCgFuJCULdi93bxHiBFgwMfFn2nHb1vGJq7PJGGoKIwCs6vPad98fIW3w2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leVqaK7oodYBhrxh8To76C3YvkWKupQrSpVxLop7G6M=;
 b=J8RtxG7iRsesLjUCZxRyEJ2S6jFRDVX73mN/fj4hGTZO3mtLWk77E1ivPzNexfVPFz9rXghqgo8NKjqA5mL2mCITXHEAJ+wWpOI4+mNk6cWnLlriMbs7fYJ8L3v84J2Ya7UIm7rCqUB+tP2DzXuFDf0kOLZMYWVHxUa9E9A+TqpBnf10rZ5C/gytcZKS6ocbF7vbME6OQ4G+fhLwtIO+k8z+PGFvq2mzc4njXtQXKbykhP2rD+P3ZW0tfPwJ0pRIP1ehphmJcNq+sQhzblNRYMrdrdoh+BWYWznGm+G3EX/gBrJwCiQjfv5GBVMSpEqS0IpYaoeFYwjYDuOD2YbL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leVqaK7oodYBhrxh8To76C3YvkWKupQrSpVxLop7G6M=;
 b=ZM5bJvRGddi2ZXHT8OdrCgku1YiRINt7mge9xtfOLp4HzeXEON2pFHrYzGFUneQCU95CvsoT3mf/RoJEg7w/FSpIHvBSKOHGoB3Eb5Jzy5hP/k+duocRI7mS2K4DUABkqe2Jw1eF1q6AsHD0yAP0DgLbCH/YhBjoC7ROX1YlPes=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 12:14:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 12:14:49 +0000
Subject: Re: [PATCH 1/2] block: Fix Transaction leak in
 bdrv_root_attach_child()
To: Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-2-kwolf@redhat.com>
 <9e23f679-84ac-9d1a-09dc-4894cd9d6979@redhat.com>
 <cdef7d37-1d8c-85c3-de0e-0730949bda92@virtuozzo.com>
 <a7a4c787-8dd9-858f-c627-6b20809d30dd@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bf6bfa0f-b7a8-b685-5069-99740b34e4d8@virtuozzo.com>
Date: Mon, 3 May 2021 15:14:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <a7a4c787-8dd9-858f-c627-6b20809d30dd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR0P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR0P264CA0049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 12:14:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a22dbb72-9aff-49a6-147e-08d90e2d0c5b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-Microsoft-Antispam-PRVS: <AS8PR08MB60713DB9046BB10D06BDBC65C15B9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBY1TuwDtyrcbq2vq87/iFQteCD3EdZc7Q2t+sBNX5gATuF4hWesvWI19gtWNc90I5EAKtXjThEUVY0jhygTmeXh7q99D+jhbXPbjg7f9AUoUTRVp+dQ87YDPNbQFMqiXwYYZwtXW1WoE/L1HlmzwObzYS/e+CG+NVvKqvURo+Ubi/DUakNc/wWvS7S0gjfSGHVPNuG1VqkDUfOXUFfziCsFtv95dA1NHGwMpngfRkmDlM11dkLOI73TWcu2gORqTdRn2VqRnevpqw64eQl3QoVxWsEK5yBA6UTRpppMwiBpoFZcd+Bnx3rV0DmbXCTEF0A5hd+MDK9L2fHxFrYrZOGjdSqKFmlvyOFR44GoBmCF0lZRJfnvjY9k3yV9reR8AM74NjBVrWJGTBs81g+WkmffTa1OR/qt1Rd5o4oL+albfKj+e0t1mE6lBytzwasOnRK34+kzahDvNYH7/IqS6OolKzFqgH9vXEVlhgHYzYJRzPJJzT88AOfOcdda6t+1d04cJCG4pHrbI7AfaOByvfvx0djssR4MFxlhuk5FSHqezAZ6EkiA46xCS6/lzHnLLKJkm/JWtjCdqeNroiWBSz6Vpvo9cr2e3gm/y7uLKntwdzSLIjc+iZ0IOicNHcojK9+jA2+drNfdhDkt9CyY9jqeAK4NiyiuFvygs+m/FnLdlmU9FZiDKrteQdUQkehukkGhWXbYiQBb9QchCvz4Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(39830400003)(346002)(83380400001)(38100700002)(2906002)(4326008)(478600001)(38350700002)(31686004)(16576012)(6486002)(110136005)(8676002)(186003)(16526019)(66556008)(66946007)(66476007)(8936002)(956004)(2616005)(31696002)(5660300002)(86362001)(52116002)(316002)(53546011)(36756003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0dKa2VUMDJ4dkRMdHRLVHpvekhvanJ5dFUyYWJuMCtkQWlUa0poSGY2Y0FO?=
 =?utf-8?B?cnlTdElyY0xGVkhqR3ZrYUNMUHF4cGNDZVNrQUxFeVN4c1Y1eEpFblBQd1l3?=
 =?utf-8?B?SmlQSmg3aG5NVzRvWHVSK2ZzbU1GNldSNEpkNnpLVE5OSmVFYTU4QXJ0T2xU?=
 =?utf-8?B?T2x6akNsRXVjQWpnV1hNMWtRNFVzZmxpVVFDdk95NkZzdVpsR2dWREMxd2xz?=
 =?utf-8?B?cVd3WDBrT1NzSjk5U3hFZjZsTnJIS1c0c0g2cmlGZXh1S3hXQ3o1UXVlOUUw?=
 =?utf-8?B?SElnaGgwZk9SYjJnUGdkYnZpVUVkaUlJNHlSV0RVQlJ0WDlvdmljNFh3eGp3?=
 =?utf-8?B?R2FSeGhXWGFMeDF1Q2s1RlFBRlNnb2lneDdLeTdBdWRIZXhvTllhbnlBYXRX?=
 =?utf-8?B?cEdRalkzMGUreW1hSHNtcCtCL0s2YmRaOEhHNmgyWjBqdGJaZm1sMTBFNFZu?=
 =?utf-8?B?bTNNOHg2Nk91bEVLQWZ0TitabmNIMjBycWQ3Q0c5N25NS0N2V21lWjl3K1g5?=
 =?utf-8?B?VjVJOWhOdU43SFM1NUg4SEIrZkVqMVpFS2YxNEFxQk1TNGZlcmF3WE9FYmxj?=
 =?utf-8?B?WmRVUkhNYXNzMk9EQmxoRnVQTFZTS2FWUmU3aHY2eEtIejBRMkdxdkE4Wmpx?=
 =?utf-8?B?bzdFRGhNYXpxRkVkMG9ubitZOHBmL3JaeTNuSWxsZElTd2FnYWFuWHlmRXZq?=
 =?utf-8?B?UVdGVzVmWG1qQ09vS3FNU3FvVmE1ck9RUVlQQ0lUSnBqT3JaMmR6amtKN09h?=
 =?utf-8?B?WEF5UDZOM1d2Z1lhS1FWZE8yUEQ3VU5tMlFuUGNjSWZYNmNZdDE2NlVqZ2Rh?=
 =?utf-8?B?SUVNRm9SdnFyNzhxNGw4L21wdWpJN2YwYUlMYVdZbWR4dnZvYVZlSDIvVEhO?=
 =?utf-8?B?Q2hHM0EyYW5CUlpCYzFaWWc3SVA3ekVoTFlGdEhwejNpQzBhanRGK0R1cnJw?=
 =?utf-8?B?dU8wS0tHZXR1TFpVcklIdjg3L3g2TFk1Zm5EenF4RDFJeXYwRlVKTmx1SU90?=
 =?utf-8?B?bkp0S0kxYTNOUW9UMG9nNUZYNHQ2U1dTS1R3ckd0cmVmODQvUkIxcmpuYTBl?=
 =?utf-8?B?dWJMZGJkSGZqYVMxbzh6T3NuNzV5WUxpVmkrNUF3L2hSbytjTm81Z3orbm5x?=
 =?utf-8?B?VVdwV2ZUaEtTQk5xT3Vnb2pSQjFhQ09QQ1RrRGZVZ1EvUU4veU4wTWdlSytG?=
 =?utf-8?B?T090aEtMeVNDcjI1YTRFTVhuVG9KU2JIOGxuUHBiZTZ1VzJZY3dVRU8wYXFj?=
 =?utf-8?B?eU1KRHh4T3JSZ2VPUzFIa0F2L3RGNjlRZlJOa2VMLzRKc29Sa0VualRRK3NF?=
 =?utf-8?B?UU5yOW8vMjRkZG1yNG12OFYwbkhCdUJiL2E3NTBSeDdYcE4rdkd0RHJUVTFy?=
 =?utf-8?B?WFlZNkRIY2xnUWViQXVBNDV4cGI5VXpnM0VPL0NnNXgydzd3Mm81S2tXSUxC?=
 =?utf-8?B?UEJLbndPV2EyV0dqNHgwbDg5b2RwVGNFSllwYnVnamlaNVJyLzFMV0xMZ0Nw?=
 =?utf-8?B?c211ck1SVlhvcU9uOUZwYnRVTlFMdkthMkd4UzZmL1VYYWlQL0tJRkd0L2JD?=
 =?utf-8?B?VTJQVE50aXl4VEE0Nk0xNGR4c1VKbExvQjUvTmRwLzlzK044cGIwbFdGTUln?=
 =?utf-8?B?RkZnYzgydVc4NmZtWWxBR3VMc3FhZDBBR0ZHVUprOHdYTDlEZVludWgvNkNl?=
 =?utf-8?B?NW9uVDZrZStXRGVMYVJ2MGpYbEQvaEh3cys3dkl3L1RPRXZxd3lHOVFqL3R4?=
 =?utf-8?Q?p8YuBIMvsYYhvUuhF1JaO3ODV/24SsguqyZCWn2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22dbb72-9aff-49a6-147e-08d90e2d0c5b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 12:14:49.4055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJWFhA9rvUK0mbWWTM0hW+Q1gucgfiNdQSaihXUc+yTKJxhc2HZUEGA7BKwZ3wERCJyUFOFFxByvg1XU2ltCQCfDAOYKY4yfx1sieu3qzxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

03.05.2021 14:53, Max Reitz wrote:
> On 03.05.21 13:51, Vladimir Sementsov-Ogievskiy wrote:
>> 03.05.2021 14:49, Max Reitz wrote:
>>> On 03.05.21 13:05, Kevin Wolf wrote:
>>>> The error path needs to call tran_finalize(), too.
>>>>
>>>> Fixes: CID 1452773
>>>> Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
>>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>>> ---
>>>>   block.c | 7 ++++---
>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 874c22c43e..5c0ced6238 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -2918,13 +2918,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>>>                                      child_role, perm, shared_perm, opaque,
>>>>                                      &child, tran, errp);
>>>>       if (ret < 0) {
>>>> -        bdrv_unref(child_bs);
>>>> -        return NULL;
>>>> +        assert(child == NULL);
>>>> +        goto out;
>>>>       }
>>>>       ret = bdrv_refresh_perms(child_bs, errp);
>>>> -    tran_finalize(tran, ret);
>>>> +out:
>>>> +    tran_finalize(tran, ret);
>>>>       bdrv_unref(child_bs);
>>>>       return child;
>>>
>>> Looks OK, so:
>>>
>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>>
>>> However, the function’s description says that it will return NULL on error.  But if bdrv_refresh_perms() fails, it will still return a non-NULL child.  Is that right?
>>>
>>
>> No, it's reset to NULL on transaction abort, so code is correct. It's not obvious, and I've added a comment and assertion in my version of this fix "[PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child"
> 
> The fact that the transaction keeps the pointer to this local variable around is a bit horrifying, but well.
> 

Yes this looks overcomplicated here. But it's useful for bdrv_set_backing_noperm where we would have to add a separate entry to @tran to rollback bs->backing change. Probably, it's better to refactor this thing. Or at least document that out-pointer argument goes into transaction, and should be valid up to transaction finalization.



-- 
Best regards,
Vladimir

