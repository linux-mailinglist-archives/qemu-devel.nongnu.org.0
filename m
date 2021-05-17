Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E64382C82
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:46:57 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lice8-0005SC-PN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liccM-0003aC-7a; Mon, 17 May 2021 08:45:06 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:45984 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liccH-0006id-2R; Mon, 17 May 2021 08:45:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyCSLTWh9pyEJ1aHfIf1xwDbRDvSwG80zpKlE3sVpE/NRCAAmqnNXnFXilvPF2bYs1dd2jcg+rUpXkyVeXtLLDIhX+uqGe2ZY/Aad8z7FOj9gn2uZYtwRGB46wToYxEmovnZRjBgocHC9tNHVCpzvngT3V9GBmm6CHhUF0ciOwU6jj80cku6BANnlFHmqjlRPKxAyJazOb3HwrtzkVyhPWE6ago1UKLOEsXI2v2o6+RQPlFTCffUQOVfqzHX0eolwWpHb111oUPHmfLwN+JKAiRNKtwF87GM1gc2ySlerzPUmyDdmdpVO/pQd4Epy7SDEoz5skyVw00/YUa9+tZ9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy28E3OvTCMvFiIRleK8o2FBt6p5J2/NLo7dkY9HSOI=;
 b=LrdhnLnJ91tuthHkoz/FMvwaeJvp62PqRlwm6h2LrJYB0DQIMUQ4IOiH0kEcCVjahrRpFwQ7a8vPo1095Cs4k9P772XiUMNdLFcGv2/Rtk5P1bjTwAVqqYqXnAMaKhy9dILS9zG+5Ssixs+MgU1ajRm6DMFXRGV8k7+XYk8LBGrytoTR5IJCKWP+H9KV04CEn2GLSh6N9qGadvD6+1kSikcnMeEAfCeYucPClLkBHBlvaawU/domxAwmt9MNWkNZ6T4PpELiEzuye8fv6fGIGdQwNpUvy8gau/4Jd/n+2a4gvrzVJFXvIpjWaCmVXVvpnlgvWWOQVnz8bDAqOknenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy28E3OvTCMvFiIRleK8o2FBt6p5J2/NLo7dkY9HSOI=;
 b=BG8xXLfcGCfsFZMz+g+3uBetqKPr1fzlnNBL3I/CcVev0tn0ODDAvoGCSkJqChgM4k/CU2IN1oP4kHARBRyYju0OQZptL/X+Kuk9tki7HBiOBiN1AB35KX4qSimfzbPU1iwk3RzGcg1Ti82vUmiMqRIDZRHc5IqZIN7oVxc4Qbw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2983.eurprd08.prod.outlook.com (2603:10a6:209:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 12:44:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 12:44:56 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>, yur@virtuozzo.com,
 Dmitry Mishin <dim@virtuozzo.com>, Igor Sukhih <igor@virtuozzo.com>,
 Peter Krempa <pkrempa@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Qemu block filter insertion/removal API
Message-ID: <a1de7e2e-2048-50d7-4373-7e04299cf7aa@virtuozzo.com>
Date: Mon, 17 May 2021 15:44:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: AM0PR10CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 AM0PR10CA0051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 17 May 2021 12:44:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a63b72e-5ff1-4953-0595-08d9193192fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB2983:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB298392B8F9EE0A57E8594415C12D9@AM6PR08MB2983.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+Athmj1A54EvWU6XXEQzFxwsdLeK8RaWzY00qQrmz8vG+TxYohQLPLl4hY9SlivtekDsXZXw363hUprT2FrUcbuRgKzDDLnJZj2Xq33+Tw2PBw73rsnT0PabCTj4fnRJ9IDaZrJBdty+H/nV0HYVnieZ1HHWs7Mlgb265d8kyDiCWOL5e+gxxpc8W3ttThJTqhIUI+tCv9vDXbt4syp/xX26NgDPgCQxB1IFYcXA31C3TXbpVN4/oo7ab9sT8TYdjUpAaB/ml0JMERrpR+rwUDV5usxrqkaAr2PH6VyBvor+mJLMUFU3DGdMaFJPWF6NrTg9R6IrzC0UYIzmF8TxcA4Orx4C+qynxJu0ZEzAdQ3/Pl1DxQwKM/hL3LShooDR4Apz6jl+pInLQUifV6kukP4OKBkHKJD0Wt681jSUFfkLf+a0Q3JP5JWPgNeJSCTK9zd9PZEAKZAI8VSw/eMNLAJoQbiH7iu9fvBibp9oLEHAkrjDN5q5FeO8DEh0TJOQtCflUtLzI1b8wv3FjNiMDxEMs1IHz/WjqgBlKLGeHRyB6Z6Vx+JiVcpjuBTX0GiMVdgnGyWU4+je3IhuMV41FzOpTxcS115af6dS1SbSSagzAu0cY5EjJsBP/ItZjPU5kwpjEVDnzln/cmI5X8dxQHVSE9600c8m9hcQUgCvSarqqiVT+1/ci/0h23VzPRF971WKCiVDptHZdMmHBaxOkYEJmobOQN6aiVQjPyfuGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(346002)(366004)(136003)(16526019)(186003)(5660300002)(2906002)(956004)(6486002)(66946007)(38100700002)(2616005)(31696002)(36756003)(6916009)(86362001)(54906003)(16576012)(478600001)(8936002)(316002)(8676002)(38350700002)(31686004)(26005)(52116002)(4326008)(66556008)(66476007)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmhuTHBxdXFyTjBEU2x2Q080QnV2N3N2WkFKWVphZWtPaDlWL1dEUURtUzgz?=
 =?utf-8?B?a1FpZU1qc0h1a3dYUzI1ZmpTMVVyNzdFbE1ZcW9WQ3VDa3lEam13QSs1azRO?=
 =?utf-8?B?ak85Yk1PcHpxWUxEVEN5TEE4aTdvWm5MM0lsUWNPc3RsVjRpK2VWa3Arc3lQ?=
 =?utf-8?B?NHJWZCsycFdtMUJnYUFKemY4NmtjL1lSN2poUjRLQzBLTGdjYjBBK3E5Tnkz?=
 =?utf-8?B?OVN5TlBKaHlTWG5Ea1djSEYwcHJVWU1xTDU0dmdYZnFFeXNnVXNVOVZGWWlL?=
 =?utf-8?B?T3YzTkdLTlcwYlJLaWZFTkwzaGlBMUsyOU12R3FTamNQVEtGTzRhWUd2d0t6?=
 =?utf-8?B?bE9keUIxUVM3cWxXaEtabWkxaE1lZ1BCbmRDQlhrVThDWE9HUGttZDJRVFFq?=
 =?utf-8?B?c0RoM3RJc091TFM0UUJzdk1MZHJWVy9Ic2ROditkaVlpd0FUVklYOGtwY0Ra?=
 =?utf-8?B?dkdTcTdGTHRmWGo2VGZ6VVZtTXpJd3RMS2k1RFQ0bjd2UDNUSFFCOUFjNjBR?=
 =?utf-8?B?Y0g4cXMzTVk2a2tWTXA1VDZNSGtGNWZRZFpBOENndjA4cVk0bDJhUWxGSmYx?=
 =?utf-8?B?NnNCdGRSajFKY1VjekFFV0JnQmIzelJGK1ZBUlpURTdwaTJkQkh6clN4UXJV?=
 =?utf-8?B?ajNsNWxWdjk0RnBUMlBCbm83ZHhWNS80S2NpZVBPMFNIa0FxeVlyc0pYWDcy?=
 =?utf-8?B?MUx0dWt6NjJCRXhwbCsxL2RzQWN1RzR6SG9HY1NWUU93YzhCbG0wRnV3dDdv?=
 =?utf-8?B?VWVMTDBtWWlqNFh2WTdLY0p6N2RaR1prR0V2dW9KN0hxckJsZVFMR0lPYUY1?=
 =?utf-8?B?ekFjUVd2d3VGZXl2OEdlS21VWldmcUVYVkR3N0tYMXlCbE5LN09pZEhyb0di?=
 =?utf-8?B?ZkFZTGQxdUZNZm5YZXNsazFNbm9wbWhacGJ4dnpOSXBJV2FydVpEK0lOaWVD?=
 =?utf-8?B?RkVjN1NVRkIyQmcyUlZ2dlVwbTdsdGtkcVpMUTBnaDlybTd5QW1Lcjd6V3dM?=
 =?utf-8?B?OFVRd29lcFgwOUFFeXpSZUQybVl6ZzBmWHJBMnYzVGw4dWZJK0RYd0hzd2lk?=
 =?utf-8?B?U2ZaL2loNllwTXUxZEJwRmpwK01ZNXFLZDlCOXlSZnRjWHloWEYyOEVJd0Np?=
 =?utf-8?B?TTkxQnFrMXFQcGpPemtXWFc0WDJQalVBdVA4MUxkQlZSRWQ4VThoTjdoYzJK?=
 =?utf-8?B?bTJlVElwRW1WNG9HZitYRUppWUE5OWFMRGxsTDJqUWs0emRjRVdMUHFtVXB2?=
 =?utf-8?B?L3cwS3VkOGVkMkhoc2RhR3dDaEhuQXhKaytTOXNENjRtM0YyQTRHT2FNYm5v?=
 =?utf-8?B?MFROdHdwZGdGcXorOHhtbFdXYWpXbXpiVnBncXA2Q1RiWmNQNkZRNCt2WTVw?=
 =?utf-8?B?eElFOEZncGtWUjBvVGFMNXQwZUZDOVVIM2lNaGxqVHNoN2NGdkhMUFBvQTl2?=
 =?utf-8?B?NkJVb3pEa3JrU2grekFqcndESXhmNG9HamVUZlBJSnQ5Tm5wbHF0VDMwbUNW?=
 =?utf-8?B?SnhzTVhvZVUwQ2JhbGxSWUpQc0Qza2cweC9ycHRralQ4UkdESzBEUUZFdUhC?=
 =?utf-8?B?eVh6N3JOcURNVzlvT2FwTHhETU1xV3dpUGRyQW1kaHEvWXdjdnk0QXZ5V0RR?=
 =?utf-8?B?UUNaZm5uNHFCNG53bjlWR3VxY3ovcWNiSDlhWXdLRzNjVmNCbWczTGhLTmxM?=
 =?utf-8?B?c2J2VXArQ3c3Qmc2OWwxOVJmdE5HZ1IvbnlSMEJLVGphdVpmelpIZ3l4ZjNQ?=
 =?utf-8?Q?o59w9IdlugabXCEvRN5Dc+F2z4Wc5dtdPvqOFp1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a63b72e-5ff1-4953-0595-08d9193192fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 12:44:56.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzlj+Vs2nPqb4zDJSvx8+r3CQW/Zq0kvb4xxdkRXKfsdIdnzGp9PIMp2bj/CKCcpkpr+ehNqe2voRPhAdmUvy4UyvxY32T7TjwOSDd8zsww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2983
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all!

I'd like to be sure that we know where we are going to.

In blockdev-era where qemu user is aware about block nodes, all nodes have good names and controlled by user we can efficiently use block filters.

We already have some useful filters: copy-on-read, throttling, compress. In my parallel series I make backup-top filter public and useful without backup block jobs. But now filters could be inserted only together with opening their child. We can specify filters in qemu cmdline, or filter can take place in the block node chain created by blockdev-add.

Still, it would be good to insert/remove filters on demand.

Currently we are going to use x-blockdev-reopen for this. Still it can't be used to insert a filter above root node (as x-blockdev-reopen can change only block node options and their children). In my series "[PATCH 00/21] block: publish backup-top filter" I propose (as Kevin suggested) to modify qom-set, so that it can set drive option of running device. That's not difficult, but it means that we have different scenario of inserting/removing filters:

1. filter above root node X:

inserting:

   - do blockdev-add to add a filter (and specify X as its child)
   - do qom-set to set new filter as a rood node instead of X

removing

   - do qom-set to make X a root node again
   - do blockdev-del to drop a filter

2. filter between two block nodes P and X. (For example, X is a backing child of P)

inserting

   - do blockdev-add to add a filter (and specify X as its child)
   - do blockdev-reopen to set P.backing = filter

remvoing

   - do blockdev-reopen to set P.backing = X
   - do blockdev-del to drop a filter


And, probably we'll want transaction support for all these things.


Is it OK? Or do we need some kind of additional blockdev-replace command, that can replace one node by another, so in both cases we will do

inserting:
  
   - blockdev-add filter
   - blockdev-replace (make all parents of X to point to the new filter instead (except for the filter itself of course)

removing
   
   - blockdev-replace (make all parante of filter to be parents of X instead)
   - blockdev-del filter


It's simple to implement, and it seems for me that it is simpler to use. Any thoughts?

-- 
Best regards,
Vladimir

