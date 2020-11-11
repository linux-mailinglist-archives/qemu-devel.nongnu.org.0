Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E52AF7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:18:51 +0100 (CET)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcuhm-00037b-Ds
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kcugU-0002eJ-GI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:17:30 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:19150)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kcugQ-0000OW-Hr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1605118646; x=1636654646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZhgDyrmOEKoREprUWjEgZNGDXfcskxqXXicHSYjqxrc=;
 b=ognx4AZFSCuzvZhpXOh6tvl5kMY5mkG/XUIl0Iz9zFYt55pJ/B4PWQh6
 Hw8BlMisAd3d8qSCNILl93pSbruDzVfb867HtKHVR+J7eAsxFwYJPwEO4
 RnQg2J761HMOsHUY0o0gFXGipfuJG4cBxXqocIfoZH9cRv+Cu5BWVFt3/ c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Nov 2020 10:17:23 -0800
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Nov 2020 10:17:23 -0800
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 10:17:23 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 11 Nov 2020 10:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXnKn5kbuSuo4QMMMNw2v8P0ADhFATSVdkfaGEO0qZobrgyX2p0YouGzZAmqW5KLItc7wRLprqzxhNuOnMZC7/2ZHY+uRpWdn7fGZgisry4zbLY6KzZLi2MTaLtLztZ4nTal66dKLapS+uHoVwoWcL1dMQRbSLr+AVOb8To8XtfAy1QgPDm8+FmgiVMyn95oEFe0MvM7GbwFc/QUmUiGeWMpra9KOU44zO7CdgRSyDVNzpYMCDdQFXWoG1de5uL8RPj+YkkC4/jWG4T0dxy7Xsp0Jw0TCJfdwJ0wbYamULKerzLTIU9FyCJqtA0qbzAyt7lFJzxVcEUf5qax6j0KXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VUXGYpxlPjdKNXndnFpWB2m7QERAXD9y34xsKr/g3o=;
 b=lWNM+PD3xMVRiHNF/PxCNJ5fbUXvS8JQjAXQQnnhuS1vI2kv5RIvxjtGFybQKykQGmNWfYgOsXHyX47kAkTNSqsVNNy8uEK33VbtFd6B8RlCW+gRT0xAVYNpoShfPt4BLId6KWXLwaPomvnb0WK9B/PsJdU6GBYhu1Ds13xZno587CUtdybHCDUespuyiXEq/1z0sp1vNXjHcjB93sk84NWEtc5x3NaWjoLECMwbXiowuQQhQC+TGjWYSNojvGNbP7sKUUFbtZk4fyfBxDsBnUW+Lk1Lygbw41XNhayhsanDXDZm7aHrUN6WcFn8N/DQXIcIrCoLXfWEpwvu2JjdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VUXGYpxlPjdKNXndnFpWB2m7QERAXD9y34xsKr/g3o=;
 b=ntXa8m8tpxVZDoUJxhmrmYe8Aa/sqNkeCUincOoXXZVwsL13LD7JlPYDVgpxMyFBasm44vtP6MUj6PGDGUy4zDpOkIgUH8LEKx26XOjyKkC/fb2DpXC9Z3C8s7LqTO/USI7kZg6HzkJGJCswGDc6pJZXVfI1A/1vdk9yvEjYlok=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from CY4PR0201MB3538.namprd02.prod.outlook.com
 (2603:10b6:910:8a::19) by CY4PR02MB2389.namprd02.prod.outlook.com
 (2603:10b6:903:c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 18:17:22 +0000
Received: from CY4PR0201MB3538.namprd02.prod.outlook.com
 ([fe80::75c7:c4d0:62cb:10ef]) by CY4PR0201MB3538.namprd02.prod.outlook.com
 ([fe80::75c7:c4d0:62cb:10ef%3]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 18:17:22 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 00/81] target/arm: Implement SVE2
Date: Wed, 11 Nov 2020 10:17:07 -0800
Message-ID: <20201111181707.145-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918183751.2787647-1-richard.henderson@linaro.org>
References: <20200918183751.2787647-1-richard.henderson@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To CY4PR0201MB3538.namprd02.prod.outlook.com
 (2603:10b6:910:8a::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 BYAPR07CA0072.namprd07.prod.outlook.com (2603:10b6:a03:60::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25 via Frontend Transport; Wed, 11 Nov 2020 18:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ac6eb0b-92f7-4a6f-c42e-08d8866e081d
X-MS-TrafficTypeDiagnostic: CY4PR02MB2389:
X-Microsoft-Antispam-PRVS: <CY4PR02MB238929BF91B1AE2E9E02EA11C7E80@CY4PR02MB2389.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0Px5UCNcxbI/0HbrVT1pf54ukA8ElwtXBbpnjR43UEqg2Pkjg6/fSB30yzMZr9V1miswvx25Z3eRSSuhPEokMum5jq5wwVjrSOos2y8v2DQkw7y394vy/vskqptperaU0YEUKiidbi2gP/RFNHVfpq2LsYUQpG5N8tP1SQLS+z5nJPesZSJoM/4UuOKXstcQGRE65+bpK3q7VAWmITQU2h158lnDgqiBXlh1/O99djfxIn7SM1fEYGN9sB/F5M6pQ6giZS6TGGRwZHSLNqZswzXD6rOh+HG9rqLYvYQOvditnFA4+RHSAX1TmkxTnNYK3IidrLiLiq+McbMMK71GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR0201MB3538.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(136003)(346002)(376002)(2906002)(316002)(66476007)(6916009)(52116002)(36756003)(6666004)(558084003)(2616005)(66556008)(956004)(478600001)(6506007)(6512007)(8936002)(186003)(5660300002)(4326008)(1076003)(86362001)(16526019)(26005)(6486002)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 5Onbl8dAiNAP4u75a/OjUdkdBISR/dKDnOyfOymTrkQJhekbZpJEZ8QYHxIDYd78Pk9XTe8x10IzOZbW2a9LCkxxQqbQMaHey4TLZC0VaNyaoWdHNG53eruFVTOzo4N1yRVPTSYlcWkOen0U3lxv+JxfheA6gv3Msc6jLSZiWMEHhudz+nevRaxvbFRuVYjc0eOFYnqRhPlXFaB2FIcMv7QPDv5aJzFggXw1Z9vxcyBeE3dUWnVsSS32F/COQ0TRzjWiWTJlxyK3dKtEMeBjecPvY0Uvty2h7lYzuBvXPU9FOUQ6I75sbLmjntkmwW9COmiscT7UqYQuwbE6CSdlelWt8J5eX3rFm/mhBlGT9iWgK5HIsVBaYa3s0tLimNg5ildSfpU04pKg0sNogKauhHAIuRxpQrsqSK4vJOPrnlpetpgnBsefeP52JneX+TGTyE5y/rdcdmbfW4qM+E+l/ecs6AibYP3SwkGv24NT4rgs+AmoO6qO1ff/exW7Ib8vtFosqOKdYYv2D9E/9ILBzGrEw43H/Mo9Dg+dFW6gQYXF5irzqJIOsec3L8KMeTRAOGgJbkmhAgSRWmaC9goGMXZ9EnWRqng8qfpk6DAXfqMnauXWFCF9b3jRd3aA+NROILjUR2KOBAcMb/3udqtpEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac6eb0b-92f7-4a6f-c42e-08d8866e081d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR0201MB3538.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 18:17:22.1133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQHS1SqbbAMSKbmuUIMnIhV9+VRHUuhZX9tfUuP9c0peZCxY9SeVlpKkAbrbX01gexJWcjTXO5kDTJeMVCqHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2389
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 13:17:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard, 

Apologies for forgetting to cc you in the previous reply.
What's the plan to get this patch series into master?

Thanks,
Stephen

