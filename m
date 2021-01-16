Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38392F8E54
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 18:36:46 +0100 (CET)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0pVG-0003oR-09
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 12:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0pTj-0003Me-M4; Sat, 16 Jan 2021 12:35:12 -0500
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:25926 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0pTg-0001m9-Cl; Sat, 16 Jan 2021 12:35:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7urFdXN4VFKcPsGyZqfeaRvO2MCNwhbEUfn7/3dBwA2cHXgpfPyi98HmbIuB9diTyJMpWCUTfmgyQ4KN5mNESU6obmOE5kg3SCLoA/HnkhlU0XBjClu1dhRwSWrP2oqrvvaGteKCfPR9tKtjkrzZWS6SUbeaowfbKVIulMA9x/TtSobBLnUUW7BX44l/vMlJDlBpNN+ef78WWhtGKGnlJ4LdupOuupss4shSX7oEezzMRfrIaPaBbyW6FSrHu/c3AsC8WzOZ/7kiuios8kQp1yNUMWR19A/qHs6zT0CPcdh9mt3jCbtzU8EAt8JUutVF4fjNR+eZ9itKF7R63qBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0nhRib1vAKKGvf1NdMAHmf8FQBiHGiXItH2aHeY96A=;
 b=XMwZvZ8Yxa9wtNxsGLJUogUUylDlGQqS6FprLMC+5zJTFajL3pdG7Zexact8G468bbI4f/UO/NIWhnSpp9Q5T3KRoZAz0s1X/Zobl4gp8RlrZHjj2RhQeOnDr9LKDoiz2ZWugmVnxfXH9yc2uUdlaIN9yHy3kEeRmTdnv0eZy9fPgGeygLAYFWDxP23aqkTwbZlvLj80Cd810mhceCnj+tXIRR2/9X+MIK4BkPFshrnUOwslSX7vmTrF19vEEt3d72VAt2NWPMc879Ev7ppWz3kqIwTS/OFeoFqGoLO4iKV2vBpSJeHvo0dIW/x2+FYaJsOwlJrNhZ/IxvJVyn1NRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0nhRib1vAKKGvf1NdMAHmf8FQBiHGiXItH2aHeY96A=;
 b=BkKPRi2ygo7qYqjH1IbfTPhnikPa/vnJXjsJ0nihPg+bXXpIPb9egT9UDiz1Q9bvscHd6YpFSzXR5sJ11wpQxVrnvhZI/Y1rZFqO6Zj+OfeOIGrh5+G3x+370UW6IPr19b6Kj7w4sMorZqBwTGQ3E+SvEk/gbXU+B6btgUUGKXM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1905.eurprd08.prod.outlook.com (2603:10a6:203:43::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Sat, 16 Jan
 2021 17:35:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 17:35:04 +0000
Subject: Re: [PATCH v5 14/14] block/qcow2: refactor
 qcow2_update_options_prepare error paths
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-15-vsementsov@virtuozzo.com>
 <w51h7nnihhg.fsf@maestria.local.igalia.com>
 <7b459e36-0f18-4668-a53c-aa9e4ce13db7@virtuozzo.com>
Message-ID: <8e134db4-c82e-928b-9d87-6f09a29a3e98@virtuozzo.com>
Date: Sat, 16 Jan 2021 20:35:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <7b459e36-0f18-4668-a53c-aa9e4ce13db7@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.72) by
 AM9P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 17:35:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e65c4673-3c3c-4f4a-61a7-08d8ba450f15
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1905:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1905A209D780106C58A46F58C1A60@AM5PR0801MB1905.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFLTf20sAGpbshMEfpiJGyzWhqnkq36Iasx/h98Ay+1FC6ztQh5C2JiQ5EceeMxDFYNDkwKNbOx+35byCh7KtD5lzMTN4yyeNVonZ+ZAdP56yGC7FrLixCh3+nqam3mp+a3LQKL+rUe2aPoT0Y9YCYzncg88EMbuSPDq5ucZe9HxM+kyiv4ZDE1urvtPZp9YKKxv7Y3RQWmFQMUb5CDwHj+9T+Su2Hr6KCIaFv8ToQd3RdFnYgnxxpLA4W9Bumh/lutvvVYaXXfNlPlm2rvSMm/nNqNx7K2hbxMtsj/Uq0yGHxTNx29rS0elwRuvoLwmrJLGD8GywgmQT/3qRsx06q/Rj9zdJmCkoSvx59CYTfoO40O2ShGlODbS5fyJQNOeNXLN1dfO+iGG4r7zkncaPBZDj+c7+i80AGa7f8RbglR7GSne+ZQ6J/OClo8xGEC3u6TJRzOWgWPLCEOTJug7p4OBX3JKVrgtjEFbqis+FGVruiKy33Y8ClOplTClPJciOVdtFqJMFJeRnX/re47oFwx5HjyUIPWrCBGsCocH24ItdVrmf11ZHenl5p/IiQ2BzW+Iq1dVkKHkNzK7h/S9eQ62ecjAsOI/Q0GlGyx/flQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39840400004)(6486002)(7416002)(36756003)(316002)(2906002)(86362001)(186003)(16526019)(66556008)(66476007)(66946007)(31696002)(4326008)(26005)(16576012)(8676002)(8936002)(31686004)(83380400001)(5660300002)(478600001)(52116002)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RjlDRnhqRlFJaks5ZE9wTEp0MGhRaWRHOEdiWjdvSW1uWWFveXgrL2lQdGhI?=
 =?utf-8?B?S2VoVWRrckdFZVREWDJONHRCa212dW1iaHNxdXQzR0ptTXlORzdZQWt6ZkhB?=
 =?utf-8?B?OVZvN21JVTNrYVEvNVpOQ0R4dENuZDV2c2RiRDdMM0s1TGZYN012NkRiN3hQ?=
 =?utf-8?B?bUt3YWtHaUlKbEh1NHV4N29XbEFWREpiNDZFUWo5bEV3TXRnSmh2T0NrOW9I?=
 =?utf-8?B?S0d5aFdLY3doWjZjVG5VQkNqYmEzeDBaMTl6cGJkTytLYlFoK1VML25Kbkhh?=
 =?utf-8?B?KzZwMEkyNEVtbHpBRDQ1Vk9hQmQ1OGwzS1BLeXNtWGsxM2xINWMyS3FvVWtX?=
 =?utf-8?B?MGNNZWJLUmhUSHozSE81aGtCMkxlY3NIS3A1SGRqdVVQdDE5WGpwTlN0aUJn?=
 =?utf-8?B?NmFKZ3kzaDFEd1lwTzlOY1Fzck44RkdNT21NUlh5RzVpVi9MREZwSE5Kd2c2?=
 =?utf-8?B?S2ZEdnAvWDBQM3BEZFUzMUJ2OVhDUHVPb0c3SVRCRCsvT0RreHBPYU0vT1BG?=
 =?utf-8?B?eFk4TlpmU0RxMzVWOGppSHFhUjlCdUZiWTZPNFhwOVFEcFNXQXRzdHVDR0c4?=
 =?utf-8?B?Sm5jV2JKN0dmckRyaVo0d3ljVk5MamZ5ZVNoeTNmVVpsV2tEdnl1dXpHd2tl?=
 =?utf-8?B?c2Rrd1pXSFRQQzR0WmhjZDlBZ3JHaU1rbmhzV2cwWlBvZkdqdVhYUVZOZndw?=
 =?utf-8?B?L0F2dzVzOGk2d0ZFaCs1Q2Flc3p0TzJEVUdRRGVtc0dUQStDSWN0K1YyM0Y0?=
 =?utf-8?B?THBDNHhlMnlvbTJwUEZPSnVmUTRlYVRhZVR0YjV1NkxXbHlDekFGODVSaXZ4?=
 =?utf-8?B?d29LcG9leEpPMEF0Zm01MkdhaFZCL2t3SW9lT2cyZDljU09XZ2NPeHgwZWxW?=
 =?utf-8?B?NTJhNlNlaEdaWnNPdmN2VVMzZmpxcnZnNnFSejZGQnNZRkRuT0xjdU5OUnpn?=
 =?utf-8?B?N1pwZXJvNEpZMnZtZVBtOStEeHR1azhpb0xRemdUMFNEVjh3eHJjK0dYSjJY?=
 =?utf-8?B?K1F3TU9jR3ZXcGc2Y2I0czlvZVZHTFFmZXpsWWNIdzlNTVlZN2hhaUdMSTVn?=
 =?utf-8?B?akhrSHVaUDBLb3FaeXM4bEtYVUxTd0hyUXNXMEZOUmFBQjNpam5pUmxFRUFN?=
 =?utf-8?B?UUdCQS9abTFMVWdpZHhPMCswSDVrNVFZMmJ6OFBhaGpzYkc3Q09FRDZJMGZt?=
 =?utf-8?B?bFg5LzNQNjYvaFVJRk80SHR6QzNoamttS3pzZVRlMjBUSHN3TUdLUUR0QjVy?=
 =?utf-8?B?dmZXeVhaamhNMm1PdkcweUFoNnRORTgramV4RmxGaGI1ZTQ5MVBvbzFSWU1L?=
 =?utf-8?Q?laPQj3rbxBP/S8WIJtjhNjx4DOoXAmYkW+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65c4673-3c3c-4f4a-61a7-08d8ba450f15
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 17:35:04.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLuA78CncV5Q9b5SB9nm1WspG0pDMYlSeMtPOpWKEQGS79FQ3MMbJ+/ZcLpHfkWwSF7JqHK/e32RuSNyvOPLK4KOPr1aqeKdJAyunLeAEEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1905
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.039, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: kwolf@redhat.com, pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 00:17, Vladimir Sementsov-Ogievskiy wrote:
> 11.01.2021 19:08, Alberto Garcia wrote:
>> On Sat 09 Jan 2021 01:58:11 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>>> Keep setting ret close to setting errp and don't merge different error
>>> paths into one. This way it's more obvious that we don't return
>>> error without setting errp.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> I get the idea, but I feel the code is getting innecessarily verbose.
>>
>> One alternative would be to get rid of all -EINVAL inside the switch
>> block, take advantage of the existing local_err and follow the block
>> with:
>>
>>      if (local_err) {
>>          error_propagate(errp, local_err);
>>          ret = -EINVAL;
>>          goto fail;
>>      }
> 
> Actually in our new paradigm of avoiding error propagation (as well as void functions with errp argument), we should first update read_cache_sizes() to return the value together with setting errp, then we will update read_cache_sizes() call in qcow2_update_options_prepare() and drop local_err from qcow2_update_options_prepare() at all.

Which is actually done during the series, so there is no local_err ;)

> 
>>
>> But otherwise your solution is correct, so you can keep it if you
>> prefer:
>>
>> Reviewed-by: Alberto Garcia <berto@igalia.com>
>>
> 
> Thanks!
> 
> 


-- 
Best regards,
Vladimir

