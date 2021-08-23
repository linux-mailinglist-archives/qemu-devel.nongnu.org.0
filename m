Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8003F4BD8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:47:09 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAI8-0004j3-2c
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mIAGr-0003ir-ON; Mon, 23 Aug 2021 09:45:49 -0400
Received: from mail-bn8nam08on2063.outbound.protection.outlook.com
 ([40.107.100.63]:11424 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mIAGm-00021G-9X; Mon, 23 Aug 2021 09:45:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEyyqq3gCszLknMpkxrQ7UzbdXhbxTPGgWHFzk78yKF9M+f48OvwCTMKa2RQ/D7345t8MvXxqaBYPNxFk3LkE2JrrI5VhlrSuutlXKzhKN567xbNCOkYH3CUwppKqhuLFeBinO8UzPe4NyBgX/EMyVbCsFtJj9hvvA04Wilp/Ol1JtFyzTKxdsy0ywh5qiQReHqTpFHJ8Nar8rro5GgkGkC09++9GUqyC36HRUTsI/k43e0tKSjQewXqONWsqHagcPRmDr/6IsamuIH7LUHUpP0yuMaHUVz4tYSKSVENbFFWoX93/ZL8p8Ie2viHNmx/uVaaSCXbxVCRm0CNmVK70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLHNJLt6tHLDxMOADysd6r/610EVXFfvqYsE653ttv8=;
 b=UKG/1CkwqkHQJrst6y9Nm08n0jsvoW8UwmSxPw3Jdak34Fssk4XLbRQMQwOQBBhhCbj5Fv1DhPYHGbQ8IL/u/epLUOhPY3vA+bojfd0Bu9Vt/zc2VXMqJKWKl7BNcCQ0rj1+fnpPNXHQKsTXpXM5QcTVmLgMObLTSImfcR/bn97/5rwSRolJhP0lQKB3v8lAaP7OVrLEYdpzg3G9A6uoOQFl1NCuP6UOl95E1WfqAhF9skmw47hKFaOKyMi6qp0047SaYfNPWjpNz6Bij8fk7KM8DOXRIhKPPZ7QEwuN2HRmDNmI8T2i6rh/gZkDDZbu9I9e9MHXoCgBImnCFGortQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLHNJLt6tHLDxMOADysd6r/610EVXFfvqYsE653ttv8=;
 b=ArIph9vESP9/R3gIuh+U0BDPhtRW9pB9d/viiLf5yWuqomvziPOjLv/3jZ4tsOctfAepKBobwPgyMznAX2cL82O7IFfUP8vrMpohobSXWS6Y4nJcmqtn/GYiCZwYRsV9LX78fm9+gd5TE68a7l+JyylcsxcdWwTlhM/WuKi7V6s=
Received: from BN6PR13CA0057.namprd13.prod.outlook.com (2603:10b6:404:11::19)
 by SA2PR02MB7849.namprd02.prod.outlook.com (2603:10b6:806:14c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 13:45:35 +0000
Received: from BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::2e) by BN6PR13CA0057.outlook.office365.com
 (2603:10b6:404:11::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.9 via Frontend
 Transport; Mon, 23 Aug 2021 13:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT020.mail.protection.outlook.com (10.13.2.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 13:45:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 06:45:33 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 06:45:33 -0700
Received: from [10.71.116.242] (port=58247 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mIAGa-0003fV-Rc; Mon, 23 Aug 2021 06:45:33 -0700
Date: Mon, 23 Aug 2021 15:45:31 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: zynq_slcr: Correctly compute output clocks
 in the reset exit phase
Message-ID: <20210823134531.GA24187@toto>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-2-bmeng.cn@gmail.com>
 <CAKmqyKPnAQHi4hkTrSVCkHX4tHZyXFnkoESh9svc-qQNqG5-2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKmqyKPnAQHi4hkTrSVCkHX4tHZyXFnkoESh9svc-qQNqG5-2Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6c25f13-56bb-4fa5-d18c-08d9663c488d
X-MS-TrafficTypeDiagnostic: SA2PR02MB7849:
X-Microsoft-Antispam-PRVS: <SA2PR02MB78499DBF6699E38442690B3CC2C49@SA2PR02MB7849.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YkhGUNb1zJYy4QhbR7de7XoMmEZk045czhPCtffWpB4ilUS7BNQnXP07Xg2OZQR1RdAWRRECWUsWz+wqTYXE0288m5kc7RB1rRT44WnoZpkhTUIW0HF1keODI1sfj/lT1W231ieTU1PwZdIWYSDK1J4XEjXzlDAINyFkTDoOXveag60Sx4oHHRCFj6QRnQepqT3jABSY65L60hz7n9jdKT9cuNxd/eB85kcZPLjW1XpxYXHYUbcQolM6zdqSCllnLYg0Wciq1lOs5TWLL6xcRE74bNQa7980T3uIpjaJZL6SuqGIV032uhjDYkduF92TVdFn1MGELQSinCfp3yXtB7ykABKdmPUSng+9aqthDvFVEJvSesmHkZGAYuqILtWF7ZCSOHTY7Z1Z6WH5V/PdFFSyf+kt4DVxYauwLtRYNmHMFpcGDZ0vW/b1xlbslKLwNp/NSC8C7hu1s/Ulgj5Xz/7TG4lff2BVhCt8wSWvnS7fsm1kyPHMqmANyCfg4/1rONcm1jqwr39g14FDPj+itlQI8MYQZQrdDJ8ivbXZT/YRSukXnlriFkkq2/b4D4kslDvycG+UxMTgteGrXixG3PdgYk5YwFgoz5Ub2rFlXbSlSl030egcZZgKRooyVfn/xfcmpXYDupKjUmQOfXRoKuRNQ2Jh1OPWhJZTf0cIHLvGcIQQ2vihmJNZtvGY4z+9HDbC+ywqQ6bBw8wmDG6pMg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(36906005)(36860700001)(54906003)(9686003)(9786002)(7636003)(478600001)(5660300002)(316002)(82740400003)(70206006)(4326008)(70586007)(2906002)(82310400003)(33656002)(47076005)(83380400001)(53546011)(336012)(426003)(8936002)(186003)(6916009)(1076003)(33716001)(8676002)(26005)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 13:45:34.9631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c25f13-56bb-4fa5-d18c-08d9663c488d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7849
Received-SPF: pass client-ip=40.107.100.63; envelope-from=edgar@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 02:42:03PM +1000, Alistair Francis wrote:
> On Mon, Aug 23, 2021 at 12:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
> > does not receive anything. Debugging shows that the UART input clock
> > frequency is zero which prevents the UART from receiving anything as
> > per the logic in uart_receive().
> >
> > From zynq_slcr_reset_exit() comment, it intends to compute output
> > clocks according to ps_clk and registers. zynq_slcr_compute_clocks()
> > is called to accomplish the task, inside which device_is_in_reset()
> > is called to actually make the attempt in vain.
> >
> > Rework reset_hold() and reset_exit() so that in the reset exit phase,
> > the logic can really compute output clocks in reset_exit().
> >
> > With this change, upstream U-Boot boots properly again with:
> >
> > $ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
> >     -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
> >
> > Fixes: 38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Alistair
> 
> > ---
> >
> >  hw/misc/zynq_slcr.c | 31 ++++++++++++++++++-------------
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> > index 5086e6b7ed..8b70285961 100644
> > --- a/hw/misc/zynq_slcr.c
> > +++ b/hw/misc/zynq_slcr.c
> > @@ -269,6 +269,21 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
> >      zynq_slcr_compute_clock((plls), (state)->regs[reg], \
> >                              reg ## _ ## enable_field ## _SHIFT)
> >
> > +static void zynq_slcr_compute_clocks_internal(ZynqSLCRState *s, uint64_t ps_clk)
> > +{
> > +    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
> > +    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
> > +    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
> > +
> > +    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
> > +
> > +    /* compute uartX reference clocks */
> > +    clock_set(s->uart0_ref_clk,
> > +              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
> > +    clock_set(s->uart1_ref_clk,
> > +              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
> > +}
> > +
> >  /**
> >   * Compute and set the ouputs clocks periods.
> >   * But do not propagate them further. Connected clocks
> > @@ -283,17 +298,7 @@ static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> >          ps_clk = 0;
> >      }
> >
> > -    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
> > -    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
> > -    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
> > -
> > -    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
> > -
> > -    /* compute uartX reference clocks */
> > -    clock_set(s->uart0_ref_clk,
> > -              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT0));
> > -    clock_set(s->uart1_ref_clk,
> > -              ZYNQ_COMPUTE_CLK(s, uart_mux, R_UART_CLK_CTRL, CLKACT1));
> > +    zynq_slcr_compute_clocks_internal(s, ps_clk);
> >  }
> >
> >  /**
> > @@ -416,7 +421,7 @@ static void zynq_slcr_reset_hold(Object *obj)
> >      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> >
> >      /* will disable all output clocks */
> > -    zynq_slcr_compute_clocks(s);
> > +    zynq_slcr_compute_clocks_internal(s, 0);
> >      zynq_slcr_propagate_clocks(s);
> >  }
> >
> > @@ -425,7 +430,7 @@ static void zynq_slcr_reset_exit(Object *obj)
> >      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> >
> >      /* will compute output clocks according to ps_clk and registers */
> > -    zynq_slcr_compute_clocks(s);
> > +    zynq_slcr_compute_clocks_internal(s, clock_get(s->ps_clk));
> >      zynq_slcr_propagate_clocks(s);
> >  }
> >
> > --
> > 2.25.1
> >
> >

