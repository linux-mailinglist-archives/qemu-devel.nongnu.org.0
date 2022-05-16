Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6852852B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:19:26 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqadB-0000sO-2U
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nqaUp-0001B2-0p; Mon, 16 May 2022 09:10:47 -0400
Received: from mail-dm6nam10on2060f.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::60f]:7841
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nqaUk-0007dy-Dk; Mon, 16 May 2022 09:10:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8flUYRTGq4cr9inz9O6eC87fsRf0eJ/dCE+cfOgS7Kya4Rwikyr2gKysrwW2eA1exKaZBLo3aS7oYAT0xmmgHM9qy0PqZ3DNMhkB3F6tpkXp6RHjTWLiVt4vMI4p17SHr9JFRlE5FWaPrLOyt3pMdJcsAdkxb2afec0pHeTrvOBwUSrnBHonj7VZBQl8zfWATrrByNXxkCqknSoRWAYdxAGqAS4FDCv/I6JJz3PIbttDGWMwLbFWDQiITZysUFEhU3pfjnA6eI8oy3PSI9Y2hxl8IVpZCZAKv1wEx8TY5ePhR7CeN2rViLNBd5Gs3pvQLQNroLXCPBp7MBm3AJT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0HUMHAzYkrFH8hhSMJGpTK3ZeX/vckNlfLVegaE3tc=;
 b=TM39n0lpjWFXhFwgWe9bTMVt1PlPqjGOc/Aq/wKGsNvwxNvYoOLtL6E+qsrZE2jwUcyLlPWOa0w36GwusZPI7UryfqO93J+WbQvnB/m4Nb4Qu3NM7sAyqgOHXIt0b89gIZxeAhFCMYkk6S3PpU4lu7phepCeSxlBfv8SaSZ08ihPnvpp9kM0PWbKlJJwTMT8wJ7z0eKpM+9rQJFpnKA747ObStBOwvLe6YRONulV+a4HefkWi/PLwBrgv5qh824lufp1xkB0Wa27SDy0VIyhCXiCZndw6Qcz1yDbw9sB9l4gtQbgNFSodKkQAQaaNEMgqxJI5eWy6rFIYh+Dsv2exA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0HUMHAzYkrFH8hhSMJGpTK3ZeX/vckNlfLVegaE3tc=;
 b=c88D9BkfdYlAAg7sGd+nr9hyGV5sBZV/TDfwQ22ccOfJiNdD+Kczqlmfos8cuj9BkrrTrqPUDQH0bvEokffPJc4PLEhzMHIit8wNC80PTFT0HedwUE3g4ffZnIu8RVlFvtvniwDaMkT9Ltfxz3q3XiL3HNn79q5yD8LrNJC0UG4=
Received: from BN9PR03CA0446.namprd03.prod.outlook.com (2603:10b6:408:113::31)
 by PH0PR02MB7717.namprd02.prod.outlook.com (2603:10b6:510:58::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 13:10:37 +0000
Received: from BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::be) by BN9PR03CA0446.outlook.office365.com
 (2603:10b6:408:113::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Mon, 16 May 2022 13:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT014.mail.protection.outlook.com (10.13.2.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 13:10:37 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 16 May 2022 14:10:36 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 16 May 2022 14:10:35 +0100
Received: from [10.71.117.98] (port=23617 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nqaUd-0001zf-A9; Mon, 16 May 2022 14:10:35 +0100
Date: Mon, 16 May 2022 14:10:34 +0100
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH] ptimer: Rename PTIMER_POLICY_DEFAULT to
 PTIMER_POLICY_LEGACY
Message-ID: <20220516131032.ykidzcfvjhxqmets@debian>
References: <20220516103058.162280-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220516103058.162280-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d38d16c-6075-4496-2f88-08da373d783c
X-MS-TrafficTypeDiagnostic: PH0PR02MB7717:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB7717260BE475A8B6D30AA800ADCF9@PH0PR02MB7717.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdUrVCgfqc3tgGpAQ8VzpEmqmGrXJX7T8BoFpwFJ411jcNfNSOh0kfETEQ6WwCNXOpdOzxdLuYbtlRswa63g3seK63EH3o38KLZQOadD+l70hPXbZ5uerwyUE4N27n98FWyS+vNd9XCysVjli+eadl+PdVLpNrq3hZK4FtNC4lLPPrBn/j2/aOeRb4Y4f19N13+/Y3D0jparrUuyJWpuwgY1Gq3cuwpnhQlR0xye+3Lukd0oZxKb0A6t0nskl8QT9djBRUWshaHTOCye0tpkX7WfOZ8he+UMGobwgsXaqA9uPjSQRpqBQuAJdYicPlSleqkTwQFJCt7S25HdVmnCunBMMyrwZcmXZlzK4dlvUAW0orON2WaWv3nC6iVs760aSHAc1eU4p/waLw40MoiyZi3R3dV+xIfiOCpp+14jy5j5qyvIMSZAcp7IaZWWtVw4r1l2hklPJSAeaOLhACp+Id8Gw7HHqmqlnfKTFEK4tsuOoEF0DfpwvPHA2zjcCqmNatQn3GnPxSbzdKEdCxOaTR9aKkhih0WBJRSl7Ym+5KtwF7/Rg6B5ihxOx2RJKQuKuNzfDgwKoLIGxDqslFVixFBNLxfu38wunvirGRRBQL94b47tWtct0OLCYr6IospazBys/+N3NIH+KOQz+K8KZB+Vi1KwhFJEzggDb4DIPhOedHlqfYo8Jf9eCBcjvO2m
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(7636003)(54906003)(70586007)(70206006)(5660300002)(82310400005)(356005)(4326008)(426003)(33716001)(6916009)(83380400001)(36860700001)(336012)(47076005)(40460700003)(9686003)(26005)(2906002)(186003)(3716004)(316002)(9786002)(8936002)(508600001)(9576002)(30864003)(8676002)(1076003)(44832011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 13:10:37.4370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d38d16c-6075-4496-2f88-08da373d783c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7717
Received-SPF: pass client-ip=2a01:111:f400:7e88::60f;
 envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 11:30:58AM +0100, Peter Maydell wrote:
> The traditional ptimer behaviour includes a collection of weird edge
> case behaviours.  In 2016 we improved the ptimer implementation to
> fix these and generally make the behaviour more flexible, with
> ptimers opting in to the new behaviour by passing an appropriate set
> of policy flags to ptimer_init().  For backwards-compatibility, we
> defined PTIMER_POLICY_DEFAULT (which sets no flags) to give the old
> weird behaviour.
> 
> This turns out to be a poor choice of name, because people writing
> new devices which use ptimers are misled into thinking that the
> default is probably a sensible choice of flags, when in fact it is
> almost always not what you want.  Rename PTIMER_POLICY_DEFAULT to
> PTIMER_POLICY_LEGACY and beef up the comment to more clearly say that
> new devices should not be using it.
> 
> The code-change part of this commit was produced by
>   sed -i -e 's/PTIMER_POLICY_DEFAULT/PTIMER_POLICY_LEGACY/g' $(git grep -l PTIMER_POLICY_DEFAULT)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/ptimer.h          | 16 ++++++++++++----
>  hw/arm/musicpal.c            |  2 +-
>  hw/dma/xilinx_axidma.c       |  2 +-
>  hw/dma/xlnx_csu_dma.c        |  2 +-
>  hw/m68k/mcf5206.c            |  2 +-
>  hw/m68k/mcf5208.c            |  2 +-
>  hw/net/can/xlnx-zynqmp-can.c |  2 +-
>  hw/net/fsl_etsec/etsec.c     |  2 +-
>  hw/net/lan9118.c             |  2 +-
>  hw/rtc/exynos4210_rtc.c      |  4 ++--
>  hw/timer/allwinner-a10-pit.c |  2 +-
>  hw/timer/altera_timer.c      |  2 +-
>  hw/timer/arm_timer.c         |  2 +-
>  hw/timer/digic-timer.c       |  2 +-
>  hw/timer/etraxfs_timer.c     |  6 +++---
>  hw/timer/exynos4210_mct.c    |  6 +++---
>  hw/timer/exynos4210_pwm.c    |  2 +-
>  hw/timer/grlib_gptimer.c     |  2 +-
>  hw/timer/imx_epit.c          |  4 ++--
>  hw/timer/imx_gpt.c           |  2 +-
>  hw/timer/mss-timer.c         |  2 +-
>  hw/timer/sh_timer.c          |  2 +-
>  hw/timer/slavio_timer.c      |  2 +-
>  hw/timer/xilinx_timer.c      |  2 +-
>  tests/unit/ptimer-test.c     |  4 ++--
>  25 files changed, 43 insertions(+), 35 deletions(-)
> 
> diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
> index c443218475b..4dc02b0de47 100644
> --- a/include/hw/ptimer.h
> +++ b/include/hw/ptimer.h
> @@ -33,9 +33,17 @@
>   * to stderr when the guest attempts to enable the timer.
>   */
>  
> -/* The default ptimer policy retains backward compatibility with the legacy
> - * timers. Custom policies are adjusting the default one. Consider providing
> - * a correct policy for your timer.
> +/*
> + * The 'legacy' ptimer policy retains backward compatibility with the
> + * traditional ptimer behaviour from before policy flags were introduced.
> + * It has several weird behaviours which don't match typical hardware
> + * timer behaviour. For a new device using ptimers, you should not
> + * use PTIMER_POLICY_LEGACY, but instead check the actual behaviour
> + * that you need and specify the right set of policy flags to get that.
> + *
> + * If you are overhauling an existing device that uses PTIMER_POLICY_LEGACY
> + * and are in a position to check or test the real hardware behaviour,
> + * consider updating it to specify the right policy flags.
>   *
>   * The rough edges of the default policy:
>   *  - Starting to run with a period = 0 emits error message and stops the
> @@ -54,7 +62,7 @@
>   *    since the last period, effectively restarting the timer with a
>   *    counter = counter value at the moment of change (.i.e. one less).
>   */
> -#define PTIMER_POLICY_DEFAULT               0
> +#define PTIMER_POLICY_LEGACY                0
>  
>  /* Periodic timer counter stays with "0" for a one period before wrapping
>   * around.  */
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 7c840fb4283..b65c020115a 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -464,7 +464,7 @@ static void mv88w8618_timer_init(SysBusDevice *dev, mv88w8618_timer_state *s,
>      sysbus_init_irq(dev, &s->irq);
>      s->freq = freq;
>  
> -    s->ptimer = ptimer_init(mv88w8618_timer_tick, s, PTIMER_POLICY_DEFAULT);
> +    s->ptimer = ptimer_init(mv88w8618_timer_tick, s, PTIMER_POLICY_LEGACY);
>  }
>  
>  static uint64_t mv88w8618_pit_read(void *opaque, hwaddr offset,
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index bc383f53cca..cbb8f0f1696 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -552,7 +552,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>  
>          st->dma = s;
>          st->nr = i;
> -        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
> +        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_LEGACY);
>          ptimer_transaction_begin(st->ptimer);
>          ptimer_set_freq(st->ptimer, s->freqhz);
>          ptimer_transaction_commit(st->ptimer);
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 60ada3286b4..1ce52ea5a2b 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -666,7 +666,7 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>  
>      s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
> -                               s, PTIMER_POLICY_DEFAULT);
> +                               s, PTIMER_POLICY_LEGACY);
>  
>      s->attr = MEMTXATTRS_UNSPECIFIED;
>  
> diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
> index 6d93d761a5e..2ab1b4f0593 100644
> --- a/hw/m68k/mcf5206.c
> +++ b/hw/m68k/mcf5206.c
> @@ -152,7 +152,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
>      m5206_timer_state *s;
>  
>      s = g_new0(m5206_timer_state, 1);
> -    s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_DEFAULT);
> +    s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_LEGACY);
>      s->irq = irq;
>      m5206_timer_reset(s);
>      return s;
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 655207e393d..be1033f84f8 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -197,7 +197,7 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
>      /* Timers.  */
>      for (i = 0; i < 2; i++) {
>          s = g_new0(m5208_timer_state, 1);
> -        s->timer = ptimer_init(m5208_timer_trigger, s, PTIMER_POLICY_DEFAULT);
> +        s->timer = ptimer_init(m5208_timer_trigger, s, PTIMER_POLICY_LEGACY);
>          memory_region_init_io(&s->iomem, NULL, &m5208_timer_ops, s,
>                                "m5208-timer", 0x00004000);
>          memory_region_add_subregion(address_space, 0xfc080000 + 0x4000 * i,
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index 22bb8910fa8..82ac48cee24 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -1079,7 +1079,7 @@ static void xlnx_zynqmp_can_realize(DeviceState *dev, Error **errp)
>  
>      /* Allocate a new timer. */
>      s->can_timer = ptimer_init(xlnx_zynqmp_can_ptimer_cb, s,
> -                               PTIMER_POLICY_DEFAULT);
> +                               PTIMER_POLICY_LEGACY);
>  
>      ptimer_transaction_begin(s->can_timer);
>  
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 6d50c395439..4e6cc708dec 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -393,7 +393,7 @@ static void etsec_realize(DeviceState *dev, Error **errp)
>                                object_get_typename(OBJECT(dev)), dev->id, etsec);
>      qemu_format_nic_info_str(qemu_get_queue(etsec->nic), etsec->conf.macaddr.a);
>  
> -    etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_DEFAULT);
> +    etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_LEGACY);
>      ptimer_transaction_begin(etsec->ptimer);
>      ptimer_set_freq(etsec->ptimer, 100);
>      ptimer_transaction_commit(etsec->ptimer);
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index 6aff424cbe5..456ae38107b 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1363,7 +1363,7 @@ static void lan9118_realize(DeviceState *dev, Error **errp)
>      s->pmt_ctrl = 1;
>      s->txp = &s->tx_packet;
>  
> -    s->timer = ptimer_init(lan9118_tick, s, PTIMER_POLICY_DEFAULT);
> +    s->timer = ptimer_init(lan9118_tick, s, PTIMER_POLICY_LEGACY);
>      ptimer_transaction_begin(s->timer);
>      ptimer_set_freq(s->timer, 10000);
>      ptimer_set_limit(s->timer, 0xffff, 1);
> diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
> index ae67641de66..d1620c7a2ac 100644
> --- a/hw/rtc/exynos4210_rtc.c
> +++ b/hw/rtc/exynos4210_rtc.c
> @@ -564,14 +564,14 @@ static void exynos4210_rtc_init(Object *obj)
>      Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
>      SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>  
> -    s->ptimer = ptimer_init(exynos4210_rtc_tick, s, PTIMER_POLICY_DEFAULT);
> +    s->ptimer = ptimer_init(exynos4210_rtc_tick, s, PTIMER_POLICY_LEGACY);
>      ptimer_transaction_begin(s->ptimer);
>      ptimer_set_freq(s->ptimer, RTC_BASE_FREQ);
>      exynos4210_rtc_update_freq(s, 0);
>      ptimer_transaction_commit(s->ptimer);
>  
>      s->ptimer_1Hz = ptimer_init(exynos4210_rtc_1Hz_tick,
> -                                s, PTIMER_POLICY_DEFAULT);
> +                                s, PTIMER_POLICY_LEGACY);
>      ptimer_transaction_begin(s->ptimer_1Hz);
>      ptimer_set_freq(s->ptimer_1Hz, RTC_BASE_FREQ);
>      ptimer_transaction_commit(s->ptimer_1Hz);
> diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
> index c3fc2a4daaf..971f78462ab 100644
> --- a/hw/timer/allwinner-a10-pit.c
> +++ b/hw/timer/allwinner-a10-pit.c
> @@ -275,7 +275,7 @@ static void a10_pit_init(Object *obj)
>  
>          tc->container = s;
>          tc->index = i;
> -        s->timer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_DEFAULT);
> +        s->timer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_LEGACY);
>      }
>  }
>  
> diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
> index c6e02d2b5a7..0f1f54206a3 100644
> --- a/hw/timer/altera_timer.c
> +++ b/hw/timer/altera_timer.c
> @@ -185,7 +185,7 @@ static void altera_timer_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    t->ptimer = ptimer_init(timer_hit, t, PTIMER_POLICY_DEFAULT);
> +    t->ptimer = ptimer_init(timer_hit, t, PTIMER_POLICY_LEGACY);
>      ptimer_transaction_begin(t->ptimer);
>      ptimer_set_freq(t->ptimer, t->freq_hz);
>      ptimer_transaction_commit(t->ptimer);
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 84cf2726bb3..69c88634722 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -180,7 +180,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>      s->freq = freq;
>      s->control = TIMER_CTRL_IE;
>  
> -    s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_DEFAULT);
> +    s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
>      return s;
>  }
> diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
> index e3aae4a45a4..d5186f44549 100644
> --- a/hw/timer/digic-timer.c
> +++ b/hw/timer/digic-timer.c
> @@ -139,7 +139,7 @@ static void digic_timer_init(Object *obj)
>  {
>      DigicTimerState *s = DIGIC_TIMER(obj);
>  
> -    s->ptimer = ptimer_init(digic_timer_tick, NULL, PTIMER_POLICY_DEFAULT);
> +    s->ptimer = ptimer_init(digic_timer_tick, NULL, PTIMER_POLICY_LEGACY);
>  
>      /*
>       * FIXME: there is no documentation on Digic timer
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 139e5b86a44..ecc2831bafb 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -370,9 +370,9 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
>      ETRAXTimerState *t = ETRAX_TIMER(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>  
> -    t->ptimer_t0 = ptimer_init(timer0_hit, t, PTIMER_POLICY_DEFAULT);
> -    t->ptimer_t1 = ptimer_init(timer1_hit, t, PTIMER_POLICY_DEFAULT);
> -    t->ptimer_wd = ptimer_init(watchdog_hit, t, PTIMER_POLICY_DEFAULT);
> +    t->ptimer_t0 = ptimer_init(timer0_hit, t, PTIMER_POLICY_LEGACY);
> +    t->ptimer_t1 = ptimer_init(timer1_hit, t, PTIMER_POLICY_LEGACY);
> +    t->ptimer_wd = ptimer_init(watchdog_hit, t, PTIMER_POLICY_LEGACY);
>  
>      sysbus_init_irq(sbd, &t->irq);
>      sysbus_init_irq(sbd, &t->nmi);
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index d0e53439968..e175a9f5b9b 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1503,17 +1503,17 @@ static void exynos4210_mct_init(Object *obj)
>  
>      /* Global timer */
>      s->g_timer.ptimer_frc = ptimer_init(exynos4210_gfrc_event, s,
> -                                        PTIMER_POLICY_DEFAULT);
> +                                        PTIMER_POLICY_LEGACY);
>      memset(&s->g_timer.reg, 0, sizeof(struct gregs));
>  
>      /* Local timers */
>      for (i = 0; i < 2; i++) {
>          s->l_timer[i].tick_timer.ptimer_tick =
>              ptimer_init(exynos4210_ltick_event, &s->l_timer[i],
> -                        PTIMER_POLICY_DEFAULT);
> +                        PTIMER_POLICY_LEGACY);
>          s->l_timer[i].ptimer_frc =
>              ptimer_init(exynos4210_lfrc_event, &s->l_timer[i],
> -                        PTIMER_POLICY_DEFAULT);
> +                        PTIMER_POLICY_LEGACY);
>          s->l_timer[i].id = i;
>      }
>  
> diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
> index 220088120ee..02924a9e5b3 100644
> --- a/hw/timer/exynos4210_pwm.c
> +++ b/hw/timer/exynos4210_pwm.c
> @@ -400,7 +400,7 @@ static void exynos4210_pwm_init(Object *obj)
>          sysbus_init_irq(dev, &s->timer[i].irq);
>          s->timer[i].ptimer = ptimer_init(exynos4210_pwm_tick,
>                                           &s->timer[i],
> -                                         PTIMER_POLICY_DEFAULT);
> +                                         PTIMER_POLICY_LEGACY);
>          s->timer[i].id = i;
>          s->timer[i].parent = s;
>      }
> diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
> index d5118901097..5c4923c1e09 100644
> --- a/hw/timer/grlib_gptimer.c
> +++ b/hw/timer/grlib_gptimer.c
> @@ -383,7 +383,7 @@ static void grlib_gptimer_realize(DeviceState *dev, Error **errp)
>  
>          timer->unit   = unit;
>          timer->ptimer = ptimer_init(grlib_gptimer_hit, timer,
> -                                    PTIMER_POLICY_DEFAULT);
> +                                    PTIMER_POLICY_LEGACY);
>          timer->id     = i;
>  
>          /* One IRQ line for each timer */
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index ebd58254d15..2bf8c754b21 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -347,9 +347,9 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
>                            0x00001000);
>      sysbus_init_mmio(sbd, &s->iomem);
>  
> -    s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_DEFAULT);
> +    s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY);
>  
> -    s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_DEFAULT);
> +    s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
>  }
>  
>  static void imx_epit_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
> index 5c0d9a269ce..80b83026399 100644
> --- a/hw/timer/imx_gpt.c
> +++ b/hw/timer/imx_gpt.c
> @@ -505,7 +505,7 @@ static void imx_gpt_realize(DeviceState *dev, Error **errp)
>                            0x00001000);
>      sysbus_init_mmio(sbd, &s->iomem);
>  
> -    s->timer = ptimer_init(imx_gpt_timeout, s, PTIMER_POLICY_DEFAULT);
> +    s->timer = ptimer_init(imx_gpt_timeout, s, PTIMER_POLICY_LEGACY);
>  }
>  
>  static void imx_gpt_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> index fe0ca905f3c..ee7438f1684 100644
> --- a/hw/timer/mss-timer.c
> +++ b/hw/timer/mss-timer.c
> @@ -232,7 +232,7 @@ static void mss_timer_init(Object *obj)
>      for (i = 0; i < NUM_TIMERS; i++) {
>          struct Msf2Timer *st = &t->timers[i];
>  
> -        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
> +        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_LEGACY);
>          ptimer_transaction_begin(st->ptimer);
>          ptimer_set_freq(st->ptimer, t->freq_hz);
>          ptimer_transaction_commit(st->ptimer);
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index c72c327bfaf..77889397669 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -239,7 +239,7 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
>      s->enabled = 0;
>      s->irq = irq;
>  
> -    s->timer = ptimer_init(sh_timer_tick, s, PTIMER_POLICY_DEFAULT);
> +    s->timer = ptimer_init(sh_timer_tick, s, PTIMER_POLICY_LEGACY);
>  
>      sh_timer_write(s, OFFSET_TCOR >> 2, s->tcor);
>      sh_timer_write(s, OFFSET_TCNT >> 2, s->tcnt);
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 90fdce4c442..8c4f6eb06b6 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -405,7 +405,7 @@ static void slavio_timer_init(Object *obj)
>          tc->timer_index = i;
>  
>          s->cputimer[i].timer = ptimer_init(slavio_timer_irq, tc,
> -                                           PTIMER_POLICY_DEFAULT);
> +                                           PTIMER_POLICY_LEGACY);
>          ptimer_transaction_begin(s->cputimer[i].timer);
>          ptimer_set_period(s->cputimer[i].timer, TIMER_PERIOD);
>          ptimer_transaction_commit(s->cputimer[i].timer);
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 1eb927eb847..c7f17cd6460 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -223,7 +223,7 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
>  
>          xt->parent = t;
>          xt->nr = i;
> -        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_DEFAULT);
> +        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_LEGACY);
>          ptimer_transaction_begin(xt->ptimer);
>          ptimer_set_freq(xt->ptimer, t->freq_hz);
>          ptimer_transaction_commit(xt->ptimer);
> diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
> index 9176b96c1ce..22ef1ccb3a0 100644
> --- a/tests/unit/ptimer-test.c
> +++ b/tests/unit/ptimer-test.c
> @@ -768,7 +768,7 @@ static void add_ptimer_tests(uint8_t policy)
>      char policy_name[256] = "";
>      char *tmp;
>  
> -    if (policy == PTIMER_POLICY_DEFAULT) {
> +    if (policy == PTIMER_POLICY_LEGACY) {
>          g_sprintf(policy_name, "default");

Hi Peter,

It might be that above is clearer after this patch with "legacy" but since
it will break the automatic code changing sed command, with or without the
change:

Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>

Best regards,
Francisco Iglesias

>      }
>  
> @@ -862,7 +862,7 @@ static void add_ptimer_tests(uint8_t policy)
>  static void add_all_ptimer_policies_comb_tests(void)
>  {
>      int last_policy = PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT;
> -    int policy = PTIMER_POLICY_DEFAULT;
> +    int policy = PTIMER_POLICY_LEGACY;
>  
>      for (; policy < (last_policy << 1); policy++) {
>          if ((policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) &&
> -- 
> 2.25.1
> 

