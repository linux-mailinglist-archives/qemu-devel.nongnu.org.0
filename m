Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9974440C471
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:38:19 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTF4-0005B0-Mf
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQTDZ-0003x6-Ee; Wed, 15 Sep 2021 07:36:45 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:8005 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQTDW-0008IQ-3x; Wed, 15 Sep 2021 07:36:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGMZkbJz9trQmiXst5z394OugZyoeFPpQFkocafQYNmV84R1a81wE9+uTAE7atQJLamxXQG+c9calck3B65ukNmdoFFerdM0fadFv66dUEl7p7wbKSwBa+Ny7bsmI0osg+NHlPIpY4LVVZ+YndprWe9lo3TGBXAwRAW8r3Ci1+rd6MEr2I02o227CyLQJYsqm+LceB8Khhd/EPdyChmCnuf1eVw/9n3X6uOMCEweLpqrTgL4b/B2N/STUurKZa3mbB4+C7WhAeAXWSTXdh3o6iXjFVf1e7Pa0Tv47P+MQd+3dAtskmZNF0A8H7qXnDF4JBC4Kz2s4Ez8CxMgNpMBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GEOBRYDWJglte56CAZwHOLnEPptNC6aTs8gqOtLEcHg=;
 b=FL3PlhpFjpiaq6INdj9mFSWWFMmHcoHj9UikfPm+Ya7VCxXq88ipJ21AtcK5q6lzuoM6sk2fzlAhONfa3R/O//yfa7ufNwdZIvTo/YxjZrasA7hk2vzqq14C5mX4Mt+CCfyiGT5Du8Q4AMeRVg3DPE/GnK5BSP7m91czZ0fLP6Josxe462Xv3R3cV6mpyeRkIlwN06sE5J5SMo2RF+SMvJTs+5DQP1aaW3QGGYfiQcpTY581IfPpHrvviGEvsdCfHq636atw8Ra3UpjuCQ7Isi+UOV4usXZmMaMMszs6hYcQPtK7R7iD9qTshwH61BMeQEa/JBQ2mcbXwqE5yKWwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEOBRYDWJglte56CAZwHOLnEPptNC6aTs8gqOtLEcHg=;
 b=YZYENmTdHTu7iuuCuR9IeOButC+IX9HyUb9tnpuzfOnboKBuhKK0Qyr278V48C1tDfmD9GbkCjICHsvWHGzId4wyVvdvwwPEaMFvBzn7D2KZJnlwayNA658PoGnzM4acPRy+10xCl5t9nbDrocjsUC2yjK2n13R4KfDct7WipaA=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Wed, 15 Sep
 2021 11:36:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 11:36:37 +0000
Subject: Re: [PATCH v4 00/10] qcow2 check: check some reserved bits and
 subcluster bitmaps
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <b21945d7-39bc-2353-be56-c7ebf6be18b8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <12b47ec4-df54-7283-1b47-89628b40e4cd@virtuozzo.com>
Date: Wed, 15 Sep 2021 14:36:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b21945d7-39bc-2353-be56-c7ebf6be18b8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 11:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d40a29-0735-442a-a297-08d9783d142a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3224405502B52F698FDA913BC1DB9@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vAdPCCVJWxHmjKIOTJeTUhOkm2wUn4VH5Rz2KS+F4NfoiBqPIptPa4edVo77GPHYhdUMYybBC94Dl8U4bVXjzzzAfMWsSbfjqcfJhQODiUCizUzGmpW5zrT+iChXuBjSO/1/2nEHGdIKksCMpuFqnvtHQEhMQLOUPVWMKKL0utPaq+mCMad8sNvpPpW16GIE/S6ea2qUnG7y1RRR2mAm7+Dqelmc/BruWpJq0Ab+RocnQ9WB8J+wVdDPYSlSy1Vdi8Pk+qq/GtB0R54DimsPji7sIcNW/klH6Aa2UqruWynCHoR3n8xSw1iReCZDSaQJD6/fQzkypcjmIyqhzrusfsu+7wgWCsF7yoA5rpadczLemOaapLP21Q+15yNZfbxmQC/k8F4toDdDcgVu6m3+dubpoMZM5GYSmu9Nq7/iR2uOKGj6GNDBzG/Levb9ndvZLJmqbKxxZZeoxvVrwNgPWI7WCbBlHEAQ6XYMEve5Z4XFLVd4/WhAEHbiWizqfU6yu1lnxKMYNWEmvlureXvXeU4ZKmHsEMTqjSCN9you8v/PZKpYy0OyL0eo6svvrsEPZNzo9AtYePTVBe7IiNei2u5wP1IWFhpR1SUjkfey3B+HAehj1jGPUIyynHRfvElmT6zpVQCPa3fd7zEwJjqIUoBUSPytQZMfk2oGK1dcVUuXoPfg/vHxaYzSdk0lkw9XS84lPT9Wr2x97687RjENuVlOYrxrfbRgS9nv4gGN0+6fzByuq7S4RbGFJBV7ajwiCj+YG8PqZhl/zaGWiC/1RghIJl3hafLe2hqwkkNMc3RN0tFSB5CH4GezbgfTdIOcPBSGcHop+Qvfzf9yNo6h0/0+KF9A8W7wPe9fAQ4ka1wyQty6KEHzmOquNVG8tiJBD9Z1sE9lH/omZRVkjnerMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39850400004)(52116002)(186003)(966005)(478600001)(956004)(2616005)(83380400001)(36756003)(53546011)(2906002)(86362001)(31686004)(6486002)(26005)(38100700002)(316002)(38350700002)(5660300002)(8936002)(8676002)(4326008)(16576012)(4744005)(66556008)(66946007)(66476007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1R2Yzh6UmpQckUwTHd2RHpxWjJHQXU2enZHTlNLUUVYWTVQbXUyb1R5a1JY?=
 =?utf-8?B?MUNnbmxFY2VyS3NrTTJHNHpXcVA4R2IzdC91aUFzNGwwdDhUNmtNRjZmUFBV?=
 =?utf-8?B?T2dWNmthYVd0cjRGRTBxZ21Fdm1zVFpJNjhDOXRGMG41WHQrWkNrRDhnV1JZ?=
 =?utf-8?B?dUt5TGlUblBJU1VlMU5BQnlKb2FqcVppNVBGb0I1clJPQ0xVVTBlRzFVZmtL?=
 =?utf-8?B?N08xQm9rbFVwbFVBNUdSdUZKbEpuV0N2QTlKZ2NrQWRKalRSZHRQT2cySzBy?=
 =?utf-8?B?L1ZCMWxnWjJoaGoxTW8ybXMrcGVzZWYyMTd5ekJrN0QrWmREYjdNaTk3Z09o?=
 =?utf-8?B?ckpIc0k1ZnRIOHU0V0ltbWJGK1l6a3c3bEFQS2FrRUZaOVdwcEF2eFA5ZTUx?=
 =?utf-8?B?QzdwU0gvOWhpSEQ2Nm5kR01CRkZ5QklHWjZHZXRRajQ1Mzh4QkRWVjRNL0ky?=
 =?utf-8?B?T2pwZHdDL2pXVW9oMG5NQ0FFQ1VhK2t4RU5UVUdZcWttcW9YNGl1VVVGYmZn?=
 =?utf-8?B?NGFKNHNaRXRFUDVxZ25lL1lMeG5selFUSGpTMEh2VkdVQllwYWROZ25uVU5u?=
 =?utf-8?B?dU1uckl5ellzSTNNbXZaSlhxcC9iSG1MNE1NQWoxdkE4UTZ5d2FBZFBNK2hu?=
 =?utf-8?B?SXlERE5oaWJ6UkZkdGM2ZUJpRnBVY2VZNWxDQWhYdHdVYVNOWEFXaS9rZ282?=
 =?utf-8?B?UnBQRktGT3M1bGdlbnZhaUorSENjUENLSXgwWDM0VHlyRXM0V21wTncxa2Vl?=
 =?utf-8?B?Z1orUmQ4b3BOZ1pGWS94YlJhcFYyU1B2TE1jUjlFZVcvcGtHTGtoTGZPSnFX?=
 =?utf-8?B?MHVsMkJpTTU4aGdLNDdqbVE2UnFsVWtadEczREhZY1Z6RE5hdmVhMnFvbWRi?=
 =?utf-8?B?UDVJbmJ1YWVDQjhpbVJESDRRVWhTWVZSelFRTURza2UxckxvRXh2cm9STzM3?=
 =?utf-8?B?RDl6d0RacEM2cDJwNHlUVHE0LzVhU2p6RnhaT0w5dWV6NGZGZFEyZTgrUm1M?=
 =?utf-8?B?S0dMYVUvaFpzYUVtRWtDbDVPZHNVQUx0ZWJSeFlMMStDYndpR0dKdHB5U25B?=
 =?utf-8?B?bVBvMkErTXk3eWJ4aFJxNG5BNWVUK3BaOXllTGtRaEZtNjNlVy9QTTh6ckNn?=
 =?utf-8?B?MUhYVXJiVHFsSGxSblQzUjBDWWViTlJyeG5PdzQwbU51SzR6L2FmQ3V4RHpK?=
 =?utf-8?B?R2h6OVd2cndSbXpSTERRQXNMRGRkNmRvTTJvWHZ2a0JOY2JueU40TEFFZnFW?=
 =?utf-8?B?SDZ1eERpeXducThrSnQ2TE1udGdZTGY3Z1U2WjVPTUJDSklIbnlOOW1OZERV?=
 =?utf-8?B?WkQvdVRBRzhBUnlJZDVwT2lZS2YrWEhXcVc1VlZROGtJaytuNGo5blZCLzhq?=
 =?utf-8?B?d3F6dE12YVZEVnJrWUpuUzQ0VkMrTlVRU28zYzRtZnRuY1JwSW9HUS9pMXVH?=
 =?utf-8?B?amR1dUZwa1dTNlYvcnRnYnI2a1RpcWsvVkc2dUdXbEtqR29CcGVqeUU1a1NH?=
 =?utf-8?B?bzhyQ3RWRmpDSXUxeTlzNisyVVY3Tmt6Y3lUWjRFTmdlN2p0em5mbytuT1FJ?=
 =?utf-8?B?cXVBcEVjcG85N0VrOFY0dklFQ1QvVHZGaFV4c0plRUF4Y0JZSnFXT3dQc2Z6?=
 =?utf-8?B?U21wem02YktZeTlyTkthNkZ2MGtYTnFoY29yZytHbEZta1lMbnNiSGlPZTFC?=
 =?utf-8?B?RWpvdnBSSmhMSk1wdzExV2tVZzRQU2J0UDN6QUU5UXRkZmhzTG9XQUhPWTVK?=
 =?utf-8?Q?QRh2la2J5Xq+Fbn0L/J+S3BgrUrE20Jka/D4H1D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d40a29-0735-442a-a297-08d9783d142a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 11:36:37.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKLSq2OXk9GERdr9AeFJIvsvTxwHd1C+BW/mbuEO94Y8U+4YaDVxkXzPV12BsEWLY0qfIp5p6YsYzvfOq7JThZfHhIXTxCkpq/gcRTqopHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.8.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_NONE=-0.0001,
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

15.09.2021 13:26, Hanna Reitz wrote:
> On 14.09.21 14:24, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> Here are some good refactorings and new (qemu-img check) checks for
>> qcow2.
> 
> Thanks, applied to my block branch:
> 
> https://gitlab.com/hreitz/qemu/-/commits/block/
> 
> (Patch 6 is here: https://gitlab.com/hreitz/qemu/-/commit/93c40e7dab205047245028e97f7470d89c3a7ef3 – just to confirm the resolution fits what you had in mind)
> 

It's OK, thanks!


-- 
Best regards,
Vladimir

