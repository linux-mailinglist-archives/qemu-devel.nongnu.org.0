Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64549E71B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 17:09:45 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD7LE-0000M0-Bz
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 11:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD6i0-0007lb-Lo; Thu, 27 Jan 2022 10:29:12 -0500
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:46404 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD6hu-0005NO-VU; Thu, 27 Jan 2022 10:29:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O26I4ou1BchYyKADBSeatTL9aSMR//Q9pGgmlT4+xrmpEfqadxd75mro8ThuE0AcRPF0enrwciNmcY1rcdMNSOe7iLMCnolNr/64gzqnLRpjePSC9vofpxoqN6onhjSFduwSGLTy+lp2JuLu3Y2DvrHY6V+yQEW6IQ41MyRJQMi80Hsjn/QHc8XSDtCwZXurzprlAXDdwA2o1XYu3XfCxE8oS8QOGShn8U5d8tf0xv4wdSwShkSqHcY2E+mBeaf7YbGBVQZhYOuwTEmZi3ppShBecid7OW3DWXJ420ymRpZiaGIHTgTk9vr/+Yt2db5k0bHrcNCBekzBXJyDNds3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDqAZh9tOyXUgFN5oO9I8DO/uA9zqGVF3ycP6UOFh/0=;
 b=K3ChnkSBYZCutDlpG/BCjMujd/gbC//GuUZ+TcqzavCLlc69cwEiQ+NQL1jWe0ISqxqqAixtb7CYc7Vybj/k6MEpmHYeJULxw2a6lliiqS8j50R9YdSdrVLFtuvDXDIp/DTcHOP/TV9z7RPKFE7lR6W7xZ9oHyKWz4P4xCYyyPl9xIG9KD8v7jExXQgOhjcOwxIY5GFgC38P8eTy+6WhXLAFkyBW4Te2Rnw2ied98ZjaVo9jwIKYisxEMYUsOQ3iAUpG0a81uyybwD9yAbu4rYQReqJkAVeLxJ7XqSBx93boa/N0Bx6Vy3hOXh7EBdQn8koXNxFJ4hPGvdykJU/ZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDqAZh9tOyXUgFN5oO9I8DO/uA9zqGVF3ycP6UOFh/0=;
 b=P62dFjiz/YbL77gprCnVGKDLLSLWeaizT6ecqIXGE9Uc/NLilrIWea45Ok/oCsQCIObrawS1UZl8+IkVfShqDKlXkNkMzKe2AtBfs5z0xOHgxxlzpDtGes9x35APsnwlK+Vv+dTa9iZG++MYbD1Iseb8EZh3msoy15ByCkoTrKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB9PR08MB6940.eurprd08.prod.outlook.com (2603:10a6:10:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 15:28:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 15:28:56 +0000
Message-ID: <5dee50da-18bf-0ded-b5e0-ba2fbd6ffbc0@virtuozzo.com>
Date: Thu, 27 Jan 2022 18:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 10/19] block: introduce fleecing block driver
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-11-vsementsov@virtuozzo.com>
 <db264b8a-2c27-eb7c-0c2b-d1fbfe473aa3@redhat.com>
 <63747c43-93f5-f899-bf8e-4c87467db68b@virtuozzo.com>
In-Reply-To: <63747c43-93f5-f899-bf8e-4c87467db68b@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58f1875-9c43-4665-7547-08d9e1a9bb41
X-MS-TrafficTypeDiagnostic: DB9PR08MB6940:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB6940828649422E15FF989441C1219@DB9PR08MB6940.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dm1zLdsVzD0NwKhNv5Yv/v5J1qy40WvAOXv6JB8WIg3W7CDjqzF0OlyanhAeK3ngqxxIpXMXUjrUT8+w7lBqDVkyT3Pg0VV1wP10mZVa80RJxHszDofLC4eNNpC+hqc+YWq3zC6KNUaxSyWc157eO7ptIcEzDWmVUISUjTXN+5dFGg5e2DDhy0G6OyYgSzLaaIoZ87KoNb4/krcROEXxJXnVtEicd+lIfeYAHnN6LxclAzsrOHJVB1I2d/0s+CJIq+po1yy4bIYi9b/pEgRb2id58msVlCOLnaD8LHahZlr34cp4lrsJirB6+KnrIahOUdMxg5y7TdUfF9IQ46I4Dv0BFCmC7t1KH2rNF2fGEJkiOt1NL1wq5djOkFb9tZJrllIp+oCrd5AU0e06VSIkbnjI3Hap3uRAkKjm1J3PlCxjSQ1pe9qxnDSkMvotKHda5IMz8Cy+fzUterqGWAACe/JCz1IWfpHRhcO7THgo7CrAL8LonMjiPsrSj0pYQh75xO4er/vR3TTnABHVBSYbH0mUO1NytU6+hfLKkf6NW21mR6kJhZ7ENfhv3Idgr541tKXPiR44E/HJ+KB7U/D0kEMiv2aN4r7Psm3wVIf9jzqnxL7T9RY4CYes75Lyc3qLv/RdDnBgY8UlTVW5IKzeuI4tvsjZxApTm3RqI81VpYkYH8U/W8Cj5Z2bTAtRmQd/SleaHM7HPn21NcrEIPiXVViFGpWXB0JHCO3lH8vyclkrV5siIsRXoyhGy6Asw7AUhRHjZxPsZQJ0J4Ci0Uid89Kiz0RI2APDQ6AHY81Amg1Us6MZj9jsVAkWb2PNUcDrx1/IUs4lvyzBnxNuQKYGhR7rS6Jq9tKSm18D2Ta33hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(5660300002)(38350700002)(316002)(31686004)(26005)(8676002)(6506007)(53546011)(66946007)(83380400001)(6486002)(30864003)(38100700002)(36756003)(4326008)(2616005)(31696002)(66556008)(8936002)(52116002)(86362001)(6512007)(508600001)(107886003)(66476007)(6666004)(186003)(2004002)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJqUDJGTFJWMWNxWlpXTUZqRXZsdmlWb0hDUkgzMjRJQjY3QzQ4UE9ubjdu?=
 =?utf-8?B?czc5V3hzMTdQaVNuK0VUYmNmRXBaQmxCUGVjdjhpTGZrOE96VjNkM2lpaDIr?=
 =?utf-8?B?MUJKY1FjcTdOQ2E3VkVqREx6K1BNckFDNldSdkwyV0lpWU9wWFd2VnVFb282?=
 =?utf-8?B?VHJUdWhQaDh0cDEvSDIyVnBnbGFIUHd6N0VtVEdvRGVhRnRWcTRlRUcyZGd4?=
 =?utf-8?B?by9XWGw3dkJzcUVaUFRxNXFwaE0zcnNYMlNQOS9udTV2WFZzdHFzS25iYU5I?=
 =?utf-8?B?WjVOK2xqcFY0Vmt4akxBaWRvUk02eFRFYktxM2Z5RkZSS09nZktrajY0eENQ?=
 =?utf-8?B?dVptQTdHTXhPdzVxZzZRSElPZ0NUQlp4NEREZTNRb2RuaW40bXhKZndTcGFO?=
 =?utf-8?B?QlRlWnZHM240ZjlvMGcxQ3BsUk9SSWxzeVd0ZG94TldhT3dvTWtGS0ZZTHZS?=
 =?utf-8?B?cHBDRGNZQlhIaVBha0xZMFo3WmI1STdZQzJnc0ZCcEZLQktPcUFGVFFGRXl5?=
 =?utf-8?B?cjYxZHFpNW9yNVRzVWI0Uk4rOTlnN0xJQTlCQ0tQTVd0eEFxdnNHY0prMUhl?=
 =?utf-8?B?VmhWVUlKeGx3Q3RIVStzK3c4MElGTnYwbDcxSHNJOVFCdXlhTVVvN1dDRjNE?=
 =?utf-8?B?UWdUSjU1eU9GWVlBNDJXakdsWFlZMUJndzVvK0JZTUZYUmlZR3RhYjBxMG9X?=
 =?utf-8?B?bUdpdlJ6YlN1SXIwRm9DS1JXWURjK3Q2eGhIMlNVSTVpeWw2cXA2SjVBTkdH?=
 =?utf-8?B?OCs4Qzk2T0FxeGpENXN6OElLSTQ4SThiNjFQcEFhdlRKSVMwc011Y2dTbjBj?=
 =?utf-8?B?Y1dkZyttOEoyN0FjazZpVWJzbXhwQ1ZtVmkwZVhtQWZIRW5KR1BHa202ekNl?=
 =?utf-8?B?bEZHWS81Yi9zU0p5OGQ5dTFjU282NGw3cWhkZ3prOFBBNGJtVjdSOGU1Q1RM?=
 =?utf-8?B?eElLeHFRYWZTMUtoNnQrQ1RsUW56UFBWRE9LR25NMlZFMi9qdGVBTjEya1F4?=
 =?utf-8?B?Mm8rbHNnTklHUEozemFKbFFyTXpUazVzODhPUjBXU2pFZzk2U0pxYVA1dWdy?=
 =?utf-8?B?K016V2o4K041ZUIzQXNkSlJzZWZueEFxNVRGWTAvU3g2OVNjWHd5QW5ubVJi?=
 =?utf-8?B?ZlZ1UkJXWjBtZGMxdWVkSUV0UzVYbTVXMGJaSEhpbmxCeEtGeUkySXkxM096?=
 =?utf-8?B?SWgyK0VmZXZVUUlRVzJLcVd3U0RxV3N4U0NUWlVEeTA1TDRSOGVHUFFCM3Nx?=
 =?utf-8?B?dGVpSEFqVjdUUmpDSEdxL29YaXk0U241UjFPVnpVZmZOczUzbGhSeFFYRU80?=
 =?utf-8?B?YTBHSHlpZG40WXdCZWI4TEF4c0lFa1AvR2ZpbEtOY0paQ0wzVWhnOUFnN25C?=
 =?utf-8?B?Y2JuZVAvK21pd1BCTVkwUjg3L3ZPWjFPbUNmanhTbXZsb1BOeHdkTkpnSTlX?=
 =?utf-8?B?Z3B5dUxySUdvZjA2WWVhSUx2eWUzVys2RXRZbml2NE9jcUcvZGsvQTBJVjJ2?=
 =?utf-8?B?TnhZUkhuTVlOcEJIM240UWQ3YjdITjl5d2prSHhrZ3d1ckIrTU94Sjg2cC9a?=
 =?utf-8?B?eUhCbGlHNkRZd0NaVlBEQzZsVldCR1c4NGJBZ0w5N3EwbG1pSHVCanZTY3h5?=
 =?utf-8?B?WW9WWHNOUktCZmx3Ry95SFpEQlBlcVlvMXZzZzVta09YZDJTSWh2RmEzTnV2?=
 =?utf-8?B?bXZsVDVFOFNHc1hsV1d2eXlHbGgzb1lFdGxFL3NxOUR4QVQ4d1Y1ZVV6bjZh?=
 =?utf-8?B?ZEt5SjloTHVTdjdQRHZYeisyRkJIREJEOGNVdVlSME40UEdqaU1nclhNNGVj?=
 =?utf-8?B?UHA2OU5URElObVNnelR3UHBZTjZnMVNrampiSzZxbC9TTDNoRXY0WHZuTUt1?=
 =?utf-8?B?TkMxR3d2YzRTemo0TGo0cTJJRi9hVnh2UWR1aFoxeVg5M2hSZUtxaEZrb0dG?=
 =?utf-8?B?WHZWRmRESzIrQ1FKK1g2Zk5CeEJxQUswb2ZINjA2aUU3VVBzdTIvNmJGTTBz?=
 =?utf-8?B?N3dNR2FremVJUVlHdnA3bi9Vd3dXemNnZ0MwTXZOMmRWcWtFdmFBQS9ESDJF?=
 =?utf-8?B?dzRBZ3Q3RTRyVE9nRDZhOWxsWDh3d3FxaDV3VjN0MjQ1RzZjZHY4SnZEN3Vq?=
 =?utf-8?B?ZHh0aERwTlNMSk1yWkVDSWNLK2pSYmgwN1R2TzcwTERZeGNCdHdUZjNRVmQv?=
 =?utf-8?B?eVNwZS9HRXNpZDZoL1ZBZUZEVzQ0Yy9hREprazRiK1kyandMMGlQeXNBMUJr?=
 =?utf-8?Q?GEdqI5EsREJJNSzFSoOyZTi3p818utQh0oSTGrdm34=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58f1875-9c43-4665-7547-08d9e1a9bb41
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:28:56.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6wim7ynGpmNkzvkj7vQxA92ZurpakORbxUcj6mPpx+BLT+2tNSoT0hOnNzqS8GJS+OrVUvR7zhVrkB+Mo2ijMIWDYZXVy5xbNIl5kjnOTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6940
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

21.01.2022 13:46, Vladimir Sementsov-Ogievskiy wrote:
> 20.01.2022 19:11, Hanna Reitz wrote:
>> On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
>>> Introduce a new driver, that works in pair with copy-before-write to
>>> improve fleecing.
>>>
>>> Without fleecing driver, old fleecing scheme looks as follows:
>>>
>>> [guest]
>>>    |
>>>    |root
>>>    v
>>> [copy-before-write] -----> [temp.qcow2] <--- [nbd export]
>>>    |                 target  |
>>>    |file                     |backing
>>>    v                         |
>>> [active disk] <-------------+
>>>
>>> With fleecing driver, new scheme is:
>>>
>>> [guest]
>>>    |
>>>    |root
>>>    v
>>> [copy-before-write] -----> [fleecing] <--- [nbd export]
>>>    |                 target  |    |
>>>    |file                     |    |file
>>>    v                         |    v
>>> [active disk]<--source------+  [temp.img]
>>>
>>> Benefits of new scheme:
>>>
>>> 1. Access control: if remote client try to read data that not covered
>>>     by original dirty bitmap used on copy-before-write open, client gets
>>>     -EACCES.
>>>
>>> 2. Discard support: if remote client do DISCARD, this additionally to
>>>     discarding data in temp.img informs block-copy process to not copy
>>>     these clusters. Next read from discarded area will return -EACCES.
>>>     This is significant thing: when fleecing user reads data that was
>>>     not yet copied to temp.img, we can avoid copying it on further guest
>>>     write.
>>>
>>> 3. Synchronisation between client reads and block-copy write is more
>>>     efficient: it doesn't block intersecting block-copy write during
>>>     client read.
>>>
>>> 4. We don't rely on backing feature: active disk should not be backing
>>>     of temp image, so we avoid some permission-related difficulties and
>>>     temp image now is not required to support backing, it may be simple
>>>     raw image.
>>>
>>> Note that now nobody calls fleecing_drv_activate(), so new driver is
>>> actually unusable. It's a work for the following patch: support
>>> fleecing block driver in copy-before-write filter driver.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json |  37 +++++-
>>>   block/fleecing.h     |  16 +++
>>>   block/fleecing-drv.c | 261 +++++++++++++++++++++++++++++++++++++++++++
>>>   MAINTAINERS          |   1 +
>>>   block/meson.build    |   1 +
>>>   5 files changed, 315 insertions(+), 1 deletion(-)
>>>   create mode 100644 block/fleecing-drv.c
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 6904daeacf..b47351dbac 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -2917,13 +2917,14 @@
>>>   # @blkreplay: Since 4.2
>>>   # @compress: Since 5.0
>>>   # @copy-before-write: Since 6.2
>>> +# @fleecing: Since 7.0
>>>   #
>>>   # Since: 2.9
>>>   ##
>>>   { 'enum': 'BlockdevDriver',
>>>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>>>               'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
>>> -            'file', 'ftp', 'ftps', 'gluster',
>>> +            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
>>>               {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>>>               {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>>>               'http', 'https', 'iscsi',
>>> @@ -4181,6 +4182,39 @@
>>>     'base': 'BlockdevOptionsGenericFormat',
>>>     'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>>> +##
>>> +# @BlockdevOptionsFleecing:
>>> +#
>>> +# Driver that works in pair with copy-before-write filter to make a fleecing
>>> +# scheme like this:
>>> +#
>>> +#    [guest]
>>> +#      |
>>> +#      |root
>>> +#      v
>>> +#    [copy-before-write] -----> [fleecing] <--- [nbd export]
>>> +#      |                 target  |    |
>>> +#      |file                     |    |file
>>> +#      v                         |    v
>>> +#    [active disk]<--source------+  [temp.img]
>>
>> When generating docs, my sphinx doesn’t like this very much.  I don’t know exactly what of it, but it complains with:
>>
>> docs/../qapi/block-core.json:4190:Line block ends without a blank line.
>>
>> (Line 4190 is the “@BlockdevOptionsFleecing:” line, but there is no warning if I remove this ASCII art.)
> 
> I usually disable docs building to not waste the time.. But I should enable it at least once to check that I don't break it.
> 
>>
>>> +#
>>> +# The scheme works like this: on write, fleecing driver saves data to its
>>> +# ``file`` child and remember that this data is in ``file`` child. On read
>>> +# fleecing reads from ``file`` child if data is already stored to it and
>>> +# otherwise it reads from ``source`` child.
>>
>> I.e. it’s basically a COW format with the allocation bitmap stored as a block dirty bitmap.
>>
>>> +# In the same time, before each guest write, ``copy-before-write`` copies
>>> +# corresponding old data  from ``active disk`` to ``fleecing`` node.
>>> +# This way, ``fleecing`` node looks like a kind of snapshot for extenal
>>> +# reader like NBD export.
>>
>> So this description sounds like the driver is just a COW driver with an in-memory allocation bitmap.  But it’s actually specifically tuned for fleecing, because it interacts with the CBW node to prevent conflicts, and discard requests result in the respective areas become unreadable.
>>
>> I find that important to mention, because if we don’t, then I’m wondering why this isn’t a generic “in-memory-cow” driver, and what makes it so useful for fleecing over any other COW driver.
>>
>> (In fact, I’m asking myself all the time whether we can’t pull this driver apart into more generic nodes, like one in-memory-cow driver, and another driver managing the discard feature, and so on.  Could be done e.g. like this:
>>
>>
>>                  Guest -> copy-before-write --file--> fleecing-lock --file--> disk image
>> ^        |                  ^
>> |      target               |
>> +-- cbw-child --+        |               backing
>> |           v                  |
>> NBD -> fleecing-discard --file--> in-memory-cow -----------+
>>                                          |
>>          file
>>            |
>>            v
>>        temp.img
> 
> Hmm ASCII art is broken for me.. Me trying to fix:
> 
> 
>                                      ┌──────────────────┐
>                                      │       NBD        │
>                                      └─┬────────────────┘
>                                        │
>                                        │ root
>                                        ▼
>     ┌──────────┐                     ┌──────────────────┐
>     │  guest   │     ┌───────────────┤ fleecing-discard │
>     └─┬────────┘     │ cbw-child     └─┬────────────────┘
>       │              │                 │
>       │ root         │                 │ file
>       ▼              ▼                 ▼
>     ┌──────────────────┐  target     ┌──────────────────┐
>     │       CBW        ├────────────►│  in-memory-cow   │
>     └─┬────────────────┘             └─┬───────────┬────┘
>       │                                │           │
>       │ file                           │           │ file
>       ▼                                │           ▼
>     ┌──────────────────┐     backing   │        ┌─────────────┐
>     │  fleecing-lock   │◄──────────────┘        │ temp.img    │
>     └─┬────────────────┘                        └─────────────┘
>       │
>       │ file
>       ▼
>     ┌──────────────────┐
>     │   active-disk    │
>     └──────────────────┘
> 
>>
>> I.e. fleecing-discard would handle discards (telling its cbw-child to drop those areas from the copy-bitmap, and forwarding discards to the in-memory-cow node)
> 
> , the in-memory-cow node would just be a generic implementation of COW (could be replaced by any other COW-implementing node, like qcow2),
> 
> Hmm, but than in-memory-cow should own the done_bitmap bitmap. But we want to use it for synchronization in upper layers..
> 
> 
>> and the fleecing-lock driver would prevent areas that are still being read from from being written to concurrently.
> 
> But we want to call fleecing_mark_done_and_wait_readers() exactly after copy-before-write operation, so this call should be done in CBW filter, not in fleecing lock
> 
> [*] upd after answering to last comment: or we don't want..
> 
>>
>> Problem is, of course, that’s very complicated, I haven’t thought this through, and it’s extremely questionable whether we really need this modularity.  Most likely not.
> 
> Yes, I try to go with not-too-many filters.
> 
>>
>> I still feel compelled to think about such modularization, because the relationship between the CBW and the fleecing driver as laid out in this series doesn’t feel quite right to me.  They feel bolted together in a way that doesn’t fit in with the general design of the block layer where every node is basically self-contained.  I understand CBW and fleecing will need some communication, but I don’t (yet) like how in the next patch, the CBW driver looks for the fleecing driver and directly communicates with it through the FleecingState instead of going through the block layer, as we’d normally do when communicating between block nodes.
>>
>> That’s why I’m trying to pick apart the functionality of the fleecing block driver into self-contained “atomic” nodes that perform its different functionalities, so that perhaps I can eventually put it back together and find out whether we can do better than `is_fleecing_drv(unfiltered_target)`.)
> 
> Big part of the problem is that we want somehow bind together two filters. But we can't make both the child of each other, as it would be a loop. May be we should introduce "non-child" relationship on the graph? Which will not participate in permission update but only in aio-context management?
> 
> We may add a parameter for CBW filter, that points directly to fleecing filter instead of "is_fleecing_drv(unfiltered_target)".. But it's just and extra argument wchih we can detect automatically.
> 
>>
>>> +#
>>> +# @source: node name of source node of fleecing scheme
>>> +#
>>> +# Since: 7.0
>>> +##
>>> +{ 'struct': 'BlockdevOptionsFleecing',
>>> +  'base': 'BlockdevOptionsGenericFormat',
>>> +  'data': { 'source': 'str' } }
>>> +
>>>   ##
>>>   # @BlockdevOptions:
>>>   #
>>> @@ -4237,6 +4271,7 @@
>>>         'copy-on-read':'BlockdevOptionsCor',
>>>         'dmg':        'BlockdevOptionsGenericFormat',
>>>         'file':       'BlockdevOptionsFile',
>>> +      'fleecing':   'BlockdevOptionsFleecing',
>>>         'ftp':        'BlockdevOptionsCurlFtp',
>>>         'ftps':       'BlockdevOptionsCurlFtps',
>>>         'gluster':    'BlockdevOptionsGluster',
>>> diff --git a/block/fleecing.h b/block/fleecing.h
>>> index fb7b2f86c4..75ad2f8b19 100644
>>> --- a/block/fleecing.h
>>> +++ b/block/fleecing.h
>>> @@ -80,6 +80,9 @@
>>>   #include "block/block-copy.h"
>>>   #include "block/reqlist.h"
>>> +
>>> +/* fleecing.c */
>>> +
>>>   typedef struct FleecingState FleecingState;
>>>   /*
>>> @@ -132,4 +135,17 @@ void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
>>>   void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
>>>                                            int64_t bytes);
>>> +
>>> +/* fleecing-drv.c */
>>> +
>>> +/* Returns true if @bs->drv is fleecing block driver */
>>> +bool is_fleecing_drv(BlockDriverState *bs);
>>> +
>>> +/*
>>> + * Normally FleecingState is created by copy-before-write filter. Then
>>> + * copy-before-write filter calls fleecing_drv_activate() to share FleecingState
>>> + * with fleecing block driver.
>>> + */
>>> +void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing);
>>> +
>>>   #endif /* FLEECING_H */
>>> diff --git a/block/fleecing-drv.c b/block/fleecing-drv.c
>>> new file mode 100644
>>> index 0000000000..202208bb03
>>> --- /dev/null
>>> +++ b/block/fleecing-drv.c
>>> @@ -0,0 +1,261 @@
>>> +/*
>>> + * fleecing block driver
>>> + *
>>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>>> + *
>>> + * Author:
>>> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +
>>> +#include "sysemu/block-backend.h"
>>> +#include "qemu/cutils.h"
>>> +#include "qapi/error.h"
>>> +#include "block/block_int.h"
>>> +#include "block/coroutines.h"
>>> +#include "block/qdict.h"
>>> +#include "block/block-copy.h"
>>> +#include "block/reqlist.h"
>>> +
>>> +#include "block/copy-before-write.h"
>>> +#include "block/fleecing.h"
>>> +
>>> +typedef struct BDRVFleecingState {
>>> +    FleecingState *fleecing;
>>> +    BdrvChild *source;
>>> +} BDRVFleecingState;
>>> +
>>> +static coroutine_fn int fleecing_co_preadv_part(
>>> +        BlockDriverState *bs, int64_t offset, int64_t bytes,
>>> +        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +    const BlockReq *req;
>>> +    int ret;
>>> +
>>> +    if (!s->fleecing) {
>>> +        /* fleecing_drv_activate() was not called */
>>> +        return -EINVAL;
>>
>> I'd rather treat a missing connection with a CBW driver as if we had an empty copy/access bitmap, and so return -EACCES in these places.
> 
> OK for me
> 
>>
>>> +    }
>>> +
>>> +    /* TODO: upgrade to async loop using AioTask */
>>> +    while (bytes) {
>>> +        int64_t cur_bytes;
>>> +
>>> +        ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
>>> +        if (ret < 0) {
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (req) {
>>> +            ret = bdrv_co_preadv_part(s->source, offset, cur_bytes,
>>> +                                      qiov, qiov_offset, flags);
>>> +            fleecing_read_unlock(s->fleecing, req);
>>> +        } else {
>>> +            ret = bdrv_co_preadv_part(bs->file, offset, cur_bytes,
>>> +                                      qiov, qiov_offset, flags);
>>> +        }
>>> +        if (ret < 0) {
>>> +            return ret;
>>> +        }
>>> +
>>> +        bytes -= cur_bytes;
>>> +        offset += cur_bytes;
>>> +        qiov_offset += cur_bytes;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int coroutine_fn fleecing_co_block_status(BlockDriverState *bs,
>>> +                                                 bool want_zero, int64_t offset,
>>> +                                                 int64_t bytes, int64_t *pnum,
>>> +                                                 int64_t *map,
>>> +                                                 BlockDriverState **file)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +    const BlockReq *req = NULL;
>>> +    int ret;
>>> +    int64_t cur_bytes;
>>> +
>>> +    if (!s->fleecing) {
>>> +        /* fleecing_drv_activate() was not called */
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    *pnum = cur_bytes;
>>> +    *map = offset;
>>> +
>>> +    if (req) {
>>> +        *file = s->source->bs;
>>> +        fleecing_read_unlock(s->fleecing, req);
>>> +    } else {
>>> +        *file = bs->file->bs;
>>> +    }
>>> +
>>> +    return ret;
>>
>> Is ret == 0 the right return value here?
> 
> Hmm yes, looks strange, it should be some combination of flags.
> 
>>
>>> +}
>>> +
>>> +static int coroutine_fn fleecing_co_pdiscard(BlockDriverState *bs,
>>> +                                             int64_t offset, int64_t bytes)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +    if (!s->fleecing) {
>>> +        /* fleecing_drv_activate() was not called */
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    fleecing_discard(s->fleecing, offset, bytes);
>>> +
>>> +    bdrv_co_pdiscard(bs->file, offset, bytes);
>>> +
>>> +    /*
>>> +     * Ignore bdrv_co_pdiscard() result: fleecing_discard() succeeded, that
>>> +     * means that next read from this area will fail with -EACCES. More correct
>>> +     * to report success now.
>>> +     */
>>
>> I don’t know.  I’m asking myself why the caller in turn would care about the discard result (usually one doesn’t really care whether discarding succeeded or not), and I feel like if they care, they’d like to know that discard the data from storage did fail.
> 
> Returning error is OK too. Will change. Anyway if error is returned, caller shouldn't rely on any assumptions.
> 
>>
>>> +    return 0;
>>> +}
>>> +
>>> +static int coroutine_fn fleecing_co_pwrite_zeroes(BlockDriverState *bs,
>>> +        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +    if (!s->fleecing) {
>>> +        /* fleecing_drv_activate() was not called */
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * TODO: implement cache, to have a chance to fleecing user to read and
>>> +     * discard this data before actual writing to temporary image.
>>> +     */
>>
>> Is there a good reason why a cache shouldn’t be implemented as a separate block driver?
> 
> I don't remember. My last idea was just to implement all the features in special fleecing driver. But you are right that if we see things that could be split to separate small filter which make sense by itself, it _probably_ worth doing.. I'll think about it when prepare a new version, as it is hard to imagine the whole picture not trying to implement it.
> 
>>
>>> +    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
>>> +}
>>> +
>>> +static coroutine_fn int fleecing_co_pwritev(BlockDriverState *bs,
>>> +                                            int64_t offset,
>>> +                                            int64_t bytes,
>>> +                                            QEMUIOVector *qiov,
>>> +                                            BdrvRequestFlags flags)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +    if (!s->fleecing) {
>>> +        /* fleecing_drv_activate() was not called */
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * TODO: implement cache, to have a chance to fleecing user to read and
>>> +     * discard this data before actual writing to temporary image.
>>> +     */
>>> +    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
>>> +}
>>> +
>>> +
>>> +static void fleecing_refresh_filename(BlockDriverState *bs)
>>> +{
>>> +    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
>>> +            bs->file->bs->filename);
>>> +}
>>> +
>>> +static int fleecing_open(BlockDriverState *bs, QDict *options, int flags,
>>> +                         Error **errp)
>>> +{
>>> +    BDRVFleecingState *s = bs->opaque;
>>> +
>>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>>> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
>>> +                               false, errp);
>>> +    if (!bs->file) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    s->source = bdrv_open_child(NULL, options, "source", bs, &child_of_bds,
>>> +                               BDRV_CHILD_DATA, false, errp);
>>> +    if (!s->source) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    bs->total_sectors = bs->file->bs->total_sectors;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void fleecing_child_perm(BlockDriverState *bs, BdrvChild *c,
>>> +                                BdrvChildRole role,
>>> +                                BlockReopenQueue *reopen_queue,
>>> +                                uint64_t perm, uint64_t shared,
>>> +                                uint64_t *nperm, uint64_t *nshared)
>>> +{
>>> +    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
>>> +
>>> +    if (role & BDRV_CHILD_PRIMARY) {
>>> +        *nshared &= BLK_PERM_CONSISTENT_READ;
>>> +    } else {
>>> +        *nperm &= BLK_PERM_CONSISTENT_READ;
>>> +
>>> +        /*
>>> +         * copy-before-write filter is responsible for source child and need
>>> +         * write access to it.
>>> +         */
>>> +        *nshared |= BLK_PERM_WRITE;
>>> +    }
>>> +}
>>> +
>>> +BlockDriver bdrv_fleecing_drv = {
>>> +    .format_name = "fleecing",
>>> +    .instance_size = sizeof(BDRVFleecingState),
>>> +
>>> +    .bdrv_open                  = fleecing_open,
>>> +
>>> +    .bdrv_co_preadv_part        = fleecing_co_preadv_part,
>>> +    .bdrv_co_pwritev            = fleecing_co_pwritev,
>>> +    .bdrv_co_pwrite_zeroes      = fleecing_co_pwrite_zeroes,
>>> +    .bdrv_co_pdiscard           = fleecing_co_pdiscard,
>>> +    .bdrv_co_block_status       = fleecing_co_block_status,
>>> +
>>> +    .bdrv_refresh_filename      = fleecing_refresh_filename,
>>> +
>>> +    .bdrv_child_perm            = fleecing_child_perm,
>>> +};
>>> +
>>> +bool is_fleecing_drv(BlockDriverState *bs)
>>> +{
>>> +    return bs && bs->drv == &bdrv_fleecing_drv;
>>> +}
>>
>> Besides the question whether the FleecingState should be part of CBW or the fleecing driver, I don’t like this very much.  As stated above, normally we go through the block layer to communicate between nodes, and this function for example prevents the possibility of having filters between CBW and the fleecing node.
>>
>> Normally, I would expect a new BlockDriver method that the CBW driver would call to communicate with the fleecing driver.  Isn’t fleecing_mark_done_and_wait_readers() the only part where the CBW driver ever needs to tell the fleecing driver something?
>>
>> Hm, actually, I wonder why we need fleecing_mark_done_and_wait_readers() to be called from CBW – can we not have the fleecing driver call this in its write implementations?  (It’s my understanding that the fleecing node is to be used read-only from the NBD export, besides discards.)
> 
> Interesting idea. That means that we establish the guarantee: successful write to fleecing node is a point after which it will not touch this region in active-disk, and all in-flight reads are awaited. Then we should propagate this guarantee to block_copy() call.. Seems it should work. I'll try.
> 
> 
> Thanks a lot for reviewing, I now have enough material to work on v4. Will see, could this all become a bit more beautiful :)
> 
> 

OK, me now thinking. Let me think out loud.

First about RAM cache. We should keep it in mind. But the scheme should work well with system cache used instead of RAM cache.

Image CBW write opertion now:

CBW WRITE  (copy-before-write operation, copying old unchanged data from active disk to some target)

1. It should be guearanteed, that corresponding area in "done" dirty bitmap is not dirty. And it should be guaranteed that we don't have intersecting parallel writes. It all is true for CBW writes. Should we check and assert it? Probably yes.

2. Do write. We are safe, as dirty bitmap is unset here, and all reads goes to active-disk.

If we work only with system cache, it's all that we can. If write is fast, all is OK, data becomes available for read almost immediately. But if write trigger real flush, fleecing reader will have to read from active-disk during this write, when we actually have the data in RAM. It's a bit inefficient. This may be solved by ram-cache node, for which write is always fast, but than we should call some "flush" operation for that region so that RAM usage not grow endlessly.

3. Data is written, so, make it available for readers

   - mutex_lock
   - set bits in dirty bitmap
   - mutex_unlock

4. If ram-cache is in use trigger cache flush, and wait until cache size normalized (we can't finish cbw-write, otherwise RAM usage will grow indefinitely).

5. before starting actual guest write to active-disk, we should wait for all in-flight fleecing reads from active-disk in this area. So, wait on reqlist.. [*]


think about fleecing read

FLEECING READ  (read operation that done by fleecing user like NBD export)

* mutex_lock()

* check the bitmap:

if data is available in the cache or underlying storage, we don't need any synchronization:

    * mutex_unlock()
    
    * do read from cache (or from underlying storage through cache)

else, we should read from active-disk, and want a guarantee that active-disk will not change in this area during the read

    * create request in reqlist
  
    * mutex_unlock()

    * do read from active-disk

    * drop request from reqlist ( reqlist most probably should be protected by the same mutex as above... should it be some sepearate mutex? Or we want to abuse bitmaps mutex? I don't like to abuse anything )



Ok, now, let's think how to spread all this functionality between nodes..

If we have one "fleecing" node, that does everything, it's simple. It owns all the objects: mutex, dirty-bitmap, reqlist, ram-cache..


But what if we want to split it? Decision where from to read and creating request in reqlist should be done under mutex. So it should be in in-ram-cow node. But this brings a kind of syncrhonization which is not needed for generic in-ram-cow node.. Then, if we start to care of CBW/fleecing synchronization in this node, no reason to not do [*] waiting here too. So that doesn't look like generic in-ram-cow, but like specific fleecing driver.. Which is COW driver. But rather specific.

Could we split RAM cache? Seems we could. Write to it is always fast and may be done under mutex. And after write cache size may exceed the maximum. And we need an API, to wait for cache size normalized..

On the other hand, the simplest and minimal implementation of RAM cache is just a list of in-flight write-requests inside fleecing node + rely on system cache. So the operations would look like:


CBW WRITE to FLEECING node

- mutex lock
- check that corresponding bits in the bitmap are unset and no intersecting write requests
- add write request (together with data buf copied or stolen) to write requests list
- set corresponding bits in the bitmap
- mutex unlock
- great, starting from this point data is already available for reads
- write data to underlying node (system cache helps almost never do real write to disk)
- mutex lock
- drop write request from inflight write requests list
- mutex unlock
- wait for in-flight read requests in active-disk in this area

READ from FLEECING node
- mutex lock
- if data is in in-flight write request list, just copy it, unlock mutex and we are done
- else if bitmap is dirty, unlock mutex and read the data from underlying temporary storage
- else
    - create in-flight read request in reqlist
    - mutex unlock
    - read from active disk
    - mutex lock
    - drop in-flight read request from reqlist
    - mutex unlock


That's all about synchronization + simple improvement that makes data of in-flight writes available for reads.. Do we really need it? Or old synchronization based on serializing requests is enough?


Another thing is access/discard feature. It may simply be split, so we finally have something like



                                    ┌─────────────────┐
                                    │ fleecing-access │
                                    └────┬───┬────────┘
                          cbw-child      │   │
                  ┌──────────────────────┘   │file
                  │                          │
    ┌─────────────▼───┐   target    ┌────────▼────────┐
    │ CBW             ├─────────────► fleecing-sync   │
    └────────┬────────┘             └──┬─────┬────────┘
             │                         │     │
       file  │    ┌────────────────────┘     │file
             │    │     source               │
    ┌────────▼────▼───┐             ┌────────▼────────┐
    │ active-disk     │             │ temp.img        │
    └─────────────────┘             └─────────────────┘


And in this scheme, the question becomes meningful: does it worth the complexity? Or we can simply live with old fleecing synchronization based on qcow2 temporary image and serializing requests, and then we have only one fleecing-access driver.

The only operation that fleecing-access does on cbw-child would some new special operation, like bdrv_discard_cbw, or new flag for discard. We can support automatic passs-through this new operation through filters, but I don't think it may be useful. So, the only reason to have two nodes is to have a cbw-child relation.. When actually combing discard feature and check for dirty bitmap on read to one fleecing driver seems reasonable: it becomes a complete fleecing driver, which has signinficant actions for all block operations: read, write, discard. And it make sense.

So actually we want something like this:


                          cbw-friend
                  ┌──────────────────────────┐
                  │                          │
    ┌─────────────▼───┐   target    ┌────────┴────────┐
    │ CBW             ├─────────────► fleecing        │
    └────────┬────────┘             └──┬─────┬────────┘
             │                         │     │
       file  │    ┌────────────────────┘     │file
             │    │     source               │
    ┌────────▼────▼───┐             ┌────────▼────────┐
    │ active-disk     │             │ temp.img        │
    └─────────────────┘             └─────────────────┘


Where cbw-friend link is used to do discard_cbw() operations. And keeping in mind that discard_cbw() is a very specific operation, there is no reason to support this relationship in generic layer, so all we need is simply keep a reference of CBW node in fleecing node, and it seems not so bad.

And this way, question about does new synchronization and caching worth the complexit goes away: no additional complexity for user, we have only one additional node (which is needed for discard functionality anyway) and simple relationship. So for user the whole differecy is links [fleecing] --source-> [active-disk] instead of [temp.qcow2] --backing-> [active-disk]. And we have a small improvement: a bit more optimal synchronization scheme, reuse of data that is already in ram, possibility to use simple raw file as temp.img.


Hmm. But of course, such relationship raises some questions.. What about aio-context switch? We have to hope for "target" relationship.

Interesting, looking at last picture, I see that CBW and fleecing looks like _one_ block node.. Why can't we merge them? Because guest-read and fleecing-client-read operations are different and should be handled differently. As well as guest-discard and fleecing-client-discard..

But we can implement such operatons as separate bdrv_* operations or as flags for read and discard. And then, the scheme will look like this

                             ┌──────────────────┐
                             │  NBD export      │
                             └─────────┬────────┘
                                       │
                                       │root
                                       │
┌─────────────────┐         ┌─────────▼────────┐
│  Guest          │         │ fleecing-access  │
└───────┬─────────┘         └─────────┬────────┘
         │                             │
         │root                         │file
         │                             │
┌───────▼─────────────────────────────▼────────┐
│                  CBW                         │
└───────┬─────────────────────────────┬────────┘
         │                             │
         │file                         │target
         │                             │
┌───────▼─────────┐         ┌─────────▼────────┐
│   active-disk   │         │  temp.img        │
└─────────────────┘         └──────────────────┘


So, the whole logic is in CBW driver. And fleecing related logic is realized as new bdrv handlers: .bdrv_co_fleecing_preadv()  and .bdrv_co_fleecing_discard()

And fleecing-access is a very simple driver that just on .bdrv_co_preadv() calls bdrv_co_fleecing_preadv(bs->file) and on .bdrv_co_pdiscard() calls bdrv_co_fleecing_pdiscard(bs->file).

This way fleecing-access driver is fully independent of CBW, all relations in graph are Qemu-native and the scheme looks very simple for understanding.



More over, it reminds me my old idea of implementing a possibility to read qcow2 internal snapshot directly. It may look like this:

                              ┌──────────────────┐
                              │  NBD export      │
                              └─────────┬────────┘
                                        │
                                        │root
                                        │
  ┌─────────────────┐         ┌─────────▼────────┐
  │  Guest          │         │ fleecing-access  │
  └───────┬─────────┘         └─────────┬────────┘
          │                             │
          │root                         │file
          │                             │
  ┌───────▼─────────────────────────────▼────────┐
  │                qcow2 active disk             │
  └──────────────────────────────────────────────┘


For this to work, we impelement .bdrv_co_fleecing_preadv() in qcow2, which directly reads data from internal snapshot. This also means that it is better to rename fleecing-access to snapshot-access, and handlers to .bdrv_co_snapshot_preadv().. This way, CBW driver just provides a kind of internal snapshot and corresponding interface for it.

And at some point we even can implement reverse-snapshot inside qcow2 driver, so it will work like fleecing scheme, where instead of COW operations CBW operations are done, and the snapshot doesn't influence the disk fragmenation..


-- 
Best regards,
Vladimir

