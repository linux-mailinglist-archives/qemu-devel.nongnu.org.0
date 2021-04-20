Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1E365997
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:13:49 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqCK-0001r1-UU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYqAp-00010Q-JH; Tue, 20 Apr 2021 09:12:15 -0400
Received: from mail-eopbgr80103.outbound.protection.outlook.com
 ([40.107.8.103]:28903 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYqAk-0001Nq-5c; Tue, 20 Apr 2021 09:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtMcPpwvhn1XTIXGWKdwsjn9Nn/QDN+c6jpGXkcYFMdGruqCag2uh+FwJBok+wjd6PsRNuvQ9zYXase5mQd+dS8o8aRPPYpvR5oWNrypSO29G+uOEDhViBOe/e2jhH6OR1p9apyageGkHQkkWKICBIpWewgwAcTf/Nvt7ARGZgUtQjHM1hVnVqqv3mJEkA7K0R0Z63ytBTZqCsKwVn+mneD6sblBLfV7aI7u5dLclbsVk7camaI/zBR8kGvCK+sCMHRd8S/9qjkCvF4NAsoWX4HGJaxHgErcxYKjn6AN6qfiU2BbheCSJ+Go7V9TvTUna2Kf0LVvx6a/Nnk1VGCtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tm3mrT0/efUj6K145JA6LJLxA6faJ9biv0LItI7kLwQ=;
 b=U/F9ckXKww1hYbWDa+dMiQLnLjwTESLRFMrm6Mq+yU7SyVSorSIluajPn7B38bD/kQuAh4hnU2p+Ax4zEy5P7oNZdEvGPI7fYK5AZ09tmGsEkRvNpwiYmxQ2dFFWdz4rszA8zPncdvfZqDaD+a6kgXAtkkAZBvrLPmJTpvAQarnXt4k/dBVAOsgaXn5gfuo3GQEEohPc+PYS2sOJVerMQuKrZNfWT1tQaT70JLoiVKS7RvoPzKL8Jtf4k5iKeUJK9EQ/Fg2Sszxr5Wt8/2UyF63J09g+8HptqxrHSV3D5PpHDjMy3Jif84tPJqsuFK71gE6q88r9cNb+Y0dFFXW7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tm3mrT0/efUj6K145JA6LJLxA6faJ9biv0LItI7kLwQ=;
 b=jotc8b1vVFwIFaIkwPVlxKjgEJfXSSCsjKsJ3+tq+Q2mofg34Ik5Go5TQXpZjKD1kvvVO/t/mk1XGbSy2vNHS5K2TdwIt1H5saR+8ygAluwrsptnOOdoiihRLSOeKYIzMg1cJMlSA2sE8G8ZkS6y+u09qSL+reG3YPWqCwEmayw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3160.eurprd08.prod.outlook.com (2603:10a6:209:45::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 13:12:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 13:12:07 +0000
Subject: Re: [RFC PATCH 0/3] block-copy: lock tasks and calls list
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <570d2007-fdb9-d90c-4ea9-32a6d1dd14dc@virtuozzo.com>
Date: Tue, 20 Apr 2021 16:12:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210420100416.30713-1-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0088.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 13:12:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64f309e0-f15d-4826-7cb5-08d903fde61f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3160:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3160017A549D61AEB83ADD8EC1489@AM6PR08MB3160.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQcBCaZ9L8xce4kBpFzXdzPBn9aY8UP83ifISGVW2K8bvD0nENz94rrEDr5KiPGe+x4CizgfHZCyI/MNmlbMkb1zNmAipdgSqDioZgqpKHv6E9QG60Ojqkk33F9xwkPK6M+Ou9aaLnoQSe/8FgMQl/cyOOPHlBeNUnTykRMAokiVcebKBRKA15pYyGRYi1Z4rnOEvTB/DoiafefTuiF4FPBGembxvyM3XwKjF4BQxCGE4kV7o6fryReUQCnoX1RWB4889zmK8eINJe7cJaL8oie5sDopM+qs0Roc8NOsEfm/3k+T4OXzMrFIhRhUDvzAXu5ZqwgJ2RSmctYjVvrDu5GTzu9Qysw0p95WrJHAeYF2HEjBzdFwWAdppk0z2oMtO9TPjwWcftgU0UqY2k8IFWn3wHaYeg6cVnl7s67AXmqlwcB01LL173ck1nL6TBHulQwLtlWI4U4zrtgsu+EQSPUHwHMNHF2v6SToFv+PRyTU5DKkbXWDJYveaD0muREHwQGhB8QN7xMT/iL+GAq8K95EVidancry3dogp1+gNLPg79X45yfNZBjqBoG/sZZlmBRujldOjiOYtDSojUJO3vb1QEmrOLL6lXqHLwaXSRIsmZqT+eKeO+sW1Eql0k2zhCl1K1pZAY52KaclrSuo+BTPBhaGkZXHS0Q6xra8mab4GqJJU91vIS/G0mpo/9SO4Gc4R+JM2NfnL+jBkhA1L67+wmmj7TS9ZGGA2xMjJM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(136003)(366004)(2906002)(31686004)(31696002)(36756003)(66556008)(66476007)(66946007)(86362001)(5660300002)(956004)(52116002)(16526019)(8936002)(4326008)(38100700002)(26005)(2616005)(478600001)(83380400001)(186003)(38350700002)(6486002)(8676002)(54906003)(16576012)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXMrZVpMV1A4NWJKcUViZDMyNU5mQktDbzhWa0lsUXA3NDdwd1RZZWo1N29Z?=
 =?utf-8?B?OTQ1amxncjd3b0IvNUJ3ZjVIdXJQa3BmaDgyWERaZFR6eGtVMTNaOVJOeHRP?=
 =?utf-8?B?Z0JZdXJYWFU4YW9vN1RibzBpYXdGVEtXRzZnemdudDZzUXRMQ0w3TXFpdWhp?=
 =?utf-8?B?ZGFjb25YK2RXK2hibFRTSzFSV2lIMTM3ejJQb0NCd3RlYWdiMGZ1MlRJTXFs?=
 =?utf-8?B?SnRxQmFXaHhWVmZwOWZPWnBFSmRzQlN2bkVPSFJLZkd1ajBrM0ZxYSsycVd6?=
 =?utf-8?B?NTZiT0hydW9HTnBRaVNPMWExOGJYR202RERMUG9VeVVDWEdpa25WK3Q2SG1u?=
 =?utf-8?B?c2xHSjhtcXdCUVNXb3B4WmVMQTA5dDhRMEJsN0FNWExpaUdmRDBMUnJvUjNH?=
 =?utf-8?B?WEd0M3VrMFBUNW5vT2ZVWTMrTWJWUzRZSzNtUjd5WGt2VFN2K3ZGT3loRDVt?=
 =?utf-8?B?SlNJMVcxa1E1ZXl0TkNUVCt3VjhEckI1V1hSZktsZXNSUmYxNUZicGtyWFVs?=
 =?utf-8?B?eVRYb2dFZGRuNURieUpEZjlzeTN3djJlU0YxNndjK1liZURXK0dXbnpjSmZ2?=
 =?utf-8?B?cnJETjNhNEV2TzdTQ3QyMTJZQ1RoNGIwM2tqUnRjalMybHYybjR1VDB5YU1h?=
 =?utf-8?B?N3NPbFN0Y3hXZXVCa29Odk5SK3lvVkJUWHFFVkYrN29JTHBtZ1BMUDRiZjBx?=
 =?utf-8?B?YlBvM2pVZ0w2b3RkMkdUeHVwc3JCK1ZHUTlaMWRCVnFMeWhGR3k2cjl3SWJN?=
 =?utf-8?B?VWhZQ1VGMzhUNnBiaFV5OVlYS3RHRFhsbzhncEpONVd5N2xlSXNDeGh6T3N4?=
 =?utf-8?B?YmVuSy9wOENzUTltY1dqWmF2clBJY2RtZnZhMXpLVmVhNVErbk5vM3NzTy9m?=
 =?utf-8?B?d3N1K3Rha3BlOVN0VElmbkFQdGdJTU4vNUwwTmxkQ2t2MlFRRUU1b0pZNHpk?=
 =?utf-8?B?bkRqajNqU2pQMUo5MUdvY3VHYzNvY1NXNE1meFFvQmNNc2dXSHR6d2loUGhZ?=
 =?utf-8?B?MzR0UjZqZ08xdUlWRmZ0RktadTlGZ1QwNUxYVkFacG1Rb0VJcVNESXcvSEhH?=
 =?utf-8?B?L25iczdvUG82L2NtTCtLT1NSUk5TNHNLZnRRY2I2MzZzdGZCeFRWb2RJZjdZ?=
 =?utf-8?B?QlY4Q0drelFybFFmM2czbEppTWNQTDB0Ri91S3pYcmNPL2VOeXZTY2ZUa2cr?=
 =?utf-8?B?TmN2MzhQVVI5c3RtWWt2NHpiR1dRdGV4UlR4WWl6UW82L1NCc2FCdHpocmpY?=
 =?utf-8?B?cVR1dmkyajdUVHdjYjhKMTAwengrWVlDVksrN1NwaVNpcSt3TGczaXRPWjR3?=
 =?utf-8?B?R0dyKzBIVjZTSXRudUFiMlRhWDJ1SHJCU21XdnJEVVRiRkw3d3lFeXdhbUxL?=
 =?utf-8?B?YSsvdUdiN1EvRm8yblU0WU8yMjVIeG0wSUpPUWpYT0l2L1crdm1YL0NPOE9L?=
 =?utf-8?B?bFhPRnhKN1EzbXlsazdxdS9tK2laR0pOOWJkVlY4WjBtRnI2UTZoTjlXSnBH?=
 =?utf-8?B?eGR6TkFCdy9hcmROY1Vyc0VwWEk0Q0hJWm0yZFNDR3FZVC9PODBZQXlYU1c5?=
 =?utf-8?B?aWlSb0FpcXJWTENDeVZPelNqTGkyZG9TcmpFSUs0YW4zeUxOczkyTVo5TnVI?=
 =?utf-8?B?Mmt6eVZLV0llYm9aSFFKOVgzQ1ZHV3R2RjZMc2VLT1dCbHNMMUtjUVlNUUVR?=
 =?utf-8?B?dHgwZ1JCSTVHbVJLTmtFQ3Y1ajVDNUtIY011RDBYaldHaXNOUzdwYTVCSmdY?=
 =?utf-8?Q?t9K8ez/8c1pgrUl4GlGOe8BQHSds1n+2udsgmb1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f309e0-f15d-4826-7cb5-08d903fde61f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:12:07.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+ZQ1eDxi0XIP+CSxsl87z9ThfbRpZgeOo5txQpnSSoSKvFaZSbg/JoNlJsoPHtQwzb+TfR6NDoPM4hykMKnKttvMuvhTV8Qpv7i2b0GmQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3160
Received-SPF: pass client-ip=40.107.8.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
> This serie of patches continues Paolo's series on making the
> block layer thread safe. Add a CoMutex lock for both tasks and
> calls list present in block/block-copy.c
> 

I think, we need more information about what kind of thread-safety we want. Should the whole interface of block-copy be thread safe? Or only part of it? What is going to be shared between different threads? Which functions will be called concurrently from different threads? This should be documented in include/block/block-copy.h.

What I see here, is that some things are protected by mutex.. Some things not. What became thread-safe?

For example, in block_copy_dirty_clusters(), we modify task fields without any mutex held:

  block_copy_task_shrink doesn't take mutex.
  task->zeroes is set without mutex as well

Still all these accesses are done when task is already added to the list.

Looping in block_copy_common() is not thread safe as well.

You also forget to protect QLIST_REMOVE() call in block_copy_task_end()..

Next, block-copy uses co-shared-resource API, which is not thread-safe (as it is directly noted in include/qemu/co-shared-resource.h).

Same thing is block/aio_task API, which is not thread-safe too.

So, we should bring thread-safety first to these smaller helper APIs.

-- 
Best regards,
Vladimir

