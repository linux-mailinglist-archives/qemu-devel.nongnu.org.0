Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F96FE1EA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7N-00033W-5t; Wed, 10 May 2023 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwm7K-00033F-Qv
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:38 -0400
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pwm7F-0004Uw-TR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWE+a/PCH3clY3oM2QYshNEUToufFSPKL923aHwIKJtbdG4JqSFx0mHSVoVB6AL57lPfCrswtMB50dy5u01nw9oe1HwaPIsTx5Xg2eoW32MHsgCdsYJspJFUpUoG8T5zNkRZKLUEOlx2HJcqL3KRAysfrPX9ANrs3UI79l9c2p7jA2sEhg6zjF1KpyLudaN2oTAZXeox09z95N9i8QyppGDl1k0nJ8KsPcBEfKX4iatAD9mC/RxFO5FtI00coE6F0YdaPgNCZsf8yBTADt7Bk+yTDurE3r95fEKTnZ1Cx9dyKwjbifgXTC91iPm1VAI35tHmX13ThsZSRk4EqrCVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeSkY07EL2nakBBNhxVIjy1McyNppeCYbZWDgXytFAA=;
 b=oJYunkdSsbVctNosdKfojLgeGSrLtZZgtkdS4Y18N9SXiw7eqBxoFvOWvyucgQzBC1w6+ImMmltfrOdeSR5XnL4+ucP5TzN2itJv82dBDtDasD//Mx9YF/QUVr4ZuBSuxJ4j9+YJUfoteUv1nOuUqVDyOs+MUfhdAVHODe24uqFOJYW665cHdHrhjjc+A8jwggHoIezxBcQ+i/cUZhhCql9c/kYtiLbFKmO1nWXCQfq3z3oWEbZYAVGzrOmktJYpdVLLfmoQGBsrq8tgho4z50b5KsTMoL7HMHQ1rz882TJgdp6eg8FBgDyuGuERNFsrOsLWgVqCqqh4IbPT3e2RaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeSkY07EL2nakBBNhxVIjy1McyNppeCYbZWDgXytFAA=;
 b=DWnnDVYPGypg5vWWzVNghuH3scgy5WtnPk0MgIVSXUZoyb2RTz+itESwPB8V0fEPpCXLsRP9Cwi7ppfI1ySKBoilGWv18w5MaNVk0/A2Qacd9PicDoxxQuHXGgKSbiKpZTAtgJOsgoXBXxGbNYTXmOcaEYIXahO9nGNR0aUbkh7GKBlPmYqGtTyD9zYtpDFA8juAwU7gS1BXCt+Z5Cv12H9lBPYv3FipCC2mb656T3ilCpjkZg8lnFV3kg4q8+nicTZv2gvlhtR6gt/YhFKQ85bS9Gdkh8dgiB/wUDRGUx66FXzo7b5G44jGEdCdw7YVefzs975QxDD/z+Ix+nbr2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4976.namprd12.prod.outlook.com (2603:10b6:5:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 15:52:29 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::a29a:c3cf:5edf:9dad%7]) with mapi id 15.20.6387.020; Wed, 10 May 2023
 15:52:29 +0000
Message-ID: <e08fcc14-8ce2-e537-c1ba-d0e46faf5687@nvidia.com>
Date: Wed, 10 May 2023 18:52:20 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
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
 <20230501140141.11743-4-avihaih@nvidia.com> <87cz38a7n6.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87cz38a7n6.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0431.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::18) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3ff417-83bc-4a43-51f9-08db516e8f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDR2nXiwkNgIQiorJnAIxDFtkF2HAQ+lBcqxzAbpuwCbK+FW3JwFVinaDgnqaL4k1zZ5bot1MYvwIZXymwD+FgnKj6iwMDWQYntTAzxuRLmtRi0K44wXh8MRXZ7UkA+rWWnxuA5dyzDbW9SON6bxllmbjdHq7+j4lpmqO9IfOMTJNcQ7x2TGR3bNRuYMYkCFwsqId83V4uGJnvZ9ZEbuAXr0KSC/bOHEM91m0Kst3kDRx/LKS59kXHDcPQ/+cIc9Mdj5h0+OUgpoBSWQ9bDZoGVd9EfZ1OShTC42o1CsBeiC4YFpe7+m71cMZqySS9kl/NCWp0tYdKU+9/iFgCcuB5kOvAAZlQBm3a/pa/Oa8W+cPrDGequyuezp2Vcf/h9SnEeebjdrqzF8PbAXXDMUk37wSHDkwdZWy8NqSISdH/2t9z31jif3fVMY7D0kOTJx0WsQVqnFumypBRPxA9lGLEC472cL4WjvnTD5N9MS5rlfELxqoF9DeD8otQZIumymnvkYY9YSahkRydBMdM4OMX1PQGD8E/xaNuGo107kS7Qm0qvroYaNFsEdXvHK8FH96hQUJfGyIJKofKaeTbiMc9rq+3KN/5472imOofSD9jW15uIjpQ5kM83Luh1ANkVLyP2YIA3lH727ilUVeXjNew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(31686004)(4326008)(2906002)(8936002)(478600001)(316002)(8676002)(66556008)(5660300002)(6916009)(66476007)(41300700001)(54906003)(6666004)(7416002)(66946007)(6486002)(6512007)(26005)(53546011)(6506007)(186003)(83380400001)(2616005)(36756003)(38100700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG1HM0hwQkhzY2F2b1lodWdZYkxvdWVESUduM09oK2F6K3NDaE84bnZHNUhC?=
 =?utf-8?B?TkJVeHJJRTFPaGRheVhLMG5MS1ZuUlJ1ZWhkRkxEaGhDRzBzSk93a0xHdi9E?=
 =?utf-8?B?ck02RFlzUjFOMWRnS3hGMlMwNW13Z3FIS1IwVzk2M2ovZDhXcDkyWVo1SThS?=
 =?utf-8?B?alQ3RFIvQXNsQ0JIV256eFBhb1JtTzVHS0d1eHU3bjBnajNSTFdwcm1hNG9t?=
 =?utf-8?B?NHZKL2xQTE5SWE10bjZZdWVFbmhOMm5iS3UvWGg1d2VTTG5GRXk2aWF1RlpR?=
 =?utf-8?B?dmcwSW1sV3dxcUEvQlBrMXdZN1NjenF5b1lnRHZCTkw4ZDMzZW11MlpXblZP?=
 =?utf-8?B?aTM0aFBZWHBSMXhhZ0poV0QrUlN0STU2L3NnSUIzSm5uS3Q4TnNCNXducldZ?=
 =?utf-8?B?NXBLaVlxUXEvOElLMXFERzBXSG5sZnlKZjgxemtYT20rOEJRSWRoZ2VVODhY?=
 =?utf-8?B?dnlTc3ZQVytXYit1WTdFUWtZcTU1dlh5REFIVjlkTXJaWjgxdGg1STR1MjBN?=
 =?utf-8?B?RXNuK2M4a1d0aG9pb0g3OUJpOTlvbVA4Q1g1TU5wOTNwamRSMzg3dzFydW5m?=
 =?utf-8?B?dUJLUUYxZkhJOU13Y0NVVFdJVm9YL1VTRVd0Y0RwNG9ZY3VKclBqVWVjY25m?=
 =?utf-8?B?QVEvNHVSRUNpVnVPTVptaS9PNlZ4T09YVTMwQ1R1anh0QWJUSzdXT3MyZHdw?=
 =?utf-8?B?RkVYY2ZGVnIzRWtnTjQ3OU84aG1IVXZVMlNra3lVOTZuYUlwN3VLZ1hndE92?=
 =?utf-8?B?MWdWbWdsUXVFOHdEc2o2ZHVwYWc4M3RndDUrM1VjVWlOM3VMYUhJTzNUUExC?=
 =?utf-8?B?dWU1SGc0dEt4S2NBNXpaejM1Z0gvTHZZVU5PSVNXMk5TdmNIN3AvRDdGQjBO?=
 =?utf-8?B?K1UvRWhyamZ0dk8zTEJyT1lDM0RzVHBUMitlNGd3UVMrVW45UkJYTVZoaXBW?=
 =?utf-8?B?OU9xcE5MRSt5a2ZaVHJuS2VkVXpEZkNIUHZaN3l0NUN4aTNoS2xkZTMzZWRI?=
 =?utf-8?B?SnZHbnBybWFRbXVNY2JMWU9uWXNPYkRHcVV4bFBXSTZDeitKZ3kydFI1MlpJ?=
 =?utf-8?B?eUNkUTZZRWx2NHRLaEhpZjZBTXdTenZSUDZwZTljZ1R3L0dUbzBFbHdmMUsx?=
 =?utf-8?B?RGh0QlBmZU5CdHpPc3lxY3RkRkVZVmJCWWs3a04wRFJaZ2tqUUpqNnhiSDRl?=
 =?utf-8?B?bzU2WEV6cFo1cXh4Q0NSUXFXTjNVMkNmd1U4Nkgybkpzd3l0RG04LzhZWndJ?=
 =?utf-8?B?QnZZTDBsdmJrcXlNS1hFOUxsZ0VFZGdwcyt1WUcwY2RUOFZDNHN2NUhWaE5O?=
 =?utf-8?B?VHRGSW5rUVpzUUZXWjFhUW15L0ZucXU5NWtwamkwQlBlK29zVjNHcmpRWWVn?=
 =?utf-8?B?bkFoM1BYK1duaDd1RnUzNjd5SnFSS2hndmVFamNKaFFWdUN4aUd2Y1JWbUNv?=
 =?utf-8?B?SkNhVnBEa2lnejJKMU56Z24zZVArcENLWW9EUnlVN1dFNklDTGtDeGpOUnN1?=
 =?utf-8?B?QXdzSFhpcnU5Vm5TYmRiQkRHMW5HaENYSTc4K2NkN0ptUG5PWUo0UFlaSHdD?=
 =?utf-8?B?b3R6NEFDM2ZJLzJkcnV1ajBmN0hBOXFQYkNwRldiQVRZMSs4OXN3MHE4ZDhy?=
 =?utf-8?B?ME5haThtTGM2VFd3N292N2gxR3VRaGd2Y2JSR3M1TE1BUldCU1FqY2VyNUU3?=
 =?utf-8?B?eDBuTU1JbDBySUs1Y0xTUSttZVRJZ0hSd1AvRFZyU0I3SWJHVXI4NjU5VGty?=
 =?utf-8?B?YmtDeFdvN0VVYjdWWlI1a1ZyWWwwSmJSZy9pMEZHa1dEbmxDZHBsZ2pTSjdB?=
 =?utf-8?B?NUdXV1U3UlZFa1hOaVlhOEdJT01CM2xhM2dNWTlKdWlEUXBzVHBrQkpqOHVG?=
 =?utf-8?B?cHBQVHByT1JXYTJvYllqVTJReTlDQ3FiWEZOY1R4T0QvaFhTKzQ3dUtGalZK?=
 =?utf-8?B?T1hVZENTakVlSFRjTUNTUEI4V3hjUmFOdGxOUU04V0Z2L0w4ZldZYVhxZXBq?=
 =?utf-8?B?VURSZGZxQ3A4Rmk3VGdpZ1h3WEJlbzd2QUV3VmV1cGpqemNUTGR0QW8yMENv?=
 =?utf-8?B?Q1VqbDNXcjJMZEo0eHlZTTlWcVNlRHQ2b0dTUmd6dGdrcnpZMVFhTnd4UGRR?=
 =?utf-8?Q?sIgMGVpeXnSosv9EvEQP6J1oR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ff417-83bc-4a43-51f9-08db516e8f14
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:52:29.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8w8pZ4CTEPDRizpSS37+r/ChtSXd/d0/PNYAp84I7XNTzr/OVi7v+LLK5lIhmGajWEdr8qAq+QneUV6NuJ28w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4976
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.251, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 10/05/2023 11:54, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
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
>
>> @@ -1401,6 +1412,8 @@ void migrate_init(MigrationState *s)
>>       s->vm_was_running = false;
>>       s->iteration_initial_bytes = 0;
>>       s->threshold_size = 0;
>> +
>> +    s->initial_data_loaded_acked = false;
> In general, you let a blank line for the stuff you add, when all the
> previous fields don't do that.  Can you remove it.

Sure, I will remove them.

>
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
> Thinking loud here.
>
> What happens if we start a migration.  Guest is running.
> We enable precopy_initial_data().
>
> And then we stop the guest.
>
> Are we going to receive data that expect this return false?  Or it is
> handled somewhere else?

Not sure I fully understand what you mean here, could you elaborate?

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
> For this specific variable, I think I am going to add something more
> general that this can piggy back.
>
> For the migration tests I need exactly this functionality.  I want
> migration to run until the test decided that it is a good idea to
> finish.  I.e. For testing xbzrle I need at least three iterations, to
> test auto_converge I need a minimum of 13 iterations.  And I am going to
> do exactly what you have done here.
>
> Will came back to you after I think something.

Oh, cool. So I will keep this as is in the meantime.

>
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
> If you don't have any other use for is_initial_data_active() I think you
> can integrate the functionality with initial_data_loaded().
>
> If it is not active just return 1?

Yes it's possible.
However, if we change this to a notification mechanism as Peter 
suggested then I think both is_initial_data_active() and 
initial_data_loaded() can be dropped.

Thanks.

>
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
> Later, Juan
>

