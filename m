Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8D6C4660
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peul3-0007PJ-83; Wed, 22 Mar 2023 05:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukx-0007P1-9L
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:43 -0400
Received: from mail-dbaeur03on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70e]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukv-0003H5-Mb
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGmqGJqrn/PDLqLRQwsdO9QtyQErqiKMHlAzlXenACfkq9/S7OY98HnzhDy2g7WpBNruaFK+wvWNCUjw2Gn/hJizcdiIJQ3bvBT+t67YwtWo52+OsBMCuEB4fkPlKfaRAOj7hvTsYuU8ZNKlbakrYoF3iUK5JFOHamtKX2yCUEJhR8Nnxygl+dnjJKc54Qcf8+E53uKZ9Vh9WpNa0ztFO84vNVGYx3kFvDyqbQsDsCtgUd8EzU6O+ROOcECGSILTQgc+yNjXmm54kb9VoQT+R+HXHaF42p6OFptWsxTNz7/67OobpzN4HXrCx/9Ff+0JH+UUgyPh3MRE0OJTT+InEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=lCP9TmUUcqJQp0d8qAGd+SRYTaui0ppVjBwd877/8hzZU/Ytu2qEK1Kz/8Ct8RQF3Irjme/BTcXk/RKKm3Ce2iJJmut/2WxN31LUmIhos7pgDM9lXzyi/0DkvgG+Rh1RgC41frLIsbm6mm1zK+NMoLmZxfSfR199ZoLCAo2376MZ21C6FUJ2DCkOw66ttnQWwvRRNdasgnYxRHUmNsJJP56BhSkfOLwEVFvu6FUra3rbdXVA/srS5p8UBiifd8EG3M71qqzpcVKq9gBDavGSGjihqGyuojLTjoMzcfzk1l8oraPNHn/p0zzBmALKdXnm0GCgHvj7AnpOooqfF2hjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=Ei78eLsVypZW5g8JbxbXxMmvmhzwcIEF5hemFni+7Tk4TELWSVTgAeMpUtL4mt3lzkzLKv7Mbkhgaz+GbA97N+KcpNaiNukhr7j7HHmxtPmw8lv3ntEEufI9DXY0Cv251xevLko2DbkNDBCxn+YqdDbGYRujE5jVjV1OtHTN7wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Wed, 22 Mar 2023 10:26:57 +0100
Message-Id: <20230322092704.22776-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013EB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a15e94-0ef6-497b-fe0b-08db2ab7ae17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vtF9LKm7L7/j/pceQmQBlMjOTxvJL1Ziy3lR4GB4Tnr5qXmfQSMRiq/tumnDXYpQTaVnRoKTxIMzzj37JswoVOoJ1NNajBeDQ2IxTRV3hHnbbaXgk4xe7IuYiwatHy1Cn38l14OAutWgyS9F189GaTD3WR+lrLI8u1qroyJzjabxSduqzjBeuTKbJZxW4L+Z/clW3GqhCsqHj6iuqA4IlE4/w94eXZ71Ev1oUUHfMLaC/T8Jhjb18jfVZk/DlJBPj6A/4s2ss9xp1EW9ZodnQQqAocRCfCyJa8/DB7GI2SuhYEzAWTuHP6D7mr3qKqq1n67vnCfzF57ChAbEsltEbefhqr29HeGmb76tcu0JCXc6Xyt0D4ZQ756hXsoGW+SkMC+Tp69ekN258Bu2gVjjQC6t3roee9u8u15Ofvajy18u+mWEbSH9ceUrkDtvULBZzHn2j7Q8I1DAW75/4gdnkneh3GnL7fDc4+caFff5kDK9aaixwVCF7TE1rOks0OVJIiAgFYCkXcFgbYg0SzVC+5h1EZkAlbQevtPnDqKyamCRtjaWsAbSDsvmJjqguivEIY0lXzpt8ThbI7rD4oa5AFDnnylBWrfQx07ldye5uXk0uptwzpttlvLwt73OB9ef0eTaasdrgLiQMbX+9ysqDQz9sBAIiuTTaPc/ldxNLihW6UOOj4ZWtxpo3PU4uV6zyzvNKdZ/7eYvU5F+Rh5F8qVvIw95JgWCieMFx9xRgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(4744005)(5660300002)(41300700001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8WbEBFMOJwD7pB12nV9c7WZWjgFxDIZNJcudQ85VAzLaJnt4oLEcBEt7RbEX?=
 =?us-ascii?Q?uPxdzrSRoilarJXvhpfstKNLs/Xh5uMQ4oFPoWQ4jn95amFN9nbp/n7GtKeJ?=
 =?us-ascii?Q?5yisXAycuqnISRHc9B9RjAv8TOzPWrZg3KlruYq3AC0oz02pq+DDcvGnjsIA?=
 =?us-ascii?Q?KOy344MWk8pHZ68TqjPhywMnJbpOP+F7f22AZBi4PY9ukQ/tRU8t2Eaqtnxe?=
 =?us-ascii?Q?XElfQpQC3a4VyFfHBEcsomLvTeUDR3zweRGCDPgkoTG1SuqNggGQX0I9SCt9?=
 =?us-ascii?Q?qc5grWsTALNRYqDBbJbm/SdZu1yycP/HvpH/oeaEVzHiRRD29SKfp4KS0fDS?=
 =?us-ascii?Q?FtRuAols3555fnNy3+ApHH33fSu74j8MWCHRMu4+6N/ACMCGGJ/01p4Vndah?=
 =?us-ascii?Q?8HFBq+DuGwMrKFMPGlNNivAFTud2yWryvLZ6+8sEvAt61h00r+bzACQ2ANWL?=
 =?us-ascii?Q?MdYqgeMA7T1PpjyUdyYrZTeKkXOgKsYwdCt6PD2iI49HHD22QbLNTaVvxu/C?=
 =?us-ascii?Q?SpeuncBKp1msnQ0R+f83H+caBAbec789vhgXUSB4LscpO7lSYWUaHqp1U7gN?=
 =?us-ascii?Q?+rVlUoEG2pu2G+BTmk9KWn0k8ibe5PFOtQ3Y4dSDeYhXvTw9nrM4HD1Io5Ru?=
 =?us-ascii?Q?he0S1RTQZ1NLdlwT2m5GZf/S/C/Z5KlsCcrZyKUcbm3IdmFPR4f+wWNExXAH?=
 =?us-ascii?Q?K0bHa053YIBZZXeQpxqshydlLZk/ty2So3XwfxZIfr+GzFtD2ZePpLYC8yD8?=
 =?us-ascii?Q?2U3UomtS0YLmkEBw5pzaJBnwIDHAd6bpDyIxJ9Kvq1soIKSuWX4a5dWTElyF?=
 =?us-ascii?Q?9oqs+Xv6WST7ZNmzJpSH/Lci3BnFkz3dJjnHlw8LXPKLGL+zTQxmdJ2v9Wfp?=
 =?us-ascii?Q?BQU2UfpfOZtR0VY6Yi6ccBzOlrD2WdcF1vFMC/8LGskbYL7rqLcBgqwZZ+uA?=
 =?us-ascii?Q?GukXpWocA3SYl0UkMErBApNIfHaPuc/IWw1kJn/afW+m6M65MnBa+AX8jr0F?=
 =?us-ascii?Q?Shi7IlKgll0EqgOI9BeUj72sRI6I/VSv0Q2/0KQ/dsaQAQcIZ6OmC3Vbnflw?=
 =?us-ascii?Q?cPYi+N8Nfvd1JSWTqFXA5kDzONc5EtZ8W9/jGEvVX3rQQ7Z2O5RcWsc9bfBy?=
 =?us-ascii?Q?f/hufmxWd9rano9CL33CkQ8Wq5GO39FIP78UY7EMAJrJMRPL2xZXMf9ET/86?=
 =?us-ascii?Q?wEbX4Ph8fXybIIEE2kAf4HgliqJ0m0KYVovqK0Nhvp/RX8My7mJRGuLgL5uJ?=
 =?us-ascii?Q?X0c/aESgRoShvkeO/t1lrlCrSBu0p/5zLt8GEnDMMtbBupMXbczEfaf6F4/M?=
 =?us-ascii?Q?ev50A3GcA38aA77+MPMt5l+NUelflDSFzC0mBYXMUPg0qAKzIqPVP2CyTvW0?=
 =?us-ascii?Q?ylyiNE/pulXJEs2LIGU3wEVmsfj0fwGGoCeBpTuvwAN/dj2LV7lEsBaC79Hp?=
 =?us-ascii?Q?1MBgmTnwYHUOf+TVfwI6YFj4hXuWH+0Pc/oQaTGwd/jvktJv4mpqeiccEA0d?=
 =?us-ascii?Q?raDwdU3le4vhLfUzd0SjhV3shf5FVZL4KXaIo5t5pDc4yobHwlvzodEyQ8JX?=
 =?us-ascii?Q?E957bPVKVaHgXTKGAic9HLCIXiN5y/mB0+kaxDp3fT8f3R9qiXkTrJSsH9nT?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a15e94-0ef6-497b-fe0b-08db2ab7ae17
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:39.2652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQTvD2umNBP8OtWSRfg/zhVxBx39exkLz6ePlpHYtX7Ii+nMkdM3xWlsPfgjlzdF5twsENh+1JGijYSRtFNonxuFIrmqTFYjk6u2YDFXNtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..a9ed6143f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2252,6 +2252,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


