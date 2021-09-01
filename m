Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FD3FDD31
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:31:22 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQKm-0003om-No
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQJD-0002Lk-EQ; Wed, 01 Sep 2021 09:29:43 -0400
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:20016 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLQJ8-0000Yh-Vu; Wed, 01 Sep 2021 09:29:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWGiorOq3Bawe4luj6nOfSthyJGfr6/Bx8BjU7TXw3q6v+F493bykogUhr+2/VY302NLVI7vMN2Est05UpGJY0rcTuON1hl0OqEznOGOH6HDOUZGHZuqdLI/aIeMIDXehiwOnYU44Wdfks71AM9Eld7sAkwKm5oD5nxRCupgN+osp+f3nrKXldfjo3PYhDBQKjiqoF2UlldHzTA9k3kxDV5QeLUWrNQWDcuXxaTXSUukfBpJpUwFbxe/L+ecTSZBbThsG75giQyRYVD9khLhi+pVJUslynRNbRqvtXXg5AF1P5NLkJ5iIXS/5cXG1GibYe2h07XiLv9OzDC5wqSW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz5JsxOmfkoLhrsiC3o1xUgacnVnO7Xw1++wnuJ2qq8=;
 b=jaH+mJCP2fcT2PMHhanJ0AjC6bHGFPJM9WLeanwP213Dbf9VSvpgGVeK9qb/slim7e+68UtPjkpwv0fF2TrNhkx0St9+kyPSSesUA5WhWEuyoo+nALjXq9OinRP/e9o4UhCCRmJO+bXkDgF2B2T6SrlO/7kJ3eJmwFVwjfyQjT+8Qi3+NUWvKhXtgMhN5jJ84PFAdm0AK+S+fLLt1egQ34U697zrVa6GFBLxVRvhcRN0PZmE2jeR2bLheLMxyLSsH73xePoNaFKDQB9EhXBeybw1wXDCuZzIMVAAwNOtnMiz7iqWyGU+Tnqkz57PQ9BFyOl6zOVRd45qA1inWBSAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz5JsxOmfkoLhrsiC3o1xUgacnVnO7Xw1++wnuJ2qq8=;
 b=TPMv9GuScQhuxXwxNyrznMlvGVtaQC0lHjDpEQvThiQGrR88f9eLL2hlWb/CZEMB+sQ+O9bEtc2bgGs/e6aWRq8aSzgUx8dxgoSb4ORJv4ujBM4y70w/L1aZHEdb5XSXB185+zDX179os0QclQ7R7LiW/WBvLRH2OROcX4VDKPs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1853.eurprd08.prod.outlook.com (2603:10a6:800:5a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Wed, 1 Sep
 2021 13:29:35 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::2082:8a88:6ff1:2dd8%5]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 13:29:34 +0000
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
To: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, libvir-list@redhat.com,
 eblake@redhat.com, xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 nshirokovskiy@virtuozzo.com, pkrempa@redhat.com, den@openvz.org,
 yur@virtuozzo.com, dim@virtuozzo.com, berrange@redhat.com
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <YJO9owtr4N+1Ta7k@paraplu.home>
 <d3207955-794e-2859-14c2-80fa6767a13d@redhat.com>
 <5cbaa5bb-65cf-82cd-7f8e-8227a5f50b6d@virtuozzo.com>
 <05a5cce6-6ef3-60f1-76a9-93c183fc7273@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cd8a347b-4068-e2e5-7fd9-e98c82b9533d@virtuozzo.com>
Date: Wed, 1 Sep 2021 16:29:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <05a5cce6-6ef3-60f1-76a9-93c183fc7273@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::19) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR3P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Wed, 1 Sep 2021 13:29:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be00a791-8266-45eb-75c2-08d96d4c89cb
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1853CE2181764DA93715C715C1CD9@VI1PR0801MB1853.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9e8BVnv95o6vwtbPjw4IA9scEY/6FlaANvsnOs15vp6tSWAkUFacrWzb4sSXKrFZjnvbOhwiKnXk/N2o320iMAKObOzygln0Kw9GxuV2f1M5WFW7ZMCBvzrZZHhcwfCUbkPiCeb0JdsDWnO/hUDh7XQ/lx+tJo+MCXycBT9G6bls/BBgpVLr8KW4p0pwf32sW96DRKWMN/p2OXGw+IAX1e4ejSUeRMcWsmvF0SVJX+xsRSX49ebVYfZ8SZIC86lMplNENWlu1o4sVlO6XVAgqWu+AgPPqHyk1YEq/I2F069Y4W3B2lccPn/XlnhIstbZXi/7gJf3/pvojkn5QlfFWpQOhj8RQwUJPV807jxG8286e6AE0Sq4jNRz22Bm12erzDoNca/4GxP9y0Si7Pk0UmpgZjIT3wKol09B37+2ugtd1oix87DKb6znEVwt02pW+Q2UfZ0HbBrHwdL3QfuSpESqo9clnTmvUT5ooC7Ec9h9yZ/7taxkLHjhvgLnbe5CE1k/SPNxwsSABSQescC/Uv27gBfCbXhHvxrLcO1NF8fotS5wYJdaW/oLLxg3WFXwWn7DL/NqTHXDPUL6vPuvKCSkkoRVuAfhsPDaCq5MYhstsHULVKIgaZj1wDVFFOHmyZcdBZIK1mXIKqBCW7HQE9Mp0+Meq8iaBlhORzzPkD7R5WKam0pXHDqopzKL4dedyCtVwmatcpFA2V8uOXnuaCoSuxa3ShxcxWFuo/W1qHvcAWe3vLzjS4vP4UaaVDsb6xvSXOZ8mup1I8wtIaWGlH+o9nk5s5f9kY/9vCf1PFyy7FxJnoEZJezcNr35h5B8nPQJMLKbXow3+E59Z8lotAhpWyQqrTo4I23gEkw83F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(31696002)(8676002)(66556008)(8936002)(66476007)(66946007)(83380400001)(86362001)(6486002)(186003)(4326008)(53546011)(2616005)(36756003)(508600001)(966005)(38350700002)(38100700002)(956004)(5660300002)(7416002)(316002)(16576012)(110136005)(52116002)(2906002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0o1OXFJTjFPckJqdTY3QTJQM1Yya2hRVVYxSnpTTTJYRnNYN3RVeWVLbjdE?=
 =?utf-8?B?dmFPVDFaK0krRnBrSnRQbmlXYXJYVUhneVI1bHRvRWttMExtU1ZxcFNDN3hs?=
 =?utf-8?B?WkhLbmJUTXZFNGsxRTN2YjdRN0dIUkdnN1lUQ09WTjhSWXV2RGJnalpuOW5I?=
 =?utf-8?B?cy9aTlF4Sk1BUG5qejlYYUZnUXBNMXJ1cDlHL3VXNkhvM24zYXdZYWJ4c0Vj?=
 =?utf-8?B?NWx3bzZBUVJLVjZDSkpOL0hDbUZjdnhNUDNZUXRTZEIwR3Z3Z0xDQk9EUUc4?=
 =?utf-8?B?bm5yYUxwaU85Wk9UT3dhMjZHU2pjaHhZbjRHdUx2T2JWQTRtaFhudXpIQWVH?=
 =?utf-8?B?azRDV0t0bitqY0g1ZDVmVHRuUzBkZWlTWHFieHUvbVNrZ1pyZmhXYnpYY3FH?=
 =?utf-8?B?V2UrMlhydzRiMEZFd1hvcFdmaUFZTWJVSjdXNnV3N09ldjBTU2dZNnE5UE5Q?=
 =?utf-8?B?cmpmR2liM0p2NC9qWnVzazhQOTlKZTZFYTFPSzJhenVMYXdzWDZOTEUxenZ6?=
 =?utf-8?B?TXFnUlMyKzFpR3JmbWpVeHkwVGNOQXhlQkFjV280ZFZKWnhiTXV0blZkb0do?=
 =?utf-8?B?OW8ybDJtcVlIK1NHdGZ5Y25JbGdnMnJ3dWJUZmlxVUhCbmNzV0diYmdHRlli?=
 =?utf-8?B?VVQzNTg1WE9wa3VPWDNucVFwZnZubUgwK3QxV1h3VW9DWUdlL0gvUjZlY0dS?=
 =?utf-8?B?eVpOeGt0Mk1tdDAzSUc3eGVobElwdzc0R0RQczY1TU00elhqZHYrVEVmb3dh?=
 =?utf-8?B?RnA5Zml0Z0NhenFUTVdoY2F4YkNjZ05YUldxUXk3RkRYelVuK1I4Z1hhTjFQ?=
 =?utf-8?B?OWFuRUExcWpyc1B6cW82MldMVk42MHkyZXFKVlNZN0FDM0x6enZ6N3IrZ2Fx?=
 =?utf-8?B?d29Ldmo1RldwYWw1bDlQeDdwUXk2eHRQMVY2dklhRjFsVUJGNTR5bW10eXMz?=
 =?utf-8?B?REZVWm1KdEpaZnU5KzJEUkZadVoweWJBUFZxOEhtOE5IOGZ4ZGFwNUlTUWti?=
 =?utf-8?B?eERPRWdTcjNrWnh0K1FFWEh1akMxZi9oVEpBeVBMcEMvc3drMGlZYUxSWWFL?=
 =?utf-8?B?Ykl6alp1OHJ2MlpUbmlXT0tFZ3F2Mzh1VEpMRmxxVE9uTHlocSs4NnBlNllw?=
 =?utf-8?B?VC8zaEpNbXIrSnIvNFlxYjhKQXJWT3o2R3RTdmtXVW5hd3hKMkV0ek1OeDA4?=
 =?utf-8?B?T29FR0h0NG16SEdsK2xBZ2pWM1d4aS9ib0FPaVVLY1hvL2NFbTV1WEpuWVdR?=
 =?utf-8?B?S3ZVbUdLakpEeTJsbXdEUHdKdjFOSm9CaU43Mkgra2RmbzJFUDRKOVZLMlNQ?=
 =?utf-8?B?WEY5YStPNkQyTittak16STdjeXVVL1JDZ3ZHS091ZWZSaUhVNXNPNHN3SnF2?=
 =?utf-8?B?T0RrTEJHQlFqL1U0OUN3QUFIU2ZYVzdwWXZLaUJXaVVPRzN5V0ZiSld3Mjlw?=
 =?utf-8?B?dEsyWnFYWFMwT2sxbHlTUTB5SUdvSC8zT0pSZ2xrTXVUYlltTWVsRUxBT010?=
 =?utf-8?B?TGRvc3Y5dXZXUWxOWEJJK0hkQVBrNTFQczgyby9hR3hYejRaRS9EbnU1NE9n?=
 =?utf-8?B?Q1lQazZQZmd1YXBPazZBSGtpOXpSWmNQS1o1VVh5Rm10bVF4UFhIMGVrOGFC?=
 =?utf-8?B?SUhWNnpJVXlGdG5BNXRMdkp4MEliMW8zbTdhQXlLaVBFTzBmZlIxeTNtMnkx?=
 =?utf-8?B?VzdrNEc1ajk3SEZBcHhXR0hDancxN3FMS0RqN1JPSCtiSUV2NDc4dUMrZGtU?=
 =?utf-8?Q?dRDHYs1NHxc0XFTq4JWc1K5AnOi8cVwEpKZZ3Wc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be00a791-8266-45eb-75c2-08d96d4c89cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:29:34.7714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S62XovOJ2QGo7ZYUZJZUZ8efW+RpUeKmdAIEREqCkE6jBv5h1SSsweyBTjLX1x9QawsFbv8Dp5m0ir4EcQvgs4pbr2kttPhAZEJcaGYipwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1853
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

24.05.2021 21:37, John Snow wrote:
> On 5/24/21 10:06 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 15.05.2021 01:38, John Snow wrote:
>>> On 5/6/21 5:57 AM, Kashyap Chamarthy wrote:
>>>> TODO: We also need to deprecate drive-backup transaction action..
>>>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>>>> to dig a bit, but failed :/ Markus, could you please help with it? At
>>>> least by advice?
>>>
>>> Oho, I see.
>>>
>>> OK, I'm not Markus, but I've been getting into lots of trouble in the QAPI generator lately, so let me see if I can help get you started...
>>>
>>> https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/
>>>
>>> Here's a quick hack that might expose that feature. I suppose we can discuss this with Markus and turn these into real patches if that's the direction we wanna head.
>>>
>>
>> Hi! Markus is silent.. Maybe, you'll send patches ? )
>>
>>
> 
> He just went on PTO for 2 weeks :')
> 
> It's going to have to wait, I'm afraid ...
> 

Hi!

Any plans or updates? John, may be you just send your patches?


-- 
Best regards,
Vladimir

