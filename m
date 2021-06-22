Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73AD3B01DB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:54:11 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lve2k-0001wH-Uq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdzH-0007Rx-Rl; Tue, 22 Jun 2021 06:50:35 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:5952 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdzE-0001Jf-U3; Tue, 22 Jun 2021 06:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv9D6wOzkiQoWM9kH4W3zD7t8idF05FrNIGv8Goh8FRpqWMFMByE+IwSNMgE8MzNUduJcR0mR7Ul8ZEtiwZF2OzyN6Lg5V8iGGXG/V3UwraOo7fAOgq2KCA9Yd6/cXwJkUu6rdQghLsaG7m4hUYa+USxfI9oTDWrrr2OWgVV59U2V9gAR5pdr0IY4KOnrjkpEd43SdQRdKFaFCY0BUJDpa+Bg9DtqSpyLNZdULscvWOGcr/C2AZPyauNJRMn4daDoqBwvwUmUjM/eWK+2DoJvtted/3W+edc3ic1kzVGsQi82rzfnC6rwFAxJgGIg3Gj7pivUUloAwqXXDhtKAdGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZsWRYieqk06El2sVTESfeJc+sZDmUCBE0KllTp5yXg=;
 b=gZQ1IhF7QCv81X30MgGgGj4OyXgsM41YyBivk5UHAwQps/SOPRUig1dDiCFppy2L+RGY4LADObbZKQxzsJGA535zjXAkd8KRDljGuuKsX6nu3Haen7rBNMJfCU3nUKo1pPzFMKwsy6diDAtYz1qtKaJSPlNdl1gs8y6Pg5Qs1ZmRjay1ZQt3W3FWvsYFWyRPSdZxwmRFRxghvXAIZJGPS+4E72OrHAD7rg8raGHioB/U0fHIEITiTasLqmCtOcGVEXYvoSNvNvp7ShqUpMovT5FhQN0TT4TFo7d1Ek1H6UbJwxhn82dOhVSlv+jA/5sd3COSThknQivawGTUO6RvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZsWRYieqk06El2sVTESfeJc+sZDmUCBE0KllTp5yXg=;
 b=tMEUg2/AOKWC+VRVB+hbFKpF2B7luKxk4n1GnsZKo68HwFnw0KV62CC1TN5UdAOQUxrDBenesWxExrLOhn0FgOoDiBsmjGrPfMJleoKniGqw0oJce7poC9qQ09W5gBa2RcbQOkp7iWwY8K/0TV7fqVzkm+7QvqRsotWrP1qGoP8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:50:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:50:29 +0000
Subject: Re: [PATCH v6 06/16] qemu-iotests: delay QMP socket timers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20210621103337.36637-1-eesposit@redhat.com>
 <20210621103337.36637-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4179a6d2-3fc8-aae1-4747-b4ae541a8819@virtuozzo.com>
Date: Tue, 22 Jun 2021 13:50:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210621103337.36637-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 10:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6239b5c5-f3f7-457d-7b62-08d9356b8cbc
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-Microsoft-Antispam-PRVS: <AM6PR08MB52062E58F3B74BE9C42C3E7EC1099@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hpsl2jcHjgu5i68GNdes09EhXf6epLZ6VIdkVq4aGO1HzwJTgvIBbNX3oFttJ1DQTnuBTTwEwuhXPvPVGx8C1ahbTIjtVf5iglDMWBbTklN5Yz13+RVq+JrPeYIavZ5/UawsTMyKhEVL0GoGfd3KEgXgowjJmYav/FOOu8nyGovcNgP8uMZ1DySdOReKnQacrF57h1+LtPUvt4Z+rja00TBTigoYBdp0EiHdKxKFOg7IavW7Oi2Zsx6pOFoq+RRqUNC1wf0OYt0aybAa8ILdJvYWMxP06f1Uo2Gkbg7tDs3XSO2zpgpWc9ZDtUu4Dt75xqyG9UaW532J4FQ19EO+TYELQgE3oaHwlQdnwfOwvyJBMrL+/fvjK9aBXVuYMFShetvVWyBVnlD7N9zkoPqBhAwgtgyA4mWXKHmz/lG8/57Gvw2iz26YnP0i69Y78hk3sMCigHm7EYto5vYOGpEbuw/ifrZlV8z/yPoj60TlJrbHjUtyayHas9bNOAelriT5hlbc9y99ea77Le3eDUcbI+gnwaK9xt9wkVo4xV2zMA2I8dDL+T6IU/Dg4sF6Y60XMb2PIyShIox+swrAhY7V00i3MB9hD3bNc6MJ54nzaqPRaYAAy3eMmeLqbNW5u/8fLyq+gaTq6TMelHqlBBKfXQLO6FtDien9cYFXvxfHM5IE1qtThfn4DirwTk7QEnsOSXOt9g2cVRKoQHDNpO+xHQptgt6x5i5YKZja07Q4BRYGD78++NZp/hmXCyZN7bbKsu3zkD9BfOv7QkZGUZz4iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(366004)(396003)(346002)(8676002)(8936002)(478600001)(26005)(186003)(956004)(36756003)(31696002)(83380400001)(4326008)(16526019)(31686004)(66946007)(66556008)(16576012)(6666004)(38100700002)(86362001)(52116002)(6486002)(54906003)(66476007)(2906002)(38350700002)(2616005)(316002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUVaWlNUNlJ0R2lFSFM1ejdDSkZuMGN4R3dDT1RHaG5uKzZkaldoY2twYTNQ?=
 =?utf-8?B?TTJrTnFaK3dZNDJPQVpSTERVS1Y1b2c1NVF3VS9PR2RDdXh4TC9xWjRSMmpo?=
 =?utf-8?B?d205dmw2VXd0YituZ3U5ZXUxcStOc3d1VUt1bXhZRWtBbE1PdzhjQlVxdHBD?=
 =?utf-8?B?SGtjejROSkVjNzl4S01YYktKdnZPb2hHTEVoVWxyZGpESnFJS01VQW1waFA4?=
 =?utf-8?B?UzNab3o0c1J2OGJQeGR5cWJ0WEtrcGxJV0RTSTllTlFxKzViYTJjR1JUWFBJ?=
 =?utf-8?B?S3UvcXI4Smp5NHJvcGxWeWk1eW9ScVkvZ1NieEVxTHJzMzBlSjhoWDZ2b0pB?=
 =?utf-8?B?cEY1ZTdWMW1OTTZ0ZDlUMy9wMFFVaVJpc0x4bFIyc2ZBTmlCZFZBcFhlUkFG?=
 =?utf-8?B?ekE5dHZ6UE5EZUgzWDZQVkFZeFpWUUNrS0pSdHBLVTFPYW9UcWFzN2tHQllS?=
 =?utf-8?B?emUzNWhWMi8rbXlBZm9reno4NTdqTk5PMzRmRzExTnI4S0FKV3lXbk1yK3gw?=
 =?utf-8?B?UVkvUWxqRk1VSFhNTWNKR2U4RkpCK2xYT1dGdDBIZVAwWXhVNmdXMTh5aHE4?=
 =?utf-8?B?Mkc2M1BWdjlqSHRwaS9yOVpyOG56anZTQjNRd3k5cElnY2N4TjBaaXg0MUx2?=
 =?utf-8?B?czlLOUZYcmYxYm1LVEJKbGx3QWpGSlkxbDNLaVh2UitYNktrd0xxa0pqcWha?=
 =?utf-8?B?N1hpWVhBWVlVVk1SU2RXdnFLVzFIRld1UmRxUmhpa3pQK2M2MkNWRG5OUUxJ?=
 =?utf-8?B?Y1NjV3ZhWXJCMlZYVXRJelBqWXV5ODhjYjIxZmxmQ2pjN1FIQXpLbGpnNjJi?=
 =?utf-8?B?SmtQRjVWMi9GQy9FSFdkWURud3RUT2xFWHVpeTRjWDBMZTM4L1FoQjZkWHpx?=
 =?utf-8?B?Y01MVHpaQlFKSlVabUZsbGNCeXB4VHdoZ0xMY1B0RTVpMG4xdjJVYUVCODRP?=
 =?utf-8?B?cEtYUmtKL0dPeGJ5UzNkdU9MODgvZGhXZXBidXB2VEc3K1VDUUtLZWV4emxG?=
 =?utf-8?B?TWZ2ZVBvRHRGN0RGejY1cUdnMFlabEREbW1nYy9QdXRCZzF2VFMyV05CMUpi?=
 =?utf-8?B?VFdtc3VqR1BEU2RTa0dJMWFOVWhvT3VXQ3I2UEZ0MVpvMlhMbnJUdTVLYVNw?=
 =?utf-8?B?SkdKMzRCRnl4bmFGTjJ6UWxMejJiZXNvTTFVNHRyL0R0N2lIRk9UM2FaRERS?=
 =?utf-8?B?ZFpuQkI1Tzh0Q1F1WFd0dExqQ1NRM1ZmbG5iSXRqREQrVVBmKzBBczZLdXZl?=
 =?utf-8?B?V0U1ZVdBSGhuREpEb3N5UG1mL0IyOHlzcmg4OUxGWlgyZEFUbmdoejBKZTBS?=
 =?utf-8?B?TFZlM1c1Y0U0dThqLzBvU1VCa0pNNFZKVGpRb2ZFQ3FhdThydFFLQkx0b0dQ?=
 =?utf-8?B?b0J2ZGlSdXVvSTRGWjFmNkZpbTdVWS9MSWtHQjZCa1ZYMXpMODVTOWJ1WjR6?=
 =?utf-8?B?TmV6VkhEeG5MY3dvcnBaVVIzcXFVRStsQ3ZYWXRmZzd1Nkh4TExVN2I3OXdK?=
 =?utf-8?B?K0Y4aDAvOHFObDdlY1JYaExIUHZnUnZya2hmd3lRckQzT1pGOWZ6SGRLWW5F?=
 =?utf-8?B?U3JzVW5SejR3UWx2YmY4SjNZOEZETkRmRlFPN1NmSWZSVjBHSC9nK0pSUVBY?=
 =?utf-8?B?aWFZN09KZVZ4QmxXQW1QcWE4cVc3dXhya0J3VnUzRHFTMDhpbHl0Z2RoczAy?=
 =?utf-8?B?VkVvcVVhQXorVXVxV0czeWlIL3U1eU5JUXV5MG9uTzZOemF6ZzZsQ0xjcmd2?=
 =?utf-8?Q?DHDkpK58AqZBUBbP80GG9fLDM2xd/oaH/dsHlS7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239b5c5-f3f7-457d-7b62-08d9356b8cbc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:50:28.9387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw3lwn6Z9h9kvFY30aPVmKagJcaJn1U2ONb7chB/5KkUDRlRH2J4HALOgCOtPfeULm8qOd9fshz6pZz1vj5VmO3xe9E/gZLUq8rzZlICNaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.21.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

21.06.2021 13:33, Emanuele Giuseppe Esposito wrote:
> Attaching gdbserver implies that the qmp socket
> should wait indefinitely for an answer from QEMU.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Please, let this patch go without my r-b. I don't like it, I explained my thoughts, and you even used my suggested way in previous version.

What I don't like: good component - Timeout class, which is currently independent of outer code and can be simply moved to another module becomes dependent on global variable, which doesn't relate to the class itself. Neither I like logic of the dependency which just make the whole class do nothing by skipping any action internally. So, IMHO Timeout class becomes worse.

I'm not a maintainer here anyway, so my r-b isn't necessary :)

> ---
>   tests/qemu-iotests/iotests.py | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index c86f239d81..e176a84620 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -477,10 +477,14 @@ def __init__(self, seconds, errmsg="Timeout"):
>           self.seconds = seconds
>           self.errmsg = errmsg
>       def __enter__(self):
> +        if qemu_gdb:
> +            return self
>           signal.signal(signal.SIGALRM, self.timeout)
>           signal.setitimer(signal.ITIMER_REAL, self.seconds)
>           return self
>       def __exit__(self, exc_type, value, traceback):
> +        if qemu_gdb:
> +            return False
>           signal.setitimer(signal.ITIMER_REAL, 0)
>           return False
>       def timeout(self, signum, frame):
> @@ -575,7 +579,7 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> -        timer = 15.0
> +        timer = 15.0 if not qemu_gdb else None
>           super().__init__(qemu_prog, qemu_opts, name=name,
>                            base_temp_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> 


-- 
Best regards,
Vladimir

