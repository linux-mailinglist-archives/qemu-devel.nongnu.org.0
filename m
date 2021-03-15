Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4A33C085
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:51:50 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpVV-0005q0-KY
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLpRx-0003aT-4a; Mon, 15 Mar 2021 11:48:12 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:2689 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLpRu-0000bD-DI; Mon, 15 Mar 2021 11:48:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcO4xNkEeo5H/tgtS1Nsac26/OGCDWJz8ML2jx5tUQazQVwHR3GK3w14z1Z9BdhgjvJybppGK9fDQ7ExvZODO+f2zS+vIwvQTYHHSDqg1fJ8sMD/cDceyMH5nxQAOo9xo00nZR99mS/5NIx+LqyeR0tgLhs43pUb0cw9Bp3TDwpo0mSvq9NQzNZN2CGxlMJ5Qw+oZ4+1naOwWXwfKJQMWkXZg87DJbKpeH9saLN2u2UBZ0TQwnxUhxGUdfaB6JIhIT9neNAies52uN4tgFm4gVsSR6QfPngrUwTE7vqUfRSQNEJQU0INv2JtHh/DeMsIFGo5IFkqV9BlhKIbBX6JVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OLjz1iJBF/AmVedkIOVTuZHhmnomKYjgehdtVKKqnY=;
 b=ZrCVldzQMIyCIyWIxq2TwiEkxnH54eDRUVHW14ljbPZbBtODa1HeNqOLbHCMikS9XL4k2MrE7mQ2e2wWJpdCtsfxTeU5a/43vQdPG32LE2goXyjfuOUnLgwmS56kLoUfyhmsUzBvlGGvS+YTpiZ5T1IaaD74sY2vRaU2p1u44ZFk+8KOvNvH20kjq5RwH4QRNea4podyFaNRba5uq9k8mYS1GhP6Bo0+Hi1zwwof0Qu+l2G3j+zXfg+E4YdKhgUxODtiQsqdXBTSGyv6+xgjhvCdYfi+aXtlQuMVblVA+mKJgu1Zm2qMcNNg3uXaZHJd3IaWMbzh1fo9mR/UlmwzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OLjz1iJBF/AmVedkIOVTuZHhmnomKYjgehdtVKKqnY=;
 b=TU1tsgfllsVRFomjAXn+BjSFeUCIDTT49hmd6qB4YRS7bhn1fR8nEat7nzQiqB2QTVpugHyHQGZT+A1WtINfMqvMXpklWULRKXBMrzxmocqEFpQB2EL2QwjcrifByUhhILCYaLIRL7oUs+ZEYhPl7L79MpMGKlkK9W6Fx9YZ0Xo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 15:48:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 15:48:02 +0000
Subject: Re: [PATCH 2/7] block/nbd: use uniformly nbd_client_connecting_wait
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-3-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2e988ed8-f611-0d07-e662-4ff2342f7d53@virtuozzo.com>
Date: Mon, 15 Mar 2021 18:48:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-3-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0040.eurprd03.prod.outlook.com (2603:10a6:208::17)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0040.eurprd03.prod.outlook.com (2603:10a6:208::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 15:48:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43df77c4-dfb0-4f88-f872-08d8e7c9b737
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650BF866EB33E28AA0CD697C16C9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wszHiNVBZMSHCwAABNvALUwhzJB6LfTa827vTr86pUJkx3OKlua/KuXdnkg8AapR+cGkoVOsyN3wlazq2oxgDOc1La16vB/lCidrZBjoyu4Gb7+wwTJWHR0Vh2T/zBkHnJCUNY8OikFeF9DrmX7g6V5JSL98zZSKYHgYcdAbfv7GYGJWJ/jQK+Jm4MQCXjAACw7SNJeNL7vl6dWNvl9uoo2uHN8l2cKkVJlU1Byf58YXKDv2+l6ylt2RCqqQiCOqyg7eacbAFuae6gGDRC4zQFkZbsKHNxkPCAvkdnOhQl1IQAj29Xo9ORzUBM2Hb8wT4iqO5R1joMFKl9dMWYMm74P7cbVMbztgMcHALh5WpHTE/FCjzlJth3IxogbLp1vxHa34AlDEI3CIa1cpkhK0jhyh5akLSpCngvYy2XcuJ2U6clE4RKY4rY6WTuL44LaZtnXQHKnmuwIVb9cGBBaq2NlfXY+pExkMxwODfovKdL16/ZOsYkg+lddwvZ8wJ3o8y3DAbGKuo9q10Mc26eeT/QAemGs/V4f8dqtSm+cKlDe2+xWM+5cf0lzUUu0D89dq9rgOfRXZCPFPAY6GSIEFI/4nom3mF3yV6wKMPldUgoNCAc60rOgvGqMbDrR1JGhq5DC0Mie8cCG7J4qTIt/Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(316002)(956004)(2616005)(16576012)(52116002)(6486002)(66556008)(66476007)(4744005)(66946007)(5660300002)(8676002)(83380400001)(8936002)(31686004)(31696002)(86362001)(16526019)(2906002)(186003)(478600001)(54906003)(26005)(4326008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnlZdjRtUExxR2toam52azBHQUVvV3RTS1BhQmVNSm05NXV1bTF1aGVwMWJK?=
 =?utf-8?B?ZDYva3hyM052RDJvMDlZMGZjRHdjVGNWbVE4S0dmVGpJbkFkQS94cWZDQ25F?=
 =?utf-8?B?ZnlFSlZCZ251blZTNWZDa1NoYlpyeE5FNXpCVi9NWjI0QTBoemg3ajdMcHhi?=
 =?utf-8?B?YldaV21pUlIrZStzY2JQKzk4WnFKUGZvWnVCaHhFUWRtZmZVNktmdEwxQWpG?=
 =?utf-8?B?aTJGZmZ6NTBBRk1ncTkrUjFXL0g2bVRieU9FL2didzFoRE9sdVBmRUJOczFP?=
 =?utf-8?B?WmlCc1drY1pWUG9ZNkxDNFBoRlBnMmVMeXNJYVoyQ1JOY3JzK05EbU1la3kx?=
 =?utf-8?B?cmVKZXVNNXlpZ0Z0S21VbEJrRC9ncGkrQTVjTlI2dUlzNFAvUm40cFRjc05p?=
 =?utf-8?B?enIrTWNZWWkvOCtxaGpyOGxCUGhrMis3WDZGUllvb0Qrbk4yeTJFMllFSmFh?=
 =?utf-8?B?Vy9wK3lITXVQalQvZ1lqSVplRUxhTFVIaXJYSjI5ZWE1YzBieFZ3dDBNU0gx?=
 =?utf-8?B?TjZObEVJN1FhNjRCOHllQXh2NkpTeDZTYVpkK09uRWxNU044WXJhZFM2U05o?=
 =?utf-8?B?TitDbWF0YjB2dys4aWtadjdVNEgrNEJXL01jcVk3V1V1NCticlgyNmdpRzFM?=
 =?utf-8?B?djhqNzJKUm85NndBeTR5cXNJNkhFMHVNSjBnSHhYVWg3MTZseW0wWGRPVFg5?=
 =?utf-8?B?Ky9hWnZrUExabTBiR2pPM00vNExlcW5DVjIxdXZ4cEpkekZZa2JSelYxR3dr?=
 =?utf-8?B?QXFlcE81SjhoMWsxRFl2UERtWG1NcFZ0WE1KeTAyamNwdlZPc0lPd1dleitM?=
 =?utf-8?B?b2ZxTVRndi91MSszd0dteHZkZzFzNHJaNmRmYTFKT0tldUZlbzVvN3ROK3RL?=
 =?utf-8?B?bERZYnE2QktMSXpLQzFESGs2bmFCKzlJOU1BOGExUmM0Z1BSUGJHb2x5RWht?=
 =?utf-8?B?WGNFb0FFT3Bvd0lTRUlZNSttam51VnI2V3VNZUFpVHl1TTFiMGhLWllFMVlv?=
 =?utf-8?B?UHVzaU1xRDNSKys0ak9HWDh5cCtCNGc4cXNoaHp3cXNOL2FQNkZZNHcvWnA4?=
 =?utf-8?B?cVN1L2UvbEkxM2FaZ1g0NEZ1Q0kzWDZnRnN4OWR5Y09XdmJ0VVNKalUzclhs?=
 =?utf-8?B?emlPZ3lEUFViYXQrR1lFYWdVYyt3ZW81Z0FjY2NyYlI0cEI5VHJBZk11K1Yz?=
 =?utf-8?B?bHZmN0FXMDFZVUYwSHlWMi9udit2OFhoYzdCaEVhZEtVczdneC90VVQrSDVp?=
 =?utf-8?B?NmZvdndNczVaUTRWUEpWSndGMk5hcGxvdHh1N0NNT2hPMm81ZnRBRzNZQU9F?=
 =?utf-8?B?Rmc0bXFHN2NMeElCK2c4QzdsaTZJRVd5elFvR0trNTdDOWdPTEVHcGtwaGJJ?=
 =?utf-8?B?ZXJ4b29semlWbUVnYzg2cU5ITlRVUG5FRThZcHFQK0l0eW9yazlpc3djWFJH?=
 =?utf-8?B?QnB5bDRLcXdSSUY1OVFlSzFBdTFJa3hYWWc5blRvejNBMWp2WWNySXR2ZEcv?=
 =?utf-8?B?UHRuR1FsNHBiOVBWUCtLZ1J3bVRublJtMytxZUowWkNyRG5HVENPMjJIQ3Ji?=
 =?utf-8?B?N1UyeDlxSm5odEhHRTZibm1DTUpER3plZS9mWG96bXJNNVRtUGxvRlV1MUE3?=
 =?utf-8?B?SFc4QmNUTDFNNEdBN2o2Vjd5Tk44M3Z5d2hsdHp0YzhnVWJKNEVDVFlFbS93?=
 =?utf-8?B?M3ppQWlZTzJWSDh3R3dXLzcvc0xOaGRmUy9nNThIbklzMDRoZEJiamRKZGJo?=
 =?utf-8?Q?7T1kD2cwyQKZM3J3/tC4gqZOtYZpXMiF86UpN9D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43df77c4-dfb0-4f88-f872-08d8e7c9b737
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:48:02.2909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dVI5RoJ62Ocfu8QpZlflFBl0Fv41/Ic8TTUy/OrHZGR0PhPFz1TLxtBX2Pkv5svyjjBAtM4WtpqauyxN7LqOxrMAoL1oTaXOHOf9vna64o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.7.118;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.03.2021 09:06, Roman Kagan wrote:
> Use nbd_client_connecting_wait uniformly all over the block/nbd.c.
> 
> While at this, drop the redundant check for nbd_client_connecting_wait
> in reconnect_delay_timer_init, as all its callsites do this check too.
> 
> Signed-off-by: Roman Kagan<rvkagan@yandex-team.ru>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

