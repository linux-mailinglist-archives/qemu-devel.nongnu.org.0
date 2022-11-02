Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAD616733
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:10:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGHi-0002VB-ER; Wed, 02 Nov 2022 12:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oqGHe-0002Uv-Mj
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:06 -0400
Received: from mail-vi1eur04on071e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71e]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oqGHY-0001tH-Rs
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs+RkhLsKZX1cwJuAjSjCdidVvurp3epBgfhrXQ9TK5iDwSWYJvmRB6mJ1JQ8y+aIOloOMSU1e0NoLrWBgynlmXc+YuPlf/RfYCuuLo0cvdmiwFCnlBFG80qpeddyIdTY6jcyZVv6J3yp8yYeuQK5a5fNVHaHcx9O9uGd+LFt5kU6Lse/55IpS6G0rlAMF37O0+L9KdahGEoGQmP0H6BFrW9SusdCxB7FYIQwaqBdWd/86NR6cHaVe0x3TZoD53OuiUNTArH35wpiZEQ8/HFk9B7PjlboMXeuk3/xKO8HQU2vWUj73MDNTMRkV30CHgaIGA+I6bB4KG0wqYlKakr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOleRXbhZQtH5ElV0T6Umg85P5nwmp50YN0bN7Php+g=;
 b=V89pMXnsUT6Bo7AKWeN7AgcwfzVVmFsWvu+mY/pIH4TgG2c7YEqQ2jS5LYoQIkWSCBKr+q46bDVzKFjN84HLvwwSt+uuNn+fO8Z7Tfptyl3Wuu70zF3GIJdXRKzEra0HO02IOuAnW9jo6FLrbYeDIL5UAqQ3ztiEcKMU6BuIYacY6ag9DuOh51RfzPJ2FxWltHD/528STTAGl05IH+gLCK3yjoaKxddhr+r3fSniPPe6a6k/aHbbKPClKfl/od2fiUFdj0FMts8rqF+3yxO5qdFWZ0/8vLTyN5qz8JZiexU15SRSuGvnzLD+fS62dpTQFFE0ITSt6rjG35EfnL8ATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOleRXbhZQtH5ElV0T6Umg85P5nwmp50YN0bN7Php+g=;
 b=hfmfPf/pgEV6tT0+T3kbWae3L8wqovu6dkF5uzy6VhEkVDKlYG24v4bnLGWqJDk6vj5UP+fZNVrq+Yq3WmDulhfTfFHAHRXeTvWvBAViCOinHdKYEFrL/6hLDSvUUnaia2iojz7dRYRfOd3UXDIR7GGYk7t/JpTypqMDizC7GQWmKnXgMglgXI+TckMr5HgvzEK1XeZUDI6fsoNLCoXIkuwhJ4RbS5G2bKFkECO+G2xPTi2NL5i5HDPWMBukGFTWpDDRUxqo0iIuPLxdeuA/1vSTH9Pd++qXzqI8IYdMxVp7hxmQq+GzgH8FFAnaHuZfnniIDcCevozgVnuoNirg7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB8370.eurprd08.prod.outlook.com (2603:10a6:20b:56b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Wed, 2 Nov
 2022 16:02:54 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::e2ae:48d9:fe01:40e7]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::e2ae:48d9:fe01:40e7%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 16:02:54 +0000
Message-ID: <f2355101-16b0-3e58-9502-12ea26a8b86f@virtuozzo.com>
Date: Wed, 2 Nov 2022 17:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Using QEMU for VRChat
Content-Language: en-US
To: danko babro <dankobabro@gmail.com>, qemu-devel@nongnu.org
References: <CADfEUTJ4AvfUnwcWtiBk+V1gXrGt6W8cpxcUMbx_MtociwEC7g@mail.gmail.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <CADfEUTJ4AvfUnwcWtiBk+V1gXrGt6W8cpxcUMbx_MtociwEC7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:803:104::18) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|AS8PR08MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c7c3d9-43eb-4623-955b-08dabcebb361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXJjP93VfteTPEOSkBTRKCSunWuwEZyt0FMYiOYvwEjJOJsXWpeObqJmlOOIYDxKYnMeBt4IGNYSdAu9c96pyPuGuVJHpmH9YQfO2v6AFeJ/GMBCMrcNvnsaGZQtWNb5hp2OQCK4tDcVbfERPknJLQxFuTvmplODi9Ati8yTmfi4hejwPFPew6JnYFJqngdYSLe5V0nW10/hE6ZIi13p6YCwHnLUEqIM8ZeV6a6zCwFy/vgu4SmVTKhqWpEbC7IEM5xEPEu+z8kpvAh3Uij35rM7Lmh2ykv5ERUil/atC5A9dqkLj5q8ye4rPF6WTYRw2bQgjMaaDosxHr0r6o7cx1Iw0b8vr78JIeKMrbShPSbRggXBw7NqKpK0sPdr+fUkpcUhqrUH/Cujp5oFK6gT4x+ItZqdhp5eIlCdHhtszfUhjdsHCkGJQ0Caed/XJFk4ToZe1C/KSBEKjTSUvIU7QId0TGmrGpLtQogCMRvuYre6Boz0a+xyXKdZLfIFRH7ZnJk9jHZCMdY/1fysL2zW/AmGAaiEtFik1maBBNuUGee3MY4TGEF5diJUzO9foAwutAZApsYKvmtK4uUtm8aNyvYhw7wph1Oq9ZCsNdV+yMv/MVyDAcifQB5evDRZQ/McSddvXQY+gqRdDjl/gumHlky0K3BRPwcK9chiLoI2bYgskN5Ijaf7ddFqUQDSkSBqAI+LhbGzVvpyBmNx6oVrGfKEFVhDbekm7SpAThwZqTTNrkYzBp8nI9OOiBN7Y7X0seBOOPxpnjonD2Wq8zkgoFOeEit9nI3PjVDxfNaivq7VyOIYJ4xnfMwboUaM0fJX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39850400004)(366004)(376002)(451199015)(478600001)(2906002)(316002)(3480700007)(6512007)(6486002)(8936002)(53546011)(6506007)(41300700001)(8676002)(966005)(83380400001)(66476007)(186003)(26005)(66556008)(2616005)(86362001)(31686004)(5660300002)(66946007)(38100700002)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkVRQ1QwTnp4K2QzcHlhZDZYWVlBOUttc2U0dFREVE5sb0hQa0ZZZm9HRGZP?=
 =?utf-8?B?UzRhakdHSzZiTjBjU3hKRXJqbHl1ZHpWRGNMNHlyVTJ3VFNEODRrbE5SRk5Q?=
 =?utf-8?B?dmRUWS9WK1hRTkMxd2R1Q1VNbXdzb1J1T1FCanNVdi9idDR3QWVEMFphb29K?=
 =?utf-8?B?WlN5YWUxNHg0MzViSlF6Rjd3TWJ1VUswenc1WHR4RVhPSldER3I0KzRjTVVr?=
 =?utf-8?B?eExiT05USUhEYjRmUXRDdE1BbUZodjFodW5zQnMvcWM5cHEwMW1jaUllS09Q?=
 =?utf-8?B?VjBNUGxLejFWcGdTRkNsaVlwUXhRQSt3Y0tNbi9DSC90Z3lHNWkvTHFtOXBB?=
 =?utf-8?B?N2RaOGxuOEljT3lqNFBtMGc5L2M1NkZFY2paaUYrNHJualNSS3grVkVadzR1?=
 =?utf-8?B?ck9JSHhhb3VuM2lNY2czQ20zWjJoTmdmaWNESnRNN3J2TTE0NWFhQjZUQkEx?=
 =?utf-8?B?UC9JYlZNSFpnSjZENzEyQTBwYnZoSWdJV2dXUTdFajRSTFFEM1BPdzZQSXJy?=
 =?utf-8?B?S2dtUFBIUGVCd3AxcW9Icko3TEtWZDZxa09uQzA3K0hwTnJ5NlF3bUdZeU04?=
 =?utf-8?B?WDRHSm9RN2RSWUpzRzRNQWRBekdsV0ZWbFNRYWFCbGMycEpqQldtMW1DWnh4?=
 =?utf-8?B?dEtqU21JV2RRWVh6SVRmOExuRE9VNXNMWEYrNC9Bc1d4amRiUmtOcmxMTHdF?=
 =?utf-8?B?OUoxYkpNZDArVVdjcmpKYzNSQVNyNVQ5dXVmaXZPQytackhuZTA0VVVxYUIy?=
 =?utf-8?B?MGhRdXB0Rjd2OHRsVGEyTmZoUnF3SE9IT2lUUkQrRnpsenZzMlpyeVNKRE50?=
 =?utf-8?B?aXRhSnRBbG9yTGZRek9OVzI2aUI2MVJCYjltVWFkTlNjNDlqZWd2OWhVOFF4?=
 =?utf-8?B?ajhSdWZCbUJURm12YkFhNnVuT3h1c0hXaTFSMTA0S2xIOS9oS3NMMVJOcG1C?=
 =?utf-8?B?K2VnczdLMDFJRHdndWZxNXpmMWFrREZlaGNpZGFmSGNBckVodVIwazJPOHNZ?=
 =?utf-8?B?VjZqalFCK3JyVjk5bUJzZWJwM2NLU01uMXJrOXBORmdyK2VLNm4xekZBSmky?=
 =?utf-8?B?WFgzOWpsL3o3QzBza2FrYysxcXBPdXlGVVdxeHM4ZTlCaTJ3WllSTzRDVmkx?=
 =?utf-8?B?WVA0RWhyUk14ZjBobmxlQU02TGlpNWU0RXpGY2FGTWgzTWM2S2ZkMjVmQ2Fs?=
 =?utf-8?B?cy9rUTJPQUlmVit5STQ3ZlFLQXRKRGIramdtdlpHd3JvS0FZSWNCNUxpUXlO?=
 =?utf-8?B?M1k0emJIVUxvNnZYb2JUQURDbmxSTnhSUTRnU1NYZ2kvdUJLekN3QjNvbkY4?=
 =?utf-8?B?U0tVMnQvRTZoMmlJWHhwa0FXNEIzYXJpejYxcUF5V1NEUTNRcU4vbWNlRXlN?=
 =?utf-8?B?ZEg3eVNOYjJKUGRWK3VSZkRoaG9BMUFXMGRUczI4WEw4ZDNnbVJrQU5YMlkz?=
 =?utf-8?B?L3NRR1RkWndSbjJGVDFmZVN4OTVQRXE4bDY5UmFRbFczZnlDVWNUWDJueDNC?=
 =?utf-8?B?VkpUNG1GQVB0K0N4OHJTb01LaE5UOGp3UWltejRuODY0ZUhxSW14YlVySStu?=
 =?utf-8?B?ZTBZbUhCY2IzSzZ5S0lkUXVDQ0NYMUxaR0lGNDVOVTllSHJ6SDhWV29WZnhK?=
 =?utf-8?B?UWU2dXljbFRDeTNqVGc3SDhybGNPb1IwUVJzb29jRG9IcWZ4VlJpeldQaHBO?=
 =?utf-8?B?em9TOWttSWFZV0lWTDZKNlNzaTBlbTAxS3c4MitTZzlkbnVHMVpPL0hpenB4?=
 =?utf-8?B?Z2FrdkJicStKNk91WU9tdm9JL0dtVGoxbTJxbGRmS3MxVnQ2NWlTTGlYbnJG?=
 =?utf-8?B?MnBBZk1lbm96K2Y2Zkd4MHBwQ0FuWTlQNkNSRC9zQ2lHa2FOMWlGaENLalJM?=
 =?utf-8?B?UTJGNzZTRlJKQ2ZqSlJ3YkEwNFJFL2U4UFAyN0VhZ1p2UFNUMHFRaUtGMXFl?=
 =?utf-8?B?TzYwOGNkUTgxUkw4LzFia2hCSlVTcDJpZzBIb0d1bDFUOWc5NEprVEZVQ0dU?=
 =?utf-8?B?ZWFYelhCWFFOeXBTcjdmQ0hIWnVRdm5HRjQvRG5ybkdOYTJWRGc1OGY1MXlW?=
 =?utf-8?B?b2dWNnFYWnozTEtINWVsZjNjUEdHbjl3ckMzYnRET1A4d0ZJaHFsVUgvSy9G?=
 =?utf-8?Q?h/UUiAOUYjuXuAJp4CGfWLXYA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c7c3d9-43eb-4623-955b-08dabcebb361
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 16:02:54.1386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siqvxAFE7gLNsHPLm7RuUGSUTWyo1XkCJr121xBUjqpfPuSgEoKpZmfO7/D9tE2GLRqVkuk2FidwYQOg3gkOkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8370
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71e;
 envelope-from=den@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/10/22 13:06, danko babro wrote:
> Dear QEMU dev team,
> Recently a game called VRChat got a security update, implementing Easy 
> Anti Cheat into their game (pretty much spyware that logs everything 
> happening on the users PC) which made me want to install their game on 
> a virtual machine.
>
> The problem now is, that the anti cheat detects if the user is playing 
> on a virtual machine, but in the official documentation by their dev 
> team there is a workaround for that, specifically for QEMU, that can 
> be found here:
>
> https://docs.vrchat.com/docs/using-vrchat-in-a-virtual-machine
>
> I simply cant understand what that code (on the given website) does. 
> Does it open up a backdoor for the anti cheat to access my real pc?
>
> Is QEMU in general a good solution for when it comes to protecting my 
> actual PC from threats like these, or any other sorts of viruses for 
> example, since it uses a kernel based VM.
>
> All the best,
> David
this seems harmless at the first glance, but the point that
doing this will not affect the performance is wrong.

Windows inside virtual machine is doing a lot of things
on performance critical paths, like when the APIC is accessed
or in similar places and doing that in HyperV mode is faster
than in HW mode.

You have denied the detection of HyperV and thus Windows
inside does not feel that it runs in virtual machine and thus
could fall into BSoD when IRQ routine processing is not
fast enough (potential inside VMs, the time was spent in
host). This should not happen frequently though.

Den

