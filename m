Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10D2F5FE8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:30:02 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00pF-0006NO-Ck
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l00mC-0004i9-0c; Thu, 14 Jan 2021 06:26:52 -0500
Received: from mail-am6eur05on2115.outbound.protection.outlook.com
 ([40.107.22.115]:47109 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l00m5-0006KH-Cj; Thu, 14 Jan 2021 06:26:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMtg4TETISRbC2Irlcg58FCR6HkO4r+A9NnxgXjdJkrG55EoZ5N0bbxb8N0ngROfzOPxFT/r9/Xz4g+/I5vIEJyGk44qqHyoAbeMu9mEZYjlgwcOB8IWZCVP9uTQL6Unsu/rR7WTtgJV7l2YNie1IRxU6csWjbxlF7XgRcuPmPSz9Bk5kzIVtlLPsT0aXqxxGkKC72urYUKW2T6hZXTfZ900+/lnuEaPVamoURU3GoFKY5yYmJmO7pgZb/h4FTxhfHSVHA7XOo3Ei/5aCMbktkep6+OZ5xcA8IPToYphP2Jivnqjhd2n2WtXJZeiSQz0JW/KPCgMq7qZ42N4Vam/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkZVnugTeIYPwlvVkmpjV73tzuxjezkvOdxWwcauXbM=;
 b=AVEtX3umbUaQz62908J2qNbknDLBB5Nhnelcgr64FxJrMjg2SK9Pi7baIfhLOHcrsUYD6TyjvvvNk8fxyG1ehlFK6DDz0DTCtDW5OKfUsrDsK2renxN8lE4yqJGvtRhKTAZWq+UtReu8pQ95FRrUwpC76hGqr+V0hWZzV4dPeiH9+6OlX5hwK7nvLP2KqfdYUILYGoCeqvtlRP8bSoAVSWtq0InRiP5CcFrCxlz+Vw9M+VAGq+/iEj3gd+n9P2RWbKFulN8VSYNx0Pe070U7o+evmf9oHLiP3WrZzyCTOaadA7MIbefRanZvYM/wdL4u4ih9y3PE+3XGTIQlG4vR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkZVnugTeIYPwlvVkmpjV73tzuxjezkvOdxWwcauXbM=;
 b=Zoo3lKgkOgSK61wrg98SQNaJG8KFEc3x3XZDCyxpKHzS1HrDm3LHjG5skielNnzuMxYq9GgaYlrpTmlK7n5g30OhiZ/SN5feCCMTX0ct1cAJ0nSdlTbEQbolO5Y038QqKUZoc4rrAT2oxrLbNrj3fUEBts93BYq4XUJ8SaK4Ap8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 11:26:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Thu, 14 Jan 2021
 11:26:39 +0000
Subject: Re: [PATCH v6 08/11] iotests: add testenv.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-9-vsementsov@virtuozzo.com>
 <4bc3f007-65c1-ce8e-0e16-3e6087918d8f@virtuozzo.com>
 <20210114111436.GC6058@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c360b244-7a1d-5939-7754-82ec081dd02f@virtuozzo.com>
Date: Thu, 14 Jan 2021 14:26:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114111436.GC6058@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 11:26:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adc86303-4d80-4bb5-b615-08d8b87f42c8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB525620C3255003BD34469CD0C1A80@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYDbYV+q1L11U8WILkw9Bcn5O3gGkR3Ty0nvrIQWhEkl0L2HnrIFo6cXn/FzYQf2/UBIoXJr+xAGcBlo6ppnXxzSdebnO6lPrZh1w0BY7NfGdp9UBOWAlllWVnUB7DUL0gGaI010JLp9udvUa0oGZIsMkatbzjybqi42efFNa3gbM8U7kvttoILQlsc7b7HJK3cz0/0fDT/ETd7QPbxtU9tZiKpisS2T48G0Ij/xvXkD1rrkCl+NxeWvBs92B4t9OkJTN1N5y4fIv20zQ+zQGm84tMsNb/JwhG8PPaKyLNirlxJkS72bY77Q4Rk8EpPFML3x8/u9ct+qMFpFIyNZUSdmM/R539oxKkzoWugCK+IBFlD3Tn1iUb2hSoh+aPeJR08sJR5TOvb69+ulxejfPN8zjnoPDABCL356vaOee6vRU+r56GekoEF9tXTGCpsgQzvuE2vJtOFPRN4j5Lz3Q6IHIDUIRHAqOwilFtLEhek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39840400004)(66476007)(66946007)(16526019)(2906002)(66556008)(2616005)(26005)(956004)(186003)(8936002)(6916009)(31696002)(5660300002)(6486002)(31686004)(86362001)(4326008)(36756003)(316002)(16576012)(478600001)(52116002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THMyRitBQ1NnRUZKMklZeTdjcm1VQks4MFV1SzFFdHZMTHpNUWlKc3RVcE9p?=
 =?utf-8?B?SmhGcDU2dUVaT2ZsaTR3L0dqTU0vMHA2Z1hTN0Y1eDVkaWpiVDNUSXZndEtB?=
 =?utf-8?B?UG5XdkVyUXBPeUpwZGYwcUJvb1puU3liVVc5dm5YQTNaNVZQMEp3N2ZnR1pT?=
 =?utf-8?B?emI1TjRQTUVmaitLV3FvYkx2NTZ2TXBpUUZUNHkvL1crUXp1emE0aENWQ1FS?=
 =?utf-8?B?WGZnVVVrSzJuZnFVcDBuVGt1SnRBeW8yRFlYSUs5ZUhmMk12dU9zZW1HUENX?=
 =?utf-8?B?MFlCUk5pTStjM2JTVVk4TklGcGNyM0I2UE1JWVk5d29YbTA2Q0hIc3pXSWE2?=
 =?utf-8?B?bzN2VFBRRTZWNEw4Nm1naWlNZU9NVk5GNGkxQzlaTlhRVTU4MHcreFBTMndn?=
 =?utf-8?B?Qk11STNtSEFqSXlyUGR6SGFXakZFaytBNE5oS3pCbkp2L20zalc0SisxMWlk?=
 =?utf-8?B?NzhPTnd0SmplNzlWWmsvelcwS3ZiRTkyN081UnBuckF0d0lGd2h2NW5OVE9W?=
 =?utf-8?B?amNLMmN2WkJxd3hWdnd5eWwzckFXU2xlU2NrMGNVVW1qbVJQeEhxaWUyY0xt?=
 =?utf-8?B?K3B6RXNzNUhwNkwyU3hybFNuRmlYdGJPYkZHNTd4K2NOaGNMSlIvWGdNRnJa?=
 =?utf-8?B?SnpuV0k0MFlzV2lXZG9JN0dTRXRqbzNkYVl3SVZOSXdRSXRJYmpha2lJbGIr?=
 =?utf-8?B?dTdTWlN3enc0M1pWeGdEU0l0MHM3RFNtUThVRUJJRU92cXpSYkdkQ1pyam9u?=
 =?utf-8?B?TTVsS0RhSUxocU1LQTdVd1FTVnNQT1hxTGwrK3U5dW94T3lJN2VtZVlTT0Jn?=
 =?utf-8?B?Z3hKVHpLdFBiYnpxS21nRDNwc01nVUkxdzhQNVZ5Vkx1Yld5R3pQbk1OclFz?=
 =?utf-8?B?TUZ4dnVSTGkxaGxKbUdaVmNlQnJ1b1Z1WHdIMDY0TkdHWE52bzFTcW54RFNE?=
 =?utf-8?B?akdNOHo4cmlhb205TExsT0lWc2NTZVpKVjVaNGpwaWZWaTgrK2ZFUkpQZVJo?=
 =?utf-8?B?QnlLa0NjNWlnbDlMNmowZ2F0SkhFM1NnYkRaT09PWlVuSnUwY2hTM2wzNGJN?=
 =?utf-8?B?Rmg0Y2JYbGhyTmc2RzVneFd6bDhxb0RKdVFKWTd3RUFWKzNhWEI5R1ZjajJO?=
 =?utf-8?B?ZmJRRTBvcW53Y0FZdC9hdjlhbG5RT1BZbS9rM1l3eEowUkpyQlc0bEc1eUcx?=
 =?utf-8?B?T0F6MmVRamhkV3BzeFV3NldRN2t0b0t3bmVEbzFBM1FmQ0FUN2VLSGxrd0kx?=
 =?utf-8?B?NUlQTVVkdElEVTdxNVY4OWNwSkJrYm5Yc2pOVkNEZDlHZWNBNzR4eTZmZ3By?=
 =?utf-8?Q?onhCd8Jmyu+FVgU+3z8+/byd96lzi9uBpN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 11:26:39.2980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: adc86303-4d80-4bb5-b615-08d8b87f42c8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4yDCEtW5LaRDvuch9ToqT0GcW9dcZP56WfwG5ndKHS45J2kQTP687Oo5MBfN/JFx2iurZ2+iTMqP1W7LUCtA42e/zGScrny/LUuTNcV2Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.22.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 14:14, Kevin Wolf wrote:
> Am 14.01.2021 um 05:28 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 09.01.2021 15:26, Vladimir Sementsov-Ogievskiy wrote:
>>> Add TestEnv class, which will handle test environment in a new python
>>> iotests running framework.
>>>
>>> Difference with current ./check interface:
>>> - -v (verbose) option dropped, as it is unused
>>>
>>> - -xdiff option is dropped, until somebody complains that it is needed
>>> - same for -n option
>>
>> One more thing dropped is looking for binaries in $build_iotests
>> directory.  Do someone use this feature? Or we can drop it, and
>> reimplement when someone report the degradation?
> 
> I seem to have socket_scm_helper only there, but you use
> self.build_iotests for that, so I suppose this is different from what
> you mean?

Yes socket_scm_helper is searched in build_iotests both pre- and after- my patches.

But for other tools (qemu-img, qemu-io, qemu-nbd, qemu, qemu-storage-daemon) old check script first search[1] in build_iotests, and then in standard location.. In this commit I don't do the step [1].

> 
> My tools and system emulator binaries are in the standard location in
> the build directory, not in the iotests build directory, so they don't
> need it.
> 

-- 
Best regards,
Vladimir

