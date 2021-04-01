Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B83515B7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:47:42 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRybl-0002lW-7G
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRyYb-0001T4-W2; Thu, 01 Apr 2021 10:44:26 -0400
Received: from mail-eopbgr10122.outbound.protection.outlook.com
 ([40.107.1.122]:64231 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRyYX-00088G-CI; Thu, 01 Apr 2021 10:44:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFRsEtxQEef6KK/Yt9zIRlUcUl4hJm4NQ25QBYN3JtKyugzpJJFeWa9PC41mwTs3kQwtbUZLm81V1hQcCoun5qwKrWB8e7ofNJ0AN5HpdLJOtV1YN3ZofgYUpKO4WFJ5MMj+RmOgQcqJZ2SnitMht7zdU2t2IvKlHrEEe0jIK/g58ifb3aXrm0xkvLDDgr6JcXAJ8/YqfFLEVHE4jSrV02rQnV0qDVFHlVwy2vlYhhoLRs00/ETJqb29incpvd5SKG+lc/rKhqCgktleZIBdx0xS2r5CuCN8jhwpF8FtNn8dXVEEnEvPafiz6b7W1/QlQB8JoVWWTHSdgX7I0AA4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTXM+9S6RVORunEWz1sr5AICM1Ss0C8svYYQlP8gcHk=;
 b=EP3mE8RjEFrvjpLWda1KJDfxFwmwNkaQjfKmXQ6tUkqh3b6psb35orUw/xELocrb3Jx7Y/vCT4KXnyHdCcoI5nol4F26742P60DxLPcqyRls5dti9YBzMzJnJY0/VmV2JAZ1+tDAttCIH+3fO+NRWgDxEIAH+vEt3LgFY3dWJSYk3Z2WsbJLpTaN7YecU8aw40CZafA56q4QBnW8qmXToOSq5g6Jhp3EzcsUKV4juDyI3SvruQw/n2l9nkeeNQIrmqTi8F+ks+SIdROIW893V5ucu9BS072jxaOo0nBZRK3vNiH8WqO04RPfVZK9SXXCJMVukWlPQPngQ7hRHfItXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTXM+9S6RVORunEWz1sr5AICM1Ss0C8svYYQlP8gcHk=;
 b=R0ZBS1D65RCMDX5/SwUXF3cqHnbw92C1r1CtREEnP11dDMfcWZiL/spqmFi2NSqz5hHMkNmjUDME73WIq+nKD799+USCXZZKk191oJdbJwYNaxy2qxTfy/q7R+5PYXzE+lmz2sHcEoEQeUOBdAq1yYG0WCYBR8GRXMiVGP3Jp7o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 14:44:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 14:44:16 +0000
Subject: Re: [PATCH 2/2] iotests/qsd-jobs: Use common.qemu for the QSD
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210401132815.139575-1-mreitz@redhat.com>
 <20210401132815.139575-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ff97c0ff-4756-d24e-3afb-428737985f1c@virtuozzo.com>
Date: Thu, 1 Apr 2021 17:44:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210401132815.139575-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.200]
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.200) by
 AM0PR01CA0111.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Thu, 1 Apr 2021 14:44:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cda2dcc-ff34-4262-4681-08d8f51c9fea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68879876A8ABF8648A4621D3C17B9@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jfnjc++kBE/stS3c6js0zgruf34uvXhFxgUDJatAUT8x+CWN9hmXKxKZIVsU6pN6imog4ko0gNhqp7zKulHqYmNps5MBqSu371oPgrFZ6eDXP6oQ0qKUBsmmZDCdPWQAqDaNw0rnoVsZ9qUjCW933kv0akrEpaIeTh2oS0iNRn/8WL+DLpKgul2RzBkEHN5ZvLy3jmx9ZzCKiNAb6dUIYuFAtKWeKFyGySNNFUUwpV9kfjldH59sfm81HJuM6ktnEk0KHNS8BtOBHIDBznpGnnC+tXAZ0bsv+hWwNSNEfKqsTr5FTxCXRexhZ0RQkfbfYLSmYuajtNpCbj8rk5NovJcJ0CgxKPVxsfy4lOWY+389x4pmhvIj+Wwxb0RE65eTxIY01tTJI7daAc00Xvu+BOSc4XC2pLhOB1CAFi/78qxaJrtOkEl1MLq7v/sSn3TjnGFB/uGb6Ovj8NViZ7rFpKY6ptuLXAk4yk9s4M4WPTmHb3x1wrUy8EabXXFEsRNyXaHz3cnXBo7zM+IGOvK2Dc1L/DuH1JfnYo4ovc7VqfkzLfRtrw3bV9XtSIiSfgiHxnUiGO0lLKmt1gz9b1WhhZs++KLQQkU1PT2mVwfusY0eY9vdfAAieXfHo7HZ1dPn7E6SoEpAUDMg4RHR/9RRYR45PxAAqijZB73FhN2mC4CtMxcrhM12XoeLL2ps4qhZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(366004)(136003)(376002)(346002)(66556008)(956004)(66946007)(66476007)(54906003)(26005)(186003)(2616005)(31696002)(16526019)(86362001)(478600001)(38100700001)(4326008)(21490400003)(6486002)(316002)(83380400001)(31686004)(8676002)(5660300002)(2906002)(52116002)(16576012)(8936002)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aVdpWWJHdFRLZ255aEY4bG5XSlhZOFg0Qmc3R0l4ZGZDNWhTS1YvSy92d2RH?=
 =?utf-8?B?K05Jd3ZmTGxpSWROc3h0WU5RWUJRSHhHaDRQVEZ4T3RVeDRwMTBYdytQUDI3?=
 =?utf-8?B?cjZzNzQ1MDlub0lSSTdSajVUblYwQ09QUTlFOFo3RmJ6RCtNY21VUzZmTnhy?=
 =?utf-8?B?bCtDVk1UazBIVkJZcTlmblRyeWhwcWlnUW9sdnhnaFoyTjl2R1pJMXNoODNn?=
 =?utf-8?B?WkdjUkZuYWNnNEN6ODNoZjQ0QlI1TGNBUnlvTllRVU5HZW1NMmJkekZXSXlr?=
 =?utf-8?B?M1FPd1d5d1BFdTJTSExVVHdnZFhINmw5MzJFTUdpUWdUY0g3T1Z5THIraTFT?=
 =?utf-8?B?UDRsSVBlcThhZkp5anVXdkIvNFA1QzNla3ZEcVlpR2Jsa1F5R3N2OEFHM21P?=
 =?utf-8?B?Smo1d0JiOXpNeHllTktEOGhmZUp2WDFpUEdxK2FFbjFuREhrb3MzS21VU2Ja?=
 =?utf-8?B?cjNqNHNvd21FUk1UTG5zMEhtWS9QZGRUcTNVb0dSNmhvaDFKaGlZaUlOZ1Vq?=
 =?utf-8?B?QTdlQXo0c3VvS0EvejhvdVJwNU1ZWDNQclBWZ1c1NG1wY1lGRGZJZVZYU3lO?=
 =?utf-8?B?djhPMnhlR25rY3p4S2ZlS3dpcVRuem1JQU4vcG5LSExkM2NkMWRnUlMwcUlp?=
 =?utf-8?B?dkp4cVYwVEdzb0gxRDIxRSs2UEh1WVhuRll2aGR0Sit4RFF5ajZnUWt2ZWNt?=
 =?utf-8?B?SFFNUkN6ZnYyUmVPV1RDQlhidGhDSkZ5TFN0b05HSnluOFB0S0U5QXl1L3lR?=
 =?utf-8?B?aFMzR1Vnb3FtckV5d1E0dld1a2pPR0ZHZGJiOE4rYkR5NkhmRVc5WC9jR1pn?=
 =?utf-8?B?d3pxaWJ4RXJtRldtRTI4OUtoUGlLWlZ4VUxyQjJJaXVYMXdnNXhVTllybjNP?=
 =?utf-8?B?anF0UnpQMzFtc3VFbHBYSjJuWndVT21sMW9KUW9tNW9VRFBLVTJDcUlqbFEv?=
 =?utf-8?B?ZkowMU9QNldBN0kxL0xuUG9FVC8vcWpVZmZIenkrWGpaTCs3MmtXc1hrY3ox?=
 =?utf-8?B?ejBjeXoyTFNxeWJtblN3ekEydUV5MFcvcEUvMlFWTGw2MWVtMXU2VFV2d3k5?=
 =?utf-8?B?NDNZVERPNlJNdHpmY2FmMGlrajJDNW5wNjBiUlBGL3ViS1pFaUE4a1c4a3hy?=
 =?utf-8?B?cjJwVUtsWk9kZDQvZHFxTkpTUGVRaVExVXh4UFdNU0VxVjVjS2xJdUFEdWlC?=
 =?utf-8?B?MkNPd0RZNC9nL09TNGk0SG1TeVA1MmhINGlScUdYY0F3RmZ2bE53M09MTzdj?=
 =?utf-8?B?TzZGdjRqU1lYSjJhU0NLUncwblI4RDg0bnV3SmJnZXczU3dxelRNUndHQ2Z1?=
 =?utf-8?B?WUl3Rks1K1c5ejBkVWZjQWxBWGZPUWtQbk5HYXlXNFRHUzEwM2xvOXR1QkQr?=
 =?utf-8?B?UjRwOUZqWXJqcEF2bWt6UmF2RWZPS3o1L0ZFa1FDMHRUdW05VW9CNTRKVmgy?=
 =?utf-8?B?OWdVcWdjbUVlZVNqUHAwdFZxTU50QUozWDFoTytYd0oyTUZkZXZ2MHZLMisv?=
 =?utf-8?B?bTFSQUJ6SzkvZkpVNlFOUHVtc3VaaFVZaThrZFBtTGdpWjduVklNdjl4Ri9I?=
 =?utf-8?B?UWZqckVhNktsdEFyRG9ZblA1WWFSVnBjU3NkNEV4MDdsck4wT2c5UkljY2F1?=
 =?utf-8?B?TUdNNEE3UE45bjZFZy9GUHdWOUdENDdLZEsrbUw3aFpsMWdLL01ZV0hjOTNy?=
 =?utf-8?B?NDNjcDh0QWhjbGZXQjFtVUdxSTBTNmxPYWdqSitwN09zMm1aM2lVeTdlN3JD?=
 =?utf-8?Q?WSJUHZBkD2dOJd7Ay1fAd65OcUXzcvjWpSzCiHm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cda2dcc-ff34-4262-4681-08d8f51c9fea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:44:16.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZiv1kwMV4Goa8RXzZhavWOTzFKmD1sRpeyqXmoaRNh1waNP/BJccmRktwO2hQ9C1+zcY6wCM/BGF+9RhBO08A3esM+/BLsPpPWMCgUM1rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.1.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

01.04.2021 16:28, Max Reitz wrote:
> Using common.qemu allows us to wait for specific replies, so we can for
> example wait for events.  This allows starting the active commit job and
> then wait for it to be ready before quitting the QSD, so we the output
> is always the same.
> 
> (Strictly speaking, this is only necessary for the first test in
> qsd-jobs, but we might as well make the second one use common.qemu's
> infrastructure, too.)
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/tests/qsd-jobs     | 55 ++++++++++++++++++++-------
>   tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++-
>   2 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/qemu-iotests/tests/qsd-jobs b/tests/qemu-iotests/tests/qsd-jobs
> index 972b6b3898..af7f886f15 100755
> --- a/tests/qemu-iotests/tests/qsd-jobs
> +++ b/tests/qemu-iotests/tests/qsd-jobs
> @@ -38,6 +38,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>   cd ..
>   . ./common.rc
>   . ./common.filter
> +. ./common.qemu
>   
>   _supported_fmt qcow2
>   _supported_proto generic
> @@ -52,32 +53,58 @@ echo "=== Job still present at shutdown ==="
>   echo
>   
>   # Just make sure that this doesn't crash
> -$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
> +qsd=y _launch_qemu \

sounds a bit strange.. Like we are starting qemu.

>       --blockdev node-name=file0,driver=file,filename="$TEST_IMG" \
> -    --blockdev node-name=fmt0,driver=qcow2,file=file0 <<EOF | _filter_qmp
> -{"execute":"qmp_capabilities"}
> -{"execute": "block-commit", "arguments": {"device": "fmt0", "job-id": "job0"}}
> -{"execute": "quit"}
> -EOF
> +    --blockdev node-name=fmt0,driver=qcow2,file=file0
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute":"qmp_capabilities"}' \
> +    'return'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute": "block-commit",
> +      "arguments": {"device": "fmt0", "job-id": "job0"}}' \
> +    'BLOCK_JOB_READY'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute": "quit"}' \
> +    'return'
> +
> +wait=y _cleanup_qemu
>   
>   echo
>   echo "=== Streaming can't get permission on base node ==="
>   echo
>   
>   # Just make sure that this doesn't crash
> -$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
> +qsd=y _launch_qemu \
>       --blockdev node-name=file_base,driver=file,filename="$TEST_IMG.base" \
>       --blockdev node-name=fmt_base,driver=qcow2,file=file_base \
>       --blockdev node-name=file_overlay,driver=file,filename="$TEST_IMG" \
>       --blockdev node-name=fmt_overlay,driver=qcow2,file=file_overlay,backing=fmt_base \
>       --nbd-server addr.type=unix,addr.path="$SOCK_DIR/nbd.sock" \
> -    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1 \
> -    <<EOF | _filter_qmp
> -{"execute": "qmp_capabilities"}
> -{"execute": "block-stream",
> -  "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
> -{"execute": "quit"}
> -EOF
> +    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute": "qmp_capabilities"}' \
> +    'return'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute": "block-stream",
> +      "arguments": {"device": "fmt_overlay", "job-id": "job0"}}' \
> +    'error'
> +
> +_send_qemu_cmd \
> +    $QEMU_HANDLE \
> +    '{"execute": "quit"}' \
> +    'return'
> +
> +wait=y _cleanup_qemu
>   
>   # success, all done
>   echo "*** done"
> diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
> index 05e1165e80..5a14668939 100644
> --- a/tests/qemu-iotests/tests/qsd-jobs.out
> +++ b/tests/qemu-iotests/tests/qsd-jobs.out
> @@ -4,13 +4,16 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
>   
>   === Job still present at shutdown ===
>   
> -QMP_VERSION
> +{"execute":"qmp_capabilities"}
>   {"return": {}}
> +{"execute": "block-commit",
> +      "arguments": {"device": "fmt0", "job-id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
> +{"execute": "quit"}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
> @@ -22,11 +25,14 @@ QMP_VERSION
>   
>   === Streaming can't get permission on base node ===
>   
> -QMP_VERSION
> +{"execute": "qmp_capabilities"}
>   {"return": {}}
> +{"execute": "block-stream",
> +      "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
>   {"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
> +{"execute": "quit"}
>   {"return": {}}
>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
>   *** done
> 


-- 
Best regards,
Vladimir

