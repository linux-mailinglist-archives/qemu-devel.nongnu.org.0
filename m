Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492C3BA5FF
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 00:35:51 +0200 (CEST)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzRlG-0001PG-4O
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 18:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzRkA-0000as-Jq; Fri, 02 Jul 2021 18:34:43 -0400
Received: from mail-eopbgr130123.outbound.protection.outlook.com
 ([40.107.13.123]:10222 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzRk8-0003vI-6T; Fri, 02 Jul 2021 18:34:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb+OqkgoCBrW6m1OvRPWRRqno5uGmXIOW+zM/6JqJbFMWh9sygSbqi/pzIaLQWrgJlNyXI4RGkbNvFy1MR9lWi5xncZ27jLgsNFu2sYnYoeCa8LsvzQxCgB7/Od+8V4BowvtNR3b/x1poYFx0ImwbVxvm9S1cCooybAro6kGsQJxFUR8aj5VxkUtJCBUT4JZclaeXKBV2/E4LUmlQK/P6Im2Olvvvft6v4RwjatT0oIAi7yblZ1x3cgAodnl6YVzGYD2kuKOSqiQjhdICyKRqAwkLlhMSJQYpn1nYT6kON+DShaB/UaCVuJqHw5ZEoUSt538B2XKBW7V9aM3J9SntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efLGEDydms5DIYBoYUta6GvW4hSOgi1A5RrPY6JPwls=;
 b=Xbm3RTYvqUKPIJGVJHbRf9fHvFQyU8Rj5p+TziRvotmnFh4vAPGriadIgSR1obJbgHOB27QyR3UlPzMH53p1bktQUVG8tfrAC4UUK2vh5fZVukc0px60b6kimaGGfreDXpiVO8FSJ7HUh4i/kZHZ1mlV7Jwgow/alCLlManuVjpdyxajecg4nYyZhWiXTR83A2LlodDQUMduKuI1Mj1XsBh6BrlXGBw+FaaGTuAVSBbks1gX5aPQJf4CyAms4hwMsjF/xph55H306i6aM5dIayarhhCzmQq/BnhpKIQlzcSJI1FdOiSn40x4L0NiINgjTghan4dB4D4xpw0/lY+Idg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efLGEDydms5DIYBoYUta6GvW4hSOgi1A5RrPY6JPwls=;
 b=kOBkOb6LL2y70dLcgAiZW4PbMuT2Gq4731zDrYgBXrIW6E5OhqHNEsUkdkRywZ59AVQMjGGLHJnbbiAWvexIQWeQgb8pi3WVWq0qx6ITage9DfaUNumOl0m2yXCCSdQobs1WusVKXxYSIyyFzTMGLOKWsUaSQD7uVEBDliIYYNI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 2 Jul
 2021 22:34:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 22:34:35 +0000
Subject: Re: [PATCH 0/3] Fix active mirror dead-lock
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, "Denis V. Lunev" <den@openvz.org>
References: <20210702211636.228981-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7455aa90-fa4c-d3d0-2ad0-8afef9e7b7a9@virtuozzo.com>
Date: Sat, 3 Jul 2021 01:34:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702211636.228981-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR0P264CA0283.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR0P264CA0283.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 22:34:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f6ddbed-f648-4719-7086-08d93da9919b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42135D2E159B813F610349FEC11F9@AM6PR08MB4213.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45EyFwZisx2+Uc/jG1aPebbl685eoFh4WwVmB7WX5RYRCOqVnnx6Lk5jpxqPWg8suNwiIRQrrCxetEMYpFGj8mPpAHGYytTTKWHjwG7SHr/+sBWzGFBTR+kmCuQUa/LoLoopMXMWda8ocBmTmeX7Amo7/Q3sjZp0Dk5i3VjGQ8wGNV5EQbYHzzlbvmHGz9mFkxG6HEMfMbAqDVdAh3VNh/33DkSSaAlx2j7XljyhjWPJf1RaiDNvpLUqL6H7faOX+AWYkSHDkWlrISW/5nvwbYWUIiR3qGTz/QSkyqUHvtyfCsgMcZovZLKFxn6d13uh/LTKI0RcyER60nM2Nv9kkurzXaEftxW94cGf3tZOh0avlZ/yY/5tbo+fqPHpMrGSCvbepf9ql7IVm6Mtr5uowYbQ7tGdB7Iog052bvYmS+a4t7jxqxFjVanS7YqEnY5ixSGuwDLb4aOcYJs189UjLdKuypdFeT3ui8EmjcdXGpe/HHHV79BRUMm3xsBN+yOXpYN0cR7zgDOXoeJDWxdyd8fdVXWLX4tAvMWS5d3UVN9DSxoptHnYGIthQ6e1g+728HGVS0aP2diAegaQ4xhwIXL3DEd9KfHXc7jlu6M/FQB1FhhF1Esdy21yV+g6Uron0FdrFnskViajTHTqGNJeIYiEtAWfxKAXBAD4Z2tz/G74epdPELqqO/f34h1Ul+DZSMvGuxqQpSbQhfKqi4qO9cmqtH+ufxDPYXlsZ88IYHMabh0MSg0bolfZGMas8VXpamq/irjUOvg40rBQe6zNoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39830400003)(5660300002)(186003)(16526019)(4326008)(31696002)(8676002)(31686004)(478600001)(66556008)(66476007)(316002)(66946007)(2906002)(26005)(956004)(8936002)(52116002)(107886003)(36756003)(2616005)(4744005)(16576012)(86362001)(6916009)(6486002)(38100700002)(38350700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVB6d09DdTRZRnNGYUN0MUI4cmhGRUxnbHZ6dC93TmN0MHhGOUJOSVJiV2NM?=
 =?utf-8?B?cFBmMjU5VHJ0cFB4aVFITS9Idk1mVlhFZk1LbVUzYnJBVHkrS0VWTThYTEg3?=
 =?utf-8?B?ZXZYbGNGcVhoZjJ3RUxtYWFyMDdqUTdRbDFKbDVEOGpVQVg1MDgyMk5qMXBs?=
 =?utf-8?B?U0FzcVZ3UUZCWjVscEhOQ21CNEkxT1lFMmRhMjNnZW5VaXBPbVlEdGZjQm1q?=
 =?utf-8?B?azhxcStheERRU1FjNEVkNEgzNzAwcDRWWll3ekFBZS9oOERCdXRNUVdiREtT?=
 =?utf-8?B?aHhldENhVndiQ2ZhQXFpMlpLNFhOTnU2amhyQ0pkZENtM3R0SjdHVjNReEVR?=
 =?utf-8?B?MEt3VUI0SndzS0lvdlpDa2hUTG1oUTFVeERJUm4vZXQ3SVlJUHZpWjFzcDZN?=
 =?utf-8?B?eDhBUFBZY1dtNWRNTmhQTnl3bEFNa2dFYUorMnI1OWxvQlBReFN5NGxxZG5j?=
 =?utf-8?B?OUhhbW9CVHlxTkZWRDBVTkRObEVEbVo3RTc0WTVTTk5EZGJTYUtFQzhqVkVp?=
 =?utf-8?B?Wjl5ZmVFMUp5VWxXOFFzZVlXRDVFMnBkOEIrbXoyaWVVZzdkQVdab0tKOFVn?=
 =?utf-8?B?UG5INFU0TzNTa1ZJREpFbU84bU5ZY0NBQjUyMVlmR05wN1BrcEh1R0VGSWlC?=
 =?utf-8?B?SjJyNkFienFXVm1DUUZiOG9XZndua1R4ak4wSkNJTlFYQmovSEVBRXgrbVBD?=
 =?utf-8?B?ZStOc0xkMzJJNXpsZEtHVDFaeThRakp2ckg5QXh6akhUaWdKN0RBSzZiNjJr?=
 =?utf-8?B?cjNMR2d6V2tTUnY3MFJ4OTRSUGhwcFhFZy9uUmgvZExBTmxoL2lmMXFhckpz?=
 =?utf-8?B?ZkdZS3ZuanZKYUR2UkpTYXcrOW11M2t5SG1hZHdBTUhGa1YzQmF2RUU4OWo4?=
 =?utf-8?B?ZWpuVE5BamRKeEl5WER3SHIwVlZEb1AwdTdpNnNpR2wxTmhFa3FJUkVGdXY2?=
 =?utf-8?B?R2FXYUpvYlkxZTlKSGU4RmVxT2NhcTBvWmxYWXU2SURNbzJsaCtMcnVzUThS?=
 =?utf-8?B?UFFLeFFqS1hWcEFLLy9vY1pzRTFIdUFIQzJXMTdRY3F2RTdMZUU3OVVJVk1P?=
 =?utf-8?B?VXZkdHgrUmsvalUvLzlSRFdCMHRUSGQzSHhrSkJoSjBVZFF1VG1wUVVyQ3Zr?=
 =?utf-8?B?RE02MFlIY1UyMDI2WnNYS3RVRzl2UVFQSHZGY0M0NXEyRUtsR2hxYVNiNDNp?=
 =?utf-8?B?bks3OXI1djhwNUhDd05Qa3YzbFVSVml6Z0FveDBmMWVUSlprRU5oNTBTTTdm?=
 =?utf-8?B?YmRZZVJ6TGRMaUFMcUZWOXZXV0kyazJVQlVMWENMTTdkOUlHTHlvemdFeGdR?=
 =?utf-8?B?bVMweEhmYnQzQkVDMEdMVHVSZENpMVMxTTNZellaQW8zQ1JNZ0RZbzQ5aW1u?=
 =?utf-8?B?VVIvcXA3R1prNTliWGFIZVhpb1ZNZmpmcGZHOWVyVGFtOHkwejQvRnZJSjZF?=
 =?utf-8?B?TERGeGhvS1hNRFkwR0ZGZDhXSkNnZ0dQRGVuM2QyMzhKSHN0RmxxWk9GckY0?=
 =?utf-8?B?OEtXemhXYUVXVXU3VFlNMzA0UWhGL3AxWGxaZ2tSdVZPNHRGdXhldm1UcUw1?=
 =?utf-8?B?a2lXQ0RwUUFDZXJYQWZqM1VBbVFBNWpJQmpCK2FDOXkwaDEvTXlWb0hDUXlJ?=
 =?utf-8?B?QmVURW1aZG1wN2JkUGliT2lkRTAvR2xnVDVXY0I2UHdjbE5rRFNNUlVNcnU1?=
 =?utf-8?B?U0Y2Qi9YYUlLOCtFZmFGaHZhN1NyUlpWUnRWeWpJQjZySGxSMlVoSCtaZHJt?=
 =?utf-8?Q?Jyu+zW1UcnP3/CsAaW+hyjKIzxnKqEmZPHn57Jw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6ddbed-f648-4719-7086-08d93da9919b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 22:34:35.3188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlplosnz7pOV2Ft3sfpbc6VRTzwyd7Z5YwsW84GgytcFG9pBSEMe9jvg+4/Ctco/l3hG5RcxGk/LX75tXUDxxZfM+2jF21F4x8dOIBM22+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
Received-SPF: pass client-ip=40.107.13.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

[Fix Den's email address in CC]

03.07.2021 00:16, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> We've faced a dead-lock in active mirror in our Rhev-8.4 based Qemu
> build. And it's reproducible on master too.
> 
> Vladimir Sementsov-Ogievskiy (3):
>    block/mirror: set .co for active-write MirrorOp objects
>    iotest 151: add test-case that shows active mirror dead-lock
>    block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts
> 
>   block/mirror.c             | 13 +++++++++
>   tests/qemu-iotests/151     | 54 ++++++++++++++++++++++++++++++++++++--
>   tests/qemu-iotests/151.out |  4 +--
>   3 files changed, 67 insertions(+), 4 deletions(-)
> 


-- 
Best regards,
Vladimir

