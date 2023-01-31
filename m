Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC2682949
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAQ-0002CG-3e; Tue, 31 Jan 2023 04:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA3-0002Az-Tb
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:44 -0500
Received: from mail-he1eur01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::702]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA2-0001fb-Fl
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARYLC0hDT7SsEBFomAcPUxQ0QIKXolVNRZHoMjZPElHgL2rJFv1z0KS9G/zoO65udZDhu442HNoT7PSN963KNaNaTdtQDa5vTDKkCedg7g273KrDYtBRrZH6uCfccKi9oFsizclldmzgPpibqiQvG0ViRPJe+Xf0gG0Okzf6auiUv4mpH1gx6f8V78KxWKgXs5pb+CMhAiBscfWmT9JzsbN0zOr3AZ8nJB0eG5wwL1ywj1RgBk9+FmHogocddaZCKcwd+g1a2EmAWi8ohTgHso/EVVCSWnkWv5esxtbpvJg6I/SB5EdrKcBY4ZmM7h3ugA8V2d6nYRkPy1G7AAU/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=J5AEth68lrFVzySV2sBsh1QTbWznMLwFg6rH7hLjP+6ojhOaNwHiGod/jov9sqWSNorWNd8s5iixr3ht25iYXBKVt7wdS3E/UEMdMhyaBoDWjjDbmyxBUSuUL3ssUoYX9T5QJFMaLgg6NGyVhUnq0Mv4ZP/vppmf+R/FwQAt5RU2cDfewKozj+97N6eLRTCJczv9uLAcoTlnN0Olxh36uvBX9bPoLbF5/egGlavde7Uz2a6/wztQ/GvoJcqyZMvIOXYVo5LeMiGkNnRcELRNnicYoX0yj2nte0YfR4Pd1qMAiVpWByh9sUQELx/nRdhJZVKDgwjRd4Mz8XLJnuD1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Abq45938CGnKEaQArxmSlaen8sO/agH+n/BVwCof0=;
 b=Jq+LEmriG6UQpshhz6tmxtg+/DipJlMqIysqJ8Wg+OhyVBMdm+IIeEGnqVbNDzls4E5E3vvVmv7jxVLnu+aB2dBMvScMCg1I4zk7SlXoOdybyFjw1T+bp9s51U2D4XjABy2i2NUB1F4Xg6njBOTbVBjnAZCvATBzAiOi+eqMPbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:37 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:37 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 1/9] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Tue, 31 Jan 2023 10:42:24 +0100
Message-Id: <20230131094232.28863-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::18) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6a629d-be7d-48c1-20bc-08db036f7c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7tmVDCbTs9eqavgSe8TsRkwl7Dr2XrXADZPqigzCKFZi2yXCRMBfxJYtfX+8/65vcPPk30JWcSJmZWOtH7swEeDPBkP/lPVU1VQPywnD8pMuQiiXhpdVeMfNCV01nErlE++7UtdYp+nJXJOkllvlhXmB9fueNHeCvI9kQBqoJk7w4i5fzTmiYmpZULbAfGt62V1qg+nh92OTRwBj9Udl2NbKNBqPcLZRFi7FjHcN72XlSM38tP5+9lcBbutzbFsU/cUe5W4gBUGN6UeaJcvUv6rqNKCK8wUsvp8BV7S9acrpYoCQdNKEQljIkvXox71VVTpxM4+Kn/ZZrAY8O6gHcXBsgBo812SRj1grdcP/3JypI7D0zj/Gku6s1IcsHabepNPhScXaPSPy/NdCUJTky8kRvKrPevE0JZHpD/u1YxvDgYgg4yIswxJ3TxN2Lg6Z8BRerig8UkqJksSiXfdKtlnQqGO5eadc5vdMrDZYbFjZYEUlGYMRUActFHFwqsa8PpHDRXD2j9rnoR4d/0tLu1ckEGjd6LSGDwLu39oAK3Xb5AyGbTSQJ9lG2btJVmigHWXXxGleN+SObpzna9Nka4DVwQB5gVk5EWLjU2AwXvKFDQkCUqvidzNAESNbSkl/31Iq2lqlXtLvOzY7x+7/gxsY09sRUFLsRX6YUyqSNrGLbJXc/O7qjcQGHt2gvBJLo3SQI4JFySZpDsgFbg7GcC1l0FiDdIRX8VgoUKDOd9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(4744005)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PqYgRrIC/cne3KGg/DOo5YW3RKixfcDOniA+RaQvcXZITDAjJOdxcJADxpQy?=
 =?us-ascii?Q?EuB5XpWMD0l2jT7WGO5BtxoWk0I1Af9l9/7t8u8OS4VxoHxOSIQU03HbMwZJ?=
 =?us-ascii?Q?GBagnsviJ61G5JaUmOtHIId0n5rDk51Qs107XnHdK1uxccVakJ9g6Q+HFCbx?=
 =?us-ascii?Q?YlFA+m1N/SsxLXnem9eupvjkoS0IWE7l7CvfbKT5k1KR1k3bTJ0gW4RuG/Sw?=
 =?us-ascii?Q?MF9QNTPAWXQEjgVqZbhLLJmuX9gvoL5oaR5nHO+OpjR0ZUYvQI82OCD7jiHe?=
 =?us-ascii?Q?Swl7NJfNyrRmIeHEGbKr8r7RjMN+6Ziq2nIzxlhpL1ndswBP+vfUELSXArj1?=
 =?us-ascii?Q?tiIZRtaMHADrWokHdBZclEDpWXtfHz1/hmr+Lfv/lGNIfSudxPnuSgK3MIXF?=
 =?us-ascii?Q?2Jeo856P6rwF6ZN5+IUPG9e7bFc7gLRyCJbgAZb13m/SNUTsVrtdjDtWUv3c?=
 =?us-ascii?Q?hBCMnGWQ+DVrEVrC5Cf4xjWy5qI/ACwV5KPqO2UExxvtvt9L6No6J84/kk/F?=
 =?us-ascii?Q?5RUKPkAA18nfr84arSOjhShRB2jAZdo9tvLjKsDNWWh4AbktS6Ox2cAXOLFn?=
 =?us-ascii?Q?jyyozPlLikFDEJqvOfz2bFGTx8y7e1pz/pUaSKZNY+h19My/SU998Kuy1473?=
 =?us-ascii?Q?IwSuQYza0sszoBow66JhW8hvDtc/zkL+/EX66Vj4shdLI7RTy+Zd18NrR0OS?=
 =?us-ascii?Q?wTWBqyMYQ8+jkbL1U2QIue9xdLMojOnaMfA3tE5pfUFdRggSJk3t3z3NbyCp?=
 =?us-ascii?Q?M4WkxfR5vxrww+rolBoMI/oxYti6I/49a0hBRdv6WSVTkA34cgtPQQYo0+qd?=
 =?us-ascii?Q?lpocP9MxNUXb8BnCUEBnmX1Mxm7VZFVbnNxdsQxenZb87lsY8tjm8rS6O1uu?=
 =?us-ascii?Q?Hw54mtmpOLZVlBxlAVBiwvi57XV+DPURA1naw9J07bY3sqktlLTPkjaWBEdk?=
 =?us-ascii?Q?dtddJpJC8mFPUBl9KHKUwYJNnwZcwtueAR/jnZUvQI/6fJ4aJ/fCEdRo1MQP?=
 =?us-ascii?Q?vyBf8sFCpLLTFvhbJlP+ewHTp91aGeR96bXzIO0T1fsczJ6D6pzRc2hWQc+K?=
 =?us-ascii?Q?fdvGtOC4Y9mDolP9Iv+jo6w6U6fwXTvL9fofD6WP9iB4FwfQpqH27sobp7e7?=
 =?us-ascii?Q?exhskkYmLaLOpcqQpCf9sn76HG0U1nphgGYv7K31v79VTdrB4U1J3HEpOur6?=
 =?us-ascii?Q?C6xP3g9pJE3UBnYCIjNFSnjoez8UOJh/gA+RtvkISaeo0NE85M+PR77MsY3o?=
 =?us-ascii?Q?F+rlML/YFtjU0rN5kFUCE3lHFzMcKDnmRO75Hi6hxSvWlU5fsyLFdzwS43kS?=
 =?us-ascii?Q?PoTYs4j9wjsM8LBxrugfkkftMseEcX2U/R0RwHBql1vspe9p4ukYeERoRwrt?=
 =?us-ascii?Q?scWapafoY6/0JKMXwvcJ1wfFjwttChcCBBNaACqIxsgOTkQg5n67TQ53Ne3q?=
 =?us-ascii?Q?ID+pIDhsYRH3HMetFHj93+2kEPBJZL+2cEDMszdSW8kuxCvvY/6nDVJ3So07?=
 =?us-ascii?Q?3OSG1GJd3AUts42A2Jesa3aPIQPvJhiVNTI/DGvZVEtDHruf4PHbsns7m9UI?=
 =?us-ascii?Q?Bckpr7lJsnLCHEqWD3JblV147ESSXmnkhNB8AN7OHKupSFS69T5td6TL0Buk?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6a629d-be7d-48c1-20bc-08db036f7c65
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:36.7874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQjt/8qI7ydRzUqM8r1d8LQUAi8yWiQjd0GicGq2RhE5a9xMvPDRkeBBJdJOtdEnIbb1eXGcZhbW1NqUf5ELRWfgyF1WrqTHjNysEKNPN/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=2a01:111:f400:fe1e::702;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


