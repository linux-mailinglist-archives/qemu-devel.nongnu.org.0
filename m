Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE1323AE2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:56:20 +0100 (CET)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErq7-0008Bi-Uc
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErjO-00011x-NO; Wed, 24 Feb 2021 05:49:22 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:40269 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErjM-0008De-Bj; Wed, 24 Feb 2021 05:49:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQjJUghHZwyIFPWnH2yaCqnXb+rhCjY23k+2FHmDiQJwAF2Rvgf4iBp/JmZ2U8cnGbAUuJi2bCIyOVsqWNZCJ7JuFUEBuNmpuf7GqIgu+huO6tsIerCdvC/z3KMuzgeLs1RfNiHMV0gFN1Sw0sk05CbsVNlPohkVUikENJMqWsQUAF2w6zviS7Uf9WluLK2uy0yZTqy8KvdFfwpC8pfwot3NHKaBB5qz4KK/tGSt7MDqBM8QxSkGZUv9W9PvjVjhZxGS8FMzE6fpG/B9C0aWWNXq0QkBnAvHPQtMOS4Z65y/dW8G9+oIWJpWHbrsEJE4t0uhfi+AA1bMBPuMK3Lz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YwVpuT/WnuGt7v3FGYBg+kbB+lL9ssll9Gir32pGSw=;
 b=D0cirhPdal63h7yXNzrKTnQ0m79JIuy2f3EpiYG7i81ekX+cjEqOmzo5ayosbvhb7Mnr6ch0XGQt48y50sm36avwUA1YdDxXFlEAOCcePm+Qj3Fsd5ySIVIijZ19dyfK6JZx24Y+AhFhNqmJ9UvCSY4kU0ZmaLw/DTEZI/6Gpj7MXT6//Ddkd4jv8vGPcbnAGulEPKsgzNpbTIbhccC6hMtAQsFfFFdSviPnWd/MkYOmMSMZxopWqJwEQxov4siYQtJp0yxLCnAEXuJyUPxu3eDcmpf6fxHfSCmIjqqNK8e7eYkPT2E5XOZD2WDRt8GgmaP9XBfJ/8IMyKUASBgBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YwVpuT/WnuGt7v3FGYBg+kbB+lL9ssll9Gir32pGSw=;
 b=aKUlqg3GyskhTwLSb6DobGt5/e0SvVCx6dwsTBOjGtIULBwIjG39v84j819q8k2RAKxTTuG4WGHAPO4Kre46HhvtcDzDNzgdVLi/r+M8RLz0OEgPy2cDBDQjXy1kCCQe7BoRoIdpfz+y0XNRegEMpiElUy2Xy0DpavdXZb7VH8Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 10:49:16 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Wed, 24 Feb 2021
 10:49:16 +0000
Subject: Re: [PATCH v2 5/6] iotests.py: add unarchive_sample_image() helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-6-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <073b1e6d-38a2-3036-7c64-f04610d64eb5@openvz.org>
Date: Wed, 24 Feb 2021 13:49:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224104707.88430-6-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: HE1PR05CA0361.eurprd05.prod.outlook.com
 (2603:10a6:7:94::20) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 HE1PR05CA0361.eurprd05.prod.outlook.com (2603:10a6:7:94::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6839895f-6454-48e7-9d70-08d8d8b1d46e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533EAA49B7C9884571F0CB7B69F9@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KL01SlmM7gVk6Sq7cj+4H3IgpudHXusDQIAxWo+gdyw1NnH4GW1DsqarPMO74rsicYUBpmDawrBu4XqI+jgTHe6aM3OgSvj88mHZBA+KWySrl9DIt88RX160O7zarxtRG/3Yem3ImY4i/Lj7wzsJkQugIABJSQFypHMynNLdEXsOAxswooWQgMJ9+MTV8PMhs7f6tm9r/U/uvK1qYBeVD6LbsUV6qbwRFUlBIcwQA5Mw/XdVspsTK/u2shkITDmnb+45GarkAN6hs7X3TxCrk+uuOcUHAC8uwUTacNTrvunajIkwCwgPtTZJK6DHtNrjBSUTQw8kRohsazjsipmG40gAnnbdN5j7z0w9lploqpkD64O9v64YDK7TxXULj9T7IHwsDG4bAcL+a+teM9DT+lBmNy8iY2uhIWoSz5nW98ro1WFdu23p85iw1XMuAmZ9+CryjYlaMj8gLMXYrrnlxsM8gb+FhVua/tRFT5PU82/UrYtg4UJCFy0w0a+YdGv9eKluxU8UqxrqTCxO9hwKF21BbyvOi+s0WTIIOqr+D7HYH+GDN/aArB5dFLI0+Bc+ttCrnHtINYefRzKeIhlHcK77S9/tF4kiOjlJEwDe1C0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39840400004)(346002)(31686004)(6486002)(2906002)(8676002)(26005)(53546011)(83170400001)(8936002)(956004)(5660300002)(36756003)(66476007)(478600001)(2616005)(83380400001)(16576012)(186003)(66946007)(16526019)(316002)(52116002)(66556008)(42882007)(6666004)(31696002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjlkRmRtak0rb2crM05PeUE1d21EUk91Zm8zK1RPRGJwN29DL1pSZ1E4ZGlt?=
 =?utf-8?B?UnZTRDBWREpyZy9RYU5Rb3JneTZzVndyc0dPcEpRdU9aZnFGaDN6d3Y4Ullq?=
 =?utf-8?B?QkxTOFpCVFY1UitYYzBhUGhuOVlXR0I0bytpVkhqVHpqQjR2cWdvZnZ6Wmxn?=
 =?utf-8?B?TFJiL3ZGMUxDemh0WWFDbmtQTFJZVlp3NHc4aFlXdEtseCtwM0pucEZ3bVl4?=
 =?utf-8?B?MTNxVDhab2ZuOUVZc1U4M3dGTzlMN1lXaWN6R0MzdFdrMVBFQ0prTFoySEpI?=
 =?utf-8?B?d29oa0tMT09MUTZmdmRYa2hYTmhsMGVkYUhNVGtzMVBIcFY2TGVuV1d0SXFt?=
 =?utf-8?B?K0JxODREdklCQmE1eTBZZmZPdk4zS0oybHJHSmRCZnZTTU0wUXY3WEpjTXV2?=
 =?utf-8?B?S1dyOG56Q1FhakdoWWR5TU5rR0lGbHB2SC9HYVhDQ1pCdFpNaUZKN2dVVVlC?=
 =?utf-8?B?Q2RmampoeUZ2T1VKd3dzZ3ZFc2pjSmMzZlVZaEhCYjFOSWJ5QjZhMWt3S1pU?=
 =?utf-8?B?eWpjNzJiSG1XNUpEK3cycW1NN0dCbVpBTW5lTmNtcTFpWkowNUxiQmN3OStM?=
 =?utf-8?B?YlE4V0lid0ZIWGwwdmtDR3Y4czN5dFF6eHFlZUw0ZHJGVTRlOTZ1YkxlZ2tt?=
 =?utf-8?B?OE9DR0lTZWZDa1BhNjNNUE1TZVJ0V3BnbHE2aDVVbjl5OTBrejB2ZFREVmh2?=
 =?utf-8?B?WXk0MEtHeWRWNE1ISk8yMkRxMHJaWDVBSnNuS2ZLRVJkYTB1Q1VRWG9VN3lT?=
 =?utf-8?B?ZnZseUtrYzVkbGNQMjFMU2xaWGtWdFJReFV4T1piMlh1NmJGY0NNdmlzOWtV?=
 =?utf-8?B?bWVlRmd2Z2REb1NXRFEyK2laOHppN2xhWWYzbThPTWJjTndhNHZUNHQ5SHVQ?=
 =?utf-8?B?Y3NYME9BR0tZNWVLbkE0blRkMjIvMk5Id3VUeXl0bDFGaGRuQzhQU3VtaTVh?=
 =?utf-8?B?ODZ1dmtIUGxpSHZuYm5hdnp3bzM5bnk2T2ZlWW9XaTdZZjBYbUtkbk44OXc2?=
 =?utf-8?B?N3ZmTXNMYmE4NGRNVjJMV01TR0VTTGI4SjRBTjd5M0w0R1lUekc3Wlc3ZWFh?=
 =?utf-8?B?anIwWFdhemMvbnJLWTBiY0ZIT3FCeVRCSWxMaHZrVnpnNUFTcjl0Q0FWK1JE?=
 =?utf-8?B?d0Ivd3JDY0dlMEdFV3hXb2JwVERXMXIvZzBuVXB0d043RjdrbGZNSUlINWhi?=
 =?utf-8?B?M2hpMjVNV0I1VnFIcFNpbVVwSElGNm9rcDJEcHd4cDlEU25UOG1YNGYydWtr?=
 =?utf-8?B?Y1c4N1VDejJmYW5scWFmeEtpWVZBc0gwWUdSandDeEZNMWllVjZRZUlrclNI?=
 =?utf-8?B?VHp2YjlqSkRCTjF0c2FWMEtRcUtaTmN1Z0hMWjJGVDJCZ2FSVW9aYVByS0RU?=
 =?utf-8?B?TjNlUWN5TzR3TEs4VlJjV1pvUDJQQlRxL2tIVk9FUHRybEhtSG9BbE8rV0Z0?=
 =?utf-8?B?cEFzZGt5bk5tMUVjVlZQdDNqV3NVUGd2RFJRazNZcm5KUEMxVmZhejc2a2lX?=
 =?utf-8?B?Szg2dHBFU1p6aTNEbXFsZEVrYy9OTmprVFFvNWE5UWRadG9rVUJiUFlaVUJu?=
 =?utf-8?B?amdEVkJZbG9DMlI5NkpGR2JoU1BoMWVkaEtmUWZHNFJBZlRPRnpFdU9JL0Ur?=
 =?utf-8?B?K3djT3MreVBLMlB4OFAxVDNCZmNraTdLRWtnUEJ6bWx3RURJbXZJRXdUUERP?=
 =?utf-8?B?am5ORWNCbzBpemlkY20xVnhRTHE2T0Y3anFta2ZlUnBsazN1NEE3d21IN2hG?=
 =?utf-8?Q?DJHd5hgIdGgDQDsuki+/X4C65fSYClm/iBS5Bkc?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 6839895f-6454-48e7-9d70-08d8d8b1d46e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:49:15.9524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdQRvhtnHNS52FRqRocOYpe9pYzpn4ZEPwf949XazI611uLuoIWfUOY54Wn2GFfvlsB7XVjlHVK/ASURbnlh8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.6.116; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/iotests.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 4e758308f2..90d0b62523 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -17,6 +17,7 @@
>  #
>  
>  import atexit
> +import bz2
>  from collections import OrderedDict
>  import faulthandler
>  import io
> @@ -24,6 +25,7 @@
>  import logging
>  import os
>  import re
> +import shutil
>  import signal
>  import struct
>  import subprocess
> @@ -96,6 +98,14 @@
>                               os.environ.get('IMGKEYSECRET', '')
>  luks_default_key_secret_opt = 'key-secret=keysec0'
>  
> +sample_img_dir = os.environ['SAMPLE_IMG_DIR']
> +
> +
> +def unarchive_sample_image(sample, fname):
> +    sample_fname = os.path.join(sample_img_dir, sample + '.bz2')
> +    with bz2.open(sample_fname) as f_in, open(fname, 'wb') as f_out:
> +        shutil.copyfileobj(f_in, f_out)
> +
>  
>  def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
>                                connect_stderr: bool = True) -> Tuple[str, int]:
Reviewed-by: Denis V. Lunev <den@openvz.org>

