Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58C34400A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:41:56 +0100 (CET)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIwV-0002rA-GC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOIuK-0001tL-7Q; Mon, 22 Mar 2021 07:39:43 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:65159 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOIu8-0005Pi-Ei; Mon, 22 Mar 2021 07:39:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2qkKWfquDSuZV1ZONVNs6ObXpR/iJDvr6EkCA3V0mAVj4m/6QJhIXNtXST0HdcmYxjCHerf9YHh+Sr8YVGp4e5D5PMKzUUf0DvvzJqqf1jUeK1IEci4PatQ78Eg3lDZZ2MU3wFaJ7AKvHIEYviCpB6CQEJ/EmrFqb8ikyvtsUsJVSyhTC08ZOXQDZn25BVk6Zp/KdcfefBXzL06K6MMquQfTQ0SOLeIN8xVWzYuEJ0eOkVFzZw784VvoZ8cpMeCQ3GtyOfKjcc8VK2nYQKa48bePZuszL6ZmSg6DEbvN8GgLaF9yr2pVIhqJtW53H4UAXkgOIJLQ6vBzBeA69qwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUxRN3qYYxm/T5q4ckWDwqbnoMGgyhg7TjmmDW6uH2Q=;
 b=atiQXRbBV4cRBa4BVRL5ilvL0pBDHyeVkEzP0pydNTZhLqT39ftAYh0mCKyr9NzaMRItT849U/KJzc0ZlWUaRROuPlaebddW995M/LoxXarW3fOIDFAU4seIRKGfjA3kOgHHDL9JWGCOThwpAXC01KUCgx42KdCI45KiirI011rZ64kpDnRicTHhlkyHFvv85hTiQnBxXETDCYZyCN1F3/3H76hbrdCitfkgUhmuQi38DZXE5LdCLcGeiw4tTUaHcKYig75wDDO0M6GiXq+39lQ6U8sSW13tRYC/9uyGu62O0aLA/lHUHmT68oxiVIakxaOTl300hCdAqvSwlmQceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUxRN3qYYxm/T5q4ckWDwqbnoMGgyhg7TjmmDW6uH2Q=;
 b=uQeM8ymZBk25p+DQEN7Kf+c12Qp8GAhxUtMeJcRv3hEkyFJE89HvhTZ5BAaG9GETo/47VUPI2U8uaTsC7TxoWrkLzvmgnwtkZIC49766yNtkL3dURnVjF5Mr5ivUvgNBPW/nI71NWb9f3MPG9ReP7WuG3kC4TC5MmVpm3algFjU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3472.eurprd08.prod.outlook.com (2603:10a6:803:80::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 11:39:14 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 11:39:14 +0000
Subject: Re: [PATCH 0/2] Fix crash if try to remove bitmap on target during
 migration
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 mreitz@redhat.com, dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 jsnow@redhat.com, eblake@redhat.com
References: <20210319204124.364312-1-vsementsov@virtuozzo.com>
 <YFh/atA9gTnLX18v@stefanha-x1.localdomain>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2b139656-fb9b-fa28-aa87-cf8ce3655d8b@virtuozzo.com>
Date: Mon, 22 Mar 2021 14:39:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YFh/atA9gTnLX18v@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR0701CA0012.eurprd07.prod.outlook.com
 (2603:10a6:200:42::22) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR0701CA0012.eurprd07.prod.outlook.com (2603:10a6:200:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Mon, 22 Mar 2021 11:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5810186d-e9dd-4dac-1ee0-08d8ed271e9e
X-MS-TrafficTypeDiagnostic: VI1PR08MB3472:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3472957EFF785E7462C38855C1659@VI1PR08MB3472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubIo7oyjC9TNfzncpjJCgrBBYdXYB1p/pJxXLAwCFwzaSxrtnFdLLpLIHI2k8nl0NJ73k6h1hAvd0DKHiQ+9kXknbgERNv/ISQ6/pGhdEigoEv4LoU4JANacDiZrW3eqTD4lZES0gs/ToG8ROtIqz5nMaflKMXZvtIAEAuwxrXuTA3qxdZ9SObAExquNej8aRyj2BRrvz+CToVjtCGm47a1KuHm3oHtEwJrMw/XEukqknXIs6ixweSqqKyypBNwOVVC12y7MwXxV/8fEramooAUQr90yFORCrEXmKmiluAhPaaSs3w6ikuTd5XTldUxJSCGcs0lUdeKeW0lFArVuw9qlR0PJzWzoQ0tLnviiY7gS68d6V4/HdBS8ONWBQ6B3B9LWn4MmOxjgPTf0EAo/FMy2OOrRM2ayuekbKLr09jslw6IUVBKvZfoFhOYGGJp5/Vla7hwNdtuoBx/GcENViLBERohTZbF1sWhi5WngpOKzhkYmMw6LwZ8+H+qKxPmQoyrNk6ch+wJdfYGk8Li/asXkcQpyK75/Z/u0ZkKa3e3/Ztf+svOE6A/mM6X/7nxJvXjNEIbAEd9lLvUoKoTkMrTcw86zf34OGjo+xRTOgajR/pd2nsbwNGnuliQPW7SzLwhBi2j/z5hsmavocKtRfokoyIiTiIzcrOUP9tKGUhSXNJat7wDvv86vaPa6YWKjVJgOdgc0UnzmBNW7IgO0hFu1bWjWnXM3mtJPr/+9MOVY/bLOa4UwFrcvYUzc3clx3faI+BK6wD0ASnDRwCLMUmNwniK5EtbW8fmpITyZEBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(376002)(396003)(2906002)(38100700001)(8676002)(36756003)(316002)(8936002)(7416002)(478600001)(31686004)(16526019)(966005)(26005)(186003)(16576012)(31696002)(956004)(6916009)(66556008)(52116002)(83380400001)(66476007)(86362001)(66946007)(5660300002)(2616005)(6486002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?dsaoVcscMRz/9X4l6WcFGhdHbFV8adjBfkd5kSO5/Q3WT2WfV4J4m6Ip?=
 =?Windows-1252?Q?jFD81Oa0NUaVaki6D5bYPI05iZx2AY4l/cdQrYTyxovJim70xRCVPofN?=
 =?Windows-1252?Q?rFTpgSyxvL3FcK/O06lz7e/Uu5Mpyp2WY8VckH6wEJLw3ovOfYLF4cUC?=
 =?Windows-1252?Q?7SJHMjcqDajlcioZZ8riPhQ2gKpz7bpSXGeNB2QK8QOnNKHZYUDk9nyF?=
 =?Windows-1252?Q?CHsBuqzBlJ9Yo+UzbKsyrFGC+e0uRdctTQr9oeDrbA1zPJKNarndHZmj?=
 =?Windows-1252?Q?YFv8woEX7b4JDkrX/EFQW++eA0DN1JCBpAJQC5Pj1d883Ce2hX8Wn8Ce?=
 =?Windows-1252?Q?96cPOJ3yMNH26w/vix4TUM9/iUp7KuEc1nURJWa3AogjoDSkQw/D8G8I?=
 =?Windows-1252?Q?BHvlEq2oQ0jBYdzyQWPj+W+WBEmycWS+V/yO0ttrRUbExdnAyQJWswJU?=
 =?Windows-1252?Q?A9Im6MPqp+4sSpuOeFYHWn0LSkWodKkAC4jNphlK8eyn9H8TSDjqudhy?=
 =?Windows-1252?Q?EnG/UbYl5qMpj3dh+n4AYV1RF7f5sBddEcNShLliuoI/zaEl3kV1fZEH?=
 =?Windows-1252?Q?kcTXGhPMMd3C2z21hBWr0aJbFX3BYBx7OcQuVMmQUx6MPV6D0YaS2sGa?=
 =?Windows-1252?Q?wwHnx7VgW7/FMJyoWxwFAm2zrMm1V9aVMbR1IHJdtwWJdpMFwaaEu7A6?=
 =?Windows-1252?Q?yAxUZyuNEhzAADVdUG/J+OSmCu9s+bbuC4spUQdMZK/70NM7R39ddOsG?=
 =?Windows-1252?Q?VuH6h2kLgjgASt+iqlbFtjQATxgbvWGVSlkJtGET/tloifTp+xw2bfX5?=
 =?Windows-1252?Q?fC2YmUS1LFJ0BbtJfot5GTRbZ8G6akEEP2Cl3F0lO0EJNgCaRRGOq8Ss?=
 =?Windows-1252?Q?1VaTQzTLMtyszBnLCUiIe8UDpZ+5to6YFUqrQktGP2OhrQXP0JVVktum?=
 =?Windows-1252?Q?B5HKIAV2NJxp72mVC/jeVIeckwFfACvs37K3AecS9Em9KNJ3RQMLIsSc?=
 =?Windows-1252?Q?NHPwkfp2mCLvpbwcyA7CtvkLC7bLIaHrcvgW4pfTTlkx5GRWd78u9RU2?=
 =?Windows-1252?Q?JtJ5nsEkAE40uHYsO7pYb3eKdVTuNwgkbo3nPoTnQMzIYfLY0BsO/6CN?=
 =?Windows-1252?Q?vvtImdBlsHqooMtuph7ZcG+2vNkTvMq5WLm6lp68/LZv7U/+kMabhhLd?=
 =?Windows-1252?Q?8M3m0yStUT9aHdA710ms+P9ZOZ/Tf7DIAVi5l+X7fFgttGY7jwhqDodx?=
 =?Windows-1252?Q?hSKqdptqE3tT5jD+yBuoLuyCGjl72O4wkUVsyttDx0m9DO5gvBsSiyBg?=
 =?Windows-1252?Q?fE8CiZscb9/PSI/PqdWQ92+OVoLdgkec1pU7m44YuyLIE/zGPYO+C/xc?=
 =?Windows-1252?Q?SOpW+h2fTJh/3olGs1WJq2Z6bDZzHFZYz1Zl/4d4CNA7dA0ghHfpZ61T?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5810186d-e9dd-4dac-1ee0-08d8ed271e9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:39:14.7774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fAQHRUedSMLkKaTu3NlM8K9IgHkEW/xgYLeifByzRExzna4ZJBnFjd7mlEDP0W2zKFl85/kdDT6Jj67b1XAtPmc95aLNmAGU/iCpqpTucA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3472
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

22.03.2021 14:28, Stefan Hajnoczi wrote:
> On Fri, Mar 19, 2021 at 11:41:22PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Bitmaps on source are marked busy during migration.
>>
>> Enabled bitmaps on target have successor, so they are busy.
>>
>> But disabled migrated bitmaps are not protected on target. User can
>> simple remove them and it lead to use-after-free. These bitmaps should
>> be marked busy.
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>    migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>>    migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>>      bitmaps
>>
>>   migration/block-dirty-bitmap.c                         | 6 ++++++
>>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 9 +++++++++
>>   2 files changed, 15 insertions(+)
>>
>> -- 
>> 2.29.2
>>
> 
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block
> 
> Stefan
> 

Thanks!

O_o. Somehow, I've sent this thing twice, look at "[PATCH for-6.0 0/2] Fix use-after-free, if remove bitmap during migration". Sorry for the mess :\

patch 1 is the same, but patch 2 in new submission is updated to check that bitmaps can't be removed on source too. If it doesn't bother you can update the patch 2 in your branch too.

-- 
Best regards,
Vladimir

