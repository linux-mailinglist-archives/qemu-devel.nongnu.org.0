Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134533784BF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:19:21 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg3wV-0007gS-KU
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3vD-0006kh-Aw; Mon, 10 May 2021 07:17:59 -0400
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com
 ([40.107.21.93]:13824 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg3v8-0004vl-To; Mon, 10 May 2021 07:17:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO4Kum4bZN+0VgxiYip7jKA/00ZsCYc3T16swO+G1gTnJxjvSXAj6E93CWh1tWK7Z4k29i60KLiSkcLk6tK/VIibvkuI5INfKwKR22+dNGY6mYTWm0TqAbH0BXlboHRlF/Ka+LZjeMxZLv0X6u4KypgmPrdePAw09NtprLOz0cT1JLmfK2fsiNaRnyyJY+6G42xzxUOteImTXsaYWs2cYKNAIobY/B9TlIinHGXtfyLucLHHo7muzhHvjeEcwqzO76dPljaCVyVa+ShXJl9eB3ECiuHIceCJ48QGttLtvfMO4gXFKXj99Utv6qcxxJ14GYBEqhYZ3iywca46+uT+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNhiUNwI1qG7sCn6YfJdgfScMtJOpHZ46cnEqRk+fWM=;
 b=Ou3y2X+M63AYzYwocjbpDcUasE6lZAI3IVOocKQAP6O5CQ1ZR1CtZc/0RJNC1pW9/jnNhGC7NCIHvVhYZG47EQMzDKyq7IbGqaaSCiqO/PvDrmefIw8UAl3lF5aiQv9bs4Wh2QybBHvaUWcapxQTF2AtHuWRqne6fZEi7Ieyn8vKRElu7CJLZYFoVQd3SACdQ0rFu6KxngLwH8bi4jPvXXQhmLsTl+FS+yppaxP1N/1fL5dof+SZuUH8PrDv7m7MiuE9MCvD9Gn9rLYcaUb52RFZ51HnMpJ3SL5MfT7/nRuEVmHMkIq2OojrSuz6dc6w/oUzjKDXIY4jxfrU5lnb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNhiUNwI1qG7sCn6YfJdgfScMtJOpHZ46cnEqRk+fWM=;
 b=wetTeaXyU9CMKSgZkb7iir+k63b5IHkkmk8KqD1YGbxM/8qRt/vTEuLgw7Adl5N3Tpt6LXiJ9lVcuQV3tjiKoG17LA8KcZ/hRHh17+T7jwWmg7gt9eEVPJ2Ub6QvyXalo951lWlQsEzhSteTUvLk4IXTfV/rL218TzlOqIKM5Gk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 11:17:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:17:50 +0000
Subject: Re: [PATCH 3/6] blockjob: let ratelimit handle a speed of 0
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6577aeb9-dc8e-2ffb-d027-d09f7028b265@virtuozzo.com>
Date: Mon, 10 May 2021 14:17:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.20 via Frontend Transport; Mon, 10 May 2021 11:17:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12b3f8d1-819b-411d-50de-08d913a53f8d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB694822FE045C62BF83416ACAC1549@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbL4gSIIBnldHMiltDID1HkI8EzwqBc1XN72oF2aq4fN+/yXCyrghvCglh06dfgqR+zsyPhT6OfzOB6mKNYBL2bfpQNYBetYc4Vcuq28frx69psWy/kb+P8kAjXws4OUuJisM+v2f8qWHI1XQnAbmQEe5x+/mgRTfnrsHr5UBbYqZaAiYg6yKct6uzAnx6GOtBlZOn7ywdgwsqThSkbp7+qIrRX7L9bp3YNn7LwCz/eiT2PjCHldEu+/lFrO5PCtpjyrTD9Cm4hHSIWjh8PqthvfBFk3SoKx7k8BvGHrtoVCEk026eMC3tF40Ej9a1P9gWrFNVFZG5z2WsssAnFhruBkpxvB1qmWmIx/G3b5l0sB/1L3jo+pg/ZOnBrIdDAEHHvEnMpjm1bIH+yNqswRp5mJa1/lX7Z7PdwNZKJMVGPYXaGpxw0ucoWDN/QkwKF/dRSssljfUp0EqvgMDVYlhpp/mh+ihtGjY1phnNB1QbrX6WukCNTDoNaoRckztpTFsngdJb5wU8jcMhWKJ8gjKuviu2qxLUgVJMwH+dE1egJHgzc7obCsuQA7jbiubPaE2YvH/W1R1ZfJRfixGNmk65f23cI+VZ3vrVLX+bNygeuFMKiAQ97Lqh7nKj+oUgA4OJKvzgpqFEblGKnPAGTBtig0pjhHa6vrvc6IJ1xRX2x5LhrFCqGSfbQDDHr/jlPdQu07VAI5JrbschoKdINlsZYVi+2kd1ylOtChgQtjYOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39830400003)(346002)(376002)(956004)(6486002)(2616005)(316002)(478600001)(4326008)(26005)(52116002)(2906002)(16526019)(36756003)(186003)(83380400001)(38100700002)(31686004)(8936002)(5660300002)(54906003)(86362001)(38350700002)(66476007)(66556008)(8676002)(16576012)(31696002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TW9HM1d0QTFNeTk4RnRpdU5JV1duMDRMVVhQUVBOa3U3ZlF6QmJOTWJsVHds?=
 =?utf-8?B?c0VmZ2VWL1ZxRzhLejdYRit5eDRibEZOb3dwVkVVcHYxVHR6aklBcmp5RVBR?=
 =?utf-8?B?KzFPeS9DdHdNSDViMWpvUE1NMWpva04yMFRrY3J2b0RLNjROVXB0WmtqYXQ2?=
 =?utf-8?B?aGsyNDFuVjZhSzlOTjJDdExDQTYwRDFjdWlkdjJlRUFIV1JJV1VCVy9HSlNt?=
 =?utf-8?B?YjZVR0M0Yi9kRDZtclp5R0kvWXRFbW5PYUVST1hVRUZpWnY2TjFkbVlSanBn?=
 =?utf-8?B?bmJ1eEJCTlRCK2JiV2RzRThLWUlGMHROdEpqZ2lkam1Od0VlWnM1OG9Pb2Vo?=
 =?utf-8?B?TW15OUQ1dUlObzVQRjZlTXNWK3hPVGxKcUdNN3VWVnAzQmFKMHFNVjVhRmRC?=
 =?utf-8?B?dU5mNU9hTHN4bDNXMys0MTlodlVQOEx6WVdSWUhoMXNhbzhIVHRlem5CcnpQ?=
 =?utf-8?B?bTMyR0Y2VE9SQjZVTk1FUVlFUEwwNTJLUm5QN0xjWVkzc1l2N0tlcXpPcC8r?=
 =?utf-8?B?c1IzWm4zK2xCRUtLeDR5TThXMlhxeUFGcDVPdXltL3YxV25xbDNNZktnb3l0?=
 =?utf-8?B?eHV6RnVybkZiUXppRSs1OWhNbnBMQ1VPK0lvbzN3KytxVzdPRmM1WG9MMjJZ?=
 =?utf-8?B?TTlqNXd1cU1Kb1ZWQUpDdDBtd1RkSmIxL21SQ1hDbjAyalp5VXNDbjY4OXl0?=
 =?utf-8?B?b2NNQnBhWUc0ZC9KQk8wQlV0VnIrbmhHdEtiWHpIZE5DVlUzZDJndm9ESzRP?=
 =?utf-8?B?RHRVMlpXSXlRWUdNT3FVa05oZ2FyVHZ0bnpoVzJoRUpCcndHa3poYW1SbFFN?=
 =?utf-8?B?clNIbWkwWEVKY0FEc01NZXJTYmRVcWFuZTlDNU5OamZWdjU0RlI4c1M5dnkr?=
 =?utf-8?B?QnIzb2UrTWM2UzRpaEZsakVrdW9NamN2VExrd3dFNVdYcDd5b0hlT1NHMmk1?=
 =?utf-8?B?dDVRKzBHQkIzU09PWjM2WUlKYWRvcGdCYXBOMWhKZGM3d1pUbHppaUQzTG1Y?=
 =?utf-8?B?bXBMTnYwS04zSHBWZVZoQ3VKcTFmTEg3dFVmZUpzUElnZnEzMjhzTnhLdDJY?=
 =?utf-8?B?QkpkWVcwREZMcjFmK0RLbE5KUUN6Ukd5WGFmZUVEYVkzdnRrZEFlYzl5UkR1?=
 =?utf-8?B?TFhmVVBjU2h4OExjZ2p0L3F1eGhhZ1lZcU5lOUdsVDlLOURXbjBoYW5yWHdP?=
 =?utf-8?B?MHo0bHlaZkRkMzEwOCtMR0prU1RIQWQvRUZKcUtGeDBHN1pHc012NzM3WUdv?=
 =?utf-8?B?c3B4OXZ3UWo2c29wMFdDbWtQazVqcGgvclZtVjQ3NVhtY1h0d1NjdVR3Z3VQ?=
 =?utf-8?B?K2I2Vy9MODdDcHBCS1hFenRRSGdOSVBQZTR1Z0hlS2lGaUpGQ3JFbytMMUY4?=
 =?utf-8?B?amRDVnJ5TzBuazltYzhBTXRmRC9GUng0OXhhNXJKOW5NbXJrZ3IrcXBZZVE5?=
 =?utf-8?B?bDVnRmQvLzM3dmhObit4bW5IUldCbEZXTkM2cjljd1Bhb2tDTUQzNzBEZ0N1?=
 =?utf-8?B?d2VLNmFDM1JaNFk5UU1QV2RnRGJZZnVFWFJDNm45WjR4eGNkamlvSy9FaGRs?=
 =?utf-8?B?bWxDVmxOeHBiY2dyajFWQ2pxWURiMVdWaGcxb2xaUG9wc3dqOFROcWJ4bjZm?=
 =?utf-8?B?Um5EMUlWTXVYUlJBT0VMdVVkYTRZeVZlclRsZUFTK0JwV2pkOU9yeThsd0N0?=
 =?utf-8?B?dGpscmM1THorbjRqdGJ2WnVLN3dlWHNlYnZNZGIwWG1CdlI1dnNYWE9MWW4w?=
 =?utf-8?Q?wnnWGtvR+kfIutbNPByI33HoNWLcVGy+xZOeLx1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b3f8d1-819b-411d-50de-08d913a53f8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:17:50.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzrY5zQiyhiM8cfCw/ftSty2NKnJxDrYlLPKGTZJSrWL9SJ7WubEYHP0Uj6YXQy4PYbEuoRYj0ldeErCpTaAwV/1qhMl9/scgytWWz2CLwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=40.107.21.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   blockjob.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/blockjob.c b/blockjob.c
> index dc1d9e0e46..046c1bcd66 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -300,10 +300,6 @@ bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
>   
>   int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
>   {
> -    if (!job->speed) {
> -        return 0;
> -    }
> -
>       return ratelimit_calculate_delay(&job->limit, n);
>   }
>   
> @@ -473,11 +469,9 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       blk_set_allow_aio_context_change(blk, true);
>   
>       /* Only set speed when necessary to avoid NotSupported error */

strange comment, I'd drop it.

> -    if (speed != 0) {
> -        if (!block_job_set_speed(job, speed, errp)) {
> -            job_early_fail(&job->job);
> -            return NULL;
> -        }
> +    if (!block_job_set_speed(job, speed, errp)) {
> +        job_early_fail(&job->job);
> +        return NULL;
>       }
>   
>       return job;
> 

Probably, we should store speed into RateLimit, and add ratelimit_get_speed() call. Then, drop job->speed field.


with dropped "Only set" comment:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

