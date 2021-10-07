Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EB424F1E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:22:05 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOfE-0005O7-Q8
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOdF-0004AE-Bm; Thu, 07 Oct 2021 04:20:01 -0400
Received: from mail-am5eur02on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::725]:48801
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYOdC-0002tf-Dn; Thu, 07 Oct 2021 04:20:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhM/quaK6JTpjzVrsk4cQUGaAQap1Wgw0Hy+gkYaOBT3oX2sLcqWckqCi+z8siUC+3ANXH+t8vn39V2m7FQAht3j0k1fhXtLKwlmKkT8RwzWo4cyJuz6pgVViXl5Gq/Hnl5NF2wPM/1Jrd1LCOk/7CsD/gJkwlO/WEP6LhnK/nTXdtYzcLpMA6TRPYSjbyvCbqpxxUf5F8/wXejcUtSXmlIlvVy6N+QX5c3Ss0CJHHACpTC5Ta9FtQLv0Bo858PTyOArLHAG1Ym/IsMDBUmSX/Nx7MsRuk6+oR9jEVJ4akEHn7Q2En8u/piB2G7ODztaRfQXB5eNyz78nX1s+dnNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz8dabxULUIAoiA6SXNoCzgorrX5GtGSQikZ1QsPIB8=;
 b=VUeJauiqusprWu+wtcp6Io7xDg45Yzb4REgCGVLrPt5ajZpRtwOs8asquBdS8c6tomqHCLyiRYZt7LG7ujQUp+UjEz0a2FVGAZF5kzBpm17FZMKgVcav3GItC5Te4MkQjvnnNbv5dyGTzCfmXUm7n13tyOCk0Yy9sjpRq1W1P7OSBLx7SsIpvAtCkfU7S68AXVaM2nXFk4zr0quU/1mmZMkgGuSVtIRJ2MMk1qEigLBkoW3BIvCa1e82XRoDRSZN38kacqgJlfr2WCJZ8TFN5kdoXqbfMbT4NWniV0Ro5PmJK6oS/BqQf2fhG46apU6hX7zA7Gyz+jLhOCKrr5H3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz8dabxULUIAoiA6SXNoCzgorrX5GtGSQikZ1QsPIB8=;
 b=hpNkFHd3RvUSU/hc+wDwcJhy6X/C2nQIpgRw0bdfi1TSim+1MIw/ivwrLprLaT8NbE+3CEcJWMw4yWt53Pd8sPwq314wABlvnRGfAV57IvpqVFy/VREAbj5CF9v/E92mJvuKe43XyTYPyO9U8DbL60vC1lKUAuYTZ1tQpHJAfYg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4598.eurprd08.prod.outlook.com (2603:10a6:20b:83::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:19:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:19:54 +0000
Message-ID: <129d05f5-e571-0754-8f10-28c7b362738d@virtuozzo.com>
Date: Thu, 7 Oct 2021 11:19:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 05/13] job: @force parameter for job_cancel_sync()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20211006151940.214590-1-hreitz@redhat.com>
 <20211006151940.214590-6-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211006151940.214590-6-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.207) by
 FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Thu, 7 Oct 2021 08:19:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cde183c-9520-48ec-3b38-08d9896b3e13
X-MS-TrafficTypeDiagnostic: AM6PR08MB4598:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4598ACAE455CCDC659A1F91CC1B19@AM6PR08MB4598.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2fw3aBqRosctPcUw1HF2ExhXRhnpEze1ap2cQoLQ64mrASjukam3y8O1Ed/STvu1IMx6q3CDvk/y5UrJsH0w0fpLd58AMCtHfRs3xlXPcIetjyYXbeYUErI61k+f6a+jbRiRQTc8xCpOJXsQjbsUGxOEEQ55CF/AwP76uP1qJr4SQwxHOgBjPML7A78tkWQqSecnXTeSXbMcJZdNP0WjgzXRGpMttBDDu3hY5w7Ahnwva8FaCQC64Xg63GdKyrh6MQLs015HQKVqA5TfU/wPE/468o1ugz2m6kXKSCIm0oeLIZXXlOD4N784vQwVVg4uZHEKC34cXh6E6L/xwOTGUZx85DBfZSWlIcpnMhslUKc0QAlddOzyGIAvw3lNGfM7EWnYag2Sr9/EO3hJYbPz4R5L7KmflucdueBYz9xQ9ug6lXwwUEu9F5b3KXFpeVXMuJ4e2RezCciX6+eBbCu+ab3ZvBa9h671n+7yE+UNQYmNZLIEkfV4bhd5clwxSpTXBDtGwqQrTUL+mhwyYBd5TfSdtOCVaMdiu7h+5DDAnJodtCC2HjmkQ0pRcM546Koxoyd+DlRDRQ6gDdQNqSFcIKSwNTSEbk4c8QkcPPry+JZ85AYoZLfAqHLp0bTIX7oTM6HoELa1/Mr1rtt+GbhCBfRn9v42zK9ENAmj6Wsklfs6bykFHTHE7fqir3wkiXs1zrSmaRCap1CzjAoCoz1+M8iE3FEhYrJyHqpl2v41Y8NF9z4wSrPzMKWAtABo+/uV/VeckmCVJurLIg49BEIDxmKiR+VuZoAIuJApfap2+I41YGMAJi4EQebIKU3qSDkatC6TKoyD34blfw+PcbDdSmxLm6uwPFtiG193LO6ocg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(26005)(54906003)(66946007)(83380400001)(31696002)(316002)(16576012)(36756003)(66556008)(186003)(66476007)(31686004)(5660300002)(38350700002)(86362001)(38100700002)(52116002)(956004)(2616005)(8936002)(2906002)(508600001)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtDRUdJT3d0bElYT0gwcDZCQ0llOUIzSTU4Z2FPemVTVzFYb05wWDVpS3hD?=
 =?utf-8?B?MmVhc2dnVzF3T1RkQmJMTlBDMHFOYlV4VUVJVDdaa1NIb3FveklZUi9NOUNt?=
 =?utf-8?B?ajN0QTZoSmMreDNySmovOVlHbGs1aGY3TlpqRWhYNWtIYlBocW1mdmlhSmhH?=
 =?utf-8?B?cVBaaG9YSlNqZGZEenpqYmpmNDN4WTF1ZlNSSmRrNDdyNGcydGRjWDd4bDlM?=
 =?utf-8?B?OHdHajFFQmNpbjBKNXJua0kxSXhVcU1nUGJUSTU1OWV2Nm50RkRYR2hVNWV6?=
 =?utf-8?B?aENjcGlRMFprY3pDS09DUlJkVXk2cDE4MUMxbjdYQmlCbHFBd2FPSDFsRDI5?=
 =?utf-8?B?UkxQZkxOSjgwcmF2bU9yZWFwSHorRFMzMndCeWhyaGxZTkdQcm0vSjRvcFVm?=
 =?utf-8?B?SERHdGROb2N0VDVodk9HajQxczlpVWRCVWlEc2xSWmNXWkNQUWY4RHcwbGRG?=
 =?utf-8?B?bUNzMlk5YVB0OUFTUy8vNzZVOFZkWGxsVlp0NUlYS2t5cWU5YllMckl1NjdM?=
 =?utf-8?B?R2ZucnRhQVhua3RNWDdUbXQyN2RvRzRQejlhYXVYVXRaR3NrQ2dLNFVyb1JE?=
 =?utf-8?B?VWNzdWduWkVQay9rMXhxMFZMRUt5S3Nsa3ZZSGYzaFpRNk5Ub2x2UVk1ZGZJ?=
 =?utf-8?B?RkVQZ2QxOW0rRDBTMEczMnV4ei9CbDFCSjh2Vm1TQUZYaHhnKzJ5MGZzcXpk?=
 =?utf-8?B?M2E0c0hoT3pHcXVyR0UrMWVBTm9iS1NMaXBEWm1DZGF5M1grVk9USWVCTVJS?=
 =?utf-8?B?N2JVVi9va3lOcW50Vk5mejk3K2JRditCNzBVNHNFaXlVQWprbG1panp1SDZ3?=
 =?utf-8?B?VjR3NlJFNnV2cy9vdmIraDBvejZ0WUs1Y0FCcmZJRGt6c0ZibWhsYURiWnZr?=
 =?utf-8?B?djhYTFlLVTdYdExqUC95a0xLNlFJL095NXdobW5kN2ZRMEdScHpZQnJTb1Bi?=
 =?utf-8?B?c3RXT1gvc1lKYmk2bVFKemVUVisveUxmbU1NczJESEpudXo5NlRBM09kMjU3?=
 =?utf-8?B?bktadGpPZ1B0aGlUaUMyQTMrWi9JRXY2R0hWQnBQUU5ra1MvWVdyN3F2eklQ?=
 =?utf-8?B?RmZvNkVIcFhtd2JZY2NDaUM5amVyV1NBYXpwUStwQmxnRnVRMHo3VnQraCtR?=
 =?utf-8?B?WjAxOVlpc09TN01FbjN1R3VzUU5NZy9KNWpFaDlyWWJsZG03K29NV2NnSTRS?=
 =?utf-8?B?N2E1MmFuV0NxaGRZZFQ4Nm1WTEwxTWg2RmpyZ3E4UDV1QU5uSEdzNGpnWnVi?=
 =?utf-8?B?SFVMdEEwdktvem1MSkZZWVpUZ2RlMXVFNUZSeWdQVTBTVmRhTzRBZEd4czFK?=
 =?utf-8?B?YUZWNVZkaEZUV2pQMUJuT1Bha0lIeXA3MmhqYjRlRHN4SmJuYXVqNUtzSUJC?=
 =?utf-8?B?YThMNS9vOTZuNjUzS3Roa0xINmFYR2FCWnl6L0lzNjVUNVVDRTZIS1l1cHE0?=
 =?utf-8?B?eXYxLy9FQWNzakJtM0NuN0xPaFBneXZ1bnhLb3ZadllwSVJoRElCMUFtSkhy?=
 =?utf-8?B?OXlRVGpMZGVyS3BkMGVmenB6Rk9YR1VyREVtOTIva3RkTGhRemQ5eUVyZUpU?=
 =?utf-8?B?SEx0bWNGam5LeTFxRUQ0UUpHQml3YU40NFk5bDR5WGpRRitCenpLbnpOMGQw?=
 =?utf-8?B?TFp0OW8vbzRkeEd0NkVRaGtzSE1xaHVILzBsckdOcm5vYm5oNW9WUk1VNDdj?=
 =?utf-8?B?QlhhVU1FVGN6K3g4eFhTbEZhSC83Y2NTODVHWFE4T2NQRUY5NGJheWJrYVRr?=
 =?utf-8?Q?kml5ocpolrKfw6XVqe8cnRdc6lI1DV+Yh7JMo5f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cde183c-9520-48ec-3b38-08d9896b3e13
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:19:54.7998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbMKRwxB3HAOefsREzKJnyMFT9UUbidxoYq5A9cTNil/PXD7uc9ahve3hyJh7psBOO2gdaG5F9k+CF8WjOdrwraQW6RV+ZCj43jPWY6KXEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4598
Received-SPF: pass client-ip=2a01:111:f400:fe07::725;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.964, SPF_HELO_PASS=-0.001,
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

10/6/21 18:19, Hanna Reitz wrote:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception,
> specifically the active commit job it runs.
> 
> As for job_cancel_sync_all(), all callers want it to force-cancel all
> jobs, because that is the point of it: To cancel all remaining jobs as
> quickly as possible (generally on process termination).  So make it
> invoke job_cancel_sync() with force=true.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

