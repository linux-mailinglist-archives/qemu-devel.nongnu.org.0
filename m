Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33A33C70B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:47:06 +0100 (CET)
Received: from localhost ([::1]:43956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtBB-0003Fi-Qh
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLt9x-0001uB-Io; Mon, 15 Mar 2021 15:45:50 -0400
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:46305 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLt9t-0002XB-9l; Mon, 15 Mar 2021 15:45:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7xUFOpY7oVtiyJh1cxg0uahs82z0IV1ga/oEPCgRwGxHf4fNwjngrVyw76SPMro5oMrDI9xZ2XCBM7oPprkShhGEVQ2H6IZaL4IxU0X7KBrbIa2rrZNP0GQr7K3FJv7EpAAI82PY5lA3Y9zoNmSWntUodVuQUwMmIvxrai6Tefkvk24gKdjeC4D9SPLC95owHgug2v6gQFrDTJVXKoP3xkOyXg3fSXc7BHWLVLWHsXchXRgQfNaMKnerpLp+ln14ieolavJf6el/1grZKks/12tmDdLS8VzWgFTEk/0+m1EvE6Rz8vkOJepx/Ih1D8Mz6bETNlCRZ78WAxf0F3R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9+vUKW/B0hkpKagTmaXZEpnNMrkJp8iD+22JuSm204=;
 b=ij/vAUTWg1Paot3mpmQuVVQd5Xl10WZ+dE12SD/f1KgYlFEedftALUwLR5gvi5LbEeEZzcvegJ1bhvK9WFwtdMW01LPf2LOt1BkLVbcp2Fq9IkJuFlxDQPHUpsrlj5mgOXLKZNILXv9FYv66iI1HDYOk+9CCSz6rof/4vMFX/An6pCW3Ws7o7LmLviJvyODITpDzVqElN8dJbPuc35T+gNKksgQIrvLrjVCuBfJY/yoYKZVq4rxQsyZS2pfzzBMi5nuRPtLI9ENzdcNORfbU434gsFQItg4z+G1RJA8aSzV144C2JlS7+msH4YMU6lk0RM4zkTlUUdUnIADyQoDkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9+vUKW/B0hkpKagTmaXZEpnNMrkJp8iD+22JuSm204=;
 b=FOduOtNHIC8YEl9WuGOURs+p8O32iMZmjI+zGHd00b/gAzEs+jgqgU3eAI+08D03j7BWvu6aao+jjnCLQZ4vntWlnpIyfTRBl7qefECWHfaEwiiuzK91pQGhE/v/gKvLxvkZh3zIIpKBo7VngwfJJ2M97TMo0Nbt693p3zQD1YM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 19:45:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 19:45:41 +0000
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2f261dca-d478-67e8-1cf2-49b5ed2f4356@virtuozzo.com>
Date: Mon, 15 Mar 2021 22:45:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:208:122::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 19:45:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fe584b6-17f4-4772-23be-08d8e7eaea1d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158844C868280CB3DE4219CC16C9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbNeln8mkuQumW6gvOBtJNgcCj0EjUcYjdog50MlI2xwKylde5qUZllcA367or23GmsVfDxJ/cBXdzbNS10dMJiOh7ViJQwgmwf4iPg2vM/himeQk4jxoE7XuDGFcorT6dMGT70YxE6UFhFKStPAcNPywkyiNUakBz1bq/FeV/U07bkmGhY8F5W4tE9St3ICVXz0vmSrM9b9wftN+kErS9SIJL+QFl07/Jtr+IC+/RF4yFDb2hiY76tN+//Nyd0w0yyUtWAm/mDNFQV+kDe6wj6mKzUBbf2tircmgU3aJQn91HwjzxRjceBqWRoaXdxVN8u5YX3fSyjHist5DZnn2bqCr54lxK4W7xO7PbVjS0s0wMIldfRx5XK9QFQGDBr1NLarrXf7koVr48zp+AIHPVhyP3quR1irCOyOs0KPHDoh5BIMWW9fgQ7nOYORz1FaJmq5cRnQ/33HvMZCJKWRAQOjz04phxxQrj41FBv9WXJlXDgV83a47kYlEtoT+usyXQtQ3CjrbS0aJY/A73hnstJfzSWrHIeff1kBeeKSBjsuaGJWBLn/28xGhQ7YhBP5/VXm4eWI6QvMJSX2LGuhvwlcIn0yeEqakczfOB4GMOpTUq9/S+3O2zFe/y1eEYqUxPnQ7/s2H/Dm0f9o7dxOZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(136003)(376002)(366004)(54906003)(6486002)(5660300002)(36756003)(31696002)(86362001)(83380400001)(31686004)(52116002)(2906002)(16576012)(186003)(8676002)(956004)(478600001)(16526019)(4326008)(2616005)(66476007)(316002)(26005)(8936002)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWJpcGRsMmI4NTJpUFhkRzZUWk52WUxtUFVaKzdoMGhZU3hhVFQ5U0tkNjUy?=
 =?utf-8?B?WFl2Y1pxTDlxN0NJclpDVGkzOFNBcjZGWFdKd2lXdlQ2YTZtSzRINEJ5a01K?=
 =?utf-8?B?KzdPU3ZKQzFML2tvTDlFRzRkZDJCbGFCS3hkNy9WOXVpbUF1QkxFQ2FwT3kw?=
 =?utf-8?B?bEpCUGZtRUM0RVZjMGIvUld1NFNpKzc4L3dWTWZ3VHJLb2NGTVFlNks5OHJm?=
 =?utf-8?B?N29aYlcwcWdGYTdITk1aTnpReXBrZktyMTd1Z3JFOHdCTWtweE1salF4Vmo0?=
 =?utf-8?B?NU1aZUhWMGRlaHZPeEZYcDMzSzdFeVppcVlIQW5sRE1XdE9sOENLOHlVdm14?=
 =?utf-8?B?NVVRRnhrWWxBWkMxQlB0YnBGbW1XR0xrM2ZJelZYSEtHYUR6UzU3bFMzUCtM?=
 =?utf-8?B?S1FBMGI4YkFYUlZzWS9xTC9xMDVtcUZXek1qUi9IMmpPU0hsYlpoR0FXU0or?=
 =?utf-8?B?R1lOZ2JyUC8xMnlBeGNTT2U4UDExTEdMRy9WWjVld1RldG5JeHQ5cTRGbkc4?=
 =?utf-8?B?NEszSWU1UjNxNmYvR254UXZjZytmQXZJUmMxaDNRMDdFNFRFK2xnbVpyNlQ2?=
 =?utf-8?B?elFoakM1QUZiVHRVSEVkRXV3VHdscVE5WTUrdm5hSlRsVVpxZWg1Y0hUZmFo?=
 =?utf-8?B?SDdWTlZmVlFQRVkxQW51WFhDOWJWcmtEcnB4cTZpT0krWGdTczVlRU9iTk1E?=
 =?utf-8?B?N2tVdGhoY0N4UEpNdlV2SW5SaGxBTDdVQkdTanZ1bzJlclRzeEN4OFRzUUJj?=
 =?utf-8?B?QXI4QVdkcm5BZk9WOEhEbjBvUXlIYXY1MHZXSGtVSDYza00wVDE1UkFqcjRr?=
 =?utf-8?B?TXpZNVVrYkNwWHUvMnAxai9RWFVJQURXZXlac2t4cTBFNVZQUnVnSDNhT3lP?=
 =?utf-8?B?a1phcWYrcTJEY2JSVlVTTHpmSmsrV1Q4V2NVdlNobDNVU2NYbGtzeGtkMFRT?=
 =?utf-8?B?c20wR0xmaDRMSk9PRGQ4dzlPMlVHR0s0YTVIM2VFZ0ZOV3E4RGxrcHhGYno5?=
 =?utf-8?B?RElEbUtQc1c3czdEZ29GQy9aQ0VMempOQkVIa00wSEF6cUVqb01YaUpuSE1j?=
 =?utf-8?B?c2NXZmJWcGZQU29pMUVab3kzaitZelhnK2tWVFQ1dXZORTNIZEpLOERiMVlU?=
 =?utf-8?B?UlBzSzFMVzVkcTRza2VjdFRvaWpxUWw4VXc2V1N3eTJKSkJRcXpoMkVQSWJQ?=
 =?utf-8?B?NXlUbTNzQUlnNkhlYlUxTFpHcTZXNGFpNDhLVE5BUGx5NjJxYkpJU0c1Mkhy?=
 =?utf-8?B?d0pHM3FiU3BQOFFOSlYrRWFJb0V2eXUwdUZ3K0N5Zzl4QlhoSGo5aFNqeFIr?=
 =?utf-8?B?RUN6MGx3THRvdk8zUnJ1QTFPekxkMmJZblNqN0Y0RXhUSFcrQ0dIVmhWa1J5?=
 =?utf-8?B?UGdSQ2VtY2oxakVSTXpqVFE5M214ZGhLZ05vQ3l6YTJGWHN6MzFRZFpyMCtS?=
 =?utf-8?B?cEFsTlhMNnNWRXB0ZG9vbXVxM1NBTlpQVGgzeHN0VGIwWXp4TVFIQmI1YWF1?=
 =?utf-8?B?cmJZV3RVMi9ld2JiSEJCbzBEQUV3MGlSUHVmSGQ3Q0NweGFSUWhyNWZMYmpO?=
 =?utf-8?B?b0s1RHBQSmQ5SGJCU2U4MnhGbWxaRTIzeXdlc1czL210S3lPT3FSY0s1RHN4?=
 =?utf-8?B?U0hLczlOZ1N6Q0JIbTIxdFAvUENyZ01DZ3k2c0NoK0ZWSEJOM3NhLzBLZFVk?=
 =?utf-8?B?VTBva0pMd0gwTVpyVFJnNStZZEMycWR5a3ZUbGVHVVB2L0ZXWkIwUmJZVjQv?=
 =?utf-8?Q?j0WD/5/OcleYTPSgckAQw71oPSUpnTTQra0F6Yh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe584b6-17f4-4772-23be-08d8e7eaea1d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 19:45:41.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7gcNeOnNvDBMYfR3z8rjApsuYC9NH+dr2jtgQx6XCvpGYQ1T0GfTtmlZ6rK3h+qRQJLx984fx4OA10Wb6697ytj7niW+/8KZNDKYDu10fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

15.03.2021 09:06, Roman Kagan wrote:
> The reconnection logic doesn't need to stop while in a drained section.
> Moreover it has to be active during the drained section, as the requests
> that were caught in-flight with the connection to the server broken can
> only usefully get drained if the connection is restored.  Otherwise such
> requests can only either stall resulting in a deadlock (before
> 8c517de24a), or be aborted defeating the purpose of the reconnection
> machinery (after 8c517de24a).
> 
> This series aims to just stop messing with the drained section in the
> reconnection code.
> 
> While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
> connection_co reentrance"); as I've missed the point of that commit I'd
> appreciate more scrutiny in this area.


The actual point is:

connection_co (together with all functions called from it) has a lot of yield points. And we can't just enter the coroutine in any of the when we want, as it may break some BH which is actually waited for in this yield point..

Still, we should care only about yield points possible during drained section, so we don't need to care about direct qemu_coroutine_yield() inside nbd_connection_entry().

Many things changed since 5ad81b4946.. So probably, now all the (possible during drained section) yield points in nbd_connection_entry support reentering. But some analysis of possible yield points should be done.

> 
> Roman Kagan (7):
>    block/nbd: avoid touching freed connect_thread
>    block/nbd: use uniformly nbd_client_connecting_wait
>    block/nbd: assert attach/detach runs in the proper context
>    block/nbd: transfer reconnection stuff across aio_context switch
>    block/nbd: better document a case in nbd_co_establish_connection
>    block/nbd: decouple reconnect from drain
>    block/nbd: stop manipulating in_flight counter
> 
>   block/nbd.c  | 191 +++++++++++++++++++++++----------------------------
>   nbd/client.c |   2 -
>   2 files changed, 86 insertions(+), 107 deletions(-)
> 


-- 
Best regards,
Vladimir

