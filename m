Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1E40A882
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:47:33 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3AC-0006ZL-8b
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ37n-00058V-39; Tue, 14 Sep 2021 03:45:03 -0400
Received: from mail-vi1eur05on2097.outbound.protection.outlook.com
 ([40.107.21.97]:12672 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ37k-0000dx-28; Tue, 14 Sep 2021 03:45:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXiVcmL8hvLXKjqoNEYBJYis3wz3S0afM4UvBcFmJ/5+PebGTrKgx2HJuj9VE/wt1I/onNy9DappI9eClC2UH443wRPUHkx03OCNYEOhMJ91TrVcaAOtM3dt92g0T/0NaQN69ae/vVA4qdDKMnEzg2sMqcOV6F3DfO6Y8Vypb5gJNFGxe4EI1his76Pvu8YTX7XYtVMVzydXIEps5TJfDgR+tuR+tPboXc2cJWjGNEJlzff0byDI8qXgcWdKylYHUYRNRm03A57MsJ0xsksduYhBIJ+Ww4pIsh28bI22Jp9OK7qW6YW3x7agtIfAqSxAqo0V100IqlFxT9e5kGL6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=e5trcYHimaHrID83F8gmJzT/XksQbDaM1cP9GtYUQjQ=;
 b=oeP12e3jonSXOGKyFs4D02Z0CmRymutImTG1O2bA3IoIUk2U7zSx8qHGGnpgopmofKrm8DZ5SIofrWjOXHfXBFUDX5tZmAL+dwkbzR5QjiDisFt9skCu5ZDAK03TXuOQQ9SlU1XKNfl5ZWPvUrwX8fqDHPFGendRQfGO92wc8YCs3G5unv77vVOpCi7PaGkBJlcgLOH/4J721yWf9QsAASU+LMhZTwwbaNbZQrjAET7vKNIpF4U+snlIctspL/stdyW0JC07md7SzADK0y6D7h6DSrjfWhKl39Z44huLwybm9ZhV9+MaV0STtDZpEUjSmZNYBVTEfONnKmAzH8cs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5trcYHimaHrID83F8gmJzT/XksQbDaM1cP9GtYUQjQ=;
 b=SfKuy09Xwg4/Gr0NszIFJivrZd0a5zsf5qdXauX1lHsL/TrzQKtIC8frspDWH1fHTwvatqG8Tgw1FjOtmBFo3Q9EIyH9SA1TbJlRk3AT9vBhGXiACVQOWD3NUOCDQMxlorESxC9YEV5oZdCuEBLa4CW5rnEOx1ZhtOXSRwEiJ9M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6503.eurprd08.prod.outlook.com (2603:10a6:20b:33b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 07:44:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 07:44:55 +0000
Subject: Re: [PATCH v2 04/17] iotests.py: rewrite default luks support in
 qemu_img
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, jsnow@redhat.com
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-5-vsementsov@virtuozzo.com>
 <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <594fa5ec-886b-3216-f002-37c2b1cd09ed@virtuozzo.com>
Date: Tue, 14 Sep 2021 10:44:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:102:b7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 07:44:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142faee9-644b-4fa0-47ef-08d977538b61
X-MS-TrafficTypeDiagnostic: AS8PR08MB6503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB650359F19596D74170F6EA73C1DA9@AS8PR08MB6503.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJbBOzX7GIYbkPvpzwBiWo9u3iuMV9tskCY2BrxorVD0UIVNfUmOd4M4BMqnZNWF/60lulgdRNpyTYpE7Q9d62PL0uV0ZKhlTqXugyi3e+LXKc1VDjtIwokDqt/z5sVJleavD7A3OdPXLU5679hjqSw03uHS/3ye0clBIfZEwgot8/Kbr/q2rxCtF42SFLgwE9LiVkuxlDSK4rhens9qUmXOMW6j5rhc8zpLJwxszmED8P5P4LxkbnCrxNjA90IR0rwvIzeHXnlvK/1GmH4MbSkOMJ1c2uOiShG/QDcLN1ua28IRPafvPQzWUcDlvQb2TvTuO//Dlw2EmY6fni/+tHG/BTLLu+SEKZYjYT8l12TV1Po7yHDDQ1PHlXyDhfZVvA78tW1AWn/nGDFWT+80ChAc8PhPah07dmN5nfHxOwM3Dtu4GReINrOyKuZrAOT3K9NSFgAVHx3cd7ZCPqvUo8Ysgf7cLI4jfanB6DKV91zWuQOUzOKBTjXHR8eiwjmRyp8b0IIzvlvu8lOdN97upinwzQOiKRnHYHSoPs+3Edvn97EyZt+xRlSYs0HxoIsjqpJijvhMHmIS2DDJ/bKNyzcfSkT5hLTqqWFpKNqKdK7WRrfnyDhRhAtgISik/LCXH9nca+54fpTJHaYQFE+bnLbLL4bQKsZpXFWXFiJg/8/S/5sO+dza1ugIAvq8FBcXj2niGDtSSipK5xu35l2HqrK+yp4rMxJmBMGpm4CdzDmVjoDCwB+g1DWwne4ndcDluyTfzGUedAC388CnYlbQdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(86362001)(31696002)(52116002)(478600001)(956004)(2616005)(66476007)(83380400001)(31686004)(66946007)(66556008)(26005)(5660300002)(186003)(316002)(6486002)(8676002)(16576012)(36756003)(8936002)(2906002)(53546011)(38350700002)(38100700002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2twUHNTVGgyekpta0Ntb2xwbUE1T0xIWU51RkhmajM5aTRPbVF0WmRsSmM0?=
 =?utf-8?B?ZVNsQVFqZzI5UDVJQm1OaHNsdHVMeWg5NnoyNzg5Q2cwWmxQRHNlTmU4TXU5?=
 =?utf-8?B?NHMrYjd1WU94R0VLZjREdHVUcUQxeDZkaCtGZGtFZU9kdVdWeHVsbnIvNjF5?=
 =?utf-8?B?cFoxUEg0c3dFWFBwWnhlMEpZOHE5SFpNQTlJTVlveGtFUVhVYlhvQ2puWTla?=
 =?utf-8?B?MFlRR3BYMStOa0NtbjduU250WU92YmV3Y000YXNMdFF3MkEyVWNTL3VjOVRh?=
 =?utf-8?B?Ymo4VlpzTzJlSW5yZGtaRWRJVUwyRDRWNE13azNIWnV6cmZ0a3A4MURrMk1l?=
 =?utf-8?B?VGtNdjRIVWY2NGc3T2FPZnV1enArVEdiQnJlUkk3RnJMOVBkdWNpalpTUXZs?=
 =?utf-8?B?MFEvdTVoKzdoTDBMWEkzcFRLVHh2QjNTcVc5Z0RqcGE3OThPajQzY1VEd0xF?=
 =?utf-8?B?QWwzaDVJQ2lOUVhpR2FKZ0t5WDNlUnl6STlHanBTVkwwNHE4bHdGOFpkamo1?=
 =?utf-8?B?VzkrdytJZkNLRXRrUSsydmVxYXN3clRHWVhQcTlPWlRKbGM5QS9sd0JqOTNH?=
 =?utf-8?B?NW95by9QY2wycFdUUVM0MkZFckFRMWtYK08yQkZsajZrMkFLR2hETUJ3YWZz?=
 =?utf-8?B?bWpFVUgrUkJXRHdUTE5GRnRnMHVPTEJ2UnlIb1RpbXZBaHp6Z0JZL3F6SU9L?=
 =?utf-8?B?RlhxU1RWNW93c3h3alkrRjhQdlpKOUpmSHU3TUJxRnRualIra0hpV1oyV25L?=
 =?utf-8?B?L0Q0QVdiMzdYdFNGUE8zVm1SbGNFeFo4NVZIdmRoY0UxSFRPSWNoSzlvSmk2?=
 =?utf-8?B?WmVBMCthNGFqNW1oTXNValU0NmJ3NWRCMTltRXZmT2FCWTZ4VWV2WERldm9Y?=
 =?utf-8?B?cVBFdE5MaXFKNFI5ZmxzNS9leGxaOFRkSHh3WjVYSmlYbURhVUdDUi9JUXpz?=
 =?utf-8?B?UFM1OFA1alUrcW5qMzlFY0x5RFZNeWpBT1h2Qi9xZURlNXFKWXMvNlpGME9j?=
 =?utf-8?B?S1gwL0NxSDFZU0RkM05VRit0alZ0N3d0V2pIVkZjVGZJMWxwc0ZOVlFxUkRB?=
 =?utf-8?B?dzlzY3hVWmpOR3QvZGNCUEd1RlMvZWZRRXZsNlBlNzk0N1FXZ2NVZHdMOW5z?=
 =?utf-8?B?ZGRycGhtMWtobklkVUlNNG9sT28xRVRHTFltYUFrSWVIUW53cmIyMitEa09v?=
 =?utf-8?B?Szc4dDhMWmp5cWNJSWk4SVVFTVI0YlpNV2V3S0kwM2Jza2hCWWZTSEczTGZK?=
 =?utf-8?B?MzdXeUV1TFp1aHFETXBjWGs2TmN0Y1I5cnoxeit0MWVYTUJBQ21UTUM2d2hL?=
 =?utf-8?B?TGxwYUZJNExhYzF0T1BiRkxuY2pqaGgySEVEd25tc0IvcnVJYys2TTdUWW9N?=
 =?utf-8?B?SVJZOElLdys3NnNHNXV4d0d4UXBVR2JoRXFON3hJYVdaWHhrM09STlBCODV1?=
 =?utf-8?B?Ynh3TURCb1JPUDBRNlZLNnN5Z3BmNnJHS1FBelJVYUZJaXZyTkg2UnpFcFJR?=
 =?utf-8?B?VWFYZ3NQMTVHSDFjSTNzSWFoUXJ4QzMxZVh4MjhjMVVWTDIyeFJwZDk1U0RT?=
 =?utf-8?B?S3FjbzJONEtQMi95UmlKekEyUDYrV29MbXNZTVZFejQyRFZBbDZ5QzRnUnpF?=
 =?utf-8?B?U3FYYTVSMHZKSXptZlhwNnMvN0Rjb0dsVW45QktFRFN1U0NFazU2RHgwakNz?=
 =?utf-8?B?clNwWXJZUXc1N2IvbjZ6bjNlRzdEL1BNRDNObWNpS3JEUVZYVjg5eTdiRUts?=
 =?utf-8?Q?7mNEtdyfB70aQMOXA8q/Qb0qDjvvWOgHo4GwiJq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142faee9-644b-4fa0-47ef-08d977538b61
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 07:44:55.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhaAPP2JoACzmPbbNFBUG8fdsu4z7kC53d+Xjsi6f9yvYwdiBUTzmk0vzBPe7IT0SSihJjjQtYRIyJNAMMMGdcTdmlalPYpaKh+B1abC6Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6503
Received-SPF: pass client-ip=40.107.21.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

13.09.2021 14:16, Hanna Reitz wrote:
> On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
>> Move the logic to more generic qemu_img_pipe_and_status(). Also behave
>> better when we have several -o options. And reuse argument parser of
>> course.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
>>   1 file changed, 17 insertions(+), 19 deletions(-)
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
>> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
>> index def6ae2475..484f616270 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -128,9 +128,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>>       args = args[1:]
>>       p = argparse.ArgumentParser(allow_abbrev=False)
>> +    # -o option may be specified several times
>> +    p.add_argument('-o', action='append', default=[])
>>       p.add_argument('-f')
>>       parsed, remaining = p.parse_known_args(args)
>> +    opts_list = parsed.o
>> +
>>       result = ['create']
>>       if parsed.f is not None:
>>           result += ['-f', parsed.f]
>> @@ -139,8 +143,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>>       # like extended_l2 or compression_type for qcow2. Test may want to create
>>       # additional images in other formats that doesn't support these options.
>>       # So, use IMGOPTS only for images created in imgfmt format.
>> -    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
>> -        result += ['-o', os.environ['IMGOPTS']]
>> +    imgopts = os.environ.get('IMGOPTS')
>> +    if imgopts and parsed.f == imgfmt:
>> +        opts_list.insert(0, imgopts)
> 
> Hm.  Yes, IMGOPTS should come first, so it has lower priority.  That means that patch 2 should have inserted IMGOPTS at the beginning of the parameter list, though, right?

Now looking at it closer: no, patch 2 is OK.

It only put into result:

1. 'create'
2. -f <fmt>
3. -o <IMGOPTS>
4. remaining

and that's correct

> 
>> +
>> +    # default luks support
>> +    if parsed.f == 'luks' and \
>> +            all('key-secret' not in opts for opts in opts_list):
>> +        result += ['--object', luks_default_secret_object]
>> +        opts_list.append(luks_default_key_secret_opt)
>> +
>> +    for opts in opts_list:
>> +        result += ['-o', opts]
>>       result += remaining
> 


-- 
Best regards,
Vladimir

