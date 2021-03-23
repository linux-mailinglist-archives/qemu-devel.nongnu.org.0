Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7534669D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:45:24 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOl5n-0003ME-Qt
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOk8A-0001pt-Eb; Tue, 23 Mar 2021 12:43:47 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:51865 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOk83-0006BF-9E; Tue, 23 Mar 2021 12:43:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S000gqMRrOp9ivox6JxE2/dHATuobpzLSs1Nk7PYSvf1yC+c/3/l3V6JUkHBI59Dw3KOToCW1027LFWDJR4xCwrYuu+agMa1ik40ph0dhZeGPx6C4JMtb3qmX5cWhizU0iGg/dGeIRw4sshc4H9vwlXebGq9OSGXhiOVc6yWE2j+eqbPYkVj1TpvBNaf2/gX+/vUtZoSzFeEMYGSKu34xvY8OdkzpRAzzEe0pMnyAuJ9hxYK/7LLGtI0MRSZlb9S70xvcsPDMOvXN3mzgrUxOomJT0JPFOUCwo8/S8mbOAh5kEM/DO11u2DlvDubvh7fXcF//KoLNoIZhcBECK73qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoNueItKR6dTG3En53pCh6M+jgej0UHvks/X6WitjDA=;
 b=OWNXxiMN3/uJ524wWLK6Ohud7L9rdA9IzkPlNyzFXl3+4nN9TDrAGpIqQp2Ax/R3fWMBfH6fb1HBzON7O3B/R4dkdbMHxqBnkuCJ9y6/LtgNhhMvvMOM29tgoKHf4k1Cm7OjxRhaVHHqL12a/mQrBC1uqYfQyBZx+tsTtnLzkMfFw3bbUkhA6C8oYhh7ZB+O7xGh5YHT2JUMDCmU5Npnz6eznepgb7OMHgrxtfdfs28nf813gCeYJID1gphgJKN4MXHhTh/7QrTN+CQCNuoCK3l7E2Gi7Sw2txH+N0vyDecOOB7St3c+Ly8MFOwPd4Lq/K4cs9uiigTfx6TQDNNN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoNueItKR6dTG3En53pCh6M+jgej0UHvks/X6WitjDA=;
 b=Wf2s6OI5SY1HMSb+aJnABMD+B81e1T5Dmru9DsKfmmELjcHUusaAr+aOMOLIyg2wLW4beaGGQXKCqp6lThaHGtwDzv4d65WyfsF6UN4lUEZ38nsLnylDB1I7/yCs8SJ7ohaHu114xblPywN1pRhamV2ScY0fZxp+/4fVIOKdv2s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 16:43:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:43:32 +0000
Subject: Re: [PATCH 3/4] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-4-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ac3b47aa-344a-a6aa-a1d8-2c2dba2d540c@virtuozzo.com>
Date: Tue, 23 Mar 2021 19:43:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323130614.146399-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 16:43:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e21945-f4c0-44b4-a218-08d8ee1acb4b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165109EF73C9AA2FBD41DACAC1649@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Ybya/PYqe47FogEzozB5umWy5VZIeCGG4fffweC6A1VvrDDLvUV9eaYzw68WFGiz74JZ43/LQjhqwa0PTYESCqjMWGmV0wMCB+GRxVNXqjCa8pNgAxg7/va/8CGT7iveYZQ9BXoaJGkBBZhFq7K52Fe1NzZnyiTsFQshM3cBcxrkUSua26p4WF5J9MLJD00C0vECaB2+n3O1zflrC7qWaUjbir9/GGapKpVc/3v+0PwhOgn9i4J6ZYN+k8tdHB8zeA/0KPNFXmSla+axJAgSTpiTOXUBOeC8aoyPOXmsIwnenvCNZpUs+4gFuYkyPAA9gVJHaDFFvFQBMtRg3Uze3Nzi8f6ZeMuC7+y+Xj8jOm9Jb89Ivl1pEwXYv4u+iOD+RYav65UbRI8c26cMxZ/LrBYsFbsejSGuaweWppBvUXPLrMpJkyroDvlLYOV3GfCt2OyzP7W2X2wSd+jvp+tPu4s4Sz1EOrOmql60XdF0TfycIgUkCvwf/7waFuYhK+jWEh60mpgJr65XHYjj2roC4N0bUTWQ4tsNihFHcfxO1a5yeQdkwk0vgtRyjSMzgvdpo9EhhysQX/zKhoEuRN9M7O5z/IpRiTm21fHaAcaWxnbv68uDIXjPrsuteTobLg19N16hEVoCPtClPUilzDe5NHJXTzMAhkyEtP/TZzYmpluaMezZ7gQ/apOudw+1YRCoRfOZxS3q9BvXeM5xtbwUhwHxVR0xxOHqYMTnJdunKBKetzJJffUpZCeU8CHhdtuJ9FW+L1NsajP3iVbsskvMdO68Is0gHjjRrq3AWjKb2/kQ8kitW6tTCsqONLXsdPL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(956004)(66946007)(31696002)(8936002)(2616005)(6486002)(966005)(478600001)(66476007)(66556008)(52116002)(38100700001)(4326008)(26005)(31686004)(5660300002)(83380400001)(186003)(2906002)(86362001)(316002)(16526019)(16576012)(8676002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGhOdXlCeXh0Rk9kelhqSVRwK2pEVjFDUW5GbXhGSjJEYkhnRCt0ZVJGUVVP?=
 =?utf-8?B?a1JtOGIvMUlRVks5aGIzNGhlYXpaWmRXVC8wR0F4VGhPbHFUUlpVMW90VHY0?=
 =?utf-8?B?bXNZUjR0dCsrZHE3QVFyZXFtOUtmZ2ZzZFJCMnp4ZkdlbXB1RVZXclp6Z2tD?=
 =?utf-8?B?SjdRRm4xVWVLeXF3bzZYc0tkN091c1dKdUtKVnFZUkt3NmlETVppMmdFdW9n?=
 =?utf-8?B?c3VQYURmY3NIU21rU1RlNVJwYTdDcElVMExFMUJyV0F3VTdXREg2TVlXaUp4?=
 =?utf-8?B?eDBocGJ5S2tEY1FGek0waFFJL0xzamFnTE5wNmpjeWgxZk5MdzdFeWpNdE53?=
 =?utf-8?B?ZVhDNmJ6N1VUWjJ0R2syWEF3d3ZNYmgwcW1BTTVRcGpoUzVWdlIwMWJrMHlP?=
 =?utf-8?B?aVYvRTA0OEloTE96bC9rUHIydWV2dGxrVm5BRTlDNUhucVc2VmZCZlJxeVlZ?=
 =?utf-8?B?ejI4c21sS280U0c3TVdyWnFhN1NMNW1BcHJ1NDRIc0tlTjIraExFQ3BRcDVx?=
 =?utf-8?B?bGgrNVd6cTNRb08wUDhraEhyTkhaTTJ6Y1llbnArS0t4UUo1V3d4dXhNZ2E5?=
 =?utf-8?B?Tm5NL3RtUjBIUlJjTHd5V2JQVWtjK2MrKzVreUFGWkVHU1NwTDV5SGEycUk4?=
 =?utf-8?B?dUl5dEw2dVAyNzl6Nm15YVBKcGhVZk45NU1EbUF5cUpxRVNYWkN4bDlnY0dy?=
 =?utf-8?B?WVFZTlhucmRqK0t3MkRyRXBXWjR4SkJ5UDFlSnZkRlBkTU53bVhSMkJPRDVv?=
 =?utf-8?B?MExmazlOZjRSOGxHSXhUbkx3MHRnVHU3N3dRNXRvZ2lWWm83NGFsSmcxMitM?=
 =?utf-8?B?TjdqQlVSL0pNTEVIb2FOb1ltdTM1Qk5sTEUwNGNPWkxacnpNL0NhZ00vL3kv?=
 =?utf-8?B?WUYvaVhUL0hGWFJIMFg3bzhkdFNLVTUwTmNIeTNxUzZudTNGREFxSk1mOW11?=
 =?utf-8?B?Wm03b3N4elB5c0lYVHlWU25mcFlkaUp3VTBkMHkwRlB2VkFEK251UmhMMlN2?=
 =?utf-8?B?Vm9jTW9Cck8yYlN4WUd1U2pqelhDTEl1ajV3SC9ncHM0V2tPSTN0cHgxeG9D?=
 =?utf-8?B?MGdGYmI4VVNWRWVZbzBIMmtIZ1BMRDZ0eTdFZlNCVVZuOGVZdzJqQTA5a1lF?=
 =?utf-8?B?WkpyMjF2N1Z6YzZzR2ZSOEdkdENRVXVGV3JRV3c4M1NUcmh4MFRZaEZmUUVy?=
 =?utf-8?B?c0lzMFIzdnFIOEhwQWVPYW5iN0pzVW4yampzTU5HSTlnTTJVdHdSMTBBaTQw?=
 =?utf-8?B?V1BDYmx0WG12VzhMUHN5b0xIMHBtRWR4a1FzTXBtUWhzd1VOWlNuODE2QVRB?=
 =?utf-8?B?MkNBRUR5MTZFVk15TTYwTU53a25DRk9wZkV3WnNkRm5yTTVleVo5QnRscmpD?=
 =?utf-8?B?c0hKVlp5YmpyRTVjYVhYdFk3d1UwU3Q3UWdTNll3bEhDUmZ0R1Jqb0JlYXhv?=
 =?utf-8?B?cGtuMEtjUHRrUkhSRzBQbzZCTFNVRlZ2T3lIZEVpVWhwNSsxK3prN3R5UEdN?=
 =?utf-8?B?T1JYQnE5cHQyV3gzYzVzUDh5dEpoR0xxKzQyeWRscDdBSkFaejdKZzFUZTgx?=
 =?utf-8?B?VmYwOE40RURWWTAzQ2U1ZGRpWlBreFd1dFNOSU03ZVFhOE9SU2lSVGM2blYy?=
 =?utf-8?B?aFhZM08vdmVVSEFZY2t6aERsSXRVMXVoQzJNb2ZtSXREWkd4L0JFN1pvODFq?=
 =?utf-8?B?TlBHYkxWdmYwN3ZmWGpjYTBOTHRwL2FmZ3BNZGxaRG95RDU1cFlNbWIwUjYv?=
 =?utf-8?Q?dt8nIPeJmVXxuhO/PkpsqHPWTtMcW99G1yCUM5+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e21945-f4c0-44b4-a218-08d8ee1acb4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:43:32.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e5WJo8skGnn9HMCfjKLou7t53MfbQX3qpg5NFGmphFXGTRLxaNhwhcY28fLMEC/VC1rTY5OHYicqSlBZfCiBTUy8TEbc/iaFCh1ZSe+A6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

23.03.2021 16:06, Paolo Bonzini wrote:
> Right now there is no easy way for "check" to print a reproducer command.
> Because such a reproducer command line would be huge, we can instead teach
> check to start a command of our choice.  This can be for example a Python
> unit test with arguments to only run a specific subtest.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/check | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..aab25dac6a 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -19,6 +19,7 @@
>   import os
>   import sys
>   import argparse
> +import shutil
>   from findtests import TestFinder
>   from testenv import TestEnv
>   from testrunner import TestRunner
> @@ -100,8 +101,8 @@ def make_argparser() -> argparse.ArgumentParser:
>                          'one to TEST (not inclusive). This may be used to '
>                          'rerun failed ./check command, starting from the '
>                          'middle of the process.')
> -    g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
> -                       help='tests to run')
> +    g_sel.add_argument('tests', nargs=argparse.REMAINDER,

Interesting that REMAINDER documentation disappeared from latest (3.9) python documentation https://docs.python.org/3.9/library/argparse.html , but exists here https://docs.python.org/3.8/library/argparse.html  (and no mark of deprecation)

> +                       help='tests to run, or "--" followed by a command')
>   
>       return p
>   
> @@ -114,6 +115,17 @@ if __name__ == '__main__':
>                     imgopts=args.imgopts, misalign=args.misalign,
>                     debug=args.debug, valgrind=args.valgrind)
>   
> +    if args.tests[0] == '--':
> +        del args.tests[0]
> +        cmd = args.tests
> +        env.print_env()
> +        exec_path = shutil.which(cmd[0])
> +        if exec_path is None:
> +            sys.exit('command not found: ' + cmd[0])
> +        cmd[0] = exec_path
> +        full_env = env.prepare_subprocess(cmd)
> +        os.execve(cmd[0], cmd, full_env)
> +
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
>       groups = args.groups.split(',') if args.groups else None
> 

I hope at some moment we'll run testcases with syntax like

./check -qcow2 test_name.ClassName.method_name

But a possibility to run any command under check script defined environment is a good thing anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

