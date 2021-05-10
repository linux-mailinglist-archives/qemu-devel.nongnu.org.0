Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC023780E5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:11:43 +0200 (CEST)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2t5-0001L8-0h
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2iH-0007PY-6J
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:00:36 -0400
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:64386 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2iA-0000Jm-9b
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:00:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+NgWkCUyLiCsOamNooaRQ+76p5Y4D/sDPWo7wHtzv2xYmrVDoWWOCi+QojceRD6NVq5eckZCU2pg5y2/t7QVuFPjwOuaFr4/UEdurGbzIqGn979shBVIA8A1KK3bIfdh4KUO9Cr7SW9FaH9dzDv6PnrMaGuzU7Mg3gPgVpovARPv2/63lKJf2ZQlpVP7yDA0LwmeoDOiybRdrRzXgMDHX88xLrzJQvatUEKg0NH7eQuw9FaXnASo3i1L1eG743FNCbe8wxRhVKgHMK1Y6AzyXfb5pcJjhk9hqCY8vNuLFMpVmu8XU9Fuk9H/UxMHslfCWsAJzBhAnmeaqQCMIDEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiKcJq8SMtQGkKKXyqT2hXoyVp+VE7sx664brwjL+Y8=;
 b=lUeMzXi7ZjpExkTKIuFAovQEsrr9fH7znQCpODhU1n5FmukOAIZH7YQaStc62sOLyZxsJjiLglFZp3pCl+z751rQJU3a/5TztTtAGZp64pbugj4fXDGnGR+Sg/K6h/jMJwgt8qrkKVZiPrVNgdO43IL8e+2jS3+BALdFLg14kWoDycZmPRS3Q6LGaC2kl2/SA4zJhejXyEztZmN4FJYYt1HZ3VmIS5b6Sl6qZVde4KV3FvqnVGPNimDqBmXGd/orBodz83izyTQ+nJZPrJh00jSeBj7Rk5dWBVRzjXD1YC3IhX+ySS+sIR7ugaHwB2AOMDD4keG55uqciKIExP7W5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiKcJq8SMtQGkKKXyqT2hXoyVp+VE7sx664brwjL+Y8=;
 b=GUABbK4XFPwruLNkNm4z8fB08tMpg1LYeNyy7xedyuFXZOJIK8+zQM2fgk1FOCgw4/vUpArWRRPmjqSecytS4DyHbt9ypBObh/lw9IvjPiVDMQ4wUwsK6dD8AmJubOjnylFGNUW3Ai3N7xDiLt0A6e2VtW1KwYARUt+qwU4DbQM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1969.eurprd08.prod.outlook.com (2603:10a6:203:4c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 10:00:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 10:00:23 +0000
Subject: Re: [PATCH 1/6] coroutine-sleep: use a stack-allocated timer
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com
References: <20210503112550.478521-1-pbonzini@redhat.com>
 <20210503112550.478521-2-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <28052a35-422f-2d5f-10ed-201468132ef9@virtuozzo.com>
Date: Mon, 10 May 2021 13:00:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210503112550.478521-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR3P193CA0020.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR3P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 10:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b6f4a05-af6c-462a-b528-08d9139a6d95
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1969:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1969905F33E17B661C782134C1549@AM5PR0801MB1969.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LGMOmTJ4r83e+Qs9xFZbsi3r0VrAEAYC2ZfPOzR5+PJsUnVCp2PDQZmdxUW8RkIrmiyJGQ3iu3O3BTCZ0xt2+94E07ESL4+BQU57k+7TvB1saH5l4dBVtW4+jftrnEPgzsSCAhw0U+0RviTv3ZnSoV1mVz6XPpcimPUg1FItG4u3SnqHyIxRBXv46z2PNHcUTyAlosLiEuDgrBMgqEQyssPzlngeAvkzico3UPZDcYrHU4rRIty9AiWyvwC+vmCPPH30ElNIB9KnBvxQhzONnq+dGPIyLc+Mjwcs5xPSJ7rLKgxvHNUf03dsirX/ZSluyAz2g3djW/EiEFWoOwiyQDPdWOOJ8k5DSqZ3khtMhbcD9jWHbTIVvXwdi03kxFZRDkrc+proBUepqMiTeoqtcAiKUB9/6eY+kia0pdvbafb40qwlNb3KigalqaoCsjMZvmQTP93nIGGUvOS3q1GS+VHL3uAo27Hn99swOADqvvgNQXZ/53K7+KweUU3z3YwHWTF/sT4Jtf5gTI9i6BEy2pCN9rduKHUG46OeI8TdOM+Guv+L5YszBnJbnYsbr3Or1tuIZIoPEoSI8v3UJIdqkv+corvGfeBdg+O79333ab8XZaDPyBEh8qdkJyqDCFFEsZsxEPM2EgXgFoMsX6vVQ9ssWX2bceThj2nxFcrf5p1hMzN9E407sTeoq4ox3tjLdjt6N7Bld3bTG2hb/KKiM8rGIefNSSIGGZ5CcbGDjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(66556008)(66476007)(4326008)(66946007)(38100700002)(31686004)(38350700002)(478600001)(16526019)(26005)(186003)(83380400001)(4744005)(2906002)(956004)(2616005)(36756003)(52116002)(8676002)(8936002)(316002)(86362001)(5660300002)(6486002)(31696002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnVXdHZVY1I0bElBYTBDNENTdzRKY0swVENtdjB2NVZCNlRFcW9yVzJPUjY4?=
 =?utf-8?B?V2p6UUJWSGczMkY3SFdXQXFVNVBtQlZqSXNSb2NybWtpeUgvSmtRNjZYWXJI?=
 =?utf-8?B?Vnk1a3hSTjNVRDdUa3RCMEZCaVpsY3d2Y0UyMiticVRnS1dNbzYxaEtETGJZ?=
 =?utf-8?B?cGdvNHdWdnIyRGF6QXVIcFhrRTI5ZnBjTDRKbXNSMWhCQzVHdHdqOU5mSjJa?=
 =?utf-8?B?MVFHOUNPeGY0MFdTRFlzc3cwdkJESXRQM3lCZzVLOS9UaHVWUE5LOXlsWHFi?=
 =?utf-8?B?a3BGK2pmSFlmMks4dlpQOUV4dTY2eTd0WTd0cHhWaDVBZHdJSWFEQnFNQlNr?=
 =?utf-8?B?U25pUk9LcmpOQVRLTWFlUkxsdWEzaHdmd0JLTjhFS3BmOWRweHdPV1ZPR29X?=
 =?utf-8?B?bzR3b0NTblZ6b1kyVW9mTVIyRkRWc1EvcVZGdUhWSERIdDVkYzErYml0OHRO?=
 =?utf-8?B?RnpmMDIvTDQwWmJYSm0vdmJyTmg4YWFuQ2p1cXJrNmU2dDBHemhKRDJxMzNZ?=
 =?utf-8?B?VDQ4WFd6VW1ncnFvZE5oK1VoZ0ZzeGhrWFVab2Rkc1VBOTM4UmJLV3F6Rmg5?=
 =?utf-8?B?akNGSTB6NkwrbThEdFQvUFR1aXpwSCtaa3NnUnMxekFqK2dtRXJaQjB4WFlX?=
 =?utf-8?B?MktEa2U2bFV6UHdvV2o5V2xlVlhBMk5qUFNpdmpqaTZuSVRjUGV6bjhMbzBR?=
 =?utf-8?B?S01yNGxNRi9DT096Y0pyTTRWL3F2d2xINW45TlY0SHNKdFdyMnlhbE95OFd2?=
 =?utf-8?B?My8wSWdDcXk5ZnV1Ymx6S1lwM1l4VlFhQnlLL1dZc3JEckw4bFZMOUpOeHpE?=
 =?utf-8?B?R1U4QVYxRUNHcEhsRW5mQ0xaRXdqaTBEVFRveTUyOElVaWJ5U1l1L2VUMS82?=
 =?utf-8?B?UVlJUGp1ZlVHUlByTGlqUzNqTXFrY0k4WjdHZFpBdVhJM2hvSXBOSnN2RWtx?=
 =?utf-8?B?ZXFPL2FaUFo4VVNRTEwxNXp1TEg3NTFWS2dxVXJleEpNcG9UR29VYkp2U05K?=
 =?utf-8?B?L2J2dTJPKzJDMjJYOVhwSy9Eb1dIS1BEL0FVWkw2emlaTWUrMHphZDBwM21H?=
 =?utf-8?B?SWpIYWR5ZzZLTkplNWpQOWR4K29SalBSMzFTeXlpY0phS0R2TTE0N1BVTm45?=
 =?utf-8?B?TWYwMHFQR2Q4U3dPVjVsbGJ0N1BCUUJqbWdJSHN1SGc5Mnpra3h3NHpwR3VC?=
 =?utf-8?B?R0lXMnNtb2pqOWhnQ1h0SUFlN0pJaWNsSEhRby9scm9pV0xWN0tqMVdlWUpG?=
 =?utf-8?B?dUVoR045RTBKYWloK2xNcU9HRTNIaUtGRWZydFdDRUhWZnBNTDVyRVhPaU45?=
 =?utf-8?B?SDBwdForTWhUQmJGR003RDBma0hQN3RzYXZUN3lwQjNTYURZaWZuMGRyZWcv?=
 =?utf-8?B?Smd4aWRKWCtjTWRXVjh3dmdBMDZxWTJEVkhjeWd6NUl5Y0pZbm05ays4SmFI?=
 =?utf-8?B?WFMzblZyTVBnalNNT000Mk9HMjFoNzMwT3Y3V3lqKzV5NE1QRzI3Z1J2dk1n?=
 =?utf-8?B?anhROWtCRi82YXhsRlcrZGw4Q2s1N05zcVZvNFhlZjBNbGMrendjNW05MUpx?=
 =?utf-8?B?ZUc0am5uZXFwRDFNaHFoVDhpZjBKSldGc3A5dVhzTm5ERjk3U3Ywa0hvTmNW?=
 =?utf-8?B?L3NwUXJDbEVEeWNXVEgwcWMrTmExUFNHc1Ezb2NsRFRhemE5YWxodXBRTU1M?=
 =?utf-8?B?Vzk4L2RhM24rQzlYMWFZcFpsZEZvM2sxbndjb3RmVUlJajVDVDNvYVRLK2tN?=
 =?utf-8?Q?OfVGU4Cn792jXwa1fLprWpFzQmZMxl83KhzujrS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6f4a05-af6c-462a-b528-08d9139a6d95
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 10:00:23.5628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLihNz5wDsanfWKzVTuCJmNbBfQNhRS9J0RYJH4CG9jHtO9s87A7XCBOfgO1OiQ3T1CLn8Xte9j+5c69ayc3wdpP9sr7Dfk9SynbFVDWKrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1969
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

03.05.2021 14:25, Paolo Bonzini wrote:
> The lifetime of the timer is well-known (it cannot outlive
> qemu_co_sleep_ns_wakeable, because it's deleted by the time the
> coroutine resumes), so it is not necessary to place it on the heap.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

