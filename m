Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B33692A9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:06:35 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvVy-0001Ed-8d
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvSt-0007ip-T3; Fri, 23 Apr 2021 09:03:23 -0400
Received: from mail-eopbgr40119.outbound.protection.outlook.com
 ([40.107.4.119]:9957 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZvSp-0001Sx-TR; Fri, 23 Apr 2021 09:03:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsYudS64rHfIsuFXQ+bkvB+hTbAjmLeXnqnzkuCjwWKXSJ7M7ljbOTVZq/dVbYGf7mogmUwDcPxI2dmKkYom+Jr0bZ0Rxx2LAlP73gBeS2xs0ylHu10qbgfyXO3Qae80Ie/NJARPgDJOmw+2Z0/bivlyc7+thsaCU6vj37lk5muSF4EGbNgt3hRuUuU1H7UTtaOAsIqT6wO9jUnhRjwsQAW2LbAzYLPsIbx7+efgI9rABteoHT8wpbS/zuF5X0J/DMTWAGNOVbiZ92/azVAe47yGWvdwh0c5lxFjsV5D+6oXhifvZQYftE5ARODfu9vr6591rq4sM73nUSpTKxQ27w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uuFvENsPfvFlnneSTqH7zke51a5ECywx/+Luarzi1M=;
 b=VwJrN50DrFe+A/yBah7Rj7ojqDX+c8HTdzmlkWfG/g9++BWHgaO12CnQ/VZtdkdE9vLbfNSCtf4PddnzG+D4/Iz4Yoek5h97QGmOodNsUx9d/TU56fyJR5U5P0QY5xd039UlFTtZgIUdCbb5sm4FDZEfBaEQZz4VkglMZIwHCvMQzUsasFkPbEgKm94lYMQnGf9eb0BHQNiBuBX6Vao6lQemr9DKEh+m+CQVoVg/1o4FGomKw03KPZ7BrH4uNVNm/2FnzR+UefvAMlZ795SVWSeof6T6vouC73cH/I//bGYWV4l3447ak5hH4iuiLrMJBWHHOtU2F0tGQBky47vjng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uuFvENsPfvFlnneSTqH7zke51a5ECywx/+Luarzi1M=;
 b=SUQhre1q2PqzCnI/cp3rjIwZVKiDNwAcdvRr8qUDImhO8dgJ4hWyJa+cOKu18lHxI78Q2BEQlCL2VMsALutTodJr7ybE8v8RAOmc2ZZKMbYj5kJGDRux2JFgdzlg4KUZgQg/Tu0XtHnADgGEGp363vJOcMf7yCfympx5h5gKMxY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 13:03:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 13:03:16 +0000
Subject: Re: [PATCH v3 01/36] tests/test-bdrv-graph-mod: add
 test_parallel_exclusive_write
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-2-vsementsov@virtuozzo.com>
 <YIK8qAw+HwhQgiEI@merkur.fritz.box>
 <1631ec75-4301-1d84-b607-8c296b09d392@virtuozzo.com>
 <YILEylM2E7t9A7Jp@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <27660f5e-47c8-9f5c-b2a5-75d693e13ebe@virtuozzo.com>
Date: Fri, 23 Apr 2021 16:03:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YILEylM2E7t9A7Jp@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: AM0PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:208:be::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 AM0PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:208:be::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 13:03:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b423f6a4-56b5-4947-d9f5-08d906582916
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59115F551FB49ED24886C40CC1459@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c5wKMvypyv0gfsQ8fiz1sva0s96p2qrZaAt/ngODChI/P0KPCTDyOvsLBZEPkJePFa4QNGJ6qyvXYPheZNhKN70xcxW1kTaTLfvZke7HeJ50C5qpym75ML0ck9zyHCuemUJQZbmhiJMoGIzjOfCRLBxh5jYnZ8FTJfL3sqVMFhoGkPyahAjNuJFatxKY3pmpXyv2InAVIOxy2sJUycracHLDO0DyGjKxuUzHnZngW6gqtJ3oc389uCjuGfG8usIuCOnnvQVIRf+Tu0L73Xb/Y1JwFFc5lgGrmH/72GZXjiz9qPK3d78fFl8ohRosBKIwPo+PMs6AQM8VxPeyAG2FjATJMpEVFJ9+NaKvWYF0TFmdRvCUPbTuIwFOAR3bOJbFNhtDfRtsOD/17h/MLFoCFu6D9Y+gKJprIdfXiMu+g2ZC5pDtRUm4DTjdHi52PfRzRwhBl8pJLOa7ZVcnX8H5do8za7VcoxWpnzjFQoQkgQkp9bn6F+lFb8uUYsaG9HRQk/THRGn1LYl7SAVW26SRu3p6RfHfeg8KhEpiidacSNC5lkZMUWR9lSpls8OjcoN6QnYoGX5c7lN642aAixgYbRb1RPwxqWjUpxhH7uHF261RGYboqUvACMcyVgQNoMqvo9sSThZ6KbleKh+Dwi1b/Br42CIFqJof4gy6ZIKmZ4kh4+7AtPSZySwJSNFqwFAN/qMOio8hjWY9MyPvSvnQ/e6TS7pxnCkKAtffn17+Ww4OnkgI+UJrtT3KAa93kL+R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(376002)(366004)(346002)(36756003)(38350700002)(66556008)(66476007)(8676002)(31686004)(26005)(8936002)(38100700002)(52116002)(478600001)(66946007)(956004)(83380400001)(6486002)(2616005)(5660300002)(86362001)(2906002)(16576012)(316002)(4326008)(31696002)(186003)(16526019)(6916009)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHZtUnpSV2tDUmhjeDFXRlhtb216ZHVmNHJDYTVKdEt0UXNieWQ1NldoTDlr?=
 =?utf-8?B?SmYwbGZhWlVLUnNCeFovcmNnVmF1SDhvWm94Z3JFU011MDQ2OEtqZnBVM296?=
 =?utf-8?B?MFhUbVVuYVY3M3YxVGkzZkFYNUlMM3R6M2JpVVJwRUVMWEhwaWFVUTFvQlN1?=
 =?utf-8?B?Zm5uVUVFd1JTUjlEZ1J0UDAyTEJ4SC9yOHVodmtSVnhDTUROYjdkTW8vVFc5?=
 =?utf-8?B?Yjl1L1c1eUZaVTg0d3ZPU2pyTWVJd1NQSWY1L29oY3lzMjUyQ1IwcU10Mm4r?=
 =?utf-8?B?WmV0bEh2S0VJbWJQVlFiN3BHUnB3NUNKYXRBOVgrUzgvRHRDRTVadmkrQ21h?=
 =?utf-8?B?Nm5ZTXdUcDN6bHM3UHhhZkxvQmZNYUVaS0JKMVh4Y2ZPUDgzTmE5Sng1dHBx?=
 =?utf-8?B?Rzl3N0ovMWFpb0lUQlJSNERLS3hUYlc2Rk5ZdWFGaUh5T0NGT1U5YkE0aGRN?=
 =?utf-8?B?NGdEUklPQmF6ZCtXb05wUXJRKzk5WllkNWpaemNKVkN2MHVTbDlzWGxQYTNv?=
 =?utf-8?B?Z3FXaFEraUpwdWUvckU4UnhNOVRhVTdCYjExWEFRZnAyTVc3c29oT1lxZ2xh?=
 =?utf-8?B?QkZ2MDZDTGJmMzFCTHJ0ZDN2T0c4WVhvWUk2UnVSaCtXTXFXNnFXSkw0bkEr?=
 =?utf-8?B?MFJZNVRwU2VQQjdaYzVVNDlJWE1XMk00MHlZanVqVWQwdnI1RE1NdXB5cUxE?=
 =?utf-8?B?YVRaWGhFVDFjeDJHOTdoY1JVKzBBMFkxN251MHNXbTQ1ZHZpZys2aHZzdGIw?=
 =?utf-8?B?VkVuYnpsWmZxQ2hZSXhhbjNUUldZeGlTazgydG5mSWwxeG5Fc3NjVDdYcXBH?=
 =?utf-8?B?R1U2SUdnWVY4R29zbU5uUU40Q1dwSnJ3Rm82UGR4elNKUGoreTJEVjNLVTRy?=
 =?utf-8?B?bmR1NE1aYXlydVAvaEZiRjNFQ1Uvb2hxOGI5QWhnOVB2QitSSVFCa0EwbWdr?=
 =?utf-8?B?MWYveDYyaVRlMmRvZC84a2JoMTVaUWxyRExhNzVleE90aVIwVzlBWDdqc0dK?=
 =?utf-8?B?SFlWZThvb1prTmQ2eEd6eklZcXpBQktTZVkxeDM4WlB1aC9wdHIybi85SVQ4?=
 =?utf-8?B?dW9HRW1VNzY0dGgrckdzOWptcEM0a28valpWZG92a2w1QVZQWUU4VDhINVlK?=
 =?utf-8?B?S2RmT21YM1BsaXRjUHhUSFJyUE50VWd1aGZpMFQzSzYwV3NOMTZPVVduZHIv?=
 =?utf-8?B?ME1sSDBReE4xTTY5cUtvUFltUXRZSXRTeXVNY3ZSRGpWcHMzSGp1bFFSNFNx?=
 =?utf-8?B?aGprbXkybENmeTBLY3MzR1NjZTVBaGNrYW9aeXljVWRqVFRIRFNEemV0aDNm?=
 =?utf-8?B?UFlHT0xPS0J2VFIxMXNEYmlYYWRqWjZpUSt6b2RyWm03VlhlYzZSY256U3Vh?=
 =?utf-8?B?anpFbHFGQXkrYlVwM1lrUkZ1aUFJTVFYbC9aRG9rWktoeFVzYlp2VExockhK?=
 =?utf-8?B?UlVkNXVwbDJYcjdsVnVBZXlHSkZubmRzSDNrZGt1RSt1MUljbDJqWFJKZGZ5?=
 =?utf-8?B?cnA4aVR4bTFwaUNaaWNReEwrVGN5TlFQblNEQTNqbVBYM0d3c2JMbzJxaU1o?=
 =?utf-8?B?NkE0ckx2dXA0bVVHRGRRU0Q4c2V1OXZhY3VCN2JjUk1rK2xTYjNaU05TNWNl?=
 =?utf-8?B?UGgwK0lFRElFWmhFVjFJWE9YQTU5OHlMb2J4czduV2FuRERRa2tGZGJCVEFO?=
 =?utf-8?B?MGw5ZXNuSTFvdjluMWljU1NZRXFGdTZkY3lVVHpoVms3R2RaNVZRUW1sZVc5?=
 =?utf-8?Q?GiQWwEAWyyYdlofuhcL4eY/eXocgRhYaRmWmM+X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b423f6a4-56b5-4947-d9f5-08d906582916
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:03:16.6779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxYZtCc3cawzVKiSvIjsDxzyK6ylEYvd0VJzy2wdA3RYmm3uQr1bC35GIQGkSIDNqt3zDoUSwfGtiMGOCcc5Al/sJ+JKLYN2rrPfjGZ9lqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

23.04.2021 15:59, Kevin Wolf wrote:
> Am 23.04.2021 um 14:46 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 23.04.2021 15:25, Kevin Wolf wrote:
>>> Am 17.03.2021 um 15:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Add the test that shows that concept of ignore_children is incomplete.
>>>> Actually, when we want to update something, ignoring permission of some
>>>> existing BdrvChild, we should ignore also the propagated effect of this
>>>> child to the other children. But that's not done. Better approach
>>>> (update permissions on already updated graph) will be implemented
>>>> later.
>>>>
>>>> Now the test fails, so it's added with -d argument to not break make
>>>> check.
>>>>
>>>> Test fails with
>>>>
>>>>    "Conflicts with use by fl1 as 'backing', which does not allow 'write' on base"
>>>>
>>>> because when updating permissions we can ignore original top->fl1
>>>> BdrvChild. But we don't ignore exclusive write permission in fl1->base
>>>> BdrvChild, which is propagated. Correct thing to do is make graph
>>>> change first and then do permission update from the top node.
>>>>
>>>> To run test do
>>>>
>>>>     ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-exclusive-write
>>>>
>>>> from <build-directory>/tests.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    tests/unit/test-bdrv-graph-mod.c | 70 +++++++++++++++++++++++++++++++-
>>>>    1 file changed, 69 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
>>>> index c4f7d16039..4e4e83674a 100644
>>>> --- a/tests/unit/test-bdrv-graph-mod.c
>>>> +++ b/tests/unit/test-bdrv-graph-mod.c
>>>> @@ -1,7 +1,7 @@
>>>>    /*
>>>>     * Block node graph modifications tests
>>>>     *
>>>> - * Copyright (c) 2019 Virtuozzo International GmbH. All rights reserved.
>>>> + * Copyright (c) 2019-2021 Virtuozzo International GmbH. All rights reserved.
>>>>     *
>>>>     * This program is free software; you can redistribute it and/or modify
>>>>     * it under the terms of the GNU General Public License as published by
>>>> @@ -44,6 +44,21 @@ static BlockDriver bdrv_no_perm = {
>>>>        .bdrv_child_perm = no_perm_default_perms,
>>>>    };
>>>> +static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
>>>> +                                  BdrvChildRole role,
>>>> +                                  BlockReopenQueue *reopen_queue,
>>>> +                                  uint64_t perm, uint64_t shared,
>>>> +                                  uint64_t *nperm, uint64_t *nshared)
>>>> +{
>>>> +    *nperm = BLK_PERM_WRITE;
>>>> +    *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
>>>> +}
>>>> +
>>>> +static BlockDriver bdrv_exclusive_writer = {
>>>> +    .format_name = "exclusive-writer",
>>>> +    .bdrv_child_perm = exclusive_write_perms,
>>>> +};
>>>> +
>>>>    static BlockDriverState *no_perm_node(const char *name)
>>>>    {
>>>>        return bdrv_new_open_driver(&bdrv_no_perm, name, BDRV_O_RDWR, &error_abort);
>>>> @@ -55,6 +70,12 @@ static BlockDriverState *pass_through_node(const char *name)
>>>>                                    BDRV_O_RDWR, &error_abort);
>>>>    }
>>>> +static BlockDriverState *exclusive_writer_node(const char *name)
>>>> +{
>>>> +    return bdrv_new_open_driver(&bdrv_exclusive_writer, name,
>>>> +                                BDRV_O_RDWR, &error_abort);
>>>> +}
>>>> +
>>>>    /*
>>>>     * test_update_perm_tree
>>>>     *
>>>> @@ -185,8 +206,50 @@ static void test_should_update_child(void)
>>>>        blk_unref(root);
>>>>    }
>>>> +/*
>>>> + * test_parallel_exclusive_write
>>>> + *
>>>> + * Check that when we replace node, old permissions of the node being removed
>>>> + * doesn't break the replacement.
>>>> + */
>>>> +static void test_parallel_exclusive_write(void)
>>>> +{
>>>> +    BlockDriverState *top = exclusive_writer_node("top");
>>>> +    BlockDriverState *base = no_perm_node("base");
>>>> +    BlockDriverState *fl1 = pass_through_node("fl1");
>>>> +    BlockDriverState *fl2 = pass_through_node("fl2");
>>>> +
>>>> +    /*
>>>> +     * bdrv_attach_child() eats child bs reference, so we need two @base
>>>> +     * references for two filters:
>>>> +     */
>>>> +    bdrv_ref(base);
>>>> +
>>>> +    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
>>>> +                      &error_abort);
>>>> +    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>>>> +                      &error_abort);
>>>> +    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>>>> +                      &error_abort);
>>>> +
>>>> +    bdrv_replace_node(fl1, fl2, &error_abort);
>>>> +
>>>> +    bdrv_unref(fl2); /* second reference was created by bdrv_replace_node() */
>>>
>>> This line is new and I don't understand it.
>>>
>>> Why does bdrv_replace_node() create new references? Shouldn't it just
>>> move all parents of fl2 to fl1, and when the refcount of fl2 drops to
>>> zero, it would be deleted?
>>
>> fl2 is second argument of bdrv_replace_node, it's @to. So all parents
>> of fl1 moved to fl2. So, fl2 referenced by top. But our first
>> reference that comes from pass_through_node() is still here as well.
> 
> Oh, right. I assumed that fl2 was attached to top, but it isn't. So we
> indeed still own that reference.
> 
> I feel the comment is misleading, it made me think that we unref a
> reference that was created by bdrv_replace_node(). What you probably
> meant is that bdrv_replace_node() only took an additional reference (by
> attaching it to top), but did not take ownership of the reference that
> the test function owns.
> 
> Maybe it would be better without the comment.

Agree

-- 
Best regards,
Vladimir

