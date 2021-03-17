Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9348233F595
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:32:33 +0100 (CET)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZ60-0006xv-8V
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMYG8-0000Pk-1Z; Wed, 17 Mar 2021 11:38:56 -0400
Received: from mail-eopbgr130128.outbound.protection.outlook.com
 ([40.107.13.128]:26678 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMYG2-0000op-9t; Wed, 17 Mar 2021 11:38:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1sjDWZ6gpm5ZO5hWuxCtNCxzroIJHU5rF7+vd7HA4wa3W0MqeDvZMxpkMw6+L9Wru7uOsYufsS190B9VfR7gDSsFe5wfHtlw/YEuFvTIT0J1x9hX6AJFlCE8nYlBsnpSQBd5qUkI2QYXJWClVEK8SY6hDpYOs0JEgv0puu2rFnUyEuOk5+FYPGphvrrIGBgLmNafRhjxqoaer+8Cea1pGi73k+VZ23yeGL2ehjc1FTBikRXfPp4DQrImJuuvkh/6KRY0DGU1igjYG0C2PedBfyYjZpO5+/eW8R02HWyoQADj8JR9KhukY+zEiQadlTehnfUFw2NCGv1ue77kdXWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI9GF0FVVad7gGh8zvThOUrOJPvz+VUyQn4WlFkQZm0=;
 b=moBrFz7wo3ucDXjwsAjcpJGX1UZzVC6qSZVqDdH3wUKiIenV7BvB7XqBuNxR6ZYutNlhFjAicnVqna/PMhzL1GEcpXVlxGGcTakAMaWgQeVkZ+u54sqGUcK8ATY2mF89FD1efZSd9Cq5W0wJBhuq5fPAjvWQHfUVzl22Q8i1XsCYTfga86pcWKHTVMKo20ctrZCajZ+kF+n5jhfPCAKrP1M22sEXzGlzJ/jVLdyP9KBV67SX8cZRdpb0Ksy+fSmdXV6fcuKlomDJl4ErEGNFURCS4dOYDhgjM2VOSQWkmReox/qiL31qVUPMgZ637xK5h5RSKR25MWoqfHUiMBoUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oI9GF0FVVad7gGh8zvThOUrOJPvz+VUyQn4WlFkQZm0=;
 b=NqZ9OxIG9y6VhOCFn44PXxpurHJlb9+2TE9wfCAH9qKMRSLv7ZZE/eWRJcH2Vfjw0Zg07P1NseS9F5jJ+VQOC//ww+Utaq6VPe0MZLiqlrJaaK5/YTwiuTPLuo7GRrWnyWJBhr8Qn4fjycntBvEeIndVY9BrMtm5w7VuXcfJF4U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 15:38:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 15:38:45 +0000
Subject: Re: [PATCH v3 00/36] block: update graph permissions update
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <161599451628.29996.16299734673859684875@c9d4d6fbb2f1>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dba437c7-dea7-5675-9b88-b72ecca561ee@virtuozzo.com>
Date: Wed, 17 Mar 2021 18:38:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <161599451628.29996.16299734673859684875@c9d4d6fbb2f1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR05CA0123.eurprd05.prod.outlook.com
 (2603:10a6:207:2::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR05CA0123.eurprd05.prod.outlook.com (2603:10a6:207:2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 15:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 783332f4-1c24-4942-d33b-08d8e95ac011
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165968B03C35F4B76F283E1C16A9@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2DbLwwNWjqAjTqWTuq/QCs/keiJatTPzk4c4bmC+FaMJbTS1Umjqq7XWiF8+4I5zsRPmoTguXd/YL3sSNxY58wWxZthGPxtT511SBK5XVY56ohp3CdjEXjlKaV0V79IcJp4ZIB2cUzs3RCSbll2RSPI7idzbYCjbR1wUjejIBHuZnMz3DtF/4qD0RE0lRqXbIy/j8Sbs/mzKUIoCfAXuSgpsAWRPv4QDRbS4iLEBEhswz/YEit488hSyP2gAM1EQaFZg1pLv6ydre9wwIZhOkcUNMVj6gVuH4faLRh+N4mPerAM1G3ebqs48Q1QWi4FVGa8Pg6yhIdkhVSiheL8LyfqmLI181Vb520PBZeVb1LibeYbKMaAmS+H3RzM30blr019Q8WACfpBbMoYLgHfGHFfRfdX1KCcZBu3pRP4ON1Evh9E4DN+uoI5SORGGXkJHO4d8vA1N86YH48/hrqh2Ry9ucU0plTQYy+K3TEcswJ7C4fpuAjACZ4c2JvIxy/I43qyGwnAxOmbVdyuQ8tHX6ZGkCSsvhsJ81n9zq3+Lre2qYBPxQr/cDR+qd5ZT9mEb2q5Z3x29UZKW4V7bqG97YrF2rD+CPdAPd7HAAOMI8wTM7JT2JXp7P1xoiaFvcXnXhSYCAFvpvZIuMyn0YHZFS6uu/30PhREau5r+atixKjXuy17/TeBZuLfn0Mdb3RH6r1+Wx84xdnqRCwcp5x/P+UzKwOIojNIpdbCk9Dw1BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(6916009)(8676002)(316002)(6486002)(956004)(15650500001)(16576012)(4326008)(186003)(66556008)(66946007)(31696002)(16526019)(478600001)(83380400001)(31686004)(8936002)(52116002)(36756003)(5660300002)(66476007)(966005)(86362001)(2616005)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDl0cTkzMnBMb0l4RUZmSVZraHZrVE9sZU0zWE1zSXo0c0d2UHpUYndKUEFH?=
 =?utf-8?B?a3V0YnNjRjEvQjZCcXFtck40TmdtL0xqK1Buby9pcG9HRUNEdnA0MjQrUHhH?=
 =?utf-8?B?Zlo1YlVzaUMxQVlQYVlhNXpGdTBKUkRFWGRkM1p2dWFVYmpTak14aTQ1Njln?=
 =?utf-8?B?aERvdzZoMjN0b1hpQTFYWWtoem4ySWVVKzFpNGp0TjRZSjJZeDNWTFk1RExy?=
 =?utf-8?B?WkVQUjVHMFZBalhmc0FJd0tWc1cxTWdONFJnOU9BWFBiZ1RRZGdtUlQ3TGtI?=
 =?utf-8?B?M2laNDNoVDJFU3RDeU5rck1ZeDdpNCtUSHdNSkMxK0hBNDRZRGpUL21XdGc1?=
 =?utf-8?B?UkVqbkE4NldhZGRWRmZyY0wxK1ZITG5uWWJpcENyN3JUejZuamVEalNZQWJV?=
 =?utf-8?B?K3ptenRMOHRqZ0Y3eU9tZ3ZiTzdxWjN6aUJGSVR2bnEzaWxITTlNQTNjdzBE?=
 =?utf-8?B?bzArODNkV0hxK0lyaUVtME52ZmlvR0UxckIwRjBZOVQveE1JOXZJMEcxSi9s?=
 =?utf-8?B?aGx1dUFibDhNMjUxRFE1dVhicTlra21hWHVXYnM2OEg2RVc5aVZvWi9VUEg4?=
 =?utf-8?B?NmF0bCs1QkNVSjg5cEVtb3RUSVdWa3hRanV3QmFaS2VZdlcwVnNCNTBVWm5L?=
 =?utf-8?B?dDZ4TjgwemtWU3h5c3dPTm8yYWNlREFjd21IclAwODZZTVA3YmVzKytWRWpm?=
 =?utf-8?B?V1Fsc3VET1U3MDBvdkM0OVA4S3BXV2l6c25OYjRZS0I1NUJNdGovS0EwSVQ1?=
 =?utf-8?B?enJCSndBTVQxbmlrM3IwNldra1dDQ1hobEUrOUJjd2ErdjEvN3ZjbmhEQ3hT?=
 =?utf-8?B?NktKSWkxSGhTdHZzbks5ME54d0dSQUdlYWRid2dFYjR4MURFcnRKV0tSQlFK?=
 =?utf-8?B?UnMwb1JRVlVjd1VXdjN1OEdQbW5RU2FlNTVQcHAwcmw5NXBJSFZ0aEUzRnMw?=
 =?utf-8?B?TmRPRGFsd3NUVXJ4U3BTYm50eTVJZll5YW9oQ1p5QUZFOEgyMjczUUlPRDgw?=
 =?utf-8?B?Zy81Z2JhaWxHdVhUdHlLb0lMNHNRQ0hPTk94d3FhdnRRZkJoVCtjWi9mc3FL?=
 =?utf-8?B?amU3VVFsdjZyUngwNmc2QU9uK05JcloxODIxdkZaeWZoV3dCeGluSTJCVnNP?=
 =?utf-8?B?YklXTG8rMnZZTCtvKzREM2xDTUxtM3dkMzZOcEVNUTZxbUxkWG9sc2t0VHVp?=
 =?utf-8?B?ckhQelpkUVVvUW0zMmlvQXlFT1p0Z3l1Zk5vMCtxRTFUM3VzbDJpL0NIUCtr?=
 =?utf-8?B?eVgxa1pkbHdsc2JmdThjOXRITFZSeUtiK0tZaEJ1SkNOZ2FoWnR5ZnJXbnFF?=
 =?utf-8?B?dFgvbkxBYXVjR3pQeG05ZGhtRFVDeDIzMFdGVTQ4RldDMDdIVHVWaWZzSE8w?=
 =?utf-8?B?OUFjYUdBSlh3VWt3emw5cURrVmlnR0UyWThJd2w5UFc3VXBNc1ZoOE9GTEFG?=
 =?utf-8?B?SmRxYWY3UENUOEY5Q1hqeWgyWGNldm0wMjJnL0E5eW93VTdCS2ZaNUx1QW5h?=
 =?utf-8?B?WVFFYy9adFM0cGJKU2J5clFwUVVEQkFQTVFTdHluVlh3QWJNZlgzUmx1alZO?=
 =?utf-8?B?Zkx1TUN1MEJjdjNkMDk0Vm9PUTJkTDIzSDlYVSsrMHkwNmNtbG02VlgrODk1?=
 =?utf-8?B?VjAzVjIvM1FvRFJxVGtTa3kzSVdwZzRmWnVOM3ZlR00yOE0zOVpaMC9seHBu?=
 =?utf-8?B?S1R3cUlpTXUvVk12RzkzMDVRbS9YdDM1bFBIaEpPZGdmQnhubjkvVlYrbW1T?=
 =?utf-8?Q?GuOOTlqhdo/vHnmTJkTxGbrm14cU9XEu07ybHAU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783332f4-1c24-4942-d33b-08d8e95ac011
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:38:45.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4pKxzyK7J4m6vAyXBlUZBZZIuRDWitVWcZpuaVVAARpoNrdwYetw7ZpwaFILm1fkIokVqtsoAWecpXr7c9nBJoy95Dr+A940fP9JLWH7CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.13.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

17.03.2021 18:21, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210317143529.615584-1-vsementsov@virtuozzo.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210317143529.615584-1-vsementsov@virtuozzo.com
> Subject: [PATCH v3 00/36] block: update graph permissions update
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>   * [new tag]         patchew/20210317143529.615584-1-vsementsov@virtuozzo.com -> patchew/20210317143529.615584-1-vsementsov@virtuozzo.com
> Switched to a new branch 'test'
> ac26c21 block: refactor bdrv_node_check_perm()
> 7171293 block: rename bdrv_replace_child_safe() to bdrv_replace_child()
> 9430fba block: refactor bdrv_child_set_perm_safe() transaction action
> 2386ee1 block: inline bdrv_replace_child()
> 41c9fc1 block: inline bdrv_check_perm_common()
> 0d06ade block: drop unused permission update functions
> 72e8fe6 block: bdrv_reopen_multiple: refresh permissions on updated graph
> b7f3a63 block: bdrv_reopen_multiple(): move bdrv_flush to separate pre-prepare
> b9278b8 block: add bdrv_set_backing_noperm() transaction action
> 44f6e69 block: make bdrv_refresh_limits() to be a transaction action
> a671d58 block: make bdrv_unset_inherits_from to be a transaction action
> aa9e316 block: drop ignore_children for permission update functions
> 6e17bb7 block/backup-top: drop .active
> 7292e37 block: introduce bdrv_drop_filter()
> 9e7ce4f block: add bdrv_remove_filter_or_cow transaction action
> a5f3a81 block: adapt bdrv_append() for inserting filters
> ba82bea block: split out bdrv_replace_node_noperm()
> 4c97817 block: add bdrv_attach_child_noperm() transaction action
> 4a4e038 block: add bdrv_attach_child_common() transaction action
> a864516 block: fix bdrv_replace_node_common
> ce2b5ee block: add bdrv_replace_child_safe() transaction action
> 0b5ce80 block: add bdrv_list_* permission update functions
> 5380bbb block: add bdrv_drv_set_perm transaction action
> 965e80a block: use topological sort for permission update
> 35d94b7 block: inline bdrv_child_*() permission functions calls
> 84f3087 block: rewrite bdrv_child_try_set_perm() using bdrv_refresh_perms()
> 9eb28b7 block: refactor bdrv_child* permission functions
> 0c068cb block: bdrv_refresh_perms: check for parents permissions conflict
> 23d55e7 util: add transactions.c
> 68189c0 block: make bdrv_reopen_{prepare, commit, abort} private
> 5780b80 block: drop ctx argument from bdrv_root_attach_child
> 34f4c11 block: BdrvChildClass: add .get_parent_aio_context handler
> e79d608 block: bdrv_append(): don't consume reference
> 87c292c tests/test-bdrv-graph-mod: add test_append_greedy_filter
> 381fa0c tests/test-bdrv-graph-mod: add test_parallel_perm_update
> 6df2206 tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
> 
> === OUTPUT BEGIN ===
> 1/36 Checking commit 6df2206946ee (tests/test-bdrv-graph-mod: add test_parallel_exclusive_write)
> 2/36 Checking commit 381fa0c5db90 (tests/test-bdrv-graph-mod: add test_parallel_perm_update)
> 3/36 Checking commit 87c292ca6696 (tests/test-bdrv-graph-mod: add test_append_greedy_filter)
> 4/36 Checking commit e79d608e8fad (block: bdrv_append(): don't consume reference)
> 5/36 Checking commit 34f4c11ddd7e (block: BdrvChildClass: add .get_parent_aio_context handler)
> 6/36 Checking commit 5780b805277e (block: drop ctx argument from bdrv_root_attach_child)
> 7/36 Checking commit 68189c099a3a (block: make bdrv_reopen_{prepare, commit, abort} private)
> ERROR: Author email address is mangled by the mailing list
> #2:
> Author: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>
> 

Who know what is it? Commit message, subject and "From:" header are clean in the email..


-- 
Best regards,
Vladimir

