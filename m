Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735962F5437
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:41:26 +0100 (CET)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzmxJ-0007E4-Hi
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmv6-0006Pw-7o; Wed, 13 Jan 2021 15:39:08 -0500
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:54113 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmv4-0003rG-4l; Wed, 13 Jan 2021 15:39:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlXbBkJid1Oss3Hbh/R4ljprG2nxY5NhHP+K/JzhZAAs27yXJ/IoRrlnMA2KibazSDRSW2sA7RHEC0VUgz+MigISNIDmkns1tZwdYdWMrBZxybTeTJTO43of2BmANI39yRsEdZm+lV0eWSSYM216+d/HSwYNiUNOaWrUlKhjcyOKkWor+5x+JlsHj8V34v3hm19vk4RVZgj2COvLGrC8dXthdfzhopTJLA4hWLDdyRyx/9mugCvsGueBAaFTomjd7nFZdNm+MXTrMzC5GXQEczZV7VSRQLU2LBEBAL4hGH0OVWwKw4YEJne/baNMVlqjf4wdklGkZ7zva6gr4iy4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iccqJ2e3/Lz4cArCp3fnbMOnXkh3ilZZHL+jwFqCiNs=;
 b=TY2xHzXTe1EprqQEl0MrUgFob9ez49XdIWPhwOPEJXg7YKVylkKh6S3434cO9pszzBKJFi/xE7f3aBVKJYqrJm1kIeujfh9O82NGrZLu6Owgoeto4ZXRDN+m4N90SdK/YCO3R39O3oGBPECjEyXtAxcSJmbcCFpXfsxXHerKnO88Y/TrYfC6F0cZybWG/zQdsL4/vY9ZYXDsuuRNnclfgBgUc2vOx6awg8MHqd+CzCG4vLx4yOXoPuJdKnFYyxhjSZWSm4LknEii7qF8IwZ6LVeMUW2O/2gbg5jlIiKeRkMltw+zrwcuVn/lHEx3RlxxzMrUMKlo4AufRDxq1jWL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iccqJ2e3/Lz4cArCp3fnbMOnXkh3ilZZHL+jwFqCiNs=;
 b=bHMaFRguhpuRPUcggk/fw7+7tbuBuxKLDD8Tu0zuUFt4mUHsRUGw4ejSzppAysOvK8KIqOU3AF+aoii+Br0qkU4DHYiXYBNuqgGSVqD9EXxDGVzLk3Btc76cIGJ050zxtrwT0A7IHXzD7hOF4S6vgVzwMQoMQ3Mfkh4Jn4Xjtfc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 20:39:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 20:39:01 +0000
Subject: Re: [PATCH v2 8/8] iotests/129: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-9-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a7a848de-915c-3464-d471-111e592a2f9a@virtuozzo.com>
Date: Wed, 13 Jan 2021 23:38:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113175752.403022-9-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:208:be::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:208:be::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 20:39:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adf162ae-b728-4030-902a-08d8b8034262
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622367DDA3A8EBEE7CEA308C1A90@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mVSsIexTvYUSrvtj/AmhkhMBoWZ++yxET12sNqoZAbzQ3OlYe0BugYURLfKazkJPUwnvYvS4icq96DvRYTNPW7pO0v48NfbEr9eKHpH5tVlchMsI1IL+6MOjq3NX1PxjiYHqvsNIcV2WMCKsozLF6ERNFRxmBJivuXbRh0mW+v1VJoMO0HhdJrJRzTfDGY3/tMkUaJ4jUGvRJwKPLvd+iV9dpd7xeaet3A8yJfqRXuyL/y9aZHaLGaNx4H1n2Nzn54Q/U4BAB68Jf8nh4rr71W5+yk0kZW6hhF6h7ziiH8DN7lxWakATJj+uG38JaK019r9WWCNeWOkCMDsnvyvEWIS9R8r15KNjTSCeJird/07tKVG2pTs1FymXNS+gZdFzucCBL7CE3SVdNcMt1DPDycSeH4P5a3W8sm4idEfe7T7kKTfrQwIqmsvo+J/rNLlDHEjkrenXMDpM3Jfbzv8zOiEHnrGKFhVewci9zjoIF1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39830400003)(396003)(366004)(136003)(2616005)(8676002)(956004)(5660300002)(66476007)(66556008)(8936002)(16526019)(52116002)(66946007)(186003)(26005)(4326008)(478600001)(86362001)(16576012)(31686004)(6486002)(31696002)(54906003)(316002)(36756003)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGhxVDYwaGVidDEwZ1p0YnpxVjRhRkh4RVd2WXhLRmxqcm4zWGxqUk9ZbFhq?=
 =?utf-8?B?WUJSMGpuZ2dGcVZVbllRN2UvL1hNSitQcjF3MjFMRmRFR0NJSDlIZlIwc1dR?=
 =?utf-8?B?YXcrT290bDNjZEx0UE1jbGRIY1VYVWFFK2FMZGtJSjZXbThYT210U3NMak9k?=
 =?utf-8?B?WWphY2hSTXJaakNoNldOVjF0a05PQ1l0RnNpeGxYQTJjZUVmdGl2ckNnZkxt?=
 =?utf-8?B?aTlxd2tKalVpSHZaWWF4NEgyK0o4VldOaXExUWVGTUlsclBzZ29GTW14c3pm?=
 =?utf-8?B?YXJaLzQ2ZWZ5cWRNWEJraUVSYnB2RTNWcWU5NmRzT045QmFxQnczSDg3NzdE?=
 =?utf-8?B?engrak9VV0dXUzA0OE13U0JHYkNISkw5V3RJejBkeUV6T3hVUkR0UkdQSGgv?=
 =?utf-8?B?aTRaUS8xczJrV2xTNWlqUFc4em4ydjYxY2FaL2RiWUFKTmxwQmFiMEtVM28v?=
 =?utf-8?B?ckI3MVRxalBtWnIwTkpqZmpDb3VVUFM4YXN5by9NaGRBYmtDK01aSWU4WXph?=
 =?utf-8?B?dG1rUVNNVmFkV0Vqc0tZekxuWWd5TnZWUnVieEI4blpzZUs3eTVVcWNUQXQr?=
 =?utf-8?B?a0hRcGRMbHZDQTF5bzdmSnRiblhVUHB1QjRNOTdPaUF3a291OG9TMDl2NWlJ?=
 =?utf-8?B?ZDR2RTFWN0xUU0I3Y1BKTGN2Q0lzWG1FQ2tUa3crZ0lzY0NlUVB4VFV5dURh?=
 =?utf-8?B?endZUHBpczM5U2lKODVBODU4dWgvZUxFNjhjOGtZR2luZys3T0Z0Znh4UzA0?=
 =?utf-8?B?aEhLT2Rua0ZpR0trTzl4TWRIbjM0UE45OE92ckl4YzdpMHVRd2xPVHV5eldk?=
 =?utf-8?B?K0dHNU9seG1zbjlRNExuU0lTeWJjeDBxRllkbkhYcklnbDN2M2pnNVlnYW9z?=
 =?utf-8?B?MkRqNmRQWjlONVRZMU9XSVJtZVpoKzMzdVpMN3k5UGc0cDNQZERnZlZkOVJU?=
 =?utf-8?B?U0FmeElES084a1NrL1ZxZ2Vaak4zMHJhbVJudUdUdjl1aVNROWh5MEhnaisy?=
 =?utf-8?B?b0N6dVNsYWhmK0tyUWJRdWhBMUxRaFo5b2V3aFNvRGFJaG91c0YvNG4veHMr?=
 =?utf-8?B?YmRhMVZJaXVhVnJENk5GQWRnZWptT1RDejV5ZDFHK3hIZ1dzWU9BdFdPdzQx?=
 =?utf-8?B?MUxoSkk0dWxLM3A3VjVXejRIZDhSNzVBa3RsaGFLTUZVOGpkRDNxSksyL3Zn?=
 =?utf-8?B?SDMzWnFNWUlMZi9Pb1l5elNwQThaWXVnVnJZaEZ1RmhBVEJqajRzcFFYalcz?=
 =?utf-8?B?djMzeHBQY0tmZ2poU2dNK0daVnE5dmsyaG1SSGt2MjVlNXJYV0g0ODJQV0NW?=
 =?utf-8?Q?ilSaR6OinD2Kvez7SgDLXSx5/ovob12rp3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 20:39:00.9988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: adf162ae-b728-4030-902a-08d8b8034262
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19QUk3kvB6BkdjHD1dkf9NAdIiSbimXoFi/Z90Us5ITYjFu/OjCSIgBUA+ffpmn+OfMDiamCGp/Gc7w5J6rlk+Ij69W0DcpmFF2Ki/ArjxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

13.01.2021 20:57, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/129     | 6 ++++--
>   tests/qemu-iotests/297     | 2 +-
>   tests/qemu-iotests/297.out | 1 +
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 6d21470cd7..64578493c1 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -20,9 +20,10 @@
>   
>   import os
>   import iotests
> -import time
>   
>   class TestStopWithBlockJob(iotests.QMPTestCase):
> +    assert iotests.test_dir is not None

Hmm. Will we have to add such assertions to all python tests to pass mypy ? That's not good if so..

Still, OK for now:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> +
>       test_img = os.path.join(iotests.test_dir, 'test.img')
>       target_img = os.path.join(iotests.test_dir, 'target.img')
>       base_img = os.path.join(iotests.test_dir, 'base.img')
> @@ -32,7 +33,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.base_img, "1G")
>           iotests.qemu_img('create', '-f', iotests.imgfmt, self.test_img,
>                            "-b", self.base_img, '-F', iotests.imgfmt)
> -        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M', self.test_img)
> +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write -P0x5d 1M 128M',
> +                        self.test_img)
>           self.vm = iotests.VM()
>           self.vm.add_object('throttle-group,id=tg0,x-bps-total=1024')
>   
> diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
> index b1a7d6d5e8..88f00415c8 100755
> --- a/tests/qemu-iotests/297
> +++ b/tests/qemu-iotests/297
> @@ -32,7 +32,7 @@ fi
>   
>   # TODO: Empty this list!
>   skip_files=(
> -    030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147 148
> +    030 040 041 044 045 055 056 057 065 093 096 118 124 132 136 139 147 148
>       149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 210 211 212
>       213 216 218 219 222 224 228 234 235 236 237 238 240 242 245 246 248 255 256
>       257 258 260 262 264 266 274 277 280 281 295 296 298 299 300 302 303 304 307
> diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
> index c5ebbf6a17..92cae940c5 100644
> --- a/tests/qemu-iotests/297.out
> +++ b/tests/qemu-iotests/297.out
> @@ -1,5 +1,6 @@
>   QA output created by 297
>   Files to be checked:
> +  129
>     209
>     254
>     283
> 

-- 
Best regards,
Vladimir

