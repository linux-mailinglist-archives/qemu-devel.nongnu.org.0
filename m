Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A7687845
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYL-0003Zo-16; Thu, 02 Feb 2023 04:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXl-0003YX-Gw
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:09 -0500
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXg-000664-Q5
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiXAsiBSQK3z2KUI89CIWe7e5wfIcC45d+kKcUn39ayvbg1Z2KTMTF1geN5Kng0XyHg7cyxZd58cgBT2Em2opnZRLYHBlwW2I2EaEHXbAhlpJEDklfKuguGwPX/enkHDcnGi+mekRyZcUnYPMaBOkReZyuuSjetZ44tw2zQzH645Ts7cMyx29FUxHVimCxh1R7WNbnVAGWWSPH9r7ph7Q7f0hKD1oOxoAkjPC8VXcbRrq/JRVmxRzqq0Br+SwdVa5j9W3GVl/6sGQ1A6B9epUPITvmO35h85g2NtRgBN4NB4rQ9y2aI/yNaFeXd7c8uNx+kDG1dB+tWwbYcsxnzW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9imnkEvP3MaTb4smUURf0UHEQ5L8+nHQ/6D1HApSodk=;
 b=FRRfCwb5DgNL8TF0NL8NWQGMmmQo6ePgerFb7LIKddQk8jVKNeqCe8rBashq0h5EXnZZLcOtGxfhkX+Vec4UyLaI/QinKDeM+QlUVVQt7CpHo4t0J72Cn3Kcy9M4FO9Web4hjs0MTjwPmKSq1oTjQJ9wPJ6tzlwoxjLyy7v+PjIu336iCvv9lXUL0t0cbJXhFxwG6DdYfBp+aESuTKr6UnMBStLnZ2FE8KwQpOJCViwlGOJazxxaC087IYzxlk56fGTVfmwhNj69dnZZtcTmneZFZNCIskB63kTIPbBmxSvmcdBA5YDUCe0wq1sogXT0Nrgw2AfeB8lp6+4c/YMsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9imnkEvP3MaTb4smUURf0UHEQ5L8+nHQ/6D1HApSodk=;
 b=Fh68YWTdjVmHsZubVT87RfNkOP4gAJzq1shEeJPh5rZVTUd0tvetW451vuvt2XHN60c7LtqSGDVj+guhjH2MmCMImA3qSYwW39V0JgJm4Tn/lyYSj5eT4QoQRhzRdwaqsTcdSXjP5tFNfDPb3+5J73VrGmpddV4tbGrW6Oym4No=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Thu,  2 Feb 2023 08:52:49 +0100
Message-Id: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::28) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d63147-25ca-40af-4cfc-08db04fcb229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzdFhxyiVE2Kfusa+TQELX53VjcyQ+URPiijz3hqlE3eLJs8GUp+OCYgKOfYCd0XyTI7m2tb/U1WcNu0TqANMerQ0jUzcb6fmbRvfsvPj5uDWC7MO4VKMeSLCjAgDBP5a5qIzFvzLd4WKnHyeBMSTuD/+OGtF5dAmg/SEzuWj5dXk3aReCgcaj+B8mfgHxjqedtt1YEINMPlVCbKlJ6Peymbaa80p6fArWLsZQIA/Q4EwkEK1Vac9ElFBTe0LrgmFGXvL30UkN+/j1AyxW1Zip28SQk4FXncuLzHPZP+FspRT5QY+S/0kJc/AYyQ5aqLizZ73/2VFLTeDs4vTa0ccVAilBQ4ApEQoz/plsmD7xK1drx/FM8ydvZBOdA3V2/0vFtSqFoPj3V12pHvt1Hjb7mT7pit+HCC3KoM/UBTEDE1s2b7iLTYMomrsvgPps1IjhldTPG2VzRpj7aEipjfUWJfYz4JPnK6pC44+1mPSpgHwSOXM7qSTnKTyIaDPsgHIYa706Ebcl7fwr6WU01zRDYx4dq7uTVruOFGG8MaepS1dCw2HFwa05/BdLTjFMW0lJOA5pKWCurQTnNKhKpxQz0NXUYUQ+GgxyhAXRFRC19kw9ocrP0FpywudFhXf2fCDjFMeAu3lbYBuQIrBONkXU0c++X2ugaiEC/E6BGbzcAnA6UoUUdyjTTDFecRqlNQ6C4xV3oh4owoJGHVr/3O4pYQmLcjRKy0oJJD+KfOx2hqm/OwLQuShJliIE6kUgFR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(966005)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ON5FlvPlcLxEPEoJooXlkCu6MYgwM4xtI1ksVxVArjR1CtLSw5xiG9t/mxwI?=
 =?us-ascii?Q?tXFvDICr4gd1VftYJiBjV8DhqTESMjby36LoBWrZMKY2udtPTFRAEoVZPNcx?=
 =?us-ascii?Q?raNuGAnwohWrnRAS1O+OT1PGvcHgGDPOAPsxOAkGx/zUmxZTECZU2llQd0VJ?=
 =?us-ascii?Q?YsPheL9i0xlWH09XM/xEB1Py8w16zmNPZjninr/543Yykgkz2c71/3/yOYM1?=
 =?us-ascii?Q?6hdEbHTGtdNced6fQbKs+utyMP9y5xB1o5AJYKSMtIoTmzKE4ee/iNJwum2I?=
 =?us-ascii?Q?Q7efKr0OsmE7Dzwve2J5ZpmVFVpKr/WoeZEluAa7wmojn6SNii92M+s0CIzw?=
 =?us-ascii?Q?eTYz/M0R5SW4XO2+QKa+dh+n9KeKjEcyFs/DsaxFc1k6tOEBXooZHorK0oZi?=
 =?us-ascii?Q?kJKq7gxQL6Wrmtxr1m8GXa2jzBeemmlS7T9xh+3DwCayhdPP00az//3ePz+6?=
 =?us-ascii?Q?lG8AqnYMPcEWQ1p3v5F9IIuomaBsuuQb3mwHZLxMZZjYxN0tjUqbIoDfi58I?=
 =?us-ascii?Q?QAfZ6r9qR048sve376MDpfQzNwbHRMMZ1AZjSsy1hbvcAqCKQkPFiJxrR1fR?=
 =?us-ascii?Q?cVHoyCA3w+1/XIi//uVu+HurgK3iqGiHMEt6KVGIayGnXVJAGqhRD5T4o3MY?=
 =?us-ascii?Q?A2HcF/S4j5Amjht9x2dj4foP1+2ZAawMRDhruyXyr9X/Ry4ZLuGyaZwfD0eQ?=
 =?us-ascii?Q?HStU/zytPluh88Y9qSaycpQooj0tMC5BSIgHBIzhN/sSOIR7O+9rUIf6gJ2T?=
 =?us-ascii?Q?WYe7GN+JNn/nFd6dJWQnwF37/jdbXLmzvKUVeLMKUEjomIY8bWv6pJkZZzLA?=
 =?us-ascii?Q?tCVmufYF+XfXu2zl9LMlD7/x1B5Ox9wSqWjHDFtkIHKpfsihMTEnus5o4ttz?=
 =?us-ascii?Q?cruR+2oLhyTZIOUuVyQ+Nfwx+yXVZ2dWEq1oX3d+eeXfCIpes5wjrajwfWzp?=
 =?us-ascii?Q?YTEEd2oId2ZqHdkPf30CUdssONufc5Lp/QxJSfORJ3IReDSLAw0YRyxlYN3z?=
 =?us-ascii?Q?jPyhRZxFdkJrh86DyEd111TKi8kA8GCrWb+O9RJ+5ddXhDCC/HbLDQQj+2zp?=
 =?us-ascii?Q?Ph/XmTOKiWkVhRpEkFAazA+k/YCgT2E88AmY9QDLoFsB+E0A3VrzAmVkRxot?=
 =?us-ascii?Q?AnBqf+gVKsddOQnN4uUEGpzs480/Pc4HNHNWW2xzjmYNxP9wkRtGi5wzIfG6?=
 =?us-ascii?Q?TZOvhRhwgGAELMgNeoJUhfUV1ZtQEhh92y5SDmkmXD54ss1BOxy50Kh9aqwB?=
 =?us-ascii?Q?2pfW0UiupwP1iDAuniQMXIbFdrqbCdlHJw98PxAjppOH2iS2m5sD+vJoIhrf?=
 =?us-ascii?Q?s5ksBxo13B4ZgsCrF2Az1pxI6v52obixwuBgxN3Yco9G41t4BMrLWnSYpxvK?=
 =?us-ascii?Q?CiqsEXYqcCYdIwg69qIEuCEdUIcljWKs7X5OUsflm+cqQ49DVPQTm4cK1s6w?=
 =?us-ascii?Q?jD54HC8huEBNNQXsowKBcwVWkHsdNza/h3xkPeR3Wk9T/bg1d/7rgokjLTzL?=
 =?us-ascii?Q?xkCTVhlZV7d+F2kmimeO38OaBRBgJjv1vN70IEn4V9BhV+okgQiVxk2vDq22?=
 =?us-ascii?Q?cE2X4Y4e9ifVGZe8xG8iXrchD02WjgeIpikrgEIgKhj7tKuy74NlVjY0E/WU?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d63147-25ca-40af-4cfc-08db04fcb229
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:57.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIPLiZ+wgFNNdsZFxzPit6QunCqsF8dhRQvXqGOSCmNuTW11jZt8AU2MVX6RHYvHpGpp9ytrqpfXaCnE+O9NqvjlPUjmXD6ONpmajoOJRoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: <20230201042615.34706-1-akihiko.odaki@daynix.com>
([PATCH v7 0/9] Introduce igb)

Rebased on latest changes from Akihiko, and merged changes from my
original patchset:
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Changes since v5:
- Added back an unecessarily removed empty line

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko

Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 199 ++++++++++++++++++++++++++++++++++---------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 175 insertions(+), 38 deletions(-)

-- 
2.34.1


