Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF03515AE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:39:25 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyTj-0006wr-VM
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRyRb-0005xd-HZ; Thu, 01 Apr 2021 10:37:11 -0400
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:26086 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRyRX-0004Tu-9d; Thu, 01 Apr 2021 10:37:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzTIIajwGJtTZOHJwnQo7E5wCqWxx8rPSccq2tjJYPfLDGsPW/DgRaQx4K5EwLLVi2CBULMqhBeLR62aRQ0/dCFdwPflpoSWa9vCxCiTsoG6mTImxbEG9QsSx6UvikUVThoiqbudR3c+RiIVM2k8pyK77kqLhTe8yuu4XnI4rNRDgNSjiuwPCN9vc+P6sz/436v2mOykNdC4bA6XIFBeFKpCRLYz/fWlH1Qr2HsjNeHqD0UR+r8x21eU8GnTA2X2yP7YmIagbkZAVJYsFYXwHpA1VjGgcZNTeDCljY4r1uT9u0bfg3P8518a0w5E50sI0wXwgq+1haq6zvmxZpsSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkEPDaUU92ew0u4XvqHvD/jCHU9u0YcMrbJWh50kzg4=;
 b=GNLkR7yFfF2raB5giijcGlWox4KrvOJpijLZKMxg1v/ShzWBtp8Z/SAjlMYe4hpjjmgpfB2Y+T3k8LKBDfbLOldX3lRBCVo8y8yM1Mc7HymP4NzpG9QjolUnF/KQ4dbElzcqze+3Hb+TcVySdr8aozLMiGjgYxYPxcRDOoN9+mQlDHB6q9SGjzEdRjpU3/MIwkB/PvesblbApbuswXs0ddnDuMG4FdilyqAoGNM2NP1EjJMtwdDzpGJYawGmhGSJTh5UfzML+Ww36147cmMdNSI4va+5m+/9rGfkpZQ+hdL9nN3w73qeZ8jLHBKBmgmyKLqlKT8D57lszv9FxP8IcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkEPDaUU92ew0u4XvqHvD/jCHU9u0YcMrbJWh50kzg4=;
 b=lMqAfqBaxfgnjWBF+D4+qrNTWlaBdsLN5BRoDSXO1VqKPKDkbEYmBEu/2N17MQ03NLBGKuIPBPa34wfMSxX/Rto/ENgojlVenWePHxhniHBBPAY3mAuaLOtvFYMKQAGNhhJvQhG9UZ7j+U0haFl6arQjvBwuiK8hVXuiy+9Upao=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Thu, 1 Apr
 2021 14:37:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 14:37:03 +0000
Subject: Re: [PATCH] iotests/qsd-jobs: Filter events in the first test
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210401132839.139939-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c0f53da1-bae5-d853-1cd3-355fd296d23f@virtuozzo.com>
Date: Thu, 1 Apr 2021 17:37:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210401132839.139939-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.200]
X-ClientProxiedBy: AM0PR02CA0169.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.200) by
 AM0PR02CA0169.eurprd02.prod.outlook.com (2603:10a6:20b:28e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 14:37:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f3d13a-d2a8-43b6-62a2-08d8f51b9d7b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2610DC5CF7B93EE954D83DCFC17B9@AM5PR0802MB2610.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0SrB/nkHSL4i1kioujOLGXNxKYmYwAMVlT3rQXL+dpBElnD9kEC6ToYjFBsnKU9iJx77v+PMSrSvBys4v9CZZNxee7txJmHsqb53MrIOTcHTDHLm3Wy7PKDrU9BBw5pF2kjIBGq0tW+1yRpUmoa2GlhCi8dpWT9ao0sGz/cKHNoKJn0rj2vmMFpcPVbhM7W1JuvO7Q6FxVFiXr/edvCyWRAtgqfCIikEg8SXuVfRjR+ajpHs57RgsDU4VGWN7bvVVIGExAIyt36+28FbdYT/JWqcEqpzzZr6kD87mAC3D1qMqHUsYSIRnrfXlSQcstdVguLpumPpo1U2I7zpY9fzB2uJm1Zy6Yezdu5aJ33C4bRpj80yzrj3taXCiW60GWfXyJkIl5awcMwSMtpuKPVKDBZDtY7YFTzIAPoGy/S+CxcDqhWId1gXFnW8rcauQHHSC0TD0bOHeyZavldOQ+lr/7NANy+TQE7j4n2h6xQ4BBhsuV7LJhS1znM+qO1a4SLU0voEUUW3Fod3aTt0ax1moEkqjbsjhmrJuWCQJ9uvsVKXtcdHx1/9NjE0McXEDp0KGU7AOVZgdvFcd3Ozq67DbuCpbBtK7jUfGMqCdYLpxyJb6R9RefawEDbZGULbhIajfnMm4YmUK/H2q77rUOzD4wXiqxeo2RLnuos9NsOSp4glIW9PSEBBtku7Tz14I03OST1PDnVr+/wH4w4rBAnZdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39840400004)(346002)(396003)(66556008)(66476007)(16576012)(8676002)(66946007)(8936002)(4326008)(6486002)(86362001)(316002)(5660300002)(2906002)(31696002)(16526019)(36756003)(478600001)(4744005)(26005)(186003)(52116002)(956004)(38100700001)(2616005)(54906003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFVkZmo5YWNpZEE3Y05GMDcxZ05kVVFuVFp2Z3FrYldPR0hwVnVnVHIyaXA0?=
 =?utf-8?B?VEk1Qno0WEN3a2FiYlhuUzdENVdHVmFreXdMTGZQWnpUcWxlbDNqY0g2Tmhp?=
 =?utf-8?B?MG5Sa3R5Mmx3S2lZdStQREpMMmxVZzhaMmJ5enZ4Sk96NTNweFRlakZweXBW?=
 =?utf-8?B?SjRoUk1JUFdHN0NJQ0lwdzUrZW96a25qUnBURmYyNERYbmVNQ0hrV1BoWEoz?=
 =?utf-8?B?b0NrY1NObVlhWGcwdTN0RHVUWlhHWllTNEpvbmF2VTkxcTlwNHhld2pXeFll?=
 =?utf-8?B?Sjd1ZkxSWEJFRjFoS1hBUnk2cldKNk5EQjdLOEoyVXc2VkxHU0IrTk9yS1lv?=
 =?utf-8?B?WUlaYm96VW15STUzVUtaQTBQTklqKzRDUTVnbVlNaVV6UVFCUjFKS1IrY2Zu?=
 =?utf-8?B?aWZuV3gvenZnb1BJQkt6VVFEbFlaYTVBaUk1S2xLUWo4cEIwcnpLWGo0OXRz?=
 =?utf-8?B?dlhvbDl4Kzd0b0FHYnk5dE9Yby9xT1BxOTFiQ0trRWRSa3lWcys5ZUhuYTV2?=
 =?utf-8?B?K2c5YW81NzBuKzhEbGYvaEUraXRhNUxKb0c3bXVPYXduMysxTEZjWHlwVEc2?=
 =?utf-8?B?Q1kxMHN6N3ZQQWF5aUFvT3lMaVg3RW5aQ3M2TzY0RFg2ODc3SllIZ1E0SldG?=
 =?utf-8?B?Tk1xMXBLd1hwcG92WXVHN3dNU3BadnBtZFM0ak9SZ1JBLytnT2lCMDdBS3d6?=
 =?utf-8?B?QU1TS1YwYko5RWZUWWdKbm1LVWhnZUdMOXgrSExsZWxUdEprL1l5bVNNQ0tD?=
 =?utf-8?B?a3JEekdHVXF0Q1hnUzFUR0l2SFJnWnNLcUdWOHJ1dTBPa3N4dENDWDg1bHRU?=
 =?utf-8?B?c0pKMXpTRkFZQVdRQjY4aUhZSTVIZEdjNCt2ckEwUW13cmk5QlNEUzNMU1lP?=
 =?utf-8?B?TUd1Qml2MXlMS2JzR0VuT2F0eFdMWXVzdklnS0libHRFR0ZIWFMwN05iZWJL?=
 =?utf-8?B?TkdoS2JPZHFZa2dkOWczbFpiMHNsYzQ5VHZVUjdIL0J1akw0b3lIcW5QbWwv?=
 =?utf-8?B?bVhoNlMwNjlzU1R2ZW4rNWRrVEgzbi95aFdMd3RaSW9KZnBBTFZIVytzRzlZ?=
 =?utf-8?B?M2NMb3hMZ0hlNFVTUzA2NzBFRFhLMXlMNnVBbmhTS2xodXlUTFhod1ZRNm9y?=
 =?utf-8?B?dkwrMWZReG5SMTB2UGpLVEdBZkpZd0tnN2o1dmcxUnByWVIzK2k0V0cyMnFY?=
 =?utf-8?B?ekhGdzI1VzlzTHYxLzhFbzhQSjhCeTRoU1JJSnR2QkM4U3NTZmpxcDJDWlFv?=
 =?utf-8?B?d1Y3d1liMHN3QWd5YUdsL1VmeEpWMWpXdGdvUFhtTXZYRTZ3bVJ1M2NVdXJG?=
 =?utf-8?B?UFliOWIxTFVzVlpzdGdteG5XeEhwaEtjcjlMcEpxUm1LWm52ZDV0S1hNTDNY?=
 =?utf-8?B?c1dlbHZ0K3UyRUZIWVRocHFIVTdHSFBmVmYyNkEydXRBZFpqTFkyaDVzTFdG?=
 =?utf-8?B?ekoyOFI4cmtMeW5ZN3UydTNGbERCNmwwVldJRDBlSHNOUEdwSHhwcVlVbmhI?=
 =?utf-8?B?YWtJYmJUYitKUXlXTlpRZjBrS0ZqdHFNOURIK2lFTHo0YU9MVnJ2aFVIYS9x?=
 =?utf-8?B?Yk1ud1Vib0FRd1JNVTlNbWhnSHdETWR6dVNDSklqZzhtS005Q244cFRQZ1Zp?=
 =?utf-8?B?MnpKQmJBOU5aREtwUG5pR1RQQ0toWWY5U2NNWVk3NXBjbXRhOHE4NWd6SjdR?=
 =?utf-8?B?bGphQm13OVpjaW5Qc0ZJMVZVVGFVSiswRS92WnlZZTVCVVdYODI3Nm91MUEv?=
 =?utf-8?Q?wXGfMPMXc2Dl98oKY88SvUq7v6nPjKjPXOEe4r6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f3d13a-d2a8-43b6-62a2-08d8f51b9d7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:37:03.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w736Ev9XQc8ZLkdcHAGWKu6bwrH+n/aBzesRSRc6mxY39LEnLmiLJDBnui/V33EHW4scoGpyO0JK5S5yOD4AR9XnAyiz51jgM58XOqPxl2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Received-SPF: pass client-ip=40.107.7.115;
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

01.04.2021 16:28, Max Reitz wrote:
> The job may or may not be ready before the 'quit' is issued.  Whether it
> is is irrelevant; for the purpose of the test, it only needs to still be
> there.  Filter the job status change and READY events from the output so
> it becomes reliable.
> 
> Reported-by: Peter Maydell<peter.maydell@linaro.org>
> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

