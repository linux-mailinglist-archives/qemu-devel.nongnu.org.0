Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B632034EE1C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:44:20 +0200 (CEST)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHTX-0000hH-Hs
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHSN-0008Dh-0X; Tue, 30 Mar 2021 12:43:07 -0400
Received: from mail-eopbgr40123.outbound.protection.outlook.com
 ([40.107.4.123]:56021 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRHSK-0004Ks-17; Tue, 30 Mar 2021 12:43:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPfhoZWX1OU0I6xBHluNgsjzojO/UJZZSCWZEmzftQM9Fu8AWswak5wEYgh9ecZi6Yu0bG4bMwg+js110JfuwWazbbOo85Yh2uIc5tcZxmUmf+qeC6OTcoTMoEnCDlr7IYKF+5ngdlG0aiSPe4yefSTBYvS1Z+uVP7EsJl5VPbLLl8/dsbze4MFnnXlqpJYQMLYEBNjG3R7CpTxnHwUnDE2yVnzu1KdZAwfutRhTDeuNoQKwhGdPtqnuNx1EddzSTXJZQuDUHCdSKZ+TYMVDxfI8eudEV2oUSU8S9x8Vp6loiYv3sEmmduRYzGZOdYIpzc/aFFT6PeqKG3JhWw07kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+RsuBXmEdm4yWworihw9Fo5hQ6TsPKFWlsQVmwC6lU=;
 b=T9EdSlUiGrvS82Dpm+ArG1KjLbOEy6dyEnnNfU5ws/az6JIVhPnwRQ2WBPQdglAWHqUxMAeYgbyaxck0gMNwrNYas9Au7LEC2BRgZLO4Ugm2/1bZTbrc0xozLV/fU9mOUNxeMjkNXpzqNvkXtipx+bKUG35x0TAdnhC9T9ZBGJaMmnIOkr6S4i6BSoJBLDXKe9RvwxPkJ8iqY8EIY4IQBM6eCXi+4kxN7oP2PjGWBLSqzRdj/UJ6FuavgpfJXvhnZ0B4LTq6miI1a378b7+JiOo0vAXud9VOrWKhO4xNA3seHRkIsWnT90gYuWh0QWrUai+7j4O6XRErjGshKbzopw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+RsuBXmEdm4yWworihw9Fo5hQ6TsPKFWlsQVmwC6lU=;
 b=vG+FKYnR3dpueyCR7RargXb1JayqoQufqYAtVJOz7k4+pgbnoSfYft2ffplDfy4Mm1zDTAEaZaTa5EpEq7EAqCK4YnmLPcc7I+KZ8punCRfp16aro+KE4dGn+3vV03l4Pl/S+NzYRJKmzM57T+SSIdW6nLk+6b2zoBQcR8lKSMM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 16:43:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 16:43:00 +0000
Subject: Re: [PATCH 1/4] iotests/297: Drop 169 and 199 from the skip list
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210329132632.68901-1-mreitz@redhat.com>
 <20210329132632.68901-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8532b5c1-367f-d536-1a9f-01fbbc6dbba0@virtuozzo.com>
Date: Tue, 30 Mar 2021 19:42:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210329132632.68901-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM9P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM9P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Tue, 30 Mar 2021 16:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 039cd838-7e44-490a-2669-08d8f39ae186
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-Microsoft-Antispam-PRVS: <AM7PR08MB54482EA6DA69F7BBF9027793C17D9@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPhJLRcZTXihOW/9Vm1r1edlRw+qGgR4z9pPuhQAoaP/DbZ8fb+xSgdk/0rpD7WWkgF4q6MdQphl+Li/sxf2HFUSo+A9XKUtOdz0GTdTOPAVFpnmyUEvWve7JybTiLxFUXkUHaPz/lEiqtL29LmJqNN/YtpW1CB4x9g9vp1a2sH5UfE4gVF/0acuTzNNvSOm3U3bZTCENSRaBjjdYLZua/RPm3k0EpWQgDpAuZ1aEMJbzM4EllH+3rChE8Hl+EezW7rF9CtxB51RA7goM4m4gcdeh6hyZ6JXbjPVlawzgtjLhcb/iFCbD2eV45+AS7pLnbGE0vZRdW0we/tDRszAZLEMq0k15bY/sM6c5w4hEtid7r9p0mIzJM2AkaDOpBnTybsv10GI9LXPjX9gpefUHY1NlBJ4WXOTwpLsW0tP+0ECBkmSgFGyzrY220vBuefKmFwfFGpy5J6EoOt9dc8Gn8FDuOMzRphuomjAdsksvjt0YmX8Me4x4lBXgB2izAAXjnDqPO43cS2v3bNjVNjdyLyFkvEOGYsD2VPqC7Au8562dHAeifbfeAuoI073BHBQp8qPAvZOe7vrj+y+v+Fe0sODjulYdRmaOH9JvTpqnvycCr7Sz9d0SJomedgu9MjaUai946dyuPPTJw4L+YF93wnN8vZqlQJ4KFr2elcWzXGkveK//ZCvcCjiP5P2FBIC/KyWFF/ZlxOz5y/UbBKnkLkoh3Kcf2XHMt6Oz896t2c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39840400004)(376002)(346002)(31696002)(52116002)(36756003)(4744005)(66946007)(66556008)(16526019)(2906002)(316002)(956004)(8936002)(38100700001)(66476007)(16576012)(4326008)(478600001)(2616005)(31686004)(6486002)(8676002)(86362001)(26005)(186003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTRudTRMWGpkRVl6dG53NGVaMHc2cXpqeE9HYnlFREsvbDRLUVJzVXJ0UWNE?=
 =?utf-8?B?ZklPZTFJNCtRai93eHhSUG1CTnM3MkFKSW5aZXZpRUdPTW5MU1lCeW15d1RC?=
 =?utf-8?B?NzNoZFhSaUNHUzNCT2hxSU1WVlA0V2duWXhYQ1MwUHF2VnVKR2tFREtzdFU3?=
 =?utf-8?B?UkMwTUtWKzJabXI1K1dzS2xkTVRnKzBEd3c3MlNubk1FVW52MkRha1Z2WDZM?=
 =?utf-8?B?Umh5b0hobDNMV3BVWVUybVNuMXhKcU1XNzRmam5DbWVCVGlLMGZGWUZneEpW?=
 =?utf-8?B?bGRoZEl3NE1ybTcxUDNHaFpBSzVENEZmaEJIdW1WQUhiVjNmR3duWW5CaVdR?=
 =?utf-8?B?RUxRRHJoUjZZb1IydTA2WTVhVFlkdER0YnBMa0RXYW1NWnhkdzhuUGtDVVNl?=
 =?utf-8?B?WjRwMlpjY0o4d2FxZ3ZCV3Q1ekFldDBKMHErcFk1cjVjU1R1bGhNSU9yeTll?=
 =?utf-8?B?VTVzemNyYjF0S0txSGFqcTdrZXJibit6TFNHVEl6dnhWYm1Mckh2VmxjbnZU?=
 =?utf-8?B?bzI1Nk5wTEVseHBDNlR2Qis4SUhlYWVVUVVaeVFqU1FqYXhTSE9SQzc1clZL?=
 =?utf-8?B?Z3N1SnZTUERlTWRGUkpXWGgwSjZVRnBUYTFDVjB0NWhzK0duS1plZzc2bEFC?=
 =?utf-8?B?bHdCS3BJSmIxZG9CUDUvcDB3WitpQWkyWG5mcnNTVHBsZTl4SjZKWUFFNlJx?=
 =?utf-8?B?V1BFSHkxbTRPRGdZS2htOWJObCt4Tzk0bTlFMHZxSlcxQXFzY3pRNldBRnR2?=
 =?utf-8?B?UWtKK2pRZUd6Ukc5Vk1wQWtScEtSanNoNU1zb0hPV2JvQlVCQlMxTnliTlQ1?=
 =?utf-8?B?ZHl2MTNEL0hSYUsyTVR1MFBqRTZ2ZW5lc3dRdXNLZHdHSG0vZWNIMVUwa2ZT?=
 =?utf-8?B?NVFIRllSUExaSTJ0bHQwU3ZUb3djWEVmUGc5Z2RtNTVoUXhZOWQ1YktFV25Z?=
 =?utf-8?B?ZTFyMjBmK2VzTG1hVVppaVExSzhLV1lFTk9IOEsrcksrdkRIUHhCZVBrV2RU?=
 =?utf-8?B?WkRxL0JveERwNmlKeVFocVU3Y0tNYXh6OVU5M2QxNXhCSjR5cWlKeGFOTmxp?=
 =?utf-8?B?STJmT2xhbWxNZmJHWDJ0TWNlS0FpV3FTa3UrNk9PelB5TDcvZEpCNlZUVWpS?=
 =?utf-8?B?MjBDaDNyTTRQZDR4OHRnY0pxWEVNVHBGY0hVQWZubktrUjFCWGdCZVNlc3pL?=
 =?utf-8?B?UnFFeWNTRXZuUERNL01mY0srNzRSejltTFpaOHdUb0xFdnh3TVRna3pHR1hi?=
 =?utf-8?B?NjFqVS9YU0U1MjZERTQwZnRBRFhQOXZSejFiTEpEU2kxa1dWU0NTYncweHdS?=
 =?utf-8?B?T1dwVHlWOFF3NkpNVHJadzlRK3FiR0UxZWdGR3d4dXVydUpYVUF0VW1SamU4?=
 =?utf-8?B?Nkl0S0xEQi9DK1A2YXlWZVMvTGFESGlpQW5INmp6d09RTFFwZllLMG1HR0ly?=
 =?utf-8?B?SisxWFd2bkxhN09HVkVKZTdqc2xCZnpqUEFvdkNYR05hL0VkZ1JxVTdXbVpj?=
 =?utf-8?B?L1JGbzN0RTRnaWRYM2JNYjhDOG9xMDlUZ3FjdCs3TlNrY2FXZlZaNDFIYldD?=
 =?utf-8?B?QVpkUDFBQld3WVFzcGMwdW1zeXUwd1VYVkdON2FaREU3L3VJeWxTakRQR1g3?=
 =?utf-8?B?ZG55RXdRWEJ5T3ZpWG1uQjRqWkx2T0g3amwzcWpMaVROWFdWaHdBWGM2bXRn?=
 =?utf-8?B?NGp2TlRmWU16N0hmdHdhM3JuOTlwREN5NExnVVdZUXgvVUkzLzFKQnRVOGNV?=
 =?utf-8?Q?Ssl2Wty2/5ARPIWCxWg5Xa+V1UK6LuPqhtN2xar?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039cd838-7e44-490a-2669-08d8f39ae186
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 16:43:00.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoZ8naS6euSsCo5Cinmvw818cAuZ/SNlYBmLCOzAkQNmjnA1BT9Wd+L5q7CN+BEO9De1bHwAdbR2Gy6wH6ys/znyuYTUxVT/+9TMvJ14X1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
Received-SPF: pass client-ip=40.107.4.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

29.03.2021 16:26, Max Reitz wrote:
> 169 and 199 have been renamed and moved to tests/ (commit a44be0334be:
> "iotests: rename and move 169 and 199 tests"), so we can drop them from
> the skip list.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

