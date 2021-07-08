Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946AE3BF6AD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:02:02 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Oyv-0002CZ-8O
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1Oxl-000193-T3; Thu, 08 Jul 2021 04:00:50 -0400
Received: from mail-eopbgr10119.outbound.protection.outlook.com
 ([40.107.1.119]:13538 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1Oxi-0002sd-Sr; Thu, 08 Jul 2021 04:00:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvND0sGqW5jJA5C/Jh9RPmSE16mQviZpWRL/WFp4iwxxrldP0VMHRooeInzMHVoUVUr0BrObNHmv+XGDHVCX8+2xf9i8Eu5OFBibc4gaBKKqih1NjKaiH6QvxrrLzbY2F/iJdmDW9x1lWZOE9jU4deLOWA7SLdT10yw1MMgIQidpNTCHjze0VWOkeNaIYKKdvFpsJ6HsuEZ7lovqczlc+JyxaFWpiijQ08T1b2UFSBfchwpugTvrPwlafAvmFTVxJuyayxuRiFt4muQKCjWufN9F57fCg7Dj0N1oz1R8V84aHt2KCkHwUoylC80uzZ4zB2FA8WOcb0xMlEqxZWDkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkfH0lP+17xbzarhZyetpwfMLdREVfGmb/5wufrYPhM=;
 b=ELfzLqc/Fd8JHkxK4+4MX+1emI7yYpHJoQOzjJNtm5GVTKcZE05fZq0N14kHMx4f5UtwgDlv81dArQ1xMTXT2jpJNTIylelVhNzGT4Bd6wKVSCWuMWM3oEYzqidYCaWdAnKctG0dwMXuZ+FrDfQ481mJwgsHluaK8AyU/pS3wrYzBDtwPmkoXt5GjkNkwMbD+vp+sv16Oc01DOB62gW71SBwPpV7khRDQeaMInxM7d9Lj5rcygMKhD6N20LnyS8anAgqVaE8PNy41230iJI9bVSYXIy7kXJrb9AspwBvKSvs1Cv4R9rtou532K17VLFxvYJ8+n8XZcF+/sipdzG/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkfH0lP+17xbzarhZyetpwfMLdREVfGmb/5wufrYPhM=;
 b=QWcmtIjvUuA2yxyEy26lUmFafO2Pf+anAoQLyKwGp/QBfV01CCduT48M0TNZ4jHijozZOGfwW96frmq9b9ORvrCNyProUo+/NSWQAKrGzx3OEf68N/xj+IWbKtiNBTl5I2/m08KVFHha7rm/rBtTPsRGH5FH0x7XS61Fhwg141w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 08:00:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Thu, 8 Jul 2021
 08:00:43 +0000
Subject: Re: [PATCH v3 3/2] qemu-img: Reword 'qemu-img map --output=json' docs
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, nsoffer@redhat.com, mreitz@redhat.com,
 armbru@redhat.com, qemu-block@nongnu.org
References: <20210701190655.2131223-1-eblake@redhat.com>
 <20210707184125.2551140-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f0f011a3-3344-cfa8-917c-78492737d8ec@virtuozzo.com>
Date: Thu, 8 Jul 2021 11:00:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707184125.2551140-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Thu, 8 Jul 2021 08:00:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78de7e97-ee30-4514-c287-08d941e67be9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB533475B6D32547ADFE925596C1199@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/WnnZTh25cJr2z7idY4vJsPItXb7HuyPHrgAczfzMYPZNepn+bVH8/MRZbh6NEOwTyTH4eHoKzgMzCL7dykhcolWLR/2aPyWEKwfPXtiuB7WlsRrHmta/LgBgz0mmge3RPOL1M4fqoSFtylny1SkIF1zrudqMPent3WLukxL5kQ7MgoGzPMDpNDND1p6/XXHrNsuFeiSyWxrUUBdyqg4tSkdxx5ksDwlOzJLlVWG7JKz9HZInSDioeMHXh8ZvY+OvhKE6dLOC5XMddfCw8PKYnEzpPAqn+ExjVBJsS6QgYohOlKrb9qhOsihFU6/mMM32AtbIwk1rxrAKEv/Ps8KtTaTDDh4derjBU5e6WAQ6hM/6/4IfhH6cyQmvREoS04OzjZFVAvuXdpr9B21hA1KJLuL9+Edq1FigQoR5l+Sqqa5jca5ODQy2MI+iizGYvGC2i9b6GKWyku7/G0t5E9K3LLtXDR7ZXmK21CF7vqt4xC0ploq1A2RS9f5aHjlU9cEeqMr6RNEQsnZr6BP8u8WcIFBrg2JtTW6/4T9ljvUBbdCGYytWYE/3uk8SDP/uLbaSkkprjLwLL5tv+t9rO4GfeXVh6sTxVw56VueiTec9jvvtKlNjDNe6vfksSbAUv38kRTperCxGRiUNQk10s5IkNdtCFZAVDBDVsudemgOfVmM82Z1a4BeI11wql3d5fhsQ1sGy0HQHAHeUciXOgO/5YC3APmHTL6DayufVeeqV5qqJl9BKXNKZVVfCEB3k7LIO97aVzGaz8Cx4i+iB8VUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39830400003)(346002)(136003)(376002)(366004)(316002)(2616005)(66476007)(38100700002)(478600001)(4744005)(5660300002)(86362001)(186003)(8676002)(8936002)(38350700002)(66946007)(956004)(66556008)(31696002)(31686004)(16576012)(26005)(6486002)(4326008)(36756003)(52116002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y09XWEhqUlF4eHJuMVlSR2xudW9GV0lyVHkrcFJDNndNNXdZK24xenVkVDVr?=
 =?utf-8?B?Mkl1dXFJT2VzSloyUXhxcW4yQ1hudzJjTHVwVEkyYjVEMjA3YXlkRmYrWEMr?=
 =?utf-8?B?Wk9qMW5IZDVxNW1XNEhsMWZSQ0hnUm9FR08vVVZwalhielE0citYc3RJeW14?=
 =?utf-8?B?OXBoQ21vZk85NVhUNW1mT1VoV1lVSDIvV21haTZybk5IeGYwUDRuWngyVEtn?=
 =?utf-8?B?dndPelB5bUw0dnRkVUZjZXZYcHRrRndoUlJ4UDMweDRCT0ZtT0pIai9sRFQx?=
 =?utf-8?B?aCt1OG0wQTlsamp0YkZMMk05WjRYcmlXaWxYY29VRmpYNURYTFJxNHpFNWdh?=
 =?utf-8?B?by9QdW1iUHpLVHB2alR6amkwdEtHTzVQZ2YyU2F3L3BWTGV1VGZIOFVTNUg1?=
 =?utf-8?B?UWJRNnkzdWkrZXF1eTdwMzdEaHFlajdHUEhLYUtSN2ViT1NkRng1b0lvUk11?=
 =?utf-8?B?Y04wRXRrQ291NnYzUktlS2hlSlJtSjQyQXFkZENpVGhXM2Z6VVg2TVRadVd5?=
 =?utf-8?B?d1dxUFd2dGpDdldhTG5WZzdjNG1OendmNnFWbWFxUDlVR1pKZFlxWmFDMG1Q?=
 =?utf-8?B?RVZWZU1WMmJMaWJWZzJ3TWpMNmxSeXBzc2hlZllYOG5wSlpYT0hkR3lUU01C?=
 =?utf-8?B?K08yV000RTVGNUpyaHdqYUlYNDBrTm1XWURhY0JxY2JEcHFKTUhpeXhyWi9j?=
 =?utf-8?B?VE85QTNVMlZmTmMyYlVrbTZWQTMyVlZaUFJHbkZCT25WZTVHVmd0Tkd2SWJW?=
 =?utf-8?B?U2VqdVc1cVptOGo5c3ZBTTdnZ0lzQVdGSnFuUUtRK2ZPeklFSWlqZVZWYTBO?=
 =?utf-8?B?T2htNDZLWk45SVNhaGZ2bkdWSHgyQnZwSTU5b1k5a2tYWkhwaFVWaTk5K1Uy?=
 =?utf-8?B?c2t6NEpwd21KSWJna0t2SXU3R0hyMEdvVzcveVlrT2gvMjBOYnJKbHR1VUpy?=
 =?utf-8?B?VlFUUzBvQlNlc2F2N2xXQ1lUSlE3SDM5N2k2ZkIvOGN3RExrcS9KQmdRQXlz?=
 =?utf-8?B?VGhXekU4N1BsTmNUR1NEb2svRW9MUVBsUW8xR2FxSzY4SHJXZTMwV3phK0RC?=
 =?utf-8?B?Q3NrcXduUzF6M2dQNW5FL1JBT0dEZENrWU50OUtOT1Z3c1NSWktQUlFmZDBX?=
 =?utf-8?B?d2VSMXlGVUNmeWZqekdWNzV3ejhKZ1NPUTB2d0cvc1prZHd0WXNROUlUVEpq?=
 =?utf-8?B?YlpDY2Q0VnVMeFhoNmM5U2NydW5hNE1BVDROM2YzbFA5NEo3OUV6bnIvSStB?=
 =?utf-8?B?cHh6M3BlMmdQTTZyOG5yODBvajkwNytmRUU4YVBPUkY1cjEwSGJRZWxRblUz?=
 =?utf-8?B?b2QxZ3owNVZGZXI1WmxFQS9JdlhHcEZiMGN0MmlraTZsb0hlOURDMy9jTjVE?=
 =?utf-8?B?YXg2a3RIVUxJVFRaUlVwUUd3S0JjUEJrZG5Fak5BR040Q1dlakR2NTJCQ2RK?=
 =?utf-8?B?R2lFcldZSmVsL1NWMXFUZGhuTkxkWkZ5L0xLdlhock9UYVdhTGF0ZHZ4R3Bj?=
 =?utf-8?B?QTAvNC9ySGsrc2tHbUY0QzlRWHdqZjZvYm1hTDBmeTJsMVV0MmxvQ2dWdEtS?=
 =?utf-8?B?NDMwemxvZ2RWa0VScG5hcGZSSjVtL2FCVFJsNk91RVZyZGtHU2JMeHpUbDNI?=
 =?utf-8?B?T0RMZ2t0TS9MZlF2dU9jMzFKRk9YZ1NGRmc5enZUMyt3aFpWUFpKQ1FsTzRt?=
 =?utf-8?B?Y1h2TmRVOFBwTzZ4WmdsbnF3a0d5M040YmpDVjBDTFFzbUxiVTIvK2dlMDNu?=
 =?utf-8?Q?3bYuLN2afG4XXuvwmO8FTHCT6A23kpWP1+XzUBD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78de7e97-ee30-4514-c287-08d941e67be9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 08:00:42.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czwjUvrsEPlh9s84gRO6+qLMXwAcFPlxVRSmtS2rwIwf+nvCJLzdUUQciyfhiKxKsEz229BGlMXLL7k870SRZdugKGVdNU+ydOLHV1HXAR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

07.07.2021 21:41, Eric Blake wrote:
> Reword the paragraphs to list the JSON key first, rather than in the
> middle of prose.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Eric Blake<eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

