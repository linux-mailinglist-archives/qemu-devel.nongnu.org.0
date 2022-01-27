Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2249DF0A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:18:52 +0100 (CET)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1re-00069C-Vf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Sb-0001uB-Uw; Thu, 27 Jan 2022 04:52:59 -0500
Received: from [2a01:111:f400:7e1b::707] (port=53249
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1SZ-0002Yi-99; Thu, 27 Jan 2022 04:52:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGS/4tZ494SN5MJxqcwXk01Ml0Up6/TnKK7Z3u9rChk5QI1Ki+/RJ4DlF+4ZIk92SEElyRjmAPh8TDnAdaqt0KWKlsbuS3hnY25MBp9IdoNNtbBtypNBAWjXq8eywDIJYKg0fy5pyeJGu8oUNZgJCSnDU1jgSiLRlcdrzR8m4PD/HdF8EB7b8TXFFqCVfvkuvFAJbzX3eOf0o+HPB52d4GZD5DD2uHQ+2axncU+KrobpYN5C8wG8mvHKutnPv37cIoofqNmnKXREnLurK2xJ4BSxfQzp/naacgX88vUlecngjwVnCxhJfwWC0xrIRDtULDDlS8zgfcJaeLuQ7ZxnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLjgs2LQ63B3HIQM4fd4bbSSvZoMMjvlV3lxlacBizI=;
 b=E5o/uePVOgkLhsdZ7yftrkK5RJkSteHJGMC5APUqesoSu9Q0z1TzIAH26atitguv+ml+BTshhjtIBsSO74bQ9T1Kj3toNwom1MFg4TJkD7538eX12k0ZztqL21j9Jb/DI71YbDhV8AdEg3Zh7SD2USX3kJ+2HYNoNehxy9vgOxRrqeiUYYD5POanr32pRB9feXTbnTyKittaGFu4Xm/LOqkk/PbRPtluB5RoqYXVRxcFJxtVkccx5ckR+/ojLUErjP/2lh/fuf01TfH5sH/TOoft8BMDaELTpIutku03xLr6n/fMXCYv9oZuTgR/C1S2VamVfqjsHLVzz6tQmrUXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLjgs2LQ63B3HIQM4fd4bbSSvZoMMjvlV3lxlacBizI=;
 b=Ze7euO4U7HwZcYWB4cy8vXETzK2hphPo6q4Z2l7xnN4VuKPtAS8Pz1oV3PiRKVX1YTuu+pq9sKmigj3RLgxoVndKqWcyDNHHt0SDjabywpZSVHvJitHuEp4e4JgWMYHNiiPS+YYndvlmzyTQFRiUNcm//szy0Ybje8Oz2OyzEMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 09:52:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:52:50 +0000
Message-ID: <4e4e0612-4540-3d0b-0930-16536524efea@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:52:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] qcow2: add keep-dirty open option
Content-Language: en-US
To: Kirill Tkhai <ktkhai@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, den@openvz.org, igor@virtuozzo.com
References: <20220120162043.2693196-1-vsementsov@virtuozzo.com>
 <20220120162043.2693196-2-vsementsov@virtuozzo.com>
 <43532595-3327-c632-1db8-22a4168de841@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <43532595-3327-c632-1db8-22a4168de841@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3f96b94-a475-490c-cd9b-08d9e17ac782
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1854:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1854E4AAD246AA43CF743B8AC1219@VI1PR0801MB1854.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eKPFInLfAHcYzQyCKYenuxjv6t6uyEUdnEP2VCCWkTQfAYhHFkV+qiwxTKPyJoYNONCyW0kFTej2X3qVxQpGVUMNxSpy6iLr5Jh6LbCv0KB5huPZRnjhC8lBkp5W0skU4nTH3EEk4VIcqYXZrI54vA6iWcb+UvQHxDXJOIz6QplPk0gApw4tCZcyJp1gX4GYQKLOvLMjsH9IpxKO+V5xkFl3HjIH14u9p7tc87dlwdNQMJbIUm+ZbrzFCLAUGpd2KN6sXVv7rCUhnnm12Wb9ljdI0EEiq0HzULffbMH6PqC5ht39B8zJQmlNv7UbTgMJBwTXxUG/wC7wbbwKrcWvHdoRrokuCs24qO6c0E6z72OO4RN9I1PDc5K83zkDHBmIAOATqzqrK66OFdjpTYG9L4ggTmd6JN5RI7YuAnXxc++VaXhy3lgzsBh7/K5UyHjFdvgdQm44r2WppfEmCj87wiyZRm0/aOQ+wrCZTawY2wVnqZrRP3ltm/w8eEqas18x70ekpbBbVmktFyaGdIRWIOxm4DdlaTrnvOj7s1PSqakJnK+Mo1gj6BI/67tTx3oQZgunm+VuKrpCW0F+nY8Rki/Qw9GI/+lx0V3dRtel23TbR28dlT9pFuZ6DRE7R0r4KAZU4Uu0pdl/gjGJWb8r3s6iDka65EuzGlRBwRbOP4r8V1aDJJko5e1LA80nUHruYNGOPkdB1RqC7m6pDp1gtF9ZIkVtLzAKPzVxiM3DMtPxlhmPNQi2PMjXI9C6OeliZH8Qn//8KZfrc+8yc6AYnndS2TLIDSeN61xn+2XesM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(2906002)(508600001)(38100700002)(83380400001)(38350700002)(107886003)(4326008)(6666004)(6512007)(86362001)(5660300002)(31686004)(53546011)(8676002)(2616005)(6506007)(66476007)(8936002)(36756003)(52116002)(186003)(66946007)(66556008)(26005)(6486002)(316002)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REkwanVUamFxNHZYcHNuVW92TUQ3NUE5ZzQ0eW1tVUZ1dzZWV1ZvOCsveURI?=
 =?utf-8?B?ejNGWTZ2NDFQblFYVENlRUgveXdYbjRxcHVLdXB2cGNWR1ZyUDM2cHZKankv?=
 =?utf-8?B?NHlSN0t1QkdzMW9jSHBsZFhZc1N0UkJsSlhreklONjk4Q1Q4bnkwL0trOE9q?=
 =?utf-8?B?QURUN3dqZVc1U09uMXBORldLYTdkZTJEWUpEQk4vOVdxR3l3R25tVmlyblJp?=
 =?utf-8?B?OTFZN2g1K2dYZjRrdHdGcGcvbFpIVER0bmNnOUF3L1lNd09XVmNXdXVnNmNt?=
 =?utf-8?B?blRHSFI0ODFpVXdQdFhGZ2JNT3EvYnpuNC8vbkZCRUQrS2I4VmVxQXN1RWlE?=
 =?utf-8?B?eW05bVdPMEJldm9tamg2Nkd5TlVsUHJlbUlhSFdYbEx2YlVUSVFQaUkycVFo?=
 =?utf-8?B?aEcrVDlqYmxxTGtrNFVCQXBzZTZoR2R2OUhaanZzY1R2ekY3bjBJMTFqak41?=
 =?utf-8?B?UUhQdEltL01SSk5SRVFhRW52Q0JjYnFrRGpQeTVUUTFuNEdqR1R0YzlxY0FB?=
 =?utf-8?B?am9BblpNWHA0YWJ0c01BaFd5NWc2K3FRWDF2S0xyZkxkVjVJOUp1Z0tjM0px?=
 =?utf-8?B?TXh6R3FqYnhSNmx4YS9MOUJXR2JZYzNneVRCaGlLRm4zQnNSSDlWQVlNbjlR?=
 =?utf-8?B?TG4rbkw0TXJNZ01OeFFaQWl5bEk2Sjc1QkF3TExDTDc0SzdZTkErQXdIc3ly?=
 =?utf-8?B?dEZiSjJNS1V5NCtycENlL0JKMkgrY1duZzZ4aEMwUHRxTmFwWjBhQzBsQXZt?=
 =?utf-8?B?elJpaVd6S1lQUUwxNXo5dDF4MDJ5MXJGWVBtTE56dkFoZ3BmdkJsc0xLZkp3?=
 =?utf-8?B?THp5T2hTN2dhZFVHVUc3bGhuR0dJYWxuT3VwdkkyVGtwYkEySDhvU1VvbXJm?=
 =?utf-8?B?SEtWaTJvN0EyVWMzbys0RWhVamxkcEZOZUlzWkR0RncySXFiN2ZDZUNhMGZZ?=
 =?utf-8?B?aVNZV3FhMXYweVMyaEhQS0lPVVNyYTZTcnZrdHpWbm5Ccks1eDVlQjRpNGVH?=
 =?utf-8?B?dVdmZ1IxV2ZXSFN6a0pLVGZKNk9ieHdwWUpXZmtvaFFnUWNUZWdDUmtOL3Zj?=
 =?utf-8?B?STJOWjlvUHdoR2RSQ2JmVm90RjkrM2xxNFVsZ05qMkJLeGtQWXZBK1g0MWk2?=
 =?utf-8?B?ZklBeG9hYUV3UWxUaW12UEY3MkpjYmhSalJrVSt1aWk2citLZjhrL0dlSWR6?=
 =?utf-8?B?WExobnZLNytITVNFWHJoS2laRWNNUkVZZkd6ZDc5RFAySFRiZ0FiQlZzdGpL?=
 =?utf-8?B?bGhwZ2FUQ0g1Nlo2VkZ2WWU5MG9kQzlpMXp0VVErVUlHV3dOc2lSclQ2N1Vt?=
 =?utf-8?B?MEJxWWxrZWxnYTdHOCtRVUM4YllnK3JxMjc5U2k2RU4wNnU5T1ZqSXpZTDA1?=
 =?utf-8?B?eUpMSHZHOVBBdFI3eWw5Y1NOejMxQ1Q4KzlrYk5kTUswMGxWVCtORjhJcEYy?=
 =?utf-8?B?Y1QrdUp2OWs1Zk80R09vdjFQc2hPSnYwZnVxWWpOckdubmF1dlZhcS91VzFl?=
 =?utf-8?B?QWVFZ3BWRlhxckNSWlFLcEZpRmNqd1lsczhoWjJ1b0tQTjhJVHFyUkR5TFVu?=
 =?utf-8?B?S0JSQkxaK29pU0pVNmxvajJCNUdVQlFSeXJjZnArcVFsU0t1YkFXeUJPUGdi?=
 =?utf-8?B?VzFGdVJGczJXVTk1eHFoR2FiZVU3eUhDK2E4QTc4NXRMb1gzZzVqR2xZb1VK?=
 =?utf-8?B?Zm5hck0zay90bWgrYkRjdkNFaW44Vk9yRUlub2owdEozdFdhdXZMYkYyQmhH?=
 =?utf-8?B?RWhBYjFFZjF0ZVlmTjl6VDZhb0EyR0xXMFRPS1pyOWZrb2p4YlFPY3h0U1J1?=
 =?utf-8?B?WGk3MVdMWHhEdFE2Zk9pcUcxVTRyZFgzR3MvTDY0ekhoM256STFseU9HY2Jm?=
 =?utf-8?B?V3NaRjQzZGNKKzluRzljNHN0dWVrVEpZQXVkcWtPVzJsRnU3U2RzR0pSc01O?=
 =?utf-8?B?clpKU3JaN2dhMjVTeVB5VkJybU0rQUFoQTYzei8wZ0JneGNYZEIybkNIVHB5?=
 =?utf-8?B?THFieEJXMVg4KzMyL25SREhvRHY3MDhoUGcrM0QySXVLRmRCR0pZUHR3T1Jj?=
 =?utf-8?B?djhoVFFVRG9yMTA3aHNKenZ1KzQ4YWxxN2liN3BzSS9kYmF2TU1tdnpxcGs3?=
 =?utf-8?B?VnJyb212MlR4NTRMTlhVVGxUdEVwVUZWV1g2eXZNcjNicWpBNXd4Z2p2QmJ6?=
 =?utf-8?B?UTdUVmQxMXZVZFdxWmU4aEF6U3ZJQUZYNjJjTnNpelFaSW5SeHhJQjRPREtp?=
 =?utf-8?Q?7R4BAwqOfdgap6anT6LiGB7ibN2tNIK3yUn9JtMz58=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f96b94-a475-490c-cd9b-08d9e17ac782
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:52:50.0539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCYGYeZzUQMNRojOZeV52Cmv+favXcB3+lcjnAtO4y6KrtJHrGHRaRbW9YPASJ+7tPky0ThCjWbTj1IMVyA1WD66rR9fpxtkHVf9PYYDCIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

27.01.2022 12:43, Kirill Tkhai wrote:
> On 20.01.2022 19:20, Vladimir Sementsov-Ogievskiy wrote:
>> Consider the case:
>>
>> Thirdparty component works with qcow2 image, and dirty bit is set.
>>
>> Thirdparty component want to start qemu-img to do some manipulation.
>> Ofcourse, third party component flushes refcounts and other metadata
>> before starting QEMU.
>>
>> But the component don't want to clear dirty bit, as this breaks
>> transactionability of the operation: we'll have to set it again but it
>> may fail. Clearing the dirty bit is unrecoverable action and can't be
>> transactional. That's a problem.
>>
>> The solution is a new qcow2 open option: keep-dirty. When set:
>> 1. On qcow2 open, ignore dirty bit and don't do check: caller is
>>     responsible for refcounts being valid.
>> 2. Never clear dirty bit during QEMU execution, including close.
>>
>> Details:
>>
>> 1. For simplicity let's just not allow keep-dirty without lazy
>>     refcounts.
>>
>> 2. Don't allow to open with keep-dirty when dirty bit is unset. This
>>     may mean some error in user logic.
>>
>> 3. For implementation do the following: dirty flag
>>     in s->incompatible_features behaves same way as without keep-dirty
>>     option: it actually designate status of refcounts dirtiness. But we
>>     never clear the flag in the image, and we remember that it is always
>>     set.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json |  5 ++++
>>   block/qcow2.h        |  2 ++
>>   block/qcow2.c        | 66 ++++++++++++++++++++++++++++++++++++--------
>>   3 files changed, 61 insertions(+), 12 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 9a5a3641d0..3e35357182 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -3228,6 +3228,10 @@
>>   # @lazy-refcounts: whether to enable the lazy refcounts
>>   #                  feature (default is taken from the image file)
>>   #
>> +# @keep-dirty: whether to not touch dirty bit. When set, QEMU doesn't
>> +#              check refcounts on qcow2 open (ignoring dirty bit) and doesn't
>> +#              clear dirty bit on qcow2 close. (since 7.0)
>> +#
>>   # @pass-discard-request: whether discard requests to the qcow2
>>   #                        device should be forwarded to the data source
>>   #
>> @@ -3276,6 +3280,7 @@
>>   { 'struct': 'BlockdevOptionsQcow2',
>>     'base': 'BlockdevOptionsGenericCOWFormat',
>>     'data': { '*lazy-refcounts': 'bool',
>> +            '*keep-dirty': 'bool',
>>               '*pass-discard-request': 'bool',
>>               '*pass-discard-snapshot': 'bool',
>>               '*pass-discard-other': 'bool',
>> diff --git a/block/qcow2.h b/block/qcow2.h
>> index fd48a89d45..696e13377a 100644
>> --- a/block/qcow2.h
>> +++ b/block/qcow2.h
>> @@ -130,6 +130,7 @@
>>   
>>   #define QCOW2_OPT_DATA_FILE "data-file"
>>   #define QCOW2_OPT_LAZY_REFCOUNTS "lazy-refcounts"
>> +#define QCOW2_OPT_KEEP_DIRTY "keep-dirty"
>>   #define QCOW2_OPT_DISCARD_REQUEST "pass-discard-request"
>>   #define QCOW2_OPT_DISCARD_SNAPSHOT "pass-discard-snapshot"
>>   #define QCOW2_OPT_DISCARD_OTHER "pass-discard-other"
>> @@ -376,6 +377,7 @@ typedef struct BDRVQcow2State {
>>       int flags;
>>       int qcow_version;
>>       bool use_lazy_refcounts;
>> +    bool keep_dirty;
>>       int refcount_order;
>>       int refcount_bits;
>>       uint64_t refcount_max;
>> diff --git a/block/qcow2.c b/block/qcow2.c
>> index d509016756..1c42103fb9 100644
>> --- a/block/qcow2.c
>> +++ b/block/qcow2.c
>> @@ -514,15 +514,17 @@ int qcow2_mark_dirty(BlockDriverState *bs)
>>           return 0; /* already dirty */
>>       }
>>   
>> -    val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
>> -    ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
>> -                      &val, sizeof(val));
>> -    if (ret < 0) {
>> -        return ret;
>> -    }
>> -    ret = bdrv_flush(bs->file->bs);
>> -    if (ret < 0) {
>> -        return ret;
>> +    if (!s->keep_dirty) {
>> +        val = cpu_to_be64(s->incompatible_features | QCOW2_INCOMPAT_DIRTY);
>> +        ret = bdrv_pwrite(bs->file, offsetof(QCowHeader, incompatible_features),
>> +                          &val, sizeof(val));
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +        ret = bdrv_flush(bs->file->bs);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>>       }
>>   
>>       /* Only treat image as dirty if the header was updated successfully */
>> @@ -549,7 +551,13 @@ static int qcow2_mark_clean(BlockDriverState *bs)
>>               return ret;
>>           }
>>   
>> -        return qcow2_update_header(bs);
>> +        if (!s->keep_dirty) {
>> +            /*
>> +             * No reason to update the header if we don't want to clear dirty
>> +             * bit.
>> +             */
>> +            return qcow2_update_header(bs);
>> +        }
>>       }
>>       return 0;
>>   }
>> @@ -709,6 +717,11 @@ static QemuOptsList qcow2_runtime_opts = {
>>               .type = QEMU_OPT_BOOL,
>>               .help = "Postpone refcount updates",
>>           },
>> +        {
>> +            .name = QCOW2_OPT_KEEP_DIRTY,
>> +            .type = QEMU_OPT_BOOL,
>> +            .help = "Keep dirty bit untouched",
>> +        },
>>           {
>>               .name = QCOW2_OPT_DISCARD_REQUEST,
>>               .type = QEMU_OPT_BOOL,
>> @@ -966,6 +979,7 @@ typedef struct Qcow2ReopenState {
>>       Qcow2Cache *refcount_block_cache;
>>       int l2_slice_size; /* Number of entries in a slice of the L2 table */
>>       bool use_lazy_refcounts;
>> +    bool keep_dirty;
>>       int overlap_check;
>>       bool discard_passthrough[QCOW2_DISCARD_MAX];
>>       uint64_t cache_clean_interval;
>> @@ -1088,6 +1102,13 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
>>           }
>>       }
>>   
>> +    r->keep_dirty = qemu_opt_get_bool(opts, QCOW2_OPT_KEEP_DIRTY, false);
>> +    if (r->keep_dirty && !r->use_lazy_refcounts) {
>> +        error_setg(errp, "keep-dirty requires lazy refcounts");
>> +        ret = -EINVAL;
>> +        goto fail;
> 
> Vladimir, according to documentation dirty bit and lazy refcounts are independent:
>                      
>                      incompatible_features:
>                      Bit 0:      Dirty bit.  If this bit is set then refcounts
>                                  may be inconsistent, make sure to scan L1/L2
>                                  tables to repair refcounts before accessing the
>                                  image.
> 
>                      compatible_features:
>                      Bit 0:      Lazy refcounts bit.  If this bit is set then
>                                  lazy refcount updates can be used.  This means
>                                  marking the image file dirty and postponing
>                                  refcount metadata updates.
> 
> while this patch assumes existence of some dependence between them.
> Is there a real reason to introduce such the connection?
> 

Hmm, somehow I thought that there was some documented dependency.. But seems you are right. Honestly, I don't know real scenarios where non-lazy refcounts make sense. In Virtuozzo we always use lazy refcounts turned on by bit in the image. OK, I'll drop a dependency for new option.


-- 
Best regards,
Vladimir

