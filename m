Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D58341B2C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:10:17 +0100 (CET)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lND1E-0001Oz-DE
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNCx1-0007du-Na
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:05:55 -0400
Received: from mail-vi1eur05on2108.outbound.protection.outlook.com
 ([40.107.21.108]:2962 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNCwy-0006iP-A5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:05:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5Z7nsvE1Y74DSTlf4iiTaRztCqbCwmwLTi46wpHobIyJuXtzAIFHH6RQpKMgY0U1SRhb9djDyCsA0vi4GczyiMieRycPiunYHqt2l8LqD6sotSJC7CJw3LiY2RofytIzj2wWBPpPcsGcQOQl48mC4JvFZk76r5G7i650v5R9Yt8N7DZsoh5QFSiqb2PGQyVY0RilHv2OeKQNyL89tZNVya12A4k6Nw1HS10VCemp6Ycv17RiOszMbmlDbXvhIc7SphseSCnMZiRnjI291E18SazJ4z2i/PYgUhmZMMYmPryBxwvXyR4H0h3uB3O7EbU8B41kJelbbWUfI/EqnwkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX31/eFNHeb6gPWhRQOJhr4P/Xx99VBim/cAWFI8430=;
 b=fG0l+o1VyV2PwSKt81ugEjjOTnkTZa62MCKC6k0Ndu08o56eVMt/JHVFl+B6Her3ejKmMLvKSnYW4UCqcpRqsyPsByulV7zX184Vm+rdTE55lMbY37euHAtgHgc4/yLHN5iZAcPg6HlVyVA0490CCmWBpstORJtqkU0HC9Hg4gsmN92ncSdAQgTLnWofg43N5KRCLScGu03RP/DPTZLjZlGtQEslUYpZmpRmtS1U0p2N7pqhyDi/zGsBsU3Qluo0T29/IVG34XXgk4xiY2MdgSjf+urB61DJHkAikIG6AHnYeIhPgveHlu+ijSzup86en3zKeERPTKE8IILyu2+uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX31/eFNHeb6gPWhRQOJhr4P/Xx99VBim/cAWFI8430=;
 b=F0gBkR48d4k6ckcCzRhJLW42B6a1sfHNi7xNe2Pju8ScGTOZHi5W3UOtne6rAaVcttPIpyhPfkivhuSsyRtOLycY5qIeTnWDym7ofFECWrgAPAdn1s37J+qqZLhUQR9XbzdTNCTyx0j5xi9syek5cC0ufb7Z2UZY/Hk6E61t7GQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB5410.eurprd08.prod.outlook.com (2603:10a6:208:182::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 11:05:49 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 11:05:49 +0000
Subject: Re: [PATCH 3/3] migration: Pre-fault memory before starting
 background snasphot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-4-andrey.gruzdev@virtuozzo.com>
 <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <a40d14b2-b10c-83bf-bdd5-48a465dac67d@virtuozzo.com>
Date: Fri, 19 Mar 2021 14:05:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a5c70d97-0560-0f7e-309e-a07f60a2e1a3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0501CA0064.eurprd05.prod.outlook.com
 (2603:10a6:200:68::32) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0501CA0064.eurprd05.prod.outlook.com (2603:10a6:200:68::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 11:05:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46f8ea3d-970b-41a1-3236-08d8eac6f3d7
X-MS-TrafficTypeDiagnostic: AM0PR08MB5410:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB5410FC437C3F527A005FF3DB9F689@AM0PR08MB5410.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HBhS/WDakg4VCCH96xU4Pl0MktLH+N8N2RCgBNM6t4BZa5f26BMkrg2MccSBRnPmXb0E3MExygsA5QOxMDW2ymQfWZQhcPDCCOWlUw0NmqIvNhgUp2Z/dalMlkHNyQwDOAhjj7DRJnVGlu7of2r0peEhZ4/HG5hRfP+PRQ3DuzNv2zGfY+R33vRLBMJLSTKLMukUQi3sgSx/p8TVl//kghO17kZNq8N8HXvByr8KsLm/glK8l+bcbJDc7x3svugzYI+Cp7tDVednvgLQmOkbrhGmAWRk+PpOn8b8R/C9w0p4LfPRq4kdai11rGoO/OnV+gXbqTBTgZI79x5fCoTZYVHCX3wmR0hdQd/u7F559Q+JNeGUL6MHZwhBUYaCcf82psF9oGxX0r6klEncvbenq9zSeZuvr+n4+A0rRP3soi2R7ESz7VLpHx+wtewmB8XAG//z27xwJYBLEcabni/SZFFf0g1Kzd8EqShFDUxAjGu99pX6czgCDGmBrg+IbYETYR0XKs4M2OK4hPWoOWfCz7NTL2kGWqjy8rzRIGzim5kaCwAftGiY7mbXuM7nVAFKO0nSndLl++7pBWw00ai/+6/vJYxWY7uApSGslBBsa10pQvjCvCO3TaWafJa+w4Jj7ssRPZlpSpbs9Pngh6zhor62Dmll/c0DPibtqUZHSgQKbopManLfquLFO+didO11Qw75mJDVRUnMYr6BRYxYJcvREN5BdCAcKJjiuyPB+O3xB+0X+ri6c1LD8duxOtH+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39840400004)(376002)(396003)(36756003)(16576012)(44832011)(316002)(54906003)(8936002)(2906002)(8676002)(956004)(16526019)(2616005)(26005)(186003)(966005)(53546011)(83380400001)(31686004)(31696002)(6486002)(4326008)(66946007)(52116002)(66556008)(66476007)(86362001)(478600001)(5660300002)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUlOKytabU1lWmZ0ZUdBZzFKSE5OblhaKzZEWXB2di9BRi9yS09LRWJBdTds?=
 =?utf-8?B?LzlHK2YyM3VyQXZGd1ZUWUhCV2xYWUFTbVR4MGM3dUwzdmR4OVdOek1oYitS?=
 =?utf-8?B?cWVlaW5Kdi9ZZXQrdEVIdExLNm5UaHlXNFcyclNkc1hhRkpsVExleWpxU05Q?=
 =?utf-8?B?YmlMOXU2M3FHdEhFSnB0SCs4ZkJZUkpYQXIwOGxIbDVTejJHUytQanBPQ1p1?=
 =?utf-8?B?bElqMk02a1BWQWJjYkpjRTkvUWh6R01YaEE0ZTRDT2VIbmdUUmtmQ1M1VFNH?=
 =?utf-8?B?UmtBRUdvV3QxQXJKWVNEVHY5N0FVQVB2WFA0b3kvbEovVnl2b1RQdzhSbmEy?=
 =?utf-8?B?ZGRnRmQwNXQ2aGZCQUNneXlPb2t4TmNJR2tOTXJvSVN2T3kwaEtOcmxSb2lH?=
 =?utf-8?B?M2VJTnBERTlDWEFnTCsrdmw0aksrWlExc1NiYlBLVU01akUvU3Bkc29UUVl6?=
 =?utf-8?B?TEFoTjAxTGxYUWFPNFBoZDdHOThjcGVubTNDaVBrb3hkM3BqWVRHQXgrYVV3?=
 =?utf-8?B?Ry9BM0wwNGJSTlR2L2c2bEpGR0xBbG10VmFWMy85TGc2WDJETkUwelZsSEI5?=
 =?utf-8?B?Q05xQitXRjRCR1FjL1k1anVEUTlwY2FUaEVtcVhOR3NxS3hkMHUxemhWVXBl?=
 =?utf-8?B?RXZrTGlsZzVwcWdwL0trOEZBYTRWQjI2WlVsdGRBejUvd3dUYTVBWU1oUGZD?=
 =?utf-8?B?T0lVY2NVd2lOR3VDNHpNZFN4S1E0V2QwVFZXeTNPOHZQdVhvZWJmSnhGelJm?=
 =?utf-8?B?aXpZV3NlREQybHFKcXRpZDNDWkdqTUhOYVdVL3hSbDltd3lzamVOQ3NBTGFz?=
 =?utf-8?B?VWh5anMybllDajVGajdBL0lCbUlzd00yaTl1NEFUaWJwNUVGNGlLbDlYUUU2?=
 =?utf-8?B?eFZJOUErT3pDL29VK3Z0T1pmOVROMHgzNVBxckpOd3oyM2xaQzFaZ0pmN3RO?=
 =?utf-8?B?cjZjRGpFbHpFTTN2dG16TnpnQXpoejQ0V2lhdnhqL2l6dW9rSFl3bnNSRm1Q?=
 =?utf-8?B?RXVvTExoNDhVYUtnWGlxdkZhMXZVaDlNbHBqRkpaZUJseU1xc21URytTYmtB?=
 =?utf-8?B?b1RTZkFibFlSUzZ6bDVXRFhvRzJkSTJzR0RVUU56ajFZbWlCeVZsK29ja3hh?=
 =?utf-8?B?NUs0S0xVSEUwQ1lORmNxWGNidmRmeXBQSkNkSURrdWhBdGVTMTVZcWlGUXJS?=
 =?utf-8?B?ZlhQa1p2d05LNzYvVUttSXI4YThFRHowbnpsS0RlSXI4SVRjUmlPQk82bHBD?=
 =?utf-8?B?YnlQd2tqbG1uY0g4Q25MRCs1U2w1ajVpWkdUYitqOFMzVVZHZG12QzIzcHJT?=
 =?utf-8?B?b2xGNzM3UXBNWTBDbTh6RGVmTVNCSldaaE84RWd3ZlNvWWNsRVptTnVKSjFV?=
 =?utf-8?B?bmd3K2xiYXlKMHpoNzg2ajBNMVlST3V4amIvcGg2WVY2d3pmWWRhT0U5aENx?=
 =?utf-8?B?YkdIVjU3VUpNdHJRVUdXRkU5cExFYnBHRDhSK3ljOThQZlhXSE10OVBpSFd6?=
 =?utf-8?B?SG1GOWVxSTRFNWR4bzFjWFdDVVpHKzBQdnlmQVRmQWZYN0d1MU5iSXhnS0Zx?=
 =?utf-8?B?RHRyelNQdGFuR3Uyb25abWpxVS81LzNVdmk2b0RGd1hJTW9QWTRuQnZ2UXAz?=
 =?utf-8?B?ZlIzU3l1ZGZnZUtVWUN0T1MvRnNjZEtoaUc5Uy96VmZiN3phaG5pU0JsWm9l?=
 =?utf-8?B?dzA0QWZjemJSSTQ2QUlsdWE4YWVsN3F6c1JxVWhyR3lPQ0l0Y01kNjJXMFln?=
 =?utf-8?Q?eoYT11WXApJVhfbv8/uQGKEdCyYXzM3Z1i5Gf+B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f8ea3d-970b-41a1-3236-08d8eac6f3d7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 11:05:48.9745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS13KbcPF4uGr+pFTlzAokeRaExqE2jAodYc2OfnEvxpg1Eeh/kogd9t1k7FuFLm60NKuY+qNSinqVR2t2ERzeCIQLOuDTxvMTX4NXMfBcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5410
Received-SPF: pass client-ip=40.107.21.108;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19.03.2021 12:28, David Hildenbrand wrote:
>> +/*
>> + * ram_block_populate_pages: populate memory in the RAM block by 
>> reading
>> + *   an integer from the beginning of each page.
>> + *
>> + * Since it's solely used for userfault_fd WP feature, here we just
>> + *   hardcode page size to TARGET_PAGE_SIZE.
>> + *
>> + * @bs: RAM block to populate
>> + */
>> +volatile int ram_block_populate_pages__tmp;
>> +static void ram_block_populate_pages(RAMBlock *bs)
>> +{
>> +    ram_addr_t offset = 0;
>> +    int tmp = 0;
>> +
>> +    for (char *ptr = (char *) bs->host; offset < bs->used_length;
>> +            ptr += TARGET_PAGE_SIZE, offset += TARGET_PAGE_SIZE) {
>
> You'll want qemu_real_host_page_size instead of TARGET_PAGE_SIZE
>
Ok.
>> +        /* Try to do it without memory writes */
>> +        tmp += *(volatile int *) ptr;
>> +    }
>
>
> The following is slightly simpler and doesn't rely on volatile 
> semantics [1].
> Should work on any arch I guess.
>
> static void ram_block_populate_pages(RAMBlock *bs)
> {
>     char *ptr = (char *) bs->host;
>     ram_addr_t offset;
>
>     for (offset = 0; offset < bs->used_length;
>          offset += qemu_real_host_page_size) {
>     char tmp = *(volatile char *)(ptr + offset)
>
>     /* Don't optimize the read out. */
>     asm volatile ("" : "+r" (tmp));
> }
>
Thanks, good option, I'll change the code.

> Compiles to
>
>     for (offset = 0; offset < bs->used_length;
>     316d:       48 8b 4b 30             mov    0x30(%rbx),%rcx
>     char *ptr = (char *) bs->host;
>     3171:       48 8b 73 18             mov    0x18(%rbx),%rsi
>     for (offset = 0; offset < bs->used_length;
>     3175:       48 85 c9                test   %rcx,%rcx
>     3178:       74 ce                   je     3148 
> <ram_write_tracking_prepare+0x58>
>          offset += qemu_real_host_page_size) {
>     317a:       48 8b 05 00 00 00 00    mov 0x0(%rip),%rax        # 
> 3181 <ram_write_tracking_prepare+0x91>
>     3181:       48 8b 38                mov    (%rax),%rdi
>     3184:       0f 1f 40 00             nopl   0x0(%rax)
>         char tmp = *(volatile char *)(ptr + offset);
>     3188:       48 8d 04 16             lea    (%rsi,%rdx,1),%rax
>     318c:       0f b6 00                movzbl (%rax),%eax
>          offset += qemu_real_host_page_size) {
>     318f:       48 01 fa                add    %rdi,%rdx
>     for (offset = 0; offset < bs->used_length;
>     3192:       48 39 ca                cmp    %rcx,%rdx
>     3195:       72 f1                   jb     3188 
> <ram_write_tracking_prepare+0x98>
>
>
> [1] 
> https://programfan.github.io/blog/2015/04/27/prevent-gcc-optimize-away-code/
>
>
> I'll send patches soon to take care of virtio-mem via RamDiscardManager -
> to skip populating the parts that are supposed to remain discarded and 
> not migrated.
> Unfortunately, the RamDiscardManager patches are still stuck waiting for
> acks ... and now we're in soft-freeze.
>
RamDiscardManager patches - do they also modify migration code?
I mean which part is responsible of not migrating discarded ranges.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


