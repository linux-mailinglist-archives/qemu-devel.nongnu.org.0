Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F03468F5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:26:28 +0100 (CET)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmfb-000411-Gx
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmWi-0002jB-PU; Tue, 23 Mar 2021 15:17:22 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:25312 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOmWZ-0005Wc-Gb; Tue, 23 Mar 2021 15:17:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxR1tPcey9OaQIOrpLNWvJGT4y2JdLAcQH39D8gdqKU3TAtitc/ZPrGP2QNM1Ois6CzqRcgwLbJSZc1I0yhGWXOcECERFLdnLr8qtP1fjC2eEm/sjIOXRaorcYHaZY4Rd1zLmT4YkG9L5i3JmVi9G9XKttWaFKR9duzQcG3Q8eyEJJzuaIkvbJ8zQh+UcZLBZ9g/LvBHALE5vvUYMPLhXpEo3QnootLcfGxrjRCKJMzDbSb66bF2XVrfQOUZi3gWnfdUBnwnyd+lqCa4LL/gOIDh6pw53BftZHSlR6wcJtoO4y2wYd2Nz0rR4b84c1ddWRVUyDa+TLFMoWzR/XTEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvAxViCgW3jWI6k/PRyVMvV9CspVlMfpFi9U3KFLJ8M=;
 b=BV/G+5PgQ+W5kx7SrGEbmOLXKc/qjDbLncVxM/icPyURmbzxohdoK5BfaQ1wU+j+myD9oyr0MX0khfIhrFluHKhFFsYt3aNEyXM+VRDcctOHfLVHwEkWaXV7nIS3tka16S5L0cYNWhrlFMVPO15OTE0ULpDcp1sfsEPqH9C+qGGhBGBKdFcgKfqEtDKhqxr7qqnbsQQGtb0ClENzKiry13SMNn8LaFGZPSZkftAI3N+z3pIlAYIVyQlObEAUXIdNX1Pdh+TBqBBz4pI9QSDA4mmBN89TOoNfLaSvTdYy5cFDcjjaVrgNWPxgX9AUZ8dPpDRiOAFQtJxPXeZuWFFciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvAxViCgW3jWI6k/PRyVMvV9CspVlMfpFi9U3KFLJ8M=;
 b=diySfD1FT9h6Wsn/GlzQ/QLGw7/ZaNOB1NB19lQVEbDkj5RnYDiiQe8sKprw0n083n8QjCpo+HYcFClNpV2IGIPV6fkC9By6r+xGNHu+bWECTVtT/HD8ow63KTzl9LiWkIPrSP3wV2efVRMOKxXHenYusZ9WHoJ3twXv3mWKJwg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4788.eurprd08.prod.outlook.com (2603:10a6:20b:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 19:17:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 19:17:03 +0000
Subject: Re: [PATCH v2 2/5] qemu-iotests: allow passing unittest.main
 arguments to the test scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, qemu-block@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210323181928.311862-1-pbonzini@redhat.com>
 <20210323181928.311862-3-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <69c695a1-e0c0-dd5a-7473-0b70ca2becdf@virtuozzo.com>
Date: Tue, 23 Mar 2021 22:17:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323181928.311862-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.22 via Frontend Transport; Tue, 23 Mar 2021 19:17:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67c03895-abea-4780-365e-08d8ee303dba
X-MS-TrafficTypeDiagnostic: AM6PR08MB4788:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4788352BA1C03928B7528776C1649@AM6PR08MB4788.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojFkkA+HVXF1LO2l6rQHdcIU/XsgFPKbYpmuO0QRA81LPOIjuTNsTIQvESh8pxdxxhyuHMjVNkGPmwdREGmyrotd8VxWosFktbXiUPK+2Bwvy4uwQzBH4i5pPrcMAxrDiObDOPUVC0GK9/OyKL4jLueU15/sc1p8E6FWrjpbxJ6p7Y+YHf/RnizgywknzTcyusvfBcYMc+wbXn5qDhT7ff1zJk+Nb4cyupyo6FS3e90JofnjKeO6Y6+a1w91OOaFEDwhxdUvCz9Gw1T6Y7Be/xiNIYbM3kgboqav6/qI/917CukLJ8Iv5/Drg/bqIKc32lZHfJmMM4he2RKjbrpPeL3O2V5IpwCf7CntP3fJtHX7ZKV52lsItoHu9Ji4GgA9hhj15LJqb/TeLJuuNUbw3P/RfREpPoq4kMdzgvwhNNOj9KsOnGUaOA/AlmThDt/IuJDfTVscZQzORc4Vyj+Fcvl4Q1bS29ITBgKFjKVyzcBiujVVId0B3yfSTksE/ZrSxz2tQMUC2WP393i0k2POllfN8VQyTOOlIHkRzPYytysj4KQcaJ8bkOIH8P0ZItP6DlRNnVKtT3b9tRJoIbNIs5/w4cjY/tl1SMwTHjb7scuKM5p3Tx/xEWREA8ds/0A4AAfCM2PAND9jQb8K1qrK96Ow8N7Hyzb+Ot/jyXHH65EFVxWiiq1tWTOv+rwKcnnlfqoPFF5L6IEyZ3gxpq0EzI8hA8Rdaqr24JQu3JIPn/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39830400003)(396003)(66556008)(66476007)(2906002)(31696002)(6486002)(31686004)(86362001)(4326008)(36756003)(478600001)(5660300002)(66946007)(83380400001)(956004)(16576012)(186003)(26005)(316002)(52116002)(2616005)(8936002)(38100700001)(16526019)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3JvbnlCbklPSGNyOCtNS0ZIc09VOEZHdlpRK0VXRWRycHNnNjhsWTk5R1Vp?=
 =?utf-8?B?NHJzcm5FcmFSa21sOFlqaG9UWjIwRXdYU0syWis2amZPenVvTmdrSmxlRzRp?=
 =?utf-8?B?TGxNdWZpQlhleHJXVllhRGhGeU1qM2xScTE1eXZsOTY4dll3VXd4RkxjWk1q?=
 =?utf-8?B?UFZPejhiUGhnUzhpUzQwY1NmUGZnT0xQOGhWWEhvYUVtSWUzVmNNRHNFWWNP?=
 =?utf-8?B?RERhUm5zSWNiakhBa3ppRmxkVXRVL1JJK2FWMjRIWVNtRm94VDVYRXM3Nk9Z?=
 =?utf-8?B?Tk96TEtvUEtNaEdHakRYRXFCclNPcm1jQVR1Y0RlZ3NvU09xSSsvcE5zcVJK?=
 =?utf-8?B?UXE3eHpjdzJjT2ZtM2M4RU9NbG5KWXFMcVlnbjVNOXpNRGhLUUIycjIvTUtw?=
 =?utf-8?B?ZkREYWRJNEVNbUtNYm53cVFpVDI5TWZzb3JYVmJ6WWVRejl6MzkzNzZlV3JK?=
 =?utf-8?B?cHEvOXZnbC9MSFVaSzB5aTNTUVpocG9mWlZOYVVycUx3K2JJTzk5NXVtSmRH?=
 =?utf-8?B?UngvZ1FDb2tuaHpNMlROSm43NHBFenJuM1ZrNWZNN01iUFJnVHlSNGNNTWpn?=
 =?utf-8?B?Q1pORWRmaFdwb0ZRZXJsSGVEbmhMakFIOHdYWHNVeFMwdjYwc3p0UTRoZ1lJ?=
 =?utf-8?B?N1BZZDhFZFRkcnZnM1J4YWM3NkNwRnBvU1VJUnhVTzFESUpRT3N2TnFzbTg1?=
 =?utf-8?B?c1NqdDl5cHp1dVhpVHJYUDdMemtmSUl4TkdEZkJmczJQcUVGMVMwTzRSUkFB?=
 =?utf-8?B?WUtmcklic1lyekVjQmVTbTE5ZmhlV3hLQ1RqOU92MDN1SzA2NkZhK1Q1SVdJ?=
 =?utf-8?B?bjVlOTM4dW1mbXY1c0JjZS9DdDFzSGxhRXkraDBMZkV4Z2JYakVLSm1LaGho?=
 =?utf-8?B?OVJYTG9pQkJtTGZlc2hqRDlwbCtnSDBBR3FOK3pQbDdNK20yZDU5ZklZUUk2?=
 =?utf-8?B?MTBZd2lBUnVOSG5POFhLZjdmNkdaOUdrd1JKU0dJK2Q3RjBUZzFLalBwUFJa?=
 =?utf-8?B?bzVpYlBVWVdXNzVOZGdkZG1QeklPWUpTM0tSeVk4N0VuSEg5blBvTC9iMUx5?=
 =?utf-8?B?NUlHdFlXNkphVXA3dlJUaHJuSUdlQ1pFL3lFeHk4Y25ORW44UVN0VHlEeFBx?=
 =?utf-8?B?SXhaaUxKYjBlWG50djdDSkU1dkRIZ2c4YWl2dk9PelJsWGFxWTIxTno5L05j?=
 =?utf-8?B?cVNEckl3ZWZPMEFwU0NxZjNWbGszTDdFRDkvVm96UEcrYmE4djYwRnFneUo3?=
 =?utf-8?B?WkZMeUZZUWQzOE9hdnc4RVBUaWRnVDVlUUdZcXpTcjhjYXNGb0Z0SFlDbkJ0?=
 =?utf-8?B?S0FaMnlZbUtsc08vdTI4ZGQrV0VGL25yWnFZKzNnV01YQitrQ3VTZ3VIcWRT?=
 =?utf-8?B?THpIYXlUVEdmN011ZkRQZ0pyU09MTGw2ck9tY2FNcmFXUTRNUDZ2Q0FXaWFr?=
 =?utf-8?B?cGRlNnJpai9NYklNTFR6UVIwNWxJTzUyTERPYnFhdnk1V1AydHI4VldVbHpD?=
 =?utf-8?B?VHJDcndsY21IUWdqZXp6S2s4ckZEb3B6bkxNeTdvWlpsenh0ZnhkeVhDUVZ6?=
 =?utf-8?B?SmFrS1dCcnZBOXRXMjRleWMxYjlXNmYyWWkvemFiejYwd1loaXBIekp5akZz?=
 =?utf-8?B?d0NtVGVZTis4Y0VZNWZLRmF5L3RlWmtsTVAySTlhL3JEdTZFSUU2WVdhSncy?=
 =?utf-8?B?cTc1aXlDN0JkZzVvOW5HZUZyRWhadlMyRjZla3J0VGV2dFlULzRWYjh3ZnVB?=
 =?utf-8?Q?nGrkmMXWMRqHEIwpymSRDp3GRmarSZUtXaxKmxR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c03895-abea-4780-365e-08d8ee303dba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 19:17:03.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nfb/HopFXG6Lh2+ihQ4RYQ5gHmz385YQNEQ8GiSzds9x1Lznem6LVbnPyfj0FmESQyfJnZZ4goqnL05xjhUpCepT7BfuRrnO3bXD0PhBeX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4788
Received-SPF: pass client-ip=40.107.20.138;
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

23.03.2021 21:19, Paolo Bonzini wrote:
> Python test scripts that use unittest consist of multiple tests.
> unittest.main allows selecting which tests to run, but currently this
> is not possible because the iotests wrapper ignores sys.argv.
> 
> unittest.main command line options also allow the user to pick the
> desired options for verbosity, failfast mode, etc.  While "-d" is
> currently translated to "-v", it also enables extra debug output,
> and other options are not available at all.
> 
> These command line options only work if the unittest.main testRunner
> argument is a type, rather than a TestRunner instance.  Therefore, pass
> the class name and "verbosity" argument to unittest.main, and adjust for
> the different default warnings between TextTestRunner and unittest.main.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 0521235030..c7915684ba 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -1308,12 +1308,16 @@ def __init__(self, stream: Optional[io.TextIOBase] = None,
>                            resultclass=resultclass,
>                            *args, **kwargs)
>   
> -def execute_unittest(debug=False):
> +def execute_unittest(argv: List[str], debug: bool= False):
>       """Executes unittests within the calling module."""
>   
> -    verbosity = 2 if debug else 1
> -    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
> -    unittest.main(testRunner=runner)
> +    # Some tests have warnings, especially ResourceWarnings for unclosed
> +    # files and sockets.  Ignore them for now to ensure reproducibility of
> +    # the test output.
> +    unittest.main(argv=argv,
> +                  testRunner=ReproducibleTestRunner,
> +                  verbosity=2 if debug else 1,
> +                  warnings=None if sys.warnoptions else 'ignore')
>   
>   def execute_setup_common(supported_fmts: Sequence[str] = (),
>                            supported_platforms: Sequence[str] = (),
> @@ -1350,7 +1354,7 @@ def execute_test(*args, test_function=None, **kwargs):
>   
>       debug = execute_setup_common(*args, **kwargs)
>       if not test_function:
> -        execute_unittest(debug)
> +        execute_unittest(sys.argv, debug)
>       else:
>           test_function()
>   
> 

If you decide to resend for some of my comments (or due to another reviewer be more careful), I think it would be nicer to merge part of this commit which moves us from passing object to passing ReproducibleTestRunner to the previous commit, to not remove line that we've added in the previous commit. And here only add argv argument.


-- 
Best regards,
Vladimir

