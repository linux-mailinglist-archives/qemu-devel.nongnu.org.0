Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24022FA7C4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:44:34 +0100 (CET)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YZt-00088h-Sm
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YXL-0005yk-06; Mon, 18 Jan 2021 12:41:55 -0500
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:33598 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YXE-0007kI-W2; Mon, 18 Jan 2021 12:41:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSU/yh3qd4pnCJTnuLuOtTbBWtk5F3pctO+/H3KxduXql9yex1VJrC6b4BGNGBRe+Qs9iCKMCskfDBqw/zF9WOmoYQ7e7vwVp/MW19btoVTs97AaDuMadWuXUaAiaAb8G/c/OWGeguVeZvjKUjqIemk2Ex+eIEJk4oxpRxugl/NsVRAaPUxkHAAJS4AmwA/MY/76FcgK+w20kiRb3+UAhsZXyOBAsaAwarLVy682el39c5mEj5YgEpiDjKB8iFPVj4jF28yaKYCsoyyEd1O2bqPci7eZPi2/yx/XqMBwBETLvXDMgGrAqcid9ADgfFtTwCV5s+H6lOClLGn83UTNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs4bGN+sS+fRuEraM7VQbwItoVBz20Nj8ghc9xLUrr4=;
 b=DL0jQobc/HSy1Ta1ivxjbccQ4ln3vIgKLfbsbZppRcQvoYo+8LjVsRUh74CU19yvvcUDFxM+W2vLGVD/ZNTGEzVJVq/TgLB82gy1vJgaIlVP82/+xoB1FsXFYqhQwJgJ/vxQGD0IImbdkNz43AzD1NI1gGzkGWAV9QGtyUGLawrfzx6tKhJAIeKuF7uFxu5tWVhiGBIyd29ySrvQyAI++y8lULiB0wYZUkoehgsizXTgy+4NHHExz2wyqbnym9QAsj9si4Owg00kzyOk84G5kydlGt44L3MAaLux9Afyv0HEtgqAtu6yeEHX2OIPXycAeVKbnVkyCsRu2OsBRMZR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs4bGN+sS+fRuEraM7VQbwItoVBz20Nj8ghc9xLUrr4=;
 b=S9cZThMjRuNxlFNvgP4zBCqIBK7z/E2nAuzJmFfSb0FzpvE73jo/80/8lTN7wDIgrIwRwgttKX937q7xHsfmN7CPAMletfdC6ESsSo8u5oUyG8tyQuOnCvFkA39MCQhCXTv62xjTQ8AzzQwVbcv/wwgKGKbi2BvWw3GUrsmeCoI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 17:41:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:41:45 +0000
Subject: Re: [PATCH v2 10/36] util: add transactions.c
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-11-vsementsov@virtuozzo.com>
 <20210118165034.GJ11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9bfc4708-a572-91c7-7bae-cf9452c6bdfc@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:41:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118165034.GJ11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 17:41:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3157a29-d6f7-4f12-17dc-08d8bbd852e1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB416856183D0CAED6A1691C99C1A40@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VH3MVWqmz2SN9Eqxu7tf5/gb1Epte6rg4fWv1CZL0LqeV+F5cg71bmOFV7FrYg00MMr+BlrHKkx4ZmHM84IxDkLaM2eWy7SQPEYIpO4Q8FzIPVabJHAabFDMp0KhlErJI4Ek7L+VtbjohkqH5hTIbSoXBFztS6clcuvw4bbGh51C9nTjqk46lCthB+wi8JcORpwfrWxEm3NM8Bu9znqVmjYwmcQfdH5FW63vm7Yp4AcELw7/lPV9sldOAHCqZ15DZ+cMdziIxIgJZqumxEL2UhT3VDfaaYPeN7hYjarNOVbRN5TECsZwqen0iVXEzPvvOGpwe2X2jSYvRboB+GfgRFfYlKcx/9vqmE/id2Ntogl/Du9gsE5qUFBADsaSSxwNDzsrcsxjZ21+j23jwHvpsT5FzuQ45FTDKdnGiBWIXP9UtebzNy6HVyxQ0m65nzQsHQSt1Ffksvg1oDEpMOWaJSX+LQbrz2OcS1jZI5+bBQGP24hgmVo6PpZgAlnkN6gndmit8wKZ075HMmuHekZvUxnbLRtvQx7cKcZoZbnjAgT58yZMU6soe3hIzLgD9CXzmWSAyueXSGWFNlgMI2SE6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(83380400001)(16576012)(36756003)(31686004)(8676002)(107886003)(26005)(2616005)(316002)(186003)(956004)(16526019)(478600001)(8936002)(6916009)(6486002)(66946007)(4326008)(31696002)(52116002)(86362001)(2906002)(66556008)(66476007)(5660300002)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlV2VkIvQzIxWWFEa1ZJU1hKV0dCaXBBSDhLWXo2NkM0WDBFMFFyZlhyT2Iw?=
 =?utf-8?B?dXdOVXV6dngwS2tRQzdHUXZISlZvYzBJSnhiWjkxc2JtN09ZbXpBcE5ETTll?=
 =?utf-8?B?QlBlZk50R21WcVcrRkJwSXRCM3Z4LzNYQVI4MUxwWmVqdnlmUjNvcW1teEpL?=
 =?utf-8?B?WjBqMkZxZHpxTDlSMGxtOXpEblpjbXFxT3lNTGNhOC9ObW1SYzJUckRPaE1p?=
 =?utf-8?B?WEdHVU8rZmYyWDhTOGZJYVU5ZXZ6TVU0ZlhlUnlwVWdqamlGbzBjYTdaa2pl?=
 =?utf-8?B?ZEpwQXgzd3Q0Z3Q4R3ZZOHpzbmhjUE13SWY4NExDdGw4c25yZ1lZOWJuNjln?=
 =?utf-8?B?UVdBRDFZbnlIb01nZDVmam8xWTBTSEpWZ2JDSE9EcEUyc3Y0OXkvVzRFUG5E?=
 =?utf-8?B?cUo5QnhsaVdvYTZ6aHZKblpacFVRdEx5YXI3WUtjY0xxZlNDMUQrcFBQL2RD?=
 =?utf-8?B?cGp6Tlk0T0JDWklvNk9heTVOV3gxdTA3a2p2WlMrQ25uc04wYUJvaUlEYXVk?=
 =?utf-8?B?Y2o0WHViZnBRRzEyVGRTVTl4WWdhd3NvakV4YjAwV0JrbXY1WkZnbU5VYmZP?=
 =?utf-8?B?WkJDU1NISkJrS1VzYWEvc0ZSaGE4Q3JrZGlSeW03OENDajJxSldMQnFkcGlr?=
 =?utf-8?B?dnpyNlpYdGhESVhsS01sdFVXNy9OdlZFTlV0MDRKemdjQWEybkRLQzlVVUp5?=
 =?utf-8?B?S2dkMnFGQTZCUVBqWVRYbC9QSkd5OVJqMmI1QnRLZWhRakxBY2YzaldiaW4v?=
 =?utf-8?B?N0tkdytiekd4a2ZXUk1Oc3hYWlE5emNXd2dFUmRVc2xUTngxb3l0Slk1L3Ir?=
 =?utf-8?B?ODMrMThBM05QSjdpYjI5TTBTMWd4TzQ0M3BEa3o1LzJjOUh4a0E2UGVadWpI?=
 =?utf-8?B?VTk3L2hNWU5VZE5RbDBqZ0lvVWFBaEdoSVpiWXlUZ1A4KzdyVGkzMDNNeE9y?=
 =?utf-8?B?WmJrVW5TQnM5Q0lFZm9WWXg4bkJ5UmF1aEYwbVcwNzgyc2swVGs1eWNWMUJM?=
 =?utf-8?B?MFRIeWxBSXR4bjFQUi82VzVNVi8rRGEzeG1iZmgrbjNpSjVPYkh4Q0I5TnFx?=
 =?utf-8?B?Rjd0UXBob3Z1UC9IcWVrclF5T0wxd0x4RkFoUzhmb0k5aGIrYmp1bHh6cXhZ?=
 =?utf-8?B?R0k1dSt2NTAxRnFScjJ3ZlVyMGpxb3Z5RU42QUl0ajEzakRNV01ZRGFTd1g5?=
 =?utf-8?B?RXNJTDJqMEpwaXNTNmxqR0FmaVdLTGhad1lKODZaMlhxZVMrelg0MUord0c0?=
 =?utf-8?B?cXdUaVNpWWcvVDlRa2FQZ3dpZU51cys0MkFPUDlGVk9rdzdKVU96V2lpbWV5?=
 =?utf-8?Q?hX48UN1wTWClyaC8P64pTk+NSM6KBvHtab?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3157a29-d6f7-4f12-17dc-08d8bbd852e1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:41:45.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QmJOzaT6al5g3lsuevUXtEz/yDJdYu7CmxmlJr7KMgHaba4+fxkDNWtFVcfrwW8D+Vtitdx6qVy4p54Qjqir8wZk9nQ2bAyzOOjQOHl0e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 19:50, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add simple transaction API to use in further update of block graph
>> operations.
>>
>> Supposed usage is:
>>
>> - "prepare" is main function of the action and it should make the main
>>    effect of the action to be visible for the following actions, keeping
>>    possibility of roll-back, saving necessary things in action state,
>>    which is prepended to the list. So, driver struct doesn't include
>>    "prepare" field, as it is supposed to be called directly.
> 
> So the convention is that tran_prepend() should be called by the
> function that does the preparation?

yes.

> Or would we call tran_prepend() and
> do the actual action in different places?
> 
>> - commit/rollback is supposed to be called for the list of action
>>    states, to commit/rollback all the actions in reverse order
>>
>> - When possible "commit" should not make visible effect for other
>>    actions, which make possible transparent logical interaction between
>>    actions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/transactions.h | 46 +++++++++++++++++++++
>>   util/transactions.c         | 81 +++++++++++++++++++++++++++++++++++++
>>   util/meson.build            |  1 +
>>   3 files changed, 128 insertions(+)
>>   create mode 100644 include/qemu/transactions.h
>>   create mode 100644 util/transactions.c
>>
>> diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
>> new file mode 100644
>> index 0000000000..a5b15f46ab
>> --- /dev/null
>> +++ b/include/qemu/transactions.h
>> @@ -0,0 +1,46 @@
>> +/*
>> + * Simple transactions API
>> + *
>> + * Copyright (c) 2020 Virtuozzo International GmbH.
>> + *
>> + * Author:
>> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef QEMU_TRANSACTIONS_H
>> +#define QEMU_TRANSACTIONS_H
>> +
>> +#include <gmodule.h>
>> +
>> +typedef struct TransactionActionDrv {
>> +    void (*abort)(void *opeque);
>> +    void (*commit)(void *opeque);
>> +    void (*clean)(void *opeque);
>> +} TransactionActionDrv;
> 
> s/opeque/opaque/
> 
>> +void tran_prepend(GSList **list, TransactionActionDrv *drv, void *opaque);
>> +void tran_abort(GSList *backup);
>> +void tran_commit(GSList *backup);
> 
> I'd add an empty line before a full function definition.
> 
>> +static inline void tran_finalize(GSList *backup, int ret)
>> +{
>> +    if (ret < 0) {
>> +        tran_abort(backup);
>> +    } else {
>> +        tran_commit(backup);
>> +    }
>> +}
> 
> Let's use an opaque struct instead of GSList here and...
> 
>> +#endif /* QEMU_TRANSACTIONS_H */
>> diff --git a/util/transactions.c b/util/transactions.c
>> new file mode 100644
>> index 0000000000..ef1b9a36a4
>> --- /dev/null
>> +++ b/util/transactions.c
>> @@ -0,0 +1,81 @@
>> +/*
>> + * Simple transactions API
>> + *
>> + * Copyright (c) 2020 Virtuozzo International GmbH.
>> + *
>> + * Author:
>> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "qemu/transactions.h"
>> +
>> +typedef struct BdrvAction {
>> +    TransactionActionDrv *drv;
>> +    void *opaque;
>> +} BdrvAction;
> 
> ...add a QSLIST_ENTRY (or similar) here to make it a type-safe list.
> 
> The missing type safety of GSList means that we should avoid it whenever
> it's easily possible (i.e. we know the number of lists in which an
> element will be). Here, each BdrvAction will only be in a single list,
> so typed lists should be simple enough.
> 

OK


-- 
Best regards,
Vladimir

