Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF804938E6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:48:30 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8Vx-0001cE-HD
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1nA8K1-0007cl-69
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:36:09 -0500
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:62112 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1nA8Jw-0006LR-Ki
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:36:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gs4hayiwqNkt3tZw1oA3K4HADEoP9igqePuhaprknQs9Nls73CKR21xii0jall1zWOuuMC5ex48+qGZa4BbB/thmns0EIi9cpb/TNYdk8D7MnE8MLS+FNBEvUMQU2UM5s+FHClhw0pMnjUqe0rx1rExjpRo0Qk1ty/lmEEM2zT9nsFfePdwpsxDelQk1NK57P502w4ybeUfq+3SiHrHv0DjdCVePzIY3x5NFIaSBhAcb2nibTGalnCOvlAdZ7HgO40JCfvF7VZe7m8kKAtcX3EJGUmsJU2gZFX5gDPxuVLP4eH6pS4hsm/v69jRyGuDmG7vi6lnIp1R1iR6xiuXyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkAUpnoZJdvBBrl9uBtWgYVZ6414Y+rYnk+6e+voKZ8=;
 b=Lc7jCUez1lpjiWfF9rkf7e1NyAyx0WFnTGiXGIAFwqMV4PGpPYQMO+JqJ30AnVnSqCZTf8YdoC0c8TWaJo+ZgFGU7cyEZ1DRXQ9z7hOEG/P4/yX01oKdPHummvnkbwgpkvZ8lViMQ4MkOYeYUDM/TasENCmEpbxV/v/+IMtdShFVwZPHy8Huk+LpmB8ZAOiCBhHXwAOXJOqsJPiXkPFHZ/TplWmKvCu8Q1WYLw2TRMYe6ZNeoFEQupd/EWmFGGekfpFvPOEVW/vXbfmd8rbVJnnX03vD4Cu81ur+YltNWcqF7/2SU3sarGwQ6w+nlb/+LHmvGsTWxJbIz3tu67mCwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkAUpnoZJdvBBrl9uBtWgYVZ6414Y+rYnk+6e+voKZ8=;
 b=QyMSFUVuatQLihgraUhXTrKLKHR75Dl9x3NUuEO6g6kcONzCQyMSspUBCOcndS478p1eCMBEWNCHjMQJe0Igx8e5Sy2pPLIBrCnQ2cXuDcXjQLQv3VI5kqMyQi30brzkzebBOeJXtBdUWcBhyXPENy4Z2U40uBmVnliS4+/4+xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openvz.org;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 09:41:13 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::e91a:fecc:6071:63c1]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::e91a:fecc:6071:63c1%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 09:41:13 +0000
Subject: Re: [PATCH] drop libxml2 checks since libxml is not actually used
 (for parallels)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
 <YefbTt14JoVim2if@redhat.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org>
Date: Wed, 19 Jan 2022 12:41:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YefbTt14JoVim2if@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: GV3P280CA0081.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::21) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f54901f-72a5-4504-8d6c-08d9db2fd512
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5868845206DD4F8870CEF130B6599@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBOn0m1ZQZYPuhe3yU5fTmABOof1etcS2nUM+cNj/e28Tyj2ihC4gpmVnT55gCjrSihsTd7WyG0RmdeP7hZSy5ZROcxnzbqNH24xTulpu+yA3aTwHqz2PG5iXwzVLdqx2y8F3D09JWHNxCVPaKLm2kzvpCMqWWeUVEEFb5T/BJx107Rty6UGxuVlDm/IyaEI4tgcF57jfueySPUpbXJTj1uUDLr3m4pMVBlr9PKjByY2xly5yeTZeglvInpc7r7lMstQNEXg49fv2Ckm+5YEKqahdaYYUiMSUmpkna9qt78xwLsfQSSTnutF1osklv6FZtgZxmuySTVCxg2ku77RTtW9EPH/Rk5xTDquWf1yv07QKWN63AyEcUrTl8tMGT9y1B5Ypb3cnT522Suy1k95XcA6zuWErEmkO3LNWXbVxmvBPTvuM+m5AiyFNSD9VHKHcd0SkVuMeNoZsooHPFTO0g9gnldrrCKGATeW0NA9iqZyeXNxZGOtvOTMa9q4s2XAsqHlo23ZqXn28eSoFvNpzGu5U2KXkYpi30ZlwuXeK8IshrdIT8FXNyBT/9TgYRnJVf249HqjApQPbrEE/q3aOvy4VEmn+MbXkTqiioHywMjVFCoAnIBK2zqIj2Z+wohF/8tV80d8QHWKJjGRbosCEk+xl0Z55yCvmDoP7yoZNmnbVwz43kImlx2X16S34JXyVC3yN7DmEdjQSA3gCWMEGR01+pVOHXBKVCD+c51NWrPMOohvRS5QwKF8CC8w0t0Ifeme63tzCrSDIQyoa0OhJOfePust0++XqAZy3m/QxkKDTXUmH+0lLIS4vrTVe15FTW7EG0vsirgpSjCUbS9eilUcu6ZW0iUWZyepUNphP/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(52116002)(508600001)(966005)(6506007)(53546011)(83380400001)(38100700002)(42882007)(6512007)(31696002)(54906003)(110136005)(316002)(66946007)(8676002)(66476007)(2616005)(6486002)(66556008)(186003)(26005)(83170400001)(4326008)(8936002)(38350700002)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05GT0JtcFltNElReHY4MHpUNyt5YnVCQk02aVBNWlVIblBBaWwvc1k2MjQ1?=
 =?utf-8?B?ZTNKdDRBYWEwWUlvanNYSFBCaXI3UFJCeVRpZlNhZ1Z0N0xKNEFxUlo5dUFG?=
 =?utf-8?B?eEp0Vkc3VDFTWVliblZUbUU4U09tZno3NUJtV25BeDJaUUYxTXI0WVkwdGpG?=
 =?utf-8?B?eXFSSWFyL09WMk5pQTRKVThoeFpqVnhnZ0VkNkRmNWMxMktSK0NQU0VKRDVN?=
 =?utf-8?B?QzVGOGVnR2V4KzJjeExTQ2xjRk94QWxyYXVQQ0VXbEl0KzFIb3BkNWlQVjNJ?=
 =?utf-8?B?dC9kVFpMc1Q0WmhZVVNIcmpkWlk2K0hkMjd5dzZ5RENqWjR1SGpickNVNWpq?=
 =?utf-8?B?Q2YrYUJrMGNlMFpzcE92ck5vYjl6d0JrSlpuZ01hQ1g5QXdjWU5rblFpYmxG?=
 =?utf-8?B?RmpGOHhYRXpJTU5LYlFOMEpPaU5ycnRudUo3U0NIc05OOW9mZ0dGQ04yUmg2?=
 =?utf-8?B?TXRuQlZYSUcrMVppMGlydzVhRGMyUkFMaXlLVVY3NGlhSE0wdFlsaTVqclNw?=
 =?utf-8?B?YjhYZHV4VlI5N24zd1dKT0FwUlQ4SytMMDZQRzBQRjBwSWg0Y0xwN05iS0NI?=
 =?utf-8?B?V09TUGk3TVpDMFR3MDlneXl4Y0VQN2ZBMEtoZTM4UVIvbEFDT0puQmw0dkdh?=
 =?utf-8?B?UHJzSkZET3MvK2hTeVhQaGNMTXd2T2F0dTBlajM4OHhGV1NDYWN0V3RicDU0?=
 =?utf-8?B?eTNTaFczZ1RRMVo1S1Fnby9PVFp6MTlzN29VMkRDZ3g2TUhjRlBGUmdLNkt3?=
 =?utf-8?B?YldwMEtKaDg1T0lBZnVML1ZxeU1Ic25ISVBnMzZOWHFRS0ZGQlY1WWUwb2Qv?=
 =?utf-8?B?SHYvbDRXbUtzM3A4NjZOYzQvQmJwUG1KVkVlNHdlVWY4aXIzN0l3NlVPZnRB?=
 =?utf-8?B?bUhCOFFyRGJ1SGFIS3NWSGErR0FFOHJjZm4rbXNrb2U3T2tMbDI4UXZ1dEdE?=
 =?utf-8?B?a0xnK2pCdkhlOXhpcVZEMWhlVDl2SkorcVQvKzhCeFgrdUxtTWRMenc1Y0Vp?=
 =?utf-8?B?akJSRnpYcVV3T2FUUzYrNDFtWVRoSUhnNitZaFBLT2R0cDVEajRNWDR0enpR?=
 =?utf-8?B?ZXoxcytuYXd6ZjlUM0pPcWZXazJXNGF5MU9wQVJqTFBQbzRYdHpPYWxlL1ov?=
 =?utf-8?B?ajFTTGNwTWlFSlhHOUN0MGRldHJHbk5YT2M3bkdmWU1ndzhCN2JINmQxRDBB?=
 =?utf-8?B?QnlqRWdwWFZNUy9MMVBLNzdhRFVzL3E5VHY0VmFvYkZOL0kxM0tXZ1h4dVdj?=
 =?utf-8?B?V2E0M1pSWUZvNWlIQlk1bFV2ek1LZHFFaTFpWHgxMmJ4dk11UmJwcXBtb0pO?=
 =?utf-8?B?K2hJZ2lFS05UWkpmWXpEWkxmRk4vanoyRFlGd1JwdXJSN2VxdlEzcGVNWXJo?=
 =?utf-8?B?K0FLTmZRNTJFRkJ5SEw3dXk2RkFkNVkyNldLUjVqclQ4SkdwUE1vK0xsZjNI?=
 =?utf-8?B?VG82eXYwQ0V0U2twRVpzN0YrSDhKM1UzVW5pTkQyNEUva2dldXdnbVI3b2py?=
 =?utf-8?B?TXZWSWI1TU9zMXZtVVQwc0JIM201TTZSWEQwZCtxVmF4R3BJc1NES1pYVnlF?=
 =?utf-8?B?S2grUW90OTR4V0gxVDlNanNZR3M4N3MzMUhZVS9uQitGRld6bW9BRWpNSDln?=
 =?utf-8?B?MjU2ODdxazdoeWV0d1VoVVhkT2kzMHZhcDF4WDhEOU53WHAxejJwZDRnTmFF?=
 =?utf-8?B?R3JHK1J4UkpsT0hjSEVzbW16UkhQOVRnV3NBdFRubDdNcWw0N3BZdCtscUdQ?=
 =?utf-8?B?S25qZzZqUStQdWJKdzZaUXpoaEo5elY3VEllellUNU1ubkdZZnhTMENsdmFa?=
 =?utf-8?B?dUZ4WWJYb2dXU3dxK2pQT0xOMHdveHVrRWFHQ2tzT3htNExPT2Zwa1VKRm5n?=
 =?utf-8?B?b0szTVppU3hnV210M3ZhNTY4VGo1c1BSekVlMXlPRC9YMk1YWW14TjVYZ25M?=
 =?utf-8?B?NFFwczJ2a083bUdsaHJ5SWFkUnR2OFk3bEJBaW1SUVpHVWUwNEk5S09PT2tX?=
 =?utf-8?B?SHRBNFpKWmdJK0cyVktNTEJyWFZ0Vm4rUGw0UW9XeFZheFVjTytuTHpBRlJ3?=
 =?utf-8?B?eUFURjlTMStZc2RNWndLNTI4YjRDTW8vK2hVaWtkWXhkdzVweTExcmpHWGRI?=
 =?utf-8?B?c25kZGp5RndFS2doM1g2SThPTWllaG9BcEVkWWhjVTlBQVMwSVU5K0tvL08z?=
 =?utf-8?Q?iSSxu8+jpSW04SP0TTK3Aw0=3D?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54901f-72a5-4504-8d6c-08d9db2fd512
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 09:41:13.7312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP3nV1TvP0YAYKryfvlWgzethZzG9tJC83A22ICh5tFF17X+UAjnLsq02yWXOAwJ+aMFHa9bV+Mlp1Pp4EJpYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Received-SPF: pass client-ip=40.107.20.133; envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 12:35 PM, Daniel P. Berrangé wrote:
> Copying the maintainers for block/parallels.c
>
> On Wed, Jan 19, 2022 at 12:04:23PM +0300, Michael Tokarev wrote:
>> [This is a trivial patch, but due to the number of files it touches
>> I'm not using qemu-trivial@ route.]
>>
>> For a long time, we assumed that libxml2 is neecessary for parallels
>> block format support (block/parallels*). However, this format actually
>> does not use libxml. Since this is the only user of libxml2 in while
>> qemu tree, we can drop all libxml2 checks and dependencies too.
>>
>> It is even more: --enable-parallels configure option was the only
>> option which was silently ignored when it's (fake) dependency
>> (libxml2) isn't installed.
> This option was added in this PULL request;
>
>   commit 25bfd5a75fa3e8f5796656c7634e26193f7bedc1 (HEAD)
>   Merge: 238e2d93c9 bcbb3866da
>   Author: Peter Maydell <peter.maydell@linaro.org>
>   Date:   Wed Jan 24 15:28:36 2018 +0000
>
>     Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging
>     
>     Pull request
>     
>     v2:
>      * Drop merge failure from a previous pull request that broke virtio-blk on ARM
>        guests
>      * Add Parallels XML patch series
>        
>     * remotes/stefanha/tags/block-pull-request:
>       block/parallels: add backing support to readv/writev
>       block/parallels: replace some magic numbers
>       block/parallels: move some structures into header
>       configure: add dependency
>       docs/interop/prl-xml: description of Parallels Disk format
>       block: add block_set_io_throttle virtio-blk-pci QMP example
>     
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> If i look back at the mailing list archives I find
>
>  v1: https://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg03440.html
>  v2: https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg01870.html
>  v3: https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg02443.html
>
> which says
>
> [quote]
>    This series contains very basic
>    description of this XML files and makes preparations for actual
>    implementation to be followed.
> [/quote]
>
> but obviously the actual implementation never merged. I'm not sure
> if it was even posted, I didn't see anything in the mail archives
> forthe next couple of months, but didn't look beyond that.
>
> Denis: can you explain the status of XML support for the parallels
> block driver. Is this something you are carrying out of tree, or
> has the need for it gone away entirely ? Is there any reason why
> QEMU should keep this logic for probing for libxml2 for parallels ?
>
>>  .cirrus.yml                                     | 1 -
>>  .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-
>>  .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-
>>  .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-
>>  .gitlab-ci.d/windows.yml                        | 2 --
>>  block/meson.build                               | 3 +--
>>  meson.build                                     | 6 ------
>>  meson_options.txt                               | 2 --
>>  scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
>>  scripts/coverity-scan/coverity-scan.docker      | 1 -
>>  scripts/coverity-scan/run-coverity-scan         | 2 +-
>>  tests/docker/dockerfiles/alpine.docker          | 1 -
>>  tests/docker/dockerfiles/centos8.docker         | 1 -
>>  tests/docker/dockerfiles/fedora.docker          | 1 -
>>  tests/docker/dockerfiles/opensuse-leap.docker   | 1 -
>>  tests/docker/dockerfiles/ubuntu1804.docker      | 1 -
>>  tests/docker/dockerfiles/ubuntu2004.docker      | 1 -
>>  17 files changed, 5 insertions(+), 25 deletions(-)
> Note, this will conflict with pending PULL request that
> changes most of those dockerfiles and cirrus CI configs
> to be auto-generated
>
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02585.html
>
>
> Regards,
> Daniel
I think we can drop this. If that will be needed again - we will simply add.

Den

