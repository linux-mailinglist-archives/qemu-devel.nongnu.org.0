Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF440ACFE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:05:01 +0200 (CEST)
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7BM-0003hn-2a
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ76q-0001ML-C1; Tue, 14 Sep 2021 08:00:21 -0400
Received: from mail-eopbgr150122.outbound.protection.outlook.com
 ([40.107.15.122]:10123 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ76m-0004Wu-BN; Tue, 14 Sep 2021 08:00:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3PQ66FB9tTrwHnIu+rUw8zmsMBnqf5jHTxAUUpMlftRZRYbsO/Eq4MyH27nCRCvpApetg/oh4USo9ZK1nrCrtBUzxNLaByFB8r5oCF1Rtbi0Xcr47kLD9T5xiSVFLnvRcg2jr4Ed8wtXqDK+QRJ1XOot3y4pfRl5eJBKpfE5TUeJvM6f2omtPBIYulc21FiBTEPWZMr5Gf85qinQx+TuudDukZ+zi7VmIJLiaBEG355lSB6zXTo/E9f+DtS+6ngazX0zFtVRcreOBa8rkzIBaY+OIABTF6ZQm26B51jbPVC3R2HE91dDzph3O2SiFXTPiZmKEEItSlWrQekYmuNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3YdTi46GrBdddlW4MbDq79vHZNSM0SoY47g4sx7uhsg=;
 b=bJnjOidKbv+gRXlkWw3b6uGrMYGmrpBiJYh+sd0rcTS3sVqOjF47Ng6A3idNlatw99cxyNrcNdRg4rydGT67OUlvtDjXEaQ1Cp9ucYD+ZPXLEMzImHY16ce5tUAl5nAlG0EkBGW0TbR9qYVQkfihxN7FftyvEQG9WDl/EYX9c9WRlzplIFLGD3RoH5enmYPoMbExov29wGKVtFGFW2/S3C4zllw8wQmTZJ2wEWga4ExtM82WIVsf45amczjDdh2P1/VmYg57wN7+xzPoNsIGSfjLSChXKkTkqPjZ/ZN71eR2jiu9TmJd7TE9j5gPqJF0oneq1n782/NgPW5wiGMJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YdTi46GrBdddlW4MbDq79vHZNSM0SoY47g4sx7uhsg=;
 b=OpZ325eMfrcu1fpsNpr5LlJgH7BYdkPyMUJScuWOjByVhOrDTCcxMtDKUl2KkmmQ2xQi3O0yMOPFXOlJqYBMQjiYI9LOhXjCKlls9NQS5bv/72k+7rUEAzzYV80cZ0J63rdaMGvExvasSqXFcGkjCRe1anDfFeCtbUYPlLoqSvw=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6871.eurprd08.prod.outlook.com (2603:10a6:20b:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 12:00:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:00:12 +0000
Subject: Re: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-7-vsementsov@virtuozzo.com>
 <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
 <f3bbb14f-bafe-b299-334f-70bc626a9454@virtuozzo.com>
 <e7a56e2f-a556-a8f2-b888-8c66b506b16e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ffa8b494-442f-91d3-7c50-3c993837ec1d@virtuozzo.com>
Date: Tue, 14 Sep 2021 15:00:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e7a56e2f-a556-a8f2-b888-8c66b506b16e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bda1eb62-9c09-4e7e-3b59-08d9777734c0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6871AD6F9A02FAB465CA433CC1DA9@AS8PR08MB6871.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U20pHqe13b9ukc2/WtIZeQ38ptW9upPUr3GCPHLxHJJN5miHsTXMhLJxj1oKYSPatq6O/ve738P05qUwBsziJO1IUsuwOS7OVGTeAsZJtxnVp/HfR3mrWcCREeBXe8KS+XJ+6m8g7qoL7alQJaop1aliyqFoOkJqqtz2bmgHrueODtGCOs5CZxYotRPwf8lc57B29twX29WbdoN+o/WidgAzj4bi5N+gnA8kSkPFrGakuyMOeGlKXxfkQEvQrB+CGaHwMO5IR9WUE8h5kv0KJZcnLqMF/FguMKSuDAdwP04RrZnGndt6CwKk9Y6cwIjhUQnGpjyaODeSc0+Cq/A+C42SlXh72LCgAIbkSykfireC79ThwXC8Dfu09+G4lrJMca+2TF2cfhsMjrHkP7lJeZZRdPEQcg0AcXyZHSWv4Al9jJIEMiWRW/6l+VselKStMkJvzy+vFpn6h7BRZKypxXjT92LUA07c90iZrRnqj0JI+gcjjXnoBxNb/EzFhUFbhn31I1YAW97BujJVoui231bL2V+Uskq2onlroy1nLy/RVms9LtedvGsR53JYTEz1ay3cnuf7Wra5YbLafMm6XiUs4ejq7db8iIL6ygGVXAPFeFGlXZDKvgnWPq+voxHo8z365aVaAWUayfkRox2eOS6G/qzRbiJ+g17nRk4JEM2F9JC65n8bT92rW/CRoSd89oO4fy+e4QagVZmS2p8OAMznoGnrckN+VZg2k4OUgiTNxYr8vSMmw8eLD9T85/MEuQGmv7igEEaDmAvuSGNQSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39850400004)(36756003)(31696002)(186003)(6666004)(86362001)(956004)(4326008)(31686004)(8676002)(6486002)(2616005)(478600001)(26005)(83380400001)(38100700002)(38350700002)(66946007)(52116002)(66476007)(53546011)(316002)(16576012)(66556008)(2906002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkE4NEZFRFJ3bzBQdXdKcFh2a1ZPUUJlQ0lEQkVOVTNMTDV2dDlTT2V5REFH?=
 =?utf-8?B?SXRHVDRsKzlyK0NHMVcxL1ZXVjlJRFdRaXd4RVFGL1BSOGZXNDVPT1FkL3VB?=
 =?utf-8?B?cHhFV2dUMFZIZUdSbFI3YlBrVEE2d0hPYzhqOVJXeGVSZW5SNFgwODR6OUFL?=
 =?utf-8?B?T3RDZU42QzlDcGIvcm9lQ2hFdWthcWlnWGNERUYyYWxPYmdzR2FURHBMbWlU?=
 =?utf-8?B?SXRISUROOWVKdTdhTm1IbmluRHR6Vnk5OElFZ3FKUW1sMnAwcEo2Vnl3TnJt?=
 =?utf-8?B?SzZlUzZIUGpGdU92YitxcFJROFlFZGFQWUg2M0pLTmxEVGVDTzlHL1dNdlZp?=
 =?utf-8?B?LzVRQm52RkdIcDdZaGkyWkhreXJXZkxUNTBvdVhYRk5WV04wT2lwNjNsaFRU?=
 =?utf-8?B?SjczZ1dnaVYvaGRRQmpIcDZwaHZkYU1VK29GaHFBZ0krVGl2TUVBWGFLcTM1?=
 =?utf-8?B?di8xL2gwNHZvWVI4WEFmU3ZFSTRXQTAxa2pob0VjYkU2OG5ON3pRemkvRGJQ?=
 =?utf-8?B?TXJrN0E5WkV0ZVcwU1R2dW9OTmtVQWJ2VDladjNJSElYUUY4RUdsdlZWSktE?=
 =?utf-8?B?Nm1kcEY1VkprcDBEYk1KSXhRL2g5cHdoM2p3Sit1aDZlNEFvc2UyeXFpVFhM?=
 =?utf-8?B?UlNvK3hQSjhuNlUyakw3TWZwWXpVdG1jc00xOWpUZUhvM0l3ZEFQcThicmN4?=
 =?utf-8?B?NHJtRmh5M2VxSDZ1cW9aWUV2S21icVFYZzQvRHJHeDljUEV3dm9JQURHelhp?=
 =?utf-8?B?a2I2cldvekJqVWRDeSsxQ1lRRG5JbEpidmkxY0RpclhuRDZYR3VrN2hIMzZQ?=
 =?utf-8?B?bWtHTWxOS0N0czZSTmhjWUtreCswbmQ4RW5OUGhucUpmdDBWZHR0UHNLbGY0?=
 =?utf-8?B?eS9QSnZGMmtvL3ZIWXorSUFnSCtFWlkveno2cDZXK3dFQU53SFRHYUlwZjYx?=
 =?utf-8?B?VEtuOVM0THd6eURhMFdYRVhLbzAyYTV3dVJ4ZXBFdGVlSXczSmhCd0hNOFhO?=
 =?utf-8?B?WlowNG1ORSs2ZHgxZFNDRlRJeDZFa3BXaWFjci9HcWVSeWdrK05qc3NOMUg2?=
 =?utf-8?B?eDdHQnJwTVMwY3A0SWRQZ3E0M1hsTjltdUxZc0lpMExWOE93YW9yRnhNR3BO?=
 =?utf-8?B?aTJ0Qk9yb0hwbERuVVk4ZDdlZ2hMd0R3QUFjUG9oZnp6bGZRdU5KN2lKMmcx?=
 =?utf-8?B?SVlNWlhXd0xjaVlDWXJhMFRTR3FMSWlmWDVQY3FnL0xOQVFrR01WQUdha251?=
 =?utf-8?B?akxLbVhidlkzUXRtSHcrbUlyNlhjdTNTOURta0xUbWZLN2tzMmRjWE9NL2FV?=
 =?utf-8?B?V2tlM2NQcmZKY2dzNVpESHlLeVNFcFB3dzVoeGVtNFFZM3V4N05SQTVHanB6?=
 =?utf-8?B?dXlBZ0lOMThobWg4QmlLejNyVjB5bndhcnF0cGhZT0kyM0xSekE4QW02bVJx?=
 =?utf-8?B?ckNHVDNDM1N2T0NQMFErdS9ZWUFTbVNrUnVjMWRQdG1Bc0hTZGQ0YW02TzZC?=
 =?utf-8?B?d1VLTW1wMUI3OVNCRUlmQzlPVXI0OVhoQUg0eFJ0ZnF1WDI3a0Rnazh5SWFw?=
 =?utf-8?B?QXRUQVRkWmw1eXlndkVwbCtYeHNqQUgvNWpzbk5QVjhuUFhWTk9YTGFFejNB?=
 =?utf-8?B?MHNjV0ExQ1dyZVA5YVFjQmNLQlN5eVBDaCttVWxPRllOMnBlaTR5MGM4YnVB?=
 =?utf-8?B?UVR1V3hIMXFiejNhSFFyK0J4SHdBSG9RTlRoek9SeUtveUJtNGhDUTlucWNq?=
 =?utf-8?Q?22gDSd8hFQ3HfWT1LvBF9ZpFMve0NXwOopKb/zS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda1eb62-9c09-4e7e-3b59-08d9777734c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:00:12.0986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t/o5Ac1DBAzhAastCBuKv8pugtTXeX39IlacAevqKeN2Hanw3tJ/xmX77tDfCp4o1wiFFK+Ri641H4CePk94MNMZraRf+B/KIMilPMbNvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6871
Received-SPF: pass client-ip=40.107.15.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

14.09.2021 14:46, Hanna Reitz wrote:
> On 14.09.21 13:22, Vladimir Sementsov-Ogievskiy wrote:
>> 14.09.2021 11:54, Hanna Reitz wrote:
>>> On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>>>> Check subcluster bitmap of the l2 entry for different types of
>>>> clusters:
>>>>
>>>>   - for compressed it must be zero
>>>>   - for allocated check consistency of two parts of the bitmap
>>>>   - for unallocated all subclusters should be unallocated
>>>>     (or zero-plain)
>>>>
>>>> For unallocated clusters we can safely fix the entry by making it
>>>> zero-plain.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>>>> ---
>>>>   block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>>>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>>> index f48c5e1b5d..062ec48a15 100644
>>>> --- a/block/qcow2-refcount.c
>>>> +++ b/block/qcow2-refcount.c
>>>> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>>>           uint64_t coffset;
>>>>           int csize;
>>>>           l2_entry = get_l2_entry(s, l2_table, i);
>>>> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
>>>
>>> This is a declaration after a statement.  (Easily fixable by moving the l2_entry declaration here, though.  Or by putting the l2_bitmap declaration where l2_entry is declared.)
>>
>> The latter seems nicer.
>>
>>>
>>> [...]
>>>
>>>> @@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>>>           case QCOW2_CLUSTER_ZERO_PLAIN:
>>>>           case QCOW2_CLUSTER_UNALLOCATED:
>>>> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
>>>> +                res->corruptions++;
>>>> +                fprintf(stderr, "%s: Unallocated "
>>>> +                        "cluster has non-zero subcluster allocation map\n",
>>>> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
>>>> +                if (fix & BDRV_FIX_ERRORS) {
>>>> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
>>>> +                                               active, &metadata_overlap);
>>>
>>> I believe this is indeed the correct repair method for QCOW2_CLUSTER_ZERO_PLAIN, but I’m not so sure for QCOW2_CLUSTER_UNALLOCATED.  As far as I can tell, qcow2_get_subcluster_type() will return QCOW2_SUBCLUSTER_INVALID for this case, and so trying to read from this clusters will produce I/O errors.  But still, shouldn’t we rather make such a cluster unallocated rather than zero then?
>>>
>>> And as for QCOW2_CLUSTER_ZERO_PLAIN, I believe qcow2_get_cluster_type() will never return it when subclusters are enabled.  So this repair path will never happen with a cluster type of ZERO_PLAIN, but only for UNALLOCATED.
>>>
>>
>>
>> Agree about ZERO_PLAIN, that it's impossible here.
>>
>> But for UNALLOCATED, I'm not sure. If we make all wrongly "allocated" subclusters to be unallocted, underlying backing layer will become available. Could it be considered as security violation?
> 
> I don’t think so, because the image has to be corrupted first, which I hope guests cannot trigger.
> 
>> On the other hand, when user have to fix format corruptions, nothing is guaranteed and the aim is to make data available as far as it's possible. So, may be making wrong subclusters "unallocated" is correct thing..
> 
> We could also consider refusing to repair this case for images that have backing files.
> 
> In any case, I don’t think we should force ourselves to make some cluster zero just because there’s no better choice.  For example, we also don’t make unallocated data clusters zero, because it would just be wrong.
> 
> (Though technically there is no right or wrong here, because we just refuse to read from such clusters.  Doing anything to the cluster would kind of be an improvement, whether it is making it zero or making it really unallocated...  If there was any important data here, it’s lost anyway.)
> 
> Perhaps we should have a truly destructive repair mode where all unreadable data is made 0.  But OTOH, if users have an image that’s so broken, then it’s probably not wrong to tell them it’s unrepairable and they need to convert it to a fresh image (with --salvage).
> 
> Hanna
> 

Agree. For simplicity, let's just drop thin last hunk for now. I'll resend now.


-- 
Best regards,
Vladimir

