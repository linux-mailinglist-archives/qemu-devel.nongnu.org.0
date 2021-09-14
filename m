Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283140AD07
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:06:57 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7DE-0006zl-2s
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7AU-0004hV-3c; Tue, 14 Sep 2021 08:04:06 -0400
Received: from mail-eopbgr70099.outbound.protection.outlook.com
 ([40.107.7.99]:45429 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7AN-00077k-Ii; Tue, 14 Sep 2021 08:04:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8bDhcXG/lmuuVbNehHr5TRJmreFGx7huWv5qtyGWIxHqOZ0ExIODkjOoYCXKF8DkRKyAxr+XHDcPP/d9fqSF4fj/uOZUTdMAouqBsq8ufaFU3JnNGZO/sPQFs6nrlfybdLa40zUEYYEimpUZgiq2KFGiViT4PO7wMWFNRifCGVrZLfzpZeGCyADg6CpsaQgEuGfFf2n866ChczVXaJMpgSnw3zhvaoKcD12Yp8MsM6XkI9fGJIwC3mkUlCHtOKPC2z87cXqfCxPaX65BWPm8FRdHp5g8vWjJ+dEm71yXkSGOlyP4xG1YxiLpK8JdBXKQqQZslX4XoqyxnthNosCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fgJ3mQ/+HwgGZHiemvq+9oWXKfMTYDJoUGZQRol3OJ4=;
 b=Ntec/8I+qoHaFI3oxNzQLfE9GB9sQYdQLfOb7UwQD2UZ27uCFkEQ/zpBMLUT965Ims3VjUjUkp8vYW05LDYWfq6uZVFkEUmxdPSDtCzL0c1PVzCq1xZDntmsvkeY0gWsUFV1j21m2lhJJdwy3/Su8ADWSXpblf/PzbvGuME5mTAn6xgE4EfC92jklnrrleNEkmx2/Mdd2/Rvzk36BWPOGoAItWJuL2tXDAtdJFz+Pl08N9RRg0QsLkVHPoawAyEAVItvDqUEvNQHdXPH8UkADR/j/SH6Mf4oP1gBhQcClA+HX/edvP/yiyuJyS2n1D/uw5w2bmQtj2Mw5Qkz/yhD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgJ3mQ/+HwgGZHiemvq+9oWXKfMTYDJoUGZQRol3OJ4=;
 b=QIprenXGvkKqX5WrUl/EZaZZIy9ICLvZEo7a4DA1b5Dk4oKg9XrRSclXrG/P7KWzs6jJSSF1HJfkhWVTy2dwvW4ZlDeOTB4tORqSGI7QHdPC2YXDgFKJwflPEX9vx8b3iGVLLMXB2QzaUH5U3uAjCMM07M2zS6HGNrh9F2UDfig=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6726.eurprd08.prod.outlook.com (2603:10a6:20b:39a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 12:03:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:03:52 +0000
Subject: Re: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-7-vsementsov@virtuozzo.com>
 <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
 <f3bbb14f-bafe-b299-334f-70bc626a9454@virtuozzo.com>
 <e7a56e2f-a556-a8f2-b888-8c66b506b16e@redhat.com>
 <ffa8b494-442f-91d3-7c50-3c993837ec1d@virtuozzo.com>
Message-ID: <ec2692f1-4487-5bb9-8724-01abb47f5098@virtuozzo.com>
Date: Tue, 14 Sep 2021 15:03:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ffa8b494-442f-91d3-7c50-3c993837ec1d@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 12:03:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99b06e60-d546-4510-05b9-08d97777b830
X-MS-TrafficTypeDiagnostic: AS8PR08MB6726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6726D2083907623D3018537BC1DA9@AS8PR08MB6726.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jonQFtPcR/Ue0HnX9EviGZ3u4dW9zrn3hnLsXT594L1wTainc+ReqX+gVqe8bbEyAEFl03wUf5mwH1Rp9OPvsRj+lbQ251cRt/QPvHpkdRDsNIYah2wIn+9aHShIBHZN2JlR7ki96tRMvK6WLcAOy8uwa/dmfkoRmvFJ3bbF6FU7OH7c1uhFnSIuooSn661LTvsoK3XXLLD/49UdUpwf5KoLgNLdDh68nZpyY6tZpW6FeelY4Eml86jXA8ZBGqj5Y234jgPGCaA6StJER9rsI5XgLn7m4yLk89ApgJw/c9ZUWz37MMPivx59b8E0YBL3h4xQZMZeCw8sR0wk5ALV4I70oFZ+eRlsCh6GQM47KG9/m863IJ10kBWx1W1oEvZ18UCQNsb2VBigcZo8BWJz7ryMJsGwGvO+Wk0/8UZXD6z3HuqbVzBQI/ap/YBosqpYWACWPEtAgOvtN87H0apjWNXMKXU+CfXRooa6reGF0XRBl0NTn42KA5wzqmVomBJzxIm4RjhpcZl4VCX78TgRA0z+n9cgISCbqacpcvkzVVYQlSrbW37/+qR0GZ3G9kCoQmUqjGWwMp2Q0KqoNlk8LHajoxBR8pqrSDRYNKGMnqQXl5Px4HNPw5mwm0bV2QyN5DY30trCbIOeRn68wIk+JckF1r99CKMjf+A9eTVZbz+QIM+J2Wkrrh+/dtewRj9ENWncH36bCiWuK0DZ42glYrq0v+TfLZHeDvaZSU54M+92bhjp1Xmp34jEgKPfiy7fEvhd1ernSqPA3K3suihr9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(31696002)(4326008)(6486002)(36756003)(66556008)(2616005)(52116002)(2906002)(956004)(66946007)(8936002)(31686004)(186003)(86362001)(38100700002)(16576012)(38350700002)(478600001)(26005)(83380400001)(8676002)(66476007)(316002)(5660300002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajQxdklRSmxkeWhFclAzTUFwL2ZPNFpFeXNBV2MzYmRiRk9BNUdkUzUvZXFZ?=
 =?utf-8?B?UmZ0TCtneElUdzQxMUlNMjVoQ2JkdzY1Zk52M3B6Y2lJY3pwWkV0QTlsZGNY?=
 =?utf-8?B?QTVVTGh3ZkRjMC9qZ3VBL3VYVGZkeTVRcTl4YU1EaHRJZ2l5TVBBdlRpbVVU?=
 =?utf-8?B?VFRsejE0aDZIQlBsNUxTSVJQSUJmVTdwUmJCbDU0MFhNK0hBQThrWEprb2F6?=
 =?utf-8?B?b3k4Nkozd2pTc25Cc1g1Rk5iRjlzNC9XWWZsRTBxeEV3aXpWUmF0NGhPUWZI?=
 =?utf-8?B?V0w1TUdQenZ1TlB3ZEY3dEZ1WjMzSzg4WUxqVE5RQlZHK1I2dSt1L1BBYlZi?=
 =?utf-8?B?aVpYcUhVbnJibWlrZUxndEVmaFRQSlhmU2FUcWR1K2RpYWFkM1ZxSEVzcHYy?=
 =?utf-8?B?UzVDTXRUczBTTUZRWlZOcTZEMnRLL05nbTlrR29YMDRya1dJeEJFa1FoOXZD?=
 =?utf-8?B?d0VyNVlFNmRrbGVqYlR2eGZORldXRDlVTnJLWHZnYlM4bk9yRklpUmtXeU4r?=
 =?utf-8?B?UXU0bXkvVjFnbFE2UURiUnhud1hBR1czeEpjQ1c3MVRwSUJ5VG1kMzdsd0xn?=
 =?utf-8?B?SWo4MEczNTMrbytobmhjcjJiYmV2WkZTNndtNXdaUkRUZjRxeGNaRjJkcnh5?=
 =?utf-8?B?Q0ZMdE1kRnJ1SUNUSE0yRUlMaGxQbmhWS3RvTTRTaWhSWkwzb3JwS1RHY0dD?=
 =?utf-8?B?MnlUR3BvOEtTd2t3R1ZTK3JhRVdsRzl2VHJLall6a2g0UlFOZ1VKWUdlRDl2?=
 =?utf-8?B?YVBIZ1B5bkVrY0FvOXY5QkgrcFRLRjhBanYzQkpXTy93ZWNQUkppdXRqM2Fs?=
 =?utf-8?B?eEZoZkJqRFA4THgraVRjMnh4NnVJN3p2cUtiTXJ3ekprdE1mczVFWEc4b1ZT?=
 =?utf-8?B?QjJOMXpTNVQ3YktFb1o4S1FBQVlZUzVIYkxZamd0eHU1alFjcVB0aWYzY2R5?=
 =?utf-8?B?SjdUaXFNelB5cTJkRHFOaTJnNGtIenhad2xWbCsvTllyb1pWOEJlOHFkaUVI?=
 =?utf-8?B?SnVOL1hyUFRONGVhdVRLMHpzUG8vWVFLU21Ld3pyVUNKZGZnbzNoK3dHWTZG?=
 =?utf-8?B?MTlhWkJyMWp5RHhvbUxOa0F6OUpoWlhHVkFESzB6UVUxMlNUbWJSTjJCemdB?=
 =?utf-8?B?RnVWbTlQbXd3a3NHUjIvd2FJY05CaU02ZDFzdklQNFV3WElSbGZQMGlnbU9E?=
 =?utf-8?B?SXBzTEZmbm9FMVNEQkVXR05pVzRPRVBYZFhpczcyODVyS3pRdFhCbGtBY3lz?=
 =?utf-8?B?NHZCK3pvS043UEE3RkxaeHozdnovRS9GVU5OM3kwamhhQWZXVVluOVFNRTBi?=
 =?utf-8?B?NlRGRkdxVmhpNTdkRWg3R3diUHpxVUF3T0J4OVpnMUtRZXdtaFBZWXBPREc2?=
 =?utf-8?B?TWZsZjJ0cU16ekJHN3MxQVNVWXA1WnZjdys4bjYyb1BhT1c1QW5pUncwMjRw?=
 =?utf-8?B?bG13ZDR2Z3ZXLys5OGU5TFZpTVg5Z2hpNFJsSG16MTZRaFQ3VWJZQkc4SGtD?=
 =?utf-8?B?OEM4WDNvenBpYXJjTTMrVXhiVnRPeFpPcmg3VkRhTUhlcVY2cUYwWVlmbU5y?=
 =?utf-8?B?Y2FUVjFEQlpaQWp1SHVEUy9ENWUvblBKNDFQdTd3eDB4WFZsZVcrRW1mUVB3?=
 =?utf-8?B?a2VJdC9TRklUVXFEZUp4VFJYbHd4dVd4Um9NNFNDMVBwMTBWRUNYSFFPREhE?=
 =?utf-8?B?MDBtcFlhM3E5WDY4U1B1S2I3cU1TUXZSYnZrcUpJQnpocE9aNG53WjdtMUNW?=
 =?utf-8?Q?vkFRLA/R7DwlEkFVnk6A/HB+2dzGBaldoLRV5Al?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b06e60-d546-4510-05b9-08d97777b830
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:03:52.5679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8x7tycVbbnMynUU3ojsdvVL0+ftSDZw3MqxYshlAyxJvMb48CFkkDqaOg4wfdj0vM8OBlS9FaEQX48kLsAlCXjbUWlSSVBZYdAA8DW7k74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726
Received-SPF: pass client-ip=40.107.7.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

14.09.2021 15:00, Vladimir Sementsov-Ogievskiy wrote:
> 14.09.2021 14:46, Hanna Reitz wrote:
>> On 14.09.21 13:22, Vladimir Sementsov-Ogievskiy wrote:
>>> 14.09.2021 11:54, Hanna Reitz wrote:
>>>> On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Check subcluster bitmap of the l2 entry for different types of
>>>>> clusters:
>>>>>
>>>>>   - for compressed it must be zero
>>>>>   - for allocated check consistency of two parts of the bitmap
>>>>>   - for unallocated all subclusters should be unallocated
>>>>>     (or zero-plain)
>>>>>
>>>>> For unallocated clusters we can safely fix the entry by making it
>>>>> zero-plain.
>>>>>
>>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>>>>> ---
>>>>>   block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>>>>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>>>> index f48c5e1b5d..062ec48a15 100644
>>>>> --- a/block/qcow2-refcount.c
>>>>> +++ b/block/qcow2-refcount.c
>>>>> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>>>>           uint64_t coffset;
>>>>>           int csize;
>>>>>           l2_entry = get_l2_entry(s, l2_table, i);
>>>>> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
>>>>
>>>> This is a declaration after a statement.  (Easily fixable by moving the l2_entry declaration here, though.  Or by putting the l2_bitmap declaration where l2_entry is declared.)
>>>
>>> The latter seems nicer.
>>>
>>>>
>>>> [...]
>>>>
>>>>> @@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>>>>           case QCOW2_CLUSTER_ZERO_PLAIN:
>>>>>           case QCOW2_CLUSTER_UNALLOCATED:
>>>>> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
>>>>> +                res->corruptions++;
>>>>> +                fprintf(stderr, "%s: Unallocated "
>>>>> +                        "cluster has non-zero subcluster allocation map\n",
>>>>> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
>>>>> +                if (fix & BDRV_FIX_ERRORS) {
>>>>> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
>>>>> +                                               active, &metadata_overlap);
>>>>
>>>> I believe this is indeed the correct repair method for QCOW2_CLUSTER_ZERO_PLAIN, but I’m not so sure for QCOW2_CLUSTER_UNALLOCATED.  As far as I can tell, qcow2_get_subcluster_type() will return QCOW2_SUBCLUSTER_INVALID for this case, and so trying to read from this clusters will produce I/O errors.  But still, shouldn’t we rather make such a cluster unallocated rather than zero then?
>>>>
>>>> And as for QCOW2_CLUSTER_ZERO_PLAIN, I believe qcow2_get_cluster_type() will never return it when subclusters are enabled.  So this repair path will never happen with a cluster type of ZERO_PLAIN, but only for UNALLOCATED.
>>>>
>>>
>>>
>>> Agree about ZERO_PLAIN, that it's impossible here.
>>>
>>> But for UNALLOCATED, I'm not sure. If we make all wrongly "allocated" subclusters to be unallocted, underlying backing layer will become available. Could it be considered as security violation?
>>
>> I don’t think so, because the image has to be corrupted first, which I hope guests cannot trigger.
>>
>>> On the other hand, when user have to fix format corruptions, nothing is guaranteed and the aim is to make data available as far as it's possible. So, may be making wrong subclusters "unallocated" is correct thing..
>>
>> We could also consider refusing to repair this case for images that have backing files.
>>
>> In any case, I don’t think we should force ourselves to make some cluster zero just because there’s no better choice.  For example, we also don’t make unallocated data clusters zero, because it would just be wrong.
>>
>> (Though technically there is no right or wrong here, because we just refuse to read from such clusters.  Doing anything to the cluster would kind of be an improvement, whether it is making it zero or making it really unallocated...  If there was any important data here, it’s lost anyway.)
>>
>> Perhaps we should have a truly destructive repair mode where all unreadable data is made 0.  But OTOH, if users have an image that’s so broken, then it’s probably not wrong to tell them it’s unrepairable and they need to convert it to a fresh image (with --salvage).
>>
>> Hanna
>>
> 
> Agree. For simplicity, let's just drop thin last hunk for now. I'll resend now.
> 
> 

Not the whole hunk, only fixing part of course. To look like this:

@@ -1799,7 +1819,16 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
          }
  
          case QCOW2_CLUSTER_ZERO_PLAIN:
+            /* Impossible when image has subclusters */
+            assert(!l2_bitmap);
+            break;
+
          case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR: Unallocated "
+                        "cluster has non-zero subcluster allocation map\n");
+            }
              break;
  
          default:


-- 
Best regards,
Vladimir

