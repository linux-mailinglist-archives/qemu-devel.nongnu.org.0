Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6304A61A3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:55:00 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwQk-0003ks-EF
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuSF-00036y-PU; Tue, 01 Feb 2022 09:48:26 -0500
Received: from mail-eopbgr30132.outbound.protection.outlook.com
 ([40.107.3.132]:1858 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nEuRs-00046n-3D; Tue, 01 Feb 2022 09:48:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+Tt8MpjYwfivM1HO4NmAQETj06IyH7F6c4OC+X56aLREb6vGIH/SIw18KcPA55GTiiQ+ZwObrjlDXHfuUpT/VlA937lYRp3pQojh5ekHc1WKB+8pWMny5Eypz6hYYJlVCzoagvrTHWT7mV8xrgS+HkJCm02dbsj35ZrESPHniNw1eYMeaO2oxPJtXohs+uL+H9dPTLbwi7uImHu4tq9UbeJzxia1whMRNG4/epwowiKSzRpHHV77wKOPJA+1v3Ojt8FEKinGUMeMudxIAqaRrSM1SDC0YVI3THMw3q/PPCLNAikEjzR0e2ERG4qu/SettkMdYpetAQ2JQA1iSJf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNE3WWH+9bidMiHWj3/te02eR5dDCcxln7XcmMXGmGs=;
 b=QNTkt7pO/VM3227ycS2ecXtHZ6DAXU7WR6P+hKJtmjaEZdZSJ6bBaWVJdXEQJvmUz8ATweFA4oqWK2M9TEIxCuwUmXQuosgInFhb7s9T+ssd+qfG/zJfTKYPEmitiqeQ3ZhEoTtNMkuPLz75mxpDKVay7V2Y/gvFURJB8xRIyXR0BoaO94qCaeXkBYk0m1A4l5+Z/AJHH1qksnU1hLuwy+K66IWnfmv/rNb+pBge2/vPAR3RP/cnnzs0q/0Or0UfH3lp5oTwHgzMSfDChd/O7f7D1uAD232eM+fUOVysQhTC8CEvBCfjbRnxEj6k18Oe8rRJCqyjg2bTMlKBOjGDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNE3WWH+9bidMiHWj3/te02eR5dDCcxln7XcmMXGmGs=;
 b=tqi73jqeWX/+YtjchP4/gONVBth7ciYbgQ7hZvU9d2U1epUkeQaIdQ4tcBT/v6webXGd5IOC9z1MksJiBpFX9mfjjcnM7yn306GUeVJpvGi8+M2I9Xz+7BKqoO4xHXeO3NtNk31gjeQHqS6rnQgjhR11Wx9AO+AC78e6uIqJhGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB6294.eurprd08.prod.outlook.com (2603:10a6:20b:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 14:47:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 14:47:52 +0000
Message-ID: <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
Date: Tue, 1 Feb 2022 17:47:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220118162738.1366281-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11a66c72-8b79-45dd-60f0-08d9e591d30c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6294:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB6294B68AA60ED15598996F5BC1269@AS8PR08MB6294.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7nqKrpKU1hN/1y3qDrBgsTiTdbxfW/y+sksd39MOOAs2n4PAsS9dFsnUsEFV2c0lk6aTObhDy0HP311FDiS8RpTG1rgg9f0MmUGs+s0u8xZ/32erbXqm6akdQcAK16n6tNztKP73FMWS7e5Xuy4vUUcNMO8u0BfXwQaCkKpWDLJsLjJQwpnDIP1PMpERDZPETpUBG/M13rb90pbJtVmcilTblkYZajHGyRPFd9nfn7dSqKIS5IN6ATbSNFJaww4RfmQOeoGh/O1gGdBq6E59IWglLQ4eovOgPl+24WJN0Cr/OtiLxkB7mN6VJc4LpuPZqmOO4CdZF+gEtKGs5KiMJ1ItlDGIXfA3wdPxqDTLWiCVEmUUN1rOqL6ZU6hQRJTOZgiZoUm+y71aSzbz3wXdwjSHQnCE8wJzpuSKe8jPHGtvn4SMvPDOc5kOVBb8Us7uYasJ12PpMGFktmVQf6tqfOejCOcKpBsT7sPZkseoNFcheu9NHdG4uAiAAZKU5xOe0aXjvspgeFivI2EjELtR6Dq29GSq+cvdMhLCN8AX3xB2ozj1kcPhMjy0uLsUfbHgPG7mq/0bKWtdYrQ25P/BJMZWAp6cih0cx+YJvMZtNjfKILae14iRpPvpg/3QPuT4ra11rIKwJ5aDAQqK7Tguh/nHEGeaemJaZ5BdZmBH7lo/aYXJyr1M/MlW2CGb+tpFEnLTfMgA81a4QHBRXtn4g99FavbIqnzedGRCJKpTD69JndajjAxJnni4L4SLza/HSphJvLsd5euW67EFO4mlXaTRXcCVxOZw1oPD7wMSXuaCxp9bklpWcPloeRzU8xLFzm0ycIiOOHcfGC5FiiRpKaHtlzD8RGJJpDQdqK1nVgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(8936002)(2906002)(508600001)(31686004)(316002)(54906003)(966005)(6486002)(6506007)(6512007)(38100700002)(52116002)(4326008)(86362001)(26005)(2616005)(31696002)(186003)(5660300002)(66946007)(66476007)(36756003)(66556008)(83380400001)(38350700002)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlE4K2dMTFpoc1RRUE9MTHFyV2wwRE13azhmKzd1dHZpazVKQTF3OWozZzJ0?=
 =?utf-8?B?Zk1MbzhVUS9wdVRRZzZUS29ZQUR4SjU1Q01XMHA0OE9pY0ZMZ1VBSWZZZ0Ri?=
 =?utf-8?B?RVVnVEI3cHVTazVzd2RJRWxlVFJKMWo0RE5iVldsUU0ySmlGeFhKMjdSVWc5?=
 =?utf-8?B?cWFWTEV0TUNLb1YzNWsxV2h3Zko1aEF0VTRBbHlicERXaTBvdXZNS1NEMDRS?=
 =?utf-8?B?bU02c3owOEFucllTMXdwNXh4cEpCQ3J6Z2hoTmdFRHVOdUZKc29keW9NT3Mr?=
 =?utf-8?B?Q3dqYUFaV05adXlHa2tYcWUybTJmeWdCMDVBejluNVZYWVJreDVsL0ZBN3V6?=
 =?utf-8?B?QkNYNVR3a0QwUjFWa2xJaVNSeFUzdGNXVldJRGZpL0plYUxHeUlwcnlPWlQ1?=
 =?utf-8?B?amJRekhwT1BtNWhBVk9EOUgxSmRGK290MXUybUxZeVAzYVJJb2hJZlpISnZS?=
 =?utf-8?B?SjR1cEpCeU5qeTllTlVtYXFNUzVKRTBJUjRWZ25xVXRhNlBZVW45RGNqdk56?=
 =?utf-8?B?Z1JjcmowSVlRWEIvNGxEM2U2cUhNMEZCcDQvSUovVXR3ZmhrT1BRaEtqaCs1?=
 =?utf-8?B?d0l2SVF3bXMrbTk2bHpReVVUcVBCd01pcEtRYUgvbTgzM2xyMEVaai95RFM1?=
 =?utf-8?B?Wno2REE1emlpTEVlWFZDVXU5a3RkcXorUlZLRElTOHlKU0h3cWJZMGgrT29a?=
 =?utf-8?B?ZWFCWlV3ZHhXK0tIN2U2UXdaVzlrdG92RWxmNVJXa3lObnJMM280VUJwTUJ4?=
 =?utf-8?B?SWtBOXY2S20yVWNNaXM0c2cvU3JKdzI4UHFFNWg5c3l0a1ZQRWUzYkpHSk1D?=
 =?utf-8?B?cFo3RzBHNjY2VHNONEVFM3NNUFFqOUNiUXFwZTRFTkFCN1ZPdzRZRFZwdWJ2?=
 =?utf-8?B?WGZObGJmMFMxOG04U25yenJ5bVZLYXAyMEpBTDZON3FKdXg5TnB1bE56TlRq?=
 =?utf-8?B?SkR1eThLQXRyblhzdlJod2NkaWRQdVBNQkh3Z1JSNFNnMFV5V3hjWHUxRFN5?=
 =?utf-8?B?d2dsSWxIN1UyUnVwMjhHMTlBOEVFbktnTk43ZStBcWZld3RtQWE5ekRpbFlN?=
 =?utf-8?B?akJmd2t1dG5yYmQ2S1VseTk2bzVQNFR5SURWd25zMWVFNjVFL1RuaVFTRzYv?=
 =?utf-8?B?R3ZyQkxVdzl3OUllaStDUnE3cytUbWlKNmg1SFgvRFpnRlhPbTFORHd2NmJn?=
 =?utf-8?B?bjRGRGdKT21qaTlGdDVUNTdrM0JlUW1YalpVazg5Uk5CM3o5cTNJZVhkMEtG?=
 =?utf-8?B?U2hxZ2hkTUY3bjQrM0NFSEJBTTBjSmN0RnVrQ0xhT2NqS3VNRXJzZFUwVUE2?=
 =?utf-8?B?alFvUUJvaGZhUjBucWJlMFo3V0FmelJrZzdqcVZtVW5CTXVJclhid0c0SGNr?=
 =?utf-8?B?TldrcE1Od1JlWDFOVnFsc05CWGV6OXJRSko5bDlhUTdVOXBuRVl5STViQXkr?=
 =?utf-8?B?QmZxWVNxTDNPTDhNR0J3Tis4cUQrbzZ2MUdvWmJDYW1KVHhwaW1mUmlEMlYz?=
 =?utf-8?B?S0xBMG9iV1BMbklsSTlkWXJWUUI3VjdOT1Rnd2dkbWZzMEpxdVozM3cwbThY?=
 =?utf-8?B?TjNETEVkUzZZcWlxbFZtQ3h6NWF0QUZ1M2x5cGhEaVpxNVZSQzlsTmo1Q3BZ?=
 =?utf-8?B?TFhZamhRcWhGU0ZRd2tiSkdWUFJrMS8wOEZ4cDVGK3I2cm40dXRNVWRneWJi?=
 =?utf-8?B?SnQzdkNNNzI5RGdDYmJOOHpJK3NqTUtvRUhJazNXVzRncWIwbmNZVFY5dDhC?=
 =?utf-8?B?T0hqaENseHdSb3I3WTBrSUdOb2NVNU9TUVJtcDQ4UFJLMWlDcnEycS9PQUoz?=
 =?utf-8?B?dEsyTUpJVWZTeWEvVlRtUXAxTExaQTcweS8zL0NSUlV6Z3I2UFQwVlNsQ2Ji?=
 =?utf-8?B?VmQxYlVsV1ZLcTZCNDFFNzJwSlAwOFU1cEFNVEFQVTBFcXBUR1dPWUxsNHB0?=
 =?utf-8?B?TEhhRmZPTzhzcUhUUWZvbTFleldpazBuYlBTbHZycWdiQTJhRGlJbXViMkVv?=
 =?utf-8?B?MUVvbnp5TFVmcEdJYituOTJzcWpTYWhSWkF3Z2I2T0ttMEZERjljajVGU1d6?=
 =?utf-8?B?YWNqbTN5TVBxaUppeEE3RVpHREpBVDRwRmJqR2dyUC9pNEZDSVZBaXJFTUhY?=
 =?utf-8?B?Q3ZWeUdReGs2Q3IyNm9ITGVZcjJ1ZmVob3R6MS9mV1FweFVGdTN1V0NyMEN1?=
 =?utf-8?B?RWpGbDJ2U21Gb0UvK0g5M3pYWWhlN1MvMmFOS2x0YzFTT2t6d3R0NjY2c25s?=
 =?utf-8?Q?Vs1AKfV1aj42nZahx7/Q8p1miXi8EifPKqddQClggU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a66c72-8b79-45dd-60f0-08d9e591d30c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 14:47:52.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aX7e8t7hD++czJbsQPtk9StTAvVl1IMe3xGKyZzJj6gb2kRVnaTCET9zNZWD+/O+lNjgvXQtCwdUyHxjBnabRb1WkDSz3+udWCeE4yYu6WI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6294
Received-SPF: pass client-ip=40.107.3.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

18.01.2022 19:27, Emanuele Giuseppe Esposito wrote:
> Protect bdrv_replace_child_noperm, as it modifies the
> graph by adding/removing elements to .children and .parents
> list of a bs. Use the newly introduced
> bdrv_subtree_drained_{begin/end}_unlocked drains to achieve
> that and be free from the aiocontext lock.
> 
> One important criteria to keep in mind is that if the caller of
> bdrv_replace_child_noperm creates a transaction, we need to make sure that the
> whole transaction is under the same drain block. This is imperative, as having
> multiple drains also in the .abort() class of functions causes discrepancies
> in the drained counters (as nodes are put back into the original positions),
> making it really hard to retourn all to zero and leaving the code very buggy.
> See https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
> for more explanations.
> 
> Unfortunately we still need to have bdrv_subtree_drained_begin/end
> in bdrv_detach_child() releasing and then holding the AioContext
> lock, since it later invokes bdrv_try_set_aio_context() that is
> not safe yet. Once all is cleaned up, we can also remove the
> acquire/release locks in job_unref, artificially added because of this.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/block.c b/block.c
> index fcc44a49a0..6196c95aae 100644
> --- a/block.c
> +++ b/block.c
> @@ -3114,8 +3114,22 @@ static void bdrv_detach_child(BdrvChild **childp)
>       BlockDriverState *old_bs = (*childp)->bs;
>   
>       assert(qemu_in_main_thread());
> +    if (old_bs) {
> +        /*
> +         * TODO: this is called by job_unref with lock held, because
> +         * afterwards it calls bdrv_try_set_aio_context.
> +         * Once all of this is fixed, take care of removing
> +         * the aiocontext lock and make this function _unlocked.
> +         */
> +        bdrv_subtree_drained_begin(old_bs);
> +    }
> +
>       bdrv_replace_child_noperm(childp, NULL, true);
>   
> +    if (old_bs) {
> +        bdrv_subtree_drained_end(old_bs);
> +    }
> +
>       if (old_bs) {
>           /*
>            * Update permissions for old node. We're just taking a parent away, so
> @@ -3154,6 +3168,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>       Transaction *tran = tran_new();
>   
>       assert(qemu_in_main_thread());
> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>   
>       ret = bdrv_attach_child_common(child_bs, child_name, child_class,
>                                      child_role, perm, shared_perm, opaque,
> @@ -3168,6 +3183,7 @@ out:
>       tran_finalize(tran, ret);
>       /* child is unset on failure by bdrv_attach_child_common_abort() */
>       assert((ret < 0) == !child);
> +    bdrv_subtree_drained_end_unlocked(child_bs);
>   
>       bdrv_unref(child_bs);
>       return child;
> @@ -3197,6 +3213,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>   
>       assert(qemu_in_main_thread());
>   
> +    bdrv_subtree_drained_begin_unlocked(parent_bs);
> +    bdrv_subtree_drained_begin_unlocked(child_bs);
> +
>       ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
>                                      child_role, &child, tran, errp);
>       if (ret < 0) {
> @@ -3211,6 +3230,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>   out:
>       tran_finalize(tran, ret);
>       /* child is unset on failure by bdrv_attach_child_common_abort() */
> +    bdrv_subtree_drained_end_unlocked(child_bs);
> +    bdrv_subtree_drained_end_unlocked(parent_bs);
> +
>       assert((ret < 0) == !child);
>   
>       bdrv_unref(child_bs);
> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>   
>       assert(qemu_in_main_thread());
>   
> +    bdrv_subtree_drained_begin_unlocked(bs);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
> +    }
> +
>       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>       if (ret < 0) {
>           goto out;
> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>       ret = bdrv_refresh_perms(bs, errp);
>   out:
>       tran_finalize(tran, ret);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_end_unlocked(backing_hd);
> +    }
> +    bdrv_subtree_drained_end_unlocked(bs);
>   
>       return ret;
>   }
> @@ -5266,7 +5297,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>   
>       assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>       assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
> -    bdrv_drained_begin(from);
> +    bdrv_subtree_drained_begin_unlocked(from);
> +    bdrv_subtree_drained_begin_unlocked(to);
>   
>       /*
>        * Do the replacement without permission update.
> @@ -5298,7 +5330,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>   out:
>       tran_finalize(tran, ret);
>   
> -    bdrv_drained_end(from);
> +    bdrv_subtree_drained_end_unlocked(to);
> +    bdrv_subtree_drained_end_unlocked(from);
>       bdrv_unref(from);
>   
>       return ret;
> @@ -5345,6 +5378,9 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>   
>       assert(!bs_new->backing);
>   
> +    bdrv_subtree_drained_begin_unlocked(bs_new);
> +    bdrv_subtree_drained_begin_unlocked(bs_top);
> +
>       ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>                                      &child_of_bds, bdrv_backing_role(bs_new),
>                                      &bs_new->backing, tran, errp);
> @@ -5360,6 +5396,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>       ret = bdrv_refresh_perms(bs_new, errp);
>   out:
>       tran_finalize(tran, ret);
> +    bdrv_subtree_drained_end_unlocked(bs_top);
> +    bdrv_subtree_drained_end_unlocked(bs_new);
>   
>       bdrv_refresh_limits(bs_top, NULL, NULL);
>   
> @@ -5379,8 +5417,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>       assert(qemu_in_main_thread());
>   
>       bdrv_ref(old_bs);
> -    bdrv_drained_begin(old_bs);
> -    bdrv_drained_begin(new_bs);
> +    bdrv_subtree_drained_begin_unlocked(old_bs);
> +    bdrv_subtree_drained_begin_unlocked(new_bs);
>   
>       bdrv_replace_child_tran(&child, new_bs, tran, true);
>       /* @new_bs must have been non-NULL, so @child must not have been freed */
> @@ -5394,8 +5432,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>   
>       tran_finalize(tran, ret);
>   
> -    bdrv_drained_end(old_bs);
> -    bdrv_drained_end(new_bs);
> +    bdrv_subtree_drained_end_unlocked(new_bs);
> +    bdrv_subtree_drained_end_unlocked(old_bs);
>       bdrv_unref(old_bs);
>   
>       return ret;
> 

As we started to discuss in a thread started with my "[PATCH] block: bdrv_set_backing_hd(): use drained section", I think draining the whole subtree when we modify some parent-child relation is too much. In-flight requests in subtree don't touch these relations, so why to wait/stop them? Imagine two disks A and B with same backing file C. If we want to detach A from C, what is the reason to drain in-fligth read request of B in C?

Modifying children/parents lists should be protected somehow. Currently it's protected by aio-context lock.. If we drop it, we probably need some new mutex for it. Also, graph modification should be protected from each other, so that one graph modifiction is not started until another is in-flight, probably we need some global mutex for graph modification. But that's all not about drains.

Drains are about in-flight requests. And when we switch a child of node X, we should do it in drained section for X, as in-flight requests in X can touch its children. But another in-flight requests in subtree are safe and should not be awaited.


-- 
Best regards,
Vladimir

