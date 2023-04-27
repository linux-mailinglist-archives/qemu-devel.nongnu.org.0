Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C66F0068
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 07:30:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pruBl-0006hk-L5; Thu, 27 Apr 2023 01:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1pruBi-0006hU-M7
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 01:29:02 -0400
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1pruBe-0004xM-P5
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 01:29:02 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 33R5SMi7076472;
 Thu, 27 Apr 2023 13:28:22 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Thu, 27 Apr 2023 13:28:22 +0800
Date: Thu, 27 Apr 2023 13:28:18 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <qemu-devel@nongnu.org>, <ycliang@andestech.com>, <dylan@andestech.com>,
 <conor.dooley@microchip.com>
Subject: Re: [PATCH] target/riscv: Fix PMU node property for virt machine
Message-ID: <ZEoH8j6nbbQ5xlyS@APC323>
References: <20230421131437.19036-1-peterlin@andestech.com>
 <20230421-profanity-debug-2ef7d4740c33@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421-profanity-debug-2ef7d4740c33@spud>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 33R5SMi7076472
Received-SPF: pass client-ip=60.248.80.70; envelope-from=peterlin@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Conor,

Thank you for your prompt response.

On Fri, Apr 21, 2023 at 06:59:40PM +0100, Conor Dooley wrote:
> On Fri, Apr 21, 2023 at 09:14:37PM +0800, Yu Chien Peter Lin wrote:
> > The length of fdt_event_ctr_map[20] will add 5 dummy cells in
> > "riscv,event-to-mhpmcounters" property, so directly initialize
> > the array without an explicit size.
> > 
> > This patch also fixes the typo of PMU cache operation result ID
> > of MISS (0x1) in the comments, and renames event idx 0x10021 to
> > RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > 
> >   $ ./build/qemu-system-riscv64 -M virt,dumpdtb=/tmp/virt.dtb -cpu rv64,sscofpmf=on && dtc /tmp/virt.dtb | grep mhpmcounters
> >   [...]
> >     riscv,event-to-mhpmcounters = <0x01 0x01 0x7fff9 
> >                                    0x02 0x02 0x7fffc
> >                                    0x10019 0x10019 0x7fff8
> >                                    0x1001b 0x1001b 0x7fff8
> >                                    0x10021 0x10021 0x7fff8
> >                dummy cells --->    0x00 0x00 0x00 0x00 0x00>;
> > 
> > This won't break the OpenSBI, but will cause it to incorrectly increment
> > num_hw_events [1] to 6, and DT validation failure in kernel [2].
> > 
> >   $ dt-validate -p Documentation/devicetree/bindings/processed-schema.json virt.dtb
> >   [...]
> >   virt.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65569, 524280], [0, 0, 0], [0, 0]], 'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
> 
> I would note that this warning here does not go away with this patch ^^
> It's still on my todo list, unless you want to fix it!

I don't fully understand the warning raised by simple-bus.yaml
is it reasonable to move pmu out of soc node?

> 
> >           From schema: /home/peterlin/.local/lib/python3.10/site-packages/dtschema/schemas/simple-bus.yaml
> >   virt.dtb: pmu: riscv,event-to-mhpmcounters:6: [0, 0] is too short
> >   [...]
> 
> And with the binding below there is a 3rd warning, but I think it is
> incorrect and I submitted a patch for the binding to fix it.
> 
> That said, this doesn't seem to have been submitted on top of my naive
> s/20/15/ patch that Alistair picked up. Is this intended to replace, or
> for another branch? Replace works fine for me, don't have sentimental
> feelings for that patch!
> 
> I think your approach here was better than my s/20/15/, but seems like a
> bit of a fix and a bit of cleanup all-in-one.

I just find your patch [1], this solves my problem, thanks!
I will resend this patch based on yours, to simply fix some typos.

[1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20230404173333.35179-1-conor@kernel.org/

Best regards,
Peter Lin

> Either way, warnings gone so WFM :) :)
> 
> Thanks,
> Conor.
> 
> > [1] https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_pmu.c#L255
> > [2] https://github.com/torvalds/linux/blob/v6.3-rc7/Documentation/devicetree/bindings/perf/riscv%2Cpmu.yaml#L54-L66
> > ---
> >  target/riscv/cpu.h        |  2 +-
> >  target/riscv/cpu_helper.c |  2 +-
> >  target/riscv/pmu.c        | 88 +++++++++++++++++++--------------------
> >  3 files changed, 45 insertions(+), 47 deletions(-)
> > 
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 638e47c75a..eab518542c 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -812,7 +812,7 @@ enum riscv_pmu_event_idx {
> >      RISCV_PMU_EVENT_HW_INSTRUCTIONS = 0x02,
> >      RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS = 0x10019,
> >      RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS = 0x1001B,
> > -    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
> > +    RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS = 0x10021,
> >  };
> >  
> >  /* CSR function table */
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index f88c503cf4..5d3e032ec9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1210,7 +1210,7 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
> >  
> >      switch (access_type) {
> >      case MMU_INST_FETCH:
> > -        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> > +        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS;
> >          break;
> >      case MMU_DATA_LOAD:
> >          pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index b8e56d2b7b..0b21c3fa38 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -35,51 +35,49 @@
> >   */
> >  void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
> >  {
> > -    uint32_t fdt_event_ctr_map[20] = {};
> > -    uint32_t cmask;
> > -
> >      /* All the programmable counters can map to any event */
> > -    cmask = MAKE_32BIT_MASK(3, num_ctrs);
> > -
> > -   /*
> > -    * The event encoding is specified in the SBI specification
> > -    * Event idx is a 20bits wide number encoded as follows:
> > -    * event_idx[19:16] = type
> > -    * event_idx[15:0] = code
> > -    * The code field in cache events are encoded as follows:
> > -    * event_idx.code[15:3] = cache_id
> > -    * event_idx.code[2:1] = op_id
> > -    * event_idx.code[0:0] = result_id
> > -    */
> > -
> > -   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> > -   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
> > -   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
> > -   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
> > -
> > -   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> > -   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
> > -   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
> > -   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
> > -
> > -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> > -   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
> > -   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
> > -   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
> > -
> > -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
> > -   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
> > -   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
> > -   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
> > -
> > -   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> > -   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
> > -   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
> > -   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
> > -
> > -   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> > -   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> > -                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> > +    uint32_t cmask = MAKE_32BIT_MASK(3, num_ctrs);
> > +
> > +    /*
> > +     * The event encoding is specified in the SBI specification
> > +     * Event idx is a 20bits wide number encoded as follows:
> > +     * event_idx[19:16] = type
> > +     * event_idx[15:0] = code
> > +     * The code field in cache events are encoded as follows:
> > +     * event_idx.code[15:3] = cache_id
> > +     * event_idx.code[2:1] = op_id
> > +     * event_idx.code[0:0] = result_id
> > +     */
> > +    const uint32_t fdt_event_ctr_map[] = {
> > +        /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> > +        cpu_to_be32(RISCV_PMU_EVENT_HW_CPU_CYCLES),
> > +        cpu_to_be32(RISCV_PMU_EVENT_HW_CPU_CYCLES),
> > +        cpu_to_be32(cmask | 1 << 0),
> > +
> > +        /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> > +        cpu_to_be32(RISCV_PMU_EVENT_HW_INSTRUCTIONS),
> > +        cpu_to_be32(RISCV_PMU_EVENT_HW_INSTRUCTIONS),
> > +        cpu_to_be32(cmask | 1 << 2),
> > +
> > +        /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x01 type(0x01) */
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS),
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS),
> > +        cpu_to_be32(cmask),
> > +
> > +        /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x01 type(0x01) */
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS),
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS),
> > +        cpu_to_be32(cmask),
> > +
> > +        /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x01 type(0x01) */
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS),
> > +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS),
> > +        cpu_to_be32(cmask),
> > +    };
> > +
> > +    /* This a OpenSBI specific DT property documented in OpenSBI docs */
> > +    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> > +                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> >  }
> >  
> >  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> > @@ -317,7 +315,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> >      case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
> >      case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
> >      case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> > -    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> > +    case RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS:
> >          break;
> >      default:
> >          /* We don't support any raw events right now */
> > -- 
> > 2.34.1
> > 
> > 



