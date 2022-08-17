Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AB597720
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 21:53:52 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOP6t-000625-E8
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 15:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOP4U-0001Js-3a; Wed, 17 Aug 2022 15:51:22 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:65088 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oOP4R-0002tv-9O; Wed, 17 Aug 2022 15:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvQ3fAuJmERf+K37KcjnsVtcCrAvYevMDi6kn+90bcKD6ks/4H95mwj8K2yLRYFVO1+kxEB2z9cMGXclhvRsT6+JWFe4yNAHIrVdfcJU5IduerZTLlUIUJEAc3GisyzGkxbhsts4z0or4HGSNYMJ9zAyQdVaaU47uNbAf7ne2o4uD/ODSl9EcpyWFS7oqydnb3/3euRLsDs6H1Uu4Rh0ch/vCeUbGPCWvfpsVLlNL14b1b5mB7L7Tpw9Ww2gwPpNEO5umtN6PKZyuB2eNE85LN2GT049DNblpGhs6sGt7kTkjO+eA6goq7IhXEIOowAit/EFibP0nVTx6X1IkHh2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc4+vX8COoIMp6Y0tEvye1RCFO+6Yd5ctlEjGKEB1+4=;
 b=N2qouzTnB/MdKogxs5vJAHVrdxT4m+imOHD4cEW99DziKvThqNwH/NRniU/8r2LeRcPdv7zzhZk9xVa5pc8eld3A/4jCzKyXSI2tZo+6d+rfFWlv6GcsxleX54/YUPdDpV+dSlcLsUUt2LgThh3IlA4wT5R0A71JZ7T4TKPy0Rfb9zQXIgw4XGjtlgo55oRsCgEbOrv/WhvGgRqZMeAonLQ599YIZHcbaMhA2Di0sJfrPk2p8ACE4soMGb2yCgnDDu625Ad+Ier5B/mqNHHfnfUU/wiD7C58vBgQ+jUhbCKwwljcus7nm5R/yU5ea2O2qugiNVYx+PGPgqtfmolRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc4+vX8COoIMp6Y0tEvye1RCFO+6Yd5ctlEjGKEB1+4=;
 b=cLMnFggupDk6xJdxzxipMep5I31AndYdLURLqrmW7oHfrvrdM6XrvWtT8mKU0dAXMWrkosRck/Zp1kVGWrTh1ce4fHYVTt12oWJPuA+ZVoXCe+sRc7FAvTSTXmKTwDtM2bHQnC5IHF5NX/fgBjuivEiifgYdlADjsdSomOMKDO6df1l9dVN6M+Ohs31nhv16R9dbeQ97vhTVZjK7Jsrl7KH7CXvM+CLmRvlVYMkrtxPzWnN2nnIjuWGVn9F0F2KHDqA/rk+3NI+MJp3kjSi4i/THHG3Vyq8F5a2qpxAZ9XxbnQ6ja9bQq66Ev//flGfv6/Aa/3X71r/eHZ1uxFGmAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by VI1PR08MB3103.eurprd08.prod.outlook.com (2603:10a6:803:46::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 19:51:14 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 19:51:14 +0000
Message-ID: <c22cdd70-e495-6e2e-5875-3b9a3667df3e@virtuozzo.com>
Date: Wed, 17 Aug 2022 21:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
 <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
 <30d44555-cb86-ae29-e781-959d6f12f0d2@virtuozzo.com>
 <fad01f34-b266-dbc7-6e19-6c29e835cbc1@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <fad01f34-b266-dbc7-6e19-6c29e835cbc1@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0191.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::15) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adf899aa-c09a-40eb-3f8d-08da8089d7d7
X-MS-TrafficTypeDiagnostic: VI1PR08MB3103:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKmFhPZxa2YgkK96f7gaHwDyskkEMEykWulEj5Gicn3r3RVd2sUB4Y8jWpf4y3lpB+O2iC3eKVOSOuwPrNw0dYPsgPoYpMsbA+o6P8OvX5up4mfrmXZliB2u43b3OTsMJkPM3rZ0DTuNPVeCHLrTYQAg6+zHF4KGnoDpeBmsGHhtsARr5najpM43oi8+yt4QmYHeqTxUgIPPDxbVgtsZLxRnI85dp65xGSrcr2YzwY6f/9sWBOjyx3vcvu8OGNha2nNRQ0ktl+LEZadgm9Xf2wcbssDFssuFudUePqMEOMuNBmrBeRwCUXQnwjZCsGTRdlqSFLLnS+wBAgEKbB/+uDqKO84Fnb0K462H1AFFWmmhk5dJ0AGEfmkNSUZWxA9KaKgKppX8flGBsO28L5H77p690PPYLJ+vGMXQTgY1hPv7dEfKgeYT5WGtjv1puLx2fhBpaWR40+01FD0uXEl0inDbhGNRJNBvC/zZjRDVsSPer5ON4AnvX8xRcsLPKiZ9IxzxHNGd4gIzgw4t20xgYFeEyjlN/riuyEe6q/CwBArLd5SSRXGzaM5G+tf/Gy/+62AceQlCiyf4blXpacypyIDAplEJNpr5mx1DvmxjJgtzjgVIud/GMxSb6mQFV4L/kpMGKvqExpfm7I78bNRQK7ilN5tabeSXiiksC8Q42W5WcowcLyJCbhI/xEdMBXaKzhcm7sMyL4NnHTHWQn/36qc5cO2ap8Ef0mVYfAqUYCEBye5teb2kRo8llILSBo/5uvxchu2v0d10Jz8x651kNyBye1ZcZu5HKn6TFJYsPpe5oaMteQJoTCNTczc8g1pWv3c0EikucuJLcZPWnHbgLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(186003)(31686004)(86362001)(2906002)(6506007)(53546011)(52116002)(478600001)(31696002)(2616005)(26005)(36756003)(6512007)(6486002)(41300700001)(83380400001)(5660300002)(316002)(110136005)(66476007)(66556008)(8676002)(66946007)(4326008)(38350700002)(38100700002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1g1NGJkNTNaL2lxYU5pR0l2YTlRaW9oaGdNbzlobitEQUhrVVBKa1FrZWpE?=
 =?utf-8?B?TVoveEJXRFVWdmY0dW9EMVR6RlYxeTVHdkNkV2hKSDkzR0x0UXRGYUlaeEhP?=
 =?utf-8?B?RWZrMmNqNU9yYkcvQTFxLy8yZFZ0NVR6bUNobTFyeW5hY05FSVF5ekhRa1I4?=
 =?utf-8?B?UTZucHl0NGRDTERMT21CZE1LYjYvemZ4NXZKMVFaUnBrM3hZRHM5RXc3anNj?=
 =?utf-8?B?bVh0SHlubnhWQ0lhellEck9mbHVBa0hmOElLMG9ZZ2tjYXcwaVlpT3BUWk1J?=
 =?utf-8?B?dVpIR0dmc29NZlArWW83d2RJZWcxYktzS3o3TXVhNUM1N2VtZWZNWEUvYUpW?=
 =?utf-8?B?SzY2bmJYcXZNenpuWmgyTnRyYnNSMWZFeERjODBvRk9jWHdqRlAzMUxEajky?=
 =?utf-8?B?UGE5clRWb1lucHUxZnF4QTlJZ0s0SjE3TFpkc0E3ZkZNOHFJcmh6QTJRVFI2?=
 =?utf-8?B?dVFSWVljQ0ZTeVlRVGkyaGFoenp1a01vUWt6cy9lcyt2alNueUNXRU1uQVJR?=
 =?utf-8?B?SVpQVGR0bE9RWEdwU09OVGpNbzFJM043UWtKUkVmek1FMHZqV0E3MU5nNVBN?=
 =?utf-8?B?a1ZBUTNHWlpOTVo2SWxabmdjcHEyaUxCOWcrbk15Z3l0VmJGTVNwOHl2N0k2?=
 =?utf-8?B?TTdlVjdkNzNNa2ZJR3FOVnF6bkEzbnJYMHdjaTFPOGp5cnJpZ2Z3UVIzbmlW?=
 =?utf-8?B?bFhIY0ZaWVAvbit4Tk5oT2JRNFNvYXU4QnZlWHIxWlY0ZzViUXh6ckczWUFa?=
 =?utf-8?B?SlNveTRrWW9QWkdNL2JPdUxBL0lpR2wrZkdRUDBFK0pVejVxZmZPZnhHbXlk?=
 =?utf-8?B?VHB6MUFjdEFHWFNxcHJCb0dCdVFjaW1EWGpnOFpkZWljN1NSQkkrSXRvUUR5?=
 =?utf-8?B?dDRuZ0xqbFVDUGR3RU0vZnJOL05wbTlNWVFoZUpwRXIxUDJQeWRuczZEL0dl?=
 =?utf-8?B?d1V2eEZjWFJxVks4NkVJRHVXN25kb2hEdjArSHdnZktDM0RDa1l2T2gzczA2?=
 =?utf-8?B?OFQ1d1dzQ2MveVJXeCtlc1U2cjhOSmJ0V2JGREZKcWJsTEVxUXNpMDg3ZFJ0?=
 =?utf-8?B?M1NGRXdaWDJQU25icjRUTEZRVzdwREZrZFNDeWJhaEZLUDVPRWJDZzBsQkRn?=
 =?utf-8?B?eTQ0ejVnZEdoWlg1MGlUc2c3Y25keHFEWkVtK1NkdTNzR1hya1ZodnU1L2hv?=
 =?utf-8?B?Tll1cVRoak55RE5hdG1jbFF0SUV4VitXb2VVRS8xZWMvV05YamxYQjNhT1M5?=
 =?utf-8?B?aEJVVEZkd00rSXM2K2g4TW9rRERxdkh4bStTZkY1K2ZSRlBiOXp4K1BGa0M5?=
 =?utf-8?B?aElJN2k5NkJpVW4wMGJnbFJrS0IwcXUrMlV2RnF1K3N5ZHRIbUtnUi9MVHFp?=
 =?utf-8?B?cUQzMDE3aXAyVXlIaVo4WFpiWENmMFZCdmFYNGEvS3hrOTV5TjZ2YzZsRW9y?=
 =?utf-8?B?S1QxRGl0WHljZlBaQ0FVcUVVbEY3VEFFT2IwaEVvQzBYV1VjUTBkR24zQTMv?=
 =?utf-8?B?aDNCQktYMnpmdkptYlFXQ0ZrWGFKY2ZuWW1lYlVDSy9uQ1loQUN0cXA1Wmxa?=
 =?utf-8?B?cVVIN3liNXlib2g2dStvTUNvbGJvYk13aXdYNUdoUU9vUkhQS21qSGVKaUNX?=
 =?utf-8?B?ai9ZaEQ5UHZlUnVMSmE1cStLRkpvTTNwRWZzMlFTbVZTQnZpcTlSQnU0Z3VM?=
 =?utf-8?B?dkhpSXRwM0VNeWxpNUNIZFBVMVh1NDBHMHZ6TndHUnNmWDhvQWFDU0Z3UWEv?=
 =?utf-8?B?T3NJZmlaS04zL09nd2ZzZDFVRHdPTHJIaDBReWROeW9nTHRrZ0hCRXlITXdE?=
 =?utf-8?B?dzAwOHBaWlRmUml6bkpzdHFqUUpab3RaQnNyQURtYWtSYi9mRy8rRk9xR1NC?=
 =?utf-8?B?VlNxV0RFUVVzME4xN3NGeEJHWkVaNFNkU0VmYTBNVi94cFJMUVZoTmJHOS9I?=
 =?utf-8?B?Y2RyYndUcWJhSFEvcXZORnA3ZWMwTXBFc1I5aURlbklKa1dSdldMdzFySXA3?=
 =?utf-8?B?bDdESHIyUW85bFJZMlM3Q01uSDVjMGIvREN2emNmem9rN2dyQjJqS1g0NHYz?=
 =?utf-8?B?Z3JyWWZpYUtrYmJBa3g5anZkajdOVHdzVHpKeWVNdjZiZU91clU3aDhoYXZk?=
 =?utf-8?Q?1sMjMLA1ypFtGFSY+MD1WM4mC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf899aa-c09a-40eb-3f8d-08da8089d7d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 19:51:14.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/nqCF4l301pNsdmm4Zns6WhOgZcITUhlPjO1VF78NbhBk29IIswByx4TdSaMd52W2w7B71YljE8M8/0vFLrPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3103
Received-SPF: pass client-ip=40.107.8.125; envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17.08.2022 21:43, Vladimir Sementsov-Ogievskiy wrote:
> On 8/17/22 22:27, Denis V. Lunev wrote:
>> On 17.08.2022 21:13, Vladimir Sementsov-Ogievskiy wrote:
>>> On 8/15/22 12:02, Alexander Ivanov wrote:
>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>> present
>>>> in BAT. If this offset is outside of the image, any further write 
>>>> will create
>>>> the cluster at this offset and/or the image will be truncated to this
>>>> offset on close. This is definitely not correct and should be fixed.
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>> v2: No change.
>>>> v3: Fix commit message.
>>>>
>>>>   block/parallels.c | 17 +++++++++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index a229c06f25..a76cf9d993 100644
>>>> --- a/block/parallels.c
>>>> +++ b/block/parallels.c
>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, 
>>>> QDict *options, int flags,
>>>>       BDRVParallelsState *s = bs->opaque;
>>>>       ParallelsHeader ph;
>>>>       int ret, size, i;
>>>> +    int64_t file_size;
>>>>       QemuOpts *opts = NULL;
>>>>       Error *local_err = NULL;
>>>>       char *buf;
>>>> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState 
>>>> *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>> +    if (file_size < 0) {
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>> +    if (s->data_end > file_size) {
>>>> +        if (flags & BDRV_O_CHECK) {
>>>> +            s->data_end = file_size;
>>>
>>> Hm. but with this, any further allocation may lead to twice-allocted 
>>> clusters, as you just modify s->data_end, but havn't yet fixed the 
>>> BAT entry.. It seems unsafe. Or what I miss?
>>>
>> if O_CHECK is specified, we are going to execute parallels_co_check 
>> which
>> will correctly handle this. In the other case (normal open) we will
>> face the error, which is pretty much correct under this logic.
>
> Sounds like "s->data_end = file_size" is part of this handling and 
> should be in parallels_co_check()..
>
> Looking at it, seems more correct to recalculate s->data_end exactly 
> after for-loop, which fixes out-of-image clusters. Also it would work 
> better in case when we have leaked clusters at the end of file.
>
> Otherwise, ideally, you should have comment at top of 
> parallels_co_check(), that we must first fix out-of-image clusters, 
> before doing any kind of allocation, because data_end is already tweaked.
>
> I agree that patch should work as is.
>

but that will change the game rules.

Ideally we should call parallels_co_check if we face a error
on open and assume that the error is recoverable like
is done in QCOW2, but IMHO this is not the time within
this patchset.

This patch is needed here as we would have tests broken
immediately once we start checking duplicated cluster
management.

That is why I am happy with this code but in general this
would need further rework. This is a question of the
chicken and egg and we can not do all at once :(

>>
>>>> +        } else {
>>>> +            error_setg(errp, "parallels: Offset in BAT is out of 
>>>> image");
>>>> +            ret = -EINVAL;
>>>> +            goto fail;
>>>> +        }
>>>> +    }
>>>> +
>>>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>>>           /* Image was not closed correctly. The check is mandatory */
>>>>           s->header_unclean = true;
>>>
>>>
>>
>
>


