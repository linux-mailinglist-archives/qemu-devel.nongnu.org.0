Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70C634914
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 22:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxafU-0002JJ-5L; Tue, 22 Nov 2022 16:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxYmi-0006v8-DA; Tue, 22 Nov 2022 14:18:20 -0500
Received: from mail-db8eur05on20629.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::629]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxYmg-00021r-Hv; Tue, 22 Nov 2022 14:18:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt5VgloJEB8dOpxFfuX8cxiw+trASXBapES2UGmQOXiYd5Z9KeqJeQB4NAqJuSNcYD/XutPL/WgmVqmsNsNQOgNve13d3cLn5ZTwKZdUwsxdZ2XNPziJRgdG6SSD3Lbecyl7xAy9QwWUnAxJpigs7Ur/ESKAoph2QvZwE6IpWgpkWGaTjk6PfhaUGr8UPmV6s6X1LLWnj2rbtyTrBGwh2Usnff/30b5l1MuhUYLiTX6yGbDJGH0Khsmrqpao12O0l95ffYwqp7O1m883sECYa6E8saX+kTwX99QAb/YgPys6Ud4R/gOHkeM98t4ed7/fA42Rv8ykDwBCFBYfCtYkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFs2S2gBa4AWRKY8XfHPrNI8sjMuNkjGreS/cQag4Xc=;
 b=mzGCg80+uYa1d1NC8TnCzvagDrJngcCCHL4xfiPUzWyhAXQs3R8IgPoPYwJlIqz3jNl4lpi4eSxF0M09FyixFlYUc5l0Eacg6l05U/TO/TQlWGFqBwk19HZmXpdnfU1fqc+vzT0pPUBTwz7GGomv/DlDHynxJyJnUmQAkm0gMdMHVOr0oGu7tKTjeHSqiEVrzDvfrECQxErLhk8UTA+kxfgaW2MmEWKTlhfAoyQ1vmsGJEhtMHLp3nTe2URwhwfhKqir79MvZH6zB3p2Nx8CVIZFqurP34Bx8An8NeXZZK2oJzLYtci40EwQ+LUlOhWEWB7kyvMFNHCrqGqDEfnGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xsightlabs.com; dmarc=pass action=none
 header.from=xsightlabs.com; dkim=pass header.d=xsightlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xsightlabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFs2S2gBa4AWRKY8XfHPrNI8sjMuNkjGreS/cQag4Xc=;
 b=rCPOh6s35dXsulpMk740YYYzYd1Iop/NxmERApjA/EguIbOb81ugk2O7d6IYvITG/M0BrZRs1dh1IKucogo4hwbGnf0beRO8RRIXOTrb6Wa7dizgvggCXUxfwPh6/Kn5xAmdBVsrYzRRO4UKh9b1xwKes/tBQKsUgWtqof7m70s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xsightlabs.com;
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3eb::9)
 by AS8P193MB2415.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:18:11 +0000
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc]) by AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 19:18:11 +0000
Message-ID: <a19f10ef-88bc-afdc-11fd-10cfcce8a78a@xsightlabs.com>
Date: Tue, 22 Nov 2022 14:18:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
From: Luke Starrett <lukes@xsightlabs.com>
Subject: Subject: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0089.namprd02.prod.outlook.com
 (2603:10b6:208:51::30) To AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3eb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1684:EE_|AS8P193MB2415:EE_
X-MS-Office365-Filtering-Correlation-Id: 74afcac4-4b60-426f-01ef-08daccbe4bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIcZWAu1pO2hLiXmqulBTcs4HFliPfV7oGS4g2a0mOGO2OWrwAMNiwujHURTORY/k7e7SVcHXVxnmP7hQDmNS/jO4dSeM6fq4zTegnzwwpKGuM1Qt8Eu3t9dX01AmrxiLDOm26rcZxdzTrW2SRwbyUpTwN31u6j+U0wjoBMdCVEgI1tC0GsD1pJ9/Gp+7728tQ3kYY+4o2X7gfzK/T0YeWi0qqHI4l5antPDM0Zz0YpHX50i+Lj/FVYsQGHTgXG64dwUvDJrAQrHb/v4cK9gzCmQhvrdb210LRP0JH0Gix5VvjANgq2HW3QuvK5dvuBETNLvTgONXfQjcr8T6vDmzp0m4gnuufqXDy2DjaJlhnZNhAoGFOgqYeDu8AaLbSlQfzOeMjLBtWk4AmXUHCFsIQJQJBIST05DCiudM9G/XWNZj4yGsBZQ1G0ciV5NVGdVM6KuqyXBdRMfSmro3T1CgtVwjYSF4jDCYyl+U8MO6n0+pONzEM7zbVg5UyR0ATlHOb2R/GxIhjruqT1H5sVQF1Dce3YL6MkpFI1EMOOH2fD6ucPqNa4wliBOcmhXi09Lry/HHVvB/pUNHtCeaus43qyrlm1soZ1pDXGJP+sYyu4dCkwUVSLDNkO91oYQKOkn94IH4vQHBBh5pW2wvi1roL+edl1kdEvB+foHqtbfO09KNV6gNGm+wH9m+HuMxA3rzvzl2oOSVJUdwVDGEJ+c9mno5W1WZorUBfJfAl389L/AWhheLIOc+ZCHORyMv/xdPzfcaRllb7fkijgbeCGuaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1684.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(451199015)(8676002)(36756003)(8936002)(6506007)(6512007)(26005)(66946007)(4326008)(66556008)(478600001)(6666004)(66476007)(316002)(5660300002)(31696002)(38100700002)(86362001)(83380400001)(6486002)(41300700001)(2616005)(31686004)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajZlaXc2anBBMlZJOVRPQ3RlN2hWOE4vdFFxbCtKU1JrSTFnWmN1SFNJTWcv?=
 =?utf-8?B?UGlKamRod0FJQVZUUWgybVB4YVk2RHJ1aTlONmJZZUtCbDdBazc1RklVQmN5?=
 =?utf-8?B?bHhNM2szdkVsbFJoRmtlM0VQcCt0eVVubnZFNXVnaWJNeThuVXcvaURPcWQx?=
 =?utf-8?B?dHZoS0NhWUxQcDNCd2FaTS8wVUFuVlZsOHc0T2MyenBMSk9iajF3bDREWTdj?=
 =?utf-8?B?SHZHVExvdWRldlFzZURrUjg2cUtBL01GSnlCNE1Wblo1aU8vZEFyZWZqYVJj?=
 =?utf-8?B?RWxlejhxNHc0MFJoZGFXMEdHamc0SVVjbkY1VFJPQlZOUTZLS3c0YzRTbkwv?=
 =?utf-8?B?czh1TkNzeEdWaDFnWTJqZEZZNWVXMUNYZExsOVJtTzU4QWRMN1V6cHlJMEIv?=
 =?utf-8?B?WGZuNm9rWmJqN3B4TFJBanFsVWpQSWZDYUtOTE50YURMcmZ2bFJsOGE0Tmhp?=
 =?utf-8?B?c0N5UUxNbjB6TlNhc0ExNGZqaGkwWlAzUS84MnBOVFZRRTZZYXRQRjF6Zktt?=
 =?utf-8?B?eVBkOFJzTm91VE9oR052ZWR2K0xFM2xkWStJNGg3VExFZU8rRlZ3WWM1SWhO?=
 =?utf-8?B?cXovUXNSWUxnQW5LVnY2dVVwT3ZDeXFrTmhHc0U4YWkydXM2T3pBOFNXaFpG?=
 =?utf-8?B?SFBVN2xtVjl2NkYyMEFSTlF1YjNVUzVFSkVJZHRVS3ZDd1Vmc3Q2VE81bzZl?=
 =?utf-8?B?VnRHRG1DMUVncW9FcU5SMmx4M1hhYWRzRjMzR0NSa0x6S0pJOGdGVUpXamhW?=
 =?utf-8?B?ZjVaZzRRYVV0czlLYlJYZlBKd0tYbnhCZmlCLy9CWXlPV2pNb3NMRDNaeWpQ?=
 =?utf-8?B?eVlXTEFJbU15NGdXZzBYT2NhNFh2VzdjNFpVdURubDYwVHBua2dyQ1hyWTUr?=
 =?utf-8?B?bkFrL0VDT3Y0UEw2V2JFUGxjYXhZRDJJcWtXN0VvQysxVmd3V1FFSGs3bkgz?=
 =?utf-8?B?QnRTM3k5Ykd6RHJWa01VU1U0dk13QnY1OHdBaVNxUXZFODJ0UUcxUUlQRzho?=
 =?utf-8?B?azJ0cnEwc1BwNXdVTk1lQTRLVkV6M0F5V1dJL21xdEEza2l5clpBa2RDMUZP?=
 =?utf-8?B?cXhRM0dZeWlhZXZpbzQ0bllUYzNTc0kzdDhaZFBQOFBJSnFoZmFqejVYOW5v?=
 =?utf-8?B?VnZ2QU1uUzRmTlRIaGo2UXQyeFRuSC93QXF0dEozS0lvMGxqbXF3NUs4c3oy?=
 =?utf-8?B?UTU3ZVdTZFBOcDQrN3FDZERCM01lemZWWk5QWmI0N1F2U2phOWtTUVhYZTd5?=
 =?utf-8?B?MlZzMlVDTDNPTkpic1RqdHA5N25rV0ROQ3Y4ZDJzTHhnYVI5UXNySkFpak1M?=
 =?utf-8?B?ZXR5dlRPK00zenN4WGlneDczcld6S1owZW1yNGRGS2ZWSjUwTGVjLzZlaG9j?=
 =?utf-8?B?VmpvcGhOaGZTalZBSjJJVkg5MjRrcmlOYmlMclRrSmRrQzI1d3FLTEw1Vyti?=
 =?utf-8?B?cEZzOE42MGJ0cXhMT1dtRXdNRzdKZjhOMGwyaE1iSlBkcjNlVjBPRjg4WE1y?=
 =?utf-8?B?Q2FmVEdVb2VVYXRwOHhTb2M5Q3MrOEFhNzNJRjdXajYwZjM2a280N05OWHcv?=
 =?utf-8?B?QXA4eGF6bkl1TTRwNmNWY2EwbTlIM3I0MnNSZXBRZVN3WFRqN0phcW9helVB?=
 =?utf-8?B?TnhobnZ5TVgvaUEwZU0rWUUzUTVQaWdsRXcrVFI1b3lZWVpBbjlzUFo5ZE9F?=
 =?utf-8?B?cERnWFFlQ3A2eGtjRm1ZVmZsRiswM3c5aVEwbU81a2JLbUZEM0ExaUJZOW5z?=
 =?utf-8?B?MHRvM2czUFpOWVpVS0o0cUE3YmZpWlZlYUJPMVczSjhvVTFoVWxvNEcxaitk?=
 =?utf-8?B?WWxBcEppdkJVYTcraHpMSGtNYXdmSVdpcC9seWczZmlIK0pEbDJUcjlDejlj?=
 =?utf-8?B?SnQ4bHl1NGN4aTVqaUh6TFZpWkJJL0IybDhjUkNKbWR6bXV5NGtBdFM1T3p0?=
 =?utf-8?B?S2xRSmNFeW1GYkF5b00wVDdsdTBncHB0Vk5RQlNVZEZ2amU1N3hIWlM0OVdm?=
 =?utf-8?B?MFdhNEhVQkp4MjJ6eVlaNUx3b1RrdGhWOTJmNFJ4KzJUMGdpcDhDZUFZUm5T?=
 =?utf-8?B?VWVXdFRjdDljekwzMFRIdkl4bTN0a3BmSXFJeE01Y2FyRWhjbmJneUNNcFBC?=
 =?utf-8?Q?XyMZYrBhEpoj4Edm232sFmFUP?=
X-OriginatorOrg: xsightlabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74afcac4-4b60-426f-01ef-08daccbe4bd8
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 19:18:11.6536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 646a3e34-83ea-4273-9177-ab01923abaa9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/5YdhoD9TPvMCN6G2aXarwaZTnAEyQ1Iq5I/E9rqr8obKeAkspn59iDU/4uilq/TuyGK2VJN11MXTwz1L68Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2415
Received-SPF: permerror client-ip=2a01:111:f400:7e1a::629;
 envelope-from=lukes@xsightlabs.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Nov 2022 16:18:58 -0500
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

The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
register:

"indicates the maximum SPI INTID that the GIC implementation supports"

As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
boot (Linux) showing 32 shy of what should be there, i.e.:

     [    0.000000] GICv3: 224 SPIs implemented

Though in hw/arm/virt.c, the machine is configured for 256 SPI's. ARM
virt machine likely doesn't have a problem with this because the upper
32 IRQ's don't actually have anything meaningful wired. But, this does
become a functional issue on a custom use case which wants to make use
of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
to the number (blocks of 32) that it believes to actually be there.

Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
---
  hw/intc/arm_gicv3_dist.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index eea0368118..d599fefcbc 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
           * MBIS == 0 (message-based SPIs not supported)
           * SecurityExtn == 1 if security extns supported
           * CPUNumber == 0 since for us ARE is always 1
-         * ITLinesNumber == (num external irqs / 32) - 1
+         * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
           */
-        int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
+        int itlinesnumber = (s->num_irq / 32) - 1;
          /*
           * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
           * "security extensions not supported" always implies DS == 1,
-- 
2.27.0



