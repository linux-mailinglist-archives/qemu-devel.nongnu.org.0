Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A475592A7B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:58:25 +0200 (CEST)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUzQ-00007l-FG
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZs-0001Hn-4G
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:01 -0400
Received: from mail-vi1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::731]:61799
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZo-0001E3-Oj
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tpp3T/relVg9QRGxxKE6ClE2Bxy9yG1uIrGBK/QBRr6WM/WfPBrFoC0AAG6pkuFxRqjJupLvctj+SWplWBmXXNVB8ikKKrmATn8whz6LiO1hKZ5tNtQ7MmCEi78aBQsTBAP1qUJIGN7Lt1lYEsyHpfwwzaDtRoLgG8iH7UUQyYZXNCL7np6c76Yafkw3coA9aFB/EtEBYZ1U4SG4wKQ9enjtAp7IlmxhXItahNriIWaFv2mYi2wKSHWa0ZZk/Igb4SAlOSMOJp1bZjLJdErwUswvcGRjTBlmDfeckN9NiIStFA9JNCXLCRcQZJ2invAs5DrC/ecNdJmBIEHNEFijZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhV8OAjKLRkkfzIhY9YU4bpA8zKjE7DiB0Lb08EnAr4=;
 b=Ea6pY7vshvOBZeqSI9Kil7criRlBWBP3a9sNWPLMBa+vCbiz6SwK+fsVA4lR5DKQuGaTiF3z2ZgJhAOoMB7/amzWH8ObfiX2xgAH5d4wu3pHBAuFPhHRNluy7iLGpiCqhi8wwTVcv2kDY/sjmHVo/+si2MbAwAsycQu4fp7oJGtjFboVWL+MWq+1EYOAvgFigkDce8PZDVxc+DKDedhTTq6AMu/zFHZuPoTrxbXZqqFOo5L+2cl5cSvq7XmlmolXBwnU2nGbIc15OV+zMQazXFYJRkitbBgIKhYdeUKuAtK2jQm1/lTE0nWRBth2erYV5W9AYFj3QHVrAYkUV8jmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhV8OAjKLRkkfzIhY9YU4bpA8zKjE7DiB0Lb08EnAr4=;
 b=IKcDQ+3svvOVffoCzWO5l6Itl68cKagvdSpEi09Cb5/JxD8RvhUSvVKxk4dOY3PbKeQ5p/mu3ESE9nUls8t3rMo8sB5APEHvQ9ytsx64OCLqb9NvDLErORexqUGgfw8ynDLWjaxU8c7fcjXahCdVWlxHfzgNC+vNBGXGcDco5wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:26:51 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:26:51 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
Subject: [PATCH 0/20] Convert nanoMIPS disassembler from C++ to C
Date: Mon, 15 Aug 2022 09:26:09 +0200
Message-Id: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cb77670-736c-4f5e-68bb-08da7e8f8565
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGStY/0vncNRTDv5QqPTtspSv5xfnzeRmp/lR4juahppWSHb0+v2l7gQv43QtTLCSFhiMVQWTgUQzOh0fD/pTO+LQajn7UsPjtbwClM4b6DLatJjZzFmtdfKN8aJKdIWmrsycy1LYRUNySP21BwcSybJPRhBA17FI6gZCKiXkrO9mUxjhlYFwCKEBZj1xTe6NIQFg5cqqoxdY3Mu44TwX7UEqA/d5x9WnCXrRCU3Bf6cqdKMc/5lBAVTyJrXmv2IU+7tihDvgg9upMGzVpmAJ8TNM3smv4oixOK118CGEyjHAmiUtKnJqjQi/k3gxMJbROlaa7S8jVru6/3a5c4/iiM2v7JgbuBuVB00mMzeqwk89WPCNl+m70WsWwv3eNRXl+wKRgaVck2f09d0OqpLKK5kkBoHzkIyEdRjgatcHGCNohTudqaZhdExORTydCXcsTV8UVqLX14CiljEmxmBHK5ziCeLjw4wAqru4L5QZHD66GpcgL2LqK42ehYbmegRoGyCjS+Zv6fl1NuN/BZCP0O0ruhPdynxWR4swMByc2OTtPWVpi5TsZNeDHLQ0yYaGIHVeKEIXA7/MEe6pZz53AjQ8QWgGGekxUJEkY0qCsNgX4i7h3ObzbTEbcHlMd2DtLFpuluOreuS991CSqZR+rgBEborIyQciUEmybLX/ECNV1XjpnXYY8DXfjuqHvjvklEqDj4ECULpCi2KC9oboVSF7ViaeCtxrJ8jaIzoUabmSjD8Sb/Up6TMANn/eziWAJDH1YS3GW0UHazgyhfBNgzvm8oUkFj8CxPY8/N0ixq/h36wyEMcFSckg9q8oaeQmiR5URJc+z2wwkHI0lxe7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(396003)(346002)(376002)(366004)(86362001)(2616005)(6666004)(186003)(316002)(41300700001)(107886003)(44832011)(8676002)(4744005)(36756003)(8936002)(1076003)(4326008)(66556008)(5660300002)(66476007)(66946007)(38100700002)(26005)(2906002)(6916009)(966005)(38350700002)(478600001)(6486002)(6512007)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?twoZe26AEi7O61cOFLWIXqWLnaPtDq/Qv+n9rnkS0Ay4PadJksaliVtTiD3/?=
 =?us-ascii?Q?w4AigeHARTB8TSe6yn8HMv44za6X/rGQcRdqh/laRcjzCNnP5AXCqMH+Wf+w?=
 =?us-ascii?Q?rwFbKt6oKCFQC+V1EMXnv1lVBDNvz/u1/zUEBssKELGlEIfK8xqw6vOI8FTQ?=
 =?us-ascii?Q?ZBuPygMPjPztiHDL0U6nDajhirG3lAP9tyaE2Uq1EYxvYwcWm/TI6UNRiid+?=
 =?us-ascii?Q?F2knEZUvs1IJxLeMZ1+7Jj+6cnusG+Vq/XLUyb9ZwB6Rcs5akTBLOhvvQh1Z?=
 =?us-ascii?Q?8cGZFArEg/4AS4MjfPcQvP4PB7YnxtwqnmYaY4t8c60VY4d9SdRO/nq9Pg00?=
 =?us-ascii?Q?P0gVRtvp6HKflklPGPQPb0W/sTG+zDs1gND0PnW28BSrkMgYLnm8FWfM88xc?=
 =?us-ascii?Q?4g4ea/8Nbw1uK0mzCcR8mD/c1sx+bBEnsVzhLVP6hnMujOLZE2P5McZOH1Id?=
 =?us-ascii?Q?mzm8XdudmIHqE40US2Rmca2UiF5yfVgWo9mnKwO7VCMl+I2qRB/hjONyt/+u?=
 =?us-ascii?Q?oQ4RVFIDhsvqBItKw70wZhjpXrpC1R8cXHmqz7RqGk9Xg7SMl2MlbwxiPBn3?=
 =?us-ascii?Q?bPk/DauVhBOk7ieII2Rqgq/Fvz4WMgghaIuA6gWPRh/JxgcApKhCJQtLOxHx?=
 =?us-ascii?Q?Dm8u0auXZeUO5fcpo5Fco8mvbm5/J9U48QqG4Zm7tV++6QftgiGjX0iPZMt5?=
 =?us-ascii?Q?0RVdWFwblXwObeEfSI28TyCd6ZEa5Z6OeYZNRGjmzxxjdyZZ8dx/kEOt5DV+?=
 =?us-ascii?Q?toLctZPNDkNNwASXdL3QmmxKDIOke8pCfc8ZrMmfNqFTIZXytHB2RpGMafnI?=
 =?us-ascii?Q?ohNOEAwQnFOz3cZ0n/R3ZvujnvWH7UgHRr0gj8ev3ZfKbAeWTQDjB6MXA4GD?=
 =?us-ascii?Q?dEfUo86ubzMRm26igaCShjpC73xA9lJswPpgHtFnHv0x12lzx+4rnhwJYCtQ?=
 =?us-ascii?Q?gm/3rlrrGDdJoOtMvzQnSgTWC9svSneeNIhiLFrX0EekiAdHtvWNkfmCqYHm?=
 =?us-ascii?Q?IMDJJBxsXEX4O/qpFbHLiAKQycrkhEn9m6kdZQOij139NWYugPbLaLtBvXCY?=
 =?us-ascii?Q?HD3iHxm9JFQSXLU9EwclUrDa8jI6XvX337fOi6StQwmPrqC4htRuaAgFo5WF?=
 =?us-ascii?Q?M6DVoLn11lHNPepjlNbphQSyWSoM248EfKdEY/rKTyRa5HJpuOp5xF3Somfn?=
 =?us-ascii?Q?ANOPNYF/XKH4SNMXXpI7drq2PsgU/sIzC56rEp3fkFv/nRt0WLsTgeme1gYa?=
 =?us-ascii?Q?b/Rx7V/WKLFjPI2ayQ76u+ceUxayZlmpUHLcV8pPUj6X57f4Bt7KbEJytUbP?=
 =?us-ascii?Q?EBwPdbAes8S53AZpxgZBNNW5rN1wHuoatlN/a7A+UYUgo0Qi57YikWx2eP+U?=
 =?us-ascii?Q?jdv7Kc2Z4YLZkNW/fmWEsNnpv6lwc/SQuk68QBYVlv3g49U6gOaldwQdLYT5?=
 =?us-ascii?Q?P5YNu98F6wqB2h32xFfitWG/2ayKepV3LNtVkLM7k1qMR8BskjWWrB35MdjQ?=
 =?us-ascii?Q?xx8KxpqQwGb3swsNeDuBDX1A7Tv9H4xtKG6n6Mbut7zU6XVDYDEemk7WVowN?=
 =?us-ascii?Q?aQfYbpUqWtZvV01f/Jaxs6Z/D4qcMdUl2bBU/LVnujalaRANecceJsPPvdav?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb77670-736c-4f5e-68bb-08da7e8f8565
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:26:51.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayqpu69TAfRCYdD8KVOWVkIjNRah6iiGalvGYjBqgwONzPnyMRbXTuW00oVD8WStNO1O07Ol5xer3PIYAlvcwEIMLe58WBMN8CCXMJz9sCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=2a01:111:f400:fe0e::731;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset converts the nanomips disassembler to plain C. C++ features
like class, std::string type, exception handling, and function overloading
have been removed and replaced with the equivalent C code.

Please see the discussion about why converting it here:
https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg01803.html



