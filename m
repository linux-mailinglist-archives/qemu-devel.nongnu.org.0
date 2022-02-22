Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A044BFC39
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:17:51 +0100 (CET)
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWvG-0002Ay-7g
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMWKp-0006cw-5U; Tue, 22 Feb 2022 09:40:11 -0500
Received: from [2a01:111:f400:fe0c::731] (port=59110
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMWKk-0005Qv-3A; Tue, 22 Feb 2022 09:40:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPPZwzYDFi0xJrr4RnCnWU0YprOVaPqrn6XOZEYiZZj2d0ecEpstCC6e6hQgD/X6/RNJA+7s3714E4JiC/930gaWo2iggfqkfsWsPigFlFwgoVZp1bpq6wYTjMrtjeG3pIyJXv1ujfk1GzHxb7CuhtfRTfG399wH3MeUA7PXCwhac2eFwSU/DmCfhaHyYMV6ZqkAfSxz6PwtW4clYDNcQ6nhI3nEkqjP2E7xEzaQAy4pfoVgH4AeSK4MbPl/vNqya6AxRv5eebhv19MXwgqdhgAX7mTShb0U+ZltF0NqQE1CWyoi/6SHM8WHRBPETp9INVRY4E+HNC9kg/uAcSqGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo0QjBmS9DHqb9JTIWzbIY+auJmcMKPK7v0JLv3jGg8=;
 b=njej7FMIH6ET1Z2k5q0dY0V+iKJoaGqEEO+dVQx/FJ1GRi8jo6ioqubWFTPhPiQyf5qAHKDAnGmCQsN/IxiEVyTEgDl/SlPb60uKv8QIvHb+iEuHQ5PTozLURtHks889gs06b9T4VmSzgYUR0+w9PRMviuWNWo6SjVenV2QK1CR34ixY+hy86JNRHFBBh7/FBQzZYlDBxsIEEqaotwY5nMfUBv7Lscax0+tXFCicMuaRNZL3eIgcFQy7g4Az3JdDt50BEvFwwvHoXxvs38jQwAmuEqpdRg6KNnGsYP4I/ew8Mi7Zp1Kjln1wl7lEAfh4yURj/fk40PG9tROC+Vgl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo0QjBmS9DHqb9JTIWzbIY+auJmcMKPK7v0JLv3jGg8=;
 b=AA6zV5Cuv4L5DKDgD7QjeEY5IvfeK+AIwdQTTedwPTDkANMGKMBxzu+634bEI4crDTjuVS1kyHMekHg4GGvPjn0Gre84Eq9z3LjFXr7AsllHpoWTY9SL9z81cr4un6QDDY2h2vHj3hAyJA7H0As7iMlX8RJi0VB/OBfzMbp4Tz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0801MB1886.eurprd08.prod.outlook.com (2603:10a6:800:8b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 14:39:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 14:39:59 +0000
Message-ID: <4be7a117-3928-5366-52ef-58eaefad528e@virtuozzo.com>
Date: Tue, 22 Feb 2022 17:39:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] iotests: Write test output to TEST_DIR
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220221172909.762858-1-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220221172909.762858-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0026.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd25922-d982-4168-88ed-08d9f611338a
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1886:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0801MB188618785A7D6A706470D5A5C13B9@VI1PR0801MB1886.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: anzPI3IvF7356ZppUN0Perd5hpbtauYWth2+K2jrEdCYSmRxT+RX/k+y+cErFJ2YFd05PD36Y0t42qDjgkr+EeACOlEsafMUEU70nntKxWW3ht1+560Chm4fomgQI/4u7sbEMvnbJXam3ipqFByO6dajHtzdLwgpOZ71+b6Ko3NdL3aCyRX/ADDyZCzxwHdFNEzn/mHY/NXkldWDqA7H4t1n3uUYZFhUtLppkZj3FVtjglWxy5cY9S3/YcZ7D2eXzpFedV1g0UxDLXRkY6fAZA7M1q0cGPxAw2S8oqq20Dll43bTOjtBIN9AIW/leur8Rp9j/oJVHyVkkCcKd1tky9l4yUcuBA5627tIz5+aF3xBjo3MSVyjFEXZ0R4IKSnytMyLboU2V5BVM5SmUt5RfBjWlVY0tDShzOhnbqkzBK2cAmRepi7I94siz05B/8n+kVt1SJjPHnQhiavvmSCoO07S4N3zy+VJSAcDtzsEdf5nAx76IDFenWF/pmiA/ViIVb7wDupayWLW9whiRu3xKAFndLbzcHwYQr6Ou2DCTbzDQ/GSK/J9zociRysKV74Qt4/0mXY53s9rvIteClrQ6Y+BuvTMyOafnUpxr1ANEtDFyAP/pOKMjTTPa/+0WY5G/TUCJDEVA1JmulMDi8shd2aqcmAFa3OLBCIzJUj/DEFG+CNSwqibsJH8mB+KCm3iOlNSiWPQyPFA9mcA2V47iYBQzzg8Mgo8Q/OeheoMryyN0yOylG+3QcsbjodH9LHAPa5C6ASRPN7CIzhRGyAaVIdVjZOS+tK4Y/jWpzpBMyEl/dIF7RVByNTfXNMbsWEF4n0Qhjly5b8aGHUcGqeE7MR97OnOaR6bgrlZPdevDjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(316002)(66556008)(2616005)(5660300002)(31686004)(2906002)(38350700002)(8676002)(66476007)(6506007)(36756003)(6512007)(52116002)(6486002)(966005)(508600001)(38100700002)(8936002)(66946007)(86362001)(26005)(31696002)(4326008)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djZpelhpY1hyZXRlcC83cm10ODB2QVV1SkxrbzVqQjVDSjFBNmh1SVF2Y1Rl?=
 =?utf-8?B?eitCMGpPV1VSOTQxOUZKb1k3bEhjdkVvNG1VbStuMUdiaGpnWnk0VkpXYnM5?=
 =?utf-8?B?NFBydHhvMkxsc250aW8wTXErcm93ZFloa0tHcmRaczE1Z0RFcllqNXpwNEpI?=
 =?utf-8?B?Qld5b0U0NVp0TVFKVEVQYnVZS2RKOXJEVXJzQ1pXOXNSaHNoVkN5RDJHR2RE?=
 =?utf-8?B?UFdxRXFqR1FLekVUbGZwZnY2WUhyZ3JuSHd4ZjdQcDBTaGlZUllwVHVTeDd5?=
 =?utf-8?B?TGYwKzZJSVFKbnI1bWZrSEhmOU1xMGZpalhvWEhBaDRraXBkdG1iazZhUTh3?=
 =?utf-8?B?emVkazhmcitxR2hUb1RwR0lIbGZXR3BOVlZDbHYvWnNEUU0zQUwzUEI5L2VR?=
 =?utf-8?B?T3pSNW1wakFwSWx1MTgxb3IvS2cxdjB5dVJRcEx1Y3BHcXNnSE1sWGlIeTdq?=
 =?utf-8?B?NGVZTEg1dDhZNWhzUFM0ZjlxWHdzcmxpWUtSWWsySGFrUXlaMitJOHd5WEY0?=
 =?utf-8?B?elAxVmh0S0hHZkY2eTM3YjMyTmJBeFF1ajFTN2VJdThYVndXaEFLTG5zSU9s?=
 =?utf-8?B?enhPWk9QL0ticTg0dmt2TENaakMxWmRHbkw2YWlaenBmbUVCL0tBSlNJSXBX?=
 =?utf-8?B?ZVVFQUU5a240ckg0c2NvM3l0Z01ENkl3YzV4WVFpcGNscGY1VXZ2SE95Vito?=
 =?utf-8?B?eGlRZnRDR05EUGdzWWNXRVkzclg0c2plKzA3SEQ3MHBsR0E3SFkwVDhDSWQx?=
 =?utf-8?B?TnIxVUk4ZE1LM20yTTdRbEwvSGoyNEVwZTFFMm5QWUswMzh0YnRIYUFyWEVn?=
 =?utf-8?B?MU9xQ0IwZ1NzL0NNc1ZMbHFBOTB4dk9XRlZ0eUpsWXNiZ2I5V1ZzaG1MMDdT?=
 =?utf-8?B?REFrM3hTRkhEVmNqYUR0N0NhTk5uUnFCaWswSVR3Z0UwOUJkd25KTThzTDFC?=
 =?utf-8?B?c1VPUzFzYVlvMEd5Wm9KWUtndUV2elA4K3hsZmNncjZGWjVGT2c4OFVEb1Rs?=
 =?utf-8?B?d3RiNEEySHJnbEIzZXJHQ0lHd1ZSbFdIR0RrYnQrcXFaWFdtcmx3ajYyRjJN?=
 =?utf-8?B?UVpaeEVHYUllbzI0bTNtVUF6ZnExZGVuaUY5b09RSkhIQ3ptQnZ0dzdvYjFz?=
 =?utf-8?B?Q3lLVFR3TlZKZjBYZEswNFBNK3JraW5ScXNBMkpFNzRnNEc0WDg0TitOQjNj?=
 =?utf-8?B?WFF5VmYrQlFCQmlzTlNOc2pUb3VpOHZTK0YxbHNiUkhoK2pSZmdSQVdnOTVS?=
 =?utf-8?B?VllSYWVYVGhCK2g1YkxmMjJTVTVHVWdoc0g2bDNTb1c2bDRWb2ZnRWt4WVM4?=
 =?utf-8?B?TFlmYnFJWTgxK3JCT0VWUmpRNVNyc21HSVJHVEEvTXU5WU1yY3FwMUZ0ckZI?=
 =?utf-8?B?OGFXbmJ6YXFrY1JSb3QwZlAvWjBYOEJqanFYMUl3RERGd1MzWnI3WTJJcU9t?=
 =?utf-8?B?YUJIU3A3OHFJYkxUdDRrREh4NStWUFVZb0FJbDdvb3dNa1l3RXlhWVAvekhX?=
 =?utf-8?B?ODI3SEFQOTAwNTNpSXBBR3Q5NlZvck9aTEs5bmNadnUzVTlHeHVlNldrWnl5?=
 =?utf-8?B?Q3MxdUhVL01xZ1VzbzljVDBNN1pGREk5ZVdYUE96bTlIVGZOdE1uVWJ5YkdV?=
 =?utf-8?B?NEo5WlJUWWgzN0tsUGc2aXQ5V2ROdyt5UU81KzI5cVdZTU4yamtxTHFJTlVG?=
 =?utf-8?B?NTNPV0V3cEhsMG5LRmRkQkJuekVtTmxLa2dvQmZ0emlwVUpmZVB5bk16cXFZ?=
 =?utf-8?B?ajM1dXRrckhaVXRmckpoVnZnSmZ2T2c5SjdmUnJJTmtNUkFHZVczeUo4N2JZ?=
 =?utf-8?B?bFlMb25zOEhwaW4xNWxwR2pCSTczNkM1M3ZJdXltWlEvS1JoSlBkTzNxcUZK?=
 =?utf-8?B?K1dTbGo2cW90RXlXT2E3V1hkbHk1bWVtbmdyNlhPeXZKREZiWXNRU2V3MjhF?=
 =?utf-8?B?VmpTYjBRT1pvR0wvelBsZlh3Y0svWVV5YllYY1FTR0YvU21uQVpRYk9wWmZp?=
 =?utf-8?B?MVdlV295cGZyZHFsSGQzVi9UUTE2MC9LZ25kVnV3dmFxZTYrNG1kaGdYZTlN?=
 =?utf-8?B?b1UzVkJUSmVjZ1YrVUc4OTdnU3R1SFViMzRYTmh1YnFQcUF4d282SlFuMmQ0?=
 =?utf-8?B?N1hoY0tHRXJ0NWVIVzBPOXZrZm40c3MxaEF3UEx6eHFEempPWU55aHFpQWxK?=
 =?utf-8?B?T0tIR0JybXFRSWJKLzBtOCs4QUZsYkxJMVhaQUdLVXE1dXJuYVJXazE1RXJx?=
 =?utf-8?B?dlBMV0ljd3JUS0NUQnBtOVliNW5BPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd25922-d982-4168-88ed-08d9f611338a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:39:59.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IS2Y712hJlxLDFCSJMmKuX+mFTDCQz4l3LiZX7ZQCIqulZ3No0y0MT8h86eLjxQDIEjGh3XtM2xQS2Q+WdCOOzSlOUoZHbKiQYnqkK4tZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1886
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

21.02.2022 20:29, Hanna Reitz wrote:
> Drop the use of OUTPUT_DIR (test/qemu-iotests under the build
> directory), and instead write test output files (.out.bad, .notrun, and
> .casenotrun) to TEST_DIR.
> 
> With this, the same test can be run concurrently without the separate
> instances interfering, because they will need separate TEST_DIRs anyway.
> Running the same test separately is useful when running the iotests with
> various format/protocol combinations in parallel, or when you just want
> to aggressively exercise a single test (e.g. when it fails only
> sporadically).
> 
> Putting this output into TEST_DIR means that it will stick around for
> inspection after the test run is done (though running the same test in
> the same TEST_DIR will overwrite it, just as it used to be); but given
> that TEST_DIR is a scratch directory, it should be clear that users can
> delete all of its content at any point.  (And if TEST_DIR is on tmpfs,
> it will just disappear on shutdown.)  Contrarily, alternative approaches
> that would put these output files into OUTPUT_DIR with some prefix to
> differentiate between separate test runs might easily lead to cluttering
> OUTPUT_DIR.
> 
> (This change means OUTPUT_DIR is no longer written to by the iotests, so
> we can drop its usage altogether.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v1: https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00675.html
> 
> v2:
> - Delete .casenotrun before running a test: Writes to this file only
>    append data, so if we do not delete it before a test run, it may still
>    contain stale data from a previous run
> - While at it, we might as well delete .notrun, because before this
>    patch, all of .out.bad, .notrun, and .casenotrun are deleted.  (Really
>    no need to delete .out.bad, though, given it is immediately
>    overwritten after where we delete .notrun and .casenotrun.)
> ---
>   tests/qemu-iotests/common.rc     |  6 +++---
>   tests/qemu-iotests/iotests.py    |  5 ++---
>   tests/qemu-iotests/testenv.py    |  5 +----
>   tests/qemu-iotests/testrunner.py | 15 +++++++++------
>   4 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 9885030b43..5bde2415dc 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -726,7 +726,7 @@ _img_info()
>   #
>   _notrun()
>   {
> -    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
> +    echo "$*" >"$TEST_DIR/$seq.notrun"
>       echo "$seq not run: $*"
>       status=0
>       exit
> @@ -738,14 +738,14 @@ _notrun()
>   #
>   _casenotrun()
>   {
> -    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
> +    echo "    [case not run] $*" >>"$TEST_DIR/$seq.casenotrun"
>   }
>   
>   # just plain bail out
>   #
>   _fail()
>   {
> -    echo "$*" | tee -a "$OUTPUT_DIR/$seq.full"
> +    echo "$*" | tee -a "$TEST_DIR/$seq.full"
>       echo "(see $seq.full for details)"
>       status=1
>       exit 1
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 6ba65eb1ff..1d157d1325 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -84,7 +84,6 @@
>   
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
> -output_dir = os.environ.get('OUTPUT_DIR', '.')
>   
>   try:
>       test_dir = os.environ['TEST_DIR']
> @@ -1209,7 +1208,7 @@ def notrun(reason):
>       # Each test in qemu-iotests has a number ("seq")
>       seq = os.path.basename(sys.argv[0])
>   
> -    with open('%s/%s.notrun' % (output_dir, seq), 'w', encoding='utf-8') \
> +    with open('%s/%s.notrun' % (test_dir, seq), 'w', encoding='utf-8') \
>               as outfile:
>           outfile.write(reason + '\n')
>       logger.warning("%s not run: %s", seq, reason)
> @@ -1224,7 +1223,7 @@ def case_notrun(reason):
>       # Each test in qemu-iotests has a number ("seq")
>       seq = os.path.basename(sys.argv[0])
>   
> -    with open('%s/%s.casenotrun' % (output_dir, seq), 'a', encoding='utf-8') \
> +    with open('%s/%s.casenotrun' % (test_dir, seq), 'a', encoding='utf-8') \
>               as outfile:
>           outfile.write('    [case not run] ' + reason + '\n')
>   
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 0f32897fe8..b11e943c8a 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -66,7 +66,7 @@ class TestEnv(ContextManager['TestEnv']):
>       # pylint: disable=too-many-instance-attributes
>   
>       env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
> -                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
> +                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
>                        'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
>                        'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
>                        'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
> @@ -106,7 +106,6 @@ def init_directories(self) -> None:
>                TEST_DIR
>                SOCK_DIR
>                SAMPLE_IMG_DIR
> -             OUTPUT_DIR
>           """
>   
>           # Path where qemu goodies live in this source tree.
> @@ -134,8 +133,6 @@ def init_directories(self) -> None:
>                                           os.path.join(self.source_iotests,
>                                                        'sample_images'))
>   
> -        self.output_dir = os.getcwd()  # OUTPUT_DIR
> -
>       def init_binaries(self) -> None:
>           """Init binary path variables:
>                PYTHON (for bash tests)
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 0eace147b8..262b13004d 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -259,9 +259,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>           """
>   
>           f_test = Path(test)
> -        f_bad = Path(f_test.name + '.out.bad')
> -        f_notrun = Path(f_test.name + '.notrun')
> -        f_casenotrun = Path(f_test.name + '.casenotrun')
>           f_reference = Path(self.find_reference(test))
>   
>           if not f_test.exists():
> @@ -276,9 +273,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>                                 description='No qualified output '
>                                             f'(expected {f_reference})')
>   
> -        for p in (f_bad, f_notrun, f_casenotrun):
> -            silent_unlink(p)
> -
>           args = [str(f_test.resolve())]
>           env = self.env.prepare_subprocess(args)
>           if mp:
> @@ -288,6 +282,15 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>                   env[d] = os.path.join(env[d], f_test.name)
>                   Path(env[d]).mkdir(parents=True, exist_ok=True)
>   
> +        test_dir = env['TEST_DIR']
> +        f_bad = Path(os.path.join(test_dir, f_test.name + '.out.bad'))
> +        f_notrun = Path(os.path.join(test_dir, f_test.name + '.notrun'))
> +        f_casenotrun = Path(os.path.join(test_dir,
> +                                         f_test.name + '.casenotrun'))

You don't need os.path.join inside Path(), simple

  Path(test_dir, f_test.name + '...')

should work.

> +
> +        for p in (f_notrun, f_casenotrun):
> +            silent_unlink(p)

Why don't you want to remove old f_bad too, like pre-patch?

> +
>           t0 = time.time()
>           with f_bad.open('w', encoding="utf-8") as f:
>               with subprocess.Popen(args, cwd=str(f_test.parent), env=env,


-- 
Best regards,
Vladimir

