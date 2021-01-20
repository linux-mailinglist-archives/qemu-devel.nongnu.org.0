Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331582FCF1C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:26:08 +0100 (CET)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Bcl-0007Bu-8J
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2Bau-0006Zm-HA; Wed, 20 Jan 2021 06:24:12 -0500
Received: from mail-am6eur05on2101.outbound.protection.outlook.com
 ([40.107.22.101]:2656 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2Bar-0003Ec-N6; Wed, 20 Jan 2021 06:24:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIbue/MLDvSEXVKft7rxXQtqPlxzGGAC18xHvaK92owXDk85kqtqzESNLDY2Hr3Bq/aqXCDP2ilQp5ighOvjL0FQ3mQi2pjun1SeVvDd1VRbkQ/BrBqZ8+gh4vaEMddzWMj8oKn4oPlkl7p+R+B6WywEvwmzY50M6u5phzD++fuAcQ6S7Lz/C75h1KsBsTSMwmu/Ku1K4Z6yJCu6uw5RX+8sB+9KZbbfCi3SobdiHPGIkdhYG16YtXr25F1JXJ9i6kyQuEE8oJREczYwnpys8XafxWTiqqDNVcvzFuGp/z7eZ2ceivkEMQBR687ZT0tTrrfiNxcEiuy/PXuKIZ/ayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHYCDtcBeCMsDSmWQVsTNWpe+XlfK1zQpclxDg51bTk=;
 b=EY+B52pN++1KreYAyDZF/I0nUvps67JJz5rt3Sl3TJgI9HqXlHZ7X2wR+LJonmfLp3LCjIaabA4Jdkvn+V8N7aWxSbrqqPsahyy3KWhuK30JZzNhNy3S9W+XFoXFPGVcoL/XpM0REPUg7+7HlNkcxg/rIU3svxImD72xYUcsHxRUkqFZPqJVvLrrVNu3djaoh8mbw60RPZf9VUionXCtKSZCqAMBvgO5WzDFxrpvtHERIbDxTaRktH2zveAQBjWONDWbfxh5dMhmTBZfEKxbbnyds/IzoWXS/p2iMUhGRFX6Tjf4IujAvH3MpYq80WrTa6d1xjC+vRKUuN/gvchM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHYCDtcBeCMsDSmWQVsTNWpe+XlfK1zQpclxDg51bTk=;
 b=sL1YItja5TXk+dxXrTbdtJ+c6F885UVILSTrsCIF1+RxrxVfuaXbq45VOkhGreff1s8FYvZ7xoSt8iR2QFbkbeSGuz58NnH2oEVUWjSPmlGBGvX8Dpg//r4AFXnUuWXLka5DaVknEhj0jC2mpDVq9rP7wjZPwIciZny/K+ZpMEQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5496.eurprd08.prod.outlook.com (2603:10a6:20b:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 11:24:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 11:24:06 +0000
Subject: Re: [PATCH v4 11.5/23] iotests/129: Limit backup's
 max-chunk/max-workers
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210120102043.28346-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <03b53fe4-1fe8-836e-9282-c3c3ee2b66e6@virtuozzo.com>
Date: Wed, 20 Jan 2021 14:24:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210120102043.28346-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.70]
X-ClientProxiedBy: AM9P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.70) by
 AM9P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:24:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef1c62e-45bd-42e6-cdda-08d8bd35e5d9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5496:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5496758CE0449889996A8191C1A20@AM7PR08MB5496.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ad0YDm48Ku9tt4EbQU5iig/qBVWFjQV9mMcijdQtD+kuwwVhMV9WIRGzPmnVgSuEPrigvsnmNPzGcWLBjTSABfT3CIsfZ2ubKKw51/9aBLUJQmEfidTrxa22LZnfKwgCVwZSU6FhiKGMZLwpBMqWZqe0NNxwtDZWY7w8/8bBJYNGpHlDG8B1nkZfheheUKeY/MV8ufHpot66TpuhMs4QEKXEKHIpiKHkY9yZ2GKICc4f4L4nPttuGFBkFd/2bFz+6ubJHvAJH+eMY2ElBjzBE8LBC7WGN1uk4ZSRQwmTlUvNlvPkj46KcXbk+4/0fpxr39JKDgglae2REp4YkMCSmAyq87LxMajtCru7kUb9ZVRsfZEBpDHW3Q3CLuc42ApCYb+Z5a717uXk9dHH8t/u4dGFAm2UkwkVRyDx3KlPwb0/gIrkFEuZShqhHOpDqSES8WcgujVGvKtjGegaYsbSawFacvq0F7QeDgecYrIPsy7pZQf78v3bjvYn8/eKz9U2ajXk+5XPuaOyibSYC0Awp+qMbVO12coabMR5Sb97xS+e30xXpos8naf5gil5/hLwnszHL9dsh3MFdxA2JOxpvdyahT3S0hCmtcoFdM09bYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39850400004)(16576012)(36756003)(8936002)(6486002)(31686004)(66556008)(83380400001)(54906003)(956004)(2616005)(5660300002)(66476007)(478600001)(186003)(16526019)(8676002)(66946007)(316002)(26005)(4326008)(86362001)(31696002)(52116002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFY2VTRVV05SU0RUSFJRWkkrRWxYOG9XNjVXVTY1bUZOUHU0ZnJZNjBUKzFF?=
 =?utf-8?B?c0JJdHlEbTZhRW82RWpWRXhKRUVKSng0TjVIS3ljWWhIYmQ4K0tlWThSUzhQ?=
 =?utf-8?B?Q3lOMUhvYkluVlZTTm5LMzJIb2RWN0QvQVZ1ZUF5bWcvNDBicWN4NVZvU2U0?=
 =?utf-8?B?dkZaMWpmLy9pVHF4SUNZTjVuOXY3Q2Q3bHBDeHJTUWNrTVRyU3k5cHFyaHBv?=
 =?utf-8?B?dE54NFk0a24vMVBLbE1tcklYd1pncmJjQVNMeHZnRnhPNEVNL1ZycUNMQ2w2?=
 =?utf-8?B?YWFsNkxiYU5vazFXcmpiSUJBaW1uV200VWRGSUpSNW5pR0xVTVdwRDA5aFhm?=
 =?utf-8?B?VHZidE44ejQ0bGZkNVNPME9BZ1B3SllsQTk0TzJ1SGtJeWJxUlNlTC9PUytx?=
 =?utf-8?B?Yk90aHk1UEtvYStTTlVqa0krNDhkSVV5T3pnUi93azFCSWl3aHZHYjJ2bk13?=
 =?utf-8?B?d01KTnZBQkN4U29TcFMxOUtQVSs2ZGJETEtxd2c4R2dIeUIxdXpJckQwaGZZ?=
 =?utf-8?B?am5ieXJ3dFM5NjRyZXpzL2hpS0FHWC8rWGZ5Q0FFRTJ0d1ZCQVo3RXdqT0dl?=
 =?utf-8?B?enp6S0dhOEo2R0FGRVpwK083RHVvZUhMM1VXUDFNcTdkNEJKTU43dXovKzh2?=
 =?utf-8?B?T3o5aVhhWG1UbU5TdjdJcEJCSmtxNXEyaFNsZXhQYmtUc2R6ZE5ib3F2dFlC?=
 =?utf-8?B?MVFURGR1QS9HeWNpSk54ald2eENWemxaVFNwSU1LdFJtVGpCR21sbSt1LzJn?=
 =?utf-8?B?L1JCbEx6dXFIaWRGdmxTbU8yVk5YNy9iZWZPTkVvTXk2UDN6aG1TSjJJaEdR?=
 =?utf-8?B?cGs2dHBnbktwc0hQaUVDSTViWkhod3ZXVjdxQ01tWUN6U2xhZmJyVXhXVTNZ?=
 =?utf-8?B?RjNEQ0RVSGI4TVBmK0hRbUcrc0JYeE5lU1NFNUNQMG5pSDJwRlVvWXJlbmtZ?=
 =?utf-8?B?Q0p2MWg0S1lxTHhYbnZVbmJxRWxpVlBDdXM5Mnl5bnZMcS84ZVFqRjFmYjU1?=
 =?utf-8?B?SGNyUFE2Y0Y2OWcycVJGeXorVExKK3FaWis4K2pDZG53K2hRcXNNNnBnTXdn?=
 =?utf-8?B?SDY3QVJrRGpyUThLUTk1RTlKZk9HQzZveXoyaGt2amFSVUg2MEN3b2thUDNW?=
 =?utf-8?B?RlpyTDRNalVnemxyQ3dMbzYyUXJZWmxTdHVkQmpkUUZOVnJRaVdQWVd1cXNY?=
 =?utf-8?B?eEprRW9IWnNycFlTb1pkaTZiT3VLbjlCMnBER2dwYXo0R1F2NXV0Uk9iQWM5?=
 =?utf-8?B?bVQ1bEVnMTdvbWVYcjFxYkFNRTRsekRtS2ZvY25ud1RiMjZ3MnpNeVJ3dSt1?=
 =?utf-8?Q?/hkXiON4PwT8BZYzBJJY5KNjHkoiFivfX7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef1c62e-45bd-42e6-cdda-08d8bd35e5d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:24:06.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fr7YitewJ0gLtRcCWDAz5dsQjPG5SV9T6qj2jlnQQzISNVSYiqO8G5HXXaNujJNfArO31iPCLzmEu0TTrYs2arbOoIEVVwe6potCoiswVgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5496
Received-SPF: pass client-ip=40.107.22.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.01.2021 13:20, Max Reitz wrote:
> Right now, this does not change anything, because backup ignores
> max-chunk and max-workers.  However, as soon as backup is switched over
> to block-copy for the background copying process, we will need it to
> keep 129 passing.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> Hi Vladimir, would you be OK with this?

Yes, thanks!

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Hmm, interesting, what's going on with defaults:

we issue 64 requests by 1M, and 63 are throttled. On stop we do drain, probably throttling filter is deactivated somehow (otherwise drain will hang).. So 63 requests should finish and backup should be paused itself.

Then after drain throttling should work again? Probably, job is resumed earlier than throttling is activated again, so new 64 requests are issued prior to throttling activation.. Or probably something is still wrong. I don't want to care too much :)

> ---
>   tests/qemu-iotests/129 | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 9a56217bf8..2ac7e7a24d 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -70,9 +70,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>                             sync="full", buf_size=65536)
>   
>       def test_drive_backup(self):
> +        # Limit max-chunk and max-workers so that block-copy will not
> +        # launch so many workers working on so much data each that
> +        # stop's bdrv_drain_all() would finish the job
>           self.do_test_stop("drive-backup", device="drive0",
>                             target=self.target_img, format=iotests.imgfmt,
> -                          sync="full")
> +                          sync="full",
> +                          x_perf={ 'max-chunk': 65536,
> +                                   'max-workers': 8 })
>   
>       def test_block_commit(self):
>           # Add overlay above the source node so that we actually use a
> 


-- 
Best regards,
Vladimir

