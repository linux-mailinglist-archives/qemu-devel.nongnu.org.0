Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA833FD5CD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:42:47 +0200 (CEST)
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLpW-0001KI-TY
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mLLg5-0003Be-3s; Wed, 01 Sep 2021 04:33:01 -0400
Received: from mail-bn8nam08on2058.outbound.protection.outlook.com
 ([40.107.100.58]:25761 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar@xilinx.com>)
 id 1mLLg1-0000Pj-Ra; Wed, 01 Sep 2021 04:33:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKzpTqSI5pJT5bsbYoiDKuo3stnE7UZusuf1/DV1I4kwVUchmqbwGcpfsIVQwNLAC02ozk3zdlG5MOvwAVzXMGhL91y0FnxSO9vrMrkXbUyYtRs0jSvfpzw64NsSkFRpg/QoahoC09r1lX1sDnAmGXGg0G9VUaT++iyfSqVGtWF1l58UXBtlXHQ1VkR6vvnSSQ3ccJipp4aSXJ+v51qxLaKPlzakoOjvbtH+HJlKjG68B02+EBIywZG/cb4F9x0qktnHo68mFC30SH8MKQaYreTYr5VEhy8hAki+YF4rQSHmBQn2HSrsj1iXyjBFBfm8cIal8OPge3uWVCRxzypOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvVHDQDmjoR/bC0LWmwI+QiQ7FAoPlLuKQGjeJIap80=;
 b=ScXKTFveSYlYGDgnc3Q3owxysj4kymh2D3gXNf02NKBSiUqOX5mVXPn/Qm+zN2dDdk80RLJvm3i5if9Q8p1vPjX35OFhD4Bz57zKLoDK9brn+EeBYqb3kQe2FA37yF/cPG5PEBB7IfXja+VicsP6f7vtD/GOlzH6zAAsjMYoxi6W/FNslQgxU4aKuKHWqu8Sm4NhAfbGtPzQZjqJqrQoDcB2Q3ElByIaqQK7qiD8I8PCn9m1/m6l5ys5UAVZdbYxmS5uJDOxN2OofZeKotbSHm3nzysmrjKXlTiEgE9skeN9GRP1ECdI2c++AR0FK4m434JuYlwrFBzErOJT0BWI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvVHDQDmjoR/bC0LWmwI+QiQ7FAoPlLuKQGjeJIap80=;
 b=e91ue0EIBIq886iiW+jJvAMyfQiF27km6xfg9pi1tk72ScTzgp7epoaYxiRb7WgxBLP1ymwgFOv2OBFVw1HDpVFeL9N40v6/J5ONlUJidp56tQqslpRW2DCtqvnt5W/4wb/A+o5k+aumBWqwBkwkb28L83ogJgl/1rUhobdSrao=
Received: from SA0PR11CA0152.namprd11.prod.outlook.com (2603:10b6:806:1bb::7)
 by BL0PR02MB4337.namprd02.prod.outlook.com (2603:10b6:208:27::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 08:32:54 +0000
Received: from SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::c2) by SA0PR11CA0152.outlook.office365.com
 (2603:10b6:806:1bb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Wed, 1 Sep 2021 08:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0032.mail.protection.outlook.com (10.97.5.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Wed, 1 Sep 2021 08:32:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 01:32:52 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 01:32:52 -0700
Received: from [10.71.116.242] (port=52297 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1mLLfv-0008lS-Va; Wed, 01 Sep 2021 01:32:52 -0700
Date: Wed, 1 Sep 2021 10:32:51 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read,write}()
Message-ID: <20210901083251.GG6340@toto>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210901032724.23256-6-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33620c97-1362-4b71-6a58-08d96d2317ab
X-MS-TrafficTypeDiagnostic: BL0PR02MB4337:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4337DAB7E488FCE206096CA1C2CD9@BL0PR02MB4337.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0MXdR7JOMY7YhiJ97vAOli22eAMFOViVbvnE/YC7nUFa9etyPMDPse+TdftMDBNcVU81kdGmksdvgkScmUeYM3p119bnPJ3GC1+9EDSq284fCD4Ok8nFLZUEjnUAnnBEwHbPk5c4YDaFXirLOZ5AZJwDPrnEdhjpdDPpZpjppsnR7lKbDFSQsTOYBNxnYjjD4kbFLACBuTh9HpmZocdKgQqi/lw3IWUfJJ/jVFPKbq8rNC9eNE9or8su5CoL8Jwn8FeAgCgoOaS+ULM5Ct/0fKbB/gbuy7jn4djVMk2OqN7LLrsUMheB91P0ZfGf1SI6uEzQCz1Ee8H2RT2AIgxgy/AuNLSdIYfsdYKPX5mh2jMoas6N8253gaAof7Qkrxw3NWJwNu6SY/w7mLR5f5WXmsq6Av0oFGsTG6/rJbnoXYJFcwRLGeeQU68EwW9R0/BJmMPD8ncH5RJ3E6Rw+hNCb4ENwcazEbCyve4EZnMD/C2DHT41L6tzMHoL06Y9nK2CoOtIoWt1U27IfTxQAxXPtl4UUd9EWcqQkIfiTNENj2o5gX0ySvy+8IDd6fWvkulIUZWTCQis9MK8MldR+EVGFKgky12096Xo3lI6DQp/+2rO5jHtsnsbLklfQ6mhU6ipXonWGM9HZ8Anc3beOcv9+R3XZk4/hxuvgi3pwHaFJG5d8jWVmIp1dhCBO3PAi0d9neYjZ89OB9nRdgtUM6QQQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(478600001)(70586007)(82310400003)(33656002)(36860700001)(6916009)(9686003)(36906005)(316002)(5660300002)(356005)(9786002)(26005)(82740400003)(70206006)(54906003)(4326008)(47076005)(1076003)(336012)(426003)(33716001)(186003)(2906002)(8936002)(8676002)(7636003)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 08:32:53.7228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33620c97-1362-4b71-6a58-08d96d2317ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4337
Received-SPF: pass client-ip=40.107.100.58; envelope-from=edgar@xilinx.com;
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 11:27:24AM +0800, Bin Meng wrote:
> Read or write to uart registers when unclocked or in reset should be
> ignored. Add the check there, and as a result of this, the check in
> uart_write_tx_fifo() is now unnecessary.

Hi Bin,

I thought I had replied to this but it must have gotten lost somewhere.

We've got SW that expects FSBL (Bootlooader) to setup clocks and resets.
It's quite common that users run that SW on QEMU without FSBL (FSBL typically
requires the Xilinx tools installed). That's fine, since users can stil use
-device loader to enable clocks etc.

To help folks understand what's going, a log (guest-error) message would
be helpful here. In particular with the serial port since things will go
very quiet if they get things wrong.

Otherwise, this patch is fine with me.

Thanks,
Edgar


> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()
> 
>  hw/char/cadence_uart.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 8bcf2b718a..5f5a4645ac 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -335,11 +335,6 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>                                 int size)
>  {
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
>          return;
>      }
> @@ -416,6 +411,11 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>  {
>      CadenceUARTState *s = opaque;
>  
> +    /* ignore access when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_ERROR;
> +    }
> +
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> @@ -476,6 +476,11 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>  
> +    /* ignore access when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_ERROR;
> +    }
> +
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
>          return MEMTX_DECODE_ERROR;
> -- 
> 2.25.1
> 

