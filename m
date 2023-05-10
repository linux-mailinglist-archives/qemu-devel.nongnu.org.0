Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E66FE1A8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:38:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwltT-0002GH-KZ; Wed, 10 May 2023 11:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwltR-0002FV-8k
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:38:17 -0400
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com
 ([40.107.92.43] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwltO-0001di-Na
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:38:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM92/nUxIsbB7kvFvWFMvUcSxemyg/wsq83700iFvWEmhFqSi6/hhJSR55qrO9sHUJepgIRSQFnnbPdrUBEzp6EX5fFyVZ/bWzD6VfOYkjYD2f94NunGHHPqSyI5CshhWbEbiGd9Xv3bPvj9yN9DgbuRBJdOxugKKR5QyRmda/6sx6scprNZNmYAa6+864MJhfTVwrv8HiMeNnokweUPfD58G3//cInVwAWlGdgS6GmXs6+j9R8Ffbyy0Ug66BeR5q+ODcUYl1pJZnlSGh3UQUnk9ttEgFkKxc7ocvsp8HJi2YGo+kuUKJHs6jalkhRqhOEOwWb6v5HPPiRFw4Ud0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm2udnXDvFM51Dl4lSzoSMkL0guHje+yBJDSaiMcL+M=;
 b=A1f+0ctn38a+4TNQcjCTTsG9oGWDKLGghFyFSAvpu5xlVI9vtHJeiDVoT8WAwuLGWx1owthtCJWyoBufpG5YAF/bV9yV2jHywv/b60V02faB3Cteo+65BcfSz2N6E5OyWOLBtiXWysE/f+afRw8HFKNwQkOfXbIS42bdvjuqOvabvad4vbU262RXWQwQRXzjH/O17oCTdaZoxDr9cg9I2a0iqFhCNXOiguckqBqvYpKFJbV5MkyZr+1iKmQDuLGYi3gsVyPV5fVZo1qcCi06h6IbP0yEqQCxHBJVyWwNI8+fH309G5py8fewXJ9BG7S1416XnshKXG4bSu0g9TtSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm2udnXDvFM51Dl4lSzoSMkL0guHje+yBJDSaiMcL+M=;
 b=pz7yqudJghfN29ThjTT+lJ7PeoERNgyknzacs+hF1aQyNOJhGZjU/gs2+KpUJ1JedotYHbImTAuDnQ2gZNcY6VZl6UVYJXfuiPIB90xabXDsOg+xlBomzX7XMXZQAcBBWe7YFQVbPPFHW16Ez8oYeO1f34ERqKq/kY7AE29obv9IAj1SvhLZvk20F41SjCs1fwugi/6IAakW+6p/5gToUKnzk+y7XBWW0y61XiQQlbNf5YG6pHmamHBpw26eU8jemLbWIE0oe1ODE9jbLuKBqsCu0PoqRHmodumcitcKq1qwU4SvguXE3d+2yrcEsn90XmEYTRlAmsHXbAgsNy/PgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 15:33:09 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 15:33:09 +0000
Message-ID: <860f02b7-b676-8ce7-1fe8-33964ffec85a@nvidia.com>
Date: Wed, 10 May 2023 18:32:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/8] migration: Add precopy initial data handshake
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-3-avihaih@nvidia.com> <87h6ska8bd.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87h6ska8bd.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::28) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM4PR12MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: dc28a724-cbf9-47b6-5455-08db516bdb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4AUk5UZRL5cLndwB9YA8RQJ1p2MutOcXsFtCgvSjjQTOUnOKFv4LvGn3QFhA+q50hGGmplcTG2dooe8C5ptbXThEKwIu5ZTcnEOvy40+eMrAjsfX3pcmuXptpoUcGKApaZOFdX1nNRPZ5HCThMxP/PQE4wJheYj0MMWH/qvRZID/SBz7TglKKsJ3G4hM3fsJ2nS4wKH5zImjGcsfrXLVVrZ5SAK+i1jCOp85d/2YH/I1MFsVZ9Dfk8RQRCw+RPegdqyQ4fBRVlycG9bkobV33mfqgRiwFt6mO6wCQM0kXMCQ8q784cVSoPgWfzXFRUkfqNwR/jaj6mZLWjztTgRMscwOBUp2gfVLWOcSnkY6rIfm249PBYGPCa58Ht+9+hp4EgqK7jZsfrfYfPNA4LHFcgj5TV5dG9KUedHR1NlE0Br8rmodoiTvp6C0hoVn6F9tEn78bhLcuSiJinNg7TiLiJnCM6DLzRvj0ikzwVewVZH2YMltMNdhErMlHEYNK0+8sGVNDVVx/7jhc5CBYx7XVb/PApw0D+QHWxC4a5UNaFMnj55PozrUZQsVF+/51CpYxuvUsw6u1CwHNHnW5T2yz5HRzNHOdWCScRuqaiMYnzWmItCD2oei4oVl4lydiM9q7X9kwfBJHR5a1tFDXiCqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(31686004)(4326008)(66946007)(6916009)(66556008)(316002)(6486002)(478600001)(54906003)(66476007)(31696002)(36756003)(86362001)(83380400001)(2616005)(26005)(6512007)(6506007)(53546011)(6666004)(7416002)(8936002)(41300700001)(8676002)(5660300002)(2906002)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGYvY1I1UktrdUY0ODVKQTlERm9Id3ViQmpFTnpyK3gyMlYyTzhkVVlDekt6?=
 =?utf-8?B?cXZGNVliNGd2MjRJWVh3eW9DVWVjQXRacWlNSHpyTzRJcUNVcDYreVB1S21G?=
 =?utf-8?B?OXJIRmRxai9LdHNUWmdqQlJodHpZVm1ZT1FOTUZTMkFKdmpMZXY0c0RLZUls?=
 =?utf-8?B?Sk5VbzRHS3pFdkU2ZmtIWDVNRDd3MW5GYy9NSUdhZm9tdlB0eGdwR1VoWEhN?=
 =?utf-8?B?dnk4Q1I3cm41UkhSOU8wd3RRM1RyL2VvdVRvaW5tR2lESjBNRnNQbVBwcEV2?=
 =?utf-8?B?NDNUK2pGVkE1NmYrS2lQOWQwbDd6Z2RLN09IWWdmcmZSYi8yTTV4dUpEa1p2?=
 =?utf-8?B?a05ycFA5UjdjYUxGTVZzUFp1Q0gzekRucUNNTUlvSHI4My94K0ZiUGdFU1Ar?=
 =?utf-8?B?cW92Ym1LZXVnb2pjN1cyMkVTMjBPb1RuazFuTEs3T3dCaFEwMytYUVpnT2Fr?=
 =?utf-8?B?Z2ZwTms5MFlQak1DUnpBbUZPWkc5bHBobzF6aUZDZFZmeTlTTUo0TGJnUmFr?=
 =?utf-8?B?a1RBcTBWVEZlRjdoWDN3QjgyMnc3YytUTUJ6WVhVUmU0dmlROVpnK3hvNFI5?=
 =?utf-8?B?VTdpTDZvUVQ3V09Tc2xDR0p0Tkl4a0Z1NEl1cmdUSDBlRjVZVGdwV2dWLzMz?=
 =?utf-8?B?RjlRZGN5aXpxME5SeW9KbXo3QjBPM2hMUVBzSEVWd1REcVNHbmtCWnhpQWdE?=
 =?utf-8?B?dndRWjdrRFVHZDFKMG9nN01JVmNDM0dSK0c5WVdlMC9jYzFGU2FmRzdEY25Q?=
 =?utf-8?B?NStzS1JCbWFTMklFUC9yelY4c3VQWjc3RWp5c1hYQTI1a3ljTW1MWUFSZVRo?=
 =?utf-8?B?NzRmSU1BTklSUEpuamlDeVJzT0hsQjVzcGk1WHBPemtWYWc0SUZGdXVCYXVz?=
 =?utf-8?B?RGNzY2Y2WjJIN2pvK3AvVXYvNlZ0KzFzTHk2akdOVVkzc3RINGxkV1lUUjRl?=
 =?utf-8?B?U043aHNwU2lMTHRUVGN6eVoyWW5SYnJRTzFEak0rUU1EKzlsK0dJMG1MYlk2?=
 =?utf-8?B?bVVoSWlicnE5TmFjaHFnTHd2VHJiMU4rNW1OczZCQk9zeEd4aU8wTXgwNjJ4?=
 =?utf-8?B?cHd5NWtGV0pKN0FkekFEYzdya3VaVjBDU05HRnc2RzNOdkxXaW56TmtDQ2Q3?=
 =?utf-8?B?OE9sYUFVSFczN2Z1TkRrWVdRbTQ5bXZTS3Z3cjNJRzVjZDNHSnVtWmtMVGRP?=
 =?utf-8?B?Z0NYUUhSWGc3R0lwMXZ4U0M2bkM5WDFQQ21XTjc5ajdscWw1M0pGZUxTRmY3?=
 =?utf-8?B?ZXNOU2xEdmFWUXBkbEZzOGpXZGFldTcrdU03dmtZRUxtVnlReCt4dGhYMTA3?=
 =?utf-8?B?VkJBWG5vU0pPRUh1Q285MXhrUlZDdWpvSklaV0pRcUhBNHhaeFBweFNsWVRK?=
 =?utf-8?B?dVc2NWRwNnFWTWF2VUdhYmloMW1sTFpHTkpVYmVLOEc2S2tITFBCbXIwUVJq?=
 =?utf-8?B?YVhQMUsrdERoMTlBby9xanVqd2lKWlZqKzF3QTg2bSs1WVFNZ0FnemI5U2Ri?=
 =?utf-8?B?RlkxaXV2NW9Ib0xLcTdLQVhTWGwzandJek9iKzBjcGZ2UzFuRFBOamxOekk3?=
 =?utf-8?B?bldyN2ppQksvOTJiaDdxQkFmRkZGeGJLV1JWclJpbnVnTURSK1FJczBJZzB0?=
 =?utf-8?B?aERCT0hUVGRnK1IvRG1DK1JMMXRUaGRaTHM2bytqR281dnlrdXoxSFVib0cw?=
 =?utf-8?B?enZwMG9hRWFiVG54ZThxRWZkK1NudEhlV2RlNDd2bFRCL3gwTDgrVG1qVndW?=
 =?utf-8?B?b3cyY2ZHMkdLRW5WY1h2NzVnemdGbVVxb28weklEbjVUOTJKSTdiQ1ZqVHFH?=
 =?utf-8?B?MUN2LzJ4Y0xEK3VadVRCQ05Oajd6K1pHZ05CbXNXOVNLaHhBaUlnQnNZck92?=
 =?utf-8?B?a2ROR0t1Wnc3cU9ZYURZUkVGTXVzNnBsdFBTUG4yTTZoeGtRb20xTU82cUJu?=
 =?utf-8?B?S0FhbDRhbXkwb0QzUzZmNzlBVTdOV1dSajZNMkdkSmR6QkNrMGNoMUlEUmcx?=
 =?utf-8?B?NW95bDFiUHU3V1pzNDlDQU1IRmFwRUpsdnpQdjhsdjhsaWI4eVl2c09yWkJG?=
 =?utf-8?B?ZHYzUkRGUHlvNFRsdGpZd2IzSk1KTFl0VHEvaWk5NmhIYlRjNjlPMTRDOTli?=
 =?utf-8?Q?s6lSGwyimk4pU3hPXHX35EizE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc28a724-cbf9-47b6-5455-08db516bdb7e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:33:09.1367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n60EQfDMsj9dfB/hatX+VIz4Hts0FoMEelb3bVfvcykmvpF3hWGgEYJkKysd32yuGyYPBqbNP5vWmbnEOUnw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5216
Received-SPF: softfail client-ip=40.107.92.43; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 10/05/2023 11:40, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> Add precopy initial data handshake between source and destination upon
>> migration setup. The purpose of the handshake is to notify the
>> destination that precopy initial data is used and which migration users
>> (i.e., SaveStateEntry) are going to use it.
>>
>> The handshake is done in two levels. First, a general enable command is
>> sent to notify the destination migration code that precopy initial data
>> is used.
>> Then, for each migration user in the source that supports precopy
>> initial data, an enable command is sent to its counterpart in the
>> destination:
>> If both support it, precopy initial data will be used for them.
>> If source doesn't support it, precopy initial data will not be used for
>> them.
>> If source supports it and destination doesn't, migration will be failed.
>>
>> To implement it, a new migration command MIG_CMD_INITIAL_DATA_ENABLE is
>> added, as well as a new SaveVMHandlers handler initial_data_advise.
>> Calling the handler advises the migration user that precopy initial data
>> is used and its return value indicates whether precopy initial data is
>> supported by it.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index a9181b444b..2740defdf0 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -71,6 +71,13 @@
>>
>>   const unsigned int postcopy_ram_discard_version;
>>
>> +typedef struct {
>> +    uint8_t general_enable;
> I miss a comment for this field.
>
> I think that you only use the values 0 and 1
> And that 1 means something like: we require this feature and do nothing
> And that 0 means that this is a device that uses the feature and
> <something, something>

Correct.
But if we assume both source and destination will enable the capability 
then general_enable can just be dropped.

>> +    uint8_t reserved[7];
>> +    uint8_t idstr[256];
>> +    uint32_t instance_id;
>> +} InitialDataInfo;
> We have several "reserved" space here.  Do we want a Version field?

You mean SaveStateEntry->version_id field?
If so, then I don't think it's necessary, it's checked later on when 
device data is sent.

> It don't seem that we need a size field, as the command is fixed length.
>
>> @@ -90,6 +97,8 @@ enum qemu_vm_cmd {
>>       MIG_CMD_ENABLE_COLO,       /* Enable COLO */
>>       MIG_CMD_POSTCOPY_RESUME,   /* resume postcopy on dest */
>>       MIG_CMD_RECV_BITMAP,       /* Request for recved bitmap on dst */
>> +
> Spurious blank line

Will remove.

>
>> +    MIG_CMD_INITIAL_DATA_ENABLE, /* Enable precopy initial data in dest */
>>       MIG_CMD_MAX
>
>
>> +void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f)
>> +{
>> +    SaveStateEntry *se;
>> +    InitialDataInfo buf;
> Small nit.
>
> The new way in the block to declare that something needs to be
> initialized to zero is:
>
>      InitialDataInfo buf = {};
>
> And no, I have no clue if this makes the compiler generate any better code.

Will change.

>
>> +    /* Enable precopy initial data generally in the migration */
>> +    memset(&buf, 0, sizeof(buf));
>> +    buf.general_enable = 1;
>> +    qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>> +                             (uint8_t *)&buf);
>> +    trace_savevm_send_initial_data_enable(buf.general_enable, (char *)buf.idstr,
>> +                                          buf.instance_id);
> No buf.idstr here.
>
> Why do we need a command before the loop and seeing if we are having any
> device that requires this.

If we assume both source and destination will enable the capability then 
this can be dropped as well.

>
>> +    /* Enable precopy initial data for each migration user that supports it */
>> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>> +        if (!se->ops || !se->ops->initial_data_advise) {
>> +            continue;
>> +        }
>> +
>> +        if (!se->ops->initial_data_advise(se->opaque)) {
>> +            continue;
>> +        }
> Is this callback going to send anything?

Nope.

>
>> +
>> +        memset(&buf, 0, sizeof(buf));
>> +        memcpy(buf.idstr, se->idstr, sizeof(buf.idstr));
>> +        buf.instance_id = se->instance_id;
>> +
>> +        qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
>> +                                 (uint8_t *)&buf);
>> +        trace_savevm_send_initial_data_enable(
>> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
> It is me or general_enable is always zero here?

Yes, it's always 0.
But as I wrote above, if we assume both source and destination will 
enable the capability then general_enable can be dropped.

>
>> +    }
>> +}
>> +
>>   void qemu_savevm_send_colo_enable(QEMUFile *f)
>>   {
>>       trace_savevm_send_colo_enable();
>> @@ -2314,6 +2359,60 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
>>       return ret;
>>   }
>>
>> +static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
>> +{
>> +    InitialDataInfo buf;
>> +    SaveStateEntry *se;
>> +    ssize_t read_size;
>> +
>> +    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
>> +    if (read_size != sizeof(buf)) {
>> +        error_report("%s: Could not get data buffer, read_size %ld, len %lu",
>> +                     __func__, read_size, sizeof(buf));
>> +
>> +        return -EIO;
>> +    }
>> +
>> +    /* Enable precopy initial data generally in the migration */
>> +    if (buf.general_enable) {
>> +        mis->initial_data_enabled = true;
>> +        trace_loadvm_handle_initial_data_enable(
>> +            buf.general_enable, (char *)buf.idstr, buf.instance_id);
>> +
>> +        return 0;
>> +    }
>> +
>> +    /* Enable precopy initial data for a specific migration user */
>> +    se = find_se((char *)buf.idstr, buf.instance_id);
>> +    if (!se) {
>> +        error_report("%s: Could not find SaveStateEntry, idstr '%s', "
>> +                     "instance_id %" PRIu32,
>> +                     __func__, buf.idstr, buf.instance_id);
>> +
>> +        return -ENOENT;
>> +    }
>> +
>> +    if (!se->ops || !se->ops->initial_data_advise) {
>> +        error_report("%s: '%s' doesn't have required "
>> +                     "initial_data_advise op",
>> +                     __func__, buf.idstr);
>> +
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    if (!se->ops->initial_data_advise(se->opaque)) {
>> +        error_report("%s: '%s' doesn't support precopy initial data", __func__,
>> +                     buf.idstr);
> This is not your fault.  Just venting.
>
> And here we are, again, with a place where we can't return errors.  Sniff.
>
>> +
>> +        return -EOPNOTSUPP;
>> +    }
> I have to wait until I see the usage later in the series, but it is a
> good idea to have a single handle for source and destination, and not
> passing at least a parameter telling where are we?

Are you referring here to the initial_data_advise() handler?
If so, then I didn't need to distinguish between source and destination.
But I can add a parameter if you think it could be useful/good practice.

>
> Really nice patch, very good done and very good integrated with the
> surrounded style.  A pleasure.

Thanks!


