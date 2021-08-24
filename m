Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB83F6A69
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 22:31:12 +0200 (CEST)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mId4h-000352-3i
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 16:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mId3H-0001l8-3M
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 16:29:43 -0400
Received: from mail-dm6nam10on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62a]:30497
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mId3C-0000jc-Qa
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 16:29:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR38ZN60lbJo1ItSSGRCWGKu9luHpwzj80I/tjixjsorqLKDSEQKdaXkWB3YIVZoOkHZkParN7tpbCGV+unOBiw3KgRvrNPNN4CqZTL8aiU1yzj12f+fFoxOlI1iTYWIYmK20903NYaOjd6PN14eW22m/v3t5X3o0phBlrUi1B8mElqoudUU3KOWuvjOjzq7VH9yyeAIuwfAKFbfsBIJFTGoKRQKHixKhzGrtvwd3GPK+fkhOXTHzLq5NcJQQQJRjWqdoLNbsDjuFpA69Sfm6plofJrTEsIp6y3Aixr5X96gRwsMRvZNFrKzD+AdrXxAL7iQ1PrEfwFcVXzyo460fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaMIdJxiiO6lWx3gkC/YKzqNA9NkPT4D6N95lsSktoo=;
 b=lTrXARM1iT0UGWXFxyA7jkWQ9VtzjFjhefubA7rdwjNvzut75e6QqbsoM9v7GduW4mVRDapfpORER9atmVBB19SOKQZKC03/amDA64rXX51af4OtD7YpOZj6p7uGqoZg4LKSJfEuUy/j9gCu67FC2HZWRsaD5OFJxtaz0VWmu+/am4VV6FSHK87RIZERU0FQ5DwkI7bloJXhHViZCRi/0gqcsyWgPo/N0u06YGV/WSx7KfFEOij/Qx/xIOznSCGXAlHuQOKMxtDfOIIY677jxfn7FNJsBxIMXHwEekXxcVnXzkEIiO0pTkltULFwpsX/iPkeuqmUvmpsbNXRNewpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaMIdJxiiO6lWx3gkC/YKzqNA9NkPT4D6N95lsSktoo=;
 b=x1XWkABAKM/UKnlQzSeIBRr26B9rcgiAppV+3adnW1WRJR/rqVHUiKvW5tUNDnk8EonHMozZpzKh74C/S3y6dYwoJn8d4V07CRpnQ2JIXcxPUOnWM9HxOZhtYD1aGT03i8kVXiaEsEK8A9MnBGBLHSH6DA8c6qgLDsFKpBh1YSo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Tue, 24 Aug
 2021 20:24:33 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%8]) with mapi id 15.20.4436.019; Tue, 24 Aug 2021
 20:24:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: [ANNOUNCE] QEMU 6.1.0 is now available
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Date: Tue, 24 Aug 2021 15:24:26 -0500
Message-ID: <162983666615.342505.3189857372925060782@amd.com>
User-Agent: alot/0.9
X-ClientProxiedBy: SN7PR04CA0162.namprd04.prod.outlook.com
 (2603:10b6:806:125::17) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN7PR04CA0162.namprd04.prod.outlook.com (2603:10b6:806:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 20:24:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50050757-c9ba-44fe-dce4-08d9673d2f42
X-MS-TrafficTypeDiagnostic: CH2PR12MB4134:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4134B17F724684D9DC6365E795C59@CH2PR12MB4134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVb+mLwESt9YqdlrC7biu29WVdWwzIZacJukWVC3QjRQRxLp77ZfRPEX2d82V9zs+GIO4q2v//RE/XrVxoibXu0BYuzmgGcfnQGLZze1AUPHG8bOAw/YK3E0SpmRDAADuVMPXWltML3N/PVc7YdZ6NWtbvhdp/5aiENQQQv+6dY9JDuZmLVyADvJkbeWy1Bov66tuM3LQQrenj3dGWivm9dwA4TWVmJxdbEZtYWlTq2MqJtmwLu/vmw1BWOCMPbCojbd5lXSzFcB3VuzVHzJ2m3ihNWh0VW5j+ai50TELQtNdDt5ex/esG7kAfyr/KoHC5GT0mHS58QCylO8RAvsoT2VjNNI7/ms0cpPgyqY6cKT5YrczTpYJ5jAqFoKn3lEPnV6JaxWFXbPciFHUKkyYvUWZXFQE9yeJPqkagHm1la78HZVOIhDhInriBZJ8Mq1tB6QnKJyUq3KoONLkqDoQgvcEcRHufjBpztn94X8nBP6LTU/MCnDf7wtwGLTkJanN9Xo35A7O56Q292DdyMmvdomiKhIqgikFVkmNscH0eMVWk9uFgbeN9n1qDMSHL6KIK5Qy4vi98/gIRUUDLtYZCofNl1rwafGEEq5y1ru/ZCBs5LuAIGtfuNF8xihuGmoxdueWwp/WF9nLsWmuNOGO+Q4KE8IcQaoZ07TjuxOppITXRxtkXT27E1Hhaga36eASNiVrpl6Nk+PlTPEylE4LjQ+cT8ZSwfahIys5PT1ApYRnlj5BfHPydjv6XJebaMhqPKlUQTtl+FZ7NR3Dpsxja5VzXh/6Ifii3xjxHqPsTlRPF96iOmn85u8zVVqDWCa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(44832011)(38350700002)(86362001)(6916009)(2906002)(5660300002)(26005)(52116002)(6496006)(66476007)(186003)(66556008)(6666004)(8676002)(966005)(6486002)(316002)(66946007)(478600001)(4326008)(956004)(2616005)(8936002)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnB2L3RrNzd4Nkp0REZhNFNEMlZhYWZ0djF2d3dqZUNoQUt4cU92Q3U4QUpm?=
 =?utf-8?B?Ymc2WmQ0RzNDRlk5aXd2Ykl2L1NyR3lFK1NoUWtlQndQVlJJOHJFTFVtU25o?=
 =?utf-8?B?enJtNkhkYUxlL2NQSEllQjNFY1JqWTg4Z05LbFNxc0YwdWxXb241SXpIdW84?=
 =?utf-8?B?WXQ5QlIxaDhHRzh5MEpINkNHSU5Sb1JuczVia1UwTDdpMUdNeDZ5NWRTaTV0?=
 =?utf-8?B?OVhQSENma3pYQXF5T3JDMUJ0S005NWdNRy9qRzN6ZHdEVHZmeG5kTmhvYUFW?=
 =?utf-8?B?U25DenFjRWd3NjQyejNaVlFENmtCVGFRVmw1KzJrK0ZoOWJlWEFWYUZyelVI?=
 =?utf-8?B?RklFamMrQnJPbmxOK2YwUnpCWVlDd1dxS05aT2FqaHVwOTQ2MURrdEo1aDFY?=
 =?utf-8?B?S2lQclRhaVRkd0NFS1RmV25iTXNGeXUvVGx3RzZLQzgyVXB4MGFleHpKN0dr?=
 =?utf-8?B?TXNqVUlVTkFvUVlKMkFXUXNsWVFyU0F3aHlCeTd4dnkvVGlrbEY4WlYzUlBC?=
 =?utf-8?B?dmY1bkFZbXY0aGlnanVyZzUyYjJjTUg4VWlFQlQ0aWNzNU5lMXR5VVBzNGdz?=
 =?utf-8?B?Qkw4NVVlcE5mQ0pJYzlUbnRwTDBmcjJKa2MvQSt6cDBESGhZeWVqWVVsUlY4?=
 =?utf-8?B?QWc2TTBxSlgzeVh2UUd5SXRZNFNSSHVuQ2JycXFObFJsV25CakFNcFN5dFV6?=
 =?utf-8?B?c1loVkdINWhQamFuejNxV001OVF1SytrQklvZVVobWJCSnMvWnlEVjBORi9w?=
 =?utf-8?B?NmQ2Rmp4MjE5M0FmeldKTWVQbWlka3RqaWlhdmlBdlVlU0dFRFU5dldDaWF4?=
 =?utf-8?B?Q2pucHJ5Tlp1dng4c0FoVXFPNFRCM3l6TDRMeWVuSG1aM2RVczhjU0NpMC9q?=
 =?utf-8?B?eWVtSFVyN1pPcDhrV0hTcCtGaHB2amtOdGxXZE85YzhSK3YxSzhsdGhXQWZF?=
 =?utf-8?B?VFRkZGZpMUxBenhqelMzZFZnOEcyd0FUaWsyVEltUS9TNFRPYlhPVkg1cWNG?=
 =?utf-8?B?eVdpVE5DZHB4dXBCRFo1M0xWZGV3eHUyTVBRMnZ2bDlWcE1tL3ZxVGtwM1gz?=
 =?utf-8?B?cVZydmpSNVVXaC9uaE0wektXTXg3SEpTMXJsUEd4UHdwN0xxVWRLL3VrWGpq?=
 =?utf-8?B?N203a1VzN09jT0ZmcmYzNHg1QW9uM3hvQnZxR0dTOEdOVW9MR1RlSnRIbWxz?=
 =?utf-8?B?TnNWMDVneHVwcUw5L2NRenpINHNETm5IQndmMFpXUC81VTlXL1RyMkVhWkp0?=
 =?utf-8?B?UHhabkdtYWlsbzFXS2IyZVVrVlV3ZXF3bjhxenpBdjZpUVg4bGdOVURDdC9E?=
 =?utf-8?B?RzJSVk8weVV5NlE4bnhvMFMyUW1KU0IrUWtjWitBWk5ueVdtd2t4eElId2kv?=
 =?utf-8?B?blY1a1RsSDdrYmVUYTE4NlhDM0l5UUlQUGE2RGVvd21hMzJsZkZaQ3hWbENB?=
 =?utf-8?B?RVZaeWYyNzhPeE9sdksxcWNaSUpzcW5SUWhmVnFoUjR2bHFxeXl3alFQNWJM?=
 =?utf-8?B?Q3JMUkpCT2FlUnNYeFdXdkl2UUZ2Z0t5TkRnZVlGMDIxRGZUcWxEMzZaZkdP?=
 =?utf-8?B?aUFsN00yOHd6T3pMZ3FZMDZyMHFNQlIwL2RjS0RkaUxNT3RZdStVVWNiNmpZ?=
 =?utf-8?B?bjROcVNpdTF2NDlEeXNiemJwNWxEbmh3V1NmaDVtVDEvUkpsOTNQcFpOMDdK?=
 =?utf-8?B?NmhEK2MvRXFoMFM2bi91Slk4UnVUck9Rcm9Yc0pWNnh1dDRiVTdMYkdkdW1y?=
 =?utf-8?Q?ItmDjT/eRrFiLnqFhnsZfwcjQPfrnJQ/ZQEUWlN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50050757-c9ba-44fe-dce4-08d9673d2f42
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 20:24:33.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GLHdpMzHx8SNgH3LXtElcTGxmCuS/LUWYEoUPcmY0AEQPwum/Ht0a1wEjyzaiU+T9FpN5D0eJZooq0BxcvQlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62a;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 6.1.0 release. This release contains 3000+ commits from 221
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/6.1

Highlights include:

 * block: support for changing block node options after creation via
   'blockdev-reopen' QMP command
 * Crypto: more performant backend recommendations and improved documentati=
on
 * I2C: emulation support for I2C muxes (pca9546, pca9548) and PMBus
 * TCG Plugins: now enabled by default, with new execlog and cache modellin=
g
   plugins [1].
=20
 * ARM: new board support for Aspeed (rainier-bmc, quanta-q7l1), npcm7xx
   (quanta-gbs-bmc), and Cortex-M3 (stm32vldiscovery) based machines
 * ARM: Aspeed support of Hash and Crypto Engine
 * ARM: emulation support for SVE2 (including bfloat16), integer matrix mul=
tiply
   accumulate operations, TLB invalidate in Outer Shareable domain, TLB ran=
ge
   invalidate, and more.
 * PowerPC: pseries: support for detecting hotplug failures in newer guests
 * PowerPC: pseries: increased maximum CPU count
 * PowerPC: pseries: emulation support for some POWER10 prefixed instructio=
ns
 * PowerPC: new board support for Genesi/bPlan Pegasos II (pegasos2)
 * RISC-V: updates to OpenTitan platform support, including OpenTitan timer
 * RISC-V: support for virtio-vga
 * RISC-V: documentation improvements and general code cleanups/fixes
 * s390: emulation support for the vector-enhancements facility=20
 * s390: support for gen16 CPU models
 * x86: new Intel CPU model versions with support for XSAVES instruction
 * x86: added ACPI based PCI hotplug support for Q35 machine (now the defau=
lt)
 * x86: improvements to emulation of AMD virtualization extensions

 * and lots more...

Thank you to everyone involved!

[1] https://www.qemu.org/2021/08/19/tcg-cache-modelling-plugin/

