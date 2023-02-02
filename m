Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2935687677
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8R-0008W8-GX; Thu, 02 Feb 2023 02:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8I-0008Sr-TN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:48 -0500
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70e]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8H-0001eR-9W
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNtTRTFxytJ7mJLB8DSad1cWYVXJaH3BTZ+MhzV5CmivP2NBaGxtT4QNIKI0JdMUkV98QoU8tr109UrKgkUUmlYoWoTAVeBZ2bcCs5arFSCEu9qbBQbWWZFu8/gpMIZP9FImHQGOaUUOaKgA6iAqfTGs0mgRu+0JxN3/4IqNunaXTuowEBx8tK0SP5AguuMpG8iCa5F4KVL4pmi5bZlFoLD9W+FwNCptPa5a3ZTpb5xsQdbex8gYgxXpSBIAlTjd4dWY9VdwOg+a2sxHoa/tj1iU3XuJUkghFflNtZRCiXl93G4lA1VMfhojxAhc78ZtACHR3SKbmdNZnN5P8qbSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=D6jNqMlAt/uauK0eBrgveyhCLJAEUxTTuuZLlz0QTGgoqosgDBbZYVdLwGkm1wXNByo8O7hJPuI+8zfpYiXA9QZp9zf4ZVX37jUJHxPpC21WGsBQfmouy+Bnmx3hMC/WjnE2lTpT3YdDIeO9tiL5ALF2exnDL8hj03FcTKwd/jM4I3+cdovtG31hkmXtlKvhRUysysax0Kzgga0PAjtwPgWbfTWxYBicrWVFaO01KspXSq3yL3PUTFfyQ66lVUqG42YWSbULuMuKVdY8oD7s/r8xeecybQOH54x3rWWXyEok0GLw/inG32GYo0fwbXH8/rXMvZ7K29O31OvNHcFtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=Re4073AQHZvmoiqkpDGg6uwy+korO70wfYFZ7W4D9T20B0oWaXhFdkaIU/Alf9S8oHpiN8rSmfenyIHephRjbD9zdEPao3uPVgN0RihEc2C7sJdJ2GyD/ftG+DQJcZxfnmgBT5XL8GdkMFERuydzh+DfDBFjLjbKqlLV7NPVFfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Thu,  2 Feb 2023 08:26:41 +0100
Message-Id: <20230202072648.4743-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe4fa45-1469-4b45-3dd8-08db04f01428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6k6TnMtoka7uVqWDmznvBW0uH/3L1F8OFYmjt0hMr1vzN5Vh9wLBfEheNYP35x/iaS483y5hGaTe+GwmS6cZ+pxI5S67RQarfQNm+iKUGaMTG9r6QeVutdu0+4UxksOBxaEOshSrYmzyyx14xPE3Fd7MhAgVN6vKeMEavZF63txrv7sbbnq5c0+zLz/vKfrSqOCFZlvcdTOkocYxsnOxCEySoLfF3ILCaZDY0omNo8fzG7wRseDkYejCFMbcpOiwd0RuJiQTTTJzdWILWv8jtfPCH1E87TGPRqWHWHwCG6rHDQ+RsQUiaMe8LpINDB4N7t0w7fYz4bn2dUUAAegnBYa/jPYa3Cf0tQWsdze9Ug+t4qb9i3cf0sEsQm1Eeo9sqCD+M3lmqjY9cOZla5V4VxuLsIYHOUq2GTGp41QatepAiQciPc9v8dE3vXbjuFoDKPRgvIdrdiTuigYbGe32EQ2Mmm+3Gujzir9h/+CAGK/XsYcTk59KISiIjwnezt78URHpfJG8e2QKc1/P/RbXpMl4j3tIFwQ0I7DVlLJclQ28+z30w2OVjmLO/tnTG3L0ZnxYJrfgn95S3EvWw3GhkFaJQyPXtd+SeMvXwxTOXJIzu23U9m3qS88hR4/rLr2xp3kTwTKtBVpdf0TtPZF8WB1ItjixTZ9AwfcJos0/6fBHbXPdu1zbfwjKFGAkWWE08qghH2Ic9j9kcf9vJF2JxirmgyUaQl1Kej3AOg4Keo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(4744005)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QpCK/BarH4yrcisRpMDpHjNLgQKQvg8CvvyWkqNdol+zdsGBBcnZWwjr0Pws?=
 =?us-ascii?Q?5p3G5HCeYpPzk9lRvE/10VO4scR4QUC0kRbcMelOt1xdDygI6nXItktgkHOV?=
 =?us-ascii?Q?yEpvKu3xWY3VkpB0a5heJw4ccen11aReO7/FwsksGe31t3a754E+Ja5p1l/0?=
 =?us-ascii?Q?CdT4SCzMpjLfSWJaZY8CUWaItaePq8dqHsVueZOBn4t0SyD0ZQgT3OJ5TpCb?=
 =?us-ascii?Q?RxOm3CLDhQgKNO59WUtrZkJLqZ5FWWRWmvGCHRhYs4ThSr7YbW6Fc8PwW8H3?=
 =?us-ascii?Q?kXzkVc+txfIWN7LdsNNsy3NTSuFiVnCOje479T9+t0pP7FkBd5CnQXL2PKr4?=
 =?us-ascii?Q?m/Pxqe5FknO85gYlLYtsNaeKAzO+eWCb9Uo42CM2rqH/+qII25jq0cbQCe/M?=
 =?us-ascii?Q?oJI8rgosLRJF9NbOVDEcgb0QWANrJmmmO9mdwKnYQPUIts5vcHwyslvgVmC/?=
 =?us-ascii?Q?hzvmTgdlMX2zVZgVGucWz50C/uuDiX/0gJpUbXq4lsI0NCS0CLafIQXGwLfg?=
 =?us-ascii?Q?IBfbJt6QpWF96GPwPp6W3W39NerqQhemqylJgkAGPesFqW2gjrji4sOSahfN?=
 =?us-ascii?Q?5TFMbhbEjHsycE77BH29aqSTva8+hg0UVr0IdXtg9Rb8Qk+2kJ/tmgU7Lga1?=
 =?us-ascii?Q?AYF9XYX101I2X/wtHj6j/aYNn1FFL9X+wR+uivVgg3SU+DQ7yk7btbAmUOyU?=
 =?us-ascii?Q?CdnT1FEMw+IGj0V1xRyrAnb8e0KYihMO9ZicHtMzNNAtd4dDagDt8PFy5klF?=
 =?us-ascii?Q?WK2/ljDwYpnOzCBs989GTRdmqnq3/kz6HaqSXcx5vuv5qqb9LcTRIacLei2m?=
 =?us-ascii?Q?VC1Uq1DjlOmFTlEqMeONFLV7Jvpob3Jr483qH7bFaBpMzFTvqgW3EzZsaBin?=
 =?us-ascii?Q?ENXcxGQSLO5s9+h+6vW0HpOHsBvma09to5BLVm83OQz6skZqZw7NZb8PHa0v?=
 =?us-ascii?Q?hIiJzF+DAytPvJHdQUJpMlgmgkaHybbnjAMBK5NwsVcB+bqQCaERAWxI5t99?=
 =?us-ascii?Q?ce99VyFFJU7fWZYgxsp+XL5SunImlgHQAZ/ybto/u8wpqH41koMJ3JRwip10?=
 =?us-ascii?Q?pNNMY6n3bRs9p3eKQACcKGL64RrDQdyHUPMZ+tbYQjrOFi30hnQyBFBRUtI4?=
 =?us-ascii?Q?mL76TLKSXqoxH0fz6iQk+DMoL5bqqAusSyoLqS5PvYyMYSYyjOTy4mYodAni?=
 =?us-ascii?Q?uSvUBDIyY2mwnQbI5rFFi/DJNzqZTuLZCVYgeMFNrky/CWyoICBlkLxTRVOb?=
 =?us-ascii?Q?mn4+xU4yfVvgpfVq+uva4DwoZngpJQhIRqCbKng+NifPxuK7NGPXmGacc2Xn?=
 =?us-ascii?Q?DvEwAqXJpLM2tH8txGccPXFYRFf2NpvhjrPBBcnbEuj9mnO2611QIvR/hbla?=
 =?us-ascii?Q?kkm9lMmDNs+84VA4yDjIRLipIZiYf4dD2RqBLotTHl7b4yBDJ4XH0rPc4I71?=
 =?us-ascii?Q?U6wX7PnBZFSADgaPgec6BvPi5pWTuiGOUNJeP1NGv3NP2pUC72MkUrgKvmcB?=
 =?us-ascii?Q?mmvBbck3KmsQ3ESSJHC8DIZUUNij+m3MmAUmMeVEbhprXLzH7OlEqEuGPKDP?=
 =?us-ascii?Q?wyCsEWbYECGhLLGUngwT/7Qg2oJYla+tiY/IMNddQC+Dbiv9HoiZFHyBCexO?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe4fa45-1469-4b45-3dd8-08db04f01428
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.1306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtzGvRTnQGzNCQIdE4XK3WoMTifTX2PS79OED/aOgwe7nJmPI3fPscO0hgpLypiW8lNeUr9hn0AkdamM9z5iowNYFr0NuLPLhJx9H2HCuuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
index ece23b2b15..7d0e84ce37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


