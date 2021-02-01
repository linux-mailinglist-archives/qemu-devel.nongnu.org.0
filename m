Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97AF30AC64
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:15:03 +0100 (CET)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bqw-0002lH-Td
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6bpc-0001sU-7s; Mon, 01 Feb 2021 11:13:40 -0500
Received: from mail-eopbgr130127.outbound.protection.outlook.com
 ([40.107.13.127]:23214 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6bpY-0002Nw-Px; Mon, 01 Feb 2021 11:13:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpMySp1S8rPm8wLtVBMtheGH6KEuoO7LNlcEIxfTmg0pQAiqNmUhdecDUBtvQNPf5yqcNi8E0UsVRqOzBLD6MLSbGZuNtvbnBjdGr09z3CDvBAZ1SVV01xV8hBDFlODNQVchQ1/499y2ohIt8hEoUUT8dwHQXcR73Anrnm3WFBJhOnmOMX12/SHMzZyfR6O9n+PBn0HImKKghqDplfBIUrpu6+BE02Id41a1QPHavHnDGtVjfHJE1KGZlWylquS6nLKE6pOcd0ybyBTqLHw7EQZAqQu8l/Rr0f88PgCCqd3Ee+uRUXDdYroSAMv7/uoewU4xmO4anT8WrWkhaNI/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LknwiCerGOn0PAM5j3i3oBD/AQ7z/cNfGQyvVo2P4gg=;
 b=cs5UKoP26kHN6yeK4p020PnNLCA7au0vB3Ws2oUxrHv3sMzo3WyZLSk7B1n3eVm6tN18iF/932dJuouY+PHBr8s5N9Qi5GcIMvPgQejNk8jfKiANhAqRbSM/H25qsXfbUbfgyejdzAlQ++eCZSCuesadamcRoBgYbaD0iEt88tzbBrqL3NGdmO3wDlOiZh9mf2FQRoLAWE3KxBmsBR+6GtQ0gsh5R+jR2Ydj0RygwEimzivEApHbKFIjkNJyoqATYizrNd04nZrK0h95mlOzCsIf+G1vJXfmijK8MMTdT+KKjbCc8fVGClNFnxqFGdhTPcpI8IQYZ5hkvxdb1JA35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LknwiCerGOn0PAM5j3i3oBD/AQ7z/cNfGQyvVo2P4gg=;
 b=lDUVreqh+dWvdG4Vb05sHXffQX+XdWHJc2cwSAioPSqWU4azoNG5mqEREuGWPIsqCFUSpEYU97AhIBuEsjymz9Q4MY8OggH9i0rLkI92tP5BZX6N7k5M1l+kxn4kqDmSD8FWEPkcv0m1E9LNda3wCr+eOAx9O5/mhizS0Vinx94=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 1 Feb
 2021 16:13:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 1 Feb 2021
 16:13:32 +0000
Subject: Re: [PATCH] iotests: Fix -makecheck output
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210201161024.127921-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bf1dc326-94f4-d0de-8307-9f6d317738c5@virtuozzo.com>
Date: Mon, 1 Feb 2021 19:13:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201161024.127921-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.160]
X-ClientProxiedBy: AM0PR03CA0098.eurprd03.prod.outlook.com
 (2603:10a6:208:69::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.160) by
 AM0PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:208:69::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 16:13:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d064530e-f8bc-4730-38e0-08d8c6cc51f8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5384:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5384314F246904D452D05188C1B69@AM7PR08MB5384.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RD2g5PxMfT0yXuve0s7BJ05XWxWtxtkylU64Ntgj7yQ3jW+gIRa5/Oi2DJQq2ku+hjswWusIOftZ3Ytz5oij17fZK+Ycn1lcbj5ybyKohQpz+BClL3jp785Ty0rSC65ovStMN9fw2NUuUqVhY1w1Y3PVKb7y8Q5VJ3pV9CpZ/Yl0SbjVq9kQrQSOUs+Z7bVL5UouRreTDXX46V/vuQk8N3Em9U4KQkLiY1ucI6n5aDRKuXyhBFBtGaS5W8oyVIgDnof4+owxmFO9am+MR7/rTvTn3A35WqQUD/4yBqcXafMbMFGE7lTse5DniDbyS2pRTAti9zZ7vqGhHFaVGA+ZGsCNLf0N0cNtZRFa+oxNuPN5aL2bjlOPZuJepWoaTJdCyzHjBv7WAUU9I26Ph6WiLRvkbgqWKVuY+hbpB/vpZY0LtYwBTky2OJOvaofKJYuRvN9JrhmzJVbkULJVATBPRD/omzsfet3MnZ2k+236NFqWpgPY3I9A05lrEaRIs8b+Cydjq6zJaQhfcsD2jJX9Vp9QRMXdo2cgx6xyWPzwrgaoh33+bVrI//Q6voikNHazI3T5GWMD/rs4+Q1KmSP7gObsD4Oj5WS87EDpZKIxt4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(16576012)(8936002)(2616005)(31696002)(2906002)(36756003)(956004)(86362001)(6486002)(16526019)(186003)(498600001)(52116002)(83380400001)(6666004)(8676002)(5660300002)(31686004)(26005)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0pTd3luYUwrTUpKSHJQVkdCdUFxNm1wSnBnaUdsTnNlblRCbVZKNVdEUm1G?=
 =?utf-8?B?SzZvMm1kRnJlN0UvZThac1NIRUQvRjJnTnNVeGZtbGtxZE5yOUdsdnA2TG5o?=
 =?utf-8?B?M203WXdhUEp3TDVrRFpyWllpSnlsK2hwTk53c0EvdjVpMkhEQlVFcEp3dW5N?=
 =?utf-8?B?NmJiZkNDa1BpN3lzNVMvM2ZqblhUVS9UQWErNVFMdkNVSmtLY2txOFBuMU5w?=
 =?utf-8?B?bmpsREVVdWtSVDJ6RW4yOFNKUHYvQkNBY1hFa2ZOdDVCT1Q5dW1ITjlwODFy?=
 =?utf-8?B?ODdkVmE0K3l1MkEvY1Y5cUMrN0ZHNUFZMnBzUWtnSmU5VFliZ2pxbkRsMEc3?=
 =?utf-8?B?WXN5bmxVR2dDd3pndjltUjB6VW1iZUFUQzRNaXpUMjFQZjFiS1pCYW42elhK?=
 =?utf-8?B?TmUyNEpOWDFDKzF1bWRNMDlRQ3h1MEFja1hGaDZZVENFV2lHbElaam1Yb0Er?=
 =?utf-8?B?eld2aEY3RFpjZEdIelcyRHBwVVNSMG5GUTUrcFQ5UDI1c0JMWThyWXpZRjI1?=
 =?utf-8?B?c01yYVBaWVBmd0gwa2NSckpaNFhkNFk5Wm0wYytBclA2b2d5N1FRM3V1T3pk?=
 =?utf-8?B?aUI3Rk4xdytVMldXQWU1Y3N2dmhubnNtNTNBOTNrcG91V1VyS0ZXYWx2N1Vj?=
 =?utf-8?B?NnB5emViYVdpNjVRSGZqY0g4SyszdGxlVXBzdGd6c1JDLzQ2ckdyV1VqMWd3?=
 =?utf-8?B?TlNQZXVxQXR3T3VZc0YwbmFJSnQya1QxK21CcUF6L21CUENqdlNVQUlRS3lt?=
 =?utf-8?B?WGRVeDZxTkNSU1VTdFlaa3grU2tWd2FHM3FMaWhVMnFCMGVGazZIOXBKRmxS?=
 =?utf-8?B?THNkREsrN0xZbElWcDd6VlFnODdNV0NxNHR1SDZrak8vc1NvMlZaWHJpZnM2?=
 =?utf-8?B?ZUtIYjFLTFhlOHF1RmdubjVzTFVWZHJSUEFmWHlodW0yZkwzNHpiL3V6UlJp?=
 =?utf-8?B?NUZIZ0JPZWt5Qlh3czBON24zYzE0a3hqSEhseCtMUWw0SjIxdEU5cnNYbnJX?=
 =?utf-8?B?akVqWURBNUJXa2F0eGZOY0tQVG54eFp3K3g3di9LaGh5MDNFMUlpcGNYWTBB?=
 =?utf-8?B?S1Q0RDFXU1RKUUtUMXlsNE5VWTQ5UzN2R09EQWR3cEdFcEYzU3cwNzNjSTVW?=
 =?utf-8?B?NkhMdWxNZ0lyblZjOUE0QU5FWVhQUndYYlg0V2ZFRWtWcDYwclNtVmFSamt5?=
 =?utf-8?B?ZGNsY2tqOHRqRHFuek1aTkI2UUd3ZGRxSWdUTWxRV1JUZ2F4b0VYbVYyenpJ?=
 =?utf-8?B?QVpReXBJdTVqSkJjNlF5cHJkOW9OclBTNFVQSUFwT3dIOHkva1VNeVpHNndZ?=
 =?utf-8?B?QisyRjFPWE9iZWJ2bHhGZ2doOXh5WVJaQ3MyemlnOGk4S0NKeGJjeG9jaGF1?=
 =?utf-8?B?RFBwWGxEOVVqU2JpUVYxVWx2LzNQejJtUkxZZnVYbC9EQ2NIZE5VK2VyNFJ0?=
 =?utf-8?Q?EgYGEtkW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d064530e-f8bc-4730-38e0-08d8c6cc51f8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 16:13:32.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idi/5UrgMJuAWdYVlFsZ/xbZ/MTvRQ0yXt5NYPFk8nJwcYxKPdS3Rwq7kHyRYEKvQRZmSKImwrwH9/1m+LYu+2v/z9EuGhV7R2bNbnHiXLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384
Received-SPF: pass client-ip=40.107.13.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.02.2021 19:10, Kevin Wolf wrote:
> For -makecheck, the old 'check' implementation skipped the output when
> starting a test. It only had the condensed output at the end of a test.
> 
> testrunner.py prints the normal output when starting a test even for
> -makecheck. This output contains '\r' at the end so that it can be
> overwritten with the result at the end of the test. However, for
> -makecheck this is shorter output in a different format, so effectively
> we end up with garbled output that mixes both output forms.
> 
> Revert to the old behaviour of only printing a message after the test
> had completed in -makecheck mode.
> 
> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 25754e9a09..1fc61fcaa3 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -301,8 +301,10 @@ class TestRunner(ContextManager['TestRunner']):
>           last_el = self.last_elapsed.get(test)
>           start = datetime.datetime.now().strftime('%H:%M:%S')
>   
> -        self.test_print_one_line(test=test, starttime=start, lasttime=last_el,
> -                                 end='\r', test_field_width=test_field_width)
> +        if not self.makecheck:
> +            self.test_print_one_line(test=test, starttime=start,
> +                                     lasttime=last_el, end='\r',
> +                                     test_field_width=test_field_width)
>   
>           res = self.do_run_test(test)
>   
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

