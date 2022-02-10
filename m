Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80274B150D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:14:42 +0100 (CET)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDxp-0002Qw-H6
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAjk-000153-Go; Thu, 10 Feb 2022 09:47:56 -0500
Received: from [2a01:111:f400:fe05::712] (port=53866
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAji-00037a-4b; Thu, 10 Feb 2022 09:47:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDX7/jccv2QNbLhbf7glqGTLX0IOiNSHeQ63jmd2U4YSnflruzxh9igsRCq44ROn/5BuaFoMbmIxSQn0mnSB36FSNAHMqLi3xTdkFxD7nfFiwSoczDpwfT6SStcEFYyCaAq6sUoxypZw4M9HHQN5KEUXYrflwwPZ9lmEBM4fusy5u2qE6hz/pq1BCJBL+lp3wQjVDbTwlvbnPUQ4+t5HWc35lTaa/h4lTEAW7GIc+4c+Kt0d/wXAF3ndQw3WVtfANlLW2zibGvMu9gQmj+ogG0tTbSxyT2E26CvGwtdqaPqN8jRbTGGNIJU0d/pLmVvnKkaC06c8REl8tZMidnizog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfxYN82jIGWEMDgeIeWapJ8ib9DplgTSVH8Ts8G8wU0=;
 b=Ovmtp9Ov1Afe/Z/dqal1lbBWeM4+WTWNJk8WuipPoGPfoKVXkTQkQrR+2oHlVNC4PxZ+ubtIac49quasVJqaxCrC6ekYGZuHLVhMyiM6msL6ah8nlWji1rNgJBVOa5GDNs9nn2IiUFiKiKnPiRECSDJQ68c6/xmqKFVe+Rl3P7318zhcbVUyUWWJ2jdhQLZQ9FZOP25/NaFNOwvUqqL82XEW8Z3HTLG2eM3IK2FE63KJTf+dVAs/rjq6XoulyLJRwowpaTMn2dbG8i/L1EKCIGuM8iFUlTb6aaNz/tRYhrCDyoNLknN1IG7AO7SIq1Ks/t9iR9GJs1EnM2Yru5p4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfxYN82jIGWEMDgeIeWapJ8ib9DplgTSVH8Ts8G8wU0=;
 b=uRg6jZulQWvMTiyzqw73MKm+qB+827E6IDioqqGVHkE6mRvGAs+VfyLe/jjdNU08g87Dtsp9f3pDqkddOL238zIC2CAMYb0ReQ+UBHK46lvAek/FyY8Ixsn+kr5OO69rQiEdAQpaWkoyNe4nGEd1bixTXtXHq/9AVX/O8bFchm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3147.eurprd08.prod.outlook.com (2603:10a6:5:1d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Thu, 10 Feb
 2022 14:47:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 14:47:50 +0000
Message-ID: <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
Date: Thu, 10 Feb 2022 17:47:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a0616de-720d-4406-69f9-08d9eca44f54
X-MS-TrafficTypeDiagnostic: DB7PR08MB3147:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3147FF34A6101754D9D4076FC12F9@DB7PR08MB3147.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYl5KTW4fdepZ4ALWWiwPARjbDZQDPOG8yCnAUNQ/KT8IhYSUuZFoTTvl08pii+W6CSix7+YoGvPbZ7in08DTFFml+mhipUQiuM5EqL3GOmrLrtlBrP/l16pkN/GeCUY1wpRY64z5i1CEllug8+dFHbgfrN4ZEjYx/Ku1Y2aS53IUFLABINNtzXCAMRcahj/fWEOZ2sWT9IaENC78L9UQxhBW+XjsxUz7d4kJM1KUXkPZrtzbLyBPjnlEAXjuaQ1ePv4AM22h5HPoVo5jm8qGuSOz5ZC67hDva/AyWxg0DsztUHv77qDAUQXv6dWkkzK/mnoF9hDhy+C/vYadte/1d3yiKzzjd0ipgNVRtBN8wSYhkI8A2tojrNax1mO3n1Sph8dI81tZ+0lKkHm5s6chU70YdeVagq4/0YbzEWpzoEZ5i5AMw5Z7niZcnsh3GK5NRXbdWWf0K9CV621jL+uy+/i+h6ikeacY/OlkcfFQzLLelf5egV5qG8P0Fxr8R1k3Ex/DwigR4ZkJT4Vkg/tcX5qjX1hWX6a1TclS1iMaU8cNcUCN8ouGps9n/Q0Yj++d3U7gmgdIh9rxysIFnK41esAoQ44Co8lh28UtZCi3Ai2A+b7PSkv70n3SjY2KOWwIvh0iG+HhS9LTCKNmKbF/z5Un9jPjTZOFc2XlbmKgOtdqFsEpqV3mA7wIVf+zx0ZHshXbLdCEQF0RMW8ZmuK1zblqqpS6Y7ubAlyqQqVWe0DPE9jg/vGD51YNjGpb/z470a4ifuSy74WzL9BAxI4ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(83380400001)(38350700002)(316002)(8676002)(38100700002)(31696002)(508600001)(6512007)(6506007)(6666004)(6486002)(31686004)(26005)(186003)(86362001)(8936002)(66476007)(2906002)(52116002)(110136005)(66556008)(2616005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFITkFqSmlKL2tnT0NRcUpRMGNYZW9CRmpqbGVCT2dmNmpzWU92RkdUMEdB?=
 =?utf-8?B?dGh5Wjh0dXRTYlZEeE5YZE1CYVpGeGRVTmJKR0NtNGYrblRGaGVEbVRIM0lB?=
 =?utf-8?B?TFVFblBjT3E4cTJCS09yVUxUZ01LMTJJMERTdnpwd3lnb1ptR2hNeVVHNS90?=
 =?utf-8?B?ME0xZG5FNFk2TC9WOG15bHVtUzZiblU1SjM5S3VPVHZuZFNGMnBndDlaT1Bp?=
 =?utf-8?B?OW9DcVBNWVczMjVBazRGb0FxWlFtaGkvNmFNT1hENk40T1RyK0lNSVVYTkNN?=
 =?utf-8?B?UGw3ZFE1TFRXeUhVUWk3bHVseEJyem1IMjlDVDJtS2RtYTFFN1ppakUrYldn?=
 =?utf-8?B?eC9ya2oxQXpnczR1N3Fhb0F0dEJOaGNiZkdTdU4vZkIvSXBxNVZjYXdTOUhh?=
 =?utf-8?B?eXJwZEJZN3JVeFlvZzNOQitIVWtDUUd6bDVKZFRURnJJSHlKOXZUVys0WlhZ?=
 =?utf-8?B?SUFVUUo0YmRtSW1Cbll1d3ZWK3h6aEVsdUNRSzNDRFJSK3VRTGZXYjFGNFk0?=
 =?utf-8?B?TERmbWpJK29FNXRrd28yZG82T1ZMS1J3c3VhYTVkRWV4Tk1GSkluR2J4NTh5?=
 =?utf-8?B?VEc4S3g4MTdYWE90bEg0QmNPV2dPcXY1WjFLUWd1QVJ6aE9RSEF0MDdpUE50?=
 =?utf-8?B?QmVGYTUya2NLZ0xUNm9xTndSZ0JpSis5YXlCTjN5ZEpWSTJQUVh6Y2lPaE9i?=
 =?utf-8?B?VlVYcFNZSHFwbXVmOVBYU3RKNVd6SnUvSlVoZFR5Q1c5NjIxMHl4bXdITVNh?=
 =?utf-8?B?eVQ3dUVWdzM4R0Q0YnU0Vk1uSVZWK0dYUG4yMEI4MDEyck1RaWlvanRyQkFw?=
 =?utf-8?B?NUh1VmhtNzdFbWw1UzltdWx5aVVtWnJDOTAwLzJyYTJzRGhROHFHUWhENys1?=
 =?utf-8?B?ZVRuK2xwdUxVcHR4QVFtMGtCZTlGSitEai9kbElRWmFQS0VuRGR0UzhWVDVR?=
 =?utf-8?B?M2JOV0tWTVRYKzFsREc4YnNFSEZWY2ZvRHRVWHI2VTluNmIvbjJXamsxM1FP?=
 =?utf-8?B?cEhPQXRodGFPQkwyaW9Ea1ByaXcrTVN1eXNsenJyT0pFRGMyRTM5K2lmRm1V?=
 =?utf-8?B?eGplVWYybnFGZXcxa2gyT2JGeFRxZ2NIM09MSWJCNUZyTzAzVzB4SEFHYjQ2?=
 =?utf-8?B?MDAvb0pZQUlvREpWbERpdER0MThJZ0xjVmhScmgvcnFyZE8xSXU4NWluTDNO?=
 =?utf-8?B?djRRYTUyOWFhcEljY0xVUG4zYmtDNldsbklWSkxvNUZ0ZWt4NzNQaDhFa005?=
 =?utf-8?B?WkhSQ2VDbFRvWDJIZTE2UFNhK2FHSDZPTUVvcGN6T3VQeFVaQTNNNUFNd0NB?=
 =?utf-8?B?OUhzOWJDUVVubTFIbGtocGpHbFhZbXNkMkk0bkNsQk9RZXovYTFRTXdOSG4y?=
 =?utf-8?B?S05TcVBTeURWQnk4VG9ZQnVPVU93ejIvd2F6cUpCUEw4bWRuUWhQV3NFd2k5?=
 =?utf-8?B?bUFGbzFYcFdlYWFtU2JITFFpWlRlcHU5ejIwS0EwbkFZZjlSc2JhTnU4bFk2?=
 =?utf-8?B?dnpuZVlwK2Mzc0wyaWVSeDloL2NIdVc0RHZJL0hMWGQvZS83c1JXYkhzeHJX?=
 =?utf-8?B?dERDWEJ1eFcvd0l4SjNTZnVPQzErczV1SDJtUXNEVWkycEtsRXM0NWUycW9U?=
 =?utf-8?B?TmN5Sm5vTjQzZE9aaXRZeWpZSWtrQm5KWVdQNkVxNWNKcjZzdUFKUUN0SlIz?=
 =?utf-8?B?NWhiTTF0RlNETFZQWWJXb3RaNkpocHNSQmgzY0ZocGYxUkV4bzJlT1lSLzNs?=
 =?utf-8?B?SFVlQ3k1d1VneWZOQVM5Vi9XbEN0SnZDVitKcStEd3VQRDdXd2crYjNOUGR4?=
 =?utf-8?B?UHd0S0gzWk5tS1BOR1R0NnQ5eFBLbi8rblVJVmRhWnlDZGFzMjN3VEg4aTQx?=
 =?utf-8?B?NldvUEdBczU1YU53cGRPVGJ4cURrZE4wTGdZaGxIS0VRbGVySjMrVFppM2NY?=
 =?utf-8?B?Vk1IRGx3NGpEdi82MzVrMVhzYkVTMDU0WEZlTUlEUSthSEgwNFBGblhYUUcx?=
 =?utf-8?B?UllRUHdZc2dPdysrS0xqMk1MdDBoUnJYVVNyKzQ5aVliWkcyb0cvSk5XZ3cv?=
 =?utf-8?B?Z2pma1FhQ1gzd1cyY1BYY1M1bER2MVR3aHJ3SFFUNVNqeGo3bDJjZFNiNGZT?=
 =?utf-8?B?SFZuQkZkSFFWQUlrd2VGUHg3cGZNQWlXbW1sTmcyUGNBcStJclR2cDY2NTdF?=
 =?utf-8?B?SWQ3eXA0R3JLazR5TU5zVjVkQ05UR0VpWXhSTzNiK3ZGSDlRTFhiOFhvZ0NU?=
 =?utf-8?B?SkpTdHJ0Vkt3czdMeEUraUtjbE93PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0616de-720d-4406-69f9-08d9eca44f54
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:47:50.0453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu75CMTflDBToAoMM5C5Hxgoxb90f5Bz0FmxBp4c81/u+YjaLTr90rz607lrY7XOiwGAK0VqOxGtKGlSsyk0Dpz9l9DNmxfYOluE0Khiyhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3147
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe05::712
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe05::712;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

10.02.2022 10:57, Christian Borntraeger wrote:
> Hello,
> 
> I do see spurious failures of 161 in our CI, but only when I use
> make check with parallelism (-j).
> I have not yet figured out which other testcase could interfere
> 
> @@ -34,6 +34,8 @@
>   *** Commit and then change an option on the backing file
> 
>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
> +Is another process using the image [TEST_DIR/t.IMGFMT.base]?
>   Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
>   { 'execute': 'qmp_capabilities' }
> 
> 
> any ideas?
> 

Hmm, interesting.. Is it always 161 and always exactly this diff?

First, this place in 161 is usual: we just create and image, like in many other tests.

Second, why _make_test_img trigger "Failed to get write lock"? It should just create an image. Hmm. And probably starts QSD if protocol is fuse. So, that start of QSD may probably fail.. Is that the case? What is image format and protocol used in test run?

But anyway, tests running in parallel should not break each other as each test has own TEST_DIR and SOCK_DIR..

-- 
Best regards,
Vladimir

