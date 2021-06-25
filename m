Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FB3B4283
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:28:16 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwk0N-0006GJ-2X
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwjzT-0005Rz-U3; Fri, 25 Jun 2021 07:27:20 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:38560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwjzR-0000ND-7X; Fri, 25 Jun 2021 07:27:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3YadAF9peV8qiB1IJ8faG358+n8ISZYIOgzqU42dRuvwS0eKl9y+7bYiuE1Tq0R5l7UTmnFVHfV9S2vqLgtPFMFuL+A+oZX0zcMsQlvpWVQR0S2j5XBnSrUXjqD1CRMCLkSPOEsd45HLVDavjUfNDWhBNfekw+D9hhQZCinyhg/OzrznK1EZQyVMsaHLgybfu724Zkwkag3cblhX5Ve9qXXVgnKcCqg00vkIKLx7ZhG8seEluR7qXTU7uqzlKnBIa8eRm5xHImRpjraJUYJ9yfqS+lMbX97wGzbg67hUBN/uuyNWI52h+XmzzZuHUG4DQrkjbD9BmyL2KhjI+XYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1svLfUxtXEdvO9hgHjx03Z9c4mQ3qaYQ0hTkBq5YAeA=;
 b=oS4L7GYCPe9KzJFmyE/auNAWcX08uJOWE9ciw3YSMrATTRbw2gtRorqpYX6Y14QSwu0gbOHZHWrrwQnso/l/WiBfYvSo6SytgyH2WXTaMN6/vQNzO1XuNYYqRDzBzHLct4mkwU0iNP6aEhimVjZNkQJ/aTJXTnlE7xtplxIkxt7GNhCwfcDfqqMfiplOuPOshWHdyFDbpQewyKeg1WS4MPvNTM6wEdl9ZC30r+K4Oi/3LPHpYU6biW/fhDykKbZ+791cXlVvUeWEMoDzl5GHKXQo8OEuyXhvlPZX3x++Inx1+BoLKzZyWOyI9xd+LtlKZPyJAjWb+eoSYurw9UgT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1svLfUxtXEdvO9hgHjx03Z9c4mQ3qaYQ0hTkBq5YAeA=;
 b=KdXtz9gTwrAjqCFviVHbB7MwkQt3Zmyt2x//GKpvxV15uBE8+LKmeEzmuAZHA6AL3YiLiOg51AeC5hn1kOZE4nsX/yPjDJH43rvId9s733WKDViEGWyhKsJj8VJkHDy1fFzXA1IFkv0FWdpHXz37qGCx+LAC00VwxjFx5ymeNF0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 11:27:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 11:27:13 +0000
Subject: Re: [PATCH v3 0/5] block-copy: make helper APIs thread safe
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fbcf93e3-588e-413b-a380-c82700da8751@virtuozzo.com>
Date: Fri, 25 Jun 2021 14:27:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614081130.22134-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0102CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0102CA0053.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 11:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94321d37-5a77-4444-0c15-08d937cc2e10
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5493B9B378CE615BF544A847C1069@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LmVSwoxFzV9cELfCLi+nXKIjkg/MG34ZNcOWTnsSXihA8Iprx8yZE02PoieyehI4HlQqGa770bNrEyEyG+/rSOJIDzbJZLOZOiegBu9VHgtuDCmdj+hPigIovJFsPEjw8EO/9uRJVZEnfuL6PWiJdg4xavqzAku+IEEn+YHG1g1Raj3RHPS9A2dgcSJ6aP5R1uudW9CjT4VrEsuMvUhzDhjdDdHlhKVqsd/HrEYv5WhNQpSxwfOsGKbGHc0drEc/8jUxHOLs0kvCWm8I+xeYgnER7xW+oGfHvHgJa9UkjgwPlh3hyO4JOPknCo3mYZ9JVEsjO8i3IFI2tv3Cux1TtAHTm/2WdMGhhNnZ+G8qL1uJG0X1Vly9ToS/B0dBdcn442wbrq3Bk2I3JW3cjk9Q4/6wzO04LmGZDLKV6LupdzaUv/3/8V4G/s44w0T8SzlUizXLlDYff2pYBQqwJtmz3xuvVs9WCv3eujiw2qekGODDC6Xso0J3t8lKFxBNsOkxxVryqC0OKhE+2EEQPV1r3LMOs6rT8t0tnkz4PoV+25KeJN6pMbgRk4jHj4P8J/sskblGSULLw2pmVFsVVnzvFsmISOyh0PUKfTj5FsmigTFvNyg4+KEaPzP1jeB14HSykJRTpUbDIsWTCIzqi7BlUPm7cZtEunQgXGoqZreFDPjzx6ictQu9BlNeODwGbc7ZNCXV5I2VsnT204xRF+l2/TknchNRB6XhP5K415hNtU5pQA3msBbWPVhQ4jAQYxJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39840400004)(376002)(136003)(6486002)(31686004)(66556008)(66946007)(38350700002)(38100700002)(2616005)(86362001)(8676002)(52116002)(66476007)(2906002)(4744005)(31696002)(8936002)(186003)(16526019)(26005)(83380400001)(956004)(4326008)(478600001)(54906003)(16576012)(5660300002)(316002)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2l2NWR6dmJWdllwOUw0WmNEclZ5N1FISElZMDM4SmExckRXbldvbEJYYWN3?=
 =?utf-8?B?bmhrRXhFbHk1Mkd5OEJxQ05TN04wU08zVWp2K1F2cm5lZnFXWWtGdVc2Rllz?=
 =?utf-8?B?N0hSZGw5bEdwVzRtT0gyWWZzQUw2Y3dCaWxQVzN3Y1dNM0Y0dWM3cFdCeWI3?=
 =?utf-8?B?a2RBdTF2WFEzWnBEcFpaKy9VNnZsTzhZQTVuUm14UmxITFRSTGY3TUVEbEFn?=
 =?utf-8?B?cFVvSFpROXF3ZVV2Q0ZHODFUN04rblArNVVRL2hsUVdDLytOV1cvTzRiMElk?=
 =?utf-8?B?TTNMTDExcmFUaFpLMUZWWFZXZVRXdG4zOC9ySm43bUl0UHg2Q2ppbHNkTVZj?=
 =?utf-8?B?OUNWR2FnejlvbHo5M2lYWmsxSUhIaEE5TWlBVEUrNEFtNGxIcWl3WXhWTk9x?=
 =?utf-8?B?WDNTdWZ4ekp2SGx0eTRVNGtjWmR4RXpaWU1qUmlSNzRzUG5RNWppQU5XbjM4?=
 =?utf-8?B?eDRCcFU2VnNiRmg5V1IzU3FoQjZYVEg1UGx2RUxQeDZOTFE2ZHVCYkhuRkgz?=
 =?utf-8?B?V0l0MnJkK0dpZ2w1ZFRpSFlwZ3QvZkJSeHFIa2J1ck4zdDBNZzhRTU5kSmgx?=
 =?utf-8?B?WHgzN3BBWG55eUNYV2MzWXFXZHFBRFRnWVhVaXdTekdhSFZiVVRRcjY4RVhH?=
 =?utf-8?B?Z000T09MTnNqanpKSklCSFF0amoyMktGQUROOWRPeGtQVzAyRUg0Sm1hVGdY?=
 =?utf-8?B?N1FUL21iMWdZMy9LYTJ3U0FyWGhQYmE0c21yL0dqbEtOdVJlMk5xTTF3dGt6?=
 =?utf-8?B?aXBZdGpPNnlpMG1UQ2lpU0dqZjFRbUp6Uk8waXQvWVY0cVMzWGlnSjFUSEky?=
 =?utf-8?B?SWxPWWQxZVduakMwVzA5RHVoNmlIazU0N2UrNkVaVmR5ZVI2UkFNR2N0MlZK?=
 =?utf-8?B?dXo5WXhwb3FrT1Y5MCtYOXlLOWNCZER2VkFKd0xFK3N2Qm12S0pPUEFmN3FB?=
 =?utf-8?B?Uk5FRVczNFZ5T1RyQTZqQysrMitwQXUvbXhNQkw3ekxtRThpSDNLcUhWV3l2?=
 =?utf-8?B?M3FCVkphTS9BeTFkVi82YzlYZDh1Vlo1ZitsTkZScXM0dTVVVVcxUGoydk5y?=
 =?utf-8?B?ay9VRWcwTXVFMTVjMy9ZTGM5Q2k2ZG10VXQ1UEticEtNRG00ditpZFNqQXY4?=
 =?utf-8?B?V1N0RWJoVWJBdHk5OE1UWjVNaVZNV3VBVlcrdjBLUHc2a1V5MGJTMjZPOW5z?=
 =?utf-8?B?dHdjRHBuRndOZXJVWlVBeU9MbkJvN2dxbDJDeVFQcTRyM1VQVWtObDZQV2cx?=
 =?utf-8?B?WFVkR0phK0p2M3hmZmtLM2RSYUJFTzJhZkVuNzhGTGVrSzZOVEVzcUdlZ0d6?=
 =?utf-8?B?SXo2RFVsRXp5WjFYZVZkRHpsRUY3aVhMdkdqRjYrSFlMWm9aOHl0SGIzY0lh?=
 =?utf-8?B?cHM3VHZIVTZxVjRUd2h5a1Y2bHBlWmlhSFJ0Tk5aT3lNd3JjY0NJb053N21X?=
 =?utf-8?B?WFhENUdnMERUZ2gxaDBWQjJUaVFtcWwrWDFDZitPVjZPN1hZSEloYXBpVGVD?=
 =?utf-8?B?OTY5QUpyWWxJMmRlcW92cWdITzJFb3A2UjZzSjBLYjI5dXJKSmZMUlNCVmJ6?=
 =?utf-8?B?UjEzcTMrU3lmdjhiLzd5NFdDMVdEZ05sanFYU3U3ZE5hWEN1RzJaTVdnSis3?=
 =?utf-8?B?aG5xNWNTZVFSdUpGY3N0ejFjM2oxUC9SdGhRVkkrQUY3a1h6Z2RmRzlJNGRP?=
 =?utf-8?B?WUNUeG91elFDZG1vVzJ0UUMyZFNQYWtic1pqWGljNkNSKzlabTlOcHJXeUI5?=
 =?utf-8?Q?FYIYrbHf/2OhtqOp6Z24EQpEXrBxvIU+MzmeCab?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94321d37-5a77-4444-0c15-08d937cc2e10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 11:27:13.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmDrf6Yvd7QHM4h93igFnp88iN8TIAexOGvnrTgaCf+9bmGwyjnhJMPGV7191U+nRPuFP1xOLyrJgY+6ds9mQ6h5gvHBAKZ1L2URHD3olZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 11:11, Emanuele Giuseppe Esposito wrote:
> This serie of patches bring thread safety to the smaller APIs used by
> block-copy, namely ratelimit, progressmeter, co-shared-resource
> and aiotask.
> The end goal is to reduce the usage of AioContexlock in block-copy,
> by introducing smaller granularity locks thus on making the block layer
> thread safe.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
> 
> Patches 1-3 work on ratelimit, 4 covers progressmeter and
> 5 co-shared-resources.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to the jobs branch

-- 
Best regards,
Vladimir

