Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB2476F79
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:07:49 +0100 (CET)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxobz-00027N-Tn
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoXG-0005Nk-V7; Thu, 16 Dec 2021 06:02:54 -0500
Received: from mail-db8eur05on2109.outbound.protection.outlook.com
 ([40.107.20.109]:10445 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mxoX8-0005gt-TP; Thu, 16 Dec 2021 06:02:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCSzQIcD1D30CtuJBO21nhe8L0YBqI/gt+7hgI1bVQnBL0JewKUfEdIfrYLXkt7WFZEBKNXciWpvWzvivV3y++7qa82JgYlG7pIvMXX13sCCTWfpHJ3HOVWNq04n2B4fLXr3vP8raiSXHk5nn9xvOmpYSthSUKiD91EcfkfJ1lddEbCnRIMIkVGPsEDMl967n/FollzwAnp1/OozgICv5liHj7S5mpfaC9NRkUesilYnocJ/R1hFQMBJdXRSvzOCg9yTfHA+4BGZiFxsrxbNt7r5NWoHFcfQgnIFcfOM3XIL8xor6zGIY6Q7L/unDo5sB5Vw5pZpLzbyBa32AuYn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OTsOIhVGN2vtM2VzGXHwqiQfYl6aa6nztlXO5igeXY=;
 b=oSDAMbclRMp3HtRcdjmWLIzoIjrbDKejS/E0pU3PgmOdGVDER4i5GE+lW/+a2bs+snYMC1kwhCgCfxLG4gBSEpIoLTQ8lNa7E/myF4aTSydSBsfXt5e0Xy5Q7T3rQ/Cuy9n4Oz1Koev+gWM3a6M1R2eHiuwjvL21nRjsjBzykcIOfBslwNwq6E8Ot8BPIBbfcBgAiLwyFIdU9OIfr4QtdY2ieHc+KEKQu9br7VbgfUwbM+/Zxc5vB/Hh51xhZy4L+zDvQbDQJb9mEqE3DSEERSdP/4F5CzH5UKXrupDeKvGZCQtjABaCV+U/lb2P9PboRrcQyYHG8S+RVs8gD8P7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OTsOIhVGN2vtM2VzGXHwqiQfYl6aa6nztlXO5igeXY=;
 b=QA6T707GILtecigyYQ3AF2qbeUmCfo7Qps7CAevzvHExl9ExmYgJPJ08gDI9s6ZykFBP7umNl8U4opE6MhESqJgIMOZZyGJd+/nnE2yG6/LNQNT0Ioccp6HE/xdwaqy4DRj4QUFlhlQKldHx18lY89YTfZ1rkL6LZeACSdmFzBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6290.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 11:02:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Thu, 16 Dec 2021
 11:02:43 +0000
Message-ID: <2489fb6d-b820-8b59-5822-2e518671e473@virtuozzo.com>
Date: Thu, 16 Dec 2021 14:02:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 19/25] python: temporarily silence pylint
 duplicate-code warnings
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
 <20211215193939.3768033-20-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211215193939.3768033-20-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0055.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::32) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 AM6PR0202CA0055.eurprd02.prod.outlook.com (2603:10a6:20b:3a::32) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 16 Dec 2021 11:02:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c764c5a7-d1d4-4e62-e422-08d9c0839574
X-MS-TrafficTypeDiagnostic: AM9PR08MB6290:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB62909E3CDD21A8B12B76CB59C1779@AM9PR08MB6290.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EfjzpAyLj7RHzbscDlQyOKWr7PwrKeYRToxLWWiKwF3vbRq4hfAydb3PEfDod6zTiNsYG7AvcHtBGkT+ul+m9yDujTPrhDCmpSKRA6lz4cIzziLNwZYlUrwnoh+nWR/IluVweyGoZfEvRLuIsB6bl6TF59kr3RAJ1pBSDc3o0swzJVuc0VuX5KT0fsi2tVZHfv5BUkJFVk/QtruTrKIRfCZ7jjgwzCSiB6iisGB2VTAD6W3bi076k79+V48c54ZRmwGnOLIBlmAQ6KrCnXhLYhQuqDgFS6+my7rZIaKrIzbvd1/9VD43nopxzc0V4v9gnM9MM3ouLUUTpC1WOP6p/Eyf17r8X96dFYBy+8IXz/8RodrU8bv5GsYgSswMx72+AVG62KkxqAG2NylXS9bWOFtH2FyPoYS2WhE/+0+BgUJk42R82mcF9r2gJtJedEvM4tZZidQdYMWQzIGBh+lOPT7BatgARvSATWvL1oaxuEobj1uqTg12RHhoX1uULrEjyoZJBJJaRXBtFU/ZWnuQhNVS55k/nWYK0R456JGpRKMlxAkicrz77OfqyssyKD9lbedTqB+ZVemvhIqtg0An0dUJSSyXML57C0CXVF48/Rie/tOdB7G7TN/W6H0MLYTSXWd+SvMGqUJscC9Qa51KneBI+KHz+Qy2QEx1YdO8j5ubDz9IY/IraB9NtITyR5VuyBXRGNW/qXfdiFyX7BcIC9LMB8cu/SJpp5SZrQM7edYXpRP/fua7DWTZ/53cmXX6py0MZ9XqceqfWdyL94v2nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(956004)(66556008)(2616005)(66476007)(86362001)(31696002)(52116002)(36756003)(66946007)(8936002)(186003)(6486002)(2906002)(7416002)(16576012)(38100700002)(38350700002)(5660300002)(54906003)(316002)(4326008)(31686004)(4744005)(508600001)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNIaG1uNlpnYTJVT25nUGVKQWVmVG1sSjAxOUt0NTQ4L0lqdkx2a3hHNHY2?=
 =?utf-8?B?K2VNWlJUWUN0K2JaQTdGZnoxejRZZ3U3NmZvSVYxSDdqNjMvSURVVEpvZ0k3?=
 =?utf-8?B?L3dMZTBleThicXZ1SVh5RzI5eWQybjdaVjJmaElpZ05Yb0RCbGtPOVN0UWFp?=
 =?utf-8?B?VXV3cjRTeDhYOElvM0ZWZkdjZUVTeXlydXNyQ3RIRHgxaWxBRnlMSXJLRnZP?=
 =?utf-8?B?Nk8yckZ3ZFdpQW5ETE1ZekR6K1puMzhIdDcwUCtBbWJmSjhkclpnZVUwVHln?=
 =?utf-8?B?Y21VaXNRL3NOVW52dVhRMGhGanRrK1E5T2ZGdnhPUUowY0U4TWhEc1hGSDgx?=
 =?utf-8?B?T3VRbkN1MU9SSndsbHhXRkVrWFZSRFNlYzN2RjU3ZHVsekk3cjhXQk5nSjdQ?=
 =?utf-8?B?K25WOVlkTVZNSGRsK3JnNWh0SW5LSXVxODU2OThBQkR4ZDRLTGs2SFE0amk0?=
 =?utf-8?B?T0hzZVdNT1M3NzJRZmNhNTdob256K0lFYVI1YkVrU0c4aXQ3WXZNU21NVGhl?=
 =?utf-8?B?alhnVVV4RE85ZXA3NFBMclRjMzVpdzMzVUxNUnFXU21ueTFZY2RJdGhyT0px?=
 =?utf-8?B?ZUswK0cwTUxURFpIVFN2VHZDcVZsMnBuMXp4dW5uaWZBMkNvcXBKZXBmK1Bw?=
 =?utf-8?B?YUZDM0d2MmNEblVvdGZSVUxDdy9Sck5waitIWlJiNVpyYW54WjZXT1pPME9J?=
 =?utf-8?B?dnUyN21GckhmUm5QOENEQ0l4aUNqdjBNeUZxaXJVaW8wVmpDR29SamNwaW1Y?=
 =?utf-8?B?M0YzZ3hzMWFPQmxqMi9QdkRWTUdrUFhQTTJiWVlxU1R0RGt1VXFrUEx0Lytq?=
 =?utf-8?B?T1l4N1lYQjdBdjFVTVMrNUhQbEtqUE9KRmk3U0VxM3N0UnNrQjlvVVEwait2?=
 =?utf-8?B?TkNaRTJZRUF0R3gyOVhCbi9vS1ZXZUo5OGZMa0RZdld6Y3JQQ1RZZ0RoQk1T?=
 =?utf-8?B?aEFWV3d6dks1ZjNBTWxhMW80eS9iWEN4TVBIejI1ZStiK0NhbklVRm5ZMEtU?=
 =?utf-8?B?a1Y4T0htNnRwSEpKc0UvbEdqV1o2UTBHRThRR2hubFFpSmRUSFY5NkErV2dR?=
 =?utf-8?B?SUFUVEFtSCtSRXFlcTJqNzRnOVIrQXF6aXBrNlhmNm85NWVRVFZHTDNRNGVU?=
 =?utf-8?B?TGh1RVp6bzRYa3o3SlJsSnpsZG51NXNtT2ZobEpEdis1M0tBR0hoaGRDbUc3?=
 =?utf-8?B?MW5LcGl3YjNjcEEwL1FLOVlWY2s1S1dia2xjck80MnZ1V3VDM3NybXEyc3Zx?=
 =?utf-8?B?WG9vTkwvR3R5aGJkdllFVWlLZHg5TVhzbVB0VXhYZlRTQ0dlbGczajhOeHNG?=
 =?utf-8?B?WVMydjNKZDN5Z1Y0NUlYdzdnVlQzb0NqQWdZVkJGR1UweWpzeUJycTU2S3ov?=
 =?utf-8?B?NzN4NXREMG5IL0Z4SGZFMkQ5bG9KYUZwZ0l5c3V4bHdOZkFDbW40RWJsem5P?=
 =?utf-8?B?YVRXTS9HM0kzT2ZESllBQlUzYVN6VzN3NW9KTzFXQThsY1ZOSGRIUVN1V0pT?=
 =?utf-8?B?eUZZNkplWkJzM3JoRmxZVWdiMFBHajZuMk5jUEN2MzlKVm52dEU0MjZTUEd1?=
 =?utf-8?B?UzJNU3Q2U0FzR295SmFSOVZnYURXZDZiNW5FOXEwYXcvVHFOTHc3elpWaG5P?=
 =?utf-8?B?Y1VJenlaUHRVUUl2QnhtbmoyWU95STBpYVhUZjNXRUZYZGQrenNNWjBVMTBF?=
 =?utf-8?B?cnp0d1JabTkrbmVqY0xxdEYyMlFVWlUrUWRjREIvemZZaGtTaXl0cFJoTDNK?=
 =?utf-8?B?TFQxQ3V6VGZEdzZZd0t2aDVVaUNpc3Zxb1BQVE1oM0FPd2p4R3BVYzNLVVEv?=
 =?utf-8?B?eWVkSTZPVHluWU1OYkhSbTM5aVJvM01ZKzZIWFFtNm9sSXJlN3IxcTB3S3FU?=
 =?utf-8?B?SjA5SzdIN1RuRkZNZ0FNWjRhUWdCVm5KQ0RFc0k1SVFxQStZais2QWJzOEs4?=
 =?utf-8?B?YVg0SnBoazJ6V0FTaFM2VVR3ekZOcHhZTXNYR2dQZi9DVmREVWN0MENwRiti?=
 =?utf-8?B?amRGcmxzd2Y1ZFo4M0pydXEyUGp6VTlmRHp1V1lGZFg4TzFURzhudVVDYjdx?=
 =?utf-8?B?SE1YMHZ3QTNuRGJTbEV2dVdCY1I2VkE1T3JoOTFNQ2F2ODVwbGxUc3hVaHdt?=
 =?utf-8?B?ZzE1MWRJZldNMlVlVzdUdndpdDNPYmk5K0dmZFV0OWpqS1MvMlNMdWdSV3VG?=
 =?utf-8?B?bG10VW5sdWdtVkhBS0d6UmxyRDJsTVRTVWdSRnp3QisyRVBGVWZNV3FPNnhF?=
 =?utf-8?Q?b5jCBt5fUwALbZ1PCc2hWFRDMGs5fr3+Ifm/GBlBnM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c764c5a7-d1d4-4e62-e422-08d9c0839574
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 11:02:43.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgA1BL4H7/LJMbVoQ94v2sZcauLasJhfp4v9VovEj3yNvbYe8aDMGQ3eILxGUCkQE0KHcc19IGBoFdlFumwoYBNVf6+Y/DdFf/7rwHeLmN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6290
Received-SPF: pass client-ip=40.107.20.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
> The next several commits copy some code from qemu.qmp to qemu.aqmp, then
> delete qemu.qmp. In the interim, to prevent test failures, the duplicate
> code detection needs to be silenced to prevent bisect problems with CI
> testing.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

