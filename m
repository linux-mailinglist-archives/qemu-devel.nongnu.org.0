Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB23ADA0A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:44:36 +0200 (CEST)
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luaKx-0007H8-36
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luaJ7-0005wu-KH; Sat, 19 Jun 2021 08:42:41 -0400
Received: from mail-eopbgr80097.outbound.protection.outlook.com
 ([40.107.8.97]:55011 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1luaJ5-0004Xc-KQ; Sat, 19 Jun 2021 08:42:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXo7Rl9U/uALkPB0pQmEGOlTOzpdfCGsuLs6aAForrEnN7UAmaHI5MhR8Xl15ewsN7/lUllAM8LS/umjxDpwfa9Xf86KkPE1WC0oobuvcHWfVov3bHfiAkpgk37uWdMkz4ZBimyxa7aYmq5tqaqp+zu6DB11Ymir3QBfiQFBTCMDAcdzfBAXnagRGrf49BaDoOSvEqzz/qsKgqqk9LEXbjCJwI1SiLAo1eV6U7paPA9X3HkiUnHM5YHeIOrwB5wZHoTxJBuBzPc5p8JiDb41N+3WfF2H0Ou9T/VcAs47SiVDOLi6TbV4ayTBaQiN7r7lNExK2XjUdUVCdTxuvkBhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh1cud1ox+r+k8vpHMTn5Swi0L78eNQhwQMjdpOWyFE=;
 b=H9/jBigQB7c+mVJpNyV5gUrMG+qafikEdzmKqM0aJadt3PiahBFrRJb8jTeNEqc6gcBiQR7xY2yzfNCrNItnod8Kkt1PUzxoFUpJEcmCLkB4Hyu5dVtk6NnkG/Y+X+OOds4+f1/OdOJ6gjySrBxQnHlX7lgKR3pEww8hVqkGSA7RHcmBK+iAlxrK34KoIofX4D/PUUOBF1T+fdOcZRepXKkSXCNhPY90GGLvBGJwA0tFN0oeid9xZNEI58+sOZ6JCarPY9avJLCkkJvMxDJNOhkXCZl9AfzIGTjv6upXYvnmOYWx9vuKdmIvr+pO40nExGIw0SwN+ryxy+x4FHliTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh1cud1ox+r+k8vpHMTn5Swi0L78eNQhwQMjdpOWyFE=;
 b=NIXEcDLfm/aDsanFJmEIRqvFR3RfzsZdC9cracfhlQQsBZ2YmamQ7Xh+oQJoHQ82pwJOwM24Kop9OUgANNPDO22VcriJTs3Wo0bRiyOQ+XiILm9VWMdDTYV+GHr6QrG70k/hOyrn8Qn0I+FWJC5EzGz+ip9RjFajENv3ORdJIKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 12:42:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 12:42:36 +0000
Subject: Re: [PATCH v5 6/6] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614082931.24925-1-eesposit@redhat.com>
 <20210614082931.24925-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <60324df5-5772-af40-c6a1-b7737f253e1e@virtuozzo.com>
Date: Sat, 19 Jun 2021 15:42:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614082931.24925-7-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0374.eurprd05.prod.outlook.com
 (2603:10a6:7:94::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0374.eurprd05.prod.outlook.com (2603:10a6:7:94::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Sat, 19 Jun 2021 12:42:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8490e0f-1743-425d-ea26-08d9331fb73f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4279FCA0BF5B7526D3EEBC96C10C9@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiN8TeyyhTT/dynwD4mAVRemF7/eG4dTrEYM4N/rfO+oaCaqubwfTa1RIfsgZnnH+5aYzFYHEO+IqM83GFvbmd0MbdoKAJTO6Bnrx2IHPFjRAOqelS4+x083mbSScN/pdGY775qWicrNZ/NVqnl005KOyOQJDEAXLBRhj04WRvRgRoCT20YUU4Sv76ooRpWI0oHBo5mewaCHBDA3At3g8uwPKRB2uWwahGGC7wiJI49Cd/tWjb2fYHmCFp4gJ2EIUlru+k8yUPjAByWAEHwVn2k5dXw6ShQYBeyX4eO4eBtYdU2tYZaCVCYLCQ9bzzvFteQudHQH8HWDvL61AysWsf0TfbyYft+bWZNWIBSp76lqmXsZCn+QfuT0i7Y4sMUa98HXHDd/bBmUIHecn1N7YJvHjz4fz2aoCOzJt0XpFkBhahMc3Zks0t5bkPpK6WAFsD+NDtMzu1su/1CY6r9xs5C3XvADnZqjDRBAgTs7Hsecg9Q83U6PpaIjvOrh0nX8+T2eaYdTVdCETbhu4Op9C9jojvVOliBYHlB13X/1xAMIMWVJKt4rTUUc9L2xwxT62Th2/VsUt9jiKGtXcqVOctd+IgwfvXbazSvMYDGe8Yd1V76qvhplU4mwbja8boGyBpN2wzBSb+vG6SZSnvvKp0FJO2Oi1TTcnbh2dHwh2BdA6hlmDT6mSNT5cNHV65KKtKxiwxddwPu3ZYJOjVpYNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(366004)(346002)(376002)(136003)(2906002)(31686004)(66556008)(956004)(2616005)(66946007)(86362001)(36756003)(66476007)(8936002)(31696002)(83380400001)(54906003)(16576012)(316002)(8676002)(38100700002)(16526019)(186003)(26005)(38350700002)(4326008)(52116002)(5660300002)(478600001)(6486002)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Nubi9WL09DVDMxNmpPS3lSaHFzTUEvYlB5czl4UVp3NUhSeUY0MzJvSUc2?=
 =?utf-8?B?NGhLNGRvK3FxbW1vY2RMMmRjMmNoMUhITzJ6bU5GM3hBcHRFamJsZ3FyUkdY?=
 =?utf-8?B?eVlIdEJFbTJ2dzJzc1J6NjZmbG5aVUZsOTlTaTZ3eWYwYU5ZQ0FDMWszK3BM?=
 =?utf-8?B?OFI5cUl6MlBvdjBISGdFdVFDRFpnN2QzRDNNWEFJdGU3ZEdTaVk3QXJ1UXp4?=
 =?utf-8?B?V0E1dHNQcDRsWWJwYyt2STc2Ykt2VmsyKzVSSjlTOUF6VjFGejhRNDVaai9K?=
 =?utf-8?B?NEhOM0VlM1JQbFVveW0rb3VhT1BRQXJQNE5JTkVuNVQyRVlVeVRVdXJieTV3?=
 =?utf-8?B?OVJHSEdwVkFlTFdyZ3NLejhJVThKZlgvS1JMbmVCYzB3dTN5NjkrY0EyTWti?=
 =?utf-8?B?Q0JCYVptUnBBTndCV2R0c2RZVlV0NmZ6eXFrQS9MSS85SXNNa21Fajhnbytr?=
 =?utf-8?B?K2lJUWY0MHBIVTR0RGxqVHYrTkxwUjVuR1VmSVpNOHVtM0pJeUZEaFByeGNx?=
 =?utf-8?B?aHJtRlpYd2J2WXo0a1gyeWxhUVdvQmpKRzNmK1RUWTByQ2NaR2VtRXBFeDNV?=
 =?utf-8?B?eTIvNnM4bFdlNzhyaEg1Y2M5MTYvdGhiZUxyWFBnMGExcVl3QzNOdEZNS0h4?=
 =?utf-8?B?UGJTUEY3QzZRRTNFUGVNVG1NbWZLMkJPZmFQYzZQLzlVaWFCand2OElXeXFF?=
 =?utf-8?B?L0JXanJvWnNUOWZkT3h2d09VVENPV2t6VVlweTJYaDdCSm5kT2xvUWQ2TW41?=
 =?utf-8?B?VHlKM2srQW1LSUNOMG9PUTVGNnZMY1N3VlFHYTE2QVRsNG43WjdaWS9qVWpB?=
 =?utf-8?B?MzJTT2xTdXY0VWlqQ1gySjZrVkJkZjJlYWNINFB4d253bHZFMEJPVGdnYjVo?=
 =?utf-8?B?dTdRMDQ2QldmMEFUT3ZxNHhESUlsUTMrcW9PSXN6SllzdVA5NkVjaklkUnhn?=
 =?utf-8?B?aU15ZDNEc0tsY2I0cEIxenQxMVgzbXFXaXhLazdpeE1RYVNqbldsSlpuK2x5?=
 =?utf-8?B?c3V1Mkt1SFVKeGdTVzBOSDRNL2pwcld2Nko3QUVvZ3RNRVdFbHhJdDgzNkVI?=
 =?utf-8?B?Z2diTDJsK3dCVVJPa0tUbHJ5V1p0SXNWcjM0YlFsd2hEbnJTMk1iT1FlL0F2?=
 =?utf-8?B?TWk4TmNDVERWc2dCNGQyeFJqWk05TldCc0VTWXhyaWdGYmtXRFNmamN2dkJ5?=
 =?utf-8?B?d0JjcFBHY3JIZHE4eVRxT2E5bmlZTjc3clhCRkFuNXFkQkV1SUtWNmZGVjJK?=
 =?utf-8?B?VHFqTEE2Y2FNWmZnS0V4MXZBSERLQWVZUDE0K0lpOVNQY0ExVmxGWnFPd3ph?=
 =?utf-8?B?NnRQRWhmbDFISHVJeHlnV0xER08xQzR1L2J6aGR6WUp4ckJQNjN1YVhyNStQ?=
 =?utf-8?B?RmtYd1FadkpsbDdsdnYrY3BUOWdRSXdkbU01Tlp0WHBqNVRRS2RPVkc5UC81?=
 =?utf-8?B?clBVV09kZ2FKM20rdnZKSXNVeDJxL0thdk9WZ0syRnhpeUt5R0RNamFVSVln?=
 =?utf-8?B?ZGpMaDhWeC9ROTk0ZThhVms4Q2VxTTExL0xROXV2L0p0TUJjVHNxbnNaaXln?=
 =?utf-8?B?SkM2TFZpTktNdlpRNDU0dnhGZVZmYW1VdWNHSms4YVF1MUVqekQ1a2RkQXFa?=
 =?utf-8?B?TVNZSFZyY2xiWTFkTi9IN3hQNVRJVC8vNDJkTHdDVHhGdktiMStrdzAyVEdB?=
 =?utf-8?B?b2hRV1dkOFB0UVdrVHVzMmJ1SVdwZkhtRjE0amdPVmNxMERPZmNRWGlYcHpt?=
 =?utf-8?Q?6jFZ8uBNLnbhXM0017B/0xuerhxMUIKPxjHnKwB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8490e0f-1743-425d-ea26-08d9331fb73f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 12:42:36.2212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F5Qa5iO/4wccOhE8fr9JVu4rboEbpMpuirAIfPfh49kiRldgViFYSohHE+Xeag9L8eGvFvH6k7DFE+R3tDJAvPM0R9SIk93BbZ4kOloVMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.8.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7,
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

14.06.2021 11:29, Emanuele Giuseppe Esposito wrote:
> First, categorize the structure fields to identify what needs
> to be protected and what doesn't.
> 
> We essentially need to protect only .state, and the 3 lists in
> BDRVBlkdebugState.
> 
> Then, add the lock and mark the functions accordingly.
> 
> Co-developed-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

