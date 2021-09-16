Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AABA40D779
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:33:33 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQohw-0006aU-Ca
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQoNW-0001lC-Fx; Thu, 16 Sep 2021 06:12:26 -0400
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:37015 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQoNT-0007fv-KX; Thu, 16 Sep 2021 06:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmCgmrrWd8dlzTstpynB4TuoEGtxLWEg90ZxI482yntCpqnS8TxvN+Sw76Q8Z24Xk/re0qfaiJp1qhMCfJK61YmnWMCO0Ra8SLwnFmnSeX8+FBn3BCLx8zzZfIjQh2E3jOGDOMvH49Dj9qgMWYeuRYxlZgJMhA2YCiAVhUzOHQHd1OQ1lir1YucIGkRYfNgcXSABEhivfeocN6RIaSKFUU2GYdyInjdmXUH8diSYjk++zVvsTWZmojsNGZ8r3/j/iQ7aZvq9Sq0uZJFlaMtjLVdFC+xiUAY2Hg6hPie/NFAM+l0wmayAO0mlIsoSaD+/CLC5wgW63g0rE4DUxdXbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+5Zvav6Oag/3JrdRQPcJxsu8DOJkdkfph7QNJI6PSus=;
 b=CYreqXKW0muJd8yexi1hmY4BC+DchWEVGGO/vTr8OkxyYi4iYq9hpqiUp0LIEfviIS/U3C1h9P02YgpDx9JqhsRwiiT2AtOQw47JgQRnyI1d4l3NhFkcpnsykASZgyFy/SD0XMizNdZUSAZisaSgIvWcWv+XrB26YqBC32ARhDgKVlXwH60fHN0KFpfNSeqy0WxLYQxnxzoZ/AF/JFu8un1qWh+NLJ5ke+nkre0ydJz+V/j7U5DnDvINmFPidmc5O5zwlfrfHOw5gmHkf1w6dH5u9K8sVyGHSBJqZJNEXLwazeN7Mw8Q+0upWIrZDvCQK8U0Ma6mrbz2D9ljyEc2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Zvav6Oag/3JrdRQPcJxsu8DOJkdkfph7QNJI6PSus=;
 b=afRSJ6t1DZMaIE+i4do4KqBDm0euH7wx35ccYRJnr+6wxa+A3BChoYOYvbG8XrGt2YNnOdsneVtkDtaMz4Y/4DlES5KLdeucX0mpND7fbZFety+XotTlY4rmss6AbvLlD/cvKaGCbk9Mz30KfPdVLeHq9XUKz5jZRyPXQu9Z2aU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 16 Sep
 2021 10:12:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 10:12:17 +0000
Subject: Re: [PATCH 2/8] block: add BlockParentClass class
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, ehabkost@redhat.com,
 berrange@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-3-vsementsov@virtuozzo.com>
 <87h7ekapfw.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d9ba6476-ab0a-6314-81c1-054519bc1469@virtuozzo.com>
Date: Thu, 16 Sep 2021 13:12:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87h7ekapfw.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Thu, 16 Sep 2021 10:12:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0116d562-998a-45df-d043-08d978fa765c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912DD2DC5C79CB07BF118F8C1DC9@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4yqu2tzzxjWhRaZihxa+yfHEmYZATkb62FZ/Upm7mM2lBPvjC5OiCRUH0nmTgqH7dR5SKKq6oLvF41+B+uBCUv3jK613OZh+ZbYNJZJI812iG9OgmWeW/hH7f2zoYdAOXzcm6rA7d4J50Tf+e51BreEIMNEv7WiLqi628+l4PTs9HhtmVoNfxWx/6MzrA7Ku8MxaCS3sSd/h5UdzRWFfhYvpqjrNRoK864AArdH8QZtb10EnU+WXTXI6ufeE/T3044OUT4ZGjNPlhMgggKWtNmQ3PzIyS1zSzeik3t7jrqKZOFEdcjAUaxTTE+LpV7adxBFFSC1bfPm4VLZ8R/+/B02kaqlEGYsOJ0gi5geLIOqRyLYaGFOoNHddZhvDB3jbBychWkF+CExfF5rf6swPOgxrDuwRj9uKRtxsnO51Q+fbmKdX7MNiPPxSss5W+ACEo8YCYjSNB+jMToVT0wIAQN8a+hABK/76rF37c5Ke+loMN/0LSXtzANvGKBPfrpSrUOQWhVdmlAhE3UAcIy9LN0vbUIRpaGgRXa+7FH7igTXwk/XYUtky0sGrCXFTp2/c4ir4CltMHV9WCfxScp6H/Cqd63ZeiaML2gvBnV1wYU1pWbgIRcnic7hxHkSnm2rY+fy6HFgTs6ZGne+NseiOMn9tqd0Y2oxDBMtW6yKadgZxWdmzWVcZER7DCQaMeB8OhfKvIpiZ8voGWYFQ4wLf5TAmuj5ITp6IbwN0TKk4x+v/6GUjlMSM7CGTC2TfZkkjCU4SA2Cqx3wbY27ov1GoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6916009)(38350700002)(38100700002)(8676002)(83380400001)(956004)(66946007)(2906002)(508600001)(186003)(5660300002)(36756003)(16576012)(86362001)(316002)(26005)(31696002)(6486002)(4326008)(52116002)(66476007)(66556008)(31686004)(8936002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9iUXhpMEl3a3J2VGhMWlBzcXZWVmVSMGN5MjVZZGlFaEZMT0VOWW9wcGRz?=
 =?utf-8?B?V0dYZ1dFSEtSc2VoRjVpbUtQRmM1UWY1UnpRcEtmVXFJRG5TRVBXdGgwMENC?=
 =?utf-8?B?NkZmTUJRTmZObXljMzVvdEZKc2xYdTNJaDRpWmRDVzRpUEhQRmRXN0tLTERj?=
 =?utf-8?B?a2k1NHBpQ0xReDVQRjBueURtYlhFS2UyZUFxK3Y4QmtHdTc3QVRNUVQwL2FS?=
 =?utf-8?B?c05oWkxlT2o4dmRQZEN3WmF4Q0tiaTlNS0xMQnVDa3JGbmlVMTE3NUpxL0dI?=
 =?utf-8?B?eHRocWV5SFFndnBOTGNGNG9XaVhTM3dxRk8ySU42VVVzWUVWT0twazBRejZH?=
 =?utf-8?B?Ylh4ZkhTU1lXcnRrNHZ1eVZQNGRFcUhTQjlmNE5CdzM5dC9WWlV3OENnVFJp?=
 =?utf-8?B?eVFlRGw5cm1MRUxOWWU1cENqeUZpSERuaVBGMUNXOWxWaEVLS1FRa3JrNWIz?=
 =?utf-8?B?akVIWllGUVE5aUZIY3dGcmZSM0Z5dTB4K1BvL0xnRk1aOHBtNWpnc01rVE9X?=
 =?utf-8?B?YUkyNEFZaVFhTFovaTE3SzRGRElRY3lSWGc2OUlNUmUxdlRLc0VBK240d2lB?=
 =?utf-8?B?ZzRIWlFGdm45eGd4aEdtOFFsWTZBSjZIZms3RVFzbDRKS3BLencvL0plNzFh?=
 =?utf-8?B?bU10NWV5N2ZzNUUyMG9lSHVrSGVhaXR4TnBWZS9rM3ZidlRxMzgycEs0aUZQ?=
 =?utf-8?B?UUFhMytJMzRZdEFpU2Y0cG1aSW44TDB4a0lRUEpON1NkNGdCTGdCZjBnZXRY?=
 =?utf-8?B?dlIxdlg2eHZ3bUl6cW1qa3ZWaXNjQ3B2QkhKN3RrMEJ1alY5TEZWZWc5c1g1?=
 =?utf-8?B?TzYyZEJCNDRoNFRxeXM2Rk8xV0xueVd6d1pGMjdTYmZtdFUyb3hENjFiZjBT?=
 =?utf-8?B?a0RwRFc4bUNBVnNOc0d2c3FoVG1UK3RoVGpMM2o2MnplTWRJZ09tL3hNR2gr?=
 =?utf-8?B?MmUvZW12MTVGbjdkMDI5WmxqMXF4cFdMeU1rMXFRSVVYY2psVll5RTJ1RUZZ?=
 =?utf-8?B?MEpRcU5xWTN3OURISkFmS24zTFlWYWs2d1E4SmEzT1hHSWxSQ1hVblV6V2cr?=
 =?utf-8?B?UmdDak1TaitvendhNVA1OTlxNWx3cmlKM3lWanc0VG10QjdqOWEyWnBWNzdv?=
 =?utf-8?B?c2t6WjFwQVdlK1JIWU9uaXhJME1yZUZwWTNJT09kQ2JsckgxaDlHN3RqNE45?=
 =?utf-8?B?Y3A1ZjlvSjlXVXJGK0x5c0pscVdXbUU3VFZSVTFmMmNtdzFOM2gyWTY1Wkpj?=
 =?utf-8?B?Sjg1VFFEVVNIWWp4bm5jTVd0NDZiZWptNEVOUHdJUHRiM3lORE5YZTBvR3BX?=
 =?utf-8?B?eFZsbXJ1VHVtTmQwQWZPSm9WT3c4eXh0MTBtZEwycWdqRXpJSVhWbkZ1aEx4?=
 =?utf-8?B?cGlTZnQ3dWtjMnJ6L0tHbVIyNlUrSjgrRk13b3poZWxkM2FMOVVhYUlUb0Uy?=
 =?utf-8?B?MUdLVVZnVkNLU1dadzk5bnNpNGVvc1h5cHZVUUd1SmM5ZXY4bHZJamFKQU8x?=
 =?utf-8?B?NTVBdTBhZTdTVm1vc29qUHY2RnU4Z3ZrVTNsandMTzFZY0ViK2kxMDVoRjFj?=
 =?utf-8?B?OXFZczN0Q0NZTTRDaDc4RDBsT1Y5c29yL1ljT1FSRGgzUkMzVTl6UmMrYldV?=
 =?utf-8?B?ZS9vRVJEeDl0UkF2QnZRM25GWmZrYTJKUWpHc3RJU2NwNlY4MUxYZTN4ZlVa?=
 =?utf-8?B?VkIwelNlalQ5c3Q3bHVkbFdSYlh0U3kyY2FBelBGOGpYVjViZ1RMSHZEL29G?=
 =?utf-8?Q?dlz1ltAIwVRVrgabn+jpEff1Wkc2b/pm552nHES?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0116d562-998a-45df-d043-08d978fa765c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 10:12:17.4732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6fN2pUl08VqVkA5MUJpphWm1tYK+rLk/cH0KHL9tzk/Dj0ytHkytOAwoPtBhXArGt4x5s14Vgh7IvM5WeSNO/3KDCrTW19CyTi5FrJVwck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.09.2021 11:34, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add a class that will unify block parents for blockdev-replace
>> functionality we are going to add.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block-parent.h | 32 +++++++++++++++++
>>   block/block-parent.c         | 66 ++++++++++++++++++++++++++++++++++++
>>   block/meson.build            |  1 +
>>   3 files changed, 99 insertions(+)
>>   create mode 100644 include/block/block-parent.h
>>   create mode 100644 block/block-parent.c
>>
>> diff --git a/include/block/block-parent.h b/include/block/block-parent.h
>> new file mode 100644
>> index 0000000000..bd9c9d91e6
>> --- /dev/null
>> +++ b/include/block/block-parent.h
>> @@ -0,0 +1,32 @@
>> +/*
>> + * Block Parent class
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>> + *
>> + * Authors:
>> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef BLOCK_PARENT_H
>> +#define BLOCK_PARENT_H
>> +
>> +#include "block/block.h"
>> +
>> +typedef struct BlockParentClass {
>> +    const char *name;
>> +
>> +    int (*find_child)(const char *parent_id, const char *child_name,
>> +                      BlockDriverState *child_bs, BdrvChild **child,
>> +                      Error **errp);
> 
> Callbacks should come with a contract.

will add

> 
>> +    QTAILQ_ENTRY(BlockParentClass) next;
>> +} BlockParentClass;
>> +
>> +void block_parent_class_register(BlockParentClass *cls);
>> +
>> +BdrvChild *block_find_child(const char *parent_id, const char *child_name,
>> +                            BlockDriverState *child_bs, Error **errp);
>> +
>> +#endif /* BLOCK_PARENT_H */
>> diff --git a/block/block-parent.c b/block/block-parent.c
>> new file mode 100644
>> index 0000000000..73b6026c42
>> --- /dev/null
>> +++ b/block/block-parent.c
>> @@ -0,0 +1,66 @@
>> +/*
>> + * Block Parent class
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>> + *
>> + * Authors:
>> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "block/block-parent.h"
>> +#include "qapi/error.h"
>> +
>> +static QTAILQ_HEAD(, BlockParentClass) block_parent_classes =
>> +    QTAILQ_HEAD_INITIALIZER(block_parent_classes);
>> +
>> +void block_parent_class_register(BlockParentClass *cls)
>> +{
>> +    QTAILQ_INSERT_HEAD(&block_parent_classes, cls, next);
>> +}
>> +
>> +BdrvChild *block_find_child(const char *parent_id, const char *child_name,
>> +                            BlockDriverState *child_bs, Error **errp)
>> +{
>> +    BdrvChild *found_child = NULL;
>> +    BlockParentClass *found_cls = NULL, *cls;
>> +
>> +    QTAILQ_FOREACH(cls, &block_parent_classes, next) {
>> +        int ret;
>> +        BdrvChild *c;
>> +
>> +        /*
>> +         * Note that .find_child must fail if parent is found but doesn't have
>> +         * corresponding child.
>> +         */
>> +        ret = cls->find_child(parent_id, child_name, child_bs, &c, errp);
>> +        if (ret < 0) {
>> +            return NULL;
>> +        }
>> +        if (ret == 0) {
>> +            continue;
>> +        }
>> +
>> +        if (!found_child) {
>> +            found_cls = cls;
>> +            found_child = c;
>> +            continue;
>> +        }
>> +
>> +        error_setg(errp, "{%s, %s} parent-child pair is ambiguous: it match "
>> +                   "both %s and %s", parent_id, child_name, found_cls->name,
>> +                   cls->name);
>> +        return NULL;
>> +    }
>> +
>> +    if (!found_child) {
>> +        error_setg(errp, "{%s, %s} parent-child pair not found", parent_id,
>> +                   child_name);
>> +        return NULL;
>> +    }
>> +
>> +    return found_child;
>> +}
> 
> Especially when the callback can return NULL with and without setting an
> error!

Hmm. Callback returns int.

And this block_find_child() function return NULL only together with errp set.

> 
>> diff --git a/block/meson.build b/block/meson.build
>> index 0450914c7a..5200e0ffce 100644
>> --- a/block/meson.build
>> +++ b/block/meson.build
>> @@ -10,6 +10,7 @@ block_ss.add(files(
>>     'blkverify.c',
>>     'block-backend.c',
>>     'block-copy.c',
>> +  'block-parent.c',
>>     'commit.c',
>>     'copy-on-read.c',
>>     'preallocate.c',
> 


-- 
Best regards,
Vladimir

