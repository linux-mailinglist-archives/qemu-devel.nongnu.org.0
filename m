Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE64A972C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:52:22 +0100 (CET)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvGP-0003jM-RO
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuaW-00041Y-FC; Fri, 04 Feb 2022 04:09:05 -0500
Received: from [2a01:111:f400:fe06::718] (port=48006
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nFuaU-0005IT-Ty; Fri, 04 Feb 2022 04:09:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=litZDSZtze+S5QyvQHtAFsoH/UcryXhXgNA/IMVNcmRBumi8HCMUUibCy5s6q29Wmc88vILaqYD+DHARuSWp2/jdGB1J5UWczOZkAgDvakuHmnss5p9Bc7p6g2SLjY3JiuLHH1tNffFgg8/1QWEhwrCEYTssXV7syFQ4k8hCsfITPclkr2BYqZguiojxSuDBOtHdHLzMUdOCjkcn2lMXmLHyXyRN2LRT7VQhvPkpZW4nwYp2uZhr6yWnvl5RKhzdMnuUzHGuCGVx3IMwT1H6W0fVhv5n2nv+0+2wN6YCt98qzvkM0nXLln+QXTjLjWWpDrG/Q18HA+GHrQr2oaItCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w1JMkXKcK11ZynLBmTL21UoIA9PvPvaJ0JcTrstUUc=;
 b=mVXJxa91h37vJD8+7SN4+haI1Cs2I3COP9xNJwxZUK+iBh+8QNHnaaj903Ww8AnKEraZR8Vk1hCwIwQi//Fb9NjbjDTv+1Q7XaTQ0jkExYYLSGek0w7Ax1CUZi2tzi2Pzhx4GGcBcozQQZA3ePpCGOskPdW+KusfJFjhF1jGC0SLzUw3eSMqHXhuyZU2kk4uMhhgChDrtLhPK3HuALBKLTYmgu9c7kkO6juRP9jteiNBiCjXZ9btAhDe89lZIyALkZtD+t/ITFZM9JtmWhJlNpu8YBMzrzZ7LM6tLvkl66RXSHzdHxcOVMyK5a195z1b/rEJyDWP8cVfNm44n/gSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w1JMkXKcK11ZynLBmTL21UoIA9PvPvaJ0JcTrstUUc=;
 b=Bvu2F2x1JtCKPOatNKfdjrrB4nPR7fQuaZG0FYN+2F0IIvq9u+GH6vIG/Cq0ulBfi1nQNcizCBvkdp0vmTb8niT4EPRZuggU6uQyJOh4czIO2yzO+4ZbNWeSHrCuQp36JvZm7tRZ/5yhcwK2raKum6VePDUihgICweGgiYvG0Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 4 Feb
 2022 08:54:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 08:54:40 +0000
Message-ID: <607ce13a-6a4f-fc19-2412-3f504456b643@virtuozzo.com>
Date: Fri, 4 Feb 2022 11:54:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/7] block/nbd: Assert there are no timers when closed
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220203163024.38913-1-hreitz@redhat.com>
 <20220203163024.38913-4-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220203163024.38913-4-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d2a8df-8ec6-4b23-756a-08d9e7bbfa9f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3309:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3309099EF3FCA63A1431C5DFC1299@VI1PR08MB3309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9f42M/39UYU6oafD+jFBXm0jmcf6adS7wjM8kJJZNBvr71JRNcZkBYN14Ix+wdDuoVbR1oS0sx+PLnqQzIEGPGB/VwVamTEb5ekbRmIgCMwthkJMB688GvmavXTWeWgTAEKATXvJkrPcSY4IyaGvMtyAlbjUrJiM5X70eXDdSuyDl4/1qbxPzicM0zq+IBIlx/O27J80Z5cHz8qsaNRP2oIbvaK/KreNutJVKQpS2z2/7IRFIuThsFcoBotrXBkMYi7QFQ1sZck38HdTY0DCB+Vg7hTu0jv7vSHYpRH/+70RtYC3ZvvEKEPOTaP08yAjerrd0nDj9PJSlEkVs+M/5zsQlyk79zKbcED2cKhu2wUoKV/u88D8GYOUYBQDIAAp6nAFrOpGYC7ldZbrqoLG23sri08npR4lHe3cwhxVXJHyuM/Vt3AguB/fBgK4vlbK4rYxqidJoum79fmwYt087JnZ29SZPNQs3iwDu8U5YyOLCdBd6UhMnE6vKfmSjaxDufNs39enBrz9eUB4JtFJcePePStWHhhwSlaQCL3HmDyYOjSxpDK48xKu4+8ONG24VR9TYp2k6k3oe37TUkmFb8NccOQUvZbSPROj+JQ0fh3GsByw9h5kYtHmdO3K9cpyJ1p1WPBsMfd6YjGH40DM956cU62hFV5mcPevByk50/CkUtJzJwe2nYIh2uAebAgjffdCqxNF4fCzyhSpfxaqwdd0KYeO7H5l4JrlABjZW0HNCpyT09QhvxrKt7K3dduk1CBur4n1L27LTdS0C0P0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2616005)(6506007)(31686004)(31696002)(6512007)(38100700002)(54906003)(52116002)(38350700002)(186003)(508600001)(26005)(6486002)(5660300002)(4744005)(36756003)(8676002)(83380400001)(66946007)(316002)(2906002)(4326008)(8936002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXFRR3ArOTRkVXVEeGVPU1RSYmZYRCt5VEh6NWRYTTQxQ0hMUXpaYzVBTjJX?=
 =?utf-8?B?TzBoajR5T2hMdGtvbHI5Smo2L283Q2F6TUwyT2dRTnk0UWh0RVZrSlo3Y09P?=
 =?utf-8?B?SXBRUU1NWWJ2NFNiOGt0WWRpOE1aVzhUOHlXR3QxV1F1NEg5UXRlbEV3MlNy?=
 =?utf-8?B?bDZESmxyTE1zclRWdDFvNkxsRU9OeG9NbDEwd01wM2s4Y2htbVZBWlZDWEt2?=
 =?utf-8?B?cWdZOGlZeTYxdktIZjVpQnJyUDdpTjlQdW9BamtPTVNDcFduejdZRW5NU0oz?=
 =?utf-8?B?SDl0OWZSS2xoNWVRNkRjWFBHSFI5Vm11Y0htSWpqWGlVUkxOVm8zSnI4VXkx?=
 =?utf-8?B?eDhJUHMxbzk0cGd4QzZuNU9XbnRFVFJ1RjQvWUZJV00yLzdBeFNsRmdtM3Q4?=
 =?utf-8?B?U3Z1bjZRYzNEb2V0aHB5STlSTHBKWXZ2TUtLYVIrQlJuOFN0TXpQWHlJWE5k?=
 =?utf-8?B?amRYSXBWOERHa1FZcXBZV1Z6QXd6UUsxVjNDZEVnU0RDb24yWm9MWXlMRUJS?=
 =?utf-8?B?ZGY3RlJNdWhGVkpjNEJSSmxDVFhpZVovdG02N3RWTW9VekpSd3RhakIvMnFh?=
 =?utf-8?B?bWtsSjJUcW12MHc0S3VESFFyR3EvQjM5TXU5NmpTckNETXhHUzFIazNCZ1V6?=
 =?utf-8?B?ajh2N252NkxCTWUwQVF5L3JsWXBkZThIcDRaL3ZYdFR0dkVIMmtZdUNYbUFB?=
 =?utf-8?B?TnJ5Z1dqbVc5ejh2UXlJZU9zS0dnaCtsQjNQbjUrYk05U3ppbTVNTkE3Nmlx?=
 =?utf-8?B?VE9ScVpMYzlwdGM2NVd2d21TR3RsbmoxNTJrVG5KUmhqMnZOUENBVThsZ0Fl?=
 =?utf-8?B?THI5c21yb0JRUGNiUWpBS0gxeFpvdzRmNkFFUzBNVUVjRkkxbEd5TTVYdUQ1?=
 =?utf-8?B?N1VLMVJXblpLUHprQ1JObUtJdHRpMmx4alJqVW44VTBwaHV0WHFwdWdDV1hx?=
 =?utf-8?B?a1ZWdEdhZjlaUWczbmJtNWlpcThZenJLTDNhSlFWTjB1WWxFOHRobVEyeUta?=
 =?utf-8?B?ZW9ncCtwY3ljNFpSQlp5R3pSak0zOVpwc0xia0ZpYVVvdUNhTFdUODdVNHNF?=
 =?utf-8?B?ZXRpNDlZZmc5MUFxTnZtMXNvaGcyem5GM2w1bzNYbzl6TGNCR3V4MW5uM2xo?=
 =?utf-8?B?WUVLY0NjMEQyaG5LVWlsSXdPbUtQOE1neTcra2R2cEhubEdZMC96L3p1N1E2?=
 =?utf-8?B?b1o4N2tVL0tsOUpFc1V6WXVIZ1F0clNsTDVPazY0Y0tncm5odFpqN3RLb2R4?=
 =?utf-8?B?ZGc1b2U0d1ZKaEpWQUd0TlNGKzh2dVpsRGplYmJOT09MUUw3L3hGNk81UXBX?=
 =?utf-8?B?ZU83WVZidFg2endlYXJObUJKR0liTEZvU04rWnFYekFwbXhPT1VDYlQ2QUJa?=
 =?utf-8?B?c3N3M3JGVElLOXRza0hhRG9PK0x2eFdpWEprZHYyVkFxUmZPRldCM2dZV0Q2?=
 =?utf-8?B?TFd5WisrSW1FWlVyZkM5cFVJU2pxb090a0p3RWlyU2NBeGhkN1ZIWEFWd3RS?=
 =?utf-8?B?eEpLVFJMazZpc2RTVnVpdG9YVWZMeSs2MWlqRldpQjNkUGV2UDBnNll2ZHpM?=
 =?utf-8?B?QjlobEplbmIrVzNoTzJvcVdieXhYNlBxc0tySXErQnIwZEFoUktmeUd1TGdB?=
 =?utf-8?B?d2RsSUoxSEV5MjBVS1RrbzgrMVIvbWN5YWxGRmE2V1dkMnlNQ0Y4SjhCQ0pz?=
 =?utf-8?B?K3NqejJtSyswSDRCdFpteDJaU1NDTXQzbEJ6OEpnM0JsOW5hQUp2aFJJbGJx?=
 =?utf-8?B?RkMzK0RjU3ZjL2VibFJmZDlCU0tQc254Ymt6U21yZE94YlluUm96RVRzMUls?=
 =?utf-8?B?YW94WnNMRXFwTXlzS2tiQzFDQXJWTjlwWDM5WUZLM0ZLZkozSjRYcmMwc20x?=
 =?utf-8?B?RVF5Qis4a2VsaW96SXk4TlNWUW1iY3lrTys4ZjBwOWtSQjE2bXdWcDk3R21H?=
 =?utf-8?B?dGJtUjY0UnQ4WUx0UDhPWDdmVjk0VXJJVzVrdzFsazNqdmYvOENJeUU1Q1I0?=
 =?utf-8?B?NzJPUkNiQ0l6ZnRwbk8vR3hLcllBNGp0ZnV6czcvcXBtWVZVZFBiM2NXWmpT?=
 =?utf-8?B?dUprY2JWZGZFWFVpREhyay8ra05GWkZESUxuZWlLQkJycjFwbVB4VFJaNVRj?=
 =?utf-8?B?SWo4WEg2RUo5YWpYNGVsajlXR0cwS2Y4RmpqYjZPWGM2cVpnQ1hZWlpzWHhX?=
 =?utf-8?B?YmhyVVE2WnBTY1pSSzE5a3k1M3A0QXN3aFJMSFdKYnhiazdMN0YxSlRSdXMx?=
 =?utf-8?Q?te53eOrywQ5r8ujrzycdWueEh7pzkx5gL1fOqhDTWU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d2a8df-8ec6-4b23-756a-08d9e7bbfa9f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:54:40.4758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGocj1Cj8IvkLbbMgno8gKG0TrRwUv95eTBWXahx3WRdYxE2Xh1zi+Q0r3+qYFgYhZrkTpiAOL/UuCizgjx4W5zKmV9dI0+8P1P0OdzNh3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::718
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::718;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

03.02.2022 19:30, Hanna Reitz wrote:
> Our two timers must not remain armed beyond nbd_clear_bdrvstate(), or
> they will access freed data when they fire.
> 
> This patch is separate from the patches that actually fix the issue
> (HEAD^^ and HEAD^) so that you can run the associated regression iotest
> (281) on a configuration that reproducibly exposes the bug.
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

