Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A24414DE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:06:17 +0100 (CET)
Received: from localhost ([::1]:37334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSKd-00030E-Uh
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhSI1-00028U-Br; Mon, 01 Nov 2021 04:03:33 -0400
Received: from mail-vi1eur04on0717.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::717]:57478
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhSHy-00045N-Ir; Mon, 01 Nov 2021 04:03:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgmJ1HrzxF1mK5Ps/GoVArlgrcU1zZJbHLaIh+j74kq6wiOl4F566qd0ChrYlGGJMZsSG8B8PbVSS4MiqTT35FEyl0ARbf82yGbkHqbZnEXbCdK7/9LhR1DmF+VdKqxJu890/xlRDOpHM31MOIQtdZhAYQTN8/OCxuoB8CXEGQ3TVjB2JPu7RJKNj3XzidMuqcmGTwdf5eNe7FdXxjvVg+Y9pQzCKX2lNBTncFEIAD54qs8hs2yli/ZolywPw0yeFMEMhjDrJjsu8RTtIf2McawHMWp9tyGGi61zJLFFTYqm6E0kJCf/zPMxzpPxuF0Ck5iuvA1tQEWpzJzFMQxEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO+YwAszqziVsHLNLIEGbh2Qr1eGwaNPgd9jXUmfoaE=;
 b=kkNg1lLs1OpVXKEL5xpGhejAZBQq15R/4VmNhQq9vi+mOPR8EtNcNIBUbZhJUf05ch8Cq35mzkKS1SRtpKFWrqsMh6qXQO/Wv2qCyMa10gatj9J9OYSHQlaPhWIGYL5Um6MDNN6MwaCDz4DtRJ/A0K63g0B9u0dGOGKxbPf7IqngCaHPoBoe0Q8oFDcRMqYjBmT6FQqoNTPJply9VgcqR6/oI2uiIoJP/6TaydqJMUXXM2+c3CKZcekCsZ0OhVYPGZX/T+zKZtR37fZ+anfYYGX1w81sa6h3SYhE7pT5FDx+/qWmzN6m3NQj9gseLKnmHUhhzWTWVilvxXV2EbkkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO+YwAszqziVsHLNLIEGbh2Qr1eGwaNPgd9jXUmfoaE=;
 b=dFozhf/SK9TEgkmPCeRSNFWoAKKBq1CotI14FxYSWVVOafaKx49x2AXztid9ZF+VRv+WcczP9zWm8xLdz/dlkDcvcCdxpjwjGI8yvHreTgbWZq3F6C8icWlc4upNMUBC1zLRV0bl08JoBcHTYaPGWlfVDXRzf8HR8HWla2zgSUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Mon, 1 Nov
 2021 08:03:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:03:24 +0000
Message-ID: <d6babcfa-9208-7267-3937-b3ade4fd635c@virtuozzo.com>
Date: Mon, 1 Nov 2021 11:03:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/4] qemu-img: make --block-size optional for compare
 --stat
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, nsoffer@redhat.com, jsnow@redhat.com, den@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
 <20211028102441.1878668-3-vsementsov@virtuozzo.com>
 <20211029203257.zzu7rzzdlg6tdhwe@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211029203257.zzu7rzzdlg6tdhwe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0261.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AS9PR06CA0261.eurprd06.prod.outlook.com (2603:10a6:20b:45f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 08:03:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2559271-103c-4436-202e-08d99d0e1435
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334ED04EE379189812DFF42C18A9@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hjBzSYMaSxd6PlEqTEg6CKpp1Esmb1zyS5BLOZG7qB0BUfJUhRoKpiYAA/PBG1YurK6p0zIKX6mTPY14pIkV1zCKda0GQwsALZ6YAHecWGdBE4gQECq2APF3kCH5PeBQN7r99na5KiMscHKh5FKe0ro7UbSxGMxZhvHZQ1ngV+jOx3m4fRXYQqFwddimAvTKB4gEW2n0lh5SflqfFvm6F8VIRZmkjwx1kQAxu+T9i7kXqihR94pP4dn0PMklFzhLzdOM0n4AaOaT8CSnLX88mSNhHVmo1BImJOuzexOQYaD5FrHO942fkIyl3b4nzn6Pcal3SGLvg3zTTy7F4M9lUSB2c9kQ6Kvs7fSgKprJr1BFPMRf6zx57xa8J6xuOBgchT2su6eThbzhPgctG2iYns+rKrnTCd9doAKy/4V+v9lKjyqLylje2isDsfG5yInL6txfs2nGupKvxAvAyA6Sm46NJlx9/+DDW4NN6vjNS66PjD//MamY6P5igMWbzJqDIOSPjTTm7h4ljlF2dXE6kg1yJ6aXj9IWFEMLlnqAlyjcIGeA1KdpkdSWwFuNboNNPoKp7pj0Yn+T2qvjN51FpEq/COnkiZDayaToyxiv/M6GVPPirh7cMP8iWyxtdV0K35j0A57dUk8wWB4OqkQGThb0+ANfiICR18Rgi9msduBr8VxrMjxje+PE8NDn2X607ZH+BKSeFcdWX161gzg9vvuiJAki61xzjvOhvZUl1wuTN6NeHoaJX1NuUFtMtUrGTohwinl1FFnScWwfSJo8lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(107886003)(5660300002)(186003)(6486002)(52116002)(508600001)(8936002)(2906002)(26005)(4326008)(83380400001)(8676002)(36756003)(6916009)(16576012)(38350700002)(316002)(38100700002)(31686004)(2616005)(956004)(86362001)(66476007)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1YzL0M0a3hNOU90SXBrenRmUG0walI1a1RPUEJQVW9MeTNCREtwWlVWcDBI?=
 =?utf-8?B?bGJmV0V2SjNXQ0t2OSs5OUVYUmRYbjFJU2tWUTJueVByVEpMbEE5cURCL3RE?=
 =?utf-8?B?ZThONlFoSGJ6eU16Z3hULzRZQ3JFUUdzcDNCRithVm5mYi9BbCtSQTJheXBq?=
 =?utf-8?B?N1pmSmZyMmxxTllKNkd2Njdya0d6SDVFUndJb0xCNEpHaUFmYm5hZml2d25V?=
 =?utf-8?B?QU5oMDgvQ1FDN1F4cmJCTUVIUWxtY28rR2lwU1BTNmxqMGU1dy82Vm1ycHJT?=
 =?utf-8?B?ZGM4d1ljM0h2cWNxUnBtSGo4WWdIcEFIZFBhTmszTUNyalBldnovTlNWNVJK?=
 =?utf-8?B?MkJmSklhbDlwQmNjYmJGQmREMHlNY3dMb2MrbnJYejZSbm9hWkFEMnV5eUxC?=
 =?utf-8?B?N1BZOWV4MmhEMHFtRG5MTVpja2dIaUIySzZQZXNqUHBQdEc4eTdGR2FpUmtU?=
 =?utf-8?B?NldpSDhNZmxyeExJRlFVZEdzZmFpNzJEbUdtTDdjUVIvRG9mYW1ydHF1VnJS?=
 =?utf-8?B?TDI0bHRQT3BVSUJyN0M0a1JuSGdPajZhd09QZHR2RkhSRDJjNis4S0UyNDE4?=
 =?utf-8?B?UzFkeE9iMXUyOXBNOXAxSGlLUXBJSTJsV2hMN0VCVWtrbU1xdHdPMHU0ZGRK?=
 =?utf-8?B?K2tKNnh6S0o1b0Z6NzhQRVpaTmt6dXVsamZpMlowc3VaYTBsR0huZWZUMFlK?=
 =?utf-8?B?Z3ptS1h6Nk9sZkQ4WWpCaTVwcnNtWXRRdmFJY0FWYzVjSnlRcTVGTWJNRDNv?=
 =?utf-8?B?akJrMEtKK0VmLzNSSWJ3NjVBbUNhRUEvTytXZVpJSzd5TGE5WTBYVnVxaHdV?=
 =?utf-8?B?cEVhRDBhL2RWWXZuWStXU1pma3RVNFB3VVlBUnJMN1pmemk5RnpFYUZDckxZ?=
 =?utf-8?B?eU5NWm0yQU5oYkswalBxSHJyMG1Dak1DcVVyZXZCMXU5UDRHdEdNQytQdmpB?=
 =?utf-8?B?eE1UVVZuVzNFaDhOTjNZaXhhck1VeFFFOUZqUFFSRkd4VUFWWEtsTDRRRi9Q?=
 =?utf-8?B?MWNjbzRQL0xiMVIwZHVJYVdRUzE0eStXdVMwWVJzcXBvbWRuVk5IVE1EVDQ0?=
 =?utf-8?B?VmQyczNZZmQ2YWp6NGdSU1pOaDdud2UvQUNVT2ZtRTdEbDB6V29XUXVFZE1R?=
 =?utf-8?B?RVVkcERMTmp6eTlicVVtdzNDbEJUejRTR1Erc3BOaGZ3bkVxRHZRMXF6MDQ1?=
 =?utf-8?B?emFJZU9FaU1ZODVXb3FETEhIckdjNEJlOVdPVmF6OVpESVZobGF6TW0zckJj?=
 =?utf-8?B?a29TTXFlOW5zQzQ0MSs4TVZVUUI5Uy9sRVUwVTlpZEN2dWc1NjF1OFJnRHNS?=
 =?utf-8?B?Zlg3MmJIb21KdG9CanZMUGRQTlp6R0dvbkdpVElhSWdLd0tBUythem4yTVRR?=
 =?utf-8?B?YTBRMjJpWVZZVFFEZkVEVDJmKy9iSUZTdXBoaVVGMjBpclJtUkxMYkhFR3hB?=
 =?utf-8?B?QWlpN09uYk1CdVhDWFVqa3I3NEdWYUdFT3pxeGtvcVAxdStEeXZ4QzF6MTli?=
 =?utf-8?B?S0IwT1haVmFmTlVmcEd5S3V3WUh1bGdIZDQyMFRuL0lRU3hqTEV2NnJYcDZY?=
 =?utf-8?B?cElzTE5DcXNKMzFhdVUwcG9KZGhnV1JxQms2Uy9zSXpIZ29pc1B2NzRsV1V5?=
 =?utf-8?B?dmx2Z3M2VGFiNngrMGR0c1I4LzM3N3J5VnJsQzhqT2loaDVHY0grOEFabU1I?=
 =?utf-8?B?VHZUVjdaRVh5K3VrcmJOMnVwaEtJY2FhTzhVR1hrSFQvQ2JZR0plOXZsa1Bp?=
 =?utf-8?B?SFNqMmV5QnR3MEhNcVNjR0xFU3Rva0pQdUkvdFhSeFBTL3NYUXhod3EwdnE2?=
 =?utf-8?B?QVJrQVVMU2hDaVFFaHZpbFVyL2hTcitBaFB0QU5kcFVvbXlUZkVOQkVEdjBy?=
 =?utf-8?B?Smd3cmlMUzMvY2JySk1CQWpENzh3RVpiUEgveWtPck03THhTMitWeW1pREFu?=
 =?utf-8?B?bmRKTzJ1MEVneW13aFo4UnVNL05panBvb1dwQTFMd3RROXY3MUttRXZZN2Uw?=
 =?utf-8?B?Qkx6dVJWdlA0VENReWdaREtmL3BwNWZ4Z0x4STkzVVZXd3lNaGg3ZlI0T1lX?=
 =?utf-8?B?OTNCQTRSRDNTeS8vYjI0UFBDWDBONFhSWXBMREsyTmJTVUtaMHdSMEo4cjV3?=
 =?utf-8?B?MERzU2tNTVovb1RzSFBRMDh3SFdNSmgwMEJBZGlRV3hPT3FSa050aS9rcDll?=
 =?utf-8?B?VFdBaTNOMTJJcGVRNlJVQlpoalAvM0RDYThjanRVbGltSEdrNThCZUFWT2pz?=
 =?utf-8?B?YWg0U3RucFJ4emM5Q2FoZ2Rjb1R3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2559271-103c-4436-202e-08d99d0e1435
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:03:24.5088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlx9Pn+JYP3SCjbD89Fkn2NcNE7ClFycF5Y0QIimTXwwaqqgphzpn0mG87dJSZhv1JeNznF12yOXIACAlqrJFiCs/d2auplhLgP21r2cgec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=2a01:111:f400:fe0e::717;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.592, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

29.10.2021 23:32, Eric Blake wrote:
> On Thu, Oct 28, 2021 at 12:24:39PM +0200, Vladimir Sementsov-Ogievskiy wrote:
>> Let's detect block-size automatically if not specified by user:
>>
>>   If both files define cluster-size, use minimum to be more precise.
>>   If both files don't specify cluster-size, use default of 64K
>>   If only one file specify cluster-size, just use it.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/tools/qemu-img.rst |  7 +++-
>>   qemu-img.c              | 71 +++++++++++++++++++++++++++++++++++++----
>>   qemu-img-cmds.hx        |  4 +--
>>   3 files changed, 72 insertions(+), 10 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
>> +    if (cluster_size1 > 0 && cluster_size2 > 0) {
>> +        if (cluster_size1 == cluster_size2) {
>> +            block_size = cluster_size1;
>> +        } else {
>> +            block_size = MIN(cluster_size1, cluster_size2);
>> +            qprintf(quiet, "%s and %s have different cluster sizes: %d and %d "
>> +                    "respectively. Using minimum as block-size for "
>> +                    "accuracy: %d. %s\n",
>> +                    fname1, fname2, cluster_size1,
>> +                    cluster_size2, block_size, note);
> 
> Results in a long line; I don't know if it's worth trying to wrap it
> (if we had a generic utility function that took arbitrary text, then
> outputs it wrapped to the user's current terminal column width, I'd
> suggest using that instead - but that's NOT something I expect you to
> write, and I don't know if glib has such a utility).
> 

Hmm. But long lines printed to the terminal are wrapped by terminal automatically, so we don't need to wrap to terminal width by hand..

-- 
Best regards,
Vladimir

