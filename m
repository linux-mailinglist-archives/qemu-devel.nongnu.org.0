Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F025B59D6BE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:53:17 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQaz-0005O9-1I
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQQXP-000159-41; Tue, 23 Aug 2022 05:49:35 -0400
Received: from mail-eopbgr20131.outbound.protection.outlook.com
 ([40.107.2.131]:47467 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQQXM-0000cW-IZ; Tue, 23 Aug 2022 05:49:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6O9Fsoi1BZjl4vW/fuRw6cAUlTPhH8Qr2iBgVOgYEHcpFN5vAw17F/S8mGLcRCf6Zu4esvnDZwKX0gd6WT3xeDqmotLUq+1ci7dJV5HfoLkBTYUj+wn1CjVvBXxnEUxYB3qgR4B4p3OuyWvV+YWk2PB3dDr8PANVS4rshIOq03n/YtkqOmDB408s9MQd62Kp09tUs2UIuDVdrhugCMnu6i3K5RaNOJYrvJJAQFESrcSvi2N+DzxseTUxVklh4S/xxrJPuc2sLbLxmdjZNMnIwNS6o8cZMmS858aI6+wjjLZiV8b8hCCTKyTQH6FZbju6F8uHzdR2H02k2/QvHEwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtccjnhCDjSAiOS1YsYwq5ZNpTtKXKl+YgXfaT8o/5k=;
 b=cUxn5PYKCvk0Tg3vAT+avqNtlbjzV01lA0EWwcXdI6xr6Fc02FWs/WBIJpO+QNvAEHQ57srGB/nHV3E9T8gm8BMXwySISBkJNrFEXAAEKRzk78gd9IdzEWT7rUAAB3gFNsp8spzyjY+b5U5O8l+4nDOnHvPVjjP6t5AExOzsCMap12ewSdkTqf/WicGgXiqgbHW6+Y9OFmngRPyyEuYGXRr0aNNJW0/1MTZg/m5ipstx45rzUwH/3BwRroVndOjN2nirLtubU4VkwYRw0r7bVwlXFZvgq9kMuS4OozVw33QvLkfkaHh1I3M/H+Cm0Z3SgWOfFLzxYtlvU9wlG1jj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtccjnhCDjSAiOS1YsYwq5ZNpTtKXKl+YgXfaT8o/5k=;
 b=ocnPpO4QSKdOi4DGd9QknO8eK4wrt75qllBJHD3y2aulqxYPfnQXZR6GUHCyO8QeaSGLTNqBoHgG/2hbVmBw9kTOKX4AktT/mTyHLDxHQK7BtCJiQuI+8kBkjmEyPNr1dNp+lekXZGIeMvhoWfcB7joaK9e6ZwGsM0s3zuDnJc9uRq5VLqc4YFdqbOFSjCfRjnIH81EuWftN/RDJPuLFjIZhl5FNhHh1xnH/Piy6sb3YrdWzPIWGNY8ciDNq649F5wEDepByhKGDcExmximRyMplswgKHCSoGqU48r77Ky7KBiGhRfJS2QAKSd9aAydtNoSR404K9CFvcLh1mOJADA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 09:49:27 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 09:49:27 +0000
Message-ID: <38e12fb0-771b-4125-9f82-44d748469e63@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
In-Reply-To: <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff70c0e-a309-4902-c55c-08da84ecc49f
X-MS-TrafficTypeDiagnostic: AM8PR08MB6466:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQ36Wf3SOfSsYza4UIJVM/MbFGHxkTDALmkDPCjEYmrIy9fYLLc21H82muGBX9lCx/BcQFrCZxZM2n1+LIYH34xA8GKZlhbP02uurZcVAJCoh+Y4OcYVXGV4CE+HF2+3vrar+FbjpnhjwejqQS2xrhJfUZzz+whFNURr3oueAEG+m7HJGJzdv/EQyHu5JyEfQCTSYTKBlElHHdLL4AiOCi9F/6bjmprpozebY43Ug0D8mLb+TwGZm2FIZEWhwZxCNAV8fg+eIURh6yYseS/opTkiKHa+M8VZ1cJim1nv9QOekji5/vxPnCr3PVh2EDNhLZQtfOeTztfK6wWPRSsMI2Uczur8bygmH8lYbFgWEwd/OWfKjAZOUzpqh8sfGjjV3zfec4VkjdgnKiEuwRXoUIPmaTfVtGDapsbvaLXjf570iPPaJwjK8kTTVpJtbVyfDE310vyVeORXCQ/9mQ7HAmVzVoEZeqxk9VJvIRWmT9E/jYiAueBDSqF6mT8rfc6hkfNP0wI5hF396EsT5v0MZN9RUcSG1JJC1IlgbrSpuZF+nlXvJ07r/SK/LwD0b5WOs5zISkb4wXD2hFkERgCymhrWRzHpy0w4gqhzhJAZ5PTCARNEPjSlKNWXkuHc/tfEVoNd6BIUKBF7quK1TGyIe/wpicCgvd5YnZ8dfyfv1Q16laJw1iNTRjUrvLQVFvkYGNeRT5fXiqxuFw9GD/5ZXb5DXYMtfLADe8gcu6qYjmJ8Pri9wbnzOAx36dSMkpVIJUybn7Qu0kedkkFFfTQkldwwA+PichviBHm1iO/PjQWHlc29waH+YFhGmtz1zq3NoiZr1DyHIy7wNNnS5QjMSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39850400004)(136003)(366004)(86362001)(31696002)(38350700002)(38100700002)(66556008)(66946007)(316002)(66476007)(8936002)(110136005)(2906002)(5660300002)(4326008)(8676002)(2616005)(6512007)(83380400001)(186003)(478600001)(6666004)(52116002)(53546011)(6506007)(44832011)(26005)(31686004)(41300700001)(6486002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azZUUS96Nlh5bFVCeUhmaUpPS1p4eUxuNmtLLzk0bDJGN2s4SmlhVXVrWHhT?=
 =?utf-8?B?eU1rdXFmVEh5OXNaVnZrUVMrYkJCd0JoNmU1bDhxRnRJOVhwV3BiR0p4U3FI?=
 =?utf-8?B?RC9EN1lRcldSdGJpbGhOTDJjSHQwSXlmbC9pRHJGckhUSHhpNkUvemdqYnBa?=
 =?utf-8?B?ODJodHE2R0g3VlpqQk03VlBQUEhrenBOSkplYksxWWxmSW5keWlnSlpzYVNN?=
 =?utf-8?B?NVZhT1cwRDBLUE1FUXpHQk92cCsvYnhBTEJqbVhtVWlxZUxUMWVSbjNMR1Yz?=
 =?utf-8?B?K2NpNHZLK054VUh4QzlOdjBteVRaODFXKzNCNFBXQzJWQkNaZGRQWGpWdW9U?=
 =?utf-8?B?b1F0cDVWTXpXa1JsSFJaS2o1TS9TMGJyZEJERnhBVnBXak14emFFWjF5YzIr?=
 =?utf-8?B?RnJ3YXM2bnMwWTA4dUFJelladGZFT2lmWE9RajhKamppdGpISjllMDJoYnUv?=
 =?utf-8?B?cXlzS043V2tWeEp5MkNFRHhvdlU1Qk13OUNYRFd6QXZsaEJuZkM3SXVneHA5?=
 =?utf-8?B?Y0FOL1F0eXZPOE1zYldwaktScFVjMkxTc21aNmx3dVlMai8vLzdQb2lKRk1u?=
 =?utf-8?B?Mk8zK3AvMGRpUlU3Ykx0bENkc3d5cEp1MkY0cWl1NElqVW5BOE1vMzRHanZ4?=
 =?utf-8?B?NFpCTi8vajZJOENSYnBxVzNRWHlPa3IwQTdXMHhPdHdKdmhLeGZkNW9wNnVJ?=
 =?utf-8?B?U0FuOVNxcDJ1aUQxaW5ORXYrWGZ4VitSOWpicTlyMVgvSmFIRFNnTzVjYzky?=
 =?utf-8?B?cVF4bnlNSXZ0dFg5cm9WcTFkWjNHSWxTOEYvY1VxTWxnSmwwb201bDRXVXBj?=
 =?utf-8?B?WFFHdlUxS2xmd0U5VWhWa3RlSEF5dENtc2pXUnY1NnAxZlhGc2V5TUVzd2JS?=
 =?utf-8?B?Rko1TGllV3dnY1Y0V3Y1Wk5MdXBjdU1ad015NnZrYzU3K0dVNHU0U1VHTEZD?=
 =?utf-8?B?UDY4Z29MQVZnOXhMZVZqd0FaYTQvc0I1dHh0b1lBcStQeXFiQmtEU0FMRUdP?=
 =?utf-8?B?eWlXTm1QTm5WcTdnUzdsalk5UEpjRjR2MWVIMXZRSGMyWEFmOWdmbHNUWjFm?=
 =?utf-8?B?YkVGWUowdlJ4ZFJqSTN1ZVRQMnNzSVgxU0MvdFZPVVE5SVo3eXFFcURHYnpC?=
 =?utf-8?B?dDYvQkgvbTJjaG5aclpEcG1pRDJCODg1dlg5cHJQeTVqcTVqVXBETnNFRDBo?=
 =?utf-8?B?KzVjMXNNMHY2YjVQZlFYQllSa2RxdlBGWlpDeW1Qd1E1N1k1QkNRLzFqQ3Qz?=
 =?utf-8?B?MWxnRnFwS1pFM2lLUnF6NW1QSlJJNWdMVUtDRVRsaUpVTFBZdzhJd2l3ODBL?=
 =?utf-8?B?dFRXcjM4anNtSVBDTjhvdktJalVEV082SSsyMjZQZUdqbDRNZG03bHpzdXRh?=
 =?utf-8?B?enFudGl6TFNhWVcyY1NRdVVRR251M3JUeERQMWN1dWpHVjZMWGFqd2JGOExM?=
 =?utf-8?B?N24vZm1Pd0syb0NKTEt3RXA3V3VYQzFCODZaTHVDSStnOVREVm1KbW94bEd5?=
 =?utf-8?B?K1RtNnBhdTlzWGpFTGViaktQOFprM2NVRzJCZFhNQk5GVExQblJ3aC85SDRy?=
 =?utf-8?B?WUk1ZmRLNkgrKy9DSEtXSzZzeEZUN0JiOTJMN1kxTzhybGZTeWNtS3FEU2xR?=
 =?utf-8?B?bit3Y0dpNmc3U0p1cHVNWEswNTBUTURyQXRCeVZTbDFuTSs0ZVV4RW1TeDVD?=
 =?utf-8?B?MDUrK1ZKUUVTenZkbTdYaThRTkN6L3h5MXV3M1RBYUJidFExMmd6NmdlaXBJ?=
 =?utf-8?B?WUhwd2pMRnEyTGJjcWhXeENNcmdHbStGbTVvc0crZjMyQnBPamp0eXZEN3Yx?=
 =?utf-8?B?bTlYLytrMXhGWTBmSm40OTMyY29iditJUk9ERkhjLys2ME8zaHJsa0pNRzZ4?=
 =?utf-8?B?QmJTWWRpTXFUS2VrS1F6TFZucCtrdnlJQUpua0dVdkJydWJIcTZZYlJHdlNH?=
 =?utf-8?B?OHoxVUJlWG42M0MySzFtWW5MVW9KTW9ndDR1cEJ5RUh1UHRVRWVqVTFNbEV1?=
 =?utf-8?B?UStRSlo2VjVqb2paeWE0VlVRelkwNkE5bDcxM2RzNE5jWHpxNlNaL3RLSito?=
 =?utf-8?B?SG5DK3lkODdPNFNCdWEvaFliUEt2OHlnZHdBcldlYkh2ZkQrS1RleThRWVcy?=
 =?utf-8?B?Y3h5bnhzcFFDUWFnd0hzY1JmTGIwL3JjemZxOWx5RG1mZ1FNclRLWExWL28v?=
 =?utf-8?Q?9MbGMPg7zsczqRVvhnMgvyk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff70c0e-a309-4902-c55c-08da84ecc49f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:49:27.3237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ffMBDJQYNRhuwOHHJ+uCrpyl9JO55j3ZxvdeM91raUcPmCgmbHQwe2mOaJphot4/xDcrN/Fy/BDtDerO6XTPFq/rsTLgR1QjW+l8Kw2Z64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.2.131;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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


On 23.08.2022 11:20, Denis V. Lunev wrote:
> On 23.08.2022 09:23, Alexander Ivanov wrote:
>>
>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>> data_end field in BDRVParallelsState is set to the biggest offset 
>>>> present
>>>> in BAT. If this offset is outside of the image, any further write 
>>>> will create
>>>> the cluster at this offset and/or the image will be truncated to this
>>>> offset on close. This is definitely not correct.
>>>> Raise an error in parallels_open() if data_end points outside the 
>>>> image and
>>>> it is not a check (let the check to repaire the image).
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>>   block/parallels.c | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index a229c06f25..c245ca35cd 100644
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
>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState 
>>>> *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>> +    if (file_size < 0) {
>>>> +        ret = file_size;
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>>> +        ret = -EINVAL;
>>>> +        goto fail;
>>>> +    }
>>>
>>> If image is unaligned to sector size, and image size is less than 
>>> s->data_end, but the difference itself is less than sector, the 
>>> error message would be misleading.
>>>
>>> Should we consider "file_size = DIV_ROUND_UP(file_size, 
>>> BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>>
>>> It's hardly possible to get such image on valid scenarios with Qemu 
>>> (keeping in mind bdrv_truncate() call in parallels_close()). But it 
>>> still may be possible to have such images produced by another 
>>> software or by some failure path.
>>>
>> I think you are right, it would be better to align image size up to 
>> sector size.
>
> I would say that we need to align not on sector size but on cluster size.
> That would worth additional check.

I agree on it for "WithouFreSpacExt" image format.

For "WithoutFreeSpace" format there are two restrictions:

1) the result of (cluster offset - data offset) must be aligned to 
cluster size:

2) data_off should be aligned to sector size (0 in data_off leads to the 
same restriction).

So file size can be aligned on sector size, but not aligned on cluster size.

Should we check dependent on image format?


