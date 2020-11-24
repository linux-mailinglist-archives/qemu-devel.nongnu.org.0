Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FC2C2E75
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:28:00 +0100 (CET)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khc6d-0008As-8Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khc4G-000756-Sr
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:25:28 -0500
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128]:33895 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1khc4D-0003Er-M1
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:25:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhY0WBgfwnoPmNN4FIm8ses3p8uethTabnDfgklQyide+sEt0UNiIz/jetGU9GNaT4dCVT26UAdFMWFPtgVL/WjT2NKdGLXaSMdrCb9sUQv91D14ZpheajuggSwqjlOL72OTzIH4U5P5xhK5h+rw/Qg5t6uDJkvsE/yFOsyiL3AAy5O57waEBDWM8Bvy2pNZNgtn2AbjTbCt8EcSfdLZRqiaSufbik1KNJBcvI/dIh+ixw7tHCqc9uUcbhDW3uCJgI/ZO5ltK6AeJfuNPKJ8UxM4gcEmRithdXWXveG007/B1qVKK3MpNhhce+wLpZzWpRLO9BJoV3DDWWy0YV353Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp0U0MDdMJDu/VAy7mgwExlDv+Btc5XEH0RpzWebcDY=;
 b=aStp1QGXzXHj3wSLASP5Dw8qK0Pu3Zhk9ldEfyzQcJgL/AH02Cjk4Qsp8xTAWZZPaKulDU5VziwX/ZC4/qPNkJltSs0e4FeKzLxyd+Be1NAGSj62YGw79JS5+CqHtJaL0ebCNSwyMz0xbAWvoGUYoGYr2KRT84+gmW/WxB8RuexXtTMLd32cjdm8qXksETwuG8nO5Bwek8h1t2xjem4zNS+5HhSYl+R7kN1P/F2DOgKveiGt9p0rUy4D10/lLoKpCnlh31tevHrkUDJ4WNf6epPqWUV4Q1Y6TmXcgIEHw14TmgJIVDrEjAfFeF0lsB/Cz0MQd4yKp0MEjmXjS9uEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp0U0MDdMJDu/VAy7mgwExlDv+Btc5XEH0RpzWebcDY=;
 b=cy19bFLjq6Oa9XFaPlmdjKLEKoxnal4MjaUL8ugmoHdSPJLyJnhleiBRV2aXy3djCOmctFbhpwUbiOnColzYN3U6bekydByyo4lK1HewmbS45Z9qce+hMlm+QimS55L9hwzQ7cKTgJmXPuL8eTYIHIsFnHtV2Go9fb5MGDBLXOg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5789.eurprd08.prod.outlook.com
 (2603:10a6:800:1b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 24 Nov
 2020 17:25:21 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 17:25:21 +0000
Subject: Re: [PATCH v3 1/7] introduce 'track-writes-ram' migration capability
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
 <20201119185150.GF6538@xz-x1> <20201119190703.GG6538@xz-x1>
 <20201124165511.GJ3366@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <7e617fc7-44eb-5bd9-5dde-b69ccb131163@virtuozzo.com>
Date: Tue, 24 Nov 2020 20:25:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201124165511.GJ3366@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Tue, 24 Nov 2020 17:25:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3adecec-6134-4494-1276-08d8909debc8
X-MS-TrafficTypeDiagnostic: VE1PR08MB5789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB578981A359CA7DE6742654579FFB0@VE1PR08MB5789.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dxJ5y8Wm8/kPWnUUq77vPEkqcBG8bV+ykpEA6ljyujOiEDv0lY+QBd5s0eH35IpaqeW3uVTqDQUF6Dq4yHSxBRKjIQCemvfF/T8oXv4LjOns021OuhCShlw9jW8UrvCjklYMRRq0F7+KfrOFLqi2qqI39/45Hp15YfIHskMPU2gBhliUxxeZ5R1r0JvmIjkt+C2b6lSTK1/B6esflE6EX+Yp6hztG0PUcyneOdmGrE7s/QOV0mSfBajSYZJrFcKse4AVD33qm5v1ctA6xdXkEd3hguHuY7miyBlQjIZF5LteNcLv3QKQ31NhxKyBR86zsSqOV978Gx55xT/nikK8dZ3AA7wj35Os9qCRnm3ViuISNaU1VFmoWNOsHR+RQJ5n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(956004)(36756003)(44832011)(66476007)(66946007)(31686004)(66556008)(8936002)(8676002)(6486002)(86362001)(2616005)(31696002)(478600001)(83380400001)(5660300002)(110136005)(16576012)(16526019)(54906003)(4326008)(316002)(53546011)(52116002)(26005)(2906002)(186003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ull3OEdhRDRlN1BUOVR6YjdxUGZzVFZLUHMxbmRGaW9aWEhpZWlpcHBFUWhJ?=
 =?utf-8?B?WERtSERmNDcvTjdlQ0RXT1VFT01QbzIrWXFDMzlxL2srUDF6UDJVaWNuRTc5?=
 =?utf-8?B?bzZlKy83dVdWRmJhMjIxVnFBRXEzQkRPb2JBS1l2VG5xMXYyTjZJdXRYdUdR?=
 =?utf-8?B?VUVjamhqYlloTjNDSzI1TUcvT1JZMXBLb01Sb3c4MzNrcFBKVHJBdVo3NjlI?=
 =?utf-8?B?aXFDNnBUYkU5RFJoVkZCN0dZTVRLTTZtamlXcmVlbC9zYlFpNVRrUmNYKzVv?=
 =?utf-8?B?T3NkVGV5cHJ5a0hZLzNpUHB0M1BWWTY4SjlXbklHWUg2M1FzVlljT2lPZnhn?=
 =?utf-8?B?amRwenVtM3NIUVdRbVVhYUMzaHNPaGJCbm4rQmRZanpDcjdIK1BjTzA1WUlk?=
 =?utf-8?B?U2dwcGV0bkRZVk9EMWZZbEpYWU9lSkFsazlBMUZ2emRVYUVBVVc0YVRidVkz?=
 =?utf-8?B?OEJNRXIvcER0TTRHQjEwWWExalhialB5bm1WUHdxWFpjR2daYVJ0N0REYVhR?=
 =?utf-8?B?Q2NUa1Bhc1ZZKzVHUFJBYW5wZFd5R2Y5WmZjSWNhRVF6cXhKRmlFek0zeXF4?=
 =?utf-8?B?di9kSGozTi9HdUtmLzZRRU4yRjEzV1YranJab3Y0NXdBVlJVU1ljejZoQm1S?=
 =?utf-8?B?Lyt0Ykk3YWJFbkxxeFlPOUNGenVqemZCV2dmVFlwckZkQnBMTjhEQkk2SGpj?=
 =?utf-8?B?VWF5UHR0MGFDWkhuT25zQjBNSHNDWXFueGlYbHRIU1A3NFA0N0N5cmxZTkRu?=
 =?utf-8?B?TzlBdTUwckRFQkxNMjNiU1FiSXZQWDI1VjMvTm5GdGJlZkZiUlZHSzBSOWJ6?=
 =?utf-8?B?L3FnNHk3SGVMOGI1Ky95MENkWUtISlhidmNpTGxGQU0wM29aZlA3c0F4ZW9j?=
 =?utf-8?B?ajIwY2JNOXBUR3QzWXlNc1lPdlpLOWp1VTRKby9IdzYrUHhZT05YQ1JiL1Bz?=
 =?utf-8?B?enZiYTI3dkxzMS9XSGJXbFFnWEplNnhPaEJIamdsMXllMFJISUpjY2ZQUzVw?=
 =?utf-8?B?TDBHUXM4Rzk1SXA5SFFaYU5QazBmM3NjTWoxNFlCVHhCdUJ1Y1JoMmZ6Nytl?=
 =?utf-8?B?RDZoOEN4TGZHUDRuTmFWOWtHMDZQWHJ1by9TL2IrOGk3MzQ2cHE5SFZUalRX?=
 =?utf-8?B?MWJIMlhVbEpNWWhiRHVJUk13LzRjdmtnTFVacnA4bmxzVTlBUmFTWGtvOUFt?=
 =?utf-8?B?R1YrZGhqdC9OdmpJWk0zOTNRYnBiRDY3U3phdnFWRUM1Y0U2RDJMVlExLzNv?=
 =?utf-8?B?MEJ2U3dzdE02Q3Vpdk9sNkQ1Q2N6T3NrbEhQRDFPbStWM2ZvK29KQ0Y0N0lL?=
 =?utf-8?Q?oIiwcNGM5FnOg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3adecec-6134-4494-1276-08d8909debc8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 17:25:21.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BR7wKHJoBUAW5jDevQ6bZBFwtFMYmsjT3Ky30XTRJWqe736O7NW0QDC+iUKFRl7J13BOP2AG4xNPduVR1WLF1O7ov4ZiHaCbEkjagHSLpSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789
Received-SPF: pass client-ip=40.107.6.128;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

On 24.11.2020 19:55, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
>> On Thu, Nov 19, 2020 at 01:51:50PM -0500, Peter Xu wrote:
>>> On Thu, Nov 19, 2020 at 03:59:34PM +0300, Andrey Gruzdev via wrote:
>>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>>> ---
>>>>   migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>>>>   migration/migration.h |  1 +
>>>>   qapi/migration.json   |  7 +++-
>>>>   3 files changed, 103 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 87a9b59f83..ff0364dde0 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -56,6 +56,7 @@
>>>>   #include "net/announce.h"
>>>>   #include "qemu/queue.h"
>>>>   #include "multifd.h"
>>>> +#include "sysemu/cpus.h"
>>>>   
>>>>   #ifdef CONFIG_VFIO
>>>>   #include "hw/vfio/vfio-common.h"
>>>> @@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
>>>>           }
>>>>       }
>>>>   
>>>> +    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
>>>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with postcopy-ram");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with dirty-bitmaps");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with postcopy-blocktime");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with late-block-activate");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with return-path");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>>>> +            error_setg(errp, "Track-writes is not compatible with multifd");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with pause-before-switchover");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with auto-converge");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with release-ram");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with rdma-pin-all");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with compression");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with XBZLRE");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with x-colo");
>>>> +            return false;
>>>> +        }
>>>> +
>>>> +        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
>>>> +            error_setg(errp,
>>>> +                    "Track-writes is not compatible with validate-uuid");
>>>> +            return false;
>>>> +        }
>>
>> Another thing forgot to mention - we can at least define an array for live
>> snapshot now so we just loop over that one instead of copy-paste these lines...
> 
> Yes, I think we've already got a name lookup
> (MigrationCapability_lookup - that's generated during build), so if you
> just have an array of MigrationCapability's you should be able to loop
> over them.
> 
> Dave
> 

Yes, totally agree, already changed to loop-through incompatible caps 
array. Names are easy to lookup, found it.

Andrey

>>>> +    }
>>>> +
>>>>       return true;
>>>>   }
>>>>   
>>>> @@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
>>>>       return s->parameters.block_incremental;
>>>>   }
>>>>   
>>>> +bool migrate_track_writes_ram(void)
>>>> +{
>>>> +    MigrationState *s;
>>>> +
>>>> +    s = migrate_get_current();
>>>> +
>>>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
>>>> +}
>>>> +
>>>>   /* migration thread support */
>>>>   /*
>>>>    * Something bad happened to the RP stream, mark an error
>>>> @@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
>>>>       DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>>>>       DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>>>>       DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>>>> +    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
>>>>   
>>>>       DEFINE_PROP_END_OF_LIST(),
>>>>   };
>>>> diff --git a/migration/migration.h b/migration/migration.h
>>>> index d096b77f74..339ae720e0 100644
>>>> --- a/migration/migration.h
>>>> +++ b/migration/migration.h
>>>> @@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
>>>>   int migrate_decompress_threads(void);
>>>>   bool migrate_use_events(void);
>>>>   bool migrate_postcopy_blocktime(void);
>>>> +bool migrate_track_writes_ram(void);
>>>>   
>>>>   /* Sending on the return path - generic and then for each message type */
>>>>   void migrate_send_rp_shut(MigrationIncomingState *mis,
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 3c75820527..a28d8b7ee8 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -442,6 +442,11 @@
>>>>   # @validate-uuid: Send the UUID of the source to allow the destination
>>>>   #                 to ensure it is the same. (since 4.2)
>>>>   #
>>>> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
>>>> +#                    of the VM exactly at the point when the migration
>>>> +#                    procedure starts. The VM RAM is saved with running VM.
>>>> +#                    (since 6.0)
>>>> +#
>>>
>>> The name is slightly confusing to me.  Could I ask why changed from previous
>>> one?  "snapshot" sounds a very necessary keyword to me here and tells exactly
>>> on what we do...  Because we can do quite a few things with "trace-writes-ram"
>>> but not snapshotting, e.g., to calculate per-vm dirty rates.
>>>
>>> -- 
>>> Peter Xu
>>
>> -- 
>> Peter Xu
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

