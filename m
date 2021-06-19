Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC03AD9C2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 13:13:32 +0200 (CEST)
Received: from localhost ([::1]:49622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYup-0006HN-1p
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 07:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYth-0005UN-Eg; Sat, 19 Jun 2021 07:12:21 -0400
Received: from mail-eopbgr50136.outbound.protection.outlook.com
 ([40.107.5.136]:37761 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luYte-0001l0-VH; Sat, 19 Jun 2021 07:12:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8JWaff8O8S8xH5k3AgNrD5IRqdmByykgV2nhP2bFRmON0/f++FMTI9fZ20Ks79DfRhSbxqeqbT1Ok1YcZqTooybIQSjkVMKS/+d42CM/+wE8zRPG6mEj4k9Q+oeOMo5KQdjE0pXAFHQ3MQAxrSPSl0nTdFRRvC7oFwhz1dGGZy2ybF5q0HqypXUF15+hstb1pj5QjUFw29/FU6SxJg8oGLD36HssNETatZNvZzVLg7IWZvniEbT1KBBFqrfn8+asQa75XXmar1TnarRb2gw6+zXEwdML8MU8tb9UFT8wIBDcTUXlrE5fb56N/49utFTXyfr62wPNC0VsxEtJo3qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXWv6swvSFWceEh7S3R652hzjQh1s1crru9bm8aFkXc=;
 b=OPOyWdg9Ebh8SPGyn4f2OuBuHFx2Di0bF7bMbONIBr1PyN9elKTx0V4mSQuYJlig7JV6kZnPU2Ud2DDkSS5TEzfmddSLVUd4h7qR9eY4+abrjo6ipFkoix1E1AG8Y3OyJ3zbP6rHQM7W3clHfK7+oZLSGxO9g+SbUsdiC+WJr0kJFgYiF30ImdCoSGyte20XARh85pPipn1ZM5E/F+E/Co9ZEKf0njJnxgBuk/JYTcZ9tH/ah2Sm+4iHmDnSltZ2L14HaDhRsLMc/1aNaGNx2QCbwHVSrywNvGx8rSoViVzprtPTP70i0mcpX5uP7I7Mxn829p/4mhPN7L+XkoCGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXWv6swvSFWceEh7S3R652hzjQh1s1crru9bm8aFkXc=;
 b=PiXCnXTxtdBQyW+WQnQrNQcHLRlTz9hk2FM+IqxG1z5t4RiB4D0YgITIGA51JNxkdyoxYVSlOwtpbbp1UYHIrUd7lJTtsfDm+AcTsWOQrjmgfyCVJ44ZLjkIJirsg2UP8HH3m3qIelo8oSxMBmA7hIwLQ3mHQleVXkfxBFpgy34=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 11:12:15 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::5d2:a831:a04c:66fb]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::5d2:a831:a04c:66fb%4]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 11:12:15 +0000
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
To: Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
 <20210618202020.3t777osf6doytjal@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <656b17d3-0cc1-e1da-431d-133ab5502eb1@virtuozzo.com>
Date: Sat, 19 Jun 2021 14:12:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210618202020.3t777osf6doytjal@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0384.eurprd05.prod.outlook.com
 (2603:10a6:7:94::43) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0384.eurprd05.prod.outlook.com (2603:10a6:7:94::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Sat, 19 Jun 2021 11:12:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91443876-1f8b-4de1-a8b1-08d9331317f0
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1854:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1854AC2E2C70D850C1F9DBC9C10C9@VI1PR0801MB1854.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMQNBozlga5iLH/K8E5Prt+HG9IepVfd/OOCH94gvDmLZMPY5QL8MX9OH9W/PefqY8kvnInyMH6xI8wj4wiH+L8Q2wNm7E/FCbZqMqm/TfT8IdpH6FCLchhGu+gUvAJnNYXtKiKiw+0s3QGsjiXf9gUoDt9sEwBVBZiFebHI7/5DdH7CQ/gQR/G/cZZkrIcBRYTmkkTgzFDzPGg9iW7CfhCHDW+rQHHNYyuWutpkKf+3RkHrMALD4XNpcryRBcS0AMFs1WmJWqWWDge76cbkUtJjgBw99kwjcjgawls6weLLnDVxxrTJVd7y6o7mE4w8A/KSsWwtZ2aZ66yX7duBob/m5Q8zzIYyFG8DqUwuBMv+CzXG1lyiFOzoo1Ho4kPOIz/sd1HFp7d1JTHZeCCgqO3HvwGwoZzlmONfYqeYLjl1KFQjM7Zg5eG+21L70sL7CsUtkcbthPtv+6NQHlTR+NkHOxALdqL2DgNNyTk/Rjc5SZ3D/knz+s8o2sULBuw8/N3y7GN/aA2DwS7bq+4n2OrOxBjHua+dW36EcjwUXtQ8Q4IsLUfbAFfBQAlPQzKMUt6MixBBOYTTWkUCtn1SL2eY6VgFAvnDDZzStW3xB/+gr7gGwR0g0ufa0o+tYncU18/ygCkNcragW8F41/Z+jopVizuLenA/o5JSJmrHB5G2q+ILdXaKrcSU9a5wfYnqtqZJ7pXjXi6Owv4pmUot4H/OBp8+H1pxIQrhprJKTDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(110136005)(316002)(16576012)(83380400001)(16526019)(52116002)(26005)(186003)(956004)(8936002)(8676002)(2616005)(478600001)(6486002)(66946007)(66476007)(38350700002)(38100700002)(2906002)(66556008)(5660300002)(4326008)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lYYWJQMnlsa25zaXlodHpoYTZvakZwT1NyOGN4NVVFOHZkaXR2UVBoQWV5?=
 =?utf-8?B?M1ZZNnBOWHMza0FLcDBBVllFSTk2VUhWRHFiSENFZ1ZCREhTM1VqVTJTaTBs?=
 =?utf-8?B?Q1dWMXVxc0Z6VE5mYXovMGVGbldvbFBuZUMvaXpJMFhkSFRIOGc2Mk15WFlI?=
 =?utf-8?B?Y2hHVldMQ0RIQ3QxcGFzNzZUQmxGYm5qVTFveHY4R0Q4NmpwTXhQSVNUeXho?=
 =?utf-8?B?Mk5SOEF0djk1cVExTzByZm5laVc3N3NaQVZqSmgyYjVrY05aOUw5aGNLUWFk?=
 =?utf-8?B?VEdkWHpnWDRMOXE0S1FmQXZlVWdIUHlPdW5USmxpNkJ3anVnSDdFY0hpYkNN?=
 =?utf-8?B?TzlQZGtjL1BOSzFES3FlSEl4UEN2ekg1NFQvYlhFMWdSOFR5alRjNjRuay8w?=
 =?utf-8?B?NENBOUsyWTAxM2hZcThEN2NEWEkrTUJzODRiYy9FRTNZQW9tcno5TDFFd2Ev?=
 =?utf-8?B?UzZmNmxTMU00QTFiNmRCS281dStWeVhRU3F2dSt1TVBIcm1WaUhyRnovOFJZ?=
 =?utf-8?B?Y2VnNW9JcHhxQytFYlkzOVdadGVDaW5zSGs3dTZBOTJ5aFgvcng4c1dPZnpX?=
 =?utf-8?B?QUhjZXNLSVNONU0vTlpaVTVlUnRYUnFKRGREbEVPSStTRGVKeFQ2WXRra0Ex?=
 =?utf-8?B?YW9OanBQUTZxQjNla21OMUIwbTJsQlU3ZE9DNzA2MFVad2ZMTkI0aldsUW9S?=
 =?utf-8?B?UllrOEFaVzM1ek1PalpOS29PTlFScElvY0ZMV2EyanJ5YUQxL09tZmtoWlFB?=
 =?utf-8?B?Z3AzUVU1U0loaG1BTzFiN2lRT1BHdmhLQkJqV2VMa3gvZnBtZXcwNXFRc2tE?=
 =?utf-8?B?VTFwamJrQ1lzdjEyaFM2YmEzamwydGN6RG5IMENLZldtTDQyZmxveVpZK2dN?=
 =?utf-8?B?dXpQOGpQRU42U2wyT1puYVZkSGREQ2xRYnB4MzZDN2ZaWUV1NkUxTjdWZXBo?=
 =?utf-8?B?TjFyWlpRaUNLR1NoL1FGVWxRdEd3MFlVd28vaDAvWUM5SFAwU29wa0t4ZklP?=
 =?utf-8?B?RjFMUHNuZ2FmRlVlL2dnUklIekNEd2t0WWg1TkdhU2FNcDR4dEhJVTZUQlNS?=
 =?utf-8?B?c0IzdWNPeXFpNGpuZDVqNzVkRUpRY3RMT3JHR01laGxJbXRPTTJuSm1xUHcy?=
 =?utf-8?B?eCtNazF1by91Sk0wNmZjdUtoSVUyMWk2Y21EeWs2aHYzUUV0S1NYVUlURjRG?=
 =?utf-8?B?RHhmaE9wK0FtKytPM3piczFWc2Mvd0NXTlJiYS9EMk9BYUdnT2RDRHExbHNL?=
 =?utf-8?B?ZHV5RjgyakZzZXlFdkpwOWh3TnJxSndzdzZxdFpQY3duc1VyU21wQU9mVG5v?=
 =?utf-8?B?bXdMdmNXN1dWcGdYSC90MkFQTkdldDhudk9KdkNTcDZXTFozL3IvTXRQZWtR?=
 =?utf-8?B?bFcxN2IrelNadGZrem9vSlZ5TGYyMDV4dk1LM3FmVWZpS2pYVUV1U3pLTFl3?=
 =?utf-8?B?MExBcTdqMDlzQVlXQUtGNFc0dkFZcHdGOGdnRE1rQllsVmwyaGhnSkVvdUht?=
 =?utf-8?B?bDQyakR5Z056ZWZSQlgyUXVtVUNnVmVqdndvTjdncmNuTkdhdzJidEcxNHJr?=
 =?utf-8?B?c3MrbW9nYUFkcTlUYUhVbFBIUDk3S0FESWg4cUcvVVlkVENSYStsdmtTRncw?=
 =?utf-8?B?MUFTc1NyR1FYYTZPOGRNRmE0c3lhNVhleTE4RWJGaVpJUVE3RytRMitSOENi?=
 =?utf-8?B?K3RxWFRsRk9xb2FvWGdhNFBLSlFaeWNjVkR1UTJtQTlQVWRsRTlERy8rQ1Ar?=
 =?utf-8?Q?LT4UYHK//iuezjUesYadOPMZq2ru9ntRxFlauIg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91443876-1f8b-4de1-a8b1-08d9331317f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 11:12:15.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izTkrepb11XyPJnNjKuPMamSSB49mrUTSkawCAtTliEe6YE77W5/sRL/RGuyk855fn1lnj6ksO1A39jUAQhZ5CALM73YkT90KXyXknoqjaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
Received-SPF: pass client-ip=40.107.5.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

18.06.2021 23:20, Eric Blake wrote:
> On Thu, Jun 17, 2021 at 05:52:46PM +0200, Max Reitz wrote:
>> bdrv_co_block_status() does it for us, we do not need to do it here.
>>
>> The advantage of not capping *pnum is that bdrv_co_block_status() can
>> cache larger data regions than requested by its caller.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/nbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 616f9ae6c4..930bd234de 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -1702,7 +1702,7 @@ static int coroutine_fn nbd_client_co_block_status(
>>           .type = NBD_CMD_BLOCK_STATUS,
>>           .from = offset,
>>           .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
>> -                   MIN(bytes, s->info.size - offset)),
>> +                   s->info.size - offset),
>>           .flags = NBD_CMD_FLAG_REQ_ONE,
> 
> I'd love to someday get rid of using NBD_CMD_FLAG_REQ_ONE (so the
> server can reply with more extents in one go), but that's a bigger
> task and unrelated to your block-layer cache.
> 

I think for this to work, the generic block_status should be updated so we can work with several extents in one go.


-- 
Best regards,
Vladimir

