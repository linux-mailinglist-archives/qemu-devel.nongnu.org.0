Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD24142E0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:49:03 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSx02-0002CV-Ed
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwyE-0000pl-L2; Wed, 22 Sep 2021 03:47:14 -0400
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:25441 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSwy8-0003tG-VW; Wed, 22 Sep 2021 03:47:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmio0SFLgqgFEp2L3swvX3OC+xRjbXzXSYWJuFut7MyXHjwpFubTDZ3ByPg1rnzZNbrJRjKvEEYozWaNe6ujNA2g1u/FCWl+bKlrmXz/qew0gKM2MEjW8u0HL2WBl7q/3Guwz8GFgP80jaQIwsdjxclLBdgNxz1o4lU+fSt5KEiOSdna6U4txVd1GLKcc1I5lx4AMf0c1t98Dmfo3HiWoZzyeVKQcVFUs0EZPgtU2WAeYRWeGclWx4FDWCCorsmDCkDWFnRxXz43PwxrEo2IoUzgCik1LjmxztqEqq5YWkP8NaqO6eq2KRe8z8JDs15f8Wt8WoDCNB+Cv+MKDm4m9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=sYSOz2sQUODkL4/HOoLefnbN9aLm935KSYZfRLM9WCA=;
 b=egUzOrlOGGfu2tIlYDORGAkU4UgWb74nCgQ3ORZM6wti0VnvhMtbAr/T4hfkz+MbugPce3vogu5bcjDzqwFp1H0+9NfQ7BReWEqX2OWIjaWwqKegD/rwXwePPvG9aiARLi0acn+bjZxJa2Q84efN6CD1FTfQGWz3wJkyRcxx+nuR5KtcIwmg66vGW+ap0VRLAa+qm2EenXu+gK8n2EBRnZk11MCM/mQIao2zqojW2dJvpr1QwNzuT88Z7xKQ8wGfWurFpIkHIvwsemZHouiyzo6fq8i5yy0+vrFJINsYDSXmiX7e6tcw7No5WSGZOitNxGK+/uP07C/RHB1kyfwwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYSOz2sQUODkL4/HOoLefnbN9aLm935KSYZfRLM9WCA=;
 b=ic5WbipQnAu0HN7dBHfdplIjhEBwG/TW86MEM/4nPkr4v66AknxO9HtLPoq7RGA9VxB63dnes+GUfnpsfwkFchs7GODnM4uNLyCM+vcHI3v0VpHW6G69EBgBu4NDuMamLS4MrAUgH+GggSDVfLl4DiuovQcfUfaCx3FAT3jeF18=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 07:47:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 07:47:00 +0000
Subject: Re: [PATCH v2] iotests/check: move long options to double dash
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 willianr@redhat.com, wainersm@redhat.com, thuth@redhat.com, f4bug@amsat.org,
 alex.bennee@linaro.org, pbonzini@redhat.com, eesposit@redhat.com,
 eblake@redhat.com
References: <20210903120039.41418-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <856208b1-cfce-fb99-5a04-f15e277b6cf4@virtuozzo.com>
Date: Wed, 22 Sep 2021 10:46:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210903120039.41418-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0033.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P189CA0033.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 07:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0857bd6f-08df-4a51-f88c-08d97d9d291f
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-Microsoft-Antispam-PRVS: <AM7PR08MB54478373ACF57747515AB79CC1A29@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZu/tBF7/AV0Y4CssejDbIDlkNov9GocjkYvXBHVQkHt8LIaIRBA2VDp23maj94vdxL94qPpZ5jwgV9KvBE+1WehF/KkjaaKr/V+rxoou4HEf2T9yMkBm3Wd5O/2NB7LQax7nAb3L+PyFHi5kMMuKpmQj/kb6lKJ0TDnGqx+d0akuHXHo4oB18U+kVFWBnHzuNlIC6lSpzUUAUhXqKHDsMt/UgtegVo193DTDzS00US4a838E5uwY4NzP8wiMG+sjlRa8auOoVwr66swgPCyjlVjcy7JE4rKe/g8FFHc+AIB4BEHNcd230Z0twZpr4nH0ga8rKi7lS9JCYUqCQ71ZqzF90YsVy6hKLCFt1eF2ltZ7uUkrAFZU0C/SG+WQLW6J8FV6BQwiHhGVg43MNstXX47HOX6by7pgMYEv+vr/tuYmlTsq6tTGFWf/OyWeWCbgf603znpG8ioeD78BkIK/IAQd/0Lo8V3nQnSIDlDWCrDgJY/YKsQDnHhUU5B3TY2pDlN7KXeKtD93xN5BcCD+ugF3bgpzplWCJnd1lXxFZMHeRRQku44lETI14zDm6qQB3mZ3P6IiXjSpILy+ArTk1PuLWnkGcxEfFlovzDfBPU2ZtzCi+e/NqxZOjRd3wZC2uiKiuemliTXFYARkA1jWui6/pHRusSqe+cphX7ZfHKH7h1meusUm1caOZ+C5xzT9cPmvmDWefsxlKvepyUxTonjR+YAmMI+Plw9r7t1iUt93o/D0o8+gigvZIwJaCjGMrn9MWqZzuincXlDuaLxPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66556008)(16576012)(31686004)(36756003)(5660300002)(26005)(83380400001)(186003)(508600001)(7416002)(66476007)(8676002)(31696002)(86362001)(66946007)(6486002)(4326008)(956004)(38100700002)(38350700002)(52116002)(8936002)(2906002)(2616005)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNmaEZ1RjJ0bDRTTldMNUs0aFVBZlNTVGNvSklwcVpJWXNqSXBqSW1iOTNT?=
 =?utf-8?B?UEE1ZG5zdUVyY3I0cURpZE00czE4dVY3Yi80RGNtU0VVd2dPYUhobjFyZ2t5?=
 =?utf-8?B?ZUpOTUwreFkrelM0bkoxK1hNSVdvK2JpWmVvS2w1SG8xeWpGNS82MFZsTHR5?=
 =?utf-8?B?eFBZTFBtNlMvdXo4TjJlTU9RSXVrSnNtbnZvV0dZcnEreWd2TElVZi9FUFpO?=
 =?utf-8?B?VWgyaitaM3hkbGF0RTVGS2hHbVNScHU5TlVRZ3pRUkdwSXdXeEtwUG1haTF3?=
 =?utf-8?B?endrSGdKZEllZ3ZpUTlVOFluWGJNL3hRQXpldVM4ckdHODR4TmlQaTY0Skwv?=
 =?utf-8?B?TlZ4N0JEWEx5cTgwSjBMZHVMRTdzOGJVYXZVTVJYVnB2bmdQek85Q3diNFFz?=
 =?utf-8?B?djMrQmpmY2pHa2c0V3M2TEpibjI1QzduWkVibkZuQ3JiWmcvZCs0L2pmKzRH?=
 =?utf-8?B?aGxIQXpTMEh5Ym9waXVERFhpb2d0NmJtcmJBcURmRVkwaFVrRWpWN0M4Rldy?=
 =?utf-8?B?Nlh6a01ieU9zdUp1ak05cGs1S0E5V3ZsUzRPZ3JYS2ptOElsV0V5L1RaRi9p?=
 =?utf-8?B?elBLUkJUODJjUVRmTGU0WUZwY3ZhcC9zaUw2bWtjU0lKV0xNVGVlZmxjOGk4?=
 =?utf-8?B?M3FYZDNUamFIZ3lqR1Y2cWl5ZEZDNmZpNUduQjBvRk03cXZFSTNYVE9qUHhv?=
 =?utf-8?B?L2t1cjJ0NWtFcEZDVWhpM1NOeXRFN3RKcDNnb2oxOW5taGl3T3Bwb2lEMTJE?=
 =?utf-8?B?UGVURSs0SzZDaU5aaGxNVEprQlJtY0NXQlB5QUtrUjNxdTFBZStocTBJbHp5?=
 =?utf-8?B?azlHVmdudENEbElKL2ZyN0diMXFKZGs3bkNCVkxibkI0aFlUUkRXeFdHMFBQ?=
 =?utf-8?B?azJWRXRwNEdlOHhpU1JLU2JRb3ZrSEF4U0VaalczbEJmWVUyM3N5Q0F2TTJs?=
 =?utf-8?B?WEpMcllRc1B2VDhOTkhJU002am5sY01VbXIzTnJLWTVjWWx4b0VqeWV5SFZO?=
 =?utf-8?B?d1NrbkRSWmNNelQyazRUTEZMcnBlQlN0Zk5kMm9BL01QK210SmQ4U1JjVlRB?=
 =?utf-8?B?U0I3TG9hUktxSUZSKzN6RnZOeStrU1JvMDhZSGdEbkRyc1BRK200S2ZQTXN5?=
 =?utf-8?B?Y1ZHWWxaeEdXMCtKQTZtRnRDU04xWEsrYUtxVnBCOVJJQVF0dm5hUkhGOHZy?=
 =?utf-8?B?ck0xR1lhRTlkajZTcjRkZU5jYWo3Qkk4Mi9rR0RVYUNXcDRVTVUwbnBKYzZn?=
 =?utf-8?B?TUU0cTVTNkVMYjIvajdrdGNrSVh4QWNyUUhQU1RCRElucUNYTno1U0QxRWRp?=
 =?utf-8?B?NitHNzVXTnFxalErK3V1aHYzYUhpZ3gzc2dreHVYWlB3TG9SVWYxMUdndXFu?=
 =?utf-8?B?TlNHZnBjNkQ2TFJJVWdNUEE1SHFLNlBMbXBud0h0ek03Mnd6Mk1vTU0xMm13?=
 =?utf-8?B?SkZuQUk1UXZpc0NBSUUweng0Uk01NDUvSkpBWFZHS0Ezam9SU1RQNGR6NW0z?=
 =?utf-8?B?bW1WeFRNdWRLK1BtbkZna1FPOGc1VVpDYlRBOS9Id01zcWd0ektWNHNWTDlQ?=
 =?utf-8?B?bmpHakY5clRwdytGV3lucURVR24zeWtpVjJkOXRYWFNPSzBLd1RuNHh2NWNW?=
 =?utf-8?B?cEJRV2dvekh4OEtJczFILzNUeTRnQVFsTjVWanVuUHNnb0JvdkwrSVJLc1ZN?=
 =?utf-8?B?ZEVEcFJScG9LMU9aTkxOTVdGYzZEOEs3OVNRaDZDZlcwUkREa0NjZVB4M3hG?=
 =?utf-8?Q?MENEgmNy/SbeDIUGdTagkSVG2kLSZJsItS2AysZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0857bd6f-08df-4a51-f88c-08d97d9d291f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 07:47:00.4766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRG0+wFp3BxMe1AdZ3VrTZUjDwOLqfp3hlPBy7gEQufSMELDL97KpeGDnm82dRDHcwgRuIHm9mbzc6l4+YtWonQzx2YCBfFtD+1SW6d5fww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.20.131;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

Patch is reviewed)

03.09.2021 15:00, Vladimir Sementsov-Ogievskiy wrote:
> So, the change:
> 
>    -makecheck -> --makecheck
>    -gdb       -> --gdb
>    -valgrind  -> --valgrind
>    -misalign  -> --misalign
>    -nocache   -> --nocache
>    -qcow2 (and other formats) -> --qcow2
>    -file (and other protocols) -> --file
> 
> Motivation:
> 
> 1. check scripts uses ArgumentParser to parse options, which supports
>     combining of short options. So using one dash for long options is a
>     bit ambiguous.
> 
> 2. Several long options are already have double dash:
>    --dry-run, --color, --groups, --exclude-groups, --start-from
> 
> 3. -misalign is used to add --misalign option (two dashes) to qemu-io
> 
> 4. qemu-io and qemu-nbd has --nocache option (two dashes)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> v2: cover more things, update also format and protocol options
> 
>   docs/devel/testing.rst       | 12 ++++++------
>   .gitlab-ci.d/buildtest.yml   |  4 ++--
>   tests/check-block.sh         |  2 +-
>   tests/qemu-iotests/README    |  7 ++++---
>   tests/qemu-iotests/check     | 14 +++++++-------
>   tests/qemu-iotests/common.rc |  4 ++--
>   6 files changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4a0abbf23d..907b18a600 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -153,16 +153,16 @@ with arguments:
>   .. code::
>   
>     # test with qcow2 format
> -  ./check -qcow2
> +  ./check --qcow2
>     # or test a different protocol
> -  ./check -nbd
> +  ./check --nbd
>   
>   It's also possible to list test numbers explicitly:
>   
>   .. code::
>   
>     # run selected cases with qcow2 format
> -  ./check -qcow2 001 030 153
> +  ./check --qcow2 001 030 153
>   
>   Cache mode can be selected with the "-c" option, which may help reveal bugs
>   that are specific to certain cache mode.
> @@ -229,7 +229,7 @@ Debugging a test case
>   The following options to the ``check`` script can be useful when debugging
>   a failing test:
>   
> -* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
> +* ``--gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
>     connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
>     address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
>     environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
> @@ -237,10 +237,10 @@ a failing test:
>     It is possible to connect to it for example with
>     ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
>     ``gdbserver`` listens on.
> -  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
> +  If the ``--gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
>     regardless of whether it is set or not.
>   
> -* ``-valgrind`` attaches a valgrind instance to QEMU. If it detects
> +* ``--valgrind`` attaches a valgrind instance to QEMU. If it detects
>     warnings, it will print and save the log in
>     ``$TEST_DIR/<valgrind_pid>.valgrind``.
>     The final command line will be ``valgrind --log-file=$TEST_DIR/
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index e74998efb9..139c27554d 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -303,10 +303,10 @@ build-tcg-disabled:
>       - make check-unit
>       - make check-qapi-schema
>       - cd tests/qemu-iotests/
> -    - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
> +    - ./check --raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
>               052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
>               170 171 183 184 192 194 208 221 226 227 236 253 277 image-fleecing
> -    - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
> +    - ./check --qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
>               124 132 139 142 144 145 151 152 155 157 165 194 196 200 202
>               208 209 216 218 227 234 246 247 248 250 254 255 257 258
>               260 261 262 263 264 270 272 273 277 279 image-fleecing
> diff --git a/tests/check-block.sh b/tests/check-block.sh
> index f86cb863de..cff1263c0b 100755
> --- a/tests/check-block.sh
> +++ b/tests/check-block.sh
> @@ -77,7 +77,7 @@ export PYTHONUTF8=1
>   
>   ret=0
>   for fmt in $format_list ; do
> -    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
> +    ${PYTHON} ./check --makecheck --$fmt $group || ret=1
>   done
>   
>   exit $ret
> diff --git a/tests/qemu-iotests/README b/tests/qemu-iotests/README
> index 6079b401ae..8e1f3e19c3 100644
> --- a/tests/qemu-iotests/README
> +++ b/tests/qemu-iotests/README
> @@ -10,9 +10,10 @@ but no actual block drivers like ide, scsi or virtio.
>   
>   * Usage
>   
> -Just run ./check to run all tests for the raw image format, or ./check
> --qcow2 to test the qcow2 image format.  The output of ./check -h explains
> -additional options to test further image formats or I/O methods.
> +Just run ./check to run all tests for the raw image format,
> +or ./check --qcow2 to test the qcow2 image format.  The output of
> +./check -h explains additional options to test further image formats
> +or I/O methods.
>   
>   * Feedback and patches
>   
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index da1bfb839e..5ca9f31950 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -32,20 +32,20 @@ def make_argparser() -> argparse.ArgumentParser:
>   
>       p.add_argument('-n', '--dry-run', action='store_true',
>                      help='show me, do not run tests')
> -    p.add_argument('-makecheck', action='store_true',
> +    p.add_argument('--makecheck', action='store_true',
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
>       p.add_argument('-p', dest='print', action='store_true',
>                   help='redirects qemu\'s stdout and stderr to the test output')
> -    p.add_argument('-gdb', action='store_true',
> +    p.add_argument('--gdb', action='store_true',
>                      help="start gdbserver with $GDB_OPTIONS options \
>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
> -    p.add_argument('-valgrind', action='store_true',
> +    p.add_argument('--valgrind', action='store_true',
>                       help='use valgrind, sets VALGRIND_QEMU environment '
>                       'variable')
>   
> -    p.add_argument('-misalign', action='store_true',
> +    p.add_argument('--misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>                      default='auto', help="use terminal colors. The default "
> @@ -55,7 +55,7 @@ def make_argparser() -> argparse.ArgumentParser:
>       mg = g_env.add_mutually_exclusive_group()
>       # We don't set default for cachemode, as we need to distinguish default
>       # from user input later.
> -    mg.add_argument('-nocache', dest='cachemode', action='store_const',
> +    mg.add_argument('--nocache', dest='cachemode', action='store_const',
>                       const='none', help='set cache mode "none" (O_DIRECT), '
>                       'sets CACHEMODE environment variable')
>       mg.add_argument('-c', dest='cachemode',
> @@ -74,7 +74,7 @@ def make_argparser() -> argparse.ArgumentParser:
>           'At most one choice is allowed, default is "raw"')
>       mg = g_fmt.add_mutually_exclusive_group()
>       for fmt in format_list:
> -        mg.add_argument('-' + fmt, dest='imgfmt', action='store_const',
> +        mg.add_argument('--' + fmt, dest='imgfmt', action='store_const',
>                           const=fmt, help=f'test {fmt}')
>   
>       protocol_list = ['file', 'rbd', 'nbd', 'ssh', 'nfs', 'fuse']
> @@ -84,7 +84,7 @@ def make_argparser() -> argparse.ArgumentParser:
>           'At most one choice is allowed, default is "file"')
>       mg = g_prt.add_mutually_exclusive_group()
>       for prt in protocol_list:
> -        mg.add_argument('-' + prt, dest='imgproto', action='store_const',
> +        mg.add_argument('--' + prt, dest='imgproto', action='store_const',
>                           const=prt, help=f'test {prt}')
>   
>       g_bash = p.add_argument_group('bash tests options',
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index d8582454de..0817756814 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -124,7 +124,7 @@ fi
>   
>   # Set the variables to the empty string to turn Valgrind off
>   # for specific processes, e.g.
> -# $ VALGRIND_QEMU_IO= ./check -qcow2 -valgrind 015
> +# $ VALGRIND_QEMU_IO= ./check --qcow2 --valgrind 015
>   
>   : ${VALGRIND_QEMU_VM=$VALGRIND_QEMU}
>   : ${VALGRIND_QEMU_IMG=$VALGRIND_QEMU}
> @@ -134,7 +134,7 @@ fi
>   
>   # The Valgrind own parameters may be set with
>   # its environment variable VALGRIND_OPTS, e.g.
> -# $ VALGRIND_OPTS="--leak-check=yes" ./check -qcow2 -valgrind 015
> +# $ VALGRIND_OPTS="--leak-check=yes" ./check --qcow2 --valgrind 015
>   
>   _qemu_proc_exec()
>   {
> 


-- 
Best regards,
Vladimir

