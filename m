Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F22F4D6A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:43:58 +0100 (CET)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhNN-0002eN-Ka
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhDt-000071-Co; Wed, 13 Jan 2021 09:34:09 -0500
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:56962 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzhDr-0006vq-2I; Wed, 13 Jan 2021 09:34:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5e8FpjTleAA45Z6CfbqznLUQxW0xjP36NnZYtnJumyrNR7glFW1Z+7QbwdzME1QwXGFVo1RkgT0mBQQMZOAp0MwH88UBjxR5VGBgFy5uzCzmvo0q58TIAjzL8v+a0HUXkxA/bHgKlbCxJQ1HuTa/ruEiPRDZC5nVWJ880JTHH5exgf9UL0OnC7T3legHS52yTX3vVF9I7UM9BoZXh6HxHOiwyUk+ljGF7WGQ4Ad2ysvAbRYFlEfhoXZX3y3grVHhea39AKCNwvuUvAvA0fsQ5ZDOjDzuItfWI3f5BNaVFBWSc643UCHBzx4dUsJQdefecJPMzyZWEgiH1X+J2xsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBujAI2+AI68blwjEPbh6J92kZdMcYmHvVj5CXwJrm8=;
 b=Csd3EaHqf/bOvfMeg0rkXifsyQ/DhkqJhG5BIgxg2tADGdu20HZUq9rRtvATybN5BVAkwXQxrhMRV1pVDLpwHfwVBhyoCV7oDdiEIHVNXNeksF+Y1rSOq1LXRaV31GJsVo9ZbiqmsDZlExIzIOxhbHlSuVhH5duH1riTIPp6hdy7WNZMu0Eca0JeQkZtT0ImLO2aU0dyaF8qAJWkwUqgS5kXJot5wzeapvnN59CqJKaP4zkl7jozE/YZSQvGLJMS/h1h8EA2jSndZA8KQ3jrETNXO9+S5k+ttdHTlQH58hW3rG2QE2HlTZV22ij+RZ9k6dTYzRQ9isNNp3NxX6S6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBujAI2+AI68blwjEPbh6J92kZdMcYmHvVj5CXwJrm8=;
 b=pOBtKJY2IsmvLyto+gaLWosgy3FczlW3IRWkXz3rsCQ0gKPWwJ6upnNrJCGLFwitXgXU0jTGB27TQ3NcYw1XWtBDkJAmu1b/DIJSpAgg7V4P8wGoP0TS6E+eWNtVhpO/TyOxPGJg+3sP6mVm0aqJSQ6ynTNM/edqQtjV7eO9Zmk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3576.eurprd08.prod.outlook.com (2603:10a6:20b:4a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Wed, 13 Jan
 2021 14:34:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 14:34:03 +0000
Subject: Re: [PATCH 2/7] iotests/129: Remove test images in tearDown()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113140616.150283-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ea2c05aa-d4de-8b8c-a42f-fbf6d678dd5c@virtuozzo.com>
Date: Wed, 13 Jan 2021 17:34:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113140616.150283-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.4 via Frontend Transport; Wed, 13 Jan 2021 14:34:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62f4f02e-88ef-4f9c-6fc9-08d8b7d04670
X-MS-TrafficTypeDiagnostic: AM6PR08MB3576:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3576C3B388ADBD3AD718A741C1A90@AM6PR08MB3576.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C91kNxmDvuWsbunwlwaPMFdw475eRsuC8ixyDsWIWMj7/nqjGu9mCIw/f9+vv6V03lO27fX2OIvwjJjlVhrg9jbCEMyHR6ZAJ400Jp2LHu6lEvTsb/iO+ClmlJ5foZtxXTJxedpoFAYeXrQQcutBX71lVtivna/B5eRtBDzc9wUSbKCfgz906o1ElCjxmvmahWdwIGfSueSxGkS83+rib5qJ4pb2Kil2dmnqkFbmMrtAteJjWCInFLWg+9/5K/zgeOZxbcXFPSO5W+f4CDsEFXMFhTm0EoWjxR1M74WwS1+hRsHxg12Q+ralF9o7Q4kWfbkSA2jesUOoeHM8eP3qVY+4sXeyG0HBbzRsxEINv/DD61VW1uGxG9G+s6oLBFO0vrdy4iHG+ZAnMZkqHIlCzbV1zdWakCxYdEDeNBoHSKYywgbfhKPpyMakhil3jNx7jmiCblOQySJTtiQxi7slc7QxAqFcc26/3bTKrf8YxBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39840400004)(346002)(16526019)(186003)(4326008)(2906002)(66476007)(16576012)(956004)(36756003)(31686004)(316002)(4744005)(52116002)(8936002)(8676002)(66556008)(83380400001)(5660300002)(26005)(478600001)(66946007)(31696002)(6486002)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?am9mUFpiQkpmUDZaRFMyc1lCb0tMTkF2QkhNZWRRalczVzV1cmNmdWdkL2dm?=
 =?utf-8?B?OEVaVDc1TWZjbWxrZUVCZWVoNjNQVFl1eHlCZVp2ZnNsR2V2NHhGRjBQcTRJ?=
 =?utf-8?B?TjFxN0VYeklTeXlZbnhOa0lsbm9lMUdUL3loeitONHhlK2hjeW5Ta2M3OU1E?=
 =?utf-8?B?TFd5VWFHQVFUMGcwdVRDb2J5UHU1UmJPbjlqekVqZldOeHZmc1RORGxXK1VM?=
 =?utf-8?B?VXArTUxxV2lGTXNEN2lZU0NhMG51MFNucGJvMVhQNjhWYVhMbDNHRlR1RDA3?=
 =?utf-8?B?NzlnZkRNbkxvTW90Z1Btc0dNWVpSNG0rS1ZDTk83Y0dHVFF4bTZnUWRQaCtw?=
 =?utf-8?B?QlQ2QmkvU0pqMDNWTGx3WlFKRVo4RGNRMnd2YzlObjZTNCtWczRjYzAreW1l?=
 =?utf-8?B?d1YxTG1CQy9MdDU1RkxKenpJTE9NZS9qQ3JnQjM2Q050eW1Bd2dYVXB2K044?=
 =?utf-8?B?b20rd3oyVjBidGJNeXNUTWN4cHhpMU9OQ1NvSytCUmNoY0kvYTlBdEMyMEw3?=
 =?utf-8?B?OGpKUE92RC9wNHRWc3BwSUM1Vlh3SUZ0TERjZ0xXY25hUE9GTTRMSnVCTnUy?=
 =?utf-8?B?NzZBMC9ic0lUek1TTHFmdjlYaklWeWlIVFRlRk1LM1kzZWpjaWNkVFBPLzJK?=
 =?utf-8?B?d3Zkd1o2OXFZSUw2eUovT0tvZm9DK1NwUUdBOEUzSTNWZThtY3Nta3g2WEJY?=
 =?utf-8?B?c3pXZ3JiMnpMZDVhU0dFM2dIVkJUbEUrQXJRMDh0M1lHemdYVjFjakN6a010?=
 =?utf-8?B?cElnVDBZNVVXdXRaU3RVbERUSFVaWkprdmR1czVSZ2hBS2h3VjJ0dEM1Q3V6?=
 =?utf-8?B?MWo4OHJkK0h1ckFtdTZpZUNuNlhUamRMN1l0c0QrdlUwTWhvQmJJTk1kOWNR?=
 =?utf-8?B?WUNkTnJ4cDNPbnVTOHdVSVcyLzJub3BSc1ZacWNhQWFnaU5lZGFpcWNvZnBL?=
 =?utf-8?B?ek80TkdLbDRjVzBkTDhzSDcxbHEvcmZuczlpRXVKdGZWdlpibGtwZFUzS1lz?=
 =?utf-8?B?d0dRdUgyVWZpdXpCWWY0d2xzZlNhMytQazFGWnkzMk5MMkE1YXVqOHdaUlND?=
 =?utf-8?B?eE5DUWEvUVVmZjNoVlVCU2FqWGJJYzhabWc4NS94T042ZkxXWWxTTE5QZEtE?=
 =?utf-8?B?LzQ5SmVNYkJWc1FTSmYydXhSRFFUV0o0Q2VFTXJSUnI3RVdZaEJVN2VxVjdz?=
 =?utf-8?B?WTFkSEZJYnVUZzBYNDMwVTFLTzVaMzAzWEZFSkRPWjFqL1VsVXhYd0s5Z2lO?=
 =?utf-8?B?WUVXd21CR0tnMGRQNkp0eE1kY2pzZnFucERhOHc2d1p0Z1dUbW1qS2V4YStN?=
 =?utf-8?Q?zBsnFgMIcIYvTCkrr6nQoWfXnmQfh996u6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:34:03.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f4f02e-88ef-4f9c-6fc9-08d8b7d04670
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZuHQnZtLbcyDO56EaWP4EfgS6G/bQvfAuUYRSYtppJ6km9g+HAKvCrCw7D/+5DHBIrYbHDQUu+Zsb7AsF/7jzSY2RyL8CYDPnvW1X2hhjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3576
Received-SPF: pass client-ip=40.107.0.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

13.01.2021 17:06, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/129 | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 0e13244d85..2fc65ada6a 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -47,6 +47,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>           result = self.vm.qmp("block_set_io_throttle", conv_keys=False,
>                                **params)
>           self.vm.shutdown()
> +        for img in (self.test_img, self.target_img, self.base_img):
> +            iotests.try_remove(img)
>   
>       def do_test_stop(self, cmd, **args):
>           """Test 'stop' while block job is running on a throttled drive.
> 


-- 
Best regards,
Vladimir

