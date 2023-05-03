Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99E6F5B5A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:37:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEXW-0007XI-Co; Wed, 03 May 2023 11:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puEXL-0007UW-Sm
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:37:00 -0400
Received: from mail-mw2nam10on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::627]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1puEXJ-0004sY-AT
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:36:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3olrvP3ERNl+0VybNNQDd51tPA69DsTUoXkP6bWLYzRsNnDcm/oI3mzEx1TZF6sJqnxnRJFac/g5pbHHOaw1fH3HN6rr4gyrxGvUaktubWtpaWKsFCsn+OxAiQsFT7M+tuHCjDJ+yX/oPyVixjVp0o8zOQGShBUGJp1f1aAUZ1Ud2gUZUKMZm5bLGU9ulHXiZGB/JUQxxNe4sc/nkL1ALEZbl9gp6CcBtzLK2K7cZpXvyKNtkCSdDXiX2FfLoP+Wgfj7IR0ww98BdvuwwzAhr3nCU+8hZZV66lgTUQkef87bIbua9JBFW2X2IWG1jvz2o/BG9F43xXrnR7yHim7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjTMW4vvj+dj5PFM7fs39aFtMaUVI/X6WTasZnvYTlo=;
 b=Bx+mSmTut6hzrgAMLng6fT929harFf9Kl6PVPAdZt09lg3mEK1uoz5hK8EfkzdPHDF507Glql4pVF1oU4qoSA4+k7nWCaEKm7FgSNpsr8mJpJPHS8iZo9NBMcShe5BKbtPDnIbb8rbdqSSr0LfusHiKrEWKkEukNfH+GBw+Vwu3M1kan0PdnSsGSH/EZWGFXlte8SNDdS4eSsLa9HN0hReEkXSXlodfe255dTkl0oP7dOhFUge1A9P1/wjzDntybR8guEyDmIYL8VgYXyQprAZ93DNX0ocLtbXE4fUkcv4ysOqihxIi255XvQoHZGkTBCKvSLXjPgyeHWDh98zIFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjTMW4vvj+dj5PFM7fs39aFtMaUVI/X6WTasZnvYTlo=;
 b=iMWAKSohEqMhXlCsHrsAEixjy14lgz8t2S706ArZUStAe4o7PIr2NPIcBdl7kBoyQPWcHHVOiIHklhHPtP2m7/blBGLFN1uMpCMUURhceMKAS9CzelyPKcYWJDJRznqMx+rWPyK0TeynLuk1ObsS7gsmQmFKfF736CL8A4AIOk58ndESz3lYfVn5uIh7QYuQH6Q+PL2lS1VwMB8wpFu3ZAW3mg/zwk2PjgVm3+o1qDOENqHzDeX473jldzjxN9OMjDOTexLILf9hzYjXo5nvzS2n/SczcCjY07zEDQPvYDwzBiNq6IlaS4MflbfhYqIb6zh6StmRH6wWsKwAHKKfog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:36:53 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 15:36:53 +0000
Message-ID: <fdca2c13-f2b6-a521-af0d-7b7a37dbe95f@nvidia.com>
Date: Wed, 3 May 2023 18:36:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-4-avihaih@nvidia.com> <ZFGVBSYfFRZqorH1@x1n>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <ZFGVBSYfFRZqorH1@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0365.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::18) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9a184f-9e30-46bf-f5fd-08db4bec380a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrPYg+6FL0GWTbPPf5KqjMZ62PqYJ6TZE1hqP/gpO+4deOpP5ZP+DQaJ4UbR9GpYcPhNHSYiLoXAktkyvuMqgMiwuCYzGLx0hPHe6SQ0GJT6cI3DCycRPNBnjZdIFw5a/phDewqI3F7GTtk/Tt8vuNS2iEPjxGEi7tkxNF9l4/C02n/lVGYyQvGrGmsaRjeVldgl84me880uiQSMlyQGUpLG7IVIHQ46KPppVbj1gjjIHZA9Yx9ZGCykI8k3x2IAdXFJLq8//Hc5XYwVSIk7ehrcMyOGjq6UwTTLo1FxeErR/y0jmmoP9zK+qj1p2PzNAvT8ZYwrjerGR2Rk9DCfSpGiwswtfhrrNJbG74+9+YpyqrDTR2oXe8eZRmX2SJqlvlymqSQgROmqlScY0yuEtsz/i2A6ioEcUttUfq/tOZburtwFriO4pHjKpaOY4I/Ltet1f8WooeC0iAqM1x4X61ulOomRLOVM4yEfZB7BiwybIm1E+Ieqd93Q1ws4eaqbsRgL+0c5cCL6Hs9fh4J5iUTuBItBCYOKwv7oPX28hx79WbK40qOgXqRqE6UGiHwD/9u7X8XYJUQ+9TwACCYguaXpuPwSlJBtj+z9sCQaJwTEvWHS3j3d5OP75BYC0JGjxV33Q9LkxnYZOqIYOFdSNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199021)(6666004)(6486002)(83380400001)(2906002)(6916009)(30864003)(6512007)(26005)(6506007)(53546011)(186003)(478600001)(31686004)(36756003)(2616005)(54906003)(41300700001)(66476007)(66556008)(66946007)(38100700002)(316002)(8676002)(8936002)(7416002)(86362001)(5660300002)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm83Q21YYnh2MUZ3TVdJUDdkc2FZSmNPd2hXNVp0dk1LM0Fja3p1MnBaOXlO?=
 =?utf-8?B?ckxGNWVPSzlIdFhocVhjdEx2MkgrSDNIOFBsNXl0THM3YU5sTGNMWjFJRkdz?=
 =?utf-8?B?Z1BtNzNpMklGaThJc2JtUFVMbXN4NVpyZzZ5RHkyaHZYR09zRjRUQ0Q0Z2FX?=
 =?utf-8?B?clROS0FLZWRtZ1hPM2JlMDlITlRaSnBYbkpZRy9FKzlhYlpMVnJvRFVKNjFi?=
 =?utf-8?B?MzF1M1dQZmxxTmlQM2pEMjBLM0JyeURwVUpOeWhkU2FWOUEvc29CV1hXNkZn?=
 =?utf-8?B?N3Vrb0pla0xRYk9nWXlwbEF5MVpLRGU2bTY2a0dOWTBaNUtRRE1URnBKSzNS?=
 =?utf-8?B?R3IyQ1RDdTd3RldwUk13ZzZjT1lnU2dKSkcxL1pkeXpBL0p6N2p6RmR4MjNC?=
 =?utf-8?B?eDVRUDh1QmhMMVQ0RFlWR1U1dWZSdVNad1VTWXZiZVBpdUdsemVsL2xxaTU3?=
 =?utf-8?B?R2k1NGF6ZUZ6WitWME5TQTk5K0NYMmFURU5TUzlmL1lKZ2tvdXRpM2VwMjZQ?=
 =?utf-8?B?b3grcWx0TmQ3UXZGcStXY0dJbnJzWWFzUFpiNlVSKzdDenNhRVMzbjRpVEtP?=
 =?utf-8?B?c2YzZFJlcHNURVdNUDJLa0VteDVIbkExZXR3RHBqczZRUkZzZjRSNWJOUTg5?=
 =?utf-8?B?dkxNSFM5VjZNU2lLOW8zVk9Tb2QwVlBXbEhINGtPeTl2Z2hwTXpHWUMxbzlp?=
 =?utf-8?B?TE5lOXd4WmMwbnlncStaVExpWXkxS2gyZmJRK0lUYlZ2ZVBBRXJUclpqNHJ0?=
 =?utf-8?B?Mk1sdm9veUhIMGxZU2tSQXJmYndGdmh5SUp0Tnd2U094SXdkb01lekFDbXhq?=
 =?utf-8?B?bzVvaCs1N0M2UlBKZUxGYklxTnVSeTBLTGw4VnpMK0xzRXhHNS9PQmZKOWh6?=
 =?utf-8?B?MUdzNVp5bHByQ2dNMzdCODJRSG1wZ015N3p5VW10azc4MzE0Z3gvc2lqaXFs?=
 =?utf-8?B?bmQ3MUhDYkl2VHh2bytkVmRzaDJZL2pTZmpsWm1tOVl0SERWSkx1azhYYVRt?=
 =?utf-8?B?VlBYQ29pYnlOa0N3SElkdUtVbFJON3VsaG1rMkNPa0pGWE8vcDVpUFo5WFVY?=
 =?utf-8?B?Y3ZHTjFLdkU1bUpvN3J0aHZma0VEUm05cnpNUjFWenBublBFWk1JMERTRm1r?=
 =?utf-8?B?Z3BCNW9IMDdKVkIyMFhPbHl1V3hGRUQ1aklxa2xHcHdWS2FjNVM3eXg0YXln?=
 =?utf-8?B?QVh6Zmt2U2szZzc1MmZWY1Vub09GOVJ1WURMUnJybVZoSHdwRWJqaXJPaUp6?=
 =?utf-8?B?MDZmemtvM2pMWkVBYzRNT2ZrWDFrcXNlZitsSFdGbHZkZThaVkdudVFSNXVz?=
 =?utf-8?B?bnY1blBzOXlHb3FPZkttMDhhNGZPVFQxWk04a1lhR2dMbDVUbFBIV3Q4cXox?=
 =?utf-8?B?ejRDK1h0ZTltS1JTRzl6Z1dlbGt3TWd5QThFUHFaOCt3Y0tlcUVVYmxRTGwx?=
 =?utf-8?B?SENiS2M4cUVpWnlkR1A0dE96VzJxVHg5MFBPaFc4U3FGaEIwZzBLRUJVRDBx?=
 =?utf-8?B?d1lJcWZ4eDRvODdiSmVIVkoxWlBPTFdLYXdFcGRPaXpFNG52WEY1NUJSZjhk?=
 =?utf-8?B?RVZuL3FXcjhzYWRiZTRkdWhtZ3NjMUVSblNnZ0JlWVhOSFByRHVYaTdScFVI?=
 =?utf-8?B?b0pEbVVYaXM4cUlEaTJOaXhadzM3MWpGTEtQTFhNVm1WUmhibVdmcndsc1ZZ?=
 =?utf-8?B?ZkNxYWlDQUtKK0pqdTNwaUovWWVabzRWZzNneFQvUXFaNm9CS3Fnd2JYU3Qv?=
 =?utf-8?B?RnllSWEwNDQ3Q0lmYUlwdko1UnZxUW1tNytTSlRoN3VEUGwxdFZ4S3poRng5?=
 =?utf-8?B?cXl0Q3JWR2lVbFQwN3J2UmxaTW1xajlmeHpDV0lpSjY5Q3Q3T2JkdHJSY2NY?=
 =?utf-8?B?S2hvd200UGk4dktna0k5VjJtYWRZZGxyL1NCRFh0NkZNRmFnNTZ0VDdqOHB4?=
 =?utf-8?B?R3V1WkRlWDBuTG1aQW8xakZxdjE0bURMWWpUNXprZXIrWHFmODhtdHg4dmk1?=
 =?utf-8?B?MUpHblp4enQ4Q3ZabHZjME85YWc2ZmRVcENGQTlGVjF2b0xjYjI3MDN5cWxj?=
 =?utf-8?B?UzVwMG93TDBDeUxwTENaN0srQ2MxTzNwV1FhcGIxRElYcE9qMmdCS3BySUlv?=
 =?utf-8?Q?UWLxuI77uFVudkEjq+S+xUQz5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9a184f-9e30-46bf-f5fd-08db4bec380a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:36:53.0761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGn8jP/B6MRIq571CifTqtFkduPziBqvopGF4bA2m8xOx6BjaMBBdJ+QdhGe4n4eCpS238gil0S+pfRBsnnwkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729
Received-SPF: softfail client-ip=2a01:111:f400:7e89::627;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 03/05/2023 1:56, Peter Xu wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, May 01, 2023 at 05:01:36PM +0300, Avihai Horon wrote:
>> Add the core functionality of precopy initial data, which allows the
>> destination to ACK that initial data has been loaded and the source to
>> wait for this ACK before completing the migration.
>>
>> A new return path command MIG_RP_MSG_INITIAL_DATA_LOADED_ACK is added.
>> It is sent by the destination after precopy initial data is loaded to
>> ACK to the source that precopy initial data has been loaded.
>>
>> In addition, two new SaveVMHandlers handlers are added:
>> 1. is_initial_data_active which indicates whether precopy initial data
>>     is used for this migration user (i.e., SaveStateEntry).
>> 2. initial_data_loaded which indicates whether precopy initial data has
>>     been loaded by this migration user.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   include/migration/register.h |  7 ++++++
>>   migration/migration.h        | 12 +++++++++++
>>   migration/migration.c        | 41 ++++++++++++++++++++++++++++++++++--
>>   migration/savevm.c           | 39 ++++++++++++++++++++++++++++++++++
>>   migration/trace-events       |  2 ++
>>   5 files changed, 99 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/migration/register.h b/include/migration/register.h
>> index 0a73f3883e..297bbe9f73 100644
>> --- a/include/migration/register.h
>> +++ b/include/migration/register.h
>> @@ -77,6 +77,13 @@ typedef struct SaveVMHandlers {
>>        * true if it's supported or false otherwise. Called both in src and dest.
>>        */
>>       bool (*initial_data_advise)(void *opaque);
>> +    /*
>> +     * Checks if precopy initial data is active. If it's inactive,
>> +     * initial_data_loaded check is skipped.
>> +     */
>> +    bool (*is_initial_data_active)(void *opaque);
>> +    /* Checks if precopy initial data has been loaded in dest */
>> +    bool (*initial_data_loaded)(void *opaque);
>>   } SaveVMHandlers;
>>
>>   int register_savevm_live(const char *idstr,
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 4f615e9dbc..d865c23d87 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -207,6 +207,11 @@ struct MigrationIncomingState {
>>
>>       /* Indicates whether precopy initial data was enabled and should be used */
>>       bool initial_data_enabled;
>> +    /*
>> +     * Indicates whether an ACK that precopy initial data was loaded has been
>> +     * sent to source.
>> +     */
>> +    bool initial_data_loaded_ack_sent;
>>   };
>>
>>   MigrationIncomingState *migration_incoming_get_current(void);
>> @@ -435,6 +440,12 @@ struct MigrationState {
>>
>>       /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
>>       JSONWriter *vmdesc;
>> +
>> +    /*
>> +     * Indicates whether an ACK that precopy initial data was loaded in
>> +     * destination has been received.
>> +     */
>> +    bool initial_data_loaded_acked;
>>   };
>>
>>   void migrate_set_state(int *state, int old_state, int new_state);
>> @@ -475,6 +486,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
>>   void migrate_send_rp_recv_bitmap(MigrationIncomingState *mis,
>>                                    char *block_name);
>>   void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value);
>> +int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis);
>>
>>   void dirty_bitmap_mig_before_vm_start(void);
>>   void dirty_bitmap_mig_cancel_outgoing(void);
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 68cdf5b184..304cab2fa1 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -77,6 +77,11 @@ enum mig_rp_message_type {
>>       MIG_RP_MSG_RECV_BITMAP,  /* send recved_bitmap back to source */
>>       MIG_RP_MSG_RESUME_ACK,   /* tell source that we are ready to resume */
>>
>> +    MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, /*
>> +                                         * Tell source precopy initial data is
>> +                                         * loaded.
>> +                                         */
>> +
>>       MIG_RP_MSG_MAX
>>   };
>>
>> @@ -756,6 +761,12 @@ bool migration_has_all_channels(void)
>>       return true;
>>   }
>>
>> +int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis)
>> +{
>> +    return migrate_send_rp_message(mis, MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, 0,
>> +                                   NULL);
>> +}
>> +
>>   /*
>>    * Send a 'SHUT' message on the return channel with the given value
>>    * to indicate that we've finished with the RP.  Non-0 value indicates
>> @@ -1401,6 +1412,8 @@ void migrate_init(MigrationState *s)
>>       s->vm_was_running = false;
>>       s->iteration_initial_bytes = 0;
>>       s->threshold_size = 0;
>> +
>> +    s->initial_data_loaded_acked = false;
>>   }
>>
>>   int migrate_add_blocker_internal(Error *reason, Error **errp)
>> @@ -1717,6 +1730,9 @@ static struct rp_cmd_args {
>>       [MIG_RP_MSG_REQ_PAGES_ID]   = { .len = -1, .name = "REQ_PAGES_ID" },
>>       [MIG_RP_MSG_RECV_BITMAP]    = { .len = -1, .name = "RECV_BITMAP" },
>>       [MIG_RP_MSG_RESUME_ACK]     = { .len =  4, .name = "RESUME_ACK" },
>> +    [MIG_RP_MSG_INITIAL_DATA_LOADED_ACK] = { .len = 0,
>> +                                             .name =
>> +                                                 "INITIAL_DATA_LOADED_ACK" },
>>       [MIG_RP_MSG_MAX]            = { .len = -1, .name = "MAX" },
>>   };
>>
>> @@ -1955,6 +1971,11 @@ retry:
>>               }
>>               break;
>>
>> +        case MIG_RP_MSG_INITIAL_DATA_LOADED_ACK:
>> +            ms->initial_data_loaded_acked = true;
>> +            trace_source_return_path_thread_initial_data_loaded_ack();
>> +            break;
>> +
>>           default:
>>               break;
>>           }
>> @@ -2704,6 +2725,20 @@ static void migration_update_counters(MigrationState *s,
>>                                 bandwidth, s->threshold_size);
>>   }
>>
>> +static bool initial_data_loaded_acked(MigrationState *s)
>> +{
>> +    if (!migrate_precopy_initial_data()) {
>> +        return true;
>> +    }
>> +
>> +    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
>> +    if (!runstate_is_running()) {
>> +        return true;
>> +    }
>> +
>> +    return s->initial_data_loaded_acked;
>> +}
>> +
>>   /* Migration thread iteration status */
>>   typedef enum {
>>       MIG_ITERATE_RESUME,         /* Resume current iteration */
>> @@ -2719,6 +2754,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>   {
>>       uint64_t must_precopy, can_postcopy;
>>       bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>> +    bool initial_data_loaded = initial_data_loaded_acked(s);
>>
>>       qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
>>       uint64_t pending_size = must_precopy + can_postcopy;
>> @@ -2731,7 +2767,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>           trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
>>       }
>>
>> -    if (!pending_size || pending_size < s->threshold_size) {
>> +    if ((!pending_size || pending_size < s->threshold_size) &&
>> +        initial_data_loaded) {
>>           trace_migration_thread_low_pending(pending_size);
>>           migration_completion(s);
>>           return MIG_ITERATE_BREAK;
>> @@ -2739,7 +2776,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>
>>       /* Still a significant amount to transfer */
>>       if (!in_postcopy && must_precopy <= s->threshold_size &&
>> -        qatomic_read(&s->start_postcopy)) {
>> +        initial_data_loaded && qatomic_read(&s->start_postcopy)) {
>>           if (postcopy_start(s)) {
>>               error_report("%s: postcopy failed to start", __func__);
>>           }
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 2740defdf0..7a94deda3b 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2504,6 +2504,39 @@ static int loadvm_process_command(QEMUFile *f)
>>       return 0;
>>   }
>>
>> +static int qemu_loadvm_initial_data_loaded_ack(MigrationIncomingState *mis)
>> +{
>> +    SaveStateEntry *se;
>> +    int ret;
>> +
>> +    if (!mis->initial_data_enabled || mis->initial_data_loaded_ack_sent) {
>> +        return 0;
>> +    }
>> +
>> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>> +        if (!se->ops || !se->ops->initial_data_loaded) {
>> +            continue;
>> +        }
>> +
>> +        if (!se->ops->is_initial_data_active ||
>> +            !se->ops->is_initial_data_active(se->opaque)) {
>> +            continue;
>> +        }
>> +
>> +        if (!se->ops->initial_data_loaded(se->opaque)) {
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    ret = migrate_send_rp_initial_data_loaded_ack(mis);
>> +    if (!ret) {
>> +        mis->initial_data_loaded_ack_sent = true;
>> +        trace_loadvm_initial_data_loaded_acked();
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   /*
>>    * Read a footer off the wire and check that it matches the expected section
>>    *
>> @@ -2826,6 +2859,12 @@ retry:
>>               if (ret < 0) {
>>                   goto out;
>>               }
>> +
>> +            ret = qemu_loadvm_initial_data_loaded_ack(mis);
>> +            if (ret < 0) {
>> +                goto out;
>> +            }
> This is slightly hacky - it gets called for every END section.
>
> Please consider something cleaner, e.g., feel free to consider a
> notification mechanism I mentioned in my reply to the cover letter, so it's
> called only if the device is ready for switchover (no matter what interface
> it'll use).

Sure. Your notification suggestion sounds much better. I will use it.

Thanks.

>> +
>>               break;
>>           case QEMU_VM_COMMAND:
>>               ret = loadvm_process_command(f);
>> diff --git a/migration/trace-events b/migration/trace-events
>> index 21ae471126..a0e1d3b2fd 100644
>> --- a/migration/trace-events
>> +++ b/migration/trace-events
>> @@ -24,6 +24,7 @@ loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s:
>>   loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
>>   loadvm_process_command_ping(uint32_t val) "0x%x"
>>   loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
>> +loadvm_initial_data_loaded_acked(void) ""
>>   postcopy_ram_listen_thread_exit(void) ""
>>   postcopy_ram_listen_thread_start(void) ""
>>   qemu_savevm_send_postcopy_advise(void) ""
>> @@ -182,6 +183,7 @@ source_return_path_thread_loop_top(void) ""
>>   source_return_path_thread_pong(uint32_t val) "0x%x"
>>   source_return_path_thread_shut(uint32_t val) "0x%x"
>>   source_return_path_thread_resume_ack(uint32_t v) "%"PRIu32
>> +source_return_path_thread_initial_data_loaded_ack(void) ""
>>   migration_thread_low_pending(uint64_t pending) "%" PRIu64
>>   migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
>>   process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
>> --
>> 2.26.3
>>
>>
> --
> Peter Xu
>

