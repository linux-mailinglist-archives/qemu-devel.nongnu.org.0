Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A114C2E12
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:18:48 +0100 (CET)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNExD-0006ty-ND
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:18:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEtP-00031Q-H1; Thu, 24 Feb 2022 09:14:51 -0500
Received: from [2a01:111:f400:fe1e::726] (port=52842
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNEtJ-0000E7-Ua; Thu, 24 Feb 2022 09:14:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG1JFS6DR0CsRp74waduNJOIK6qfDrio0hQYOAZahCHkEpiMFtAptT3yRUZwnWYDBc/y5s0WFSypmra07koJxyEH8BnveiU2cdHzU1k2ErBnmZtpkSfcRKgQIOQ55P5+7g0N7Exf7mAT6QdQ9nHnK9zc068qKCKoMC0Z2+xAKQwtbGv2TxX/dIJIL+7M/JH46R/+R152irEk0mDhOVSFkx7owH9tTdWO8AnvJMxr0iFf6CgHQuB091FrpiwgouYLB18OaYwRgKW1BBqIPSnSJAsnm470tqB3OuldKUkSnzlGAnDgl2GYzJIuJEuc0ZHDOxlNuX64bv+Y0mYgZ1fw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxP0YPyUZmbAr1g6KbpnCXEqlX+L2X2pWLnIwLe/BA4=;
 b=RAl75xUTZzdfW+QVZUNYTk40y9BcsYgVkT0d/jUhnakZi1PckNs2a3n1ElOZVMHwX6WOCfMZmoXADx114eWWZOzX5jmt1uOOLrjROOk6onxbtqZRWukaJmMsVSdWYjqMiqpmq/GUU31qD23SUQOWKtyfjnOnJOVBVK5XmEmmp6MU+Vd8s8ehcLarO75GIwXX08ElvuJR4oLx1umzds8Q46/TR+rZ7Xh28adBFZQ5DAZTA4HUGjQqy7DNQsfehGjkaUlXfhMLX43ibV7n/Q/4c55QFw5vOHteUBgD2kczQVAf5z3ZaWoPblWvbn60f6pEUhoRyMZSySNGjeA4S/y4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxP0YPyUZmbAr1g6KbpnCXEqlX+L2X2pWLnIwLe/BA4=;
 b=Ua0ua/NQQLxKjgeaetZ9V4ZEYvpVExYCdiZOl4BmyVtn0VtfwaMQGMjqwriAoMrsck0GCj7T59OIjtxCp6tuOLmVpy1h68LqMKFZGiLeg3H4gznkksZcEWG30kxWS/rzXxu023JRzmwzG6pVHH6PPo4jiOlAXBgtuUEEBJR4I6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 24 Feb
 2022 14:14:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 14:14:41 +0000
Message-ID: <5e1fe53d-3f96-fbc9-c333-06a12cec4938@virtuozzo.com>
Date: Thu, 24 Feb 2022 17:14:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 17/18] qapi: backup: add immutable-source parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-18-vsementsov@virtuozzo.com>
 <4170577f-bd93-49f3-0f80-7fa41a6cfabc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <4170577f-bd93-49f3-0f80-7fa41a6cfabc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8464914e-3589-4668-7f1e-08d9f79ffff6
X-MS-TrafficTypeDiagnostic: PA4PR08MB6254:EE_
X-Microsoft-Antispam-PRVS: <PA4PR08MB625416E0765B8EDA853E75B9C13D9@PA4PR08MB6254.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPVroV2QUwn/MF02quBBy4e3gOXNumIe7opwm3crIaqZbbDb07ijpEKMms1r+O7z2rRzBjxMnnhZxkBaQsbqrmD1YGqglr4X5K/5XvaKxj+3CImTWn3B47J6A50ye1kRk1oFEhdgNoAv8p30ypixxoAOnkhF6zhIn3g2EepA9DEFGSs341QUsqaNSB6xiqyA9mQdIn2XN3bTBuwkUoMcvLIoH4Wtpp8Tx9XsqVio3yGOJNUd8ZaiMnlodWcHSslA05utCI7cCqJW0XUpbmfYP4z6wUKUD3gWf9Phv+sZXUXaOZxs530cwtRG6/M9xn/MCu/TmoqJuy5V0dMXYO1VtOc5YNQzHKoST8HkFh5mYQVDkmWwkhtci8mfGlQ3SeMMNiENilLOfP5/rZI4TqmT5vjsv1kqV8yVUs1Fxzwv/5kxottWx2syI+4Ri6qtXLht0t7wnzCo63EdK0o05J4tOsFNJUx0Vyqso1qRDEzIFGZIgFvduaVzxyy9ipRhI2Riz6ByNI0CY6HWJi3yZuQ1H1W6ZFHNRZVs2jzBb2I+mvll+vexpDclcPKiTqMVMNrtzI2Ebj3u8wUOT11l80116XbPDWI+VP0h0Cq+vOBxHnhnwS0dNl2LsHMAvHjH8sxAqC0Qw+XG35k8t5NaoornG/HWMlMoY/GpsrMQRqSKLobLzxhKUFkG0tI4jIGzq72Ita8VJ5eZRFvo5Rbvv2wEc7EmmE6iZZWUnNcO8zH6N23hD+E7kDdftPyuB6UxQtm7EuDAdTd48e7Oi9RbAusrwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(107886003)(7416002)(86362001)(316002)(31696002)(5660300002)(26005)(36756003)(83380400001)(186003)(31686004)(508600001)(4326008)(8676002)(38100700002)(66476007)(2906002)(8936002)(66946007)(53546011)(66556008)(6486002)(6512007)(38350700002)(52116002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M29DTUZ4UGRrUElGb29xNUlibjdDd0RtMEJtUHVjV2JIa0QyN1dpdHZYamhU?=
 =?utf-8?B?dnhWdVJYWENoSHdKRTVhaWF6MFFZQVJaK1U2MTJBWHpEc05yOEdiOExTZUZ6?=
 =?utf-8?B?YVBsSzNqbXc5UkhoNkZwR2FPOU04d2RERzVIaEMvWXVScC9wRmxaUVA1Umg5?=
 =?utf-8?B?THZITEV6SHZkUUlaUVoyK2RUTDJQR28rVkk4VEdlQTdlWDhQb3VxQTRqWkFD?=
 =?utf-8?B?TU5GWWFYeSt6R1FqSi9yVnB1ZXo2clpxUkwwRU9yTE1wNkQvRDJpMWt6RUJo?=
 =?utf-8?B?MlFaSjkwejVQdm9XQ1dkV1RzSzZ1ZXVDRytlbzZUUlhKT0Y4cWF1VUNSWHZm?=
 =?utf-8?B?TjB2Qm04TDBuTUdKT2l1akxCck9JZEZQQ0QydTZnd0NqYTlYZFNReXJjTnRw?=
 =?utf-8?B?YkVTV3JXTE1kcFBLUE9mVlNSMmplWGRXYlVuUWF3QUx6N2Vkc2k3bkZFTC91?=
 =?utf-8?B?VWxRWmxhby9GbjdIMEdoVEN0c3JzaGo2YjczSVpqZDc4aWRZbGlDOVljc1cw?=
 =?utf-8?B?RURVM0dVb1R1ams0Q0RqajU3WmdmRFUxT3UyOTc2emI0eE1JeW9hQXhoYThi?=
 =?utf-8?B?MXJhOFE1Z0hIQXQ1YVZlenVhU3BuU0FKQUFDN2Z5T0tjQTlaamx4bWFzTDNi?=
 =?utf-8?B?RmpJeFNxUGhJcW5hZ1lTUDVzL0hyVUF2NStVNXRJT2NyVlVJRzBGYTdCK3p0?=
 =?utf-8?B?c0VUMTZFVVNCNVUzQ1dYeGpiaXh6WWNPRGJkZ2U3a2VNOG4zUDNjNG9kQnhy?=
 =?utf-8?B?TGpkazVPcVdMM2FCdEluME42aGtOSTIzODhBWFQ3eVowVDJzaDhBNlVoc0hV?=
 =?utf-8?B?dUZ1REphYm1GMnRuN2ZBYXRpVUFyb3BjRFFjZ0ZCZkZQYjV1SndvQVN1WGNk?=
 =?utf-8?B?VWVnYjhxSmI5YXQwTWVFUDlyN1VPZVRrczRBTG9VSTJZNjNGc3Bud1pPYmxL?=
 =?utf-8?B?WitjaHlBWFQvSFVySzQxelpOb0xIaTlaRW5IaTNqb3RsSFBRdERTdythem1J?=
 =?utf-8?B?eFNHWEdQNlhpMUtwdnFWMzFsaXhtamJiV1dpSVJaSkxYa3psa0pUZkxaZFc4?=
 =?utf-8?B?SUxuRVMvbisvVkRuc25sOUxNdmZoUUtNWnNzNWFrSTd0NzdvMHVucjdpV09C?=
 =?utf-8?B?MzhLcU9kd0R6bitSYWpUbnBvUWtMOHNOZlFwb0NYWmFZZmpVTjFvS1M4clov?=
 =?utf-8?B?K041d2c4WElDQXo3VVRocXB5WWV5TFZ6MlpWeWpwZE04RVZrQVBZeGk2UGgv?=
 =?utf-8?B?QXhGbExvb2pCck4rSE05STkrV3ZSVEZyNDRYVEsxUGVKSGxZQXpLNk5VR3ky?=
 =?utf-8?B?Ry92OGZld0pXenltQmhXZWlUL0RZWS9sV2RiejR0Y0h4ajZTVnl2MGJGSjRT?=
 =?utf-8?B?Z2p1Rjg0N21wMlZ4eUZUUjJyekMrd3A0U2o5dG1FOE5pWUZlYUxVTWlUa1c1?=
 =?utf-8?B?S1JJVlQ0a2lvN3d6dldQNGxBVEh6TUhveXlVRlVFY2FUZysvZ2g3eFJhQk1p?=
 =?utf-8?B?alNGV09TcVh2VkFsMzBJYXNSS1BYZlY0UE54WXlUamJBcWt5MisxbE9XblhR?=
 =?utf-8?B?OTFhT2IwMysrWHpYYTAxUjB3eHZUSUJEZ1Y0ZDE2dUhPeEJpOXRCUnZmcXRt?=
 =?utf-8?B?N2JwdTZEVm9kdlZDR3lKUjRUdFlNVUpkS0JvVnFiWk9jenh1aXEwREFFMnlz?=
 =?utf-8?B?UTlmZ0NUNExoYTVINFlnZFFzck5PSzBqRWY0TldxUzI5L2lYNXNYdUxmY3JE?=
 =?utf-8?B?TGlhdzBVZ2haemtseXlyTTJSb043Q3V5Qk9vTjV4eVdUTVF2UFZEZGVKSEgz?=
 =?utf-8?B?akZIbjFCa3B6a0xkdWxYc2ZmeTdWWktWYzcxSTNxU3JsZEpuWGt5SHFCRktH?=
 =?utf-8?B?WWxsMXBsZDhHRUV1cWtjdWdIbWZIYVRQSVN0UFJWSHRJSFY5aThEa1RpQ2U5?=
 =?utf-8?B?ZkF5M1B6TmozTjJUazI2MXFkS1ExZjJwTmhHd084L1lOaDJudDc0UWI5K3Fw?=
 =?utf-8?B?MDhtcjBaRW1BckNDNTFBY3RaT1ZNOHphQ1pSYmhVZzhoaDdHSGJRNDlnYXRL?=
 =?utf-8?B?eEhnMjB1NU5YZzRtcFNUcXNZUlQ3UWhERGZ5WCtRMVllS3c4NzdVZFZjQlJl?=
 =?utf-8?B?YnRORVNIRGtwVkJGd2dtT214T0tOZnFMM0Rtc0NlZEVFcFpIbU1mUEdCVlNO?=
 =?utf-8?B?UEVVc1psdUNHU2ZVWW8rT3lqVGFjM241ZG5ndnlBcDlvNmpDSEkvNDBIVUhR?=
 =?utf-8?Q?1l0JS6+mwrETxr1OgsUJm7bXPbGtHP44WYmN0wlALM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8464914e-3589-4668-7f1e-08d9f79ffff6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:14:41.6778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBczcR27CBVaKfJIPsIAgCbM5BHxXU1hM91uz54Pgl57T89trKWGCmNl5X3x3IrDSp9qCMekrz0goKHW9u/X7ty9g2PyHqDAY5U043ZvRoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

24.02.2022 16:05, Hanna Reitz wrote:
> On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
>> We are on the way to implement internal-backup with fleecing scheme,
>> which includes backup job copying from fleecing block driver node
>> (which is target of copy-before-write filter) to final target of
>> backup. This job doesn't need own filter, as fleecing block driver node
>> is a kind of snapshot, it's immutable from reader point of view.
>>
>> Let's add a parameter for backup to not insert filter but instead
>> unshare writes on source. This way backup job becomes a simple copying
>> process.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json      | 11 ++++++-
>>   include/block/block_int.h |  1 +
>>   block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
>>   block/replication.c       |  2 +-
>>   blockdev.c                |  1 +
>>   5 files changed, 69 insertions(+), 7 deletions(-)
> 
> I’m not really technically opposed to this, but I wonder what the actual benefit of this is.  It sounds like the only benefit is that we don’t need a filter driver, but what’s the problem with such a filter driver?

Hmm. Yes, that's the only benefit: less extra components -> more stability.

But I doubt now does it really worth extra parameter.. More parameters that actually change nothing for the user -> less stability :)

Ok, I think I at least should postpone it for now, this series is too fat even without this patch.

The only possible problem - will permission conflict happen in the next test without this patch? But if it will, the solution should exist to solve it without user interaction. I'll check and try to avoid this new parameter.

> 
> (And if we just want to copy data off of a immutable node, I personally would go for the mirror job instead, but it isn’t like I could give good technical reasons for that personal bias.)
> 

I still hope that in far good future mirror will work through block/block-copy like backup, and there would be no difference what to use for immutable source copying.


Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

