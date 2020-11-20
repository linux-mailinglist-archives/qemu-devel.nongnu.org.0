Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE52BA941
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:34:20 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4gF-0005pp-BH
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4ex-0005C4-W3
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:33:00 -0500
Received: from mail-eopbgr00134.outbound.protection.outlook.com
 ([40.107.0.134]:33092 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4es-0000bV-B4
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:32:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl1xHdI6pxgDtRFDwZrCp8eHyeU9ea2I/M6u7Q0iQ6n0BKZcyJFu4/1wGk/V2W26RFcg92PyYnyQK+IfvghzC+2rik5qiaJrS/Nfsa+Ig6Y0XqBWOXEJg8MBWL9gxfipmaGXx8FYZxwGQxeYIXe9RJRMPhn+bKlxbQe4hj2S9uau0r4uHL3o6KrNKpodHu9PU19yQWleiQ+OMQAMvl986eEPze41d2/cYGUq//vLigRsv4nADgfqQQzUwN1u9ezBIfGpOECWagcnhkoVVj++lDx80JM91v7v/hpcecimRwCoYf17t2OEJq0biNlO3T27kkYeQ8Q5eayzn/n5NhWhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2IVkLDRSet2TJt5g0y0YimeZ4CkZHRDamEbzIpEsGM=;
 b=l47jisuT9XeFGt8ExqjfWN2Pm9b6PVwiyzMpUn6cYhGA2x2I6DuZTMpAWvcDysR7RxMt4b985a9a+RWLAMjl46dEjgGbJzHMFEtld0sO0Wtyl4qK1NMJRyf3TsLXonsslLtjx2MpLjm0eioGOAxF7EArGaNSaqdjvM4bUq1L5MqMaXvGCJu/QVYSWGZJt2u4lcNySQ8kT0mcKRSxYf7pWN5GnO4j9cURuBdTwsggWA1s21d+hsQEMZc9hT8l1I/7LxHqP87bsGbhXYjkf6F8VhG4cqPS9JRbHLGcArH8/nlGAPf8NqZ6Th+pdbG+gvWWNGgrZcNMpfh1XrRSdkZNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2IVkLDRSet2TJt5g0y0YimeZ4CkZHRDamEbzIpEsGM=;
 b=tkhLbCBB7rDX3z8PE9HfybUgUArY9dpF/wyKUwmIaAwvrgyWYJJ+fcuslSilTH2Qu7osko30fu6VJM4mW5uenVGCYEeZPcZo3CiP/L8tTQ0ZfK53HzFVkIQxOmXyxhzVxzOYv+WD1QZxl4MG0azFg289rXG6lXjNHY+x/oPW2xY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5712.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:32:49 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:32:49 +0000
Subject: Re: [PATCH v3 1/7] introduce 'track-writes-ram' migration capability
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
 <20201119185150.GF6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <0f22b5bc-0c66-619b-2584-21c192ae43a4@virtuozzo.com>
Date: Fri, 20 Nov 2020 14:32:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119185150.GF6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::13) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:32:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e79bad-9962-4b6d-d4c0-08d88d48025b
X-MS-TrafficTypeDiagnostic: VE1PR08MB5712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5712F928BD767C44BE0418EC9FFF0@VE1PR08MB5712.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: md00n9j0+rYWMv8QxzX7IboqRGz4s0OhHq2U2YDsfSVrzjRLWoRjMlKri3kQ0Mb+hBIccQgTci3mpp8bb40eo8gUGdgUFP+29MvU3lCUplOA+eCkX6x5v40tlXZHXfGztC2mkqAX8PdoofYEOWLUXFIm/pDlkra3RzrapS42sfcSCXf54c+xG0CdY1vMwvGX126GLxgc1ZGyYHeRwJaC15/zF8rLqNUVhHqG2/dEGBcPIIR51Q5BHM15sz9USwRHGVSwpd0Y43lZ8gtVjF38RVj4GRmdLA6h74uek/5cQhzZsthha/17PlIoOcdJKNrOHI6FFJ2ley65fd1IH7mONQgq2wY8iY3jQ/Y4fQeGX50MCXYDxmbvY2QPwSuyVM91
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39830400003)(376002)(346002)(366004)(66946007)(26005)(5660300002)(54906003)(6486002)(478600001)(16526019)(66556008)(66476007)(16576012)(186003)(52116002)(316002)(83380400001)(86362001)(2906002)(2616005)(4326008)(36756003)(31686004)(6916009)(53546011)(31696002)(956004)(44832011)(8936002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: cEmdxLR39aAwlafLQ2YQJ716wsrHCbcgjLI8J80Zh4ynNpDZGnX9f3svG5jDdJGfZoldjryRfUHU1c6zbydEHIVPB7XVK5B1TD0tizTdzOYuY8o/SRv3m77pCmxikc9DkUEV4Od0iE7Z2QsaTI9Q6lvqfmmB/c3E0HMhBRevsyOji/XuWY0HIAJ/zK9tGpn7A5Su/tfilZa8bn5vvum4B36oPju9a0YDM5TO/3Xw+btxpDeP2motF7T3rKjI5cNq1joXm2rf/6ljFF20aimOPc6YpqojCPnpHB0IbmhOqhV1TA8f7urTI8OwhaLkE0ICH2PImBfv3pw3JdogBCCojOqECN3/uScG+pUn1VOZrqJfhek5p4Iv0rMxEXc2Jtis97H0zhuuaZCUo2qdlHpvTAkbDkacyjo+GNP6i1uJY3c2tsBj99zly6TiidG0KEiJ0yf36QZzDeX2WwCVLI6EWC8JjkXdwoZoP99cDTKP2d0ZgxMz64oR/hqlIIL5/y4wyWFBv9r1yNRY1cl6JDHd92bHz8232Q999o21YwNuOQSHLDJ+slAjf/PWmDimQrFjMFUesGBTqI6p/1hvymBHpGalg+PAHztQhTyPqcHvwuijv5uaO0iMcPTfzojhWZLYW7aUnxpXzJ//nIstDssufGGyOuRKSmmPF5P4f17JCF4oJU7dLkdsFeL0s0A0z6RPA2wa/RFSG5j6+F0I9hhz9qTRb4OURB09tiFZau5d3oVhv/GZ1jywiUwv46Y6KCqb+z3+mImlDyn2fFrMo7uinU1K3IWM2Q6A16vAQDG489j4wBTtQINWbJPsLInEkfahQlTb1N6tnUNdWKXJXLYXHVf0CAXdNOgqo4iXZkc0L+/wWjqVpnCPOWRmQdAmHjyWOvCzs+d153J+m4l4Go6DrA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e79bad-9962-4b6d-d4c0-08d88d48025b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:32:49.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmEeGgKk+R/F5W5qok/tWFw++LADoiexFAPLgKY5g38Gs1bvU62H5b1s5oJXFEA/8OLVhRRu5qGzv9lT+vQpJTRz738YRChMXR691iqdVwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712
Received-SPF: pass client-ip=40.107.0.134;
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

On 19.11.2020 21:51, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:34PM +0300, Andrey Gruzdev via wrote:
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>>   migration/migration.h |  1 +
>>   qapi/migration.json   |  7 +++-
>>   3 files changed, 103 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 87a9b59f83..ff0364dde0 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -56,6 +56,7 @@
>>   #include "net/announce.h"
>>   #include "qemu/queue.h"
>>   #include "multifd.h"
>> +#include "sysemu/cpus.h"
>>   
>>   #ifdef CONFIG_VFIO
>>   #include "hw/vfio/vfio-common.h"
>> @@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
>>           }
>>       }
>>   
>> +    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with postcopy-ram");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with dirty-bitmaps");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with postcopy-blocktime");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with late-block-activate");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with return-path");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>> +            error_setg(errp, "Track-writes is not compatible with multifd");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with pause-before-switchover");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with auto-converge");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with release-ram");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with rdma-pin-all");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with compression");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with XBZLRE");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with x-colo");
>> +            return false;
>> +        }
>> +
>> +        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
>> +            error_setg(errp,
>> +                    "Track-writes is not compatible with validate-uuid");
>> +            return false;
>> +        }
>> +    }
>> +
>>       return true;
>>   }
>>   
>> @@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
>>       return s->parameters.block_incremental;
>>   }
>>   
>> +bool migrate_track_writes_ram(void)
>> +{
>> +    MigrationState *s;
>> +
>> +    s = migrate_get_current();
>> +
>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
>> +}
>> +
>>   /* migration thread support */
>>   /*
>>    * Something bad happened to the RP stream, mark an error
>> @@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
>>       DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>>       DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>>       DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>> +    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
>>   
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>> diff --git a/migration/migration.h b/migration/migration.h
>> index d096b77f74..339ae720e0 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
>>   int migrate_decompress_threads(void);
>>   bool migrate_use_events(void);
>>   bool migrate_postcopy_blocktime(void);
>> +bool migrate_track_writes_ram(void);
>>   
>>   /* Sending on the return path - generic and then for each message type */
>>   void migrate_send_rp_shut(MigrationIncomingState *mis,
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 3c75820527..a28d8b7ee8 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -442,6 +442,11 @@
>>   # @validate-uuid: Send the UUID of the source to allow the destination
>>   #                 to ensure it is the same. (since 4.2)
>>   #
>> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
>> +#                    of the VM exactly at the point when the migration
>> +#                    procedure starts. The VM RAM is saved with running VM.
>> +#                    (since 6.0)
>> +#
> 
> The name is slightly confusing to me.  Could I ask why changed from previous
> one?  "snapshot" sounds a very necessary keyword to me here and tells exactly
> on what we do...  Because we can do quite a few things with "trace-writes-ram"
> but not snapshotting, e.g., to calculate per-vm dirty rates.
> 

Mm, the idea was that we introduce alternative mechanism of migration.. 
But it's really intended for snapshots only, correct. Yes, let's change 
the name to original one.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

