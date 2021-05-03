Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C23715E4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:22:24 +0200 (CEST)
Received: from localhost ([::1]:60000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYWl-0000LO-C1
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldYK4-0006O2-AR; Mon, 03 May 2021 09:09:16 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:22196 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldYK0-0005if-RB; Mon, 03 May 2021 09:09:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RozyPATZJ6A2/n50X5XZOWl2fwg+Q+EV8nIsF3YpbBomxU+lofSWDDEpAsNkFIVNPLav/pqc9HUzrdVumq6zkckhm7wAJItnEzTwJvTpwUVRujQ1eN++aKuGJoiXL9k85K9mjVP3JIl/Vqo8jXlBMGVzu8csIJJogrwuqR9TflrGQVF2vq6tXCeEkvj/6rzbPKrMv6HZjZB/Pi/vk6+372VtY5MSx43H/fe5CGGAOSsFMpXABfM7I1vp0dd7xc9+hWL/pIjpxBHcUMdPzwKeOvGHBT5LWuiFeuZZGwOQAaEnaCed+qyHm3fYZuXelPPO0ZaqusA6ffBa+7SEkKmVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YkTR9ECdo+oabcNmJy67iyYCqBLHNTep2sUv4J22s4=;
 b=jhO6i7Yb3/OodRgJgTlT9GlU+xVN/Dc7E8IlyZUg1uV7jin/mjpAS/Swvg29wY5WiKIOzgR5eqh7HlA67qKnd9EcYiGhWkWhpbxieYbds759oLhnanMbHNU1dCEIeJaH70+LtihEZuvijVXumxH6hclTZggoAapW/K5DVmmD+s9k6cTt19mStf9ttHytmsdxYgpIma+9lSKBK4XeUPydsF93/+e13K40/23+WELjlkB9poL/5/++ATK/X4LiVqk1YdbG/D17lqS0F2WiadagBzx/78JpbDV2X0AF51lFV8bIZsDHMN5Nox97SgP2zdzJjrjYwbiain0rbp89bpRSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YkTR9ECdo+oabcNmJy67iyYCqBLHNTep2sUv4J22s4=;
 b=itospG3c3G9CVSPYqV/2WGSpJTcAsf1l6v83r01Ta1T4ma9PCFVsm+1lXSp6h6vC0M69RXHB9RrW/71DUqpWuyqr9xAiUAtOEeZ8ot9gzYgKScsQzmFVXZAmrhnpbkFQSgbpA9VtMMYlbB/LN6XioDADXXOGCrGcup6Ls4mXoNU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 13:09:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 13:09:09 +0000
Subject: Re: [PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, mreitz@redhat.com, qemu-devel@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-3-kwolf@redhat.com>
 <ca5be7fe-9468-fce0-6f23-4d1c4c8ad1fb@virtuozzo.com>
 <YI/vgNBevsswQXe+@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <72a09cc7-383a-0818-7edc-dae75979a264@virtuozzo.com>
Date: Mon, 3 May 2021 16:09:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YI/vgNBevsswQXe+@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR2PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:101:16::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR2PR09CA0022.eurprd09.prod.outlook.com (2603:10a6:101:16::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 13:09:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03b82a1c-4a81-485f-8bff-08d90e34a35b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-Microsoft-Antispam-PRVS: <AM6PR08MB38610C285104C8935B1CA292C15B9@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EbVVcPGKUFomzWfKS8jt1yG2FnLUfLgSBeH5zrcOx1h6s4P3+Dgf1VjNkWQqX2KoDUySu5nIynZqMJu/fRtjeyfVNYAWKWHPjOO7I729jqbw+h3D47HiZ6qKAechW7Kp+MkyEbUBnX2QzQXsCdRMJ5tn91KVbg4fCugs83BYvZGJ5coMmXo5SIqZm24nvIHBrse+hYL/eC57C11gFGyJ47FuPSOptCINl4fBm8hijkZ4xMXHAN0f+sxUtP9LfoxViW03Rp8rexwb7Ve8zsdpkLzllgnqj+75rczJwAmyGah4Gi1NyFLJWogXAb0UgeLiq8+FUBZKpGlTPlBq4Ja9K7B9K4u4uUi/MNKnfsc8R68LYFiWj/WxXDyZQdkneIFNuuHoUHrfIXvtPAggFu8hXBZC7Rk5RIr6nGr+RKAKP/qWBLhSUWAeLVyS0Rju/MCWZ8fKuVGzySnvdnFYGoeai2odUO5TRgPf8Vul9UdQr9ShacNu+/1eT3r61XGNMj72NPqOBWo/4ab/HEEIc8GtFmbCz8FQ38utZ8xDTiUeiCJwmhlsTO1qnXfAGnB9a8t8bE66osiYXaF2TwQLw4V68Qa8Ip+4A8lCHBNYPEU0iJkECIlvPHgCYPz4BLMfiSF1mOOePU2hZmqRc7o/8QfiUPODDjOqzW/7jzGzSKhD91Fy4I3ZrBDG1rq+r24gufsWoGt60evsCFAjbCQnZ6h+Ak5uwciJRVF1/KZPzgTym8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39840400004)(366004)(396003)(31686004)(8676002)(316002)(26005)(6916009)(16576012)(8936002)(86362001)(2616005)(38100700002)(36756003)(38350700002)(66556008)(52116002)(66946007)(5660300002)(956004)(16526019)(2906002)(31696002)(6486002)(83380400001)(4326008)(478600001)(66476007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3gxZmRwMS9GMDExaWNHWUNEZ2pFenRNOXhvRWt1amw3U1NWb0MxRDdYaUVC?=
 =?utf-8?B?RTNvUGpKSnl4SmdieXA2ZmNRZFVRQTNWUEhCUC85T3FmNnIwTitXL3JrT2dl?=
 =?utf-8?B?WTdrdHhtVFJhVllMV2tCRHRvcFpCQTkxZWdlR1lLdWVUQWZPV3k3bE5CZTNy?=
 =?utf-8?B?Q29BdC9IV1ppclNUcjNpdjhZTzdWNzh6U2ZMbUh3RHZrR0hIYloxQ3QyZlMr?=
 =?utf-8?B?NGlZUDJ2L3hCUm5WWHhBUWZ5RklSTkN3KzJySTFsOEp5UlNyRENCd3ZLYS9O?=
 =?utf-8?B?L2Z3Y2NMMGJoM0R6T3pISzlkUzdOYithQUsrdXA4MDFUamRrRmI2NWpaSGFa?=
 =?utf-8?B?VlVYTXBDL1FkTERBZ3VPaERMVzVMOWdML0lwWlg3TjYwNUg0ZmZ4VmhtbUhV?=
 =?utf-8?B?cjI5cTlFY1NLcHJWd3Q5TmN3U3VxbDdnb1RrTTAzYVk4YmlQc3hjMklSZm1v?=
 =?utf-8?B?WVpMVUh1d2wzVFREMHRIcDVFUVN5dmthMlNROGF4WGdOY3I3bGFHQ0JSUkJY?=
 =?utf-8?B?VklQbk82S084M2ZMem5aMUoyR1RlK3h4SHVPL0FySE15eUpWWTZSeXVSN0ky?=
 =?utf-8?B?K3Z2Zmh6R3VZdHVRZXluQVhtdm5xUklFVks4QWhQRGNOZ0FQcmF0SVNWZUk4?=
 =?utf-8?B?dmY4b0hVaWgvMm5teFczYUJlNTRBODdkOC81NUZ4NzNaemxtWVJtOWhHZUhM?=
 =?utf-8?B?NGVMWFlGYWhiN0o4VEo1QzNmanZvbFVHYVR6M2NJSGk5NUtpV2hnQ0grM2VF?=
 =?utf-8?B?dVhMbmtKa2tCR0VyNWxJTVhFNzRzZ0pIbys4UGhBZEQzdFRpcTRFdmI5WHc3?=
 =?utf-8?B?aVdjMCtid1BPT2pWbWNCZG4rcWRFZU5wWnZrTGxLbEN5cnBNbGdUUGprMVRX?=
 =?utf-8?B?ZzIzTkFXVmRzbzFKNFo3d0NzOVlxRzJSZ1d5azFvRDkxZTRIb2FkOUJkSU85?=
 =?utf-8?B?eElUNHJMSVdaaDFUdDA3L1JocWhreVIvN0hPeFRhYlZ5THBkNlFkVWVGYXhP?=
 =?utf-8?B?elpwdkhheTMrN3I3aGY5RFdDdVkzcEwveHB0bUxWVjF6T29DY1AwN0RrMDBK?=
 =?utf-8?B?NGI0RXpGK1NYeG04dUpxeXpPOFhJanN4alhlZFNmT0tOdkl1Z25lZDNpNmJ3?=
 =?utf-8?B?ZjhsSnNJM2ZseTgzNTNyazlPWmNqcHR0ZGx6TGdBMHhDdC9lRHVWVWpoODlX?=
 =?utf-8?B?aE03b2txdXFtdkQwWThDVCtPajJBZks2NGozaVJwMjZLVzJpR1RiL0lOZlVo?=
 =?utf-8?B?SnhLeERtT2pYS25RZ0hTU3ZVdk9nTnlqSTlKZmx0blF2LzE0b3hUNzRGQjRY?=
 =?utf-8?B?MENCZ3lZTUN0UjQxUHBwNlJYYVZ6R1lCNi9oV1Jnb0lyS1ZSMmpGY09RWDVt?=
 =?utf-8?B?U0pnSWlnZFNwaW1adk8rTEFXTU00MmFJNEw0NTdOM0M3MmpnV1NGbi8rZk0y?=
 =?utf-8?B?ZjFoc3VJYXVHRDlhV2tmdlVlSUVwVG9XcEdlU0xLNnNtUnV4K2pGR213Tzdm?=
 =?utf-8?B?dzZROHprYitrZnRDUlBLV1BoRTV1Nk41bVQvM25vVHNqOEhWWXRHU2J1cnM1?=
 =?utf-8?B?aGVoRkdSaXNuTTNLTTluY2V0RmNETVlIR0IyQUFTMVErV2laek1EcUZ5TW1V?=
 =?utf-8?B?M2J1N05Dc25SOUsxR1lWMVZ3VXpMcFdsRWNTYWdFaGV1c0FJNE1uWE9YUlJi?=
 =?utf-8?B?Zk03NDdHWDE1ZTlBVjJnT0MzT0U0M3MvL1AxSnpaYWwvMGQydXF1aituYU9p?=
 =?utf-8?Q?DxQoXJvUYORbgw5ym872cF7dQpNjs7DEHVjlo4o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b82a1c-4a81-485f-8bff-08d90e34a35b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 13:09:09.3072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWZ5P97aFNm6PdGR5NKycNm1Wfpo+WLJC+Gx7wCBgXaU+6SHx7lZ1WjqvyyW1MKmtCMyj69KuISSkfHa2T9jNIH3t95D+sYJbSkwCJsGXIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

03.05.2021 15:41, Kevin Wolf wrote:
> Am 03.05.2021 um 13:40 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 03.05.2021 14:05, Kevin Wolf wrote:
>>> Like other error paths, this one needs to call tran_finalize() and clean
>>> up the BlockReopenQueue, too.
>>
>> We don't need the "abort" loop on that path. And clean-up of
>> BlockReopenQueue is at "cleanup:" label.
> 
> The cleanup of the BlockReopenQueue itself is there, but not of all
> fields in it. Specifically, these lines are needed:
> 
>      qobject_unref(bs_entry->state.explicit_options);
>      qobject_unref(bs_entry->state.options);
> 
> The references are taken in bdrv_reopen_queue_child() and either used in
> commit or released on abort. Doing nothing with them leaks them.

Oops. Somehow I decided they are set in _prepare.

> 
>> So I'd prefer Peter's suggestion (my "[PATCH 2/6] block:
>> bdrv_reopen_multiple(): fix leak of tran object")
> 
> I don't like it because I think every call that doesn't end in a commit,
> should jump to the abort label to make sure that everything that remains
> unused because of this is correctly cleaned up.
> 


agree now..

Still, don't we miss these two qobject_unref() calls on success path?

-- 
Best regards,
Vladimir

