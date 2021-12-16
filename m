Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7B476F6B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:04:39 +0100 (CET)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoYw-0006G7-8T
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoWa-0004GH-4z; Thu, 16 Dec 2021 06:02:12 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:47198 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoWY-0005cj-9o; Thu, 16 Dec 2021 06:02:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G37fFicFEd80+lfD9qrzCGwqd67/oPtm/NNXbfGzHwkL1Qp1B5NPmohHPfXXA++ftvvrTG+z0wk+O+xtsao4doNwzsB81rZe4Nz3YC6WuUkIblOf3DbM/zjucV5NB7cWwxCuuGby/FUsrzVIGOmx+xZSGxr1fevbpgAYWScPvAf7B8ODmDeSk0gjJw7+Sf+C1VV6cca7D0e699AW2q+AMU0c0Rq00xl1SMhvM3mjdwBYxz5viogMjCHM5CJg87gq8nXIf8/C8rR/iY55jUMoZyt500J7e6DEwZDvbrsLvehLGn9Q76ltLX5jEZqE47r3tDERsJzHbIrTddL+VynXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3AukiMtAa8DgrAK4DzWqLq+K7QIOIKI6YFkrEjVMdU=;
 b=H0koWzv3PtS/+eOySw28EggvvI3/ZnYdu2hnJz1mCXd7K6gaygkhk4hiH5sh4iA2s0ZjqN4S4Vv0hSvewUsmL5wfF+v/EJD7JyI3kKbX7qma9K8do8mDbo3SGcDEJImB58cmTLeGaz3zxjIfqg21r9/6N9CEQQswZ6IlhuiCFBDa6EfKHh1baGdXhOPj6IbjajJVhF/lN95vHVctJ5bAi9AIWvLZ8Y6XES4DmeMmh1IcF5RD02iMBnu/+lAlrrEJdgJjrWEoWitSzanSGpn1nFe39V89hUkNzxQUYy6b7HfUlY7sr1tcM/axWmTSf+Z1gqAb9ZQXb4iHSFbGMFRPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3AukiMtAa8DgrAK4DzWqLq+K7QIOIKI6YFkrEjVMdU=;
 b=p+IG3vSYJouXZPO4u3OBEcZTGOICoqYGy0oLmcgJybgkwgLSEzUQ/frAEdP2WBQZiY7HcTd1uRi1BH8IwHj2g2QEYrYjhi7jJDPj39RVQXKkjQumKiJi05qTy1FYb299TDXO8dLniOi5gujvpeD7n67HGJxiEMsFGXC3IWiU62g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3540.eurprd08.prod.outlook.com (2603:10a6:208:e3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 11:02:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:02:02 +0000
Message-ID: <eccd7f43-3c14-589f-e049-524a3eb23169@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:02:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 18/25] iotests: switch to AQMP
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel Berrange <berrange@redhat.com>, Andrea Bolognani
 <abologna@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org
References: <20211215193939.3768033-1-jsnow@redhat.com>
 <20211215193939.3768033-19-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-19-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR0202CA0071.eurprd02.prod.outlook.com (2603:10a6:20b:3a::48) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:02:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5b16779-8ca4-4a22-facb-08d9c0837d6e
X-MS-TrafficTypeDiagnostic: AM0PR08MB3540:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3540978EDB259CBB133AE854C1779@AM0PR08MB3540.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mnKNVO0yOaKe5Pr09aLQSOf9Xiu5YA23k+8r9q8TbUlavT6l93g5CJMWTNYMuCd1tzsAMVMfOgk6c0tYDDIlLVfFOvvW0m2tIpmnSBpCEJwlcmQLah3I3Xum573XJecjrlhIYTxCVG9bDiNWvvyczs19l+8vCZl/4woUmaXbaMv2GuXcSrgBBdUK8hr+xroI7LYspRqTE0Mys484XHM4bqWvYCz5DYAXaC4T9Freb5bJIv4l+7AbhLtdToCu63jYekilvVKH805svO3/veKYrjq0tczEudH24uKC2iw2YWe9El49kBx1Gfy+P9MUXJR4tgylgI30VfyoL31tqLixwopyaOzuYgMk20eIGTFcavJEPjhj/UmF+32gXHZ6F0ILB71tObCyCZt5Q6cmOoTOPfnH5DPXgqiCEbu8j6fQ0B4vY4l6+gHDQ4nE5QAZr4h+fUGBHHcnHSQTaqQNow+wOY1MiiA3sT6pc8rWtgSHTVbF/nIwQ8xpI+YXujeYD3yB1ozaNWMra8xW+PYtxaFBpmVthHsyuEI7wxOvsu38Fc0wmvyv1eXdPC+ZTgNxCC28YeuuPhwKcrDNs+Zk2CXqB6GXrwLYYJI2Ks0KshMQQULgzdXHDAXygs8mj/E2AqtTmxY4fDRXCv0fnvWmPIEriR9Ggu1aj7NDYsN6sMRRdDTb/z3/sGMSODq/uqDTOgiVMJzoQ5wJ/6ePStZtiGEZ5gU6c1O2S4qQHrWwFejSAP2EdztDteDQzb2+s7+xR3a2HMK1O0W3OTs5S2ImKMMpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(54906003)(36756003)(8936002)(66476007)(316002)(86362001)(508600001)(956004)(31686004)(83380400001)(31696002)(4744005)(7416002)(66946007)(2906002)(66556008)(186003)(52116002)(5660300002)(4326008)(6486002)(26005)(38350700002)(16576012)(38100700002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tnhjd3ovMXA2dkJzc3pXUEIyNE4rY2YrRTFmbnZrRkFJVmpIWk1WTW9rbjQy?=
 =?utf-8?B?bkRLM1Z6V2theFI2Y1JrRkxYSkVqandQZS9qeVRhZE5ud3RSUS9nMDlKMWsv?=
 =?utf-8?B?cU9QSE9QUGRXTWIwcWNHYkRoREJDMlVmNEVYV3RUQW81WW84YWgwdTlrL2dr?=
 =?utf-8?B?anFWTWswZXk4UUp3QXdTcGwvV1BLcmlCN01rTnB4dE1paTl3aGhwbkx1dXlC?=
 =?utf-8?B?MkNQTzRJMnNuMlNNcWxpbUg3Qm1HSmtGL05Zanpidkg0Y050V0J1dUVQdlJj?=
 =?utf-8?B?ZS95NjR3WTArWlczZWxadDRjVldoRGE5YU5JNDZhUUFVNldCWFYyYzdSUlUz?=
 =?utf-8?B?OHlHYVc2VzU2cmJLQWlmOGM3M1BZT09wZXJxcjVSQUV3QjRiNHR2azR3MHR2?=
 =?utf-8?B?aHlGMVJkNXFwd2VSQzlnSXZaZURCcUt1S0Iyc2FzTExWdW9XSnZHK3NGRURO?=
 =?utf-8?B?bFdsTUhJNHBPSzdTMERkblFsenl5RWNvdFFjYTFJY0x2REtYSFQzK1VvbElk?=
 =?utf-8?B?NVA5ZXhDbTR4VUgvMnpZNktDdm04NFpFOEllRFMxN3dxTzVQQ1BBM0tkNTFn?=
 =?utf-8?B?N0cxVGFVd05MUFdMTE5veE5KMjRpYlV0bndyYzVIUWRTKzQ0QWh1OEZrVDJ2?=
 =?utf-8?B?SVUwSnBsZHBFZVZ6cHdlNjVVekFWNks3Z25IT01vbG81cjNaengwSHI0cjZP?=
 =?utf-8?B?L0VwSmltMVFXdld5WUtHazlCdklIWnN4cUNLWFNUcTJsMVE1cjVjOGptTjd4?=
 =?utf-8?B?T3VoM01yWkJLSm5XOFhhSnB2cEFaUzg5eFlveFVnMWpjb3JaSkZOLzNEakFQ?=
 =?utf-8?B?ZGVlNzV3MExYdDZYRnMyZXhFRHRYMWtQQlhyZ3hiNG13MVJCcC9wN2xjb0VB?=
 =?utf-8?B?RlE4YWtLTndSTUlsNnI5eU53NGZ2TnVNd2pmSnc3S1JZanM4bW1RUE9GRXpC?=
 =?utf-8?B?MThESFpheVFqaitzUkpuVGxGL29ld3RlMDB2MmtpY2VWb2hLdGVZVVcxYSt2?=
 =?utf-8?B?bkttNlQrT2FhWitiMmJZY3gzZnpWUFpjOHdBcDFJM3BIUEJMN0xTbjVvYjV0?=
 =?utf-8?B?SUtUcmJEV3o4MDc5anFOVmhUTjUxWUgrZkZ5cmQxKy9hWmJLRldEa0JTNWVH?=
 =?utf-8?B?Nmc2dTlKV1NlbDRpd1ZkNUhJL1kxMXlEbGd1bFluQVkwRmkwa3p0L21hWTZu?=
 =?utf-8?B?azJkSTFxMnlRTDA1eVVGemFEZ09lTFNoanNFT2YraFV4ei9STVgydjJ1TUNu?=
 =?utf-8?B?eDlNMjgrTlR4ZW9YQ3YyY3VITC9MTldqOU42TWpkL1g5UGxEbU9tMkxRbWlQ?=
 =?utf-8?B?NThwQ2xWQnA2NDRqcC8xZldtZVk1MkExdGhIeUlnejBJbTUyUGQ5MXp1U0kx?=
 =?utf-8?B?QXJXdzNyejA3L25ZaCswZklwbDRabEd6ZGtxUnBvR3R0bFN0WVhrSVh6ZFNC?=
 =?utf-8?B?Q1IyeUxhSmxQaGREK05lUlYxWnBxa1p4TGlRTDUybi9UR09jQnNVQjFzV2Y0?=
 =?utf-8?B?NHBhSWFIemtSRDlUdGtmeHQxQ21YUWhrWFBrQXBKd1VaZzA2a1h6Q0tzcXAr?=
 =?utf-8?B?c1Q3SUMwTUYrN0RxNWNkbFRBQzVGaHoxa2xmUlJORVBFRVk0WWhQTDErclJM?=
 =?utf-8?B?UFVGZXFIYjJaNUtEbTdEZXFoY01KMVYxYUJyTlp0VldkNnpoSzVnaWNEQnZh?=
 =?utf-8?B?NU0rVDIyUzBwVFBXUlUrMVJZdWUwRk93YllrZUtTcHluVUVOcWxueVBRWEN3?=
 =?utf-8?B?dXN3ZUU0bURtSTBtU3ZiZjZqekd0djdUWXNVMFIvTWhYNlhtd2JWUFFhRWdC?=
 =?utf-8?B?TUh3MXNKNjZSZStxejR6UDN2TDI3U3R5Nll0WHBNMGcwcElOdXIyYXZidkVL?=
 =?utf-8?B?cFMxY0JDYW1RQW1CZ2Y3bG5QcHl2bWhuRVlNaVV3Z3djUFpEWEF2WnJQNmFL?=
 =?utf-8?B?bURSbWlQQjRuWXlFOFpyUkdLQzM2K0hpa1NrUDR5UU82QW4xR0dFSmRNSEpY?=
 =?utf-8?B?amFLZStwS0JYZzdGZVgzYVZ3dXJMNnZmUS9leVdicVpOVC8xYVhFRzJ3eGlL?=
 =?utf-8?B?YktsSytsNWREZHR1bWxaaDBZMFNjaTlZTEpLd21xSGJOOHhHd0owNHRJZzc0?=
 =?utf-8?B?UjEvUU82M1ZGOC9TaENrQ3Q0UlRMMEVDZlFmcjFLNzRFMlZrMjBncmJBc2lV?=
 =?utf-8?B?Ums1M29FOXpJb1lzZ0VnSldlRnRoUytMQXJoL0NlVnp1Y2c1VTZ6VTZybm0x?=
 =?utf-8?Q?YqTFNJcqhPDKGgGOjr19X8R/zQFFIV13jwwfs0+8k0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b16779-8ca4-4a22-facb-08d9c0837d6e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:02:02.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so+XhCfOgkIGn9G2x6+53BI8XXuvMTfQbJaxicecnoGWGnzhiBnrM7kUc2sAgKKA2+rAUGNis6hr5wrKKT7OgzI1iKloHYMcDlfOWo79r0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3540
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

15.12.2021 22:39, John Snow wrote:
> Simply import the type defition from the new location.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   tests/qemu-iotests/iotests.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 83bfedb902..cb21aebe36 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -37,7 +37,7 @@
>   from contextlib import contextmanager
>   
>   from qemu.machine import qtest
> -from qemu.qmp import QMPMessage
> +from qemu.aqmp.legacy import QMPMessage
>   
>   # Use this logger for logging messages directly from the iotests module
>   logger = logging.getLogger('qemu.iotests')
> 


-- 
Best regards,
Vladimir

