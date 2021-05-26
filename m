Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F99391656
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:33:58 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrnS-0002Su-0P
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrm4-0001Yx-7x; Wed, 26 May 2021 07:32:32 -0400
Received: from mail-eopbgr150120.outbound.protection.outlook.com
 ([40.107.15.120]:38048 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrm1-0008Sx-Am; Wed, 26 May 2021 07:32:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFDpynO0HbVrMvPXZ5tI1Dee1HURRTZgdFV6vIyvB+E68nP8gu6tRiZ0C3QwCBtI4Mcf1DhhPVgJxGdRsbfsA4K9sn3qvbfyh4qo/76DTvJtiVCLLSXHKY2BTNm2P4j/H3C2aIAhqC26tV6VkGUhy6/2d6pudoG3tKnKPDur4shh3Xw1EsrrQxi9VkW8IT0UyqQtSd4WOj+LisRvxDXHNACXC8Cc0ny1OdqOTdyEbm9eD4LUz1rZKtBVF37IMR3D3f2q4t0nOGHUcuOgx5sX3A8zwXzBmndYNRsqs0QKwJbJJ+aCbg0VNgwd9/t31jQYOmRLT91WDGsRuv1AB/GNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rclfTPTcBehod9uC15QmnfMTjEjFTxza4VLjEOcuPVs=;
 b=gtED+Q2X2dz3Rk1vT0lvsqVASuLm6Bx3QaRGIL/5lptWM8OjmKXkCo/SrhXsDLUi1bfkxL0FtkK90veQY7kJvcINdnY0MJhOYHZ/vcH9fB/TclAsFA5VjYeyb8Zwkf1nQ7nkvbjB0YMyRDrcfd3htnRF9j0XmVwX0Fl2qMlAc7yl3EHqz8N3aIKtOk0knOsai7j6w5EBk7vM09iXrnb2PA3HdjM8MQJbxKN8GbtI7bQ+5Ii+lyp3yj0FS1PX8Yair77VQc79t8aPxfGlSLHI/DmgsZmkaWHERofzmnyR2mlVOxjtWrVlKshe4ZQHgRHiTRRegH7e+tq7Oy64UH/hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rclfTPTcBehod9uC15QmnfMTjEjFTxza4VLjEOcuPVs=;
 b=jPH5hOjzB/UkRNdl06iZGNukwS2/x/6q3e2fMjbsfsCjE2Z2eILTeOS3lB1gwutAeZIwEf4p3xlkxF0snzaSjPoVPx0MyucPSVHUNLKV/BVLe5M4N9YwKAiTWAS2+79mccKWju88hOqACIg8aD31W3eXiAzyUnnqgeDlax5ULLc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 11:32:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:32:25 +0000
Subject: Re: [PATCH v4 00/15] qemu_iotests: improve debugging options
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a19cb269-2845-e219-ab20-7fe7a0389896@virtuozzo.com>
Date: Wed, 26 May 2021 14:32:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Wed, 26 May 2021 11:32:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b893780-4517-41b8-fd2b-08d92039efb8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-Microsoft-Antispam-PRVS: <AM6PR08MB38635608DC523B291865A83AC1249@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ng+QnL1yY+k0rb5Y+YhfXTFIki7QuhBlOuTwbJRPZL+AXYX9HMaASex7iKspgCDElaSZ7+EffvMT5pgbZMoGXxHplWj7lVeBnUM3PwQIxGkvifOX8K1QgKbMJdLg1ZQR4KCYfyonfIEsHVpLm6qf3g875e2Wdw7/Y6ZhmpGFSG/3UwF+9SDuJqqzKBGM+aP4M5NOEQWeRsMk9EWS24hDbkxSfdwf1mxNdaxeD1vrydT21Sm1vqE1fa5zyFbIHHskfYOTEy4CE/TSFeALor0a/hkR6JTYwWdApWaiu/ti5Kf9Q3XnjfWu/KXF9nHd+C5aMsMbxl7lMd1jt6kF4OY/XpbP/dbZu9F6kQJdloZ1vQ/MrZcTXoCDyxHgSagT6Z92Fs5aCnBEuCRcjPoZNrID9gTaPrAqtnwoSoB8CKdjFBiuOuFivv/zJ2DZDYF2udXz7uqDZlR2xDjGqwnQ5bjYv/bSwu2YmMfwpE1vbLN+RxWEZsbJUWS8hWWb+VtNYO9g2fuseFJ77ckUGeQVbAJ6LOFotYDOcd615Rk7ZqsiosmISKgGFSxUq5w1IfhIL4pzUumTcrA/DkvmAI4Y2K6Sre/heA8HwGoYJ9sKJysfal2uTTG+N9VqG/StIzwKf7TxcExgL7Kjy52ZDQOHypVzEjMyj8gxM6kxt9ycE5lxC1f/lwXII84QTPaBsxBgj71kncCzuIngx8PxV97IigBEyk7xcEIruPnZVk9/b7CJzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(136003)(396003)(346002)(31696002)(4326008)(36756003)(66476007)(2616005)(956004)(38100700002)(16576012)(66946007)(66556008)(2906002)(86362001)(54906003)(6486002)(38350700002)(52116002)(478600001)(186003)(316002)(5660300002)(83380400001)(26005)(8676002)(8936002)(16526019)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzQxTmNrNU9Hb1RjV2JDODRTbkpoRlRtL3JkUjA1ZVYyTjZJclpKWnl1Y1pG?=
 =?utf-8?B?V2ZBRDQ4czI2NEhEWkhTRmlXRTFQaFNEKzdkZDl5a3FudWdTTVpLalcxUjN2?=
 =?utf-8?B?WHlhS0xMZ3ZsRnJjMUs1aW5OL21MQ05vcHBLVGExVVJPZjZxOUNCU3FWdzZ0?=
 =?utf-8?B?Z0lsNkpMbmdQZ3k4T21NaU9XeXBOd0RrTHRyQUordmtJMDJkaWpBNVBtVHJQ?=
 =?utf-8?B?Uk84cVFFV29JaHg4ekRUcm1yOUhqdTd6WkFtN2hpSDc1MUZjcEFhSVpVZTRO?=
 =?utf-8?B?TXE3LzRET0F0aUJzOEc1M1k1a1IxWUNqQmZNdDVaSUN2dUFkM2VlRHBZM2RR?=
 =?utf-8?B?SE5adlcvdE1WUFVGTGRpbEdzMVVTTUZWaFRYUVpkalNYbWpWZnpzanZmdFBv?=
 =?utf-8?B?M2RTK01HMmE5dy9teXhYRkVRMHFMQlM2eEl5QkV5bEFVSVJUNnl4YUFMZlpP?=
 =?utf-8?B?ckRoRDBreFMwZnVkRnZ2N3U4WWI4b2J2T0lyc3hJTVVXWTM5dWQ0R1pENHFy?=
 =?utf-8?B?eEIzWlcwdm53cThZVEpER3czTytPTHJIZmtRTlFMQzZtRENQQ01JMHRPVEdk?=
 =?utf-8?B?RFZoNnlDWllrakVhNmFzYngzY2Y5QUpRSXZGYklYL3Y3WXZNU002QVM2aXpK?=
 =?utf-8?B?TjhGQ2VpcVZKMXA4QzhJYjU1YzhXdDRVZzM3VllQWk1rRitBeDdTa0FzNDdT?=
 =?utf-8?B?QTJoUTBJTUZ4MDljdG9LWk9zeTRPbm9HZm1pbTdrRHRqWjZZMnRIb1VHa1Np?=
 =?utf-8?B?VytqOFN5bnJMNDcxeTNxczJZZUhBTHlNNm9PR3lzb1ZRc3pVbzlsdWk2aEgx?=
 =?utf-8?B?WDQ3RFYyM2dIeVRZMmhKaTN6M1pmaGRJamJDZ2MrOVpHVmxKaXRaRmM3Rmd6?=
 =?utf-8?B?WWZVcFFyL2pEa1J3djNNbEFWakZOSjdhUHRFS0x1VEE3SG04aWdzWGc2ZjZq?=
 =?utf-8?B?b3BBNEFvWE5IdUJrRmJoNW1mUjBTWERzVUZKb3dRUTROMU5vaE1RL25Nd25t?=
 =?utf-8?B?UFVVYmM5a2tHUkRuVElSVENFcU5wWHBkc09CTzg5ZVhLRjh4ZFYzU0hRNWJW?=
 =?utf-8?B?Rm56cTJlcUsxNlVXOC9kblJJMUovSjdRQXhvQUxKYzl5YzJRZFdhSVR2M0Ra?=
 =?utf-8?B?T0hJbWFrdUJrdnVDMUVaWUNrdnVUaFdJMGN0NDBDRFZFQnkrUlFhSU5PZktL?=
 =?utf-8?B?QUozUVVZU1VyZk9oWmQ1VDRmTmdrVzU5emoyS3ZENGJxWWIzOTZNdlhtdGZG?=
 =?utf-8?B?clJzNGlFZVlEVFlMZmhmSHZqTitUcVVDRG9sdkpjcjdzU01qdDFNY2xsd3RZ?=
 =?utf-8?B?cEFVVmxwWGZrdFJpZmRFODhvY2lGZ1JjekVJbGRFNWU2eGpMbStzZTdIVFli?=
 =?utf-8?B?WUowNnQzeG9VWnFaaDRxaXU0aGJjYVFUK0FXK2ltaFZUNThhM3c2TmtBK2FK?=
 =?utf-8?B?bSsyOWlrV0pONmRaUzNXTlBXRFhiWkRoeXhrbGdDVURlN05pMHlKRngra0lx?=
 =?utf-8?B?N3Y4U05Xd21Lek8wUDk5cFFMWTZxL0hMSmZTTXBoQkQwZlNoSFRWQU9mWm03?=
 =?utf-8?B?Slp0K25XNytPZHNxb2dZQnV0dU15MlhNcmNKczhlZHF4akdKVk0waTliandh?=
 =?utf-8?B?OGNVU2dnckZQVE5PbE9MS3pLUzFWWklGZkpDOUNrQkttNjVzZmpqcFAvcmwv?=
 =?utf-8?B?bVpGQVpxS3BvK0tObU5GaEJBamdPbDg3c3pFK3ZTMjMzRlMrYjdYK1d6cWVU?=
 =?utf-8?Q?7l9LeqdZoWJLCMTFRFHrBK8avGBVzC4O+76kB3F?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b893780-4517-41b8-fd2b-08d92039efb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:32:25.8102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI8IBiXBJKndwm76tqgh8tMHP5CoURXUHf52r1JKbugRetOwH8rBKcy2a58hp6Tg/ootFhNefu9SqZ+lnWRIW3ySlAngSZBNUsngXY54SSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.15.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
> 
> Patches 1-6 introduce the -gdb option to both python and bash tests,

Could you describe how to use it?

I often have to debug qemu iotests with gdb, and can say the following:

1. Test runs different qemu binaries (not only qemu, but also qemu-nbd, qemu-img, qemu-io)

2. Test can run qemu binaries several times, or even in parallel.

So, with a new option, how will I choice, which qemu (or qemu-nbd, etc) process I want to be attached to gdb?

Currently, I do the following: I recompile with  "sleep(15);" at the place where I want to attach, and start the test. During the sleep, I find the needed process in "ps aux" output and start "gdb -p PID".. Sometimes there may be troubles if the place where I inserted the sleep is triggered on another code path.

So, with new option, can my workflow be improved or not?

> 7-10 extend the already existing -valgrind flag to work also on
> python tests, and patch 11 introduces -p to enable logging to stdout.
> 
> In particular, patches 1,5,10 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
> 
> This series is tested on the previous serie
> "qemu-iotests: quality of life improvements"
> but independent from it, so it can be applied separately.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v4:
> * Rename environment variable from GDB_QEMU to GDB_OPTIONS
> * This time test 297 (pylint) passes [Max]
> * Refactor the qmp_timer field in machine.py, and add a new
>    parameter in machine.py and subclasses constructor [John]
> * Add additional check in patch 4 to cover the case where
>    GDB_OPTIONS is empty
> 
> Emanuele Giuseppe Esposito (15):
>    python: qemu: add timer parameter for qmp.accept socket
>    python: qemu: pass the wrapper field from QEMUQtestmachine to
>      QEMUMachine
>    docs/devel/testing: add debug section to the QEMU iotests chapter
>    qemu-iotests: add option to attach gdbserver
>    qemu-iotests: delay QMP socket timers
>    qemu_iotests: insert gdbserver command line as wrapper for qemu binary
>    qemu-iotests: add gdbserver option to script tests too
>    docs/devel/testing: add -gdb option to the debugging section of QEMU
>      iotests
>    qemu-iotests: extend the check script to support valgrind for python
>      tests
>    qemu-iotests: extent QMP socket timeout when using valgrind
>    qemu-iotests: allow valgrind to read/delete the generated log file
>    qemu-iotests: insert valgrind command line as wrapper for qemu binary
>    docs/devel/testing: add -valgrind option to the debug section of QEMU
>      iotests
>    qemu-iotests: add option to show qemu binary logs on stdout
>    docs/devel/testing: add -p option to the debug section of QEMU iotests
> 
>   docs/devel/testing.rst        | 30 +++++++++++++++++++
>   python/qemu/machine.py        |  7 +++--
>   python/qemu/qtest.py          |  9 ++++--
>   tests/qemu-iotests/check      | 15 +++++++---
>   tests/qemu-iotests/common.rc  |  8 ++++-
>   tests/qemu-iotests/iotests.py | 56 +++++++++++++++++++++++++++++++----
>   tests/qemu-iotests/testenv.py | 25 ++++++++++++++--
>   7 files changed, 132 insertions(+), 18 deletions(-)
> 


-- 
Best regards,
Vladimir

