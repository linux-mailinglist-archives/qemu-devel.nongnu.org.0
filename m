Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F074B634974
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 22:39:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaxm-0001N3-0W; Tue, 22 Nov 2022 16:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxaxj-0001MQ-RX; Tue, 22 Nov 2022 16:37:51 -0500
Received: from mail-he1eur01on0611.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::611]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukes@xsightlabs.com>)
 id 1oxaxh-0003NN-UQ; Tue, 22 Nov 2022 16:37:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGvTnKkGS62rCL4peM/okr1fLb+VMCywRd9VW1gJJAmdlCOQrWSb0+RVVSYTgoIqoLZ0Qpn8+oX0hNlDDAQRtTsNEFkQGLK3CBrZgw/+mVnvWGeRmS6Y6oY+CIAql2HDDOzYDTtwSOtVqnVEfGcArZ7g9DDdtDfa0+eN3+lZ6qaVOK1axnGZpbJr71C5LySCpYkeBr3T/yCs8bGsTHxa7Sz1yssv8wmNbRxf8Qp8Z5x1Q8lXroAnNpkwDedpT4lNhJ59HyH6DydS8EvClnq9QbrLECbA227euiSg/9lE5w5dzWjPkDtQhRnUiMlQfWasdGRXcTslmYsRzBAuvTC2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyl+cZTZHq3++f2/272B0mZUUZGeBe1q/RqudxC5UnI=;
 b=AH70fY6m/FDtM06tU5sjBVQ/q38s/fvrm6pbKaTr1EOWBxhWO3e3bjBv/r7JtAoGm88E+g3WLygJCtdsh0fJHIBDKcEcD696FZwhV21X+Eh9DaFLPOjw/vMIoxkX/D8NRVKqKE2XNdo3qYDu9MRYQw0afqRJCb5QKJ6MFeoaU+Fltxtrvifn45zML7dmZPAAo7fImrR2xZ+j73Xtbbm3Yb+j1Eyzr3PaT6yi44t/G+T/xeifFH7HNvFWtIVFo98lcStTzgxaP3CvMe8fkMmB/2bIZVc0pDgl2Qsh90XuzStN0lKnaxQwFZrob8CnYf5vYTpVIOpUW98kA86bt4trNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xsightlabs.com; dmarc=pass action=none
 header.from=xsightlabs.com; dkim=pass header.d=xsightlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xsightlabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyl+cZTZHq3++f2/272B0mZUUZGeBe1q/RqudxC5UnI=;
 b=nER9MfN6D0mgVij2pWQTM1buYcq9aZgmwfcbVI1a1+dC/OXetVnUwS7SJQGhqe4jthVMsHFEERtnOSRhI9B4t5W4fSe1bN38/pWm3wfpPVeIu6Zl4XlJaWldtDcy+SpoFQOIo9/CCFug1a7U44EG5ZHqAjFSJBFce3ySiRtF/UE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xsightlabs.com;
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:3eb::9)
 by AM0P193MB0721.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:163::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 21:37:44 +0000
Received: from AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc]) by AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 ([fe80::4250:f814:d3d6:53fc%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 21:37:44 +0000
Message-ID: <0c9034cc-4c02-a0b6-7982-ce24cdaf3792@xsightlabs.com>
Date: Tue, 22 Nov 2022 16:37:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Subject: [PATCH] hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber
 advertisement
Content-Language: en-US
From: Luke Starrett <lukes@xsightlabs.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <a19f10ef-88bc-afdc-11fd-10cfcce8a78a@xsightlabs.com>
In-Reply-To: <a19f10ef-88bc-afdc-11fd-10cfcce8a78a@xsightlabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:208:329::17) To AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:3eb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P193MB1684:EE_|AM0P193MB0721:EE_
X-MS-Office365-Filtering-Correlation-Id: 581f7aff-1eea-41c0-532a-08daccd1caaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSLBhr+JTjCyxocSkNZj2OO2GQZpQhGgaDmxXVN3foT/OQnEfPBsTie+P2VbO+7jksVT8S5lx5mTuB2OtlcaN3P6LF7it3IlF3sZQw+50Iqmr2MND+0wKKW52p3xwyGcXBFWoHy3+rrKsiYRx5YdGJOe+zY4ChFIyaoXMLCLlJO2+x3/2gYPo2YMpNkgK5IzMSRDHrWKhUeu3Vpx9Q58Sd3isdv6PzVCl8WcMcTI4TNNI6IBCR86KlCAbRuE99XVY+N+28AvypaZtdLr5elIUp5LbFuMd7FU29hmkWAWg8t7fDSWzDzca2SNudLBTzVNhxbiH3g94Hiyylquv0SB25VIJRuEa4INZTRB5ohbMZQg8Y56Kp+yt2P6v8WiAc5BmZewTSBK4WGar6mc8Y7L82N8XIn4fZoZpUO/LTrUkQAQor4s1tEvakgPycGbhIGC8/ZydvzYakjBJGDrGHebHBD3aaq9dGb06s/5zWxxkskOYz82Z3lIDbFbRr1K8Xew/FZnyERhAKDszOiDLIyK3+LLyMl1odIKN3b53+Nd2PSp+dGURn8u3aLrNIjemCjj9H65YjAuKAQbjpfzfmjEnckNBrjzZZayR2nesvf/MPfSOLkSvjhhgmBHAmTx3oYbL3Jp61ZjvJHD3yZmeznnLCgMkDLAA5d12u8kZxH2Mz9u4Nk/qVmhi69HTsnIqU4DAzTEy9Kj51slT+73accNCW6c8f9Hu+MO6JqzcauvbSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9P193MB1684.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39850400004)(376002)(366004)(451199015)(6512007)(2616005)(186003)(83380400001)(53546011)(38100700002)(2906002)(5660300002)(26005)(6506007)(6486002)(66556008)(41300700001)(8676002)(6666004)(478600001)(316002)(66946007)(8936002)(4326008)(66476007)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9Ua1lXVUMzMFVkTGZyRWdiSkR5WXVVbTZRU3V1UXhsR1Q1WUpNdk9FZXht?=
 =?utf-8?B?VE5CYk1kZHNmcW0rVitiRFYyaFh2MC90OHJpR0JKeGxtSGgyZFhXNHdxemdD?=
 =?utf-8?B?ZEMzcFVaTHRJK0ZGQTFDalY0YW84K3FJSjVnMURnQUI0VXlPQWgxRDZoYW03?=
 =?utf-8?B?S1hwdDZxTnhWMjVnaUNKUWFZbmV5RGN4cXBPd2M5cGhDSS9RcVRiTnZHc0h5?=
 =?utf-8?B?ZEdRVTh3bzZqTFV5VEoyWGU2M01KVkUxWG5VaGtYYTJxMGQvc2RCajBnTFQr?=
 =?utf-8?B?N3E5U3Q4UDE5dnAvZEdVTS8yQklnbithKzlYTnFaSzBDcEwxYi9TNEFseC9W?=
 =?utf-8?B?N09mNDZHckU2elI3NVB6eExzMGdINnYxU2VhZVVnS1JFdjJ6YXBmOFB0RHNo?=
 =?utf-8?B?UCtEOFFubndHS2RBU1gwM21KaXF2bG5DR2pSRW8zRS8zdW53d1VueVpnUjFY?=
 =?utf-8?B?VDJxbjRZZlVNUnJhR3JlYWF3KzNINmdqTnAvVXNHSHJCOXVQRlBvQU1jWW1w?=
 =?utf-8?B?N09FQ1BocHpob1JacXllRXNMUmo2TXVPT2NwcGVZVzhaeGZlNE9QNUJmYzFO?=
 =?utf-8?B?cVhQek5oWWZ1QzJGQUVvYTFQRjJOMXVNNnQybWF2cUM2UU1pb3NTOU1pbk9P?=
 =?utf-8?B?UVMvQmtETHlmd0Rmc2JxMUNGMSs3R2tpeGtnb0NqZUlYeFVnZnVoY1I0Z1Za?=
 =?utf-8?B?bnJnZTA5S1JhL3Y3YVdhYXNOZVJSbXZ4WWFYTmZMQnhiZmovMGRrVkdTV2lC?=
 =?utf-8?B?bFdrUnZIMTVmd1lGdEVkek5SRHh1bnBERENQYllhZkx6blI1NnAvblBud0JD?=
 =?utf-8?B?MkdtUERJRFZvRjZFeTMwOHVyVFo5RCtCeTRlRW1RRmpBV2xyMW5mbU1aNXZ2?=
 =?utf-8?B?K1o3Tkp2NDVvcktDRzhBSHBXRUY3WHhYaU53TThmcXNqcTZHQ2t6bnJ6ZVVX?=
 =?utf-8?B?bjBtYVNwbmdjQllRa0RvZ2d2QUlMcnpsbXJmQlBhSFZZZE5KdWZ2bXU4ZVEr?=
 =?utf-8?B?V2wrQW1TRHF4T014ZVQxSy93MWhtZjBzcWlEdmY4NC9KMWZCSjJJSWs2UkpU?=
 =?utf-8?B?MzUrSm00dk1oRkFyS1c5TXhlNzVQWTlWQlRjTW9NTVlwT2h6aEIyRFkvc21H?=
 =?utf-8?B?YkFFK1N6enI0aGVoMWwxZzNyb3duMzNsR1lUeDROMjNiRDVNWlplRWYrMStW?=
 =?utf-8?B?LzhTY3M4QS9kK1ViMWNVbHY4QmtpQW1HbkdmWFk3OHg2QWkwTXZXRklCM3Zw?=
 =?utf-8?B?c0UwR3VObFRsN3pMRktvSEJxUHJzc0hFSzlUcWhGSlZ3UWJnd1BrSmxEWVNO?=
 =?utf-8?B?QzA4YUlIT015bTNYUWJ5Vlk0RExHT1pBUVZscGVEMys5ckxlbkJ0R3FBT1Zh?=
 =?utf-8?B?K1dEcldQdzJuV3lhWmY1VVJoTUhhK2kzTk9aaStnUjFnYVZjRFR6UENaT3lh?=
 =?utf-8?B?dEZpUDJCZDFtaFpMWUhxd1cwMjJxdDdEbWhNTnhpZUhjTjl4TVNEcG5Ndmc2?=
 =?utf-8?B?KytWejRKSndiaUJZdnlsM3lFa1AvblpnU3NCSGN2d093czBvYjBON255aTJ5?=
 =?utf-8?B?OVhDRGZ6ZUE5emRMVGpLVmMvZGxzSURlRm1kbjFUSDNFbXkyZXBjRUc5bGZj?=
 =?utf-8?B?aUV0NVlxK2YrRGJrZVNEOEg0dFpzY0lTbUp5NkdLZytTTHRHa0hHWmFOYjJU?=
 =?utf-8?B?Z3R5SnZtNWRoRGlPR25meXh5WERkVXNwdWI5c1NlZS9hbkVxMGR1ZWN0b1ll?=
 =?utf-8?B?SjVBUWN2V2x1aWkxay9aMWNzUlRkRS9QbHRGNXNMdXdqaUFuamc3ZjQ2M0h2?=
 =?utf-8?B?WGVQZ1YyY3RtR29JdG4ycmZBUUN5S25YRTMzelMvYjZKZGlDZWMxdTlVVExa?=
 =?utf-8?B?TU5YRDZIS1NRSHNqajUrN01EU3RiNXRjTmF3L0NxR1cwZ2dWR0RmdFN6NnRr?=
 =?utf-8?B?ZDUwcGd1LzUyNk03UVJjNWxpWnJLeHAvNEkrV3dUWnVralhVUG5zSlhRZklm?=
 =?utf-8?B?VTBJS0swb2cyMi9VQjBIL3dtYmt0bCs1bXZ2dUIzN252SlpzWUlyK1FiQVYr?=
 =?utf-8?B?RGNtd0dvcFBoaDNKb2NCOWdkSGtJdWppdFhRYUkzVERzeDBmSHlKT3pnRnI4?=
 =?utf-8?Q?MyBPcGb5zw3N04pXtjALMLZun?=
X-OriginatorOrg: xsightlabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581f7aff-1eea-41c0-532a-08daccd1caaf
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1684.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 21:37:44.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 646a3e34-83ea-4273-9177-ab01923abaa9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19XBqllEAxhOojDGb+ndHD0lmacntnRUWXrTZYs6WU0ytM/AVQxFTrQlI110PombXV6DbWjVtwvu7mjRFvBGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P193MB0721
Received-SPF: permerror client-ip=2a01:111:f400:fe1e::611;
 envelope-from=lukes@xsightlabs.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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

Please disregard this one.  Sent in error.

On 11/22/2022 2:18 PM, Luke Starrett wrote:
> The ARM GICv3 TRM describes that the ITLinesNumber field of GICD_TYPER
> register:
>
> "indicates the maximum SPI INTID that the GIC implementation supports"
>
> As SPI #0 is absolute IRQ #32, the max SPI INTID should have accounted
> for the internal 16x SGI's and 16x PPI's.  However, the original GICv3
> model subtracted off the SGI/PPI.  Cosmetically this can be seen at OS
> boot (Linux) showing 32 shy of what should be there, i.e.:
>
>     [    0.000000] GICv3: 224 SPIs implemented
>
> Though in hw/arm/virt.c, the machine is configured for 256 SPI's. ARM
> virt machine likely doesn't have a problem with this because the upper
> 32 IRQ's don't actually have anything meaningful wired. But, this does
> become a functional issue on a custom use case which wants to make use
> of these IRQ's.  Additionally, boot code (i.e. TF-A) will only init up
> to the number (blocks of 32) that it believes to actually be there.
>
> Signed-off-by: Luke Starrett <lukes@xsightlabs.com>
> ---
>  hw/intc/arm_gicv3_dist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index eea0368118..d599fefcbc 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -390,9 +390,9 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
>           * MBIS == 0 (message-based SPIs not supported)
>           * SecurityExtn == 1 if security extns supported
>           * CPUNumber == 0 since for us ARE is always 1
> -         * ITLinesNumber == (num external irqs / 32) - 1
> +         * ITLinesNumber == (((max SPI IntID + 1) / 32) - 1)
>           */
> -        int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
> +        int itlinesnumber = (s->num_irq / 32) - 1;
>          /*
>           * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
>           * "security extensions not supported" always implies DS == 1,

