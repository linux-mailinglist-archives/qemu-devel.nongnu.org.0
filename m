Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1783B00B9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:48:20 +0200 (CEST)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvd11-0002nA-5U
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcq1-0000UL-CT; Tue, 22 Jun 2021 05:36:57 -0400
Received: from mail-eopbgr150127.outbound.protection.outlook.com
 ([40.107.15.127]:50384 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvcpy-0004a8-AZ; Tue, 22 Jun 2021 05:36:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASlPXbjD5ycvRN5uqD7eKLyf9nT7Y08QJsn2OzBMBTV+zlmPI3I0Tezqq84JnIMcFPBMDp0OTtyFPrfHqAqifB6TcjAh9evJJnuff1Azw1WM/gLZdQCgVTvy24icwl9p9KKXsDrPZX8l4YMidjhW2Yd0yTmcV+EC/p2yJ7OstfQjNbwaRyLHFF3B3SaMJvgREfC7hTLYYXGkHn4SsoGGt37S7CUKn+Y3fFHJSBaflmDk4Q2Sgf0S2rt8WxRoy429Qodm25pNyzl1Hmf0eMPwdS9sdYBGhkizr/oeBKD3GBJlAoyd1+k0GO4vAYfHzH2++rmM3Ef1PI9L0qUDSVswqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OrwpTfnnI5IjMnbmW5CBJ1nqa8U3jvxTU82uIECQ/8=;
 b=ePRAEpVRhZnMCL0uBoYV415PXBqnRVQpN0F0G/V2qirLTw/X6Xly7mD7fgxmf2PoG7nGTelipM+PffjPsTObkOxkEyJKTlCKPxKrC6z3gH61uGLUbN7/Ht1rT+99w+Bkpmi3fHXQtp5+k89nL8PBtP7PwvK+H8Ka0vKcjUd+co0ykdg6typW0yuozWnAhDxyVO/s0Cxfb8ZnI+2F/tJP1VlBSEUnTtNS3Nj1y9m0Vkxkz90tB7uJsczqBPbIZy226nW/OFrs/RX/s2A11GjuRUOjccNije0ijz9kz38RTG9tCG8Z1udiCm8aVvMaVjxeqw+ovPdmIF3qQVrarEMrvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OrwpTfnnI5IjMnbmW5CBJ1nqa8U3jvxTU82uIECQ/8=;
 b=wfFJ0lUG4cYXbPreGpWszCs3JgCyoq4deUviFvelFdug1GBp9lVq5NTr0gKzMWD2pMi7q0GKwG494yiTopA2ns0zNKpL3F944l+qyMycRoPOCVs4+zHMHESuluts1SwXGTo98/VB5pe03GDv9nTHY9BbuGxmIrJZ0ShpJyy09xk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6470.eurprd08.prod.outlook.com (2603:10a6:20b:33a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:36:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:36:51 +0000
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
Date: Tue, 22 Jun 2021 12:36:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0344.eurprd05.prod.outlook.com
 (2603:10a6:7:92::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0344.eurprd05.prod.outlook.com (2603:10a6:7:92::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 09:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b83e455-13f8-4f6d-3afd-08d9356143f2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6470:
X-Microsoft-Antispam-PRVS: <AS8PR08MB64709C7E19B4310E3CC97BFBC1099@AS8PR08MB6470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgZ+vZGQc9IN1rlj5tgQFD+XuRNSJ53cTqBs5rthnmG5JLqId4O7g+A/DYUtePEG0EYF9Yrbcz93AGfdt5ohANdI87XYidUukHLqxv39367pnPSe0oZCmjG/qJG1fRJrUhdBQLi694T2PTqP/2HDgcFX/i0CiGiVUxmkaQNDuLx7+XTdZUgWUGPUHcYI42UD+FDDCNxMEVMF5V12mRA2jWiAzk+2HdsrQCcUtJWyaCrxSNpJ/ZSjkfAnALxkQUgkzQ/fRye3NwSr/S7S6eNQCc3z6ot/UXU16tD7acRFeFuFFu3ZMkQUC2RP0uXSSk6twTLsFYDfF26oixb7JKGbjgwuNbSBR9DOpmWGTKUp9rcGP9XsrFYejUQtIx+d47degNGgj7q9HJKWbsM0LTRZLRL4+HGwISeV77IRam6MD646AWYOWsm8jhicMY5LeqteOEa2ZcHQjrhWcSd/y+AAG35QMwlytDcyLWRNq4gHGG2MoB1cmwr4pgUg9gbQB3zfmzyyInk8Q+T8xj4D1mKQ4+26m08ZfHpjbR6vKlvh9NsSTHmiSY0K9LlTOmuinRznjJ3bit5LXrctR7Jou1t/YP3giGETrWqkmQ2L8Y9kvsBLA8tqzO8b9mI7WrVtX/IWjTVUrGG+gh/PnSO95GOtbcgqYb8eCu+b6AF5uyAQaDZZjepf5Hqcnua/xEI8JFeMLoN5NTeiORBtpSwFxo2MsHvDwzHsPcGlSAi3L7F5YjLny+FVgVZ7r2vidxp0daI8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(376002)(136003)(396003)(346002)(8676002)(83380400001)(54906003)(478600001)(53546011)(26005)(52116002)(186003)(316002)(2906002)(31686004)(16526019)(16576012)(110136005)(86362001)(5660300002)(66946007)(36756003)(2616005)(4326008)(66476007)(956004)(66556008)(8936002)(38100700002)(31696002)(38350700002)(6486002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzhZbzNhRENrb2ZWTDRVS1U1L3RlZHF2TXVrdnZoU3NpTXBVNE54UjdKU1ds?=
 =?utf-8?B?SHBXY1lNd1BaaWZLVnpYTVczK0dZRlNQUzQxK3dxY20vV1Z6RURkNHowa2VJ?=
 =?utf-8?B?ZmFPTnVSYjVFaWpxdEtxdFQrRjc0d2FNRm9odElQK0VkK1VPbnlxL0dVb25a?=
 =?utf-8?B?bDRtbUs1dFBlUHNEK1lYbmJieElEclFlUnlYVVZFZ0hGU0Q2czZ2UXZHZ3Rn?=
 =?utf-8?B?R3o0eWMyWFo4VkFvcm9xVkJIc0E3MW5obHRpK0RodFp0cUtnS3EzRUxkaU5u?=
 =?utf-8?B?d3pMeVZGTVBPYnNlSjBwYTF5R0I3L0tLOGowMVRhaGxGZjNhdDRRcnpZNVdP?=
 =?utf-8?B?Z3JkWVVSSTFpMjJJRW5SZ2t0SmRld3RTNGtJUHAxZHhKRk9hZ3RTTlJpamxm?=
 =?utf-8?B?K056ZjBvMFE4N05ldHRGclBzM3dyTnRiOHpXM1lYMzhNR1lMUmdwbGFPWTBq?=
 =?utf-8?B?cnFPTXJOdXA0K0xkMnl0S0UwOTRDdWR1aUtrUDlBWUI4MWc1NVRqM2tiNG5n?=
 =?utf-8?B?OXNkZ1pMcEN5U3BSYTJIVnNzMExVTzJnbERuL3NZK1RBTGYydmRJSi96OGwv?=
 =?utf-8?B?TSsvOWZuaUQ4Yk4vSDJMMWNMd3o5cjdIVElwT1lUdmJYU1doZ3NuaGRDMTJr?=
 =?utf-8?B?MjNpSUtUVXAvcUYrcHlrWERxSmUzaGpXY1ZITlRVdCtQYjVPMFpMR1lRcTVB?=
 =?utf-8?B?dE1MTmkzdEtuczdUbm1DTThHd3Z5Q05UT0xOeEgwakpSUi9WUVV2NzRjZUtM?=
 =?utf-8?B?TDlGendTSmFLTCtad2RxK0RkeUVxbkZtZld3cXl6dlpQaDdLNTcvL29CK0pL?=
 =?utf-8?B?Yk5IU01XeC91d09Va3ZIQjZQNDFSYS90d0JmM3ZqUXRJOUJlQTRTNzVaaTRC?=
 =?utf-8?B?REtabzBWbmpjUFFpWFhXSGwvMWYrRy84anQ3TmRkVWlaOHRpbXhxTWtBLzl4?=
 =?utf-8?B?VEVMaWNSNEhIamw3YU1Db1VlVDdGcjU1VnphdEhDWWx1UE5aRUl2MHNCbllq?=
 =?utf-8?B?Y1F1Wmw0QjRMRDNCcUdvcG5NWkE0NEpSOVpXNWpXOEJ1aGN2eG5iY2hoSC9V?=
 =?utf-8?B?Ky9hUklGa25XOTdEaDhHY2dRbzVrQ1N0MjFVb2pNcURybUM1OXIrRU5JT3Az?=
 =?utf-8?B?Z2gzRlJSZXYwbmxxODRHejJFTHllT2pLQ0htdHNJSmhjZitaUTdKZXNWRjlk?=
 =?utf-8?B?eUt2Wmd6SnBTakIzblFoajBDL2pIZG5TRGkxQ1NPUmw0bFB2WDVDSktGaGsx?=
 =?utf-8?B?a0twV3QwRzNDbm5QU212UE9idk9VNkR2QjZyZWdxbmt6M0djNjV3bkd2Uk9E?=
 =?utf-8?B?SFB0Y3R5S3B6QUJFczZZMDdiYzcxemVqT3pycWhzVkVlRVRxNTJ3R3pFNG9a?=
 =?utf-8?B?SkdHWlJMY0ZJWGtpdzJiRjhyZDVZK0pMUGV4MVZJSVovR3FHcGd0V3JVNnlR?=
 =?utf-8?B?YklvS0VhNjVIQUY2WWx5VndVdmxBdVdSb1JJR2Q5TGY2MTNoMVU1NW9HK0tB?=
 =?utf-8?B?RmxKYWdnWmlyWXhkT25xYlZwNzVUKy9DblU2akUwZTFTTTlYRG83NWxKT2Fj?=
 =?utf-8?B?V2I1OFBlVEFrL2ZMYU50aDVBT0Vyak1ESVlCMzE0NWpHcUFqQitkU2phYmV3?=
 =?utf-8?B?ck1HbE9IdGlhQ2dTSk1mdHovY0R1R2kydTk4aTB4RmUzUjhneEgrM29ITEFZ?=
 =?utf-8?B?K3l2VVJXZHdGayt3aHJpb2RrM0RtMnJ2dGhIVU5xdGdnYVFPN1Z3dzB2SGpz?=
 =?utf-8?Q?Dxe4jlGoCchuJ0Cim/1S61f4sueOt6ZOvCAzQui?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b83e455-13f8-4f6d-3afd-08d9356143f2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:36:51.8550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIxYwgK0UyrK2kozR3xbn7kOwYD9dQrHC0IpAj8joEovuByZwqs2JGQzn5PCdkjmza4ZA5F0bWC4hNJcthisNd8tLmhpDfHeO30TitNyO3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6470
Received-SPF: pass client-ip=40.107.15.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

22.06.2021 11:15, Paolo Bonzini wrote:
> On 19/06/21 22:06, Vladimir Sementsov-Ogievskiy wrote:
>>>
>>> -    assert(call_state->finished);
>>> +    assert(qatomic_load_acquire(&call_state->finished));
>>
>> Hmm. Here qatomic_load_acquire protects nothing (assertion will crash if not yet finished anyway). So, caller is double sure that block-copy is finished.
> 
> It does.  If it returns true, you still want the load of finished to happen before the reads that follow.
> 

Hmm.. The worst case if we use just qatomic_read is that assertion will not crash when it actually should. That doesn't break the logic. But that's not good anyway.

OK, I agree, let's keep it.

> Otherwise I agree with your remarks.
> 
> Paolo
> 
>> Also it's misleading: if we think that it do some protection, we are doing wrong thing: assertions may be simply compiled out, we can't rely on statements inside assert() to be executed.
>>
>> So, let's use simple qatomic_read here too.
>>
>>>       if (error_is_read) {
>>>           *error_is_read = call_state->error_is_read;
>>>       } 
> 


-- 
Best regards,
Vladimir

