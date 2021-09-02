Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C23FEB56
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:33:56 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLj6Z-0007i9-RG
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLj5Q-0006uY-Jh; Thu, 02 Sep 2021 05:32:44 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:2562 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLj5M-0001hQ-Eu; Thu, 02 Sep 2021 05:32:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh755dSnisVQnvk4O+HgFMEa3ijtc8pzB4lF/4/q2SndOxLYcv9bbaCcTqskL5d4wPYYqjoYUN9KHz1ECcEE50n054FInNllJ0UCa1e8Zqi1/GukIVmEHJLHfaBR4whKC5horyQB4erujn/EQCwsspE3B2aPLnYgQjtkgjeWZgc5yQKbw6E6PI5gwCdNkqRmYh1JQtaiXvEWl++EOWy0I2ayA/MqIks98vh/vWA2ovHkdUfjS8qX8S16M/CGsERheeEa5rkFfbKtFqFqlOjIoGjM7ARY9ycQ9gLUsE5FTo8Fzm/zYCLfRLCsxMZHtrNfjjwd0GkCG2XIoecSdNsmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=wcoTSjPzqZTPTaays5fpkY3igokd5MSHfx5+21b2pAs=;
 b=PpoG4kyNmoq5sWfhRgcFfYt0c5W0m8YRP4C7qlUQhKcU3xc15UYUN7pSnUxIRdcQfWc2AG3a5j5FdNuld+WhjOKtj54ZG3KeLncxHQyaXSRWRtEdNOnfwnuIbCGur9wXIk0MpWiY2EAGB5DX6HcpBw9uBsgUQ/oAwvR2Wzxhuk41lJaV0zYgBXlNbjbZbNOiBBr012sGoDsSVoYd8iIhYGoGVGo/yfFo42saifVl0gzo8U/tQKGQkiTBKUdU3tKmkmKdIXQ2KsTnuoLR5wmPVaGpQqGQZlPBjZ/LRA11NizoaEg0JbtvTyCEtcxAKA0Yo2rMzbMpGcCkgO8LnPY4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcoTSjPzqZTPTaays5fpkY3igokd5MSHfx5+21b2pAs=;
 b=CIQ/4XV4jXM4J0n1jaVuC+1/FS7hME2g0sxldJxpyOUZ20D+gJr1GuOWQYQ7u7WujeoPj0ZEpKksSYnQ+cEk5fA0OIVdce/Q8yo/jfhgHQu6pTZgdhj5svfsfd5keQEgs9K8lrCfVqRDa5KtpvOTDGah9bnn6E9iDcEltg2U2NY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 09:32:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 09:32:35 +0000
Subject: Re: [RFC] qemu_cleanup: do vm_shutdown() before bdrv_drain_all_begin()
To: qemu-block@nongnu.org
Cc: mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20210730142907.18626-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e5742ec4-a6ff-268f-5d21-4b014734bde3@virtuozzo.com>
Date: Thu, 2 Sep 2021 12:32:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210730142907.18626-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0093.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR01CA0093.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 09:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08a13067-458f-4157-751d-08d96df498ea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61681109F365D9B97A75FCF7C1CE9@AS8PR08MB6168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CBw09xmIKiZOArMvV4L+5MCzpjCGIfTW9e7Q3ociqLnzgu2yyoSG8igi/RY5mTUx2/TO4HH4qZr3w0qrJV2k4FIHVYIrOK4bePtbAq1Nd98oBConEDIHnZnPxGPDTbs6a3yVybmzQMBfidc1TVqspax+fOsztAD5lDpPVRi2WN1wk9vgoExCxGaEpm9NtCZe5WCYtW3mq32sUcvAuegyT9kyfwXdDlo7kiGG+4xGKkclhyxatg+YXGNhqSBWvpBa6l2bWXd6/wlSy1MKkbAS6g5PCGWNnqgNk9f5WZ54S5mLklXS9sBvZBclk8gAdMz7qBWOh8VkARMV7aX/io4umBzCwloV1ZHaDmDfW/escKwtUDNK4PDpzKvtLsG8pcLnt6KP1+VeXglgAN2z8oC+Hsvw0QgOaCWfo/TqgAkuLgWcCqzmmZQ2Y2qunY1DKexRykJcn+LhFSe4gZZvnmJPYWc7midvGOOY2A0mDDRwfSSvsNJYzlBEmVxLNBbRnx8nGqItU3NGxYV+U5QDQKiFX517214QXbBF9D8BkevJVs0EpYU/ebjYbUzsp9EdCoccndCoaNq9luT9hjAm+lm4nRX/CBHuaUo3odG3OkYfVu63cvuUUKBWQ37f8RjbZMkAM7Pf0+anWyD15abffu/402sGj8N5Oxs5uGHtyExdb+NhcMWXf1t03q/eYCTERJZYtfVG+LoRtuyq8+YwxJli3bduvES6RgMs1Wg5eAmm018=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(2906002)(83380400001)(2616005)(36756003)(26005)(6486002)(16576012)(186003)(8676002)(478600001)(38350700002)(316002)(38100700002)(66946007)(31686004)(66556008)(66476007)(4326008)(5660300002)(6916009)(86362001)(8936002)(31696002)(52116002)(956004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em1uMzQyRnJvcERFUEtSekRDWU5JUXRqcU41M2RIK3hoaTRlUzVRWUxSMjVa?=
 =?utf-8?B?V2hhSTlqYnptemVXWVo0U3ZIZDRDWEMwU3Z5OVBldlU0d2sxMWlpV3RlVit4?=
 =?utf-8?B?U3p4bnJRc3hTbHBqMUZUeCtXSG1wbUVSaFV3OXh0N3BaNjhENkRmWWYzb2RF?=
 =?utf-8?B?ZmZHb25ndGNMOWxOM2RFdmpPL3U2c2lxWXhDdzltNG5HRXA4bFhUR3pMRGNP?=
 =?utf-8?B?MVdDNENyRE9HTFI5dWZtd3ZWVlEwRHdROUNBK3dZZzFqY25XWEErNlNENXlv?=
 =?utf-8?B?WmE4dTdoWm9zemNCdnlRYU1haXp0NkxxNVplYU03ZUxuOWpQTmNkN3JsekR1?=
 =?utf-8?B?MnZ0N1VYWTZuZ2lVSDZ6Ryt6bHNqYlRDRThieTFiVFlrbmtaZ2k2eXUvK2dU?=
 =?utf-8?B?b3NHUlBiWmZQdGxGb3NvOWJVUDZ1S0Z2VHRzSXNpejRPZFA4cExMeHRIUytO?=
 =?utf-8?B?OC9aL29lNGUyMlZkbVlPWHhQcTdwREFZRkI5bW5sb25ZVDJRSjlDRC9KdFli?=
 =?utf-8?B?OE5yOWNWZmljcGRxZ0JnZXNRWFAxWE1POFhHSVU1Zlpxc1V0YXFiYkdvQ0lr?=
 =?utf-8?B?aGNpV2EzS2VUR002NVczNVdSTzNWTDA5MlNBeDBFUHdrNDc2VEpDV0E3TVNP?=
 =?utf-8?B?NC8yV0NMQUFqMzhkaGJrbE5ic0pyM2NTVUlCaHl0cENsUjloWWN6R1laMVFY?=
 =?utf-8?B?QW5hcmhpK2xkd2FBeUh2d1dnTUpXMjIwVFhIWFd2RnpXTXlwWkx4UHVkTEpN?=
 =?utf-8?B?eC9zT0ZsRURYM0dNTS85SUlUNGdOMVZSc3czVnpCNmlJN21wd1JRUGQ2SnlI?=
 =?utf-8?B?RnlQTldCWjAxeGdXV0R3THJad3BBNWVwWnE2d2RVeGE0T0hrK1JUMHR6aURR?=
 =?utf-8?B?QU92bE1qNmVsNGZsdEZOemw4TkNlNnMycHNTL1l1RGF3bTA4d0pDVEZxOUhn?=
 =?utf-8?B?WnpFZVJETGNLUkQ1K1VOcFV3NzJHMkZCWHlydVNMZ0YxcGsxeEtLZGt1c0ds?=
 =?utf-8?B?Q2poOGpCeCt6UFo5MVY0M2FiSkIydWdkcEExOVBkWk85enp4Zk5vVVRkc0cw?=
 =?utf-8?B?WW5Va3laWG9TK250WDFwQWVvMXpZSThsY3pQbmxhaDB3TEFUSmxQenpLWGJP?=
 =?utf-8?B?eHY4SlRwWmEvelQrdjBpbU1kcFRJNjh3aUxhSDRpTzZJZCtFVG1kU1I2S0Zm?=
 =?utf-8?B?YkdXRTExN3VVU005VFlRM0kvem1DcFNNcUw4cHo1MU1SUStPbXY3dmJpK1R0?=
 =?utf-8?B?RmtvUTNhdE8vMXRLYk1aa0NjT3llS0lBQ24vRUlNNlV6ZzVqUmpjVHNTVWR5?=
 =?utf-8?B?VGwxRFpyclNMVTc1VHZiejJCWVBHQ3lPQk80VmFlS1pXS1BTaXkwc2tZTVVo?=
 =?utf-8?B?S1FsMHhkK1N0dlJtZ01oNktkc2crMW95dHFweXlGVVBaOFdoMldPc2ZQMFNh?=
 =?utf-8?B?VUZqdDRVL0E0S1YrSG5sZnAwQStsczJKZUZKN3daZlpWT2NHTTR3M0FKK1Zy?=
 =?utf-8?B?bEUwV3YveUI3dGtUdmpWZFRjc0JrWDZwSDNRMVpQek9GKy82U1VyVHplZ2kx?=
 =?utf-8?B?MnZuVXVKZGhYU01MRWVRWUpwNmd4bnFsTTFTWkNpKzRQQk44KzczRFBPRDhW?=
 =?utf-8?B?bWI0Z1RkOVlTcmtYVURwZ0oyc3hjVUpCQ0ZIZzNjZDc3UzhTTkpObEdjaUh0?=
 =?utf-8?B?a09vVVpDS2N5ZlRmbTJnNUpCUVZLVk1LK2ZvUWwwc2dJcnRpOEtwTUFtUUhS?=
 =?utf-8?Q?2UF9OD1ObuxaKI0rYGsYtP3jbUecbpt/zmVYyu/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a13067-458f-4157-751d-08d96df498ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:32:35.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15krUfaNgMkEdaJG/p713uJPRcZwQxyHZJ02haZ6Mm/xFAoC+ZdOad4eOckK8KJ53vLNCUMq19PZkad9vAdij9uR+G3p7VEfvUrvbBsawsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

ping

30.07.2021 17:29, Vladimir Sementsov-Ogievskiy wrote:
> That doesn't seem good to stop handling io when guest is still running.
> For example it leads to the following:
> 
> After bdrv_drain_all_begin(), during vm_shutdown() scsi_dma_writev()
> calls blk_aio_pwritev(). As we are in drained section the request waits
> in blk_wait_while_drained().
> 
> Next, during bdrv_close_all() bs is removed from blk, and blk drain
> finishes. So, the request is resumed, and fails with -ENOMEDIUM.
> Corresponding BLOCK_IO_ERROR event is sent and takes place in libvirt
> log. That doesn't seem good.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all!
> 
> In our product (v5.2 based) we faced -ENOMEDIUM BLOCK_IO_ERROR events
> during qemu termination (by SIGTERM). I don't have a reproducer for
> master. Still the problem seems possible.
> 
> Ideas of how to reproduce it are welcome.
> 
> Also, I thought that issuing blk_ requests from SCSI is not possible
> during drained section, and logic with blk_wait_while_drained() was
> introduced for IDE..  Which code is responsible for not issuing SCSI
> requests during drained sections? May be it is racy.. Or it may be our
> downstream problem, I don't know :(
> 
>   softmmu/runstate.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 10d9b7365a..1966d773f3 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -797,21 +797,18 @@ void qemu_cleanup(void)
>        */
>       blk_exp_close_all();
>   
> +    /* No more vcpu or device emulation activity beyond this point */
> +    vm_shutdown();
> +    replay_finish();
> +
>       /*
>        * We must cancel all block jobs while the block layer is drained,
>        * or cancelling will be affected by throttling and thus may block
>        * for an extended period of time.
> -     * vm_shutdown() will bdrv_drain_all(), so we may as well include
> -     * it in the drained section.
>        * We do not need to end this section, because we do not want any
>        * requests happening from here on anyway.
>        */
>       bdrv_drain_all_begin();
> -
> -    /* No more vcpu or device emulation activity beyond this point */
> -    vm_shutdown();
> -    replay_finish();
> -
>       job_cancel_sync_all();
>       bdrv_close_all();
>   
> 


-- 
Best regards,
Vladimir

