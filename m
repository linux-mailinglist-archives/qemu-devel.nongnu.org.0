Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420A3ADB29
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:42:15 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luez0-0003z5-4n
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luekg-0005Ga-DS; Sat, 19 Jun 2021 13:27:27 -0400
Received: from mail-eopbgr20095.outbound.protection.outlook.com
 ([40.107.2.95]:53731 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luekc-0004Gs-2Y; Sat, 19 Jun 2021 13:27:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K53WUjd4Npfi+cbnXWHcITwVBIw7Rkl20tqHkMkuj7KK659IOvp8G2B8RcUVnmYpUZk8FCMZxB4tI5mOf8SBjfkYqtOtE109JxhPrc91sOO6GiK198On8y1DSG93YPSab/LGEgQjYsDsf4zJS9Jwv2Ry/3gX88AC3rBRroncsPgJKBO+/smovnUm6SBOciu5MJM6aq8h1YB/0e6Tslwas11s2ZodMnQPALWvWizXnOkq7P2tIQWlmoC6gSgVF2dKLPS/WJEClknqgCZtK2WHAq7BrNqij5KMCvqlqi7pd2aVcAcV7zUlyCponJBwbxt5jIKhAONRV4hMCoogmSlNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsIffq+6KH9unQFBAvtz18ppN7vfVxNYTy5RNX5H1HU=;
 b=ocMJMheLUe+f0LL5tFi9Ntz20xmiLC2trnInZPnwsiGOiCffJpOZTgxxvxMHTnSMX2FIVxlDepteyf7rih7Agq8kuAST6h4AVoonXIzCnI9Vc6jvDCFgsqF+bGv7VEWHjnYhhe0lPGNwujgxy5j9MKAjddljD19zgDRBHKRST6Ahs79TnbCXjB4+C9Quzb4L18SO64ni4cAVRHPWBsQ0G5d9lS/QpKqaEQDLOwEAYmEl6D5RuDNXiAIzAGvvacKLAFxJ2Awm3zYXmNdWwPWQkucZQ66iIGyV04hK2bIxg2axrJsrLYTdbQA488eq32DyaMQ4CgU1mt4y19gOWw4kzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsIffq+6KH9unQFBAvtz18ppN7vfVxNYTy5RNX5H1HU=;
 b=b8D6pP5ZRdFiXwN+0I5dbZZPwGPU0EIgZgu4Tifcp+43Gem5CFBzDyIaC+JDGdqXtuAiKo1PoNFN6nqd8LWy5Zx2moQgUY/RODCfRk+oYuExg3z6qOnFNMYzT7Gx67nk+SvVjT+33cnHMPKvGKgcHUquRDf3Ch28ApfQ6YRZ5wU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4785.eurprd08.prod.outlook.com (2603:10a6:20b:d2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 17:27:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 17:27:18 +0000
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b29eeb07-5f96-ae06-931a-bda015429418@virtuozzo.com>
Date: Sat, 19 Jun 2021 20:27:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Sat, 19 Jun 2021 17:27:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 326d36e6-2b33-4b96-6c31-08d933477d12
X-MS-TrafficTypeDiagnostic: AM6PR08MB4785:
X-Microsoft-Antispam-PRVS: <AM6PR08MB478550388029AB6C9C838BD1C10C9@AM6PR08MB4785.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8RMRPYlHyZHjw3mLpmLe3wcALaaOSj3uOninqXpuoPDqDLufyYxGqIgYwQeBcNy/+N8rpLi2BGTUMb3XqlANA1ovwQO7Wkro2eX2lDScsCh1nLXpI4bIhGrLGlFAFn5mreBQuSuiQhGKLklSWIPqEB2qYRntTycM+c6ThLdhVY8zuCfXayHurxVylPIgjpB15Kv+8EGQlu9YqsuVoTS24los/IJNp1cCsQwACeuxHgkUT0B7NisazIBOAhN6B/06NcNmTag1BzG6XRwSv9H9D+ZboySan7hSV1Q5CGlW/K4WLzxxMyoin/JurEwHAXXbmwjPHJF+EzGG5GkhVg4ke6S8r1j83S5K+HVivKk6sr2wDEZEREkRGgW8LFzyxZJWmVHwc7JnS4/GXpavWWvuhZuEiED0N2KKeRZfVgdvJ3LrBUyz5IPwgx0eundufEmwWBYrXzPDWqf4ozuMRDdN9R5auCiBAd9Pe2MHNc9zXAMx4813nRz9AJf0+snd/zWJhe8G7tnmgY0l9afs697R0vQcyHboKUzb/eSttBLK/li6XGPNHGkSd4+dEpq/Yyr8MX2GaOI2Nuz/mEEiDescVkeZGhvxmBdrnVABByr/vneQzDCpuKcJSeFFAvlvU9o7/AYG732asY7UeDm+em7ezVxvAFwbTIkmm3ZqNXk5+qZMtC/rSnJoyQaf3n5C9Nh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39840400004)(376002)(186003)(16526019)(5660300002)(6486002)(26005)(31686004)(38350700002)(38100700002)(16576012)(316002)(66946007)(86362001)(66556008)(66476007)(2906002)(54906003)(956004)(2616005)(8676002)(4326008)(31696002)(478600001)(8936002)(36756003)(83380400001)(52116002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUNCWDA2eXprajZIZ3lzRHF4eXQ3MTF1VUxWaTE2NldOTHNSNlBFRVJQM0hW?=
 =?utf-8?B?NlExNFRVTWsrVlpnSHA0aXVKUkhGbjdLZHN3eHFoeHNvUXlXWXJBbjZxZXY2?=
 =?utf-8?B?ei9KMHZadCtHTWVmZGUrMFkvRE10TlJTbjlxZEpwem5zdE9ZR1d4NmhKZUtL?=
 =?utf-8?B?Zzc3Qm8wckJETDVqVEdzQ2Y4MXZ2OTBhVmFVRHZRaDUvSmxicHRUNnIyY254?=
 =?utf-8?B?TDFFL1FuSzJIdkJtTzBPRFcxT3VFNmg5clVLd0VYWDNjRnFzRkVSNnFuTnVN?=
 =?utf-8?B?SHAxQUtXVFJhUUI4dFJEeDhxbEs3aFdiQ2RjOGxMQVZhV2dOM0kyYTh4dzJ4?=
 =?utf-8?B?ZFl4dTBsbDErOVQ0dDRxWCtiWmJxUzV3aHd6TTMvaE83SVhOLys5dzYzdFR0?=
 =?utf-8?B?bENpaHdWMnBNbi82cTBxb3ZlWHRSZDBZQThqZElQVEh2d1FBcjVDbFNQSmx4?=
 =?utf-8?B?dlkxbUxLb3BmZUNWQXlpUHFhR3ViVGs1WFIxa3NQN0dPRG5XRGJWUndwMjNV?=
 =?utf-8?B?Qm9xRGJjaG9ablRrL3JXYlhGVFNqVnlxRFJlM1JRRlFOMEFZNnhmcXh2ODln?=
 =?utf-8?B?VU1DdEFjOS9HQXZRM0IrQm9uS0VPREhCR3p2NUQ4TzB6djArbnpPNHEzdkhr?=
 =?utf-8?B?YTIyTHUvT1U4TFhJVFNtSUFybmxVNFgxU2l5Z2tadE9BWGludjFpOGdoay9H?=
 =?utf-8?B?c1NXNHlXTWpWUDI1TkY1K1FYYzFZeHIrY21nV0VRZnVwT1lSZFJqUjN1VzJT?=
 =?utf-8?B?MmlOTkoySWxxVC9hTEJSakdHME5OOEQ1eUMwa05ONU5rd28zOTdObnVKZHhm?=
 =?utf-8?B?cUo3NnRqQW5PZGNCN2VUYlVid3ZtV2dya3VvODVJcUZSS04zbXNSMEh3Si9K?=
 =?utf-8?B?akIyZktFTmhuOHRIUEJMOXUvTGJXZkw4UUFFQjVmWVVrUngrYjJ4NkVvRWtF?=
 =?utf-8?B?a3NVU08rYUxpeUNib0VHQ3Y2eHZYNFErQTRDWUFiMWJFbzVrMFNMWlJmT0Na?=
 =?utf-8?B?SHVhcGRya1U2TGhxWExLejlvcEpIRm00WURMZC9PaUErUnk4aExrQ2FmUmlR?=
 =?utf-8?B?Qm9QL25MeTE3bXZDWm9hYWJwMUtrTEdpZTJWRGdHRVYvR1Jya1ZsS1RNTFJl?=
 =?utf-8?B?SzdibDZBOXZuQ1JUWVhXc2w4ajB5Y3R0VTMzZUVyRDEzN1ZGRm42NllRS3ll?=
 =?utf-8?B?UzVMR0w5eTBpbGpTZVJxSkwwVGZrMmVPWEoyVTh4WjZ5ak02QXdLdUJ0MEpH?=
 =?utf-8?B?K3pHcjd5ek15Z0kyamNUc1R6U0xtNjR6K1djdDd3VEFWSmNBMDNXRlc5RE45?=
 =?utf-8?B?VjYxZmtPbWtGaVIwR3V5U2pJdjhOdTFFVW4wQmJhVTl5R2tvTlRFTjVZMmtX?=
 =?utf-8?B?dEZOWXI5VE5mN0pLOVFBQ0wrMGN6V0hCVGxUUkhXbGJuRldOYldkNE9aY2Fs?=
 =?utf-8?B?Y25QMkx3ZVU0Q2M2WWNSYmhaZFc0VHdWMkdhTjljdTBiSVFkRy82b1BLZXFs?=
 =?utf-8?B?TFpuT2FDc3Vmd1BGUEFDdUtJa0g0MTV4TTAvQXdDamE1OC9td25tWWNCeEZV?=
 =?utf-8?B?RmJ4dlRmOHFFYjNhUkVpb2ZKUnd3WWtnZWl4QXgzVGk2MGxHRDlDemtJSzVX?=
 =?utf-8?B?b0lDa1ArSUxSQUdURTBhY1ZkeEpPN1p1WHUveE5XNVlDZGladjQvRUcyWmg4?=
 =?utf-8?B?eFd5WFRlWkkzalVHK3ZoSHVzbkt2ZUpqR2czcHZyejlodS8vRlRtZXF4UUl1?=
 =?utf-8?Q?AIjH8F2PHV4wxY3nT9XMbGWbPGEnoy/Q6uR7wp5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326d36e6-2b33-4b96-6c31-08d933477d12
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 17:27:18.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kZeTowSzXX38AU2lEi6KlqCyRjaEiFrLhZEGXUOX72ox31xsUPWbAtS4z4ZsuIwFv/H+nMoLvh2UDWilB+3VLO7FWjANWoYlbY0A6r3he0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4785
Received-SPF: pass client-ip=40.107.2.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> As done in BlockCopyCallState, categorize BlockCopyTask
> and BlockCopyState in IN, State and OUT fields.
> This is just to understand which field has to be protected with a lock.
> 
> .sleep_state is handled in the series "coroutine: new sleep/wake API"
> and thus here left as TODO.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> ---
>   block/block-copy.c | 49 +++++++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 3f26be8ddc..5ff7764e87 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>       /* Coroutine where async block-copy is running */
>       Coroutine *co;
>   
> -    /* To reference all call states from BlockCopyState */
> -    QLIST_ENTRY(BlockCopyCallState) list;
> -
>       /* State */
> -    int ret;
>       bool finished;
> -    QemuCoSleep sleep;
> -    bool cancelled;
> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
> +
> +    /* To reference all call states from BlockCopyState */
> +    QLIST_ENTRY(BlockCopyCallState) list;
>   
>       /* OUT parameters */
> +    bool cancelled;

actually, cancelled is not OUT field. It's set by user to cancel the operation. And block-copy tracks the field to understand should it cancel at the moment or not. So, it's part of state.

Also, I just now understand, that "out parameter" sounds strange here. As "parameter" is an input by general meaning.. We may have "out parameters" for functions, as all parameters of a function are generally called "parameters" anyway. I think "OUT fields" is more correct here. I don't insist, as I'm not an expert in English (for sure, you'll find mistakes even in this paragraph :\

-- 
Best regards,
Vladimir

