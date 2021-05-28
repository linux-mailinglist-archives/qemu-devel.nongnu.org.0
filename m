Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051F7394648
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:18:24 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmg7q-0003tS-IW
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmg6X-00033B-Lo; Fri, 28 May 2021 13:17:01 -0400
Received: from mail-eopbgr00115.outbound.protection.outlook.com
 ([40.107.0.115]:62161 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmg6U-0004yK-DA; Fri, 28 May 2021 13:17:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muuOKlKltVsvmJLN51FTDhPWrJ1IOUJrXXxBPYJNa1HZ7tKPTBqcU4mu47W3aBB1+h7GpHlKTfqUs1XBqfMJDQf8z8/GzK3DlYQbz+z2+kHpf+HayZ1OieMjdSjU7xVyZAvEWXDbVWLkajRVjGY0roUex+wdzw0mFQACtOskAKEKYBR0hJUyPiSh9EckqkzP0yq5MjY+bh6UHvDLjxRuCms3xnG3gJb/3lOxg22hWLV6RDEyi0z2aR7yatJaEj1XZ9YlidwKTiWQbimKaVnZeTpKkv89byVZcpamU7mbuMWlzwib1swS47PTRpt29cUc0Zu5NTZ0apcHGN3n0yZmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QefFLwwHwNDI/2JJxt1BaKC5BCAwA7vb/L2YYMJG7co=;
 b=Z/7KJBWcmBPOMgPOYICsKzMyktxFruIgFml6g/RaB2U9mIkJdUpYCChi8Nkg9A813nIg7sxM+wywQW8xmW8gwwE/cdx0Af6F3gNAM5lp0zGSLjqMA4LjgE4PM1rJruMtr/PhPOxCc14yyLFP3QKoVV9awnA97pmxHvT0ZLn3bmuf4It+Ut7Ge/bSmRGSnkAkiVtzib7UDL6TmQs702L/XnOTMtchyK2zKdZWpgfFunXeMfHo7MJApE8LGln+0pc3iM+7JQlyo/jK9TKs+ImA4QSFAmTkHJ4cv1GXyIlSDomc4IZ4OmlPLEan8FEBtoH3KvX9EQoQPbaC6Oh79o7EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QefFLwwHwNDI/2JJxt1BaKC5BCAwA7vb/L2YYMJG7co=;
 b=P/NNvhMYU/NoFo3D1kK0OoPNi+TvtSEfDn+iTSY+pkBPErISqjOnsI0umAUWS0TAlpAnaMmAcXtYZej4CO5oC2mXU6KqSWoB0mtbiGp/pl/W16lY+nYE+qeJSpJy9Eaj+v+pzkU2T3iCXicHhA1TD51qv3JVlxA7Z/vaWAyqt1U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 28 May
 2021 17:16:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:16:53 +0000
Subject: Re: [PATCH v4 08/15] docs/devel/testing: add -gdb option to the
 debugging section of QEMU iotests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-9-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <69bf0953-1554-5865-1416-478a4aa7197d@virtuozzo.com>
Date: Fri, 28 May 2021 20:16:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-9-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR2PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:101:16::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR2PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:101:16::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21 via Frontend Transport; Fri, 28 May 2021 17:16:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21c20c15-106e-4138-8f20-08d921fc639c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17168AE2F28ED90C2145FDECC1229@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZZbkleEE4HzY8isVFuJR8uppF00Oq/RBQMKiCpAeaCRSh4MwZyAOAw8e1DCbLfhaXNY7G/H+duY2EdNE2FnjGaH08YwstVqZkkg6SN0OL1TM8TkHauzz0fIXTsIffhyJASV9p9/AsVTGFBnOUaVaUvUEHQ2XQYbLR/OhUWHYuKr/Cdz2kSCO/EjQsPDXZ+AtnekaQMEyFIlo3MlJHw44z4dP2yzpyhgknZM4v55D6sMyu+ev9OekDHvAGg8RhQ6aLDJL2Bkt2Xs7UB576Lk5y078aFybqtPrSRYEo0MxZ2pN613unPQtvPhJjkP44AZK4BMHWclQQapIXbXCk21ekgwHZ/ts6C4y86zWNWYbBAXb6YPgGkE23RDesNI2ow4xFw1U7N7U0heypj4iU9kRz+KN/mcWUnsfIP6ilQue7RUS5DAT2OvkiC7aH0kkweIFsvgYYPEvY2o8VsY0TfFgJ8/NJjTKkLMzq2/jaemMRRjutOi/DpsJsTUhGz6jcTLmr1IK0xZncl8EOQC5HvXI6RNRCTKPvl4zatuvci7oTdZ3Ua3+3r43gNcZF8oDTpr0Yt6Eq04sr0OIypNyuHboOINgftn2N7TzzSb6/rtpdkYpdIYh9zU+cLCsr+CnXoh/dCDG0wH7L31rmhCAt88SEeJAwTBtC+KD6mti15txswAiVR5/4dJQKsqyTodgCPgWhBt/w32So2saw/XrD+WjAQflzT8v7eqRDdSCjO18v0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39830400003)(31696002)(4326008)(52116002)(8936002)(66556008)(86362001)(54906003)(66946007)(6486002)(8676002)(66476007)(186003)(2616005)(316002)(26005)(16576012)(5660300002)(478600001)(36756003)(31686004)(956004)(38100700002)(2906002)(16526019)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDIweVMzY2VZRnB2eS82Z1E0SlJ5WXY1NnExdkptWklUWGN1Mm5qTUtxV0Nn?=
 =?utf-8?B?ZGVXcktQM2tiYlBZSVJXcGVsa01OdjRzY1lMNFdpbGdROWRmNFlMNUR0aFJV?=
 =?utf-8?B?REg5Wkl3dWpXVFNrS1Qwb2hGOGdNR3kyNXlhdktsNjdOclJKVUpITm9VM1Ux?=
 =?utf-8?B?L3pjVVd2ckt3Vkkra1JXOUNSV3NiTHRYT244LzY5ekdEby9VaWZEYTg4YTJk?=
 =?utf-8?B?UDU5L1pob2krVmVqeHY3WXY3ck0vdWdWQXFtS1cvdVZqOS9TMXFKTEhkUEFQ?=
 =?utf-8?B?K3M2S2FpK0Y4ZkxCeUhrSjRZRjN0TDFLdDgyTTB3bTQxZlNzTEF3Wks4b0tt?=
 =?utf-8?B?V3VPQmVYTVUxdUczS1pCSlFveVdUaHp4K1l4aVgyZ08rNXBTUi9RWkJDQUV2?=
 =?utf-8?B?T1VMcTFoZjB2ejBjd1A1b0V4SDUybGZvdlk4MnpMREZnV3VjT1Z6VjEza3I1?=
 =?utf-8?B?emJZaElzQWxXRmV2Rjh1U1duVStOU1duemZxTytqRUNWMGlnbFUxVzZnRFhG?=
 =?utf-8?B?bTJpZlg4TXVXVXhrZnkwTzdFZDZhdldBdzdHWVdKVGlobFhyU0tyQlFTVzkz?=
 =?utf-8?B?SkNJSnFZclRrcGRDaXhNbnpsT0JKbmVPUlpPZDBSZysxTTNsWVRrU2hBU3I0?=
 =?utf-8?B?K1I0c3FVY1A4NTRkYSsvU2tyTWdEWGJ5bG02WnNLdVlHS1lPTWZHM0VDQWdw?=
 =?utf-8?B?TnRLV1A0ek9aZUdQTmRSOGc2c2UvSUp3b0FuNXpYZDF0YmVsMVI4ZEdobi9v?=
 =?utf-8?B?VUpmRXd6R3BLTHlObDhVU09rZW5PamhUR0tuckhDQXBzWWxjSFNsa0kvaUVa?=
 =?utf-8?B?U1Y3WHZlVlhvU1VPQ21yWEJBYlRRYnZnb200VVdmMGpaU2owNG9oZkJwZXdG?=
 =?utf-8?B?RWVocGU1UHJqeFR2aHB2bnZrcWhJVlZJOHpiVm9RaG50SGdqNFp3Q052NFNo?=
 =?utf-8?B?VjhBV1Jrc052b2NZYVRuNEMxNmJGOVBQdTJIZkJETTA2SVFhY25pbUZXZjlm?=
 =?utf-8?B?SGJPVTZwZFBNd2ZNd2FjL0I2V1RIUzNHWTIyNHl5M0JtZ0NFNGJHSUVZVEJN?=
 =?utf-8?B?MVQ5c1BQdjBZeUdFNG81T0JlanBJdnBLRVpTRDRudTc4cVpqZnhlWC9iN1J2?=
 =?utf-8?B?cmZvejhudGo2d1ZocjhHMEJUMHlhRi9RWmh1Z0kwczdHMHpOOWtSL2NMZVhH?=
 =?utf-8?B?TWEzQlE0WTdoSHU2dWNuMTBaaHNZcUtBT2tML24vS3BlWE82cGhnQ1ZOM3Nw?=
 =?utf-8?B?QkhRUjN4d09maWVTby9LR2JKakVpYzhsWVZCUHBLNFJKeklPRXVoRlNrZ1NK?=
 =?utf-8?B?a2RmcEJNY1BwcHlEUXVJVFQ5c0tmbTk4ODhnSzFJNTlmSytZTTFXRWNtaHV5?=
 =?utf-8?B?ZXp0VXZEUHFSNFhQM2pKQjA3Y0tUWUMrNFZzdmpsVFNJVkVoTEt4cEJYNHVS?=
 =?utf-8?B?MkVHMkxLek82OFNNelR6UDIzK3RvRGhYM1Mwb3RlYndjRGhtaVE0SUpaZmtC?=
 =?utf-8?B?YnhtL1VtblRPNWlBWG9xT1ZZWGR2cHhDZyswMzU1WlpzcU43MmlCcmlyTWJa?=
 =?utf-8?B?aWdtWGRFOHVKNHFXTEw0ZXd5Q2E4M1B4UkdZU1hpSndyVkNSL2Q5cm1XbXNi?=
 =?utf-8?B?UXRFYWZkSnJzM1VTcjlNTTNXdDZCLy9VSDhudHdhWkhLZlNUQ0ZVekhkTXZG?=
 =?utf-8?B?M3NudDFjQ2tjYS9iUXI0Q3V1cENUU0FIVFBFU1ZiNjloR1BvUndvT1FteUdj?=
 =?utf-8?Q?fzJD2WRS21eLovXrlW3zsgRsjgJ3Ei0nfu6Bi/0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c20c15-106e-4138-8f20-08d921fc639c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:16:53.7639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6Zu2BeztqEC39/xiUDotACWilk9Kbf2C2gXoTLaR309WpxpnMfMmjrcS2ezK1PH28dcSvsBRQ1ZL5QBwM9wbwNIMnYKDQC781Kxb4pbA7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.0.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   docs/devel/testing.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 8144e316a4..a746cab745 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -229,6 +229,17 @@ Debugging a test case
>   The following options to the ``check`` script can be useful when debugging
>   a failing test:
>   
> +* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
> +  connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
> +  address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
> +  environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
> +  ``localhost:12345``.
> +  It is possible to connect to it for example with
> +  ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
> +  ``gdbserver`` listens on.
> +  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
> +  regardless on whether it is set or not.
> +
>   * ``-d`` (debug) just increases the logging verbosity, showing
>     for example the QMP commands and answers.
>   
> 

Didn't you think of an interface as simple as just wrap qemu binary by "gdb --args" and redirect stdin and stdout directly to the terminal where test is running? Wouldn't it more convenient? So, you just start ./check -gdb <test>, and you are in gdb. Or you need exactly gdb server, to attach from another machine?

Keeping this possibility in mind, it's probably better to call you option "-gdbserver"... But we can rename later if needed, finally, it's only a test framework.


-- 
Best regards,
Vladimir

