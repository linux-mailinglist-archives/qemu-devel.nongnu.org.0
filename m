Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609CA47FC85
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 13:15:01 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1ou4-0004M7-2O
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 07:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n1osz-0003Yk-Gb; Mon, 27 Dec 2021 07:13:53 -0500
Received: from mail-db8eur05on2133.outbound.protection.outlook.com
 ([40.107.20.133]:52320 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n1osx-0000Xn-2R; Mon, 27 Dec 2021 07:13:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbM7FefWKXwYn5loNJoTdHOEcThcbCFAMc0+zig3zvz+wW5C0Fh16KOCeApBgpc/ZPmOnUrsxchSm1Urez+2llQ/fdgvBUUw/aBV4lm/zjjpKQ6zsLzvo62LKjAJ64FPKOc5VfnnYodyggZAlocNm/j5m8unFUIRbkG0OZnwEJm4LAJ3fZjwlsru4859N2JeL2MZyPGVVwgNDIl0MC52Km0TvRfNe0aBppsJ0uoskc04K5C0cOBKEjbzcP8duTIXKdfAyTp9Qh6lijZoeib6YIReL42SYh8S7korx51dlsVMSW2AhaAsbLCUXPYSHSTJ+jO5nuQrHVDtFfa+IHCe6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNtkAQh7WKwovvSFiXWoapxCwm9pdREZjQEBnGJwVMk=;
 b=jqNa97W8bz9G1gPX32soQ9Op4laPNqRX8sv3Ig670uO8L23ZMUgji5dUQL22Y4cNVfbTMImcnJ7YYw7hSYbeQ+eRrEuGrnmIROQP7ShNex/rY8Q38bCpOVKcZ6xGKgT8VxSB3XnWPfLtz8bVQgDFFub70sgoTtGYrNkBLUpKRb+R1/vU5AkC1aMk37OZ36lCUfE8V7LMZ5aphwXmIna01tWcoI0oDn03ztbcv+ixXjpZqaYMEz/7njlbHOPb+AAzhHSf+D/ulu67YHtHvsY1S+rQHFtE4hFNbfiFQTDe3f8fUkCMnnoemzhsBOpIiPks0nzADtn0OUtXv9Dxb2tpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNtkAQh7WKwovvSFiXWoapxCwm9pdREZjQEBnGJwVMk=;
 b=lz2nndCIVHsi7V4rJ5gt7iYtbZmhAtxQYM9DX4TGuCz1CTtyFSKai5odk5JO6BVH+ERMFHcfE0EVK9gRTG4hiuusJ20kZ1ucYUhe1CKXVSLVAIzLIYVLznbTSbBQ3znhsMoOvSm3EH/OpR+AEXeFpxYGZsK2YGJsTRCkMuHGF/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25)
 by DB8PR08MB5435.eurprd08.prod.outlook.com (2603:10a6:10:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Mon, 27 Dec
 2021 12:13:46 +0000
Received: from DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461]) by DB7PR08MB3484.eurprd08.prod.outlook.com
 ([fe80::55e1:e502:c66f:7461%5]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 12:13:46 +0000
Content-Type: multipart/alternative;
 boundary="------------vdkpy1TgkgC00LSA1nRetHhL"
Message-ID: <946b2758-c921-4efd-efee-6c052c04d839@virtuozzo.com>
Date: Mon, 27 Dec 2021 15:13:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/5] block-job: drop BlockJob.blk
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
From: Nikta Lapshin <nikita.lapshin@virtuozzo.com>
In-Reply-To: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
X-ClientProxiedBy: AM6PR0202CA0047.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::24) To DB7PR08MB3484.eurprd08.prod.outlook.com
 (2603:10a6:10:45::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae52a90b-44c0-40e5-0032-08d9c93254cd
X-MS-TrafficTypeDiagnostic: DB8PR08MB5435:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB54355937AAE879CCC4DFD2D086429@DB8PR08MB5435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjXdCyvaGZMiI4WJdxKZ7ZvbheKky6DPVL0RLV7oTg0hluxe9aGJ+Dxj5x+wwI80A7AG4cVSP+j50bK4yDRSj8Vhy4WYp1JWw2X5PPT6Cn0fouSXmdSj61iwaZsn+Ld/wBf6rJNxvyXYfD+LW6bCg92yEUL4Gn2VJnw5jbOlsntUyVOprEPZqb6VW1txgNpSJhc6uzXMJt9jRLQq3B+/sOios9JnUgl5ce8SSSQ0dniQ7LQ+nDeMwXjiHF2CkaUMmhz9XWQTNM+XQbDOfYDT8LMgkQqRqAD9yOUDXbU3YzYhNytEbmP6F1zZL5Ud5SvBIo+Y9rmZBhFd7RgM3ehw9oOsZI96DcU8hUl69a3Zlhg7NGMi3i2RgKH0v3f+5dpPLl5IYLWbqPcdF6kbbczRGG+80yhPGVsNsClFqABieaufR8Z6QSIa+9Myu3rSyf5uRG3rRkXSAtpMoZCHHxX/LcGxsMzTDkKijGvkOnvAViQTxK/0p5xaYVJWvuxBY0J5TlellI3GpP9o/GlKWMNgjoxL0z+HqTTpstePKKbXh28qGSeKr5IKfRifESjY5cTsfD4a8PXMEWNcGJByYqohzJdOZN8iEdD/8BO+//oIIQ2RmaZDOoROPB6lozro5leF+3K2j6JA1L8/p3lus8t7as5CVwgwQPG7hSbIMTeGZ8GtdOPXQALzPBe/JcaEBvwzDl/bO6y88J3u6JmmOu6wa+6LPDryegzqJ+ljJqIYYlMTzmQBAQE86aZv/Te+rDAZ5+Kfh77t1mSM41lC1D7/QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR08MB3484.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(66946007)(186003)(66556008)(36756003)(508600001)(8936002)(31696002)(4326008)(83380400001)(6666004)(52116002)(31686004)(6486002)(26005)(86362001)(6506007)(38350700002)(38100700002)(316002)(53546011)(6512007)(5660300002)(2906002)(2616005)(66476007)(33964004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0JCQW9wcnU1b094SzAwMmtlaXRVR0N5N1FEcHNSK29OMStCZHcwTzVQWS84?=
 =?utf-8?B?WkRHZGRVMGlQZzlIWVlaLzFybkYxM04zd1NFU1BmZlc4dUV1WDNlN1FqZURa?=
 =?utf-8?B?d1JpZ3RTcStnemRKUjlLMmpUdnkrZExMRStjb0JENlpvQ3dxNzliVmozaDBk?=
 =?utf-8?B?enE3bzZ6Ujk3TytVRk4yUFVnbUg1N2x0N29ocGt5SzNKdDZFZ25GSE9uTGZs?=
 =?utf-8?B?QUoyV055Z0lmWjE1d29XQnpQMVRUbTkxOWlrWkIvai9UdXVra1ZsWkZDK2ow?=
 =?utf-8?B?TnJyZDc5ZFlWT0hXbDg5RVJnWmR0c2VkakVhUHVZc0xTMWIzOXYyTkYyY2V5?=
 =?utf-8?B?dzJrTDV0ay8vdWp4NTlBTlk4K04zWFI5anNBbEtUMlkrKzVCM29lU3NQOW43?=
 =?utf-8?B?WlByNTIvUjBxOU1PdGtxelFkOHV4MlJvWEF2YW9BemJuWHM2UjlkQkZQWno0?=
 =?utf-8?B?cXl1alpJdEVhbUlwS09hV2hsd0plOVBmbzBzODdjTjZYblR6bnFucElGc0JP?=
 =?utf-8?B?Qld1MlRMcGEzOFN5Wk95b3J4QTFuN1JaZkM5YW9qTUxydVVMSkFLUVBhSFFj?=
 =?utf-8?B?MHNMOGtDd3YvelhiZXVRak1PNTljVjhTNm5NSGVvY0FiS0NwQlAxRm4wNWNr?=
 =?utf-8?B?Z0FyS3UyT0VJbEJka1htNlFYTytSOGRkT3ZNdHlvWGE2R09BYXI3NVMrM0do?=
 =?utf-8?B?Mzk0WnZ1bnErOW41Q1JzMzFnUUVmT0x2a254cldsOFZTTVhkcThYR0NnRTgv?=
 =?utf-8?B?OEpTdGdsMEVmaHc4M1YwYmdYMzI0UmtmcFNZay84bWRGS2s5dUJFdEpxMEVj?=
 =?utf-8?B?Yk9nQ3FhK3JoOGlEc1FKakFXQjc0VDhIanZVb0JMb3JaTG9oY0ltM1Jsa081?=
 =?utf-8?B?ZWRRSS9YbFJHNnptZEdhZWxWNGRneTdwUFJjWDVwMWFmMG91cnU3eVV2ZWZT?=
 =?utf-8?B?VmFzU3BXUU4xcHcrcUpiWnJoMVUzbXhrTUIyRGdsb0MzSFMvZjlLVlFyMm5v?=
 =?utf-8?B?ZzlMbmlISGFXbEQyNFE4cUhUL3RZbkx6SVZsakdCUXRqZEx4K1c1MjhObU9r?=
 =?utf-8?B?RldhOVpCYUhtd1Q0T3ZqRXNjUHhwTXdTazcrbkJhNnF5bDQzYnhNdVBPVVFY?=
 =?utf-8?B?Umg3TmNlTDBHTHdJakd1SWloamZueUM4UVRJQUFFdEVUcVhXc0YzNVVkeFNa?=
 =?utf-8?B?TEFjL2k3cUFiODNXZ2tVZml3M1hVdER1bk50dWJpY0ExM0lZRk81amF5TjdE?=
 =?utf-8?B?cWZGc2JGUExSS2FVbS8vS0JUazBad25MWG05M1o3M2NoOVYwUXY2dlFFSS9h?=
 =?utf-8?B?VDRmS1J0QkpNUDF1QTdKZTBXWTBnVEtRVWdPRUoxQTNEMU03aVArVFlrdlpE?=
 =?utf-8?B?aEV2K2s5STF2RklsVEFGTmRiQ0xIRDlNeDZ6QTNSMFl0RC9YY1hkc3dxaUdD?=
 =?utf-8?B?N1Jhbm1TTWg5WnY4cldHQzFiQitTRDhvTlBoKzFOUzQ0UnFqM2lhbVRjZ2R2?=
 =?utf-8?B?Q05nSXRLTnhnM0ZBVVQ1Z0xLVDM1anVEYkZIcEV1bU5ob0hqNFJwVCtaVjlQ?=
 =?utf-8?B?NENlMXdVQ0V6TXo3b2R5bUtuaDZ6WFNBdFA5RDIrZEh6MXYxZ05qVjgzcXcw?=
 =?utf-8?B?N2hDdXh3UnpDK1FvTmxhMHlVek5nOStkRG1scEl5RW5XTUd1QTNWUkQwUW4x?=
 =?utf-8?B?SlNIc1grMWNRWTIyRlRkR2tUejZreVJHVFBZRDR6VW1ZY3dQMGZab2ZHZklE?=
 =?utf-8?B?QklwS2w2bWVhN1JaUUNncHZNOHpPRXo4UG9Sd1VMNWpaY0ZmUVAwV2JtZllE?=
 =?utf-8?B?ZGNITUpIZGtscnU3TXAwZVpaMXBERXNLS2tmc2hrM1pnSzhhRTloVHhzMmN4?=
 =?utf-8?B?THQyR1M3UG5xaXVqZ1c0cnhOR29CRnhXL09nVGdJMDdwVmllNkxJbmQvdHFQ?=
 =?utf-8?B?UTFZTTNrb09LbDAxdmtaUFExZUJIWFAxaktzL1o1SktnK0NEV2VNQWZlUkJs?=
 =?utf-8?B?UFEyV2ViTnVHYXZGaUEzc25YRmhQUkJZamZ2TUNtcDA4dGxWLzVXcytudTBZ?=
 =?utf-8?B?OFZPeEpUREEvSlpsR2p6TlVNQ1pvQmlCbGFYSVZ2RTZ6S3FTZWowM2RSZDY2?=
 =?utf-8?B?ZXlCZllTeHNwZ240QU9SRG1aL0Y1aTRGc1pDTHpOdGF5RjNUVTZJT0VhVjlR?=
 =?utf-8?B?bFNvMEZGRFZrZndGMnUwcmIrYkl1K2xFaWMybkVBQ0RBalJ5Ym1QY1l6YUdK?=
 =?utf-8?B?ZGdaRi9WVDh2Q0NIR2haK05mVG1RPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae52a90b-44c0-40e5-0032-08d9c93254cd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR08MB3484.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 12:13:45.9553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VORu7xTZcVAOPHSHhl3CfTidLefVWaeEiomiakCkpr1U0R9NUTSl6cl3Rwr7ZEpOX8i1vh3hBqxBMXTKJ6Olah9KG62cSuKTiuSiEchf8t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5435
Received-SPF: pass client-ip=40.107.20.133;
 envelope-from=nikita.lapshin@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.363, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------vdkpy1TgkgC00LSA1nRetHhL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/24/21 18:35, Vladimir Sementsov-Ogievskiy wrote:

> Hi all!
>
> v2: rebase on master, fix iostest 283
>
> Block jobs usually operate with several block nodes, and better to
> handle them symmetrically, than use one from s->common.blk and one from
> s->target (or something like this). Moreover, generic blockjob layer has
> no use of BlockJob.blk. And more-moreover, most of block-jobs don't
> really use this blk. Actually only block-stream use it.
>
> I've started this thing (unbinding block-job and its main node) long
> ago. First step was removing bs->job pointer in b23c580c946644b. Then
> block_job_drain was dropped in bb0c94099382b5273.
>
> Now let's finally drop job->blk pointer

Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>

--------------vdkpy1TgkgC00LSA1nRetHhL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 12/24/21 18:35, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20211224153552.2086061-1-vsementsov@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">Hi all!

v2: rebase on master, fix iostest 283

Block jobs usually operate with several block nodes, and better to
handle them symmetrically, than use one from s-&gt;common.blk and one from
s-&gt;target (or something like this). Moreover, generic blockjob layer has
no use of BlockJob.blk. And more-moreover, most of block-jobs don't
really use this blk. Actually only block-stream use it.

I've started this thing (unbinding block-job and its main node) long
ago. First step was removing bs-&gt;job pointer in b23c580c946644b. Then
block_job_drain was dropped in bb0c94099382b5273.

Now let's finally drop job-&gt;blk pointer</pre>
    </blockquote>
    <pre>Reviewed-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a></pre>
  </body>
</html>
--------------vdkpy1TgkgC00LSA1nRetHhL--

