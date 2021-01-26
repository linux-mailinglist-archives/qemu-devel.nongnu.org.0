Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6F0303B55
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:18:25 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MMa-0002lM-TV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MKs-0001MS-5P
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:38 -0500
Received: from mail-co1nam11on2087.outbound.protection.outlook.com
 ([40.107.220.87]:63488 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MKp-000885-61
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+wqUyisLKmvNYXWZlCvGz2PVga9zJIXE2tWjJHwhyavOiLboG3AdXUYpm/QL3adNY5VhC7GyhbaCMSq7KyQ8RcHRLze39FBmwZLpy/QRVvGPr/eQjaw9Fm5eg6Jiy3pVqm4rE3jPaPJ/QqArOWAG1od0eRMZaEsHNq+XhJEgjyR4Cd7wNvivLScAvNR/fZCa8asACDqpmG3fzC4ewSB6RsEBmQkT6Yj0KFcjYctd7tEDaz9WufE3Sq24YiSoBvDxOISJWpUmsFJM+j2Rs6Kc0/9mFynDkXn0U0qJqZ3Ax/ulHT8o5ynJRJ4BQRXQutihXsMTHOI/NzZKvMsQ50Dgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klwx29Kvnuvkk7Wo8aiGfChA0GXJe4vF60bC07iXx78=;
 b=UkYCyXkvDnoQRy8i7Mg9wVy022+m7TdcxyXgBqgmo+nSrArBwMualNyCcTDzWugu7SPKdJmzVrVw1tjqhdEPI+XJ6Q6Xvqcg7uZixpniPEMV0GGxAmVs4OWruraXZbt5Z1RKKz6cvjpp+nlcUAN+SQtJijJ1lYVlzP2t6aZ6353r01HO5XJveS857fSyX1hhrRhZ08OS2UjHl29Ls+zMvk+jprsEI9xET36+9q2FhHYEUE4Pbap66uNJj/TYs4QkOF6rbHw3r/1moETMj1E/19Uwf+z8F1sY67Rrw9O0r0sLZZoL6wc5sDa7+o5Q0dm8h3Qxa4wbNLPr6OmVWrPqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klwx29Kvnuvkk7Wo8aiGfChA0GXJe4vF60bC07iXx78=;
 b=rtzeX420LKT4cOwMDypHDm5zXVfMKkuCtaTPdduZiQAYXerkQgNFOzhA5IO+AaW4g8sTw6Vg+xd96YVy+082Nbl/xdII+YWGgMio+OoaOwjdJdHu4C806C9en/zEzTatj89clFBCHywBr/uasR76/pDQwI657uI56/gYdcpeQJ0=
Received: from SN4PR0501CA0056.namprd05.prod.outlook.com
 (2603:10b6:803:41::33) by MN2PR02MB6143.namprd02.prod.outlook.com
 (2603:10b6:208:1b8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 26 Jan
 2021 11:16:31 +0000
Received: from SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::d0) by SN4PR0501CA0056.outlook.office365.com
 (2603:10b6:803:41::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend
 Transport; Tue, 26 Jan 2021 11:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT003.mail.protection.outlook.com (10.152.73.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 11:16:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 26 Jan 2021 03:16:30 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 26 Jan 2021 03:16:30 -0800
Received: from [10.71.117.86] (port=57589 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1l4MKj-0002du-Fk; Tue, 26 Jan 2021 03:16:30 -0800
Date: Tue, 26 Jan 2021 12:16:35 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v1 3/3] target/microblaze: Add security attributes on
 memory transactions
Message-ID: <20210126111635.GH10562@toto>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
 <1611274735-303873-4-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611274735-303873-4-git-send-email-komlodi@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f112536a-f943-4ddb-e42c-08d8c1ebd506
X-MS-TrafficTypeDiagnostic: MN2PR02MB6143:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6143F2EDF12B07638AABA80EC2BC9@MN2PR02MB6143.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tHxeVpGoSRpO46Sx0eietiOiSYLWRGQhwGE4cnVpbvnL1cVQUxFs7EAWHXw4v7XRC4GEiGHGPIH/an40pUHKGrTTvujrQUiQYYqON2Zia9+QRX9SsKK/DvuWeGn+HJzu9K6Y9EDH0C33Vz5zbtHaO5hilldomuG9dFepaalqSzkj5aVfUA49nngnd0XS9mKdmUjDfzx92qPSAgP6ObDbJWyHnbVcInZM9oBqIUjeGvayriMcni/VE22tIgxaQondEXJZDNbJUfyA/GuDTTeeOy+1aY02anrVQLZKXWCj6C0m716Cg6BWROSyn29+OqzJDOJ+WXnSEML+ZazVj73iq9O05yjC35Oaokxc+eDOHmbclTtp8KiA24wVLQkPF1gd6qr2sx1xTZXkcPNN7WzjQ1zPlJsxSmxKxewTrjs7FqnN76ZpDT59ZqLB9Km+tTIcm4/b87dVpW+k7/IOAETdQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(33656002)(6862004)(2906002)(4326008)(82310400003)(8676002)(70206006)(478600001)(7636003)(356005)(26005)(83380400001)(70586007)(426003)(82740400003)(47076005)(336012)(186003)(316002)(54906003)(36906005)(107886003)(6636002)(5660300002)(1076003)(9686003)(8936002)(9786002)(33716001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:16:30.7589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f112536a-f943-4ddb-e42c-08d8c1ebd506
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6143
Received-SPF: pass client-ip=40.107.220.87; envelope-from=edgar@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: edgari@xilinx.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 04:18:55PM -0800, Joe Komlodi wrote:
> Using the cfg.use_non_secure bitfield and the MMU access type, we can determine
> if the access should be secure or not.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  target/microblaze/cpu.c    |  2 +-
>  target/microblaze/cpu.h    |  3 ++-
>  target/microblaze/helper.c | 26 +++++++++++++++++++++++---
>  3 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index accfb23..d5e8bfe 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -375,7 +375,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>      cc->tlb_fill = mb_cpu_tlb_fill;
>  #ifndef CONFIG_USER_ONLY
>      cc->do_transaction_failed = mb_cpu_transaction_failed;
> -    cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
> +    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
>      dc->vmsd = &vmstate_mb_cpu;
>  #endif
>      device_class_set_props(dc, mb_properties);
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 199cfb0..e4bba8a 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -361,7 +361,8 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
>  void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> -hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
> +                                        MemTxAttrs *attrs);
>  int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index cda14a1..20dbd67 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -46,6 +46,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>  
>  #else /* !CONFIG_USER_ONLY */
>  
> +static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
> +                                    MMUAccessType access_type)
> +{
> +    if (access_type == MMU_INST_FETCH) {
> +        return !cpu->ns_axi_ip;
> +    } else {
> +        return !cpu->ns_axi_dp;
> +    }
> +}
> +
>  bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr)
> @@ -55,12 +65,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      MicroBlazeMMULookup lu;
>      unsigned int hit;
>      int prot;
> +    MemTxAttrs attrs = {};
> +
> +    attrs.secure = mb_cpu_access_is_secure(cpu, access_type);
>  
>      if (mmu_idx == MMU_NOMMU_IDX) {
>          /* MMU disabled or not available.  */
>          address &= TARGET_PAGE_MASK;
>          prot = PAGE_BITS;
> -        tlb_set_page(cs, address, address, prot, mmu_idx, TARGET_PAGE_SIZE);
> +        tlb_set_page_with_attrs(cs, address, address, attrs, prot, mmu_idx,
> +                                TARGET_PAGE_SIZE);
>          return true;
>      }
>  
> @@ -71,7 +85,8 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>  
>          qemu_log_mask(CPU_LOG_MMU, "MMU map mmu=%d v=%x p=%x prot=%x\n",
>                        mmu_idx, vaddr, paddr, lu.prot);
> -        tlb_set_page(cs, vaddr, paddr, lu.prot, mmu_idx, TARGET_PAGE_SIZE);
> +        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, lu.prot, mmu_idx,
> +                                TARGET_PAGE_SIZE);
>          return true;
>      }
>  
> @@ -230,7 +245,8 @@ void mb_cpu_do_interrupt(CPUState *cs)
>      }
>  }
>  
> -hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
> +                                        MemTxAttrs *attrs)
>  {
>      MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
>      CPUMBState *env = &cpu->env;
> @@ -239,6 +255,10 @@ hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      int mmu_idx = cpu_mmu_index(env, false);
>      unsigned int hit;
>  
> +    /* Caller doesn't initialize */
> +    *attrs = (MemTxAttrs) {};
> +    attrs->secure = mb_cpu_access_is_secure(cpu, MMU_DATA_LOAD);
> +
>      if (mmu_idx != MMU_NOMMU_IDX) {
>          hit = mmu_translate(cpu, &lu, addr, 0, 0);
>          if (hit) {
> -- 
> 2.7.4
> 

