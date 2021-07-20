Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D53CFC11
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:26:25 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qhU-0000jL-DB
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5qfQ-0006l0-09; Tue, 20 Jul 2021 10:24:16 -0400
Received: from mail-am6eur05on2117.outbound.protection.outlook.com
 ([40.107.22.117]:45024 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5qfO-00036q-4h; Tue, 20 Jul 2021 10:24:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRSJWxM+m8dAPStP8qtpq3MbIhx5yn+Qmza8MW0KTIrRU55YJmlEgdPgjPgNh8csyTSaVbppbvnA6ik84RWDfSeWCS+yO1wrFLs3FIodKYHOGKluGJ7zYBUIqA2l1zi6aJ++qPKDczUlVVv217Ja8kqqCaiYc/9jPcAZbYyUUyxR0yDbzbGk3wB/tVh0OK8jBPNeMxltQg6l8I++FXhw3f6ZxloYXvHUqSzpT0nYO58pR5Up1gQcOtF29hidJYqCy6Jt9dTFViPTq9UIznUZJjPW7g7Tt6Tuv11zy3C0OOChmLChqeUP1uCvYaAln42gUjniY+Vx2GyYoUO12CzelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft0/6HIYTcxgghQB1LACiqPK4HXxYEvEAP6SfxajpoA=;
 b=OIL0xgp7vBnd8pFkKW8WTAWcP7AdQg7JFEVVn2M+eJeYSsw3EqGrqTQ31mWL7CQSrJfHtA/Lgw+DdgxTPD3vIy4TJguSCyc8RGgjiSKoIfDZeYBEDTuy7Gp9boN+YS5ShPPDSX/FvsfmSrWNTsLiri01nwoMBhd3Lb2WXS8OzY2frVRo2VRqdMoPQJ4EK1wRAWm5TfIXWzGv/16VxOL5Az3rBRcJM3kq8UU6GSLNYlAUhxxp7B/k2m/MjypHOCxh+hQ96y2rVbMcb8LOsUYjTIcyKZs+2OmcOcuhpfOrZB5gb9nvUHOutjkG7jzpQsza+eoK1ilxm6t9a1Q27qKrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft0/6HIYTcxgghQB1LACiqPK4HXxYEvEAP6SfxajpoA=;
 b=oxLvKHRK7ASJ9bxhv6RSlCBoCShh+EwRh35OIse+mhHuFbQswHF7w6seHN8qQQhMaQnMqyh7ax31E6bS5YOKRyWeVhPE3Yies35VUSXPFJ8D2nHrQmPj+pbGhKLchM/roRDFUKiw4Ht3s6ZE+USI3E95ycCzahkK8Wy1JDvDC0M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5253.eurprd08.prod.outlook.com (2603:10a6:20b:ec::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 14:24:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:24:11 +0000
Subject: Re: [PATCH] block: drop BLK_PERM_GRAPH_MOD
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 eblake@redhat.com, armbru@redhat.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
References: <20210720142229.763742-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7e04a12e-763a-9933-9add-20d8bfed6fa5@virtuozzo.com>
Date: Tue, 20 Jul 2021 17:24:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720142229.763742-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0110.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.140] (31.173.85.199) by
 AM0PR02CA0110.eurprd02.prod.outlook.com (2603:10a6:20b:28c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.24 via Frontend Transport; Tue, 20 Jul 2021 14:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 793f4ed4-798f-4f49-1589-08d94b8a0b3a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5253:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5253A08FB871B89CB8F53078C1E29@AM6PR08MB5253.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkyN1CRk4+ZgkVR/WjIIZoiFbihBXQidpg6/7oIlR07LHmCSwBh4JrhGE+RN01GPcHxwENSb6nPvkid0R5e5z5/Of5ofXNitiqYZDCy1Ek6nj0/dyFaYemx/wcB5TqBKty/TmShfaSyyfi5mms8pIS+uDCQTDvndMttZZjG8Ebof5YXPUCajRyNYkA5VbGBU2ZLQ936DMcTxzNESEdsHJwRR6HGMAAhTZYHFXLta5Tm1RcHKJ+emjB/rZM3wf5gU3EObXks2ZIIdSW99JxNaKRRBm97yVXL7lmAgpsLmxc6/0bwjszqFYuXI8VDqEts605hLIo6NkeQij/JjCLCG0A+sMKfBCpSTrjZ4TQOyELvhbT5RDl7YQk4GysyhjKB5G/EMTLI3w1licuulae+IB5BZFJl5Pmjfz1MEG9Ypc89CimW1BqiAHsmbc5CQAisfBbchA1nQsVmRL7pl6GHaHAe0xJRGZ7yHtYCFXVDVxmKFi6TzSJ2Q6nvxyFhp7BKslSHaelFRuoj2BDEGLonL9sKJQB6tbOB7L3j15Zf5+9FE3oViyLPege3STeai0mBYMPrgklZiyKwuogBqO5sDlDLGOEQYMZtzdKNQnegp0oujIDiWjHfIEFxz6AP4rFK32yzJ8lxwwZaN8Mu4dGkdqz8jrZDE0RbdHlQwaNFqZZlDnQGTsxxVXuRkzffb3tR76Uzf2v0CtmN01OJR1mWjRbUqzEohUYBeYzPTZUiC2dHIU1ez7MB7VYpOAaGw3tNmbSUlihww1dgVnNBld5ZY7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39830400003)(396003)(8676002)(5660300002)(6916009)(31696002)(8936002)(2906002)(186003)(83380400001)(6486002)(956004)(38100700002)(66946007)(66556008)(2616005)(26005)(66476007)(316002)(16576012)(4326008)(38350700002)(86362001)(36756003)(478600001)(31686004)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmw2M0JkNlpOekJycnhYbVRRWDNnVWFVVmJJT1FXUE5US0ZOZlhwNnd1VHVI?=
 =?utf-8?B?V0kyRXZzTkQyVlYwN0g2NkhuT1JxK1VLMXpaWllWODF1VUxvNFdCQlVyZFVu?=
 =?utf-8?B?d1U5MmVVUjZ3bTdoUjI3a0FyZTgrYksrMmFCNlFpSWt4eXJKdVpDQWxOcks1?=
 =?utf-8?B?QVpua0hncXZJUjN6WmxGMS9CeEN2RnM1K09NdThXS0U2Q2FkZldRM091Ukxj?=
 =?utf-8?B?ZGpyb0RSeXYwQW9nTEw1REpEVmYraUF6d1dLMGFZMVl2YjBxZHlOZWZaLzJN?=
 =?utf-8?B?ckwyTklhelpqeStJU3ZsOXl4d2tYMzAxY2Z1NWhaUFlaUnIyS0hEMWVWZDBH?=
 =?utf-8?B?UUEyNEUzWFA5VjRVOGJlbmdCd0lVZzZUQ1pUbDdrOWJJM1B2cW1lS0RaUlZD?=
 =?utf-8?B?Y2tObVVsOHBzN01acU5XR3d1M21GNWpXSE9nYUNqM25sNjRCL3c3aDJUVFBx?=
 =?utf-8?B?b28xdnRma0dYWk5LNjRlRTBZcklQbGZSY21zMFhVR1RRMGNGZlRPREphOFY1?=
 =?utf-8?B?WTNSdlo3YmEwamRWUWpTeVZROFBIZEZNR284N0d5cDVPVkRaMnNYMGl2QS8x?=
 =?utf-8?B?bmFRa25WRDk1MHdWNWlQdnZZbllScXRGaExSK2RQbkhOZzZuT1FMMWg5Wi9r?=
 =?utf-8?B?WHcwK0FlVVFqOE9OWWU1QU4yM2hoZkNWN09NS1pLTHRTbVdMa296ZHJUOFhz?=
 =?utf-8?B?WjNYdDJNRHRLb0t3ZUlOWGZ1S1l2bTZ6WGRoU1NVZ0V0bTdzM0ZUdkl1Umd3?=
 =?utf-8?B?bmpqa2ZuMkRsdi9WR2dmcWs0bTZZMUpmVDNSakoraWUvbHY1TTl6VWpRZ054?=
 =?utf-8?B?bDRyNVZ0ZTF2QWQ3dmgrbnJMbk93dnMycXg5eEoxQWtMT2I1dW9RQkwrcXQx?=
 =?utf-8?B?ZjM4OWhXRWNJb081WXBKZW8ycFJlTWZpNldIRC9TV0lZRXZVRkdlMGQ2Mit1?=
 =?utf-8?B?S1lxS0xvTGNzYUkva3RxK1RXN01oNnV1UXNaVGRiTDIxNEJKTzFrcnljQU1j?=
 =?utf-8?B?a1p1aFRsa21nOVZRY1FaN0FpV2hsQURTVFl5ZGN5WnZCS1F0NzFraDY1SUFM?=
 =?utf-8?B?QWpaVmlwUEMyRlFIK3Zpc1U4S2QwYnlOUlBwanJrd0lLVmUzdmQ4b1pkS3Rv?=
 =?utf-8?B?bWlxa1pXTm16Tjd4RkR5SUFJcmhreE05VzhteDZFeTVIVU1tUjF6MW1uYWpa?=
 =?utf-8?B?bit3NjBTUndsbWlZSUlTWE9PbnNxWU9qUUs4OGorRTRmcVRWaWFocnByVkU1?=
 =?utf-8?B?b0hPTGQ1SytVL2s1a3MxQy9sQ1oyYjdoOXpFYldJWTF2Z2hRR1ZjRFpEcDhE?=
 =?utf-8?B?dldJVUs0UmRwaHRPZXZpNFd3b1U4NWQ2TEk0UHJBUmQwazkwMVAxNjNPMmN2?=
 =?utf-8?B?MlRSa0o2UHdEVk5CNnBUQ2hYb3dMeUt3QWNkRmxmZUIvdVdqM29TYjc4OXdJ?=
 =?utf-8?B?RnQ5MmhBbVh1aUtsVkt0K2l2akE1L3cxc041Z1dkWU9GRENQOGp6UEFrVXg4?=
 =?utf-8?B?R05ndlEzdzlvYjZBSkxNclBCT05WWjAzcHlXcGFheG1PY1NkbEJmeXptQ284?=
 =?utf-8?B?UFFGaHZ4K0NSMTBaR3FMMmE0Nm1HTUNkSDAyTjVuaWVNL3JHMVNRWXVQV0d1?=
 =?utf-8?B?bUlHS25LYkFGZ1ZqTXpzMXBOVENIdnpMbER6Z3NEcTd2b1dSMTZVZEhOYTly?=
 =?utf-8?B?R3AxTjJYbnM4MDVCOGJQeVNtL3RCRjdHVHpZRXZraml4RmdSaXRsditod2JM?=
 =?utf-8?Q?+hQM3CPzPt16XmzagXdOuTw2IxrbDm1X+h3Dh8O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793f4ed4-798f-4f49-1589-08d94b8a0b3a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 14:24:11.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trqYv1m8rX22wUvpn12pjsgCMiuAJvLpkCGV7qBjgoVkA6mVsY6wNLYQXns0EQnn0Z5svNkjtl9fI2w4BzjG2RJ6M9111GnY3KoR7GO1ep8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5253
Received-SPF: pass client-ip=40.107.22.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Forget to mention in subject: for-6.2

20.07.2021 17:22, Vladimir Sementsov-Ogievskiy wrote:
> First, this permission never protected node from being changed, as
> generic child-replacing functions don't check it.
> 
> Second, it's a strange thing: it presents a permission of parent node
> to change its child. But generally, children are replaced by different
> mechanisms, like jobs or qmp commands, not by nodes.
> 
> Graph-mod permission is hard to understand. All other permissions
> describe operations which done by parent node on it child: read, write,
> resize. Graph modification operations are something completely
> different.
> 
> The only place, where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
> perm) is mirror_start_job, for s->target. Still modern code should use
> bdrv_freeze_backing_chain() to protect from graph modification, if we
> don't do it somewhere it may be considered as a bug. So, it's a bit
> risky to drop GRAPH_MOD, and analyzing of possible loss of protection
> is hard. But one day we should do it, let's do it now.
> 
> One more bit of information is that locking corresponding byte in
> file-posix doesn't make sense at all.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

