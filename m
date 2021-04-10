Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B465035ABCA
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 10:08:09 +0200 (CEST)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV8f2-0006em-9U
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 04:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV8db-0006AT-RD; Sat, 10 Apr 2021 04:06:39 -0400
Received: from mail-eopbgr00112.outbound.protection.outlook.com
 ([40.107.0.112]:17806 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lV8dY-0003g1-Cz; Sat, 10 Apr 2021 04:06:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRfs56XRlGwqtp1nSMexxoc+svPzabDsgLIUqQZU5zvpoNJEySycR+4jRC8wniP+PFP7aygRQBAHdvvpHasSFPFluaHL+LqXQ8PTdYLq+A4aMeMwzR9Tz/yNoT1luFAPKn4mPrLPIoLFxRDQ6K6D3xG8u1FWi4xaDEQub1h6L9QHOGQz/nw+pmKK1ioDK7pkatt+6YqY4JEiWC+5goHj1d5k1SoC1VmXCPOsNChL8tJuHfADtHuD7dJZKkeoERMB6THcpePdg3kBytwk7cuRdef1srymdViS4bnctk6Cp6qGCGh4zuZ+X1Wl/pcWsmHX5HZLhEXvaoY2JjmrEA5Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FExCC7o5uH1JYjA6iQTNsGeRARTdl9f/rG06RvEHUY=;
 b=MZPe69Gq7BsZIL6mem9i0KdV8+rX6pjFlMJvcWdsRycdG7LgWrDaRrAMlyE6aqiXNu/ja6P35jad0BxMFyMhfe1uA5/636fIWlQTfkAidyXeavuYUunkJdgkMYzAOT8fBGzBEQhugHZ812ZxrJ7n6v65QMp+APrIpTvYC0yVHUGI8CSeq8CcXPgfMTyQqm0yx6vI/kGavH7AFOR7kSN38MG+gNih8W8S9IPzEtMY4LZGuKizyahH8nY+aNI7Wq+ND8CbNUJByTgUUn8cerB04jv7L5EVZ3u24i7qGP2A7+RFRafSfJMBCkadpt3WJ1GirApGXFP72XpMdbX+99UusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FExCC7o5uH1JYjA6iQTNsGeRARTdl9f/rG06RvEHUY=;
 b=tHjzJoIdRDwe3Hc47HMa48jJt5sTx8JNG0mX2edxZS6a3Rnvi7V35wmpW5ag/rWbtIZwVhytf41m+6k6ts3B/ukCXt2lBtdXOImZFnAhNAeUEO030xaZPrQsckoNPieUzRma0azm8NULMNZ1q8l+S4xO7IEchhMvsFjATb9uJ1s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Sat, 10 Apr
 2021 08:06:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Sat, 10 Apr 2021
 08:06:32 +0000
Subject: Re: [PATCH for-6.0 2/2] block/nbd: ensure ->connection_thread is
 always valid
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>
References: <20210409160406.1800272-1-rvkagan@yandex-team.ru>
 <20210409160406.1800272-3-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fa2034b1-137e-017a-90df-6d5014b85a72@virtuozzo.com>
Date: Sat, 10 Apr 2021 11:06:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210409160406.1800272-3-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.198]
X-ClientProxiedBy: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.198) by
 PR1PR01CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:102::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Sat, 10 Apr 2021 08:06:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8bb9a96-0624-4407-c6f8-08d8fbf78d90
X-MS-TrafficTypeDiagnostic: AS8PR08MB7011:
X-Microsoft-Antispam-PRVS: <AS8PR08MB701154BD5F8EE4428C1B93F9C1729@AS8PR08MB7011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/h8jHYmW8THLayI0SXyganTmVyWykKGrPZy4Ei/chgpg/j+o27TG4bZNUc2sZVaaIYXOay4/DG2IEyhSrdvCn0WVKIdfeFwLB4iN8C6mYuFEOz8k9aaByWwHYWTU4ffZ6YT3oY1hD+6+Avvpf/hTN4cwyNiPrkhuO15T2YIKOk8q9x106vibI5h4bfV2Bo1aJD+not8HXQcPoOaBsq0Gif8Y86wzJVDEzp1f0V4xIOTTagvvop3mymf9EjfkNZOLGQeZdr90l5UTnbxR0nXKMqDpNxTpS79m1CrUIMXaaBLzfsubJwyi+lIaym+1KqzHyU+fkqMd81igHG1+Zz8HxIV3jNMaLdfx7a2/Hg1UqAEJmhzuehWurA1hR3tRZyyQjqzoVPAT8bstmnM7k2ZaUAz3G1aH32ZPtbRA6YHmj5pjkqB8VnsHiWCz6YC4AVZxxKihHHxyoMC0jysNTA5mAY8JQOOZF+oj83sdPNhNjiSJALvcPXi3/8syoWl5bRy4Bvi+/AZ/Q4q0GLuCkye0eEtX11a+p+6q+ejUTQnFXpoFx4CDW6P+uDPnvKDN9BjfPdWpR94Esyq0aSVSpqOnHb6QICrIuCpdbIE+jeaqYjRnLmQX60a7Ls6exb43wP3EaHLbpVdQ8ib9tw1Dr8Liv46uTBu5H5HnLvGy3eTmrzPYDavKg1zCJ9VcKCRgE8/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39830400003)(136003)(396003)(66556008)(5660300002)(2906002)(86362001)(66946007)(66476007)(31696002)(478600001)(4744005)(8936002)(4326008)(36756003)(26005)(8676002)(16576012)(316002)(54906003)(31686004)(2616005)(956004)(16526019)(38350700002)(6486002)(186003)(52116002)(38100700002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3lZSVBmbGhSWVNvZ0hiTFA2UXkralpaUEFZYXAwOHZhMjhhV0VzWXM0eU5N?=
 =?utf-8?B?TXVEUkRXdnVweXk0VzA0ZitjYUI4WXhSbG9WZ1NmZDkrUTN2b0dSYmsxRzNM?=
 =?utf-8?B?M0hHVDNmUUtBNTRNNktVTzNpV1lkUXY0V1lWYmgxbGtuODJTajAySm1CNXNl?=
 =?utf-8?B?NWV0MDkyNnRxWGVQN2pSOWdiRWRDVlFwMEd1QVVaSEdFTk1nSWpqa0s2S0VF?=
 =?utf-8?B?dFFsRHk3aXdacEMvdmo0YXNzZUFZaGwzeUxkUFBQdlJzN1pFUmdGOFdzOHdW?=
 =?utf-8?B?bE1vdXJpVG1zcWdKZWlUTng4d3hvVE1rQlJ0d2w5d21teC8wTEZUd0VyOW5V?=
 =?utf-8?B?WmZYRHRZdGFhcVBYY3JSOGxDVmZOSG1udzVod1FEOW9sa3pObU5vV1FNbjJj?=
 =?utf-8?B?d0NNeU9vemFRY0s1empJK283djdOOThScTZJdnJrbzJiTFh5bVV3ekl2TFhS?=
 =?utf-8?B?Ry91YzBTeEdqeEZldklaa0JJaytKR1BEQkorcnlNaUY2V3loczNWWVNpVmZl?=
 =?utf-8?B?ZnRmWTRBWERQZldJamVnZDNNaURGaGE5bVhRUmU2UHNQMW05ekE2TnptemxT?=
 =?utf-8?B?MGVkMElmSmppNnRvTnVabnFIeG9hSStOU0RCVTM4ZGJCbXNWejBxL29GTGN2?=
 =?utf-8?B?SWJVS0JHdER6UnZGMkxocmVlWEowNUp4SlcrcG14dStWSzY2OXJJSXFUR21u?=
 =?utf-8?B?R05kS0kvWWNnVzR3dHVUOVF3NFNhQjVJT0xjbEdnd2tqa3FJWm1Nb2hmSlZP?=
 =?utf-8?B?YWNrK01pNVhWMUlxQytUbjRZcCtSRnJIbGlzZWFaWkxVYkh5cncvdVd5bUpF?=
 =?utf-8?B?QThYQlc1VW44d1F3ZVlIRE5lWSs1bFpORTdJbmtqU2g4Vmk4dng1UnZTbXFp?=
 =?utf-8?B?OExNOUxwTThUOW1OWG9yaC8zWURGL3R4Y1BWOVZXQnlxdXdienlVQ04yeEVH?=
 =?utf-8?B?K2tkOUZONjEwblVrVVpRazNja2pBNjBVbUV2ZFBjUVVvL3RwNkFEL2VaSnFo?=
 =?utf-8?B?KzRwZ1pNSmN2djZjVDREdU5qYm5FaDM4TWRGL1pBVWhzSGF0ZmVtb3dDb2ZW?=
 =?utf-8?B?cVorU21HK1ppeFBoalVOUW1IK3NyM1lxbXI4YkllVExNamRFaE1Kc2U5R0dS?=
 =?utf-8?B?YW9RTEwxNHptME9hRnBNcHZLNjlDZWg4aEV5K1hyNDhubEczWm1Lb1JqWlRV?=
 =?utf-8?B?dkRGdEpkYlBUNjF0ZFRBYmRNOWF0YW1Yb0ZPL3ZTNU5kVnpPcXZtdk1tc3dS?=
 =?utf-8?B?aDhpTGp3ZUpPR1NmY25HbTg5allPdWd2RWJ1a0J5MCt6NkhiV3kvd3Z3Z2pa?=
 =?utf-8?B?Y25Vb1pXR0UvTFBQK0d6MExhWEVIdldiTU80eDlCeUl4SWZzMDh0NFg0bFJZ?=
 =?utf-8?B?NGF0eHJaWmxWdEdEbDZDSXA1QUNORHprcHRHRHU0U2o2YzFtZTNvUHAwYzFj?=
 =?utf-8?B?aFJ6VTlBTCs0NmVkZGd5L1luUk1WWFBWL1UxZmQvTW82SmFGVmd1dnVpLzh5?=
 =?utf-8?B?ZHZUUThQbStXMGxpVVRSUDRSTGRQV016ak1vektMa05lc3RCc3JrSE11THhh?=
 =?utf-8?B?WjJJUmZ0WEVVOVpMV21vUXZYQjhXQ1lVNWhtNEpzWWZkQkZHYjh6NkxuNEZ5?=
 =?utf-8?B?M2JVVE1GTFhzR2NoSWVkcFBya2swSTRTVnE5eDZGSTVGQ3lacWFSN3NFZnVM?=
 =?utf-8?B?aWZSOWhoUEovejFQSXJMVWQ0TjZqQ3d4RTV0cTRWRWdxaWdKaGVBazM5RGMr?=
 =?utf-8?Q?GkNTMCjYk2okd/hEJtuEek+XlLw8jLVopf0Ma/x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bb9a96-0624-4407-c6f8-08d8fbf78d90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2021 08:06:32.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX+cB/vl0xtC+NuvYb5Lhk9W648gmg8cQMDvAM9NVqGjQZBW4KczsYBK0OXGUPH6sl09GAkugOfRsb7WREHmnv88QXPP/gzOWbsHPgJGMhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7011
Received-SPF: pass client-ip=40.107.0.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

09.04.2021 19:04, Roman Kagan wrote:
> Simplify lifetime management of BDRVNBDState->connection_thread by
> delaying the possible cleanup of it until the BDRVNBDState itself goes
> away.
> 
> This also fixes possible use-after-free in nbd_co_establish_connection
> when it races with nbd_co_establish_connection_cancel.
> 
> Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

