Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596403440F0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:29:03 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJg6-0002BV-D4
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOJaK-00068W-Oc; Mon, 22 Mar 2021 08:23:05 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:55979 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOJaG-0004RU-4c; Mon, 22 Mar 2021 08:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2qRDrmN23RTBzTYTYujBDJ/I+TC0fqEtMr1XAzXfIlFCs0T5Y2xN3D38G2v35mIMNN7tOoW/DUu4YR8dtCq1DO/KuFCXLYLGMScrUDP+ULfT7pXKl6bKNEfmbdVNnTfdLIgv2fv9pyw19pLXY4SWLgpNp6em/cEZc6YabsnCyMq9+utgLY33W89Vd36PQomV15i3d8HAvjlE4mO8tQ3QDqQ5kSoytxJG4j8XRv+l2oSyQyAb6EI1vDZ2uIoyYQnUuzvKgeGQa5nRHlrJIP4UtyamXi1VduekaVYpVzlbBlUfB8cfnlK9C4RQo5T/GIXoqb6eUCkNi7jfJSeyUfNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d9K0jAeJc++bJO2RYbK5IG56VT3zjKnwnMsvlAbZOY=;
 b=hV0EhTF7I4cj8xRCDptppaqGL9Aeu4nfk5mOAnragYJAqPG1c7NkUS56YZZuIBb5DQxTDrsp+MRQtW/i/4yTz/tFlJ3A5Da1Alf5RhKgehk4qTTnBMxvl4Dau5b5vU9TuJObGdn1pzYC22uuosrMIHqpYKZVbCg6IJG3+VjjFN809KbaOPtjgbE9e3baXz6Vz4LKoXBG6jejI8QOpxTR5/hvyu94mRUJhhHawZ+zhs0kWBruA+4W9CUUrJ087mm/YMzxtPHEz7TzBL7tAoUXQ0u1jLm/483Pk5OX+vKOHEsPnhSXuIQQyiWrCtxCfnirP0lB7TDf+3r/vEpwQ2hh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8d9K0jAeJc++bJO2RYbK5IG56VT3zjKnwnMsvlAbZOY=;
 b=uJfNnB2ejLK31MZWlBP+VVLBc5n9FoZvGzDt5wkadltpeFvTR2XddkejJyPfsufFBcko7GjsdHJ1rRAAbe+ASql9QANXXeazChZ8J8PuTCRUMsTxB3TIZbma6O5fUgav74RT+teZ5/2YEF3jTvkwZ4QJA/Yg3g/WTI2lgHxqsHo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3135.eurprd08.prod.outlook.com (2603:10a6:803:47::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:22:55 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 12:22:55 +0000
Subject: Re: [PATCH for-6.0 0/2] Fix use-after-free, if remove bitmap during
 migration
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210322094906.5079-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a1e8862f-99d8-8551-8ab5-c596896271bc@virtuozzo.com>
Date: Mon, 22 Mar 2021 15:22:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210322094906.5079-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0095.eurprd03.prod.outlook.com
 (2603:10a6:208:69::36) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:208:69::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 12:22:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5956d9-5a38-493e-91b1-08d8ed2d38b5
X-MS-TrafficTypeDiagnostic: VI1PR08MB3135:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3135DA8531AA067D38971C82C1659@VI1PR08MB3135.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VloEICypxfHSUjUPfsL0FPEbPO/cQV4S6IajunWXavxkzKuWsJ+QqVtc6qbUr0RdqODVtcqZlsOcPhPOjv6lozp2tXofz8e2bli8TXksbjiJ3jihwTr54D9bcBvPqiI6dC2DNuRWttszTt9Xz7XM2or+Wt0KwTSpyz9D5c2BZ9e7CG4CZPZ376KoU8UIeeWbZNac6xMe4CIPG2Akfjz9QNVC7qQ3a2cNTUCkXySsuGKvZ+bh+jpsIa/vsyQW2U/RX6KE/PLETB89f1IAGfNlQ4oxNSMqVdqp+2J5WBvJT31Xgl+KFEcMQycAVM3+Yf68/gZjVjl5LdUEwerEMn+xYEpPCNisMPh5r3zNahbHFA+i/o2VsqEstCxTNjZ7PWvY5/+FaxRwBZHS7cF0N+INzw/GLyvnangEUIzhHk/l87Js2DLyiFUsZi3umf12ackmLMoKI8XbjS9oEZeX/PEp+M52wSZZq3bzmy9reE+6SDfoSUGUUPv0QGWJ68c49GArxpqSObrwlYCUvubK8S3sNInBKvmXlVHGSQrySApmWznXxj9bEZMV9i8UXWzYxt7I0R4eWjw97d6oB7tKud6vN8RZtJ0axPk9EbcYxYj0H59vIf9MPpHJvEExV26vttIFClUsPzmq/wb7xMdxHarmhCME0JZf1yNHxmdkcKqA2mU7/KFL7XTD5Ac9hKaoAMGrkcbDn9Hd+hAeaH6hhpBEKPEt+7QBsgocWypyTWc4epk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39840400004)(366004)(136003)(66946007)(66556008)(956004)(8676002)(2616005)(16576012)(86362001)(66476007)(31686004)(316002)(83380400001)(4744005)(8936002)(31696002)(2906002)(4326008)(6916009)(36756003)(52116002)(16526019)(6486002)(478600001)(5660300002)(186003)(7416002)(26005)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YjBhZWZLMzJEMTBkeXBDOGx3MmlkWktGamhTQVc1NjVwb0hCRkp3Y2dLSmUw?=
 =?utf-8?B?SGJGU28vcUYvbHBpMEF0RUtNZnhDS1RHZ0tsWFp3eUhyMXBMWW1VY1UyYnRF?=
 =?utf-8?B?MUFrL2lnTFJiaVdMVTUrNzNiZmNka2l1RXJCTzZnOE9GYTFTWEUzRURNTmFI?=
 =?utf-8?B?SGw3LzBsYnd0VHRMMWpDZUduZ01YRVJjM1h2KzFKMGFDRzdMWEFMd0dHd2ds?=
 =?utf-8?B?OFArYkdreXpNcFBvN01CcmZpRWN3b3huU2JSL3l5ZlVmNDJIaGh2ZENjY3Yv?=
 =?utf-8?B?MTlYZkFDb2w1UEVtTmlHTzR4aUwvSzZNZWhmV3EyMzNRTE56Nk40LzdZdGJu?=
 =?utf-8?B?aGxJWTVCcGVVQnNiem52VFdyWkRHRGNwNmMzMWsyMzRZVE9aU25tWGVlVWRB?=
 =?utf-8?B?VlZKY1dENXhGOUdUaXNUTWlBYVU2bGtPVXBTNHNic29PZTZ4NWVpTVBybkZp?=
 =?utf-8?B?WTBsNXhEZTBMQ1dmVTM1c3M4MllnbC9JWlRBU0FKL0V6WGRGamwyTGJmMmEy?=
 =?utf-8?B?ZHFjdjk5RFMxNkU5b1ZsdERGRytjZGQ4SG91TmtmRkZ5RjY3WHJ1Z2l4Vmo4?=
 =?utf-8?B?K2dSd3JROUMySFB5dW1TNnRrVUdKMjVmWmFoemltNWdHeDF6WGVvNWprK1VW?=
 =?utf-8?B?ckZYbWkrNU9nd0I0NStRcnV4RXRKekw5YnJXcHZIeVN5QzU4eWQ3UVRNU0s2?=
 =?utf-8?B?elg5K0w5NG1xUkZsNk9pcmljRmg4dEc1VHoya0NFYW9obVNCUU5sZEN0N0I3?=
 =?utf-8?B?c0NLeThoVkYyTXdmVGc5dVRMSndyNk9sQUtjQ3NFWkQ2VlZ1eFFrVUp4NWN0?=
 =?utf-8?B?ZEVuYWdTNTlEbktRdzBxdTB4cFZIcXpZTE5FaFNQeEZaN1BNRmxMUXdkUVZy?=
 =?utf-8?B?dDhNVEQyNCtaTHdiVFg1ZjhSVTV2OEJaU3Z1RDJ0bDFQcndmcTE0SWw4UXdS?=
 =?utf-8?B?WFNtZGFEMXpqMXpZOWRVTmkxV2pGNzh1VEhwR3hkMEFlZ1dUTTlLcXUxUUpD?=
 =?utf-8?B?dGswT3VRZC9SVzZuNmlSUEFJbndxQzdNK0doeHU0cE1mazc3bmVjVzBPRFJS?=
 =?utf-8?B?Yjk5RGwxSzYzTkZyNUMwcmo5aW03S0ZLWDVvbmFsVjVKM1loaDUzb2t5bEw2?=
 =?utf-8?B?WE1sZ1NZQ3hjRjdnWW1HUW9KVFVlK3BTY2o1UzhXNURydFlodjhPL0Vla3FP?=
 =?utf-8?B?RndPSmROaTRWN3JmY0U4SVZFektwcmRySlhRQnVLTGdDVE1RdHZWbDh4QzBm?=
 =?utf-8?B?ditycHRzRHFUMGk0U2pzNk85cnJwbnVKRVp5S1lSRlYxSDVxT1VoTVZmZUJS?=
 =?utf-8?B?Z1BmalRPYjBWNjJYVmVhU2M0YjMxQVpDS3djVm5saXo4Z09yUUtLck9POGVT?=
 =?utf-8?B?U09HUGJzWmVmWGkxd3pidVlzWWMyYmVqRElWbEpCQ0ZHSCtYNmNZUDJwSnBq?=
 =?utf-8?B?eU55aTFEM1BYUHVyeEVncWpzTVhDSlN2T3dXTlRxZlZoenJ0Sm1jaTRPUE5V?=
 =?utf-8?B?NGcvUFRwNFcyUUZMYkdnS2dLSkZzVUZ3dVEybzNCQUVZUU5YOUUxTlVIZUN1?=
 =?utf-8?B?T2hYRVJqdmoxR0JheG5KLzJ1dEdrTXFFN3ZBMnVrVFVKTC9zN2JGZ1I2RGFt?=
 =?utf-8?B?S1Z6RGhMU1psdnJBNEcxek9BSlI5SmdZbDhFSTdqK3VyZHM5UW05NFFSdWVX?=
 =?utf-8?B?T0VYV2szUlhlV05HWTJSZVJqME14dHFqSXdWcDhLdWNKdityV3FSdWV4dkdH?=
 =?utf-8?Q?PwO3yfOccD0TLzY2GiIMACSVF41VnuvQNhijf3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5956d9-5a38-493e-91b1-08d8ed2d38b5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:22:55.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn/afZt6AyJ5tsJDtqhEAWrORirU1pwmLKuWH9z/zU6QAQZKpmc61iTO+r0CAGiKUu+58TC+Dn2fqe5V5b/QnecBIWUh5RgzTXntfMLoRLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3135
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

22.03.2021 12:49, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! Accidentally we found on use-after-free. Normally user should
> not remove bitmaps during migration.. But some wrong user actions may
> simply lead to Qemu crash and that's not good.
> 
> Vladimir Sementsov-Ogievskiy (2):
>    migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>    migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>      bitmaps
> 
>   migration/block-dirty-bitmap.c                         |  6 ++++++
>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 10 ++++++++++
>   2 files changed, 16 insertions(+)
> 

Oops sorry. Actually, it's a v2 for "[PATCH 0/2] Fix crash if try to remove bitmap on target during migration" with a bit improved test, patch 1` unchanged.

Supersedes: <20210319204124.364312-1-vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

