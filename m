Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F32FF391
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:52:10 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2f3x-0003nk-Ml
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2f2i-00039z-J8; Thu, 21 Jan 2021 13:50:52 -0500
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:56864 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2f2e-0006yi-W8; Thu, 21 Jan 2021 13:50:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knXrmftOdOu9hnJO+oIyYKRre6I1WU5GSDbSLpuyvOME7vTqvSqDX8Q60FXUgaPqH2c3EpCdaXs6RLep8zFFugqaWHtLbxir6qhvl64dday/bZKbBA7Cbv8NXeEjAtJTTJ6hTr5qrksvqY1sy3vaRsaD/ZDkiqSzxc9+0m1DmO0qOJuHUqnrBosShMsPS+5reOiA0xzZnKvzRUTt5PnWr8nyIS+xhE1iijDNNHGPRRikuP++wYN1pcmQe4wDlPfr/t8TAOEtB1AimPVpMxD99DoyNzyuW6cEF0gthu59MaZYit32Y4aSscWA6TJAqnNqZy0UeioyGXAN5oq5XOaakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuU0zIc+bNghFq2cuRulzaYBrvVQcsklQiN4NCMXEZI=;
 b=BefOvk3FyVwdD2XgRC2H5hpPVHYChWI/2pQcX99VoOl/fglE7PZfG8NwBY0iWVuJUuAbA6woulggKJ8jPR/Pz8uXwore0kL1XL9ut+XxHDstp+lfV9IhzsANwZxPpb+1GOAUV+KHtgycP63JTH4TOZsBWYbwYUz3zOACGJyEJQsD1KmNJdDQJd0jMXyJhm5mlD1pYR9hycoCoSecmshCGx8xR7Ea2yFh5U04J7BgYBcOqsLLfe4aqsstK949AXb0fS12vYal4/IMAr1+/L8XSo5dY7UTaxGi6Q7qMrnh7TlL4SBQ/AclQw4086zb+uAmtdRD8KNb+yea7+YtYltLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuU0zIc+bNghFq2cuRulzaYBrvVQcsklQiN4NCMXEZI=;
 b=D7mAEsremg530LvlDOlGAHtrBpA657O+8C7VzsP2p86vvnjWGcLChynTyP07CAxvic/taqIjDH2QCG76+1OEfBEtgV797byCD5RheB3xiDaXGw6IZt6iHNsfCb7X0caJ7WNiW1G0OIPg+GTAOrLfGYVh85FAF1OdJcEGMpfsf04=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 18:50:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 18:50:44 +0000
Subject: Re: [PATCH 01/11] block: add new BlockDriver handler:
 bdrv_cancel_in_flight
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-2-vsementsov@virtuozzo.com>
 <f23ca1d2-b90e-d9f5-5c3a-493ef259e994@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <189ed1e3-e2a1-6739-c477-ec6de87964a5@virtuozzo.com>
Date: Thu, 21 Jan 2021 21:50:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <f23ca1d2-b90e-d9f5-5c3a-493ef259e994@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Thu, 21 Jan 2021 18:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c6d8ef-ec79-41af-85b8-08d8be3d7582
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19728B31C08E897B550EF3C7C1A10@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTgTkUjBuF9YXQUmAIJsc/NvBz+18aHKPwBUeFt7/oM55fb+vuqMah9P4qbxPaoR0NqC9MYpY+g18rHUpEkfzzYVFGmELo1POmPgIdwp5ZFPigeGrAy1jLLBAqHpmH+UO79uEb2xWIGfV46GgXFXmKUMyGYsmn1jFHgPrfbrY2CQh6KTC0mAZ15QOCi3Xa6wSQT2XTESaVuO0M4PJYF4AQT0lfYzK7vI6aJUGtfjPBU5eXzj/dW61Ij3ES/ckLffdFX2nL3uRslh6u3Ls4F1sv77tMrrGrQniYcptSEAIawpb4ZrUpFZJQBN3O3DH4FMNiogGyyn+F8C508sSUaQsf4ec6sc1ENNua1sPSMH2NlKZAV3U5WL2sY+VZax02ZRDW+6h+cAXc9gL/frYQfY1OUyQT/yejRM66nI5b8gv5tcQCxA9RzIKpEF6zZ9GI/3RckS939ZY1UV+HcT5A6bTTE01BcmZc9OTwgl87yI5GA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39830400003)(376002)(83380400001)(5660300002)(31696002)(316002)(956004)(2906002)(107886003)(66476007)(36756003)(52116002)(478600001)(86362001)(6486002)(16576012)(8676002)(16526019)(31686004)(66556008)(2616005)(66946007)(53546011)(186003)(4326008)(8936002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmJoKzA1RTdTUnMvcm4rMEtIM2tDRHRsSEp2cWdMRU9OVkQwbjBDNW0wcXBi?=
 =?utf-8?B?OWtJNnNFTWNsSUtXWTA0VDBEcTZ4NG1ZNlJMbUdKbFBoNVJTcXQ3RnZESmxT?=
 =?utf-8?B?QytaYUFYRHd5SWNta3NjMWMzRkJoZG81UGZoeS84dTY1dExiaXlVSlZ4VUZY?=
 =?utf-8?B?eWpzYkxFWGhHRW9Zb0R5YVpjMi9WV0RxZVJJNkIxRlNDWTFmb0Y4K2x2d1Zn?=
 =?utf-8?B?QzJsU1VsaE84VUJsc0V0NzJUWm9zV3Y4UVFaZXJtdU4vWlJ1RHgvYWRxcFEw?=
 =?utf-8?B?OGp1bGllZnFPWUMzajkzNThBeUkrNzVOd0dSdDhEYTU1dm9NUGZRL3EzUzY0?=
 =?utf-8?B?MU9RVmJhNnJNclExZ0R5c0xIeDQzRXFwVTFKdkdHeVNQMEEvZFdBd0tTTFZR?=
 =?utf-8?B?UmxTTVRkUlNpWXBObXRmTW5xU3NhdDMwdGtUTy9wTUFrYW1ld3Q0eG0xNFBI?=
 =?utf-8?B?OWJYbjh6Z0RxOUdQVS9XbUluREFmQlU0Z1R2MXlPc0FSZHRTY3RtcnJ0Y2xU?=
 =?utf-8?B?SUFsTWliUHJOZ1dWNm9YV1FMQXlnS2V2bzA2U1dCWEF0Z1NhZW1sbzNsWGU0?=
 =?utf-8?B?UkRoUVl1dWxJNUJLdDhXWkdOVWZVYTNZUVMzZGZ3V3l6ZVBWOHdxNlhEb2hB?=
 =?utf-8?B?amUyd0d0bStQVFFyZ1g4VzhiZXk1VzZuNDRnaTFiZUJiZFNYVEZJRDRKM0tE?=
 =?utf-8?B?Q21RTUM3dDNnaDQxRlBsK1dNMXhiZ2VWZDZ1MjZ3U2xTeEEwY2NlcXhtTmdY?=
 =?utf-8?B?ai9DYmtmOXZYNjlvcnExYXBpT0xhSnNXMjBSK3ptSUZFWmtYUlJkLzFjK2Nz?=
 =?utf-8?B?aEJjZ3ZjUmxWR29Ma3VBVFZaM1QwT1FZcHFyc0N2dnR2aUdXRDhoUytoNzR4?=
 =?utf-8?B?TEp1VVl0dGRFdjlFZm52bUZWL3V6R1dhTUZ0aUFnalp2SWRIQWp3WDRyd08x?=
 =?utf-8?B?ZHU2cTVyd2FoaXpPNlB3MG4xZnhmckpVRmlmbGJLWm83M2JYZ0JCcGZYNU02?=
 =?utf-8?B?dFZzWGZZSlZGOUJwSWgwQUZwZXZFYVp2T01qS3kySFZaS1FuMEgrSWtoUUtP?=
 =?utf-8?B?Q3FJOVlvQ2JUZnZvWmtXWXduRVhSRDhGZUMwZEN2RS96RlUweVVMdXkyY21l?=
 =?utf-8?B?dEI2UUdMaW9sOWVhMEhVeDFXQU96WUt1MUM0S0hKd0luWlB4VGpDd1hjVHBW?=
 =?utf-8?B?Y2lBU096aHRFbG5Gc2FOT0pxbGdmeUI1ZHpBSzdPNHRjbmFWdlZMdDlvWXB5?=
 =?utf-8?B?VlJpbDU3KzUrdDhnVnpMOFdYN0t0QUUyUmtBbVRtMzZaTytYYjNaTEcvY2Zn?=
 =?utf-8?Q?TqMKyLoPF0s/7BjEb8c3Qo9aLI2E6wpdO6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c6d8ef-ec79-41af-85b8-08d8be3d7582
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 18:50:44.8612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFYQhRYJ2FzFsvlkSci2fpbkWJbXWvVmA8d4nAaEY2feEbFrR2wXtQ4YTOzDdBtqZH8OxlPvswDnvCHheIYt9rpeHdm6MyJgk3iqoxTHcXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.21.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 01:27, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> It will be used to stop retrying NBD requests on mirror cancel.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h     |  3 +++
>>   include/block/block_int.h |  9 +++++++++
>>   block/io.c                | 11 +++++++++++
>>   3 files changed, 23 insertions(+)
>>
> 
> How does this relate to the recent addition of the QMP yank command?

Hmm. Don't know.. Looking in spec:

# Currently implemented yank instances:
#  - nbd block device:
#    Yanking it will shut down the connection to the nbd server without
#    attempting to reconnect.

Looks like a close thing. But actually, I don't want to stop reconnecting process, but only cancel some requests which we don't want to wait for. After that, the nbd node may successfully reconnect and continue to work.

> 
> 
>> +++ b/include/block/block_int.h
>> @@ -344,6 +344,15 @@ struct BlockDriver {
>>           bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
>>           int64_t *map, BlockDriverState **file);
>>   
>> +    /*
>> +     * This informs the driver that we are not more interested in in-flight
> 
> that we are no longer interested in the result of in-flight requests, so
> 
>> +     * requests results, so don't waste the time if possible.
>> +     *
>> +     * The example usage is to not wait for nbd target nodedreconnect timeout on
>> +     * job-cancel.
> 
> One example usage is to avoid waiting for an nbd target node reconnect
> timeout during job-cancel.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

