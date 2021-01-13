Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673242F5366
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:32:20 +0100 (CET)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlsR-0002nN-9K
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzlom-0001SD-AU; Wed, 13 Jan 2021 14:28:32 -0500
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:44352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzlok-0005ln-Qa; Wed, 13 Jan 2021 14:28:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDgmDhSz5LyhIstfevqv2+ivsFKm7Qw3wFmrYvF0/hq/+2uUkj1zEAZ2zQ1TBbTOmxx0ZYmFWQ4AlTNVqBYe2sQ8E3KvCmDcD7YezaaQJ8R9PrVha2Tidl1FPsCttlMhd6QYwO5ESMpFDU+OXEPHZU0lxAxCKPDaJXX8qgLf1XjlC9nq+vGaqqRrW2uTgk/vmx2x7gxqZRgyx8j5T+Pt9Ad+PgygGe0sG3nk61hrrvNSfulplQpQaekxFcP50cBhrdT1GJ1nPScUR7oZWG3XP3oPW91drgvXzBHreNGEgQqZteiVEwTJJOULNduODBUEGDWg5Ps4CIvmXML+IpUGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Y9TaoMZFUrv5Vl9CD4SxYL/aCHds1BrOt+NBY+KDk=;
 b=NxWCDBeQt33EGa+XBzNwd25h+OEFMovNBnc4cElCyLEVduJ7vowua5s71ktT4GNB15IXSfamLq2L1DKCFAQbVf/9nv4BL0w6p6lT0TClxpVIkso/28KV3D10Eus2de6DjF4cKUjik8n6NUZ+Jig6CAsJDJtlD956FL/keTl89xJJBUbe1GJFqNkzeFalW0L8P3S162sndgWEUzE2lZQwotu5d3RWA046sRiOJ7LCPKPa/wwtiDJhFXGBISBJ7C0tueg7KhKGXDXeRlWcn/R6TdoG6mH/XhDOoqU2+OGUwlolnwPdsi8YHbpOEQbQ7uVLRmYDcgVa2z6tm5qTiIff8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1Y9TaoMZFUrv5Vl9CD4SxYL/aCHds1BrOt+NBY+KDk=;
 b=Ss1twgwwJvWtFy3GxYbk1ecezBilziftzclqNihF9mlJd/S2j4HNK9bQc4rDZy3Kl2tZWbo9b9UYCL1NJ/NIyXKL+8ewGRMrgIcXiLMF93iADy4cmBrgwNVWL61Ayxj9+bUUFVjFLDIuEKWbjzZ9FkmIZnQNitgVAwNqT1FjMJ8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6437.eurprd08.prod.outlook.com (2603:10a6:20b:33b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 19:28:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 19:28:27 +0000
Subject: Re: [PATCH v2 2/8] iotests: Move try_remove to iotests.py
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bc98e6a5-c828-4f61-b4b0-781bf18db233@virtuozzo.com>
Date: Wed, 13 Jan 2021 22:28:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113175752.403022-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR01CA0143.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 19:28:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68b49ff1-3ac2-468d-4b00-08d8b7f9671c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6437:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6437BD5ACDDAB6A90F4CF7DBC1A90@AS8PR08MB6437.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01QMADCTsUrHfpCV04rr4k+pawrUloio4ER3PPx90VS5Wffw5j42Q1gK7CoO2CrMnjTVMmQJ7e/09mr6qiwZP1h7lhqN1LIBStBizocPMfdizDXOSzEpmKtA+tQu0BotPvMvIh/J+5dOO1/srzm7R6cm+45GcnIp2nJ5CsDmHM/cedCozFZvClHW83YsF6zLq1iyP7K2h7FAV1an4R4gezz4W9dWlFojQxtGHZ71KcsyXo/glDavyAPQjTNHVwH7Tbnl2Ohy93lgV31cRj2m8CXHWVNht3U51EQAb4yx5km2IhSO7eE9S7AP6ZinxNXAtj6MzYR/8MAf1P/2iueb4ejq63+4JgBf5ErE+KNPgZ7lmTsJzLA9UN55JuPqW3Rs/H0Q0HwraWNs6+kOZ6JOej3chFoLGkztlfiAoFmVvs7wlRxNqm65NhrY0j5gmK8c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39830400003)(366004)(36756003)(66946007)(31686004)(52116002)(86362001)(31696002)(6486002)(66476007)(66556008)(4326008)(16526019)(16576012)(478600001)(558084003)(186003)(26005)(316002)(5660300002)(54906003)(2906002)(956004)(8676002)(2616005)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MS9sZm50Zm1hUERoRXJRMWtvZjdvVDhBYjFhTkd3cldPaWxnMDQ0bGxIRVZj?=
 =?utf-8?B?ZkJSNE9pUVVTODNTTmhFbXgzemZJbWxwbEVpUkVjVUsyczJTN3BjbTNhRHRT?=
 =?utf-8?B?bkFXYU5yM2JPbkh0UGRmUklmVXJIMzhKWk1wWmM5ZTdRbXRRcmJkS3RQMm5J?=
 =?utf-8?B?WXVJRWJrQys0UXVBWVY0Z0RBak53enJQUVhvVmVmUXo5Z0hPeUhTdmg1cUE2?=
 =?utf-8?B?c3dEUXRUeFBHbmswVThoTVBxZC9VTCsxaC9LVWg1eUpBL0lFWjhFMmd2NnNF?=
 =?utf-8?B?Q1JoUWJqeDcvdEdWem5HRmNpcWxlM2l5VHFkRDhpbFU5dlZDd0dnVit2RU5O?=
 =?utf-8?B?NWszRWlEa2tiNUNvUlhrdlpLb1dtWStkdDV3bTR2a3pRTWx2enZNd2g3VEt5?=
 =?utf-8?B?ejdiUnNNTHlaUVZmWUxTODRjekZlK043d0lPaHVoTTVkSDFMM2Y5NnJhQjhF?=
 =?utf-8?B?R2hDdWRBU0pGMC9JTElGcWJIaU10TnpmVHhnbGRPVzU0bCtuS3d4RzYvWmFJ?=
 =?utf-8?B?SnJ1aXFVN0d3cUE3Q25wSlhRU3JkWmh4M3ZiYkdDa1EvVzJpQ0NOeG5URnJJ?=
 =?utf-8?B?RU9wZEpQMWh6alNRKy9qVjh3Rnd0dUNiak1nVWQwR0c5SW9IVjNGMHhFOE1D?=
 =?utf-8?B?eCs1ME9hd2R1aVBBS3pwVkhwd25qUnRJNThmM0RkcVBneU1SNjh6VVdHMkRp?=
 =?utf-8?B?dVdFYWUwV1pjV2F2MGg4aEpKSEdFdFNIeG1MT3N6bzVHeXE0UitkUEVhUmNh?=
 =?utf-8?B?TVFtY0ZjbGV6WUxOZjFUR1k5Y0RMV1dQRkdldm9BbEM2VGRDSnFYem9wSEdv?=
 =?utf-8?B?SW5sRVZwMFhIRUV5ODhvYTFsNnJzRmVVUzF4OFN3OEJMZXlRYVd1aG9icUww?=
 =?utf-8?B?V015NWxEM3plMzFWVFpQTGNuVm9VT1VMRnZza2dvcDE0WVE2bk9uMDF6MXJj?=
 =?utf-8?B?ZTlxdmdIbDVJUXUrTTlLWjNrUkJXeVE4RlVtMXdpUmNZbWlDQW9oVnorVzFJ?=
 =?utf-8?B?SU1ZcW9mRXhib1hpRU92d0FqUExzbGY4a2JDY0VaMVpIb3d1UDRiTjZlVzdt?=
 =?utf-8?B?Q0IvN1NJQU54b3hUT0tiREU0Vk5lbHprd2NTTHBPL0NkVm1yWGg4cUdFSXh5?=
 =?utf-8?B?UGtSV0xVdzVaK0hoRVhvbEdxUkFDQVhxTU03Zno1d05scVlOcmlScFVkakQ4?=
 =?utf-8?B?NXMxNG9ibWI5UWNTZWVWNkJKaUttQk1JQmF6Um5JVnBXWm5FWWZrSm9LOU94?=
 =?utf-8?B?WVE0VWNheHQ5TkRTV1R1aUxKNEJmempiWjdRRVAxekpPWFUrNFhIbmErMEVy?=
 =?utf-8?Q?B2Nj10G6kONnPT0d9day4ZsGQCOPxcfA/o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 19:28:27.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b49ff1-3ac2-468d-4b00-08d8b7f9671c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tEhPYkPy7A0F9oXJgytSI/eAYV5/IjjhFAJGZVX4QbZK5m2QqOCmCWzkqo1a7iEYGKmbU+az4hyNikFVqz2ZRVVOSyt4x/nk1soC6m1asI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6437
Received-SPF: pass client-ip=40.107.7.115;
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 20:57, Max Reitz wrote:
> Signed-off-by: Max Reitz<mreitz@redhat.com>
> Reviewed-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

