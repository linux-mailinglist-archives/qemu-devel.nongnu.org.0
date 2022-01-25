Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F949BDE2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 22:32:32 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTQV-0005pa-RH
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 16:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCTO5-00045l-AE; Tue, 25 Jan 2022 16:30:02 -0500
Received: from mail-am6eur05on2136.outbound.protection.outlook.com
 ([40.107.22.136]:47464 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCTO2-0005jt-3J; Tue, 25 Jan 2022 16:30:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLry02j/CiEy1f2YN3rZdHeYXOUNfsPh3jd5CBpC53GxVXdoo3qfnKnmqOcV8aotpN0UEYSstCdNDqzKV9B/K0X+/7lQXEYBe8E3ztkhYTukQT/xFfq2uELAov+3luJGNuWyf0s2AcaMPRihLeaHuiog3Ofxr5vt4bMJKOfXvPI4MbbGZsaT7XR6tkiOL8V5rqr7mUClZk6hQTovPDhtk0X5Q8EIvZEkILR2yVAmJ0y9Bvshi4IzV0O/EOUPg8G10w/DEszy1SIBKJUouL0PFiYLZETu0UO1vjgy3mmJiR6a2zljs3uYYFLcAlMeYVWSRWZo6d5LdJzMGwHW6lb4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HgU08vDiSlxktfCVPvzmNE3eBAPZAex6uVnakpTq0M=;
 b=JzL3vCq32nEf49o+wAI0uTZLJW2+H7Lfy5CJcqq7EbewtKpOSt9ja6hsFN0OLM8ld5ItqQK4hUjaauAJRGsUGYiyYxXKC9jjFKszkkadmENWp6PWWCMk1hmUG/622pZsSnZ3tmoNAgdCim8/aqyTUjYzLyeydHAlZQTAflCEPNacYoaMlwfqOXT+iEc2ejbCe4J/yli0wJSeOTkBK3GUcTjuhYmP7cA4Hql5Tf+5HHTBKyZzrKZzyqDBIfJdWEvQNRi9rh7KlmBSfv1aGWm5bWyaxowSmZXX7krbxBVfs0yJXMNvrgsc0mzr9qAMzf4VHNzGna1yKN8zzx5q9E88mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HgU08vDiSlxktfCVPvzmNE3eBAPZAex6uVnakpTq0M=;
 b=FZKdo7XMA6t99neyydol08s9Qj80zX5rmA67Ln+C0g04mkbStKBClqoqYrhas2E4yHXrWeSJFAAb7xK8BZzmU/uM8AHVECO0s8M/u8wWV/+Z+tC9hIjZKGbJKTC+gxiEYYvz4qstkoCshNrARzbHD+f9SLkcxHfufjXFqd11d6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6771.eurprd08.prod.outlook.com (2603:10a6:20b:30b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:29:52 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:29:52 +0000
Message-ID: <d972d215-554b-a4ec-2161-623c4cac360f@virtuozzo.com>
Date: Wed, 26 Jan 2022 00:29:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 08/22] drop libxml2 checks since libxml is not actually
 used (for parallels)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Beraldo Leal <bleal@redhat.com>, "Denis V. Lunev" <den@openvz.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-9-alex.bennee@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220124201608.604599-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57400fe-a65e-46a4-643a-08d9e049d2df
X-MS-TrafficTypeDiagnostic: AM9PR08MB6771:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB67717F395D4BC649E0B35433C15F9@AM9PR08MB6771.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcUQFn1fQSJIcKPsa2f0k/oqFPZGL300O2rvgdBZB+vvAer4jm7lhL1hT8NZeLi4ksjjfPtVXFl6jPDQq7vNTnUKIJ8MfV7VXoZw9Jd+1TCUl3Z70+F6Srn8CkEcovN+Kvq1QQqzZ61gdfjU9DZ1xd8NijwPQL6bRtYwLCuWyx+sF/9+grqcXKfyC4lHJPrNXChPPv6EuysBFpEc39Ftdj/xhGP/Bum2lRudVX+h9H8M1UzBT4wimmeKabkCefoPxDFS5IHUypp6s+Ey/MlUHT5fgIttXWxDx/WmrMA8w9sczEfPzm1LtAMPhP8plvl5m+/U3KW4jdLxnVxRieYa3yNwaunr9cgrGvJbU/RGQEOQXZpHhnc8oCgcfEDpkkGpeM0lqiL9mJ43tLKytiKewCLRs3PzAEBuc+Doe4IJf/Xm+48/wifVViQzTzF9TDSn3heUfXWu+pq4KWV1qZGObBbXZf4aZRXkpAxgluTPSOAwfcsh1BD0Q2yU87IcnLXfiPmgOFeTXigJXtFXctoX9suY+2K8BalOb68meKDkq7cMWD3hxFpvkVH8IeIdlsLa8qX0rNzPb0kymI/X1rq+2+GptaXTFPUn5hSJYCcE75X3xUSzh9bHxRyaQ/ONvFBylzRDC9ghrLWwDlgkiKNrqgSbpahDZYJrEAZPSAMHBzpbFdQRcyC8BFj0UarOVVgFEkUGkD5eeU/Zqxgd/ELh3Pr63krUOlsDTz7Bf8EuykXLs37k0MY/nndOoCAiHZKUYjJW0+ib1dZhS+n20CnQRyP52yvFi9OTCl9uMqdfeMOO7gCcMCgFbw5kL+syNoVFeetX8Pt7va+0gqHxnA2wmsQB5+h3L9cDnLEe70fRLiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(966005)(8936002)(8676002)(6666004)(508600001)(83380400001)(52116002)(6512007)(26005)(186003)(6506007)(7416002)(6486002)(2616005)(36756003)(31686004)(86362001)(107886003)(66556008)(66946007)(38350700002)(38100700002)(2906002)(54906003)(66476007)(4326008)(31696002)(316002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJGT2xYMmNodndyUkN2WDh2MnZGM05xb2dBQ3FGWDlyQ1VHYVhlcWM4b3Z0?=
 =?utf-8?B?aWgyamZMTEpzWEY4VWRwSzhLaGxMMm9JTUdpekM0ODdLcm5pWlF3elNQQ2Nu?=
 =?utf-8?B?TXhkeUg0TXlCRGl6TEs1akFUZmovNDBQVGdXZkxKd3N1amtyS294S3dCSG1i?=
 =?utf-8?B?clJIOFBwOCtub09JUzBManVqT0pGR0ZTTE5qbm1nR255Y0dKejVQL216SlVW?=
 =?utf-8?B?cU9KQ1RLTis1TitXWEVDQm1ZOTdmNkk4ZEJSTFJocXhteG1VdEFWYkp3aWF2?=
 =?utf-8?B?RTJqSE5NblRCQlhnQmxsUTRDdklVdUJxa3ZKWVVlcjl3SGJENjN2RFVUZFB1?=
 =?utf-8?B?Q0I0K1orNWsvd0ZwcUlGVGczdURqMEZ1enVjQ1p3S282RGE1NC9zY2pTRjMr?=
 =?utf-8?B?QmZwSEtacnlENVZ0RG5xUVZtNTQyaDRjMWx1STFJaHN6TkREMXVBbElXMERV?=
 =?utf-8?B?eWRoU090NlZJTHRzRHBRaUZEaUhML3Q4T0hyTWJIdWFqMEZPS0g3U1VEMk50?=
 =?utf-8?B?ZVl0akpsa294cjlVZE5FYSt2VXJyR1FsVE9aOG1LblNZc2VOcnNqRm1xQ2F2?=
 =?utf-8?B?bWFhNkMwekZTNWhra2pFaTU2c1ZQVk1KWmU1VXk4ZDEzNytSRExDa0c2emda?=
 =?utf-8?B?eDUxZS9zRzA1VGhYQ3hTT2pKWllsWkg0bE5mUjJ4cHFVQnlOdVptVmZRdVI0?=
 =?utf-8?B?cFg2TGlqY1NmbEdXVHBBL3VwNEhXeTQxSnJFL2xTWG41TkxCRjlaSk9iK1pO?=
 =?utf-8?B?TElQcWtiR3JnMk9wVUFrZVBPalJLSUdJM2lFSjJOd1RDVFhobnJCR3VpZy83?=
 =?utf-8?B?OXBSMWxHNWdVekc3NFhzVEtSOVZwZGJKL05lTHhEdWxzRlpaaFpkZEk2b3FF?=
 =?utf-8?B?Y1F4U1llRlFxOHpqVS9mTTVzc0pwL0ZsYjYxaDQrRlZPQjFHWjg0ZGpaQklV?=
 =?utf-8?B?eHBLNkNOZExzRDMyZTZDQkhDT0gxK3ZGazNYRVU4ZStYaVphTXNLVXpKQ00y?=
 =?utf-8?B?NStKcXh1UE1qZTFlLy9uZDd6SG5xbzFnRXM3MDZ2aW5salZzeVFSVVZyTURN?=
 =?utf-8?B?Z0lwUVFwRk05SjFzT3h5UWwyZU9ra3c2dTQ4eHN5MlA3cHcrR1FlSUFzT1hh?=
 =?utf-8?B?VXFEeDdieERMaTcrbjdPNHBERXpENUJyV1Bzd1VSUE5JNGR6ZExRU3lGZlZu?=
 =?utf-8?B?ZlFwdVF1NHVRMXRWVHAzVjVaZWdFZFAwM3BHa0ZSQ3QrOXB6OCthWHhqTU9V?=
 =?utf-8?B?Ukw5N0F6QnVUMmtCTENLL1lDdU9yQXNndEVJNWxGOStzc0wxUFZoV2JJbjE1?=
 =?utf-8?B?cmY5ZUNSZGxXcTdaV1laOE92Q0x2T3lSZlF2OFFjendHbzBPOWwyRlEzKy91?=
 =?utf-8?B?VmtQNDFqeGVBUmJyRzQ5cmt0bG5vMVp0R0tZdk80dk1Td0lXMElMajBXekc0?=
 =?utf-8?B?MWMxaU1LeGNVUUVnM2FraUFZN1hsYzIwVEZrV1J6bkFmY2wzSHJQVmYvb3o5?=
 =?utf-8?B?VjVXTjBaYkRRdjM3dE4wV1Jxb2pTRHkyUm9vK1VqQ0JYK2hXU3d0cEVUdGFH?=
 =?utf-8?B?RE04cDdJUzg2bm0wK2pJRE1ySUhPR0NLT0xxRmI2cUcwOU5lRUM4eC9aZmhk?=
 =?utf-8?B?ZTU3TWpiZ0diSy9tTS9JWTlCWkcwVzZQZkNkbmdIQjBvYy9oYnlFVmF5bUoz?=
 =?utf-8?B?aEoycXQzeEdnWDRVN0FmU05uVVVBNkowNWVaOHZkdFdybWdRZmFCQ3RCdUlY?=
 =?utf-8?B?Vkk1ZS9BT2RZYkF3M0RnSFl6SDRaU0prTEx5em9TSGkyazIvRFpzUlBOVGxP?=
 =?utf-8?B?UkZxODFXVGgrdVQ3ckNLak5ueFBidDVPaGtQODF4eWNZWnJSZWxVUCtkQm5m?=
 =?utf-8?B?Sk4xMHI1ZFM4QXpmbWZCditPTGRoTE0zQ3BGNjZERUJHM3VXSFdwMlFCek5y?=
 =?utf-8?B?OEpiUXdPYk90aG1YNjZNdlJjcDJkMjVicDIxazFtajdGUUwrMWtCZForNDFG?=
 =?utf-8?B?ZHlSNXp5bXJUaEYyd2RMcGxQWU9HMHd3Y09Pb1RKUVluLzh1ZzJ3YUJTMHI1?=
 =?utf-8?B?QjJOeldmTWJSK2V5akJKZ01aSTVsYmovM2Q0ekFUT1ZId0JUbHZVQkJDZ2tL?=
 =?utf-8?B?bllhQk10YTdmZlZjelpOWUJUMXIvTjd1eXFKUkJ3NzhXM251TjRvck5hdC90?=
 =?utf-8?B?d09uM2doY2ZjeW5BbUFnMTNWOVhoMThaTGduYnRRZXplcjFROHdYQWJ2TDA3?=
 =?utf-8?B?cTlXbFVQbTFQUHNZaTJnazdyR3RnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e57400fe-a65e-46a4-643a-08d9e049d2df
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:29:52.7694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECuzdmeQsz1k5A+F5u90FBuQWJknUbkaVK3sToAMyFD+6CE3T2+lrZH/fDyLDB7NHrR4HKZ/mHBoN0krakrNP0OQqK7RJ2oiCv1wviHS8jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6771
Received-SPF: pass client-ip=40.107.22.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

24.01.2022 23:15, Alex Bennée wrote:
> From: Michael Tokarev <mjt@tls.msk.ru>
> 
> For a long time, we assumed that libxml2 is necessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml [*]. Since this is the only user of libxml2 in
> whole QEMU tree, we can drop all libxml2 checks and dependencies too.
> 
> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.
> 
> Drop all mentions of libxml2.
> 
> [*] Actually the basis for libxml use were introduced in commit
>      ed279a06c53 ("configure: add dependency") but the implementation
>      was never merged:
>      https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [PMD: Updated description and adapted to use lcitool]
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220121154134.315047-5-f4bug@amsat.org>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Parallels format includes xml disk descriptor format, which was never merged to Qemu. Yes, the introduced dependency was premature, sorry for that :(

The implementation of xml part was sent, but only for someone other who want to continue this work, Virtuozzo don't have such plans now:

https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03601.html

-- 
Best regards,
Vladimir

