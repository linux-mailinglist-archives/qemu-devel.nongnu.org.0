Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51104BFD78
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:50:21 +0100 (CET)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXQi-0003TD-UI
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:50:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXNe-0000iN-38; Tue, 22 Feb 2022 10:47:10 -0500
Received: from [2a01:111:f400:7d00::72c] (port=48480
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMXLy-00009U-C2; Tue, 22 Feb 2022 10:45:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awVEDiCiCmEnSlsHqB1HQLW1pnKpNdk9sQ6JweQUnVZE4WgyOcd+2LKdqoMJ360xylMVHQeM/PZAWtFnndA5Wk8hCfUsZk8kBYp4onuFhA7PMYtDzbxV1PlEeJMdbiNsOGC1H0lKzUgHwfW5cg/fx+GOqPWjredfwYD8MFe/70vWYVCs5CuqV6IM8IBXxdGXA9IhIpbKaBiFMQ4SYB0zSiC4JcA+QD9ZVOeLyjL1e/VcUuikVCDQUVVIbnoyZOwtODnxj0rsFZ6goY5KPR6JSXkY84678BQCjBvkbIrQlyUBMQd+ld4e+ufR+BDYU/0lFp45iqjI5It6JcMNneU2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cJJOtJLqyI3z4VkHUW9O/X6QkNAj4a4t1aKE1bw09c=;
 b=KpqEXNKlg5FO4IwwiLREm3BBB/hZBNDzom3FKIw9qpW5qofwBr2SZlszDfgS5vxto3kXOx2ltz8/ggIRcrLcDjG+61QIdpEH3gFJcTaYZJq/CAAFdfu/VWPEgM617bzcV4/dQ5OkYgs5TlS48dolfBHFq1Lq9sOO68O/A4SdfIttv+hpYXt2ZZvwxP5m2OJ86k61lV7z/yG20xf0O6aA9SzmXyo+yjUU0dJ/uPn9dFDHLe/x0d9aXVdMLVoTe8HAXj9tczhzuEYC4i9FmnbnViZtWMg5rggLzc0H5dN/e57J4lXgxtB2dnd6UnaH4S5NzFYKIYBdi5vgwyh3nZx5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cJJOtJLqyI3z4VkHUW9O/X6QkNAj4a4t1aKE1bw09c=;
 b=rRaq0E12fbRmxjcR/hTxVoWkttZs5ToBm6Ibd4bXThVkPWmYkiE2QH3LvmibN4Wn6mkKOw6lV8K6GzHLv8mtI+HisJ3oaI8VVrhUXPBUGeHPWTY4dcemAAB0/NoK8y0ZZtyXfoO8EPuTY/1IwAWGs9DyJzk9uH5VZY0sENaLtNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB9PR08MB6649.eurprd08.prod.outlook.com (2603:10a6:10:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Tue, 22 Feb
 2022 15:45:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 15:45:20 +0000
Message-ID: <b76eac91-91e3-11a2-e1a8-18709d9d10ba@virtuozzo.com>
Date: Tue, 22 Feb 2022 18:44:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] iotests/065: Check for zstd support
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-2-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220221170845.628429-2-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e495de15-0ef9-41d3-8634-08d9f61a5493
X-MS-TrafficTypeDiagnostic: DB9PR08MB6649:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB6649BFC8F07A87B372876BD9C13B9@DB9PR08MB6649.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIEIEG50ZaBDXbtwYpZcszAZgZilxh9eXOLHJtvT1WtAkKqo/10AKHu+gNMOAJImfWZyikS77KNzJsGLSigvVgdZnuXZy1AEMtiseoziYna21aXd4PxtGoMrOrpomGtXhqn537C6Gj2EOMGarqEwbfRd2FA02VqQjeuXg1K6wG3y8dpN6jL7auj2owARsz9lyzi3zG08wFtBCQJdzoSiiM8cVAgloY5ffo1QijfKE4HMKkUf8t8r7y6XVnevAwnCrTHDPh01IwZAQN0ayM6bbDMw91b0/7Xl75pts+JYM1jXJangUxeFDwGCb9uF7dtTu9puUszCxNrTZwMJ+m4MD863baE5IP7oRZZsa895Hv4LCfl6VaS29t/CK+BM0h74NyRFmUpvO5hZXXq/+oS9N6fHkn5UOFikyTxy0nxu8/+3JDXKx9WCQCVUSUpS7Uf666uSI77kD45jekXIlqn6rzCoR/FUfC2MwR+vWI0rP8/a/iLU/K2rYhWUuiclbBhzZrART9pdLB+EyyG8UCz0Km9zViY0o4ZlKdDAcNESkzFTQ4oIp8xl++tkoozFjfnHses3aK936/a75rptKjUeCeRuQ1COPHkFpYkOq0296xjam7rdoP9eFo0/CH9YjBkcmEsjkHOupI4sxVLDuvTMWoZ7NsMv8F++oRf9TzAF4/lG2AWJk0HGQMewdymUh18/sA5vXnJdANe/GzGSnbA/gao7bkIi5SF7GDoEiIOi8PAJnKIP5MUde3pFenXUY4Y6B0OxI6y4xCJ3f7NOR5gM2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66946007)(66476007)(66556008)(4326008)(8676002)(6486002)(508600001)(2616005)(5660300002)(52116002)(6506007)(6512007)(186003)(83380400001)(26005)(38350700002)(38100700002)(31696002)(86362001)(6666004)(8936002)(36756003)(54906003)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW41U0pNb0lvdEFPQjZCUW9DS3ZwalRsZFI3UDBFdEp5OWlwRG1TQWVlYkph?=
 =?utf-8?B?STcyWnFjamVNdFo2cWRWYnIreG5YK28wRlYxMEJSZTQzREVydnVjbXdSYlNK?=
 =?utf-8?B?b3JMMzcrK3ZZcW11UitkMktudTFvRVFmYW4zS29kZ2E3c0dINnhmU0V1eC9K?=
 =?utf-8?B?SjJOY3pDNmY2M0dWWDliazh2UjB3WHJRekJtVWxIbExBdXF3bS8yS0hvbjlt?=
 =?utf-8?B?YnJoQ1h6UEVuU2FMRFphRzgwdyt6S0tYOWJabTJFZEpiUU1xZ0l6NjhxNFNs?=
 =?utf-8?B?YVFzTjdMOGRxQ3AvMGpLUUVWcjZIMm5raXdVSUlaaG9ESVpVdlI5Rmhlc3NI?=
 =?utf-8?B?TmRHVVQxT3BJWmxiSjF3cy9TWlNqd0NpdVNWbGpaOWZUT2hHMXNuMW9Pd3Bw?=
 =?utf-8?B?OHpyVVF2WFJYNWZFOUhxMENqMjVHYWx2V2p6Z2xFZjc3ZnFLSERCa0MxOEpI?=
 =?utf-8?B?allxc1JLWm0xRVIyd3ZrQ0JiYnVwOXE0MTlzaGxlTW9LbG8zMXBsd3pNSjJ3?=
 =?utf-8?B?NXpWRHB4bGY1OURBcHd3L0VHQVlvbzgxWnZtOXM5S0VlSjlmb1JWQ1JwOEQv?=
 =?utf-8?B?eDFraWZqQzZWU3BMbU1HVGd1WDN5VjcxM2VqVVd0QmNMaGFSeDQrVk05NFVy?=
 =?utf-8?B?ajZDMHhNRDdJYUJvakk0ZkE5Zyt3UDVDVnc2Y1R2am5iQ2JQUllzeFpNbTFv?=
 =?utf-8?B?SGdScjJWQzJqdnFldFhFSTdzWWp3ZkF3ekxuNFhJaTNqNkxLaFBjTW9ERVVa?=
 =?utf-8?B?TnByczk1WlErb2s1MEN0THZ4WkZ0Z044dXNIeW9zci9IZWVQWWMrMVZkUGVj?=
 =?utf-8?B?YjFLS0xMdHk4QzdhY2pUcjNtUlVzN1ZENzJZYmlLQjNZbllmUDBBV2RNZUNO?=
 =?utf-8?B?ajN5bzNSVEVkSFVzVFJrRjZ1KzJoMGJIUGFIRnNRWEp6Szc4cHc1WGVmbXhU?=
 =?utf-8?B?aFBiL2kyeFFTYkpqY0orNURBcHdBaStnRkphc1IzV3R3ZFBkQk5IWjlRd08r?=
 =?utf-8?B?aUxMU2Y0YmtodjR5YzFySTMzTnNLekhQYzUxTmJTc3hPRzRMQ05KaDJGTVJv?=
 =?utf-8?B?Z0FMQ3lOVkszSUt4aWpsTlRZVTlvMzdLNXlGUGVJckwyVnhtVWYwZVhVb0dG?=
 =?utf-8?B?eElqSW9tYnhaVUtLQXQ5cnQ0d0FQR2w2V1BIemQrMGdXMjQ1eVk0Q2VrejBX?=
 =?utf-8?B?by9pd2Q2TVlZb2dhNnljUzRZWmFMdndPamYzUnkvb1NhUzhtSjVwM21wWHYv?=
 =?utf-8?B?dmtaOVd6Z2hsb1g5QlVLM3lKQ3I1eFlGS1pQOHQ2dDY0cGRmcGxqS2IrZnJq?=
 =?utf-8?B?SHN1bW9abC92NSt0MG5OanFXT2dZVk8zSDdsTFJOTXRsZHZvMTI3WVFTV2lz?=
 =?utf-8?B?b2N0a1NBZW5XR3NhZTBqMDBxNXA2L3hJU1kzR1hyb2hZR0UwM2tNbGlSa0tD?=
 =?utf-8?B?ak1KaWRVWmdFSVc0Sy9hc2h0Y2RuQSthNEgxY0h2Y2FVRlRpU3JYcTVPK204?=
 =?utf-8?B?RnV3TG5IQzhuRzk2a1hpNXYyVndqRFVUNUlRNVJ6ME53R3Vsd3lpM0tDQUM0?=
 =?utf-8?B?MHhJU2R0RmwzME1sMGVXMFB3aU5ob0NELzlUSGc1cTc5SUt6K3ZwOWxvNTR6?=
 =?utf-8?B?ZzFlUlJXYVVaNjduOGdXNTBDSXNUOSs0eFJBMXAxak93MWxYNVVlcXVKb2dF?=
 =?utf-8?B?dGFKL0FWUVRLaktJY0tTWUkrRGZBcHNNT3pkNVMxbUZuVGtKaDZ2SnJRZXEw?=
 =?utf-8?B?MEpMZDhwZUZEMTVoTmYwRi9mYlhSYUpSekNwc1FKeFFPbWQxMHNNUUhCVTZH?=
 =?utf-8?B?WWpvZlpnek5raFBLY1hqcGI4eGJEdUN2TUZ6UnNsSUREWmZ3emk5VUFpNzRJ?=
 =?utf-8?B?bVhTcjMyYzE0MGw4SVFydlpEbDZwQ1JmSEVXQm1wOXc3R2s4bWJCOHlEcm8y?=
 =?utf-8?B?M3hlanBBU0plSTEzM0E4c0czbEhQSjUvN3lOUXJrZEVBSElmT3FMcjljdHla?=
 =?utf-8?B?WFJCdVZyTlhraEJRcm5FWUpDZW15T1RJdTA3cHZUanRUNFcydy91RTAvdi9U?=
 =?utf-8?B?aElJbHZwNlJUZW01SU5lSUoyY3F2UGpkNEpmWnUzRkpTTlRDNmtGTTNXNzV4?=
 =?utf-8?B?KytBODUvQW5iUzhJWXdjSUFPbDlHNEJ3SjQxR0tzUDdWZ3lQaDIxQUpVdUdo?=
 =?utf-8?B?MFVXaUx6NytMWUY0UFQ1emoyRU9JeFVXOW9kNVkyVXo2U055L3VUOTUvSElm?=
 =?utf-8?Q?Jbb9FdcE2/WTQppVdLjw7BKzya+o1O6uLbcj4m/znk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e495de15-0ef9-41d3-8634-08d9f61a5493
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:45:19.8953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXVgSxfwwLX8GfbLm6q+jPq67LJ+he1Z7mZcxusqP+pVfbUKRHQH+6nNguYUajb+cFuViCbGbM3CIp4kxTaOmcbmdRGXkLn8iFJkl27EblU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6649
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.02.2022 20:08, Hanna Reitz wrote:
> Some test cases run in iotest 065 require zstd support.  Skip them if
> qemu-img reports it not to be available.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/065 | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
> index f7c1b68dad..b68df84642 100755
> --- a/tests/qemu-iotests/065
> +++ b/tests/qemu-iotests/065
> @@ -24,7 +24,7 @@ import os
>   import re
>   import json
>   import iotests
> -from iotests import qemu_img, qemu_img_pipe
> +from iotests import qemu_img_pipe, qemu_img_pipe_and_status
>   import unittest
>   
>   test_img = os.path.join(iotests.test_dir, 'test.img')
> @@ -35,8 +35,13 @@ class TestImageInfoSpecific(iotests.QMPTestCase):
>       def setUp(self):
>           if self.img_options is None:
>               self.skipTest('Skipping abstract test class')
> -        qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,
> -                 test_img, '128K')
> +        output, status = qemu_img_pipe_and_status('create',
> +                                                  '-f', iotests.imgfmt,
> +                                                  '-o', self.img_options,
> +                                                  test_img, '128K')
> +        if status == 1 and \
> +                "'compression-type' does not accept value 'zstd'" in output:
> +            self.case_skip('zstd compression not supported')
>   
>       def tearDown(self):
>           os.remove(test_img)


Hmm. Actually you fix the commit 12a936171d71f in a meaning that test passes now. But that only stresses the fact that 12a936171d71f brings a degradation in test-count for no-zstd builds. Is it bad?
The simplest solution is to duplicate TestQCow3NotLazy and TestQCow3LazyQMP with s/zstd/zlib/.. More complicated is to add generic function to detect is zstd supported or not, and use zstd in TestQCow3NotLazy and TestQCow3NotLazy only if zstd is supported (and otherwise use zlib).

-- 
Best regards,
Vladimir

