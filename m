Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A30C3468DA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:22:18 +0100 (CET)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmbZ-0006Lp-Eq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmRv-0003cE-7V; Tue, 23 Mar 2021 15:12:19 -0400
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:27955 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmRk-0002RT-Mi; Tue, 23 Mar 2021 15:12:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaucUP7zMmDGsKvSmFk0fvk0LdVNM60CMB2hD2P05/CQ1Tf0DkCk2Jv1fBIo2LOm6iYf4Mt8XZQIACYfsyxZc08mD1JSGQl1xlq82W1mhFk5BTPxhBSo0NmJJUEx6znS0JI6g3pgeJp4pWArBsfNV7vUj9zaMFz3jWLTVz0V10DbLo/Z4NZhMDvw88r3wNj9LZ7SU8yq58nZOpsrnQ4873W1LVAk+CWSehe8kqL19VdtLMyxXxJ41Mf8qLeJ19Qeju7DYSzWLvH13Oq4bEezrQJ4ZLNuX6+xPb30kL5Ape+nEJd+7aFf/sb0txYQJgbzhZpgqS+hFSwAPIeeJD7iPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6eLo1IbpKXNOqZk5EPvJ1NrB9KLfGG05nFYGN4eRS8=;
 b=mdkNhMFF1KphvEmNnNeNolr48GFWe1xWu5BNQLZ4UfPjEC9n2ygPYNGOQKrC/z/Hg+w9xI0fhOzIFbK2E1Dnvrf4MOuUtShvwa/OIMqfOnhmHQwIiLa94c3pSGTXBg/1eWmyqqSSDMT+0dno1rzodwPAOw20ICOqpHckNtyvAOWP7UB7mSVT3NXbyh5Leg52JsVaTTE9bPu37EeMJlNDtZQDRQzJTOhjnZ07ZH6coaKn+kpBxBRVTR27/3obGbensR8ZJdOqfh0iDRNPD6hkKLD4VQbq5sWUvzx9b9Un4On/eHpc+hk/1VbGp4llNbtYdZmzj+7c6UyTeMHNCbnHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6eLo1IbpKXNOqZk5EPvJ1NrB9KLfGG05nFYGN4eRS8=;
 b=DbozyCTF5XUibAet1w9Kv3eFfNKlGo7Y+qOkX2q4SkXR7jCMOr9HAhLQorqfNw91zv+uQnLm4cOxl4rkRnDojrUf3t8VP/js54w5k+QT/mzz1yiBmPccbMlnYq2R+21mT2JdxFH2auJwKlt3YPPG5jUQC70c3UAWamv8ziOGMMI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 19:12:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 19:12:04 +0000
Subject: Re: [PATCH v2 4/5] qemu-iotests: let "check" spawn an arbitrary test
 command
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-5-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5ba856d3-8325-dc28-4806-7f5cce4d5522@virtuozzo.com>
Date: Tue, 23 Mar 2021 22:12:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323181928.311862-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 19:12:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1343e056-e571-4645-6764-08d8ee2f8b2f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190730D18EA5DEC39D6C153DC1649@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTzoaFsmngrmCodspY4l2kttbC7kJDZ1jGrrJFmDGEj548NqqpmLhZJ0ciquOYoU8CQ+h9fM8zkSFYONfve7hcqVTrO+zx9+Rjz9rPkQfoCFwh1z/4WO5VAwLC/vES4qLrTAX4puU/xvfWLJn2P+OcT0Eqog6XSIk9R7Vg4xqPf8Lz3XKvuTlpb9jDnVbp8E1N7RsK79Y8nLOBAdHWSkkQF3FVGrCS0G6VfR9VBZ+rzeW/gaBzv1K+b7sB/Pyrwi8Cv10c+fqyVQ/i6jAqx7dxF/szJYo07ApLKwhSUvGLO22vVpXXP/43GlehvGGxFp4ODHxC37jhJn/6YChKf5O4rvbMwaW77G098qIr9bBQO7lfs2PYh6QH8kI/aKbEP+hSrvjAFYkolb6fdxWM7PpOSpoLWoATo9a0316bQmQxbkmuf8k3WfOFu5l1+oSLPfovP/95atsUlD8o4wdRHtSOPDNTRFSddam3IaGgBEqxrtE2C1vXlgMXd0vJttX0pivYjZ1g3zy09TXCByI/y+rPatq4Fc0k9ER2DEAA+ebwIw6Mk8NQSkf39O1CwcYXJc/1gZoKQxTKkRUi5BMg7wetvPLdy+T2zKcdQ/50PnobO0YERKMGoIxS6YBAvY8JpJKwwoDcLqjPUxBVQv5VPTPlqUiAkAaOA/akWnbEzyKovaRXPkhmqRscri1ulWwSKnngXmjMqjCy2VT0mrKsPiaHg7UN97QnNihRWvPfzoOe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39830400003)(16576012)(16526019)(2616005)(36756003)(956004)(186003)(6486002)(2906002)(316002)(26005)(66946007)(66476007)(52116002)(5660300002)(8676002)(83380400001)(31696002)(4326008)(8936002)(31686004)(66556008)(478600001)(38100700001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTZPcjJMelJNazRjN0V2a2dRb08wU0o5WWhrZ1JINWxSTWdvN2RKMWZiOVpG?=
 =?utf-8?B?cVM3cktGVUJ3bjVDVGcrNHlxTU1kWTlBOTBBbHhRTkc4cEVWeUlLbGsxcDhi?=
 =?utf-8?B?a3UwUzByeStES1hoTk9vcVpsdnVMRHVDWlJjUEVzektMRzVmRHFlckprTzRM?=
 =?utf-8?B?N2JZeTNpajlhTU80WTFMQjFQMXFZY3ZvRlBaUHkyalVxNUJBaXJ3SitLTURV?=
 =?utf-8?B?ZnNVenQySkhLY1JaU3NyZmx6NmpidHJvWEE0R2lGQVBrL0tLNjRUUHg3T0JM?=
 =?utf-8?B?VG9RMXkvcVEwcEZWU3VZM2k4dW1zWFRUT3VxVHNmbDR2alJqM0tPYTBpSHl1?=
 =?utf-8?B?R3NUdmFpKzJncDBtQ3lxWVNNWDZrcDdhRTh2eDhPK3p6WkVKb3BDL2xSOTVD?=
 =?utf-8?B?NmFnTkp2NCtPODhZQThFSkxuWDdCYmJIWFhMMS90UHdabFU5TFVTREhJMkI4?=
 =?utf-8?B?OFRIRFpvRXo5Z0pLc1NtVHZoNjZ0ZTRjNDFaRnMwTVd3alByQWtHYzY3TWJE?=
 =?utf-8?B?TVJlZWNyenhrZ2pKS1RoODMxQkpua3FVZ2szdjVBUkVKdGorT05sYS9wMjQy?=
 =?utf-8?B?dW5IOFBkQ2gvbGZZakhHdHlQdDVKVmVOQnBDd2tUdGVteE5Ha0I0emgxUXlI?=
 =?utf-8?B?Nm10V0UvRDVYdUN2Z3VzcnJ4dkVIS2o1M0liQ2FJSXpNQ2l4SUNNWDJwVHMw?=
 =?utf-8?B?MVJSVlBZZ3V6TTFiQlF5dXg0Mkx2S2JQSStaUytMUU5KSEtRN3Y4QmNENExj?=
 =?utf-8?B?MTl1cTR6TFlhTWE2WisySzJsRXVnSk1OdmVPQXlVWFZYems2b0NNWkkvTGEw?=
 =?utf-8?B?WTJ6OE1RdWZOOVIxRnpqQ251MCtzcnVGN3ZUMDZVQWlYOWdSQzRZQ1dvL3Er?=
 =?utf-8?B?S0p1VEFaVFJNZVlaR1ZtNm5NcEdKOGc2STVDQmttUWJXSVJYWGZpcXhwVkVt?=
 =?utf-8?B?NCsxMlkvL2hvRjBTejZCNEx4TSsxM2lnOXR3RHlmNHJDN1VHRGFITUxDSjdu?=
 =?utf-8?B?NXpiaVUyc2xicFlWZFVSNXJsTzNETXRzczl5ZklEK0pEZlhDWDc2TXlBdGN1?=
 =?utf-8?B?anpzS0RHaXdRcEgzUzB3dE14T2xvRk5ScEZpSUhaMTNpYkpsTGdSMnh0bzMy?=
 =?utf-8?B?N1JwM3NBdktVNlVBZURUYVNvdkpmenhOOWJFSzU2WU4reDNxbUVyZGFWYnBB?=
 =?utf-8?B?cnA3cEpzQTlNeDdJQVJ6dVNULzVWbThsY3BManRMWnVHTVd1YXNEMXJ4bkVt?=
 =?utf-8?B?QWRFeG9nV01FRVkrckgxZHlLNDZTNnFyakJHK01HbFByVERIZG1PUHRTZWYv?=
 =?utf-8?B?c0tRYUV4RFh5NkZ3RkN6NU5ZRUZrTTZjVkowK3J3L1Q3RlV1WnhyOGtRVVJC?=
 =?utf-8?B?RGZpSmg4VU93bmxZVTdnN0hxNFdoZmdWWFc3aTVyTVBxNWMwMG1ZME80YjVS?=
 =?utf-8?B?Ymc2aXkzUVlHK05rNGYwOVNiTUMwdzA2WlpFMlYwVkx5NStaamRtSHhCSUQw?=
 =?utf-8?B?MmxNR0ZKOU9OY25zcXlWQzVKVlBxeWNlemRmVEFxTHgyanV5ZjRhVFZjc0Y1?=
 =?utf-8?B?WG53QWVJOHRvZnJpb083ZklZK3lxMEVrQWUwclFibVJqUnZ6em02WENlMmNs?=
 =?utf-8?B?R3FPTCtXU3AxK2hYSTBWdExPUnVmSnFoZUViYkw5Z2xKKzFucDJGOXU3bEwz?=
 =?utf-8?B?YTM3cUJpZlg1K1Ywb1YzcjhIZXlCbHhaYmJwTEM0OTRvVERxR2hRQ3ltc2xp?=
 =?utf-8?Q?qOFTXDvLncmpzWO40iDkQIqBt9iucJr2hyrw+q3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1343e056-e571-4645-6764-08d8ee2f8b2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 19:12:03.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ygk+CuqDFaSO8nEqfEWN0BJ1b7Yn4TCfXAHNriEgCff6Oyyg5sfxZuKfN/e8HBeHlnUe3D8X7uKqhB5ug2nW8MazMVjLGKIm41PjxF50Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.7.91;
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

23.03.2021 21:19, Paolo Bonzini wrote:
> Right now there is no easy way for "check" to print a reproducer command.
> Because such a reproducer command line would be huge, we can instead teach
> check to start a command of our choice.  This can be for example a Python
> unit test with arguments to only run a specific subtest.
> 
> Move the trailing empty line to print_env(), since it always looks better
> and one caller was not adding it.

Seems you've moved this fix from one unrelated commit to another.. And it touches two extra files. I'd just make it a separate commit. Nitpicking. Separate or as is:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/check         | 15 ++++++++++++++-
>   tests/qemu-iotests/testenv.py    |  3 ++-
>   tests/qemu-iotests/testrunner.py |  1 -
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..478d74e509 100755
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
> @@ -101,7 +102,7 @@ def make_argparser() -> argparse.ArgumentParser:
>                          'rerun failed ./check command, starting from the '
>                          'middle of the process.')
>       g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
> -                       help='tests to run')
> +                       help='tests to run, or "--" followed by a command')
>   
>       return p
>   
> @@ -114,6 +115,18 @@ if __name__ == '__main__':
>                     imgopts=args.imgopts, misalign=args.misalign,
>                     debug=args.debug, valgrind=args.valgrind)
>   
> +    if len(sys.argv) > 1 and sys.argv[-len(args.tests)-1] == '--':
> +        if not args.tests:
> +            sys.exit("missing command after '--'")
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
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 341a4af4e9..6767eeeb25 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -283,7 +283,8 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +"""
>   
>           args = collections.defaultdict(str, self.get_env())
>   
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 519924dc81..2f56ac545d 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -316,7 +316,6 @@ def run_tests(self, tests: List[str]) -> bool:
>   
>           if not self.makecheck:
>               self.env.print_env()
> -            print()
>   
>           test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
>   
> 


-- 
Best regards,
Vladimir

