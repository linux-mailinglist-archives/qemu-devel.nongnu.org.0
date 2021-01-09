Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39D2EFEF0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 11:19:56 +0100 (CET)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyBLf-0003cN-Un
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 05:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBK1-0003AQ-Cf; Sat, 09 Jan 2021 05:18:13 -0500
Received: from mail-vi1eur05on2107.outbound.protection.outlook.com
 ([40.107.21.107]:28832 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBJy-0004eM-TW; Sat, 09 Jan 2021 05:18:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIWIkT+enxOIQyBwYKLOBSapGnTqiK4bEFZyj40TH9hBm2JEBEJzJXwl8YjgF4+2NDi+esKRoI0XuxKckVr8vPDeNNMrscJG8WaXFoAheo19GYrxsPobn2RQTOtRQn3+LuouyGHKv0PvUTTU5+fnCBd8rZd9md5PviywRxkSWuEDowAkqOUUg2tsAQCGBho/MgzNzZM9SKDB/nqc2/QlD7WImwxLV8A8Ly553PMq395DNbacgUwBy9U+2kjkEsX2sVSa20Xk2qypyXFD/3J6XQSZNCP087F0Fc8Yd98LoAzB0ZKc1JuXI6ncKYSFg+nEF8USvptEEd1d5eZJIslWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIfHTr/iEON0vK+2J3Rt07wV2fUkw10p218sGZwN7n0=;
 b=UUqKki0WwYPiAy7sOF8nZJdjUvUF1hZxEuu45j1CivGHlyKGkAKbpZEy4PkQ8gy5TtVK0WfnlHRF4nSucpDD3usyTuK9lLkpLShZt+OhH7M3CX2zLgNjA+ScKjWgiVk1xd4D0P9Lv5uUZOdLxqIvWRePJhqt1wASLOybH7RKKC5XYWTQ5wL+0A+Wp5AiZkIww+qkIbd/kZxV4Z9C2gjYtq4z1pAy8NHMAMl7QoMSKtvQW98D/8G7ec88VRPxYX+XmwdHY3ULlVIcKd7K5FqfWhjGzP9ti4iG56ai1iNLIKVX+3Ydb7ndmA+rQYFYpk9SdGX9OpD+LW2kM7hrjJtC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIfHTr/iEON0vK+2J3Rt07wV2fUkw10p218sGZwN7n0=;
 b=Cb3pXBDELkANuqH3x2LvQOtYqnNl/XSM4JasJHwg01fIWz8zsDh4XUiAhcx+tNSQrVH9TbLUpzIDspvuSVdi38wJuqAvpJDgJZ60g28PB4ByUN8kXCpCFm5+5wREcJOPEUpmxu+5QKJlvVABo/0Ee/d3oXy1Un1WWUIqLISwa0o=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5255.eurprd08.prod.outlook.com (2603:10a6:20b:ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 10:18:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 10:18:07 +0000
Subject: Re: [PATCH v3 00/25] backup performance: block_status + async
To: qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9d60205c-a76c-7d72-4b39-ac75aadeb79d@virtuozzo.com>
Date: Sat, 9 Jan 2021 13:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201026171815.13233-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM0PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:208:ac::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Sat, 9 Jan 2021 10:18:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3336495-a83b-4fa7-fb1d-08d8b487dbc3
X-MS-TrafficTypeDiagnostic: AM6PR08MB5255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5255BA3FB0E737FF60CE248DC1AD0@AM6PR08MB5255.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILuHzArZC/nnte3p4/U04RVK8lTo0L/9RlXFNcqRSbZvjj4AH8nvNNiT8WaGes5fwAJrIUZlLpYLoR1GgPQwfgO16DRSsJxDIk/2vOvuOuO0BL76oDvkyI/3ppP0dkGUjHVurbKYxAAFmoWTMjETVycog4uFpagCpiIM8VBIrWHlBcHU5Ne0UDXyfZqiC9lhZnBK2CU1T0SPZ/S9l6iV6FASFLrRFXad7PKXrpM8gvoJujOUDEl7UOOMwWBy/1s/Xx5nmKV5AnIo0biw/scEc0cHVYGWlr6wt6B7neTafN/noIwhE//za3Tc22f6DnEG7Gc+S1IfN7R/ukWdNBMMoWQAA8i/rIFSZ5LzAzaUDex0i/8dAlJES7qMc1ih8FXFq7CobFmXqZfYaW8CnKCtzKH7mVnihYBFRi4w1fW9Wj7qLc5J9uBnDy6GO4myZ9J8aJWilR4ypp61EuamrntxA0NBkirJVuYnWuEnEh3fOew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(366004)(136003)(376002)(4326008)(26005)(6486002)(16526019)(16576012)(2616005)(316002)(956004)(52116002)(186003)(107886003)(8676002)(478600001)(5660300002)(2906002)(8936002)(83380400001)(31696002)(66556008)(66476007)(66946007)(31686004)(6916009)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0VhaG9ScjUwcElXZ1dEaXl5Y2ZwMVRlNTlKdFdYRjZZTkxnamdSS2FEVUt1?=
 =?utf-8?B?QnNudkpxaEtjWktoMTk5MmxjcXV5TUF1QjhjbGRVY2NldXZnUStYWWh2bHdY?=
 =?utf-8?B?UkhTVTZDNmp6b1lCNkRMaHhWR0ptZTJjWUVaRjBpSFQwOGJpZWJ1Ty9CcXZl?=
 =?utf-8?B?TXhwbWtkaURPMEx5Wi85THlQQXJEaTExZXd3cUFCWGlRNktMWkZiMFNQZFdm?=
 =?utf-8?B?cW92akFlNklGSU40UHFJM21yV0haNlVpelhobEdBY1VLUFZZZnh1ODJZUSs4?=
 =?utf-8?B?WUY5a2NBRmQ3aXFCMVNLekJJZHVHMTI2eXBDcWtzOXJmaXp6TjBGM0t3N05G?=
 =?utf-8?B?cWJoRi9NN2R5THE5ek1Uem5zZnRnNHRFNkZsNjBJajJiVHd1VzBiWm01dm53?=
 =?utf-8?B?OUp0all5TmlkNWc5dXErQjBqOUpYazFCMUtHUUtlYjVpQ2tyYmJlRkFGZTNr?=
 =?utf-8?B?S3hCUTVLSmxISmdKUi9HZXNFenlUOW9PVFNia1NLaFAvTFlOcjExTEZnUUpn?=
 =?utf-8?B?c0tBRWNpWlUxVFZSeGZERFAwT1h6eEd1c2RsZnNDaDRvMkhIcHV0NTBIZUti?=
 =?utf-8?B?TmZiY3Y2Ynh3ZVY0YWNNOEdwL3RjWGMzTnJxclJnQUs0bHhVTFpPTTdodVFa?=
 =?utf-8?B?VTMyK3pXNHdta1RSNUM2T1lxQlZ5R3ZjbmpyN2JDc0JCR0haM1RVSytzVm5s?=
 =?utf-8?B?K2RDZHEyc3VabHlmcG1McG03bzlwWGJLRzZWSTdZNlN4NHphREdEOW1FWnpH?=
 =?utf-8?B?aFZjRStoTmFDakVUUGNhMDVFQkdnSk1aVThsWldMRjdGKzlYYTc3MDh4NGln?=
 =?utf-8?B?d2dSTGNlRmdrM2xxcG8zR0tSK3hMUVA4Ynp4U29zNEdsUkxGVFpKWHdSSHdS?=
 =?utf-8?B?blhzKzBmcGlpTkVWbUltamQ1QjFwL05POXFOUVRmdVpiQ2xpN1ZwaWsvcHdu?=
 =?utf-8?B?MWFPS0VoZGR1d3J6Qng0ZmxybVE4RnlvcjVVMHNQR1VkNUt6RXM2a3dFUEk1?=
 =?utf-8?B?cVNaZFhMN3lZeWt2QlJjcVdiNitWZ0J1eitGdUlLVy9HMUVvcVVTSEVBREVi?=
 =?utf-8?B?ZjFUZWhzWVFkc1dPdzBScStaaTBvYytoTDArekJ2aVpiQTMvUGEweDhhQzFP?=
 =?utf-8?B?TW9rdmxaaWEyRk5lQ3RSQkRmTmlBckEwazdQc096MUppYVVvMmxNSEZFVE9U?=
 =?utf-8?B?NENDeDZDd2NMcmN4enpqQi9ZU2V0Z3BydFZkWVJNR2pzNjNWcXJoQUNVbHVH?=
 =?utf-8?B?ZTFJbktlTllSeFZkZnJ3UzhjVU12T3hNSlgzVGpOeG90dThtYUova1dNLzA4?=
 =?utf-8?Q?xtAIzbLnsGn+lRfA5jxURsdVt1tImYFGcm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 10:18:07.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d3336495-a83b-4fa7-fb1d-08d8b487dbc3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9KTvf5Ii55MocTzAGbEVsAEhlJCNMoTnEa9r3KjMb2zgrTsNGrVYMke+b8gRMeQoCUtkd3Z4OEHZ9ZjMNbCDIzr9Y4WYpCNqodQ/MJHu08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5255
Received-SPF: pass client-ip=40.107.21.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

26.10.2020 20:17, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> The series turn backup into series of block_copy_async calls, covering
> the whole disk, so we get block-status based paralallel async requests
> out of the box, which gives performance gain:
> 
> All results are in seconds
> 
> -----------------  -----------  -------------  --------------  ---------------------  --------------------------------  ------------------------------------
>                     A            B              C               D                      E                                 F
>                     mirror(old)  backup(old)    backup(old)     backup(new)            backup(new)                       backup(new)
>                                  copy-range=on  copy-range=off                         copy-range=on                     copy-range=on
>                                                                                                                          max-workers=1
> hdd-ext4:hdd-ext4  19           20             21 ± 14%        19                     51 ± 12%                          22 ± 24%
>                                    A+5%           A+12%  B+6%     A+3%  B-2%  C-8%       A+174%  B+161%  C+145%  D+165%    A+18%  B+12%  C+5%  D+14%  E-57%
> hdd-ext4:ssd-ext4  8.7          9.4 ± 3%       9.6 ± 2%        8.8                    24 ± 2%                           8.9
>                                    A+8%           A+10%  B+2%     A+1%  B-7%  C-9%       A+174%  B+155%  C+149%  D+173%    A+2%  B-5%  C-8%  D+1%  E-63%
> ssd-ext4:hdd-ext4  9            12 ± 9%        11 ± 7%         9.7 ± 7%               11 ± 2%                           10 ± 3%
>                                    A+36%          A+28%  B-6%     A+7%  B-21%  C-16%     A+21%  B-11%  C-5%  D+13%         A+16%  B-14%  C-9%  D+8%  E-4%
> ssd-ext4:ssd-ext4  4.4          11 ± 4%        10 ± 3%         4.7                    5.7                               10 ± 5%
>                                    A+143%         A+134%  B-4%    A+6%  B-56%  C-55%     A+30%  B-46%  C-45%  D+22%        A+133%  B-4%  C-1%  D+119%  E+79%
> hdd-xfs:hdd-xfs    19           20 ± 3%        20              20                     45 ± 4%                           19
>                                    A+3%           A+4%  B+1%      A+3%  B+0%  C-1%       A+131%  B+125%  C+122%  D+125%    A-1%  B-4%  C-4%  D-3%  E-57%
> hdd-xfs:ssd-xfs    9.1          9.9 ± 4%       9.5             9.1 ± 3%               23 ± 2%                           9.2
>                                    A+8%           A+4%  B-4%      A+0%  B-8%  C-4%       A+151%  B+132%  C+142%  D+151%    A+1%  B-7%  C-3%  D+1%  E-60%
> ssd-xfs:hdd-xfs    9.1          11 ± 9%        11              9.5 ± 4%               12 ± 22%                          11 ± 3%
>                                    A+16%          A+22%  B+6%     A+4%  B-10%  C-15%     A+32%  B+14%  C+8%  D+26%         A+18%  B+2%  C-4%  D+13%  E-10%
> ssd-xfs:ssd-xfs    4.1          8.7 ± 7%       9.2 ± 5%        4.5 ± 2%               5.7 ± 3%                          9.7 ± 5%
>                                    A+113%         A+126%  B+6%    A+11%  B-48%  C-51%    A+40%  B-34%  C-38%  D+27%        A+138%  B+12%  C+5%  D+115%  E+70%
> ssd-ext4:nbd       9.1 ± 2%     37             37 ± 2%         11                     11 ± 3%                           19 ± 2%
>                                    A+302%         A+304%  B+1%    A+18%  B-71%  C-71%    A+18%  B-71%  C-71%  D+0%         A+106%  B-49%  C-49%  D+74%  E+75%
> nbd:ssd-ext4       9            30 ± 3%        31              9                      9                                 17
>                                    A+237%         A+245%  B+2%    A+0%  B-70%  C-71%     A+0%  B-70%  C-71%  D+0%          A+93%  B-43%  C-44%  D+93%  E+93%
> -----------------  -----------  -------------  --------------  ---------------------  --------------------------------  ------------------------------------
> 
> Here column B is current backup and column D is new backup with
> default parameters.
> 
> Mirror is still faster, but we are very close to it.
> 
> v3:
> 01: add Max's r-b
> 02: change to perf.use-copy-range
> 03: add Max's r-b
> 04: - more explicit finish status of async block_copy
>      - block_copy_async always return non-NULL
>      - personal opaque for new cb
> 05: - new arguments added in this patch
>      - no default value for arguments in block_copy_async()
> 06: new
> 07: - caller does _kick() by hand
>      - grammar in commit msg
>      - add new parameter in _this_ patch
>      - switch to opposite ignore_ratelimit
> 08: cancel now is async
> 09,10: add Max's r-b
> 11: changed a lot
> 12: add timeout
> 14: rebase on x-perf, keep r-b
> 15: rebase on x-perf
> 16: rebase on x-perf, keep r-b
> 17,18: new
> 19: now only backup.c is changed in this patch, changed a lot
> 20,21: new
> 22: rebased, keep r-b
> 23: new, split from 24
> 24: drop unrelated change (now patch23), keep r-b
> 25: changed a lot, explicitly specify options for each env (test table column)
> 
> 
> To run benchmark do the following:
> 
> prepare images:
> In a directories, where you want to place source and target images,
> prepare images by:
> 
> for img in test-source test-target; do
>   ./qemu-img create -f raw $img 1000M;
>   ./qemu-img bench -c 1000 -d 1 -f raw -s 1M -w --pattern=0xff $img
> done
> 
> prepare similar image for nbd server, and start it somewhere by
> 
>   qemu-nbd --persistent --nocache -f raw IMAGE
> 
> Then, run benchmark, like this:
> ./bench-backup.py --env old:/work/src/qemu/up-backup-block-copy-master/build/qemu-system-x86_64,mirror old,copy-range=on old,copy-range=off new:../../build/qemu-system-x86_64 new,copy-range=on new,copy-range=on,max-workers=1 --dir hdd-ext4:/test-a hdd-xfs:/test-b ssd-ext4:/ssd ssd-xfs:/ssd-xfs --test $(for fs in ext4 xfs; do echo hdd-$fs:hdd-$fs hdd-$fs:ssd-$fs ssd-$fs:hdd-$fs ssd-$fs:ssd-$fs; done) --nbd 192.168.100.5 --test ssd-ext4:nbd nbd:ssd-ext4
> 
> (you may simply reduce number of directories/test-cases, use --help for
>   help)
> 
> Vladimir Sementsov-Ogievskiy (25):
>    iotests: 129 don't check backup "busy"
>    qapi: backup: add perf.use-copy-range parameter
>    block/block-copy: More explicit call_state
>    block/block-copy: implement block_copy_async
>    block/block-copy: add max_chunk and max_workers parameters
>    block/block-copy: add list of all call-states
>    block/block-copy: add ratelimit to block-copy
>    block/block-copy: add block_copy_cancel
>    blockjob: add set_speed to BlockJobDriver
>    job: call job_enter from job_user_pause
>    qapi: backup: add max-chunk and max-workers to x-perf struct
>    iotests: 56: prepare for backup over block-copy
>    iotests: 129: prepare for backup over block-copy
>    iotests: 185: prepare for backup over block-copy
>    iotests: 219: prepare for backup over block-copy
>    iotests: 257: prepare for backup over block-copy
>    block/block-copy: make progress_bytes_callback optional
>    block/backup: drop extra gotos from backup_run()
>    backup: move to block-copy
>    qapi: backup: disable copy_range by default
>    block/block-copy: drop unused block_copy_set_progress_callback()
>    block/block-copy: drop unused argument of block_copy()
>    simplebench/bench_block_job: use correct shebang line with python3
>    simplebench: bench_block_job: add cmd_options argument
>    simplebench: add bench-backup.py
> 
>   qapi/block-core.json                   |  26 ++-
>   block/backup-top.h                     |   1 +
>   include/block/block-copy.h             |  58 ++++-
>   include/block/block_int.h              |   3 +
>   include/block/blockjob_int.h           |   2 +
>   block/backup-top.c                     |   6 +-
>   block/backup.c                         | 233 ++++++++++++-------
>   block/block-copy.c                     | 227 +++++++++++++++---
>   block/replication.c                    |   2 +
>   blockdev.c                             |  14 ++
>   blockjob.c                             |   6 +
>   job.c                                  |   1 +
>   scripts/simplebench/bench-backup.py    | 165 +++++++++++++
>   scripts/simplebench/bench-example.py   |   2 +-
>   scripts/simplebench/bench_block_job.py |  13 +-
>   tests/qemu-iotests/056                 |   9 +-
>   tests/qemu-iotests/129                 |   3 +-
>   tests/qemu-iotests/185                 |   3 +-
>   tests/qemu-iotests/185.out             |   2 +-
>   tests/qemu-iotests/219                 |  13 +-
>   tests/qemu-iotests/257                 |   1 +
>   tests/qemu-iotests/257.out             | 306 ++++++++++++-------------
>   22 files changed, 798 insertions(+), 298 deletions(-)
>   create mode 100755 scripts/simplebench/bench-backup.py
> 


-- 
Best regards,
Vladimir

