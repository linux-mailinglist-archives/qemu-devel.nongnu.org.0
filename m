Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9937B6A0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:11:05 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgj1M-0005SX-OL
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgiza-0004KW-Vz; Wed, 12 May 2021 03:09:15 -0400
Received: from mail-eopbgr30134.outbound.protection.outlook.com
 ([40.107.3.134]:19838 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgizS-0004KU-L9; Wed, 12 May 2021 03:09:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+wmU2RbZupLTwdxAZ+mcl+xu+484gfmfUFSUeOxERfgPCMl5UxZPvRz8wkMqD8WmCfZO9CMld6pmtlJelPqCnZn6rm0TRmKS/qQ3rgot00my1MVtQ+gKD0RgLCN7SEAPayxidQTdPT/0jQI/dYCcq2Fp1Wm4nkRMFVQM2n2IfJgggYgzGH+SxixTad8cngcD/VIPmSxFAyKbkIKG8rIPvBAuAKvmqvvGrFBHpyMGDWX2gH5fu8nkOl3bQOQcSuMwEDFTYfR8wVuiWX/vkpCAUQ1Bwb/4C8RKHt3qleljNenbdBjTRhscm6UcVXCOFF7TBJdPRRUyeY9/p83Bmme/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK8BZl58XTOogWNnZD7qDzV4jciK1fEiGJGJDnbiOCg=;
 b=CymvvhEuLHHJkDXcPkURSXGOuxAq9LMs4sHbX4LEVXh3WSA6hxI/x116C/YDR056Z1H3faZLEZudCvJFSMD1TJZ7axvpPUH5MQGXPkbJxYdiLCFrT7UzW6uGjrMAMaXK/NorTipRwuXIbwu1DOqJu/cZOtao1yApcU6ei67Fn8YWwx9Ngak7spk9PJ3jJgQkawUyJyGuInQkOMXyUZ/FWcEe+BlCuVJ/RFhWm8xfHlxivzeWxtPjZ9+DIA4Hw+BGsMSBJI2MvTOlREJ3nny7/dC0sEBo34Q2zWWgAdxvpY9U2AHoztwnynwBQFWRT6vJHLEBLtDSxQ8mZWE7YUD4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK8BZl58XTOogWNnZD7qDzV4jciK1fEiGJGJDnbiOCg=;
 b=I26g4C4MpwSvg7CZ4UF9wXPEfbCIJPNhSfrurNtVhkNJVtNnT8PpTy7/DC+y3fQfkC3/f056sGRM4mdMCBCGR4m1RLplLQLc9QdM8h7x8e60lC2o3ZAkVCfCDnek0AyoSlsfRGn8Lq9+ZmH0AGlSnJXxEMOtklhhnnrQ94PnrQU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2417.eurprd08.prod.outlook.com (2603:10a6:203:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 07:09:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 07:09:03 +0000
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
 <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
 <a8785afb-a7a3-0100-5c46-32914a273b63@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a31ca815-0fe5-75fd-013e-8fd096b33513@virtuozzo.com>
Date: Wed, 12 May 2021 10:09:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <a8785afb-a7a3-0100-5c46-32914a273b63@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM9P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Wed, 12 May 2021 07:09:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b46b4e13-e40d-481d-a6b5-08d91514d2d8
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2417:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24172E9744BB2228C22CA3EFC1529@AM5PR0802MB2417.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ApgZNWJV0apvnkgzxaIJ8H5U3VquOuZ9v/ukIQp3YpTL85bBfxTGUkuS61JPTivMkXINg6boebDw8hu65TK0QepiSpjWWD/G2m+ojATccHx7oRaOUbRgRMzJsjMFkWP6QC/vujGEaZWu/A65YwUTtkecHihe9Wxx9KWr92aD++mTFX+dA4vifvWcWhts5rovv1156IlODlsGiqr8CfkGnrzv1n2mLrOFECnasmxTpdkM/SrTUZTP2bQeRLxNNZCaUx+qqHNopQbVdpQ/Ll7rSUnNXhwJkDJScxiycf9SJDC/C/VkDbMtjo6Bfk4Azbf2bL2+FpMtDPvONV9qev7oElkyN53KS9XgOkXIl3y4DX03F9By45msFTwkLyq8m8jBYhuT0SFBPc40NzqTLYadMGK5kDcpvAJ0ndLSADpNSurdOO4nASKdbyR2JrAfJHNF4gH6kiBeksvamaxQUHrv3+H2sF4fEqHbIKHqbGIhyIi7Q8uRmAnCjHNQc5bx91VEMD0UH60jJzbC4JdVUFL3EuKKmDYCe6ZnxfhlIjY+LLnFmDKpfaxsZt9NzZ7TZJXm/eDPI+6hUkH8e5sRSAB2zwEXN5bk/Gnzw1S4JAfSngkG0sRqbMQtD92mdQl3SjM+MwPGHcnE8bogFKtNZH7YOWPByibyoBYNTb2DpXWF8AgNi9Cn9Xaz3/HoDQGhjSdwBBw+EddUicU+/SB6+RJfV2XDK1sWI9G9ktz7PC2K1Mo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39830400003)(346002)(396003)(366004)(478600001)(16526019)(38350700002)(66556008)(316002)(110136005)(38100700002)(2616005)(956004)(52116002)(26005)(54906003)(16576012)(53546011)(186003)(8676002)(4326008)(8936002)(31686004)(2906002)(31696002)(36756003)(5660300002)(6486002)(66946007)(66476007)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QURCZUFKUElHeWZ6Qm8vc3U1Q01MREsrdGEvbVVWQms1VHFraVV0YmEzTVhS?=
 =?utf-8?B?aEcrU0U1dWNHbHhJMWVpZkxJSE50TDJZcnBjL2NpSzJBSEE5Tjh5OXQwTDBN?=
 =?utf-8?B?c2JxVEUway80bHJWanJBczZjRmhSUXVUNHpvbDI0MVdKNWdvSnJRdm15MUpD?=
 =?utf-8?B?Y2pJUy9XTWIzeGhNZ1lWdmhPTldYWXF4aDNRbGtWa0hWUnRuZDlLRzRyNi9I?=
 =?utf-8?B?K1FOcTdnNW9sNDdzSlJmeXE0T1N4dEpXRy9iOWVSMUVqSGRpMmpJTDBRaGhH?=
 =?utf-8?B?K0pBVEIxeGd4aVNtQWlyOTZxbHE1Q2ZIK0FZUW9hZTJEYkNSeDRvVnVyM29w?=
 =?utf-8?B?aWFDbXI2enpNU2FISkMrL1lQUDFCQ0s1Y21WSWJHb0VQSGUvMUYvY3prbnIz?=
 =?utf-8?B?cVFYQkxyYzYrNnZ0cWphdGhDQjA1WXBTY2RvajF4MUdWZzU5YnIrZFpMcFIx?=
 =?utf-8?B?MUY1Y3g2T1YrdWFKNXQya3BNb1dsVFFlMUxGb0NXZHFDbkxJUDNvblFqNko3?=
 =?utf-8?B?NGNmRmVEMWtidU1QbXE5RTBtM3YvVmhBWVZUT0hKRHZUYUtSa2lMUkNsZldW?=
 =?utf-8?B?KzhQV1lEK1dwdERRbjVZWDhQYm5WZDQ2ekhkbU5Rdzk5SHk2azUwYnJDSW1M?=
 =?utf-8?B?blpyWlB3WE1QQzQ5MldWL2hVQzhMUTdGdVpPKy83OU8zUFpvK3hvNnBoSnZN?=
 =?utf-8?B?KzR2blgybmFnN1FkODRpcjdYUUh2dUJybFRyRFBZRUQ2cVhSdUVldU5USllU?=
 =?utf-8?B?NnN4cHo2SGFPMVgvNmVtdHRmVEk3V1FOUUVoNmkwK2t0cE11em5IUEpmUFNt?=
 =?utf-8?B?OWxqbzIxdzgwWXgwYzVreFBvcUFuMDh0dmN5bjRBRTlBN3VlRUxVaDhHN2sr?=
 =?utf-8?B?TlFuSnAxZjFvL1pQd20rcCsyVjhxZW1ZN0J0eEtTRDgvUkVuSWJnYUVOc24x?=
 =?utf-8?B?TjAvWFAvNEt3VmtqREFIWEptbnIwNlFqTlViRE5DYys5enMwd0NaVHozOUgr?=
 =?utf-8?B?ZHljdmk1TG9QYkJOOGN1MVVOQlVxRGcrNi9iZzBHZkF0WndSVkdCbVBNNHlC?=
 =?utf-8?B?VXpJeXNSZFYwZXREc0hZdFhueUxGdjYwVzdVdVF2YXJNZkszZ3NqVGRTMTAy?=
 =?utf-8?B?Zkh0SVRsS1BqTTlQdHRtWVlhU3R3SkFYTjNwenhaL3ErK3k5R0dBUjRQSkhq?=
 =?utf-8?B?bmt1YjJzODIvaXpVcTdZbG9QcytsNTllb3RIQ3pHKzlHYW9GNjM4TVQ0YmZx?=
 =?utf-8?B?djhDR294dlVGY2d0V3JIZkptTVcrMDRadUxNSm5mS1pHVk9DWTJvbStUM3NP?=
 =?utf-8?B?cFpOMHlwdnU4NWxiYW5kM0pleHdZSEhiQVlIYWZCVWRKWjNzZHdFaTBWcGFl?=
 =?utf-8?B?Y0hzS29hcUJOS2RpWVlRZW9kTHJib2NYMC9XbzlXK2YwMlpUbDhyeDJRYzND?=
 =?utf-8?B?TkVMd2JmL2VWZ09sQ0R4MHVVZllYYUNQeEwwRndSU1ArekdTTmc1NktvZE1n?=
 =?utf-8?B?cFdDb1JYK0RzcUtxUGdPV25YS0JxSHNkdTV1Yi9ud21CMUtaNW5HMU5zSWk4?=
 =?utf-8?B?dUEwZU1wSnRCS3pGYmtlcmZHOE1aRzFMd01hUmx6ZzVtWDlQbGRjMHluSHZU?=
 =?utf-8?B?TmN3bmxqWFF6V1lreThqQWFMZGJVaHBsck9RZEwvU1FsSm9vOTE4eXRRaXNE?=
 =?utf-8?B?WUE2NTVPRFFWcEh3eXVlMU9YZitUUWdtWS9YREtKcmttb3l0czUwN3FPU1VK?=
 =?utf-8?Q?+IjwQVjtE6/iF4r3eJmqB4IGmN8u//0qtOhI+mx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46b4e13-e40d-481d-a6b5-08d91514d2d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 07:09:03.1713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAmzu5cd6b7uFcG7ZHkLYjScwaOMpXr6W1Aq6Y1tL0GQqZfZJ1dMJauDT1ro53R75r0BnO4IoLrGDZhTl/Mj9yjifudMULukWvKtAIYdSZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2417
Received-SPF: pass client-ip=40.107.3.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

11.05.2021 15:28, Paolo Bonzini wrote:
> On 10/05/21 13:28, Vladimir Sementsov-Ogievskiy wrote:
>>
>>
>> Could we instead add a c file and add the structure private? Then we'll have progress_new() and progress_free() APIs instead.
>>
>> This way, it would be a lot simpler to control that nobady use structure fields directly.
> 
> I don't know...  I prefer embedding structs to heap allocation.
> 


I agree that embedding looks better from allocation point of view.. But IMHO encapsulation guarantee of private structure is better feature. Especially when we have getter/setter methods. Even the patch itself is example: to review this carefully, I should somehow check that every use of the structure is updated (grepping the code, or maybe change field name and recompile, to catch every occurrence of it).. And if patch makes structure private and adds setters/getters, it can be reviewed without applying.

And we have to call _init/_destroy anyway, so it's not more complex to call _new/_free instead.

-- 
Best regards,
Vladimir

