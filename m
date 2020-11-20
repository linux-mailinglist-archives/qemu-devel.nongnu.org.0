Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF82BA946
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:36:28 +0100 (CET)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4iJ-0007FP-Dz
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4hK-0006lE-1p
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:35:26 -0500
Received: from mail-eopbgr00107.outbound.protection.outlook.com
 ([40.107.0.107]:27185 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4hI-0001S6-31
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:35:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkWeEXjn6RV47d6ZgV86V66fVxbSqVPlSkkG6Ef8jDcJILwUuuBbZbCK243w9dAHEV0geBVullHNkxHOJjH1X3CiVr50sSqvifLpxF88vTu5hcQL5lhftcJLIafDcz0n2yah6s+UkIOsSP5bQhfYtAnFJvaPXr7b4YvRn0YuBWb5z6jSPiswMkZj9pVzdeY3sTMPbU3d7IQ1bUiCl46Wr27PhdaIenkkqeM2OeaiJAVUCOWCGvdIe1Bk+ZO00f46XmL8BCb3Jt/Euqf4RISzXGtuJAj8FqZ3losVNERbGbqZYdT7X/THZTxHd+vDYX+IdZpz51DwGs4ykEJ3lGSo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8CeNhzeKkx829+EPag/FyjzbntCNIRqeziygLn8Vz4=;
 b=iZnyDpw3baO5c/uFC9jQ0KSsrP/PvhUmH/ho90sTH++QAbBi/2+jHZKByWDy/He+lzK1YaFa+sk+mOEH75iJ6f/K/AMvhWQ8bHqM98e8yfCOctgJsFdyIgUH0hZialEel2tHI904BXBJSXo59hw9diAf6L5yvw47uUh9Gw45746Q+wMydujN0iyB0TqsE3cv5r757ofY+4uY5FAu9xaeGltLisIWDxXEYQuS+Jd/uJfAzX+O1LsJkML+/7uJqFOi/PGXZjTJkFvtdbd0hRtqZrVcNqBVI0mECXK+EdLpVxrkHi6a2FUv2gbhGdGqb57k5NHHTXiOsYWWY/z31adHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8CeNhzeKkx829+EPag/FyjzbntCNIRqeziygLn8Vz4=;
 b=uXI3auatyh8FVMuQy44kxD0eMdCC7Ob1rneT9euM1gPXUdTY8l+0/JsGPBhrC2Uf+tcOuWfsc//JVWZZIgqZDW7x0tR6vW4pGqIisiLdxgm06edh4ntSmBPAcjdagaYXhqlvrbfBMuBKYAeKIJu5te2dnNz3dkd0e4uM/AkKl4M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5712.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:35:20 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:35:20 +0000
Subject: Re: [PATCH v3 1/7] introduce 'track-writes-ram' migration capability
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
 <20201119185150.GF6538@xz-x1> <20201119190703.GG6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <6b5f3e2e-6e9b-d25a-2566-734bdc5bc1d5@virtuozzo.com>
Date: Fri, 20 Nov 2020 14:35:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119190703.GG6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0501CA0049.eurprd05.prod.outlook.com
 (2603:10a6:200:68::17) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0501CA0049.eurprd05.prod.outlook.com (2603:10a6:200:68::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:35:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14366d85-73e9-4cc2-da40-08d88d485c6d
X-MS-TrafficTypeDiagnostic: VE1PR08MB5712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB57127C0679D1D1A6F409AC699FFF0@VE1PR08MB5712.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iN7RRWEDzrMBns3RWis+HSjFdAE5ikcUeHPwdndSSYN72xI2+THIcf71CVoFGHFA3Q7E+bcXkl3IgVLeMhcCH+u1I4gz4yTlp6YrdX/YMJ0AzsEi3IU5gQGtjdjicYJDl4fTsHkpkVqM7vThvWGgQfZh7mEx9/CIhJuFNu0WJOss37P718uf5StKM8va4HliKYZcqvErVZt6ivHpApPmxXUWT3/OcuERaZf+/MSkjbzrSJgf56/8vSn12zmtjkh7muohKxI87fQe59EB9S15jOqHA8k2wl5n5k192sGurcrhUb14QPxZ+ChC0dY9yqytt+hMvXLQMy+Hv47w5Vhpu+jvGEXmCTEkXVDkf+Wrp0etsX+2lQDxLc5ahRFyighm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(66946007)(26005)(5660300002)(54906003)(6486002)(478600001)(16526019)(66556008)(66476007)(16576012)(186003)(52116002)(316002)(83380400001)(86362001)(2906002)(2616005)(4326008)(36756003)(31686004)(6916009)(53546011)(31696002)(956004)(44832011)(8936002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: KrIInX9adZEQvuGg5FAb3kf2sTtAxv/Pe+JlXfbnyioBeZLzznGadjRqkBMmh6s8vdk2E6UuxN5Zi+2JcPKqvewgqZ3cxb1nrbYpvtXU1RgrUIOnzgbkxeA+VswPgF5OVBJLmEOtydu84w4gDSpIpzK2ndruZm32ZeX+x8FCgmKp8mu+Hw64Dyi90KLiK09AFxYQDgkBd2rarY7l9tayPKxk0DN9lCc2SYMGp4dI+guV21AlgADD6WZl1hBHSRXndZg0IPqeGrkyTTSVNaLu6/o3I1dLvGAkAm8H3F9YvDK5lWsl6+zrNTWBrXsW0EP8nPVLnvjHenIG9Ap7H0jTYKQDPIpYKNEETMdNA3egmWgclWURD1eQNptJyNzcfODfidTT4wZKY5mrtqw7JD7t8TjP/OOPrnK9L8kNe2eiPX6PNnhDEDlobUN4QdgTke9j1R4Xbk1OgRsbypHOXMeEtCqrGHYP4KqpHOvSv4scc27UFAE/HfQOuEpqeiGfcH3ErOnwVg36Ev0Gv96sgPa9vdjn2AlgTp4MWm8QM3lUUphLRgj2CYzX8kH9p/PuOQxTNbbntUQJkchs/3zNCrO9QLMqjaxd2xbK74c+slRs8YnvorePdFF8mg3stRABYbY0sUeRSVu3iNumYq2Vc8p8NbbY42QRFzU1q9NyABNLpVtIu3kFtalAR4MIJJu46gFmq+z1Sq0fu7j878aobXvjiLPVNYGTPfmfoqm0sTnzXpRfU/ZEP8+lAQq+hHATbIj2xOhEhqRRh+PcZzfmBsSRSAQTSr5PYJs7u2vyvFu2dOzLxrueDA2DdhhwwM8/XYw50DITlqV2Xm0/73Tl0REtAmMGxWCVNpyhNXGfSeFD1pN2xkpGkNFw5jR7K4bdIAjo2JF+oXh6O2RsO1qE4sKumA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14366d85-73e9-4cc2-da40-08d88d485c6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:35:20.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0LiMTdnnvKRyCe2AkUOMt60KA6BIx4QSF7y8Gvjj3xjLPfVRlelhqT+TABzznAWNtYTWnHTxP96giAFUNlq39AybL6GVvXzwzBVikL/ELI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712
Received-SPF: pass client-ip=40.107.0.107;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

On 19.11.2020 22:07, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 01:51:50PM -0500, Peter Xu wrote:
>> On Thu, Nov 19, 2020 at 03:59:34PM +0300, Andrey Gruzdev via wrote:
>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>> ---
>>>   migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>>>   migration/migration.h |  1 +
>>>   qapi/migration.json   |  7 +++-
>>>   3 files changed, 103 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 87a9b59f83..ff0364dde0 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -56,6 +56,7 @@
>>>   #include "net/announce.h"
>>>   #include "qemu/queue.h"
>>>   #include "multifd.h"
>>> +#include "sysemu/cpus.h"
>>>   
>>>   #ifdef CONFIG_VFIO
>>>   #include "hw/vfio/vfio-common.h"
>>> @@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
>>>           }
>>>       }
>>>   
>>> +    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
>>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with postcopy-ram");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with dirty-bitmaps");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with postcopy-blocktime");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with late-block-activate");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with return-path");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>>> +            error_setg(errp, "Track-writes is not compatible with multifd");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with pause-before-switchover");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with auto-converge");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with release-ram");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with rdma-pin-all");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with compression");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with XBZLRE");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with x-colo");
>>> +            return false;
>>> +        }
>>> +
>>> +        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
>>> +            error_setg(errp,
>>> +                    "Track-writes is not compatible with validate-uuid");
>>> +            return false;
>>> +        }
> 
> Another thing forgot to mention - we can at least define an array for live
> snapshot now so we just loop over that one instead of copy-paste these lines...
> 

Yes, too many lines here, better to use 'compatibility array' here.

>>> +    }
>>> +
>>>       return true;
>>>   }
>>>   
>>> @@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
>>>       return s->parameters.block_incremental;
>>>   }
>>>   
>>> +bool migrate_track_writes_ram(void)
>>> +{
>>> +    MigrationState *s;
>>> +
>>> +    s = migrate_get_current();
>>> +
>>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
>>> +}
>>> +
>>>   /* migration thread support */
>>>   /*
>>>    * Something bad happened to the RP stream, mark an error
>>> @@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
>>>       DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>>>       DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>>>       DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>>> +    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
>>>   
>>>       DEFINE_PROP_END_OF_LIST(),
>>>   };
>>> diff --git a/migration/migration.h b/migration/migration.h
>>> index d096b77f74..339ae720e0 100644
>>> --- a/migration/migration.h
>>> +++ b/migration/migration.h
>>> @@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
>>>   int migrate_decompress_threads(void);
>>>   bool migrate_use_events(void);
>>>   bool migrate_postcopy_blocktime(void);
>>> +bool migrate_track_writes_ram(void);
>>>   
>>>   /* Sending on the return path - generic and then for each message type */
>>>   void migrate_send_rp_shut(MigrationIncomingState *mis,
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index 3c75820527..a28d8b7ee8 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -442,6 +442,11 @@
>>>   # @validate-uuid: Send the UUID of the source to allow the destination
>>>   #                 to ensure it is the same. (since 4.2)
>>>   #
>>> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
>>> +#                    of the VM exactly at the point when the migration
>>> +#                    procedure starts. The VM RAM is saved with running VM.
>>> +#                    (since 6.0)
>>> +#
>>
>> The name is slightly confusing to me.  Could I ask why changed from previous
>> one?  "snapshot" sounds a very necessary keyword to me here and tells exactly
>> on what we do...  Because we can do quite a few things with "trace-writes-ram"
>> but not snapshotting, e.g., to calculate per-vm dirty rates.
>>
>> -- 
>> Peter Xu
> 


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

