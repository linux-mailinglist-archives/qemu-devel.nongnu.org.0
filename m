Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CA2EFEDD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 10:59:44 +0100 (CET)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyB27-0003O6-Kj
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 04:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyB1M-0002yj-9e
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 04:58:56 -0500
Received: from mail-eopbgr80113.outbound.protection.outlook.com
 ([40.107.8.113]:46848 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyB1K-00045f-KI
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 04:58:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oabW1JVca9oKAFeAKpbqxH0vglI2vijuMWOtdoY2xIQafT3FXagwhKLHIu66O+CmoPPodhaKe/TSExNx92EiNdC+z302ST1xocbzbIaJaLaRMXZ1TsqtT4bUdkv+mEN+zWCMPcXkv1oOj8HamhQ7JAXZKZQceQRNC2rWM1vzoQvTDxlK3Iru77cCxdmQ93bwC/Y8rHFlQuGXy3m83XzgEhyLAiiN1PY4TaFZhUCBoCEcNzlrQCvRGmN2O0RJUSDKvl0M96hayHXurEryEM+jY5rOyxcsyL9ySj0c1xPpaMdQvSv3gjaLOA4G3RjZimrrb/XudKfB+Kv0qmYQlw5SVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZaeAABiG2Plw0Glu99gJhg4MlHGwWJ74nKDr+unFOk=;
 b=MQD884sbJ/YXMWs2uZDGWyHPOE6+eeDjH7Xq1sLnS4OslOTXNq+NZK2m1sWwwk0u3QFqQyPwRrRwtz+2dSY531awePlHzXOTsrSQV4hdEI++OKN+ABW1jKqGTqo9RcbL4G9vgZH3DV8tC0WmesahUHKazzhF2nPSmsFWydx+EZfVBeB/IQ3PhzVQTlVmL73jAWPKgsUrnqduIM8dhievlNP3cfSlTiaaN6pWpZZjCqr/S5E5g4MicezbqBncrXKlS0+MdQH2k0ByaJhx6R+7lsUG3Eawdg+VNbLNKLqvILNrIgJf6fzokFjPTVXMDcsbwnue55s1fLRBSHT0lFUTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZaeAABiG2Plw0Glu99gJhg4MlHGwWJ74nKDr+unFOk=;
 b=jBUJtNHTPvQO5X94l03wCmfn8EBQMYIplFNUAkoz8XZjj/Uaa0HAfGLwSkkkMzHdPF9/gMcf7PDwrm86YFCbFrYIqA542V6npwHXGaHPZGwTkI6lvk7xnRkkXbabNk7hdkZNfkh3Z+HBIiQwk+zZaxc2ikFoxYoTJrsuJYA0cjs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4597.eurprd08.prod.outlook.com (2603:10a6:20b:90::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Sat, 9 Jan
 2021 09:58:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 09:58:51 +0000
Subject: Re: [PATCH 0/5] net/tap: some fixes and refactorings
To: qemu-devel@nongnu.org
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9eecacb8-cef9-73d7-ff63-a52b04539ebc@virtuozzo.com>
Date: Sat, 9 Jan 2021 12:58:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 09:58:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a41889b-a6d2-409b-ea31-08d8b4852acd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4597:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4597C0AB9BA3938C2E03EC71C1AD0@AM6PR08MB4597.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5q+qfsBqK2IYg89wJ4OlafxVwHkdvjKY2QuE7CIOnhIZzMuEBXQB0+TOblHdv9E62iDyd4SuuAONLbM7ucsWD6q21lTtHMRjqXoubgFDehF16CQqJWO09XRzx9kP5B9T+ZhExDAeQWv1ghydt1DWBMHLNw9YsNImY+gMyvfko23u+l65IRq+HPR6C0EOhmL3q4oHe6iyNawlcUBQw5cLuB+5lnCFYnuy/wtOWu0a5nFTDwQp2QZekXIaYeJ28eABmC9Dn+ELxZ4+PlL9AYsdf9Km373WrFRI7i0i9Zl6Jhg1yG43GIiY7L1HcPj3O3go0b4kJUYFsQ1Gqryud4Dny+rWj5NhDwwCbfTNrIFaB2T499tE+qBmcEvBtiZgftsUy9hcEaoqwtPp3cI6emwABuycQzNbtUb/TRgECXXKlh9R6R9rjdw3Y/uaJK9ybHD5Gx5g4HiWMbHDEZAVaygzhtQodVN+5GE9yGivFlQuj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(8936002)(5660300002)(36756003)(52116002)(16576012)(6916009)(31686004)(8676002)(31696002)(316002)(4744005)(86362001)(66476007)(107886003)(478600001)(2906002)(4326008)(66556008)(956004)(186003)(26005)(2616005)(83380400001)(66946007)(16526019)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmdxb1VnMHVTcVBBOGVQSWZrZnhaVC9rQWJNVWUzL0VRWHFLKzJUVGpOL2Fu?=
 =?utf-8?B?WStScGllN0FEbVBjakRPWmd4aUJRbkd6bU1IblROeEo3MXdxckhUeTVMYzA1?=
 =?utf-8?B?eUpZTnNjNVlTcUZFdE1jcTNreWxoamxTYXlLRlBDQWFpMmQ2ZEF5TE9jRkwv?=
 =?utf-8?B?c0R0M1J5cHBZa245aHh3LytCcllnSWw5UXpUOGdqZXZQUVdVeFZUa2dyNTR5?=
 =?utf-8?B?T3FJeDh5UDdkSTVJS3JScmxieGl4U05SL0dSNkJ6bXdkZld4VXJPalp2WWRI?=
 =?utf-8?B?eGp4K3NLU3BYZ2hpR1lMdS9HZkd4SWt4UnE3UUdUMEluUWFhZXBzZjhobUs1?=
 =?utf-8?B?cm1NdUE3UHhrVnJ1azNvcHlQL1c4Q1FneGJBYkQ2ZE4veDZ6ZUUxVkQyZG0r?=
 =?utf-8?B?ZGRlUmVKNkdlaFVQa0Z6SEROWjBHaytCUjlKcDg5OU9aNHdMMVprTnM2Zk1C?=
 =?utf-8?B?Q1B3eXArV0lTemREaDJTc2hEMmpiVm9QT3FvQ3FaRVJtbmQraXV3czNPalNX?=
 =?utf-8?B?dHhYVS9oU2xtK3JTRkgwdHljS0NsSURFRFp2cVdRM2REc2xvd2t3S0UvdjZr?=
 =?utf-8?B?d0JLa1RuT1VlR01GK01EdGNDeUNrRGI0ck1UWVRsbjZzNWNWZEpsNjlINlFD?=
 =?utf-8?B?SDdwV3AwTTd6R2l1WnNBSTJMTDhaZ3NZdExKWm5rOFB5TVlHeDVQTmVxak9u?=
 =?utf-8?B?bmFDOE9TL1ZTK1dOS1JQczlEVmpDTGF5UzdkL0ZCWFlLRVNWMFhRMzhZaTdJ?=
 =?utf-8?B?WUxhcWRUeGRzREJjamZzSHJQK0pWeDl2QzRKZHhLeTRSMHRTdzBBZzF4MXlK?=
 =?utf-8?B?a25raDRkeHFoMTNqT0FpdGpCNWN1OWJBSDB1Ulg5bmNJeHFJTWUrY2J6VlpO?=
 =?utf-8?B?dDRLUlN0MlV6QWVNQ3JJYUZOY2liRGU2cGJzRGJMUEQveC9DOEhyT1RZZG9T?=
 =?utf-8?B?MkpvSlN1NE9wSDQvNVZrMC9zY21aajdUbkE1cStTN1VINE1ROFcybnVnNlZp?=
 =?utf-8?B?cHBTeHZSUzJ3TVNyQU1hUEQwTmdNNmpIZldXVmtCSkwwUjgraEpDRGxDMnJZ?=
 =?utf-8?B?d01LKzRYdXpJR2g2elU5MnMxY1MydVpNU2g0QWh3LzNLU0ZHVkNvQlJQZ3RY?=
 =?utf-8?B?STFRMEc4R29IcGFZeGNCcjYyMUtKWmFmenlMS2VEcjVmSVVTSGRRVEJHMGI3?=
 =?utf-8?B?eGN2SUpyL2dGYkN2U3JNUzVmMHh1aVl4K0UzTTMzS2hRY2RqdTZZRWwwYmJC?=
 =?utf-8?B?ekJYWjBGcVNKRnVIa3ZJSm01QkpqclFHU0JBNUFuRzk0WUJEbmt1QUNtbGp3?=
 =?utf-8?Q?Jjaj3W09CE15FfuOSkmFpq9KSgSEDhf2ew?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 09:58:51.4344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a41889b-a6d2-409b-ea31-08d8b4852acd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTO0yiTea2TU4Ck9wgHCoKoHkdF27eIDSZjhBxyk6B1V2Op2JSxMwSHpyYWkcGcfJ2k4WnuX4+OKEQqSoCXn5rgHo45HKWAt+jmJ+r53bUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4597
Received-SPF: pass client-ip=40.107.8.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: den@openvz.org, jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping :)

21.12.2020 22:06, Vladimir Sementsov-Ogievskiy wrote:
> Hi all. I have a work in progress around net/tap (and not sure, will
> it be done or we go another way), but some fixes and good refactoring
> I'd like to post anyway:
> 
> Vladimir Sementsov-Ogievskiy (5):
>    net/tap: fix net_init_tap(): set ret on failure path
>    net/tap: drop duplicated tap stubs
>    net/tap: tap_set_sndbuf(): return status
>    net/tap: refactor and improve net_init_tap_one()
>    net/tap: net_init_tap_one(): fix net-client leak on failure path
> 
>   include/net/vhost_net.h |   3 -
>   net/tap_int.h           |   2 +-
>   net/tap-bsd.c           |  53 ------------------
>   net/tap-linux.c         |   5 +-
>   net/tap-open-stub.c     |  34 ++++++++++++
>   net/tap-solaris.c       |  53 ------------------
>   net/tap-stub.c          |   9 +--
>   net/tap.c               | 119 ++++++++++++++++++++++------------------
>   net/meson.build         |   3 +
>   9 files changed, 108 insertions(+), 173 deletions(-)
>   create mode 100644 net/tap-open-stub.c
> 


-- 
Best regards,
Vladimir

