Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A34FE352
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:59:54 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neH3g-00086q-N0
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1neH2C-0007ID-Q8; Tue, 12 Apr 2022 09:58:21 -0400
Received: from mail-ve1eur02on0711.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::711]:40014
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1neH29-0005G0-JC; Tue, 12 Apr 2022 09:58:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngQc+tC6ijSET3FOzQa6pcduBlsKEUN2tb6xgLM2smULmB/Z8JiJMI89yg06xYjXL7+uzo/dWw0waWvoZXDdbgEXjj6dGG0lLw97yk8gfOmjWdxjluwnI+nfWSvlJX7GGv9PNksUgR/9HNHoZaH4OImxA+x/vYFcZELg4ztZCQyW1yqdnircZdfJKI1uIdXoUHeCAD8bbWfuthPp9Kf4zXjZ7wPMCgHMr5AtCduGT2KyhMdkQjvoL6Wp8qkFu1FWwbinh8Ds/ldjVYx5kqcWvMFtS+rq6lzvBPy0se66zpJ0Lu92bvala+7WtaTLrBJKsoTAdOTQljbUB+fnReEttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPV1WzZE0SLQgOvLQMbiV7Pz2wgCpB99EkrUemH9ewQ=;
 b=UEDeILvXJilLiZ2SJRUy+kVQRekY9ksCqf8A+Fp/Ivgn2/DvtV12k0db7XrwGc7i7wx4AuypOXxZqLi8X1JF3gEoeBLEcuG26fUn8EBjI89atm4TCSTeMyCwIz2JJcKGjamkVU4zKF9J+ywUiGmHc5x4KW7NculNf2gAursuW2jQx34uRNYOfAogfp2bbx77NqHL7MqYKIvgIvrzgRx+3xNMKCq8A0j4HOwQ4nP8XZ4UgFxzY/p5QkvNpGXyJdaauF0rgNZ2/KAF8LhKDOqjKH6N4YkSx7RvTGq2+YOXyoDlY7YyjqwFf1oiyQ5BSYSmKYSbG4TZuHj7NjPafv4/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPV1WzZE0SLQgOvLQMbiV7Pz2wgCpB99EkrUemH9ewQ=;
 b=rkojWvgT+Kf4BDbYwFJQMfPAK1IljL57QfluO7JC94nbvxqwjoz+7iFxzRthFaelQY5qqbvMuaH6pavxTlNXQJr3uE0SyT+lvkLHSVMM44Sq3yzi+gkKW/t7PLyCB+9p9VY9ZvReR9VAADjf78PRwlxAvtM57Rc9U0w+ugJPN/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR0801MB2111.eurprd08.prod.outlook.com (2603:10a6:800:8d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 13:58:11 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::8d23:cb3d:8eb4:e3b5%6]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 13:58:11 +0000
Message-ID: <981c9a20-600b-1425-144f-487d1a337b5c@virtuozzo.com>
Date: Tue, 12 Apr 2022 16:58:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
References: <20220412095048.231030-1-den@openvz.org>
 <0622d8a9-7c46-26bf-0b56-99cc66f6ac0b@openvz.org>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <0622d8a9-7c46-26bf-0b56-99cc66f6ac0b@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::29) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 738ce35d-0866-4218-e1bb-08da1c8c7ae5
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2111:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0801MB211161B27DD10A5A4E1045C9B6ED9@VI1PR0801MB2111.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXOUivkkDwuLGNHuTe03Lmw0NARz7dgKdgDbxIfvC+N1L3yOzYbyHnOnX/lBPuR3sbpNrcvyqZCSGVStPgMOrPow2ltkABw8z/eADMG+kL7rYtiTuqvVeOG0RT3MOTuyr8xBx+CpkOg23oOmBjDGt7SKgp9VwTJb1gr5PTnWkfI4A4xz2a9vSTblhVii0P4/VpvGxwCJ9ZSy+HtPSmeDARCuSJTHyU+BynYTaxPG6FyEuqxnjFqVuPznPF4dhRaAWI8ZKUQSM8PsJXFWMRdb6X4IPkSWCLMfYYVi8aOimU6Mere0cFloPEjiNKMXatqHYIAVf+w9meFAUWVT8BPpGQv2mohTSHruB86r3KcK0rxMa8+YVnwjqzv8v8AfMGyCUlFzL69d0bz5DppbeFynl6oRsxKwMuqOWqvrWSgAZ+oc+cm1kpmPH16ZUL1zsUAzrBaXZcSGiSvGLiFFdF+pZkvaSi/aScURlca7v71W+YP8w1MOncadcK+Ta5xMAFdCtxqDpF90Rrz5FGOrUDqOX0wnLcZmOxFlLXTBX60WrugIzdXJL4F8ZCXK91XsW3m6bvbHqXYApJdTGgq9Hm8XVk1vrepYc404KQIV0++dMuOnmOWph8sbrUvlk1GC+MyeCom/swIy1Nx+awqJ2HCLEQ6XxSoYNbesZc3yh/aHWgTazZYTwZ57au4csKyjYC0Nwl2z2djJXiliGciid4d7GyXTn2w1ywJRjhB5tHl5rsWBsV0tjCBAahjdJl2UGc7rvHIY2ItTBIlxTJg2pAS4SJs26WzV0F4gD2WN8fvqhdw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(36756003)(107886003)(31686004)(66556008)(6506007)(508600001)(6512007)(8676002)(4326008)(54906003)(66946007)(2616005)(26005)(66476007)(316002)(31696002)(6486002)(52116002)(2906002)(53546011)(86362001)(38350700002)(38100700002)(5660300002)(83380400001)(8936002)(6666004)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3M3K2xidEVxeGxsUWlpb09neHJ0ZUprNUNWWXE3bEdXOUNYUDFXNWNPS0ZI?=
 =?utf-8?B?ZmlyalVPLzMwZ0I5UEhyckRpa2FuWjVjeTBMK0VoQ2R5dHc0Z0lUckNSaXBE?=
 =?utf-8?B?RUU2WE1zTjFRdHArbkNSa2o2SDVxTU5iUFBNc3hDbmtsRllLdVl5R2JWUHY0?=
 =?utf-8?B?NXlaY292Y2VuQXlERHdXUTQrMjQzY0R2SzhWTGgyVEowQ1ZpRGR2NGgxcmh0?=
 =?utf-8?B?ck9uWFdrcmZjbkhGdlUrMHk5VGV0bmg0bXRrbm5yRFdWdUluNi9nelgzSmhB?=
 =?utf-8?B?Syt5dWc0cWQyVCtqN0RsbEZwTXlheHMxZXFEeWY2Z3JCd2ZIamlkaGFSQ3k1?=
 =?utf-8?B?UUt0UWRqUjNwZFhzamZRZ1NGMjh5dmtnWTJRcHpXeWxWQ2ppMzFlVm1oS0RR?=
 =?utf-8?B?a2E2MUFYeDFyVnN6Tm9uTFdWSCs3SXgzckFnYTFCeDMrVjVKS0dWdmVxUXNy?=
 =?utf-8?B?V1NKYUY3eXVaUkdHZlQrQkVNaEVoMEFVMkpYOEtIWmppTGs3c1R6R1NBblJK?=
 =?utf-8?B?bHc1d2EzbVFPU3o3eDJGUzZjb053N1ZBb2xnOTRXYlNwWkJNTmZhb3VFQ3dQ?=
 =?utf-8?B?V0syK2didkRNa3o5b0ZqTytWMnZabDVYRDlweUlJcU1WcVB2aTZYTitzb3dx?=
 =?utf-8?B?TW5Nb1FCSVJLRkpWMDFrWFgxVXFialJnZWc3Nm1KeWg4YXRWZnUveDNWdzlB?=
 =?utf-8?B?L0dRRUVaMEt1YllNZkpSeFh6eG1KWUpqcFhxYjFaVVR0eXplUzEwQ1FqcjZ1?=
 =?utf-8?B?UXFpMzRyaVJEdE1iRTdMS1VucllVR21TQit1MUgwa1pwSG81V1V2VHpCaXpa?=
 =?utf-8?B?MXRwd1o2Y1RXQnFnbk40eTh4RUxCT2ZiekZpMk94bzdjaVg2THUvcG5pNElt?=
 =?utf-8?B?UHdGc3FGVkxHeVNTT2poWnU5aFRIMEVhQTBiQ09qU0hYbHBGVTBOcGZISEZz?=
 =?utf-8?B?NVpsNFVFVE5DUnR2b3lkb3NpckVPTEdsSWg3eVUxZWlGSzdaQk56WDFTd2cy?=
 =?utf-8?B?empPQXVxOXRRWHpVYVNZa3F3VEtSR2llMnFMRTBYSi9BZ0c4ZzMwRHdTaFdy?=
 =?utf-8?B?NG9jcWJlUzdMY25FcXdOcGN5NlE4Z09Ic21YZlR4b0pXNXlDamFGSXFpNTVP?=
 =?utf-8?B?TTM4THNHV0hWajlqRCsrajc0VGo4NXVhR25XZ3RpVHZubEJoMG54RjUzTHF5?=
 =?utf-8?B?aGNEcUJTcTBvTzB6Z0o1VlNMWk56czhuY0Z3WXF0bDJ4dThseUQ0cHF6SExs?=
 =?utf-8?B?djF5SDYvWjZUV2o0dW53ZGR0UzlXUTJ4bXFrdDNMMG1pL25qVTNodHpicFRO?=
 =?utf-8?B?N2VuV0thT0N4MDlWUkVKR1d3Y1BLbDlOK2RHek5GNUNDWWg3SkVtZm9BYnpJ?=
 =?utf-8?B?RU9hMjFOaGlJblZCMk5NT1o5VHVLMnAxQ0FXOVVFelhwQTdZUXBTS1VKbDBW?=
 =?utf-8?B?UWtneGV2Wk1BM3d5NUN6TVhaQk81MVRpcnQxOG00bHMvWjFWc052NnFiUXRY?=
 =?utf-8?B?NXRtdFhjWGhXbFdHaU5JUzA3dGUwNEVFeWc1cGM0endFb2hqY1BqSW5aQ2dL?=
 =?utf-8?B?T0hJcjJaanJpZEUzZkNxNTM5VkJOeWVzQ00xZW5ZU3U5Nm5mT0kxOFIyQ25m?=
 =?utf-8?B?Z1lJZC9zWkFBU3dYZDcxQ2RrUVorTnpXVVlEaUo5M3hVYWNUUDJ3SkhKeVUx?=
 =?utf-8?B?SHBYVEpITlRxanJCaWc2MEt5RllsYUJoMjB6TWVZUDUwNnJ6OXhsd0ZzN2Jt?=
 =?utf-8?B?djJ5N1pnVjFZWmczbVZRekpvV241cE50WlRWOWE5Y0liZXRNNVFrREIyemRG?=
 =?utf-8?B?alpOUVRwVmVNRmY4YTVwbzNNU2dFcmNXZkk2aGNhTEsyb21RVVlGOUVXUm1k?=
 =?utf-8?B?aXY4bndQaWpyR3hROE1Ucm9hNVNEaVRhcUkvVVVZc3lUd0l0d1V2eHV5bVFk?=
 =?utf-8?B?YVpWNERac05tZjMvYm5ZWTJIUXB0V2Exa1BJVEFSNG85VVJETG1hVXdoV0hP?=
 =?utf-8?B?cGRYSXdhNk9lbElVQmRSVGh2RDlGOVJKak5udEdoKzhxMFB5bFVSVW1WSUth?=
 =?utf-8?B?amJFWmcrZ3RFeUZ0ellQaXJiOHozVWllOGtzUVQvZGwvVXFOZnRiaDJTQWxq?=
 =?utf-8?B?NUxiOG9UTzdhclJMUGlJck8zVUY1SmljRkhzNzlwOUNRV1dLSSswNi8vY2Fy?=
 =?utf-8?B?ZlVCWkwyejZXcFlCb1dXVWdsTHhqNFR6bm1OdlVXZXYwRjFKak84cXR0WTlF?=
 =?utf-8?B?YjAwTVRCMEx5L0Z6U2I5WHdRdytHM240RG1nNWpFSFRWSWt3cURsK0hqajhC?=
 =?utf-8?B?eHRiOFNEZW1ueGY1L1VPTVJsZTczdWx3YXhNUjJVNzFGWmkxUDBxQT09?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738ce35d-0866-4218-e1bb-08da1c8c7ae5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 13:58:11.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JATbFmbg6hiY0aSjlgC61QjYYPKxZRU4kqtY1vE7eJfy+QwGWD/eUQqd/k1SKX2EPCezeNGwWCNlnXrfFiyJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2111
Received-SPF: pass client-ip=2a01:111:f400:fe06::711;
 envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.04.2022 16:17, Vladimir Sementsov-Ogievskiy wrote:
> 12.04.2022 12:50, Denis V. Lunev wrote:
>> 'blockdev-change-medium' is a convinient wrapper for the following
>> sequence of commands:
>>   * blockdev-open-tray
>>   * blockdev-remove-medium
>>   * blockdev-insert-medium
>>   * blockdev-close-tray
>> and should be used f.e. to change ISO image inside the CD-ROM tray.
>> Though the guest could lock the tray and some linux guests like
>> CentOS 8.5 actually does that. In this case the execution if this
>> command results in the error like the following:
>>    Device 'scsi0-0-1-0' is locked and force was not specified,
>>    wait for tray to open and try again.
>>
>> This situation is could be resolved 'blockdev-open-tray' by passing
>> flag 'force' inside. Thus is seems reasonable to add the same
>> capability for 'blockdev-change-medium' too.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Kevin Wolf <kwolf@redhat.com>
>> CC: Hanna Reitz <hreitz@redhat.com>
>> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> CC: Eric Blake <eblake@redhat.com>
>> CC: Markus Armbruster <armbru@redhat.com>
>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/qapi-sysemu.c |  3 ++-
>>   hmp-commands.hx     | 11 +++++++----
>>   monitor/hmp-cmds.c  |  4 +++-
>>   qapi/block.json     |  6 ++++++
>>   ui/cocoa.m          |  1 +
>>   5 files changed, 19 insertions(+), 6 deletions(-)
>>
>> Changes from v1:
>> - added kludge to Objective C code
>> - simplified a bit call of do_open_tray() (thanks, Vova!)
>> - added record to hmp-command.hx
>>
>> diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
>> index 8498402ad4..680c7ee342 100644
>> --- a/block/qapi-sysemu.c
>> +++ b/block/qapi-sysemu.c
>> @@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, 
>> const char *device,
>>                                   bool has_id, const char *id,
>>                                   const char *filename,
>>                                   bool has_format, const char *format,
>> +                                bool has_force, bool force,
>>                                   bool has_read_only,
>>                                   BlockdevChangeReadOnlyMode read_only,
>>                                   Error **errp)
>> @@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, 
>> const char *device,
>>         rc = do_open_tray(has_device ? device : NULL,
>>                         has_id ? id : NULL,
>> -                      false, &err);
>> +                      force, &err);
>>       if (rc && rc != -ENOSYS) {
>>           error_propagate(errp, err);
>>           goto fail;
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 8476277aa9..6ec593ea08 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -202,9 +202,9 @@ ERST
>>         {
>>           .name       = "change",
>> -        .args_type  = "device:B,target:F,arg:s?,read-only-mode:s?",
>> -        .params     = "device filename [format [read-only-mode]]",
>> -        .help       = "change a removable medium, optional format",
>> +        .args_type  = 
>> "device:B,force:-f,target:F,arg:s?,read-only-mode:s?",
>> +        .params     = "device [-f] filename [format [read-only-mode]]",
>> +        .help       = "change a removable medium, optional format, 
>> use -f to force the operation",
>>           .cmd        = hmp_change,
>>       },
>>   @@ -212,11 +212,14 @@ SRST
>>   ``change`` *device* *setting*
>>     Change the configuration of a device.
>>   -  ``change`` *diskdevice* *filename* [*format* [*read-only-mode*]]
>> +  ``change`` *diskdevice* [-f] *filename* [*format* [*read-only-mode*]]
>>       Change the medium for a removable disk device to point to 
>> *filename*. eg::
>>           (qemu) change ide1-cd0 /path/to/some.iso
>>   +    ``-f``
>> +      forces the operation even if the guest has locked the tray.
>> +
>>       *format* is optional.
>>         *read-only-mode* may be used to change the read-only status 
>> of the device.
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 634968498b..d8b98bed6c 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>>       const char *target = qdict_get_str(qdict, "target");
>>       const char *arg = qdict_get_try_str(qdict, "arg");
>>       const char *read_only = qdict_get_try_str(qdict, 
>> "read-only-mode");
>> +    bool force = qdict_get_try_bool(qdict, "force", false);
>>       BlockdevChangeReadOnlyMode read_only_mode = 0;
>>       Error *err = NULL;
>>   @@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict 
>> *qdict)
>>           }
>>             qmp_blockdev_change_medium(true, device, false, NULL, 
>> target,
>> -                                   !!arg, arg, !!read_only, 
>> read_only_mode,
>> +                                   !!arg, arg, true, force,
>> +                                   !!read_only, read_only_mode,
>>                                      &err);
>>       }
>>   diff --git a/qapi/block.json b/qapi/block.json
>> index 82fcf2c914..3f100d4887 100644
>> --- a/qapi/block.json
>> +++ b/qapi/block.json
>> @@ -326,6 +326,11 @@
>>   # @read-only-mode: change the read-only mode of the device; defaults
>>   #                  to 'retain'
>>   #
>> +# @force: if false (the default), an eject request through 
>> blockdev-open-tray
>> +#         will be sent to the guest if it has locked the tray (and 
>> the tray
>> +#         will not be opened immediately); if true, the tray will be 
>> opened
>> +#         regardless of whether it is locked. (since 7.1)
>> +#
>>   # Features:
>>   # @deprecated: Member @device is deprecated.  Use @id instead.
>>   #
>> @@ -367,6 +372,7 @@
>>               '*id': 'str',
>>               'filename': 'str',
>>               '*format': 'str',
>> +            '*force': 'bool',
>>               '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
>>     diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index c4e5468f9e..a931174397 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -1529,6 +1529,7 @@ - (void)changeDeviceMedia:(id)sender
>>                                          false, NULL,
>>                                          [file cStringUsingEncoding:
>> NSASCIIStringEncoding],
>> +                                       true, false,
>>                                          true, "raw",
>
> The addition should go here, after format options. With that fixed:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>
Nope. Either we should fix prototype in C and JSON all around,
i.e. put "'*force': 'bool'," after
" '*read-only-mode': 'BlockdevChangeReadOnlyMode' "
in JSON, or the code is correct.

Den

