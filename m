Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FC92D3C27
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 08:25:40 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmtr1-0007hc-P0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 02:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kmtok-0006ts-0i
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:23:18 -0500
Received: from mail-eopbgr150097.outbound.protection.outlook.com
 ([40.107.15.97]:33545 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kmtog-0002OG-Iz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 02:23:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYjnx1CqPV2gJ/GPypiRONnV7+5W+PCR/ZO+6pz0WmkagvH4EQuWNuN5MWHljrpUBxCfT/X5pz3Pvve0gzXos2wVBhhAvVzG/wUX9X5qRQbugRtmUFjAKLUQwQwWmNug9Pm6GDZNjpMQ7W8Egj5mH5D9C3WLHuJ3zuTasmZ4miqFiOlB9A4/a6sQ6r0QtgIMN3Lfrq+r6lpSGYnKIDiUnhMdvMpKepMbsnL1Y0o+ZNhwSMG7fAhokATn+/uIUj5RhDEtrE8BViV2W6yNV+LJinm+PfA+gkqBDf5Vp1/afS101rbpZrYW3nMlGM1IvLAUuDxg6dLdouWhw2a6RX1PXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd0PXDnYylOl6+Hx+YF8RNxb9DAFPIXPHSZyAR8k3kY=;
 b=kzB1ECrNb/jLCVdWOKyADguVLvK4rS7Omu2jkgU0aKS+lEZ0hImq5P5d5yfgtys1LehNvOIdp1arVkmfjR+k0+BBvzGuu5DJ6BRxnEU0F+Lgc20+KtCsIwbVMZSrm0mRpxoJ4SjwiCAv/pttQTuM8DNipT/Pyn2DlcSfXpl+qbc6jvVxmf2V9hSybxR08+1ChfUCgoux9PFss1HbpZLNB7uo9YDcZ0ghp3HJ+7kpK2VqL/LWaCL+N89aQYevNLUVJUVLyjfou/IqX6Ul1/VJyuneg7bVg7gwiMJTIoRx7JlA6BOXCCeGNBRgqmRwS+6zFyzFTdIH7DC1EliZK03yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd0PXDnYylOl6+Hx+YF8RNxb9DAFPIXPHSZyAR8k3kY=;
 b=qy6EaLwLCleA89GWbAvAOnA93SJ8HhwQPaIMrgbRZe1EY4HsYMXMNE9laBTpMtXF4QjGpQ3jy66e1HnYqm0+VppXJttm/pzeajfgV3lBp9SmKJlWa0zO/aCCoW0WUMUCaCXvuDUKAOZ9GhWIr1uu1d2SydxriCgOC1xUXsVEysw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0801MB2077.eurprd08.prod.outlook.com
 (2603:10a6:800:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 07:08:06 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 07:08:06 +0000
Subject: Re: [PATCH v5 1/4] migration: introduce 'background-snapshot'
 migration capability
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201204093103.9878-1-andrey.gruzdev@virtuozzo.com>
 <20201204093103.9878-2-andrey.gruzdev@virtuozzo.com>
 <20201208154735.GA21402@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <70b3aacf-61b8-ad82-8e5d-8b104135727d@virtuozzo.com>
Date: Wed, 9 Dec 2020 10:08:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201208154735.GA21402@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------529579EB7C6A8C49DBA734EC"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0085.eurprd03.prod.outlook.com
 (2603:10a6:208:69::26) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:208:69::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 07:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbeee73f-ce18-4744-2e17-08d89c112d65
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB2077EFFCB1688945B054A5EA9FCC0@VI1PR0801MB2077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pY/EL9Hms6F+BUVbXZ0dUWjaqpBlvsIjN9zzI5WH71bzoCFysS6TAqvwvYDKByXKBlBEOXS2u+zkrkMdeev2+jM+xJfFGvRmNhRwsEyRjrd306wnaiGGD9WAStZTy9sfD6Lm7+Hc/aeD+Lv8GEEq77It2KMILHPdr8wCkWMBEOxDnSxnE5r6fOFpL+X6Zy83xUv9T1X3MrbSkCqZ+X74cgXtgkRHYghTJm2XAPldNQyFYDWLe9Uf80abOyP+TAscdDyMDVgmDRW3DUcIAVt8ozXk65VH/9k078sm8/q6pBBjyBzJDk65v417lHSYitaTn2EZbcCgaeLMh9Pm3xSjfXdBe7rUPjO4fZq2ww9WTr+aVeKKR30+YjXPmw1C+0ao+P1vrGjp+3GPrKowMMJXzn2/z6Ybx+Z3Mc+2IkRDETIVSrWZVkG9MXA+1CXKypU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(66556008)(31696002)(33964004)(66946007)(36756003)(4326008)(86362001)(6486002)(66476007)(8676002)(53546011)(26005)(2906002)(508600001)(956004)(16526019)(31686004)(52116002)(5660300002)(54906003)(16576012)(34490700003)(44832011)(2616005)(186003)(8936002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVNDVWx4RUcvSzVMV2o4V0ZxOXE3UUN3dUk4WVRHL25HVlRVMmRzcUJGZlhO?=
 =?utf-8?B?c1hwdzRtbzA0SjVNVEY5VU5kRThEdDFwK3BEUVhJRkg2Nk1NbjA0OXV0eUtM?=
 =?utf-8?B?SGxWOFVPV2VoZVZ3VUsxN1hRdVZHbHVQN1FvZHg2ekduV3YzYjUwY1FNV3FH?=
 =?utf-8?B?WldsSmJkOU1JcXpjUmNObVp2ME9sekJDRFZYNnFpK0hOUTFsU2NCOVBHRWJh?=
 =?utf-8?B?SjJvZklmVjIzeTNFWVpRV2NPalFKcGF2RDBmSGVqa0g1NmZnaGJ1T25xaURs?=
 =?utf-8?B?NEpGU2p4a3BoWTVUc1JrNFJjbU5vTVprZFUrWVhVQzl4VnA0NUIvdzZmM0M4?=
 =?utf-8?B?MFkwRkVockwrQ1JXc0VlT0VvN1FBdWUreWNkbzhvUC9xSmZuMlRnN1ZEeVll?=
 =?utf-8?B?YitlV0tNbE1xdEhkS1dvdzdXMFR5TGFTZzJReSs5Ujg3R2xxOENZeUN3TmJS?=
 =?utf-8?B?dEhLMkdTMS9UeGI0WVo3ak5oMm9iMUJtd2tnNmpjekxLTUorY296bi9DYUN4?=
 =?utf-8?B?RlRDZENaT1MzZUNqR3N0Zkh3QTMyNHBnWGZwejBYR1R5VGc1TTV0VW9zamp2?=
 =?utf-8?B?Q0dZMVYwZ0l3b3hBOTZFcUt6YjZuYktoZHErOHJhK2hLbHZMRWtTUDFqV3hN?=
 =?utf-8?B?bWV4M2hjRDVjUS9LMzZQQzNtUE9udVpmWTBYQkxOU2lEblBSSnFYcXhkSUlY?=
 =?utf-8?B?aEVnZy84VStscWozbENoaGhQcGc3RXpUc2ZtRjhNWEV4aVlSQjRCaEpzRnFo?=
 =?utf-8?B?bkFnaFlCc1lOTUNvL2ZBNVpBNmRjZ0ZSaDV2TjVmN2ZWdDlLanFCdndReTdS?=
 =?utf-8?B?TXVnN0w1RXdrZlBmUVRKaysxTERNeGlCbmIwN1lJLzg2bFYxalRjbytBL0du?=
 =?utf-8?B?NCtxWExUN0xKSFV3UWJNcWlUaEJDMmtHNEtSR0RTbGUySU44OGN2R2RNRmx0?=
 =?utf-8?B?V0tsc3ovN1FoVnZhcTBlS2UwSnhWZXRXTGRsdDJ1ZUdHREUxcGExakpaUGhP?=
 =?utf-8?B?YysycnBKU243Yk93eW0wYWQzeEFPMUhJaHdnT256bFE4ckxUTjZpcEZ2MWhm?=
 =?utf-8?B?MEZ6b1A4QUZhSkFYKzNNRU9SNzdPZklCdll1d2dSWjQ4ekNMQjBGNHMzd3cz?=
 =?utf-8?B?NzljNlM5Yy9sNC9ockFQOGdQcUkwamFYbm0zeUdORFpsbFRSZFV5UmdwbHMr?=
 =?utf-8?B?SDBOMC9ZNGtCZlJ5Z3piVGJ2bEQ1bDQ4aktsRUk0U2p5ejBMSlZkVHJEcjdD?=
 =?utf-8?B?QVFmcDdYL0QwZnAwSnlYMDB6b1ZTWTBudTU1NG03b3lSaUtFNExwMHQyWWtD?=
 =?utf-8?Q?SbPfodFC3h6yc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 07:08:06.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeee73f-ce18-4744-2e17-08d89c112d65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAoLEPh/3o3/M/6bSB6nstfQsowvSpgXaXCeSJVcABgZYkU2vnkvLYvnwJH2nh1f0sWkKY8DjNsBzImBNWk41db1dFPFUbE2Xo+7QogIOkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2077
Received-SPF: pass client-ip=40.107.15.97;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------529579EB7C6A8C49DBA734EC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.12.2020 18:47, Peter Xu wrote:
> On Fri, Dec 04, 2020 at 12:31:00PM +0300, Andrey Gruzdev wrote:
>> +static
>> +WriteTrackingSupport migrate_query_write_tracking(void)
>> +{
>> +    static WriteTrackingSupport wt_support = WT_SUPPORT_UNKNOWN;
> Better to be non-static - consider uncompatible memory can be hot plugged after
> it's once set.
>
> With static removed (I think most of below if clauses can be unwrapped too, but
> your call), feel free to add:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Thanks,

Yes, quite possible case with memory hot plug that you mentioned..
Thanks, I'll change it to non-static.

>> +
>> +    /* Check UFFD-IO and memory backends for compatibility only once */
>> +    if (wt_support == WT_SUPPORT_UNKNOWN) {
>> +        wt_support = WT_SUPPORT_ABSENT;
>> +        /* Check if kernel supports required UFFD features */
>> +        if (ram_write_tracking_available()) {
>> +            wt_support = WT_SUPPORT_AVAILABLE;
>> +            /*
>> +             * Check if current memory configuration is
>> +             * compatible with required UFFD features.
>> +             */
>> +            if (ram_write_tracking_compatible()) {
>> +                wt_support = WT_SUPPORT_COMPATIBLE;
>> +            }
>> +        }
>> +    }
>> +
>> +    return wt_support;
>> +}
>> +#endif /* CONFIG_LINUX */



--------------529579EB7C6A8C49DBA734EC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 08.12.2020 18:47, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201208154735.GA21402@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Fri, Dec 04, 2020 at 12:31:00PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static
+WriteTrackingSupport migrate_query_write_tracking(void)
+{
+    static WriteTrackingSupport wt_support = WT_SUPPORT_UNKNOWN;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Better to be non-static - consider uncompatible memory can be hot plugged after
it's once set.

With static removed (I think most of below if clauses can be unwrapped too, but
your call), feel free to add:

Reviewed-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>

Thanks,
</pre>
    </blockquote>
    <pre>Yes, quite possible case with memory hot plug that you mentioned..
Thanks, I'll change it to non-static.
</pre>
    <blockquote type="cite" cite="mid:20201208154735.GA21402@xz-x1">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+    /* Check UFFD-IO and memory backends for compatibility only once */
+    if (wt_support == WT_SUPPORT_UNKNOWN) {
+        wt_support = WT_SUPPORT_ABSENT;
+        /* Check if kernel supports required UFFD features */
+        if (ram_write_tracking_available()) {
+            wt_support = WT_SUPPORT_AVAILABLE;
+            /*
+             * Check if current memory configuration is
+             * compatible with required UFFD features.
+             */
+            if (ram_write_tracking_compatible()) {
+                wt_support = WT_SUPPORT_COMPATIBLE;
+            }
+        }
+    }
+
+    return wt_support;
+}
+#endif /* CONFIG_LINUX */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------529579EB7C6A8C49DBA734EC--

