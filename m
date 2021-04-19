Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41DB363F62
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:14:06 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQur-0000UF-OQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYQqx-00076X-2r; Mon, 19 Apr 2021 06:10:03 -0400
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111]:24161 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYQqt-0002uv-JQ; Mon, 19 Apr 2021 06:10:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwuwkZZB+4YnP5KUvcVbHccjogaDmTz0cRYaROsbjx4aHDFvb1haglUTd9VjUXH84l4N6wo62vS2k8BvDJVzjh05gkob9IZfv79dCiKL220LNJbk4KzGf6EZxAGowqn6OQVEZRJ9unqBF0cZWFo5Z4ti8xAcV41+ot777/vhcGGUynbeTIiJTZ8uUCKNiIac2FDNUr18hCjveiubzZ5rGLYSq3FtKFZzCvGzdvogD4foLrUsg4NW9Ytjn2t+7ndgFsgPlFkwsJ8JELOSy/PKiBjpjnUH2GioXCq6llUECg/MQtQLwVQ53x/ncNNVV7vkfFu8AiSjCXsEiw6EHzhdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDgWm4l2fKmc4BYBV6Truy9kJovemq3nk63zSFz8aUQ=;
 b=d0LNH56OzZzpx+zb6FuDx5wnKG61oggpkKitkBnByB8o7p7aiG3XC/46T0MPJAQ3KlAytC4YPvgMOM5PVSoJM2jXO7iGCbsAm8EaNh6Cuh5wJm9gr+2of4O9o40HuDN1ZVp4QMODSx58/8Okk+0YYrnKn/+NyIdiFDltI2Yujop9Xp5GEop8+pt8mtclHbeoclSPirEG92kg86FtEmewu4hUs2skrX6Qan+p9cch0bZOm7vw3saqTGcMtPnp/Oyf+r4g9xJ3nmLLhPP53qFK+et3XdOlLLYHayOD3BJ4bsfoMbpSlsJbXRdPsEnEFGrC6KX/Buld28FXCM+2kGBhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDgWm4l2fKmc4BYBV6Truy9kJovemq3nk63zSFz8aUQ=;
 b=pH6GJEziGrLOka3e+lFN3Xz49uHJRyEz3PjyLheNCAXyVHuJZtWtqixl4kvc0bOvI1aLSlfpUfpGAFNbz5VJIrQifeR1bFp1LM73bFa/M0QvNUyahpbLDcA0+AKmSpzsMK1FWQKea8mDtrjLEXC9OqL/09J2DvkVOwI8YmRSwWM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 10:09:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 10:09:52 +0000
Subject: Re: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "gilbert >> Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-22-vsementsov@virtuozzo.com>
 <YH1OuUYuLYkHY2ni@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e6bdd533-9141-fd3b-1b7b-45ea9993f6fe@virtuozzo.com>
Date: Mon, 19 Apr 2021 13:09:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <YH1OuUYuLYkHY2ni@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.8 via Frontend Transport; Mon, 19 Apr 2021 10:09:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb251f66-ee92-49fd-779f-08d9031b4627
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5910B45BDD3190F3D56D7FF2C1499@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DKLqtotVdWPOXYBfP6PNQFcqqdw4DSnjiaXnPMoAEhDtDYUsbZsLBD9+4H/1sWHdWlmBp+ZOkUz9ZtLWW2dACqqKkSb9ZqQpzv2qaI64Y4CRr8LnVv5z+44b4sLn3QpW+azH7Iud57MkaJu5b18asR+Orw/1fNXjQdK9oyPsRedTOzUjEojsjDn6vV5dRfEOtOYjPBYHvJ5iK5AfnZ5oMgGZtj9Np5azcFQ5WoPVXM8ev36Mu9maYjoqPi0PZ+yRy6tIHyw4e8bAE+NlhmXbXx5LbPcAvry9yeMBKsjiEStDYTbGCG4awTRt6z/K5rTL31Vm2lR6pL6Xrb4B/I9xiVuwP4YdI1AAQ5GW3Avb/6Yt3SrG4U8gx5vW94KUcKrCAOY2iTU1CMEDfZzkd+/JOaJ6+Y+9AMyxnutP20V+XGQlnKOgvNwgBd9ohZPBqHpIMRMY68MrOtNpOlU7z5ftgNMOZCwou5tySeIVYhyrifgGQU8oGT1zecQOjZhqgs6Fwu8kYnaAzUOJ9uIsfN507xSqR0XuqBT7i6Ow0oS2ApJqyH+OJmaY7nFO68r4sKu0iqRQU6NrOXRAlHI2PzcjEVAnWNFnEU/boM+CHOQsfLd9B458SMyeqC+UIUprOT952Y+J+qtUfKbqTf04PWYX0h9UCJyVrC9yR6Z5BiNpe1XJfXByQNuFYxgfH0GkE6WoiLHXv81KZUyoTFztl7weAGtuP4eBfdDXsKOC9jvHqZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(66556008)(2616005)(66476007)(31686004)(8676002)(66946007)(956004)(6486002)(6916009)(16576012)(54906003)(4326008)(2906002)(36756003)(8936002)(316002)(38350700002)(38100700002)(52116002)(5660300002)(186003)(16526019)(26005)(7416002)(86362001)(83380400001)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEkrWmE2bWMzU1BQaDJBSXp0dzBRd3JiSHRYenNLcnVIa0NwUStWOVc3SXVT?=
 =?utf-8?B?cjlacm5oT1gvNFRCZUVOSzh1Q1FESEZzdjc3anh4a2tPSUhuTklTRVdyZW84?=
 =?utf-8?B?ay9hdFY2RG1qWFdWYUZEcFJxU2V2KzJwVUk3R2YwcHNRS2Q2TWlFNERQaXJH?=
 =?utf-8?B?MUcvMEZyVjFYMzJiNC91NGR2Ni9IdE9sRkVVblNWTE02TTg1Umt6WU9DT0FM?=
 =?utf-8?B?a3c5QW8wbWZUTE12cHU3cERubkJxbVNqZGx2dlpqM2lXUW5yR3VIOUNZOEww?=
 =?utf-8?B?WGV5cWNvejBCOVViUEZnTDV1MUpPdlp5eEpEaTdxdDJOL1FWalhUYVAxMU4y?=
 =?utf-8?B?Nk5mNWwrZU5oV1RQT2JNTGhCVTIwRU81clhEREdGclkyWTNhcXVzZXZzZTBq?=
 =?utf-8?B?T2VDcXdWZHBjM3RZdGh4SXcwYjArR2MzRkZTeUZ5L01rMytZTFVjRFJBelZD?=
 =?utf-8?B?b3A0a1dkOVhxTy9lZW5wMjIxT2Z5OFVLbXZMUVIybnVQcnpUSEg3SjFBRWJW?=
 =?utf-8?B?VEUyaUhJVXZINllOZk9Md2Rpd0M1bnUrUDAxeWxGUU12SWIxSnF4SjJTWDhs?=
 =?utf-8?B?VTI2OGtlaldmMFRVRFVadVZTakpITzQzRnlkcE1ud2tQbXFVZ25razNrdW9P?=
 =?utf-8?B?SXhNVnNaWGd0MkQrc2lFb0phWnhqaFpSYUxTNCs1S3BYcEtNa0F5Zzk3enhm?=
 =?utf-8?B?aDFIb1QzOVlvbTRiN0JWYnV5RVQ4SE16dWNJMUJKUjZEMnorQlBvc3dpdVhO?=
 =?utf-8?B?ZEtac3pJelRNbHJaa1krTU81b3I4bW83SjFRQVB3ZTIxUE9NR3JhcWd0YWtU?=
 =?utf-8?B?MXV5dUdZcEp1RzZ1dHRLT3k3Ukk5b0FHQ0pYVzJmZDE4YUNXbVc1YkxFOXdr?=
 =?utf-8?B?eXpYcy9RSTFadGp3Rlk4elJvM1RJTkh3OGxsNjQ4NVRuUC9OWU9OQUVhL3NX?=
 =?utf-8?B?aUxWdEFXSVhjYUszYnRJZTUrc2hjOEkvZ21IL0c2WUZlYStFL0pTeGNCbGlp?=
 =?utf-8?B?L3I2OG03cGk0Zzd5LzYzQm51SHdBSElSVEVZWWFFZm9Yd0xhV0lSMmduRUNW?=
 =?utf-8?B?cWIrZ2xnM0k0cGw3QWxtZ3AvTHcrZE1wK1dENnpmYmRkblBLQ3lpRVI3STFZ?=
 =?utf-8?B?MWpNNXVxdWswQ0xrOXJGa3ZnL2IvYkJyR0d0N0FGZHJRZmEzWU0zT3hDMUZN?=
 =?utf-8?B?MGpyWGtydGJkLzJyVFM1blhIY0o3UlNKMDlJZzd2NnE3NlZNMUlaRWlCRHNx?=
 =?utf-8?B?N0c3S3o3d3k0VmorbTdZOCtxQ3VRNlQ2YjdiWEI1a1RwTXBtNlBxdFM4RHJN?=
 =?utf-8?B?Vlptelkya0FuQ1UzVEJzWHZGODkxMmlHRENRSmtXODY5Z2NJeTRwZ08zbGpE?=
 =?utf-8?B?emtFTTVUOEFPVExqaDJuK3I2aWV3Yk5GL05qZFZObGNrK2NOQjFEcE9HdTZ5?=
 =?utf-8?B?a3dRY0V5ejRyVytzVjcvbGpXNjdDRWczZGFhZ0ZkRjhpbVprOFlVR2FHVVQw?=
 =?utf-8?B?NG11K1JESWJLQXZFQVBueG9pU2ZJck8wRGE4SWFaNVdBQ2tQMXVlNWZGV0Nk?=
 =?utf-8?B?dGhzMHFwd1d3Yi84TmlwU0hYN1B5VEhrb1NlcjJxZTNSdElsMzBDWHFTVUdv?=
 =?utf-8?B?dmdYY0hHV2tGWDR2TVBGYWJ1WGJDN0NiT0J1cXc4NlNXTjd2ejM4SDVMaWVa?=
 =?utf-8?B?TjlmRXVCckwrRnFDenlwZ1ZBQ3E4cnVZVjZpdjc5VHpWL1d2WS9xK083TS8r?=
 =?utf-8?Q?0BOWKtGLTleATGpxcibssW4DjW7cbBHzpWZ5tky?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb251f66-ee92-49fd-779f-08d9031b4627
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 10:09:52.7907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhKK/liCbvqvwxo6Wdhun8VW5zyYYFkYW3q6b78MHflT6eiOG7CTEQTxXY8dICO0FamfxhNDMiAqDreUdX9FxcMmcri60SR54C8maYL00nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.21.111;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.04.2021 12:34, Daniel P. Berrangé wrote:
> On Fri, Apr 16, 2021 at 11:08:59AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Detecting monitor by current coroutine works bad when we are not in
>> coroutine context. And that's exactly so in nbd reconnect code, where
>> qio_channel_socket_connect_sync() is called from thread.
>>
>> Add a possibility to pass monitor by hand, to be used in the following
>> commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/io/channel-socket.h    | 20 ++++++++++++++++++++
>>   include/qemu/sockets.h         |  2 +-
>>   io/channel-socket.c            | 17 +++++++++++++----
>>   tests/unit/test-util-sockets.c | 16 ++++++++--------
>>   util/qemu-sockets.c            | 10 +++++-----
>>   5 files changed, 47 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
>> index e747e63514..6d0915420d 100644
>> --- a/include/io/channel-socket.h
>> +++ b/include/io/channel-socket.h
>> @@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
>>                             Error **errp);
>>   
>>   
>> +/**
>> + * qio_channel_socket_connect_sync_mon:
>> + * @ioc: the socket channel object
>> + * @addr: the address to connect to
>> + * @mon: current monitor. If NULL, it will be detected by
>> + *       current coroutine.
>> + * @errp: pointer to a NULL-initialized error object
>> + *
>> + * Attempt to connect to the address @addr. This method
>> + * will run in the foreground so the caller will not regain
>> + * execution control until the connection is established or
>> + * an error occurs.
>> + */
>> +int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
>> +                                        SocketAddress *addr,
>> +                                        Monitor *mon,
>> +                                        Error **errp);
> 
> I don't really like exposing the concept of the QEMU monitor in
> the IO layer APIs. IMHO these ought to remain completely separate
> subsystems from the API pov, and we ought to fix this problem by
> making monitor_cur() work better in the scenario required.
> 

Hmm..

I can add thread_mon hash-table to monitor/monitor.c, so we can set monitor for current thread in same way like for coroutine. And monitor_cur will look first at coroutine->monitor hash map and then to thread->monitor. Then, I'll pass needed monitor link to my specific thread, and thread will call monitor_set_cur_for_thread(), an then qio_channel_socket_connect_sync() will work correctly.

David, Markus, is it OK?

-- 
Best regards,
Vladimir

