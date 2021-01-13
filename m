Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726012F50EB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:20:36 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjox-000493-HV
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjHz-0001WE-PO; Wed, 13 Jan 2021 11:46:31 -0500
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:22976 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzjHv-0000qA-2G; Wed, 13 Jan 2021 11:46:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFkw1qcENTiW15Se/Ku8kWbuL/oKOb2G/xUW9jcFMwHBnYulXSk5TQi3tR9m0fjZDHikQGL9JJsQjoA+RJUicwa3hVE5oQ3Cu/FSDy6mK/BIIvYB9AMeKskfFRE97opfIMksiF3SbGL3uoY9HPH0giaToTI0cRH7qgJKdHAxhTgJek5vrkou9pEUWZ9pbbX2+RsoPIKT2Xp2vdZTQxjnpH9/Wj4H5rTD9Uc0ueoyh76xQB/YGPak/74HaMVgebaC8cvsgCR1c+ksMZEgTlSgQNpRcJWMrknLScNKsuyb4BJML0Y7mNyZdGsW5LWZsc9lj1duvTFp6j9c4Bf2vn4r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3MUlhyJG9JstMnrc5M7f2bGPL3jDvIrdj9N7S4aEc8=;
 b=Uaxsuly/HPm4k2sBiQPT0rQRYvuYkd9wqOPDHgtsc4jQtel9iFhR4ee5lXnYmJecdb3kB0C0frp8pfnOnAdtJRF1AKP3Zf3+gasz5ZeKkBarpWCtR1yHw81bz7cZu9ddhtcOgb6iDe0Jj/j/h6djJs84rO7BzKV50dz1VjO1x8BDcHzpDQJSwJU3mGoxecnMIzPaU/ZlEcOr8UN0Eruu5qJqRktC57vjuGVlkNd02p+GX85hE2EVskHfKKTXjgX6U9eADaqoh35A6FwOOlTOsP3EPSkUxQlY5V+gYv+WDVPndU/xxczdqMCrNy1IEzFrxrLAuPDbJ3bKN1eqfJx5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3MUlhyJG9JstMnrc5M7f2bGPL3jDvIrdj9N7S4aEc8=;
 b=qy9o3ypB0difFGmQf1gbl66IMo7+zpTzxM+iFiOjj4WIEdbeauFSCiRj2S8F0xWri455tq/QEmL41GOZeDdSctbrQvvFCIflHJAl5O0CpISJoL1uqjTC3iW8YhuruGyZ7JTJU5vW5UK4g6U+FCYWFPN/TZiuWkQAQxJrmWS0Vik=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Wed, 13 Jan
 2021 16:46:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 16:46:23 +0000
Subject: Re: [PATCH 4/7] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-5-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e3aa08b0-940d-8ae7-c4ee-a132510c1c55@virtuozzo.com>
Date: Wed, 13 Jan 2021 19:46:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-5-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR02CA0155.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR02CA0155.eurprd02.prod.outlook.com (2603:10a6:20b:28d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 16:46:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76470f06-c60d-4100-0f80-08d8b7e2c31d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB48520B0DC5561B96C78ACEBBC1A90@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRZFZFaIOBnhdD46mXe6umQGmGDVAwX2BwkZVmd4aJhBX0M+8T3ckOnjJjyWtLDBZFFKufnfq5GHPBPt106Y8IlNrP3w8YaqqqnAxJScnYF7XOZjKf8k0lnB7JZIlV3uo/kDqHPz7uk75OICxFT+fy2FMgRXb+iSi0dPRHxrkz8Gt9OiE3ghAQ26kgFrje6NxWeu9ozgcWmtbZBLce2HkBXcRmC29Kkmb8jrsl+ULAYBY7m6t5nopxV90Hy3mqj7GPDbxAdCn6S+OMm7Ohbd0WNZw7sDPVbpTntYxoldLB+MHdjrqjFZV01ms4gtUlTtzDwm5XISvHJUFZfjaP01aahsKQh2axyhaJa6RQ/yr15gVF/lZoYmqGhItpZAULYJ+Hm2Cf+CC6kCqt42lVDhKe/Zc6ZI75k0BD7RhfFgCsgn7YyvTgnkopwCnGZb/clm8gEpLZK9HA5l/gPC1RdITfwipqsbqfnvwDoCxMnZwbU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(366004)(396003)(346002)(52116002)(36756003)(8936002)(31696002)(2616005)(316002)(478600001)(5660300002)(16576012)(66556008)(86362001)(31686004)(83380400001)(8676002)(26005)(956004)(186003)(2906002)(66946007)(4326008)(66476007)(16526019)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1VUTVZKZmtDNkhuT2lucEpROGFjR0JiOTduUzMybjFRWDlJVzhRNWNWWnJK?=
 =?utf-8?B?R1RMN00xem55WE1EeW1IMG5pVEVCOVpEUnEwKzFHbXdCMzBZRjFYeXR0MUJD?=
 =?utf-8?B?aTljMXZWS2FNY0FKTERia0JoMHVPVjBxM01xaTlQQlpiSE80S1pnS3FDQXJa?=
 =?utf-8?B?N2JFWGE1aVh3cVM5akZjcFR2NzYxRGhuenNHNXRMdDlwaE1WRVdCMEFlWnQz?=
 =?utf-8?B?cHRxSGRuWlUrRk8vc0N6bEJmRk1VTWozSE5DNC81VHVibzNXOVhyM3RYNmpk?=
 =?utf-8?B?YWxUb1pLeVJ6ZW41TU1sNW42Sk95SmkwczdXUmpRdjJXcUlkVUZyT2xPbzBI?=
 =?utf-8?B?UEJVWTZwY3o0QW1zVmo4K2RwQXNRbEJQcENRa2JvK0VzdGdnc0trdFc1dVRB?=
 =?utf-8?B?QUU0ek9VaFNEc3pSTXlUcCthVlM2YVM4NkVBSGRvRW1Zb2JZSGdnMEtkbWsx?=
 =?utf-8?B?YXVrcTRvOHYrWFAvbmJYeHpYdStVTC9zbzhsd2NpREpWb3JaTGxjclNZaUMx?=
 =?utf-8?B?Ykc3R2o1NmcwNi9reHdjRDkyUXBRaGJyMUtobyttSStjOHJVR29qVmRkdCtl?=
 =?utf-8?B?WFJidFRkZFg3b1NsK25ITWE2b1RKTHl3aUdkOCtxOXFFSmN4ZlkrSnhIUEhW?=
 =?utf-8?B?Q3lyKzU3dnRBVWM0aWxHOFZOdjlJdHBHaXVIMEdzdzEwWW5ZYmRyOU11QVIy?=
 =?utf-8?B?RmQyT25tcmIwUXdJTGk5QWFSdnUxQjFUditLRDMwakVKKzZkdGJDQ3llR3VE?=
 =?utf-8?B?N0lmOU9EQ2cwbjBKMU05d0x3bTljMDduSHdPU3RBZHNCZllxSEZTK0dFd21R?=
 =?utf-8?B?SzlpZTE5OEJHUkJXT3cyZXZXeUk3azBLRFdkejRqWXFLYVAxcUJMTm1uc1By?=
 =?utf-8?B?b2tCcUhrMzhSY2xBb2wvSjNFZ0NWWU9GWkNSb1lSTXBCSUFseXNVVk5WVkJm?=
 =?utf-8?B?ay93S0lTbk00QXMreldTTTNqUGNUSUVZMkQvbXhsOThXaXNLb3BQUGJ2QU1m?=
 =?utf-8?B?TWpRL3lIRUs5Mm5NSjM5ekxmMHk2WWxvdUQ4UktZbmd1bTYrN2FsU05wUGFP?=
 =?utf-8?B?V1Y0MnFkT2g2ckFHYzN1d08yK1kxaXVaTWNuVkJxSXhpN08rQTFjSitnUlNT?=
 =?utf-8?B?YTVGdHBGR3I5cWxiZzdZcVJhY2pSUXRRbWlqRzNaUWlzNjFqb21PVEhEU1FQ?=
 =?utf-8?B?TDJ4VG1MN3g2QW9kSTJLMHMxY2h6bW5nNHlaTjhOejdscTRvVDk1UzV0UXRX?=
 =?utf-8?B?bkV2dmM3MThjRU5MSG9QdDM0MjEvcjdpVkpEWVRxb011bm5JaHJNL2RJNTg5?=
 =?utf-8?Q?mkvyRTDDAqFci38K5z6kDMFqI9JoA5ydff?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 16:46:23.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 76470f06-c60d-4100-0f80-08d8b7e2c31d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idUi1DFwd5dxb83N4v1aoALigkkh3pxrZ54e2LO6QCdBGXrFSev8SY7ifJMPdqKSgDbZsBFTwulOOAXpVfh7eotuOSiisxzl92KgUCQxCPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.21.112;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 17:06, Max Reitz wrote:
> Throttling on the BB has not affected block jobs in a while, so it is
> possible that one of the jobs in 129 finishes before the VM is stopped.
> We can fix that by running the job from a throttle node.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/129 | 39 +++++++++++++++------------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index dd23bb2e5a..febc806398 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -32,20 +32,18 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>                            "-b", self.base_img, '-F', iotests.imgfmt)
>           iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
> -        self.vm = iotests.VM().add_drive(self.test_img)
> +        self.vm = iotests.VM()
> +        self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
> +
> +        source_drive = 'driver=throttle,' + \
> +                       'throttle-group=tg0,' + \
> +                      f'file.driver={iotests.imgfmt},' + \
> +                      f'file.file.filename={self.test_img}'

python has a "c-like" string "concatenation", i.e., you may omit "+" operators (I don't know is it a good practice, but I do so:)

> +
> +        self.vm.add_drive(None, source_drive)
>           self.vm.launch()
>   
>       def tearDown(self):
> -        params = {"device": "drive0",
> -                  "bps": 0,
> -                  "bps_rd": 0,
> -                  "bps_wr": 0,
> -                  "iops": 0,
> -                  "iops_rd": 0,
> -                  "iops_wr": 0,
> -                 }
> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
> -                             **params)
>           self.vm.shutdown()
>           for img in (self.test_img, self.target_img, self.base_img):
>               iotests.try_remove(img)
> @@ -53,33 +51,26 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>       def do_test_stop(self, cmd, **args):
>           """Test 'stop' while block job is running on a throttled drive.
>           The 'stop' command shouldn't drain the job"""
> -        params = {"device": "drive0",
> -                  "bps": 1024,
> -                  "bps_rd": 0,
> -                  "bps_wr": 0,
> -                  "iops": 0,
> -                  "iops_rd": 0,
> -                  "iops_wr": 0,
> -                 }
> -        result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
> -                             **params)
> -        self.assert_qmp(result, 'return', {})
>           result = self.vm.qmp(cmd, **args)
>           self.assert_qmp(result, 'return', {})
> +
>           result = self.vm.qmp("stop")
>           self.assert_qmp(result, 'return', {})
>           result = self.vm.qmp("query-block-jobs")
> +
>           self.assert_qmp(result, 'return[0]/status', 'running')
>           self.assert_qmp(result, 'return[0]/ready', False)
>   
> +        self.vm.qmp("block-job-cancel", device="drive0", force=True)

won't hurt, but I'd drop it as unrelated to commit

> +
>       def test_drive_mirror(self):
>           self.do_test_stop("drive-mirror", device="drive0",
> -                          target=self.target_img,
> +                          target=self.target_img, format=iotests.imgfmt,
>                             sync="full")

this doesn't seem need/related too..

>   
>       def test_drive_backup(self):
>           self.do_test_stop("drive-backup", device="drive0",
> -                          target=self.target_img,
> +                          target=self.target_img, format=iotests.imgfmt,
>                             sync="full")
>   
>       def test_block_commit(self):
> 


-- 
Best regards,
Vladimir

