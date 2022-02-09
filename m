Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2074D4AF8FE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:06:47 +0100 (CET)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrMb-0000Zb-Ol
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHqVE-0001uP-56
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:11:39 -0500
Received: from [2a01:111:f400:fe07::722] (port=7296
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHqV9-0000cp-Bk
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:11:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frVWqwQFOi6qmtPxdVObDekcS4UKPVxY3LX97dp1euL6K1V8BSR2Z86Mdb7v/Lu0jrWi047CdcPrJOD0vLZ/ihVfxVtBTmX/SYXUKyA8GAx1skRnznRpZ4xSxQIYRfZ1SRXK9/GhN+Yi7pt29mHD+mNIee3UxIYFEFzPlZoOlnEVKmRgxLME2N7ez5xeMkgWDZzgXeH58zsxcfotfizuGyyC4iW0xfeudqxFdw4TDl6efZ859krJMUO2//8bGZkxe056v3KpzlfKB4HkGR7P2qNhCLabpjv/YzYcFjTVHYGDiO4a92JVgZNH0VJO7B7+zvAdrbmNhvwLNQBcAo9nGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1oOQCoFUXVfzJ+7Pi/hBACtIZMeD3m95Bk5k77yxFs=;
 b=FE3+3MzfqWCm7rHpCR5fKVVGIhA5lPP4t8FtVtf3ynMPCPGrdC1cYekqgO3A0V+rLKX/oD2wpLyv4lI2blR7BQDeDwLOUU/M5yGA/MzMb9lUlwOM6Uh7M4r8d8s1Q8sl6+epkxJDMpJHAzwY///rrMe+jjWqEK3M0HNo6DLP84pCX7pcIDyJ4hwHCcxUjgFB7gO+vfN/aebzoa7efFMhgwvAkdVkn5V0YtCB6cuLVYuoQ3BKg2vBIOtluOrlhW3SRLwqC4QTr27Xj1ZpouKjq2HhmmamBbhyCE5b43GN7uUzZ1VBxGuOIeJCBxWjOHwwBp1gnxRmagRQ4tnWwJygeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1oOQCoFUXVfzJ+7Pi/hBACtIZMeD3m95Bk5k77yxFs=;
 b=iVHM0bPjcHeSRYJmz/nCpaTcNfFRXg0FqBjxSdfbRrFxBGn197OXQrD4dYxhWQgUGY1JwlIhor9K9+9kFrPiYFHzrWUqlraH0T7OVU4feyKsKGUqKBvOls7BB9OM2awMw+csSAGSLKlbU5ujlP7wC65YrH5QUxHiwen0b0akt0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB4475.eurprd08.prod.outlook.com (2603:10a6:10:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 16:55:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 16:55:38 +0000
Message-ID: <b6a8147b-da65-9d80-b759-1e50cec4a5d3@virtuozzo.com>
Date: Wed, 9 Feb 2022 19:55:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] qapi/ui: change vnc addresses
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com, 
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c92a838-bf6f-40d3-680d-08d9ebecffce
X-MS-TrafficTypeDiagnostic: DBBPR08MB4475:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB4475703D0E4E077674B856D7C12E9@DBBPR08MB4475.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VK7D3gnAQvIyYaKnnTz40oZfqBfgGThRLJV2aM4zXuXOar1s9QxnSnPgRow2Bb+5XWL0gJ8MacJ53ALoo7N0wexhRLDhOnttpQ2Oioo+SY3Idttzfc/eWN9PSjiKyBTDjzhjkV2BC2vxBg+Osnw2/0upADdB2zkg5P7vegaGPxByr2CpKPm/Q9/1GuGgITVEu2rFvG9zedHa0zJJ32Afu9V+Ohaxya9w5TCUdyL9P2bLs4+nXjgwiKXDqzsqLGn5wzMPKJpbhDhz2HPqOglGjOQ5iMhop86w8EkY450pQbDwEMJvAgzmXbs9IDp/9Ypd56S8k0cgS0DGUAsk6Je67HyIc5qAyBQSvyz/G0OQVXpx2JW5aeU81J5UZwgQ8/nFUWixCURd2tFkmaCDXKFymDZ81+JbwldFbER6Ruxjjj/cFBT4sRDaJlPWQs5xuwFDYPzvLZvvGs5UZ1WCeiHDbRegSjpyeMt00yK9YeJAWMzf6FX8ous42kjosQYEsYQDlyzi6I80NCN1+aZxXHwqLqOgczE7haNA71/4nTKBEfvWkiaMwGkP57onl3VlvK1fxbN8XTTfi1IjZI3lqPraJ4KP9fJm+gxcLS3pE+CkEi+QTC1FvrcY2rizjoK8CDwKmPLRqY3pAHPA32uP1a7xNQML1cxPx7LK3R8pjyA+TBgcNW1h68Yp51TAioVBE1IfkOHsn1SGrNjFBpnIuaSX5Bt+VotuPQ1KS1Aw80qSbFlehm6iKkNVBk5enhY5iz90sqpW+2yzwESZGo6Ou3KKBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38350700002)(316002)(31686004)(6486002)(508600001)(66476007)(31696002)(6916009)(6506007)(52116002)(6512007)(2906002)(4326008)(83380400001)(26005)(7416002)(186003)(8676002)(5660300002)(2616005)(38100700002)(36756003)(8936002)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHQ5VlJ5L2M4V0twV2pRelA4cDZNdFRWKytoOXJ2VjRYeG5uc25KV1VDV2x5?=
 =?utf-8?B?eWRXZ2xyc0tvSUhYYU5GTkNpZlptWTRGbloyODl0TWpland4cndsTmtmSGpy?=
 =?utf-8?B?WDloNzRueHdVWGJZMVcyWlNEaE1JVk04NUpEWVBoR0dFRHFLNVA2QkpmazI1?=
 =?utf-8?B?V01aeUFSQWJrWXUzRHYyZ2c1UHpDTDB2T29FMEhYUlZoaWsyZ3dLa0F2YXNX?=
 =?utf-8?B?dDByMEZYYkxqeU9hQkxNTGRqSVhUaEprWTlkb2ZGb2VNMFh4NHNZdXloY0Zs?=
 =?utf-8?B?U2lnWllCRS8zc1U2bzlTclNEc3lpYTRObW1SSmhJcFEzdmtiY1I1SUpjQ3V2?=
 =?utf-8?B?azc1U2YyaVFiQzVlMS9udDBJOTIwN0FjZzh0TUhOdk5RK0s4SEtvd2o2ekxr?=
 =?utf-8?B?eVVwaWNlWUd4RHhoZEZmcWtpUEdkcXdyT0tnZHVHUGFJVUlQdytGYU1aTytT?=
 =?utf-8?B?NmlwN1lvZzhDZ3ErYlRmbDEwNTdVMWR0Tm9lb3MwMjNLS3dzbnFNaFMreDFP?=
 =?utf-8?B?SlpIZGt5ZzFqa00zMzhjWG1zUzFRbjFSRldQcm5tU0V6K3JlUWxMbGRZU2Zy?=
 =?utf-8?B?Qmp3NTEwRG5iY0paaTdMdklEUmpVOFJ0eS83UDl0UitMMzhKRFZ3RUZ0VkZ6?=
 =?utf-8?B?NWEvTkZGL1FSTm9ZWUF5a08wOHRRc3gxZnFtQzI5MnZmcVBVQmhHdWtCSjIy?=
 =?utf-8?B?YjB6WEFzRGhQRGY1YXBvenUxL2NVb3ZrODdqY3ZjYTl4cXl0UWM1NVZpdzI4?=
 =?utf-8?B?VTdJRlFaZ0Q3bGdHQ2lQaFBQN0krNm9PN29yLzdjb051MDJXZHd5dWJ3WDBF?=
 =?utf-8?B?M3QxR0U3bEtWU3lqUE1VNCs5RkU1aVJSZVNxNDlIa29IMWllc2pydlFxUVB6?=
 =?utf-8?B?WE5mRXZlc0ErY1M3ZVBkVDlFTFIvcU1KMDFDR00xT0VwL3FwaDJ3ZXBQQ2ht?=
 =?utf-8?B?Y0JGdjRqTStwdG45T09kRHFEOFlxWHZLNnlvbUsweHRkMUIrTWpLUXkxTDlP?=
 =?utf-8?B?aVgxb1p5V3dnUEZsV3duK1JkbTZsZFRycWs3bHFVbHlkdkRVUWZHakFGZEhz?=
 =?utf-8?B?U2JNN3cwc1o4eU5Eb29LRldaNWllYnFGL3FIcUtHdUJ1dXJzb2xhWHNJMFBS?=
 =?utf-8?B?QzBCNU5oQjBXbWlUT0Q1WWFscWtBUEZ3ZXl1Q3VmN0tnaysrUDlNTnJuK3ZG?=
 =?utf-8?B?djRPL0pRSHhDL3pkTXVsdTl3YmZHb0wzS1JLWVp4NHZyYVNkb3BEdStpZmdP?=
 =?utf-8?B?OXZ3TUJGVStpWlFTR1hIcWlqc2Z4ZW9QQ1hjdkxYVWVORFZOK0tIMm9QVEF2?=
 =?utf-8?B?bk1iOXhhTWlrOVVqWDJncHU4QmNiWVZWdEUyRWxhOFRQaTMrdm9MbzA3SFEx?=
 =?utf-8?B?MVk0b25GWTB0MW4xM0NZbStQS212NDlja3FwQXVWTmswU0E0aWllYzNIbThn?=
 =?utf-8?B?WFQ4Mlp3aDZ1Q1NTOVE2bVZod0ZHRmFORTB4L1BxSzJRSE1SZ3FVOWM2eERj?=
 =?utf-8?B?NlUwOVY2WnpmaUF6Y0t0V1lYZ1BvRTNOZm9Ib0x2UDVIZ1cvVEpld2ZwNnhw?=
 =?utf-8?B?cS9MbFdHQ1dUVW81bzdSYWJwci85STVHdHpyQ1ZRYVpVVmVERmlPdWRMcGJh?=
 =?utf-8?B?QS9ESXp1MEFkZnhZOTJsYjlhelRSYldUL2tUZmxJMjJsV0xqRDBoYzZqSnVo?=
 =?utf-8?B?U2RQcG5PMDVMbTBGcjVLNFVkTlR0ZWo5ZEhKaUhtWDIyMml0NVNNRGVpR0dt?=
 =?utf-8?B?YW5ZWldTZU1WRmIrUjJMNXBzbGtCZllmNkFQeUpET0FmSnBzWmllSXVGL0RI?=
 =?utf-8?B?czhvYkVqZTJvbGdaaTE2SGYxUHdjTTBwcDBFbzZCUC9xSWo0cGlBNnNyTUMv?=
 =?utf-8?B?WEFTZWRIQnYwZU1JVVpXZHR6dDdvajhCay9pdHpMMFB3K0I4Zko3bklrTytP?=
 =?utf-8?B?VVRxeEU1WnltNk9OSHRLWTlORGxseUhuWkJQZ0xiUXRkYnY3YTFhTlRNTlFw?=
 =?utf-8?B?MnYvUlNUKzZVYzNXVXp5Yi80SHY2M3hidUtUU3cwb05uM3QyREcvd2c2SzBQ?=
 =?utf-8?B?UHJtRUJtTVZCUkZnWmJ6M2lEZml5WERVVm91azdRNTlvSnZ4WmNQRUZiM3M3?=
 =?utf-8?B?S0lvTTJ0WmRHangrdUtCcnJ3cEg2M3Q5ak1lczVqbFR3b3pSS1NLdjMrWlRZ?=
 =?utf-8?B?ZXE0S3I3UENlaTd5aHJUSWZhM3l4ZFFEU1QwVFhwSmF0ZVBnYWgvT3doZXlE?=
 =?utf-8?B?K0RheWtubVJxaDExSENpU2ZOK2dBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c92a838-bf6f-40d3-680d-08d9ebecffce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 16:55:38.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhU1zWiwofDBGqWQlgPNMWKvGdehj+AESWUXF4KX5YpxjGR9GVuOBDQ8Yx/tvqLMW4CCgPFh3OWal5H5ZNCO93G219MkNt+E4WgPbSaSaO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4475
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::722
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::722;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Ping)

18.01.2022 19:09, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v3: - instead of creating new qmp command add an argument to existing
>        display-reload
>      - also don't touch websockets for now. I'm not sure we need it.
>        Additional argument for changing websockets may be added later on
>        demand
> 
> Recently our customer requested a possibility to change VNC listen port
> dynamically.
> 
> Happily in Rhel7-based Qemu we already have this possibility: through
> deprecated "change" qmp command.
> 
> But since 6.0 "change" qmp command was removed, with recommendation to
> use change-vnc-password or blockdev-change-medium instead. Of course,
> neither of them allow change VNC listen port.
> 
> So, let's reimplement the possibility.
> 
> Note: now, reconnecting may trigger existing deadlock, as I described
> in my message "Re: [PULL 09/11] ui/vnc: clipboard support":
>   <973ddebe-14a9-4ba7-c389-7a97d6017237@virtuozzo.com>
> 
> Simple hack helps, but I'm not sure it's safe itself:
> 
>      diff --git a/ui/vnc.c b/ui/vnc.c
>      index 69bbf3b6f6..8c6b378e2e 100644
>      --- a/ui/vnc.c
>      +++ b/ui/vnc.c
>      @@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
>               /* last client gone */
>               vnc_update_server_surface(vs->vd);
>           }
>      +    vnc_unlock_output(vs);
>      +
>           if (vs->cbpeer.update.notify) {
>               qemu_clipboard_peer_unregister(&vs->cbpeer);
>           }
>       
>      -    vnc_unlock_output(vs);
>      -
>           qemu_mutex_destroy(&vs->output_mutex);
>           if (vs->bh != NULL) {
>               qemu_bh_delete(vs->bh);
> 
> Vladimir Sementsov-Ogievskiy (3):
>    ui/vnc: refactor arrays of addresses to SocketAddressList
>    qapi/ui: display-reload: add possibility to change listen address
>    avocado/vnc: add test_change_listen
> 
>   docs/about/removed-features.rst |   3 +-
>   qapi/ui.json                    |   6 +-
>   include/ui/console.h            |   2 +-
>   monitor/qmp-cmds.c              |   4 +-
>   ui/vnc.c                        | 166 ++++++++++++++++----------------
>   tests/avocado/vnc.py            |  10 ++
>   6 files changed, 100 insertions(+), 91 deletions(-)
> 


-- 
Best regards,
Vladimir

