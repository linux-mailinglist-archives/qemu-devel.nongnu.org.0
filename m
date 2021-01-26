Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9C303BB4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:34:11 +0100 (CET)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mbq-00023M-FG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MZ8-0000Ri-Kq
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:31:22 -0500
Received: from mail-bn8nam12on2066.outbound.protection.outlook.com
 ([40.107.237.66]:24033 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>) id 1l4MZ5-0004l5-7p
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:31:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsvc13QlncraVki+8BM0iDhbJtfDG4VOZnBczt7oWngTLk/shtCr1N3thBz7CEMu7QHKuKK48mJj9eO5JDnbjgWF//Dt9q85CnUW7XDwxRATtnq/oQhZ9vaV9hmjdNbryOmJEdeN2gCQIe7YsxIIf7wpF9sTrlonH/EgllW3jZP7NRyg9cU4cOO7DAkRXIdRqxvpX1Z4ajOEFLS6BgZPQhWsRIZ88OxB8IgEbEBLnI3wvhkcYWzjjvPAZIZ9SSnyaVgqU0A8uWXV+k2Omdb3sRXv+tl6Uqmbg3KKXcACWo1W1Vad6fIbv982qgCEjeuZyYmPDI/mBlBECh4ZqF5tTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao1X1cc/9UKLqmnB3BAQ7ng+hgdcA+/r2THeAVQN59g=;
 b=EIlOSK5323Q8XC0q87asKcB6yD1zI5HgMzWntTVELg7RCug/lnBPgh3yG9b3c8sOXtBmLGKrxIik1UytFHXW3KVneEsfQbi3grdjPD6sfdE+k13bD7O71gVYQTRAAN+2TUelCQO1E6IMYp74WDD1TtJauw70nZrZuxKhOlRW6XnYIsjsjXgwE2DL/qPMaNfx/DJsGOyc4dPRxLDhkMZk0kaodhC9xAK8g4CJP/I8wELDM7qSI0bvuLka10BparaXnWG9GQxRqF92GkKGHgHlTu15v1YAbs1mVgrhRdto6kUd4GcqQk/wodJW1imlj3vvjY2lffssWu+z5pJn/WGBIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao1X1cc/9UKLqmnB3BAQ7ng+hgdcA+/r2THeAVQN59g=;
 b=cXKdXS5xft/ON0t6ZLBZX+lIHer4KLbcKCV67J7R58ANKKvmmRj7zq0BZJVSLwcHP2YwaCvVvu3I7OK4CLfJTGJnHUE+o+CbMFQJwzSoS3z4lUm3NCWAUf2lFuvhYrW0opjk6P2FmlElBtOzt4cqrwYB5lXy+AP7bCsN2DKTUSw=
Received: from SN6PR04CA0081.namprd04.prod.outlook.com (2603:10b6:805:f2::22)
 by MWHPR02MB2589.namprd02.prod.outlook.com (2603:10b6:300:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 11:16:12 +0000
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::7c) by SN6PR04CA0081.outlook.office365.com
 (2603:10b6:805:f2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend
 Transport; Tue, 26 Jan 2021 11:16:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Tue, 26 Jan 2021 11:16:11 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 26 Jan 2021 03:16:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 26 Jan 2021 03:16:10 -0800
Received: from [10.71.117.86] (port=52851 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1l4MKQ-0002cd-ID; Tue, 26 Jan 2021 03:16:10 -0800
Date: Tue, 26 Jan 2021 12:16:16 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v1 1/3] target/microblaze: Add use-non-secure property
Message-ID: <20210126111616.GF10562@toto>
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
 <1611274735-303873-2-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611274735-303873-2-git-send-email-komlodi@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71781de2-1535-4376-7d69-08d8c1ebc9a2
X-MS-TrafficTypeDiagnostic: MWHPR02MB2589:
X-Microsoft-Antispam-PRVS: <MWHPR02MB258928AE4151B0C020903A19C2BC9@MWHPR02MB2589.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQKSUkJ7OevmyCkJa3f2R9eSz2siSwJ3wkH4GqotKhxsb66FFbtt/M3V2FY1ZtS7YsCnIn54VP/TYCc+qWeVrd56VfZgLHbi3amapIPMbEGLIFMofh2bcyMJLtArP2VxQ33qKAix0kvwO7Uw4IOkERIqQq3Qwj2m+UPiWQlvp0q0NT5Xt4utmL7rtcPjD122u5f9uSfzm0QjpAUDitV1P5YTDn5b8ICR6q7n0PMCsd1mxFUDmuWF8FpUfGyQ76G7uT7h6D/342I1njGBfs0lC0M47AomTOseiFfxZdBmc+h0tNCUx6FK5WMeaXf+n5cpdXyZ+kdehAkJnXWDzqDGP6rhjEa95r9l1DAdzR8OVrpkvMF/84zNTYcUfI0OfKxST9fzA1LhVHEe1jwDSq+NYDw/lXXXhLlr8fN/EC+hl2uwBy2+M9wRXSY28A5mYMG5cbiAaJlC/vVzZKbbYwD3j7gdKDozVlzUZD9L3yjwYoL8CA24niRyZ/xJ63WhvK3fFl3N0eoHsS2C2/+e4+JOTf8D6pkrVSrqBqjnK+GzhDg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(82310400003)(9686003)(70586007)(4326008)(356005)(8676002)(5660300002)(70206006)(107886003)(1076003)(54906003)(2906002)(478600001)(47076005)(426003)(83380400001)(33716001)(6862004)(186003)(82740400003)(316002)(966005)(336012)(9786002)(8936002)(6636002)(33656002)(26005)(7636003)(36906005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:16:11.6470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71781de2-1535-4376-7d69-08d8c1ebc9a2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2589
Received-SPF: pass client-ip=40.107.237.66; envelope-from=edgar@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

On Thu, Jan 21, 2021 at 04:18:53PM -0800, Joe Komlodi wrote:
> This property is used to control the security of the following interfaces
> on MicroBlaze:
> M_AXI_DP - data interface
> M_AXI_IP - instruction interface
> M_AXI_DC - dcache interface
> M_AXI_IC - icache interface
> 
> It works by enabling or disabling the use of the non_secure[3:0] signals.
> 
> Interfaces and their corresponding values are taken from:
> https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug984-vivado-microblaze-ref.pdf
> page 153.

Thanks Joe!

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  target/microblaze/cpu.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/microblaze/cpu.h | 11 +++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index c8e754c..accfb23 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -98,6 +98,38 @@ static bool mb_cpu_has_work(CPUState *cs)
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> +static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
> +{
> +    MicroBlazeCPU *cpu = opaque;
> +    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DP_MASK;
> +
> +    cpu->ns_axi_dp = level & en;
> +}
> +
> +static void mb_cpu_ns_axi_ip(void *opaque, int irq, int level)
> +{
> +    MicroBlazeCPU *cpu = opaque;
> +    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IP_MASK;
> +
> +    cpu->ns_axi_ip = level & en;
> +}
> +
> +static void mb_cpu_ns_axi_dc(void *opaque, int irq, int level)
> +{
> +    MicroBlazeCPU *cpu = opaque;
> +    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_DC_MASK;
> +
> +    cpu->ns_axi_dc = level & en;
> +}
> +
> +static void mb_cpu_ns_axi_ic(void *opaque, int irq, int level)
> +{
> +    MicroBlazeCPU *cpu = opaque;
> +    bool en = cpu->cfg.use_non_secure & USE_NON_SECURE_M_AXI_IC_MASK;
> +
> +    cpu->ns_axi_ic = level & en;
> +}
> +
>  static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
>  {
>      MicroBlazeCPU *cpu = opaque;
> @@ -248,6 +280,10 @@ static void mb_cpu_initfn(Object *obj)
>  #ifndef CONFIG_USER_ONLY
>      /* Inbound IRQ and FIR lines */
>      qdev_init_gpio_in(DEVICE(cpu), microblaze_cpu_set_irq, 2);
> +    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dp, "ns_axi_dp", 1);
> +    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ip, "ns_axi_ip", 1);
> +    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dc, "ns_axi_dc", 1);
> +    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ic, "ns_axi_ic", 1);
>  #endif
>  }
>  
> @@ -277,6 +313,16 @@ static Property mb_properties[] = {
>      DEFINE_PROP_BOOL("use-msr-instr", MicroBlazeCPU, cfg.use_msr_instr, true),
>      DEFINE_PROP_BOOL("use-pcmp-instr", MicroBlazeCPU, cfg.use_pcmp_instr, true),
>      DEFINE_PROP_BOOL("use-mmu", MicroBlazeCPU, cfg.use_mmu, true),
> +    /*
> +     * use-non-secure enables/disables the use of the non_secure[3:0] signals.
> +     * It is a bitfield where 1 = non-secure for the following bits and their
> +     * corresponding interfaces:
> +     * 0x1 - M_AXI_DP
> +     * 0x2 - M_AXI_IP
> +     * 0x4 - M_AXI_DC
> +     * 0x8 - M_AXI_IC
> +     */
> +    DEFINE_PROP_UINT8("use-non-secure", MicroBlazeCPU, cfg.use_non_secure, 0),
>      DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
>                       false),
>      DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index c1c2641..199cfb0 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -233,6 +233,12 @@ typedef struct CPUMBState CPUMBState;
>  
>  #define TARGET_INSN_START_EXTRA_WORDS 1
>  
> +/* use-non-secure property masks */
> +#define USE_NON_SECURE_M_AXI_DP_MASK 0x1
> +#define USE_NON_SECURE_M_AXI_IP_MASK 0x2
> +#define USE_NON_SECURE_M_AXI_DC_MASK 0x4
> +#define USE_NON_SECURE_M_AXI_IC_MASK 0x8
> +
>  struct CPUMBState {
>      uint32_t bvalue;   /* TCG temporary, only valid during a TB */
>      uint32_t btarget;  /* Full resolved branch destination */
> @@ -316,6 +322,7 @@ typedef struct {
>      bool use_msr_instr;
>      bool use_pcmp_instr;
>      bool use_mmu;
> +    uint8_t use_non_secure;
>      bool dcache_writeback;
>      bool endi;
>      bool dopb_bus_exception;
> @@ -337,6 +344,10 @@ struct MicroBlazeCPU {
>      CPUState parent_obj;
>  
>      /*< public >*/
> +    bool ns_axi_dp;
> +    bool ns_axi_ip;
> +    bool ns_axi_dc;
> +    bool ns_axi_ic;
>  
>      CPUNegativeOffsetState neg;
>      CPUMBState env;
> -- 
> 2.7.4
> 

