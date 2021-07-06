Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5A3BDA86
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:51:55 +0200 (CEST)
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nMY-0004sY-BU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nLI-00045T-F2; Tue, 06 Jul 2021 11:50:36 -0400
Received: from mail-eopbgr30099.outbound.protection.outlook.com
 ([40.107.3.99]:48513 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0nLG-0002Z2-TK; Tue, 06 Jul 2021 11:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Ts2qMqaG32rhpjTHZdkvTEQFr7gHfCtxDRgvN2tqPH88X5NtzuVcLG+wZRGTiHaZ6Q4YbeHmZecrPyg0I8obvGiqw5hC5qH6GligYZXPOHpGm1ztdKrnNqM5IRKNUhkrKXr+et6RNd0DPD8Ae31393xOzMDg+kyOiAuaq9BMssZBnhZvNYSNux/uxMset1IGbIYBz+PbGD7U4SOSzQWqomnWGsdFP2MuWGfwAdo7FcUfOwhfr+onTb2wq4QX2PP/+pz5NSfX4vomaBMu8MT2WBee/uHeala9/QlKjMf6JL4EpnYdXn3eDoI/w/9hq4dMVFvoqZa+WingKMxL+Lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAHM7Z71b7kIr4ILfj3AnAJYXruOV10n2BatdLZ8QEk=;
 b=WdqK1g2Fx3rF2gAOg732iTLbWmKe6oxztcwNz67gTD2AB1DwDYKn6HLzELTuXDJgmcEepD/OokN4Vkp4py+F6SLlh58tamzPLOEIkm8klx83lTiP7L5FEMXfsXpz8236b8+W1QGRY2dmn9ZIfkGHZKDLA5Jk7ZjBjYzxpI3E0ST33SZXCk/aZMp5aQLeB9izDAzFLbTbUzR/lHPs3FqQifPdubUNWGblvUE3aDw1fJmfimSno/m/zHCoTrz/r1PBTERB2s3crnmABwTfTBc0cTS2jCQp+8xzujR+rX5JK8cCuFx/Is5iVP8mADY83j7TG2lhU+cNXIWK11K9SXwfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAHM7Z71b7kIr4ILfj3AnAJYXruOV10n2BatdLZ8QEk=;
 b=rmWZP6aTJt+5M+OE7F5mKNlw/p7DpD7r69csHwIXLl23G1siHZsD8osuTfNsWfEl5rcSfHIn15rG3TO2Rj7dZDFGc8r64OISrMNlOR7j6N8r37MXN4d7BzzAe4BqmT9u03HUz7JTvHNs2DSmrfFx1DjhIKo0lJLtL0eBAgPpLT4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 15:50:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 15:50:32 +0000
Subject: Re: [PATCH v5 5/6] iotests: Test reopening multiple devices at the
 same time
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: mreitz@redhat.com, berto@igalia.com, qemu-devel@nongnu.org
References: <20210706112340.223334-1-kwolf@redhat.com>
 <20210706112340.223334-6-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <63e524b4-2fcd-a9f7-e22b-1a33d1fbd796@virtuozzo.com>
Date: Tue, 6 Jul 2021 18:50:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112340.223334-6-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0077.eurprd07.prod.outlook.com
 (2603:10a6:207:6::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM3PR07CA0077.eurprd07.prod.outlook.com (2603:10a6:207:6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Tue, 6 Jul 2021 15:50:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189b4e5e-8376-42a8-6236-08d94095c931
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-Microsoft-Antispam-PRVS: <AS8PR08MB60534C8FBA469239A680A6CDC11B9@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kT4Kgxjw/g0838rQoVVP8PgavHhUW3CQHbcbE7wxfopCw0E8wilBZMuCPkYxq3aLK6PhYXnh6ihqd3zGMRSZVSdBtJ9SuBYNKJ1zT8GThuTZK1Zq6vMdwWCc06YfkmbXBa1fncRTdx9inV7govc/Z4cz6OgigkdYqqEDZ2tR6BPSJZaAabiBowzcarNa+UESlXuAaJPORjtPSn4hu2+jeMMuntc4djjDKsfpDic9r11+/6IswntodHs0k0Fu7m19sE9swlp7zUFaJOgsq5VCY7O8UB3QM1sv14HGij58SRAjCp06uKsJJTIET3U2ar00K5ObfLRMdxnLQQWKvZB/pIP2fGfu7e7LhgxurcGP7yOp2m7FglR6l6s3TRiaHYqNwm9whi6Iev0UWyWlkXjfV8b/umQN1X8Il4pC/vzM4jL7ax8F7ZUWp/z0hlwkDW2cxbAcFGMmcNlRGg6o42XlzWxJ0glR1kc1PjVSxH6z2kIAmrRFCCMKJ6uTGttvDNLsAIOCIe+C1x1OZAyYBHiXciqLhpcWocaW19nBqpLVoq9HUC8uP9T940aSnaQH/xsPPJ08zptqUabTyE/3zIu1uzwFl1CMWPNPDmV+zJrAcMwwGp/BBG2ULFD4aSAbbFbRrNJvUaVzUlJDldR1Kr7aYyV9pJwJLvKvTjqfzeNAPsoBwVKiH2zTZuNbPQTtRF2nr3JfTexkgJC4bfZnQCqy+mil6ug8RW45QDv/tyOyyYH4T2fqsTk6DJ0jd5NWCrfeu3hHRrdx3GH16CMksz6QZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(396003)(136003)(346002)(376002)(52116002)(38100700002)(38350700002)(66556008)(66946007)(186003)(8676002)(8936002)(66476007)(956004)(4744005)(6486002)(2616005)(5660300002)(86362001)(4326008)(83380400001)(31696002)(478600001)(2906002)(16576012)(316002)(26005)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUpWVE9xd2Vzb3hUS1NpSU1KcWF2QjRZTHora1lxcDljc1A2T3BKMUNhNHhF?=
 =?utf-8?B?ZVdMcitoUXNtTWk5b1BWcmoyYlVNSys0UkhOK3BQYXNYMUhvdi9mOGxCY3dK?=
 =?utf-8?B?clEyZm9OWDZVUkY0Vi9WQlJaRTdxUnl0RS81ZmNqNElhUkFJcURsVlBkZmVq?=
 =?utf-8?B?cis3S0l6My9ZSFU0M1Q0MGp3d2d6ZDM0Ym1lZVpjcnJzbVNpck5DemtSS0JC?=
 =?utf-8?B?NVk1VzlzWTF0ZWxXS08rOGNxN0pEdFpyZHkwY0VNblFHZDNMcnZZZXdIVDU5?=
 =?utf-8?B?bkt4eTRvTEFWWG1IVCtXOXBZcmNUR2F5a2pzRlZqbDV2cG5KQmhHZ1o1Z0Qw?=
 =?utf-8?B?cnJBRkdYODBXbElaYjFYRytZT3o5KzR5R2NGcmhnUWpyb3VxRUFITDE4ejhM?=
 =?utf-8?B?c0oxY2ZBR3hpbFg0MzZKRG1xWWZWSjU2WjJsa0dJYmI1akV4aHlTWW9jQnFB?=
 =?utf-8?B?Z1J4Mkd5L2VxMWpzKzJ4QU81T3A2NXBETDVSNnQ1cWwwV0lpZGR0ak91Q01m?=
 =?utf-8?B?cVlUMVN5dDBGUG55bkphWU5vSkl5aFdBTDVCQW0vUUYrR1pjWmplNnZIK1pP?=
 =?utf-8?B?Z01vazMzb2E3aUNuNWhqTGdIaXBYQkdUeXdpcUZWdDVpang4MHpaWE5hbjZQ?=
 =?utf-8?B?M0R6bmJZUVMySXhEdzVycVpMbTEwL0VKUkprZURscnhLK21ZU09tbERUVnFW?=
 =?utf-8?B?Uyt6Z2lEU1J2OEdwL3AyM09ESUN3Nk5LcEJBV0V6YldjMTdpWWg0dlQ5U2Qy?=
 =?utf-8?B?Wmhqb1VOa3pUYjBPRitkaUluK0E2bGM3dGFENU1YQ0tOeDVoMXRsZmFPMUdS?=
 =?utf-8?B?MFU3UjNwZTM4TXB2MndQR0hlSHo5dWlLOXkvdWlseDlSTm9LT3c4a0xxZk9W?=
 =?utf-8?B?TUlNSkhyeXlkdlZCR3llL28yWHduelNKcTJmR3IvaEFDTW9JdkhQVHpSTWty?=
 =?utf-8?B?YjYrTkd4c1Q1UFhLRGVaMWg2NG8wYWc2MlJIakRxSjFheUhvc2tPR1c4UCsy?=
 =?utf-8?B?S1M1bTF1SWwvRnRoUmFjN2hOakFKNW0rTVdDcEZmODREaFNiNC9Cd0txcmpw?=
 =?utf-8?B?eFAvUFJ1dHBJUzErTTdEdTRucUx3UmRteUh2Ymp4OUU2QnVtbnlpeXZSaGhl?=
 =?utf-8?B?Y01IaEsvdWN4UVJPbVlreU12c0xjRjB3OWY2TUFWSGxmdEVCUlYyYnFLNDB1?=
 =?utf-8?B?RG5Kc3VVc1djRnR1dWdEeWlzN1NoL3hRN0F4MmZONUpNYXZpWFV2NnBZZTZn?=
 =?utf-8?B?Q0Z3dFB4Q1grTnFDUjdxSTZkbzR5U2xKWXlVUU9xZGpGcks1VkVqcTZZVUVw?=
 =?utf-8?B?dnFyYzJZMjEyMWlRLy9wamdyQ2dDbk5BcWFMUENuYytxMGpEV0RqQktvNnM3?=
 =?utf-8?B?Y0U0OVBpQ2piODFQL3V2NHU4bno2SC9ib1hUbHJoeGVpcTZ5VlVwY1diMFZX?=
 =?utf-8?B?QVRZeEJ4TVZ5S3FIbmFIR0kxaTlCRmhhSHE1eEVlV2pjQm1UdVhKRHFRZm9i?=
 =?utf-8?B?NWFNWjB1aWdiTURITFVQdE93Q3Byc25vZTE1Mnp4SkFKZ2Q3eDVQM1RhRFRB?=
 =?utf-8?B?VEpZdklYdW9kcFJXcWM0NDJHRmxwcS9uK3hQSXNNcjMyQ293ZTlLRkRxNGcx?=
 =?utf-8?B?VmZraEpsczB3NS9FZFB2Y3d5U1Y3M0FMSDc2b1AvL0x4RHRyUlJxM25qTkQr?=
 =?utf-8?B?U0pDcmpYSHlSeWw3djlkekZmMWM5Wm9tY2FrQU1RQ3k5L25sTXlaZXNnRlFZ?=
 =?utf-8?Q?6esSyA6E9esoSlJP7/WkwPV321QalqI4IMKqqlU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189b4e5e-8376-42a8-6236-08d94095c931
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:50:32.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE3baAyrCVtiq1EN7gj9WeCoGNXTv85k5FFqaiXoHWHZ72sjjnvKiz4BiYXnCqAKQIb7W3ahr+VQjMH6Y2brIpu4acls/fZX7Z6lMNpq/TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.3.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

06.07.2021 14:23, Kevin Wolf wrote:
> From: Alberto Garcia<berto@igalia.com>
> 
> This test swaps the images used by two active block devices.
> 
> This is now possible thanks to the new ability to run
> x-blockdev-reopen on multiple devices at the same time.
> 
> Signed-off-by: Alberto Garcia<berto@igalia.com>
> Signed-off-by: Kevin Wolf<kwolf@redhat.com>



Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

