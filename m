Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5BE474119
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:07:39 +0100 (CET)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5ek-0000oG-Sd
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bB-0006tJ-6w
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:03:57 -0500
Received: from mail-mw2nam12on2071.outbound.protection.outlook.com
 ([40.107.244.71]:30881 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5b3-0006wy-KY
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:03:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAEXl2ZgVVR1qMlvzlyhcCpq264CKUlVZR426M3ilydRUf7+lmiCJhGPd3m8pxHwi3X0ZpsqjNqLy7SA6agTYmdOkkzYLyN4QGmYL0sX9Ub7AA0lUjGn2deoi4jSeTtIfGs2h9yG1Wu2UBBiYT/lomlfwen+ILw1df1yMlC1plYHRQwg4q8vg1UvN705mTKyx79KOFj9jcfj7Y0UVZYYp12nWMkUxLtGse8OtS0F3gJV8pAmLekd+hOSYk5nFQ1WZbDuZ9cVLBmgfeNnZnBYuH5W7o8/cp0Dyl+eBqDJkjwXtEU3pgATT4FZWllzn4wYq+IeQaugZE9rRsm1XGYjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qDlklyb+a7BkoBbjqvJrLMN7PL7LsDR6bB07MoltlY=;
 b=H3/WqubsXb/265YCWI9s3lojEB7nXR5AW4gJJRRWg1zNhyxvecfgXQrpwNHaZMSrm7khxWioJSmh7F2jj2Y0ouZiq86GeHVwQ34eGwk2PhrhPKPo6oVkgVkXlPyotQzYGDkWi+/pM/eE2Jbwf0sceklOZ4+pCg6aIXYNtgkWJ1TBUWWN6+C6ICnzNpfgKHqXBWqq42QG04Eo+SRTpYIyKiQmO2kY0+RDAT5dNxzbFAakErfjhB5RqngjaucYp38coEz3eP9t5o3MSkeh+3nWQBElc/yRtFCaePRbS/NLfVC1Xih6EiTjzSAycM8Opux6imQLfgf0Ki7mR3WdlIEN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qDlklyb+a7BkoBbjqvJrLMN7PL7LsDR6bB07MoltlY=;
 b=Xyy4rwF/903BHLoV1L6uCcI5uNDKF4WlE8Y5hSJ5woXXgyafzqX9Z+E4OnxIc+tbkzZm9b7gZ19uc1dWkuRv4/rjOQ84K80/tRUpzPQswHtIZp2j9CW1BZMAzinpsryJUS9YtEmjnIznLRXqNDg4ayc5GRuStxuWlWrgn48pGZM=
Received: from DM5PR2001CA0017.namprd20.prod.outlook.com (2603:10b6:4:16::27)
 by BN0PR02MB7935.namprd02.prod.outlook.com (2603:10b6:408:165::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 11:03:40 +0000
Received: from DM3NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::7) by DM5PR2001CA0017.outlook.office365.com
 (2603:10b6:4:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Tue, 14 Dec 2021 11:03:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT030.mail.protection.outlook.com (10.13.4.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:03:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:03:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:03:39 -0800
Received: from [10.23.120.191] (port=54384 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5at-0006CE-7v; Tue, 14 Dec 2021 03:03:39 -0800
Date: Tue, 14 Dec 2021 11:03:37 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 06/11] hw/ssi: Add a model of Xilinx Versal's OSPI
 flash memory controller
Message-ID: <20211214110336.i23qmqfujtexi5qp@debian>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-7-francisco.iglesias@xilinx.com>
 <CAFEAcA8JrXkb-aLDDLh17wvtsJbo+G_VkVOoK89=xmX8keoegA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8JrXkb-aLDDLh17wvtsJbo+G_VkVOoK89=xmX8keoegA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e052702-40fc-44a3-f370-08d9bef16294
X-MS-TrafficTypeDiagnostic: BN0PR02MB7935:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB79356EFDF1D233702DD972E6AD759@BN0PR02MB7935.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4SrXxXhaRYWT5aaoDmjqeJjlHrzOH6vpQnDnGf42NOAp9bcFMLeDyfc4pasAi8vl6lFXbkXbYqwYEMdfIApN1vS7hvCJGbPgPwa9JXFovgMI9Yn4x8jM8vjwGj42m0jLeCo26aeyg9vbLnINZxKqgBgWybDgqN9mW/DuqLKf3f09wp87BwY5EzojQCLdVKfQ28rZLcrlI5G4ZUoDsYwPzSH3YY8pxmZZ8nTSASh/C5Nouiy+JV0yW2IsQWMEBU/QC+WX6g9ld8rneTf4HcEyADc5Qa7i7BLNR39V53iqCFn42yvJTNlmZ6duJ0gtRkydyQx/6meIZhyv9XYcWFoWINFauTxdJnlrszpQHBxfNIX995yHioXaG5Eib9Bv82USIksqrSokKof7DLnIl637s1lJ1iKaS6xEN2nSKSWCYxzDRSJ75X91oP/EzL9Kr/KM+0OEIpiMiMVFEf+HOvcdAzA2sC89LzZbzxp1Zv0t+JOIawZiebegyrsLRY9ZA1e1BVkVw3X5NdIHGZzJPm/KPynIuZEK3QWc9L6G1VEdL1nb1tP7n8pfXNRn7lV+IgxhkH+STl9dXSMOSD6Z+yhxwty8E24Pk3OPkbCZH2IOJfzvRqfdyGc+aKGagULjR07gerxN8l8CI83katLVTPS4IEeq+zgTvcgPS5WGqh6lAbTx0Ot7DAwu48YghTkb3DeRU5bdQBJ2SepnqriCK4QkwHsfXlkykgAAY0g/d2HMMG4Y/Hmkp4EN2ujObVkeveF1g2lf6/clWaNM26pviatK5xnoWY5VVfx959N/n7CMzI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(8936002)(44832011)(9786002)(336012)(9576002)(966005)(26005)(316002)(6916009)(4326008)(36860700001)(54906003)(2906002)(8676002)(186003)(356005)(5660300002)(1076003)(47076005)(70586007)(426003)(9686003)(508600001)(33716001)(83380400001)(7636003)(70206006)(82310400004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:03:39.9023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e052702-40fc-44a3-f370-08d9bef16294
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7935
Received-SPF: pass client-ip=40.107.244.71; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 04:02:22PM +0000, Peter Maydell wrote:
> On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
> <francisco.iglesias@xilinx.com> wrote:
> >
> > Add a model of Xilinx Versal's OSPI flash memory controller.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> 
> 
> 
> > +#define SZ_512MBIT (512 * 1024 * 1024)
> > +#define SZ_1GBIT   (1024 * 1024 * 1024)
> > +#define SZ_2GBIT   (2ULL * SZ_1GBIT)
> > +#define SZ_4GBIT   (4ULL * SZ_1GBIT)
> > +
> > +#define IS_IND_DMA_START(op) (op->done_bytes == 0)
> > +/*
> > + * Bit field size of R_INDIRECT_WRITE_XFER_CTRL_REG_NUM_IND_OPS_DONE_FLD
> > + * is 2 bits, which can record max of 3 indac operations.
> > + */
> > +#define IND_OPS_DONE_MAX 3
> > +
> > +typedef enum {
> > +    WREN = 0x6,
> > +} FlashCMD;
> > +
> > +/* Type to avoid cpu endian byte swaps */
> > +typedef union {
> > +    uint64_t u64;
> > +    uint8_t u8[8];
> > +} OSPIRdData;
> 
> Don't hand-roll this kind of thing, please. (I'll suggest
> code below in the places where you use this union.)
> 
> > +static unsigned int single_cs(XlnxVersalOspi *s)
> > +{
> > +    unsigned int field = ARRAY_FIELD_EX32(s->regs,
> > +                                          CONFIG_REG, PERIPH_CS_LINES_FLD);
> > +    int i;
> > +
> > +    /*
> > +     * 4'bXXX0 -> 4'b1110
> > +     * 4'bXX0X -> 4'b1101
> > +     * 4'bX0XX -> 4'b1011
> 
> This chart is ambiguous, because 0b1100 matches both the
> first two lines, for instance. The code implements
>     0bXXX0 -> 0b1110
>     0bXX01 -> 0b1101
>     0bX011 -> 0b1011
> etc
> 
> > +     * 4'b0XXX -> 4'b0111
> > +     * 4'b1111 -> 4'b1111
> > +     */
> > +    for (i = 0; i < 4; i++) {
> > +        if ((field & (1 << i)) == 0) {
> > +            return (~(1 << i)) & 0xF;
> > +        }
> > +    }
> > +    return 0;
> 
> The comment says that if the input is 0b1111 then the
> output is also 0b1111, but unless I'm misreading the code we
> will return 0 in that case. Which is correct ?
> 
> Assuming you want 0b1111 input to give 0b1111 output,
> you can do this without the loop, like this:
> 
>      return (field | ~(field + 1)) & 0xf;
> 
> (which uses a variant on the "isolate the rightmost 0-bit"
> trick from here:
> https://emre.me/computer-science/bit-manipulation-tricks/ )
> 
> If you do it that way do add a comment, because it's a bit
> obscure :-)

Hi again,

...and here you fixed my bug with a oneliner almost closer to art than c
code...awesome! Thank you! :)

BR,
F

> 
> 
> 
> 
> > +static void ospi_rx_fifo_pop_stig_rd_data(XlnxVersalOspi *s)
> > +{
> > +    int size = ospi_stig_rd_data_len(s);
> > +    OSPIRdData res = {};
> > +    int i;
> > +
> > +    size = MIN(fifo8_num_used(&s->rx_fifo), size);
> 
> I think I would assert(size <= 8) here; given the size of
> the data field that ospi_stig_rd_data_len() reads from it
> must be true, but it's not immediately obvious that this
> function won't overrun the array so the assert() helps readers.
> 
> > +    for (i = 0; i < size; i++) {
> > +        res.u8[i] = fifo8_pop(&s->rx_fifo);
> > +    }
> > +
> > +    s->regs[R_FLASH_RD_DATA_LOWER_REG] = res.u64 & 0xFFFFFFFF;
> > +    s->regs[R_FLASH_RD_DATA_UPPER_REG] = (res.u64 >> 32) & 0xFFFFFFFF;
> 
> This will give different values for these registers depending
> on whether the host is big-endian or little-endian, because if
> the bytes come out of the FIFO in the order 00 11 22 33 44 55 66 77
> then on a BE host res.u64 is 0x0011223344556677 and so
> LOWER_REG is 0x44556677, whereas on a LE host res.u64 is
> 0x7766554433221100 and LOWER_REG is 0x33221100.
> 
> Instead of the union:
> 
>   uint8_t bytes[8] = {};
>   // pop into the bytes array
>   s->regs[LOWER_REG] = ldl_le_p(bytes);
>   s->regs[UPPER_REG] = ldl_le_p(bytes + 4);
> 
> I assume here that the desired behaviour is that if the
> bytes come out of the FIFO in the order 00 11 22 33 44 55 66 77 then
> LOWER_REG reads 0x33221100 and UPPER_REG 0x77665544.
> 
> 
> 
> > +    /* Write out tx_fifo in maximum page sz chunks */
> > +    while (!ospi_ind_op_completed(op) && fifo8_num_used(&s->tx_sram) > 0) {
> > +        next_b = ind_op_next_byte(op);
> > +        end_b = next_b +  MIN(fifo8_num_used(&s->tx_sram), pagesz);
> > +
> > +        /* Dont cross page boundery */
> 
> "boundary"
> 
> 
> 
> > +static void ospi_stig_fill_membank(XlnxVersalOspi *s)
> > +{
> > +    int num_rd_bytes = ospi_stig_membank_rd_bytes(s);
> > +    int idx = num_rd_bytes - 8; /* first of last 8 */
> > +    uint32_t lower = 0;
> > +    uint32_t upper = 0;
> > +    int i;
> > +
> > +    for (i = 0; i < num_rd_bytes; i++) {
> > +        s->stig_membank[i] = fifo8_pop(&s->rx_fifo);
> > +    }
> > +
> > +    /* Fill in lower upper regs */
> > +    for (i = 0; i < 4; i++) {
> > +        lower |= ((uint32_t)s->stig_membank[idx++]) << 8 * i;
> > +    }
> > +
> > +    for (i = 0; i < 4; i++) {
> > +        upper |= ((uint32_t)s->stig_membank[idx++]) << 8 * i;
> > +    }
> 
> You can replace these loops with
>      lower = ldl_le_p(s->stig_membank[idx]);
>      upper = ldl_le_p(s->stig_membank[idx + 4]);
>      idx += 8;
> 
> > +    s->regs[R_FLASH_RD_DATA_LOWER_REG] = lower;
> > +    s->regs[R_FLASH_RD_DATA_UPPER_REG] = upper;
> > +}
> > +
> 
> 
> 
> > +static uint64_t ospi_rx_sram_read(XlnxVersalOspi *s, unsigned int size)
> > +{
> > +    OSPIRdData ret = {};
> > +    int i;
> > +
> > +    if (size < 4 && fifo8_num_used(&s->rx_sram) >= 4) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "OSPI only last read of internal "
> > +                      "sram is allowed to be < 32 bits\n");
> > +    }
> > +
> > +    size = MIN(fifo8_num_used(&s->rx_sram), size);
> > +    for (i = 0; i < size; i++) {
> > +        ret.u8[i] = fifo8_pop(&s->rx_sram);
> > +    }
> > +    return ret.u64;
> 
> Similarly to ospi_rx_fifo_pop_stig_rd_data(), you want to read
> into a local uint8_t bytes[8] (and assert about size), but
> here because we want a uint64_t rather than two uint32_t we can
>    return ldq_le_p(bytes);
> 
> > +}
> > +
> > +static void ospi_tx_sram_write(XlnxVersalOspi *s, uint64_t value,
> > +                               unsigned int size)
> > +{
> > +    int i;
> > +    for (i = 0; i < size; i++) {
> > +        fifo8_push(&s->tx_sram, value >> 8 * i);
> > +    }
> > +}
> > +
> > +static uint64_t ospi_do_dac_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    XlnxVersalOspi *s = XILINX_VERSAL_OSPI(opaque);
> > +    OSPIRdData ret = {};
> > +    int i;
> > +
> > +    /* Create first section of read cmd */
> > +    ospi_tx_fifo_push_rd_op_addr(s, (uint32_t) addr);
> > +
> > +    /* Enable cs and transmit first part */
> > +    ospi_dac_cs(s, addr);
> > +    ospi_flush_txfifo(s);
> > +
> > +    fifo8_reset(&s->rx_fifo);
> > +
> > +    /* transmit second part (data) */
> > +    for (i = 0; i < size; ++i) {
> > +        fifo8_push(&s->tx_fifo, 0);
> > +    }
> > +    ospi_flush_txfifo(s);
> > +
> > +    /* fill in result */
> > +    size = MIN(fifo8_num_used(&s->rx_fifo), size);
> > +
> > +    for (i = 0; i < size; i++) {
> > +        ret.u8[i] = fifo8_pop(&s->rx_fifo);
> > +    }
> > +
> > +    /* done */
> > +    ospi_disable_cs(s);
> > +
> > +    return ret.u64;
> 
> Same as ospi_rx_sram_read().
> 
> > +}
> 
> > +/* Return dev-obj from reg-region created by register_init_block32 */
> > +static XlnxVersalOspi *xilinx_ospi_of_mr(void *mr_accessor)
> > +{
> > +    RegisterInfoArray *reg_array = mr_accessor;
> > +    Object *dev;
> > +
> > +    assert(reg_array != NULL);
> 
> You don't really need to assert() this kind of thing -- if it is
> NULL then the code is going to crash immediately on the following
> line anyway. assert()s are most useful for turning "weird misbehaviour"
> and "something goes wrong a long way away from the point where we
> could have detected it" bugs into "crash where it's clear what
> the problem is" bugs.
> 
> > +
> > +    dev = reg_array->mem.owner;
> > +    assert(dev);
> > +
> > +    return XILINX_VERSAL_OSPI(dev);
> > +}
> 
> 
> This is another device that would benefit from a "QEMU interface"
> comment describing the properties/gpios/etc.
> 
> > +#ifndef XILINX_VERSAL_OSPI_H
> > +#define XILINX_VERSAL_OSPI_H
> > +
> > +#include "hw/register.h"
> > +#include "hw/ssi/ssi.h"
> > +#include "qemu/fifo32.h"
> > +#include "hw/dma/dma-ctrl-if.h"
> > +
> > +#define TYPE_XILINX_VERSAL_OSPI "xlnx.versal-ospi"
> > +
> > +#define XILINX_VERSAL_OSPI(obj) \
> > +     OBJECT_CHECK(XlnxVersalOspi, (obj), TYPE_XILINX_VERSAL_OSPI)
> 
> Same comment about macros as the other device.
> 
> > +
> > +#define XILINX_VERSAL_OSPI_R_MAX (0xfc / 4 + 1)
> 
> thanks
> -- PMM

