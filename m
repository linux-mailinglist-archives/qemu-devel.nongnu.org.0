Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95752B4A27
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:59:54 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegv3-0002O1-Qr
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegu3-0001qr-KB; Mon, 16 Nov 2020 10:58:51 -0500
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com
 ([40.107.243.82]:8030 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kegtw-0004Rr-Tg; Mon, 16 Nov 2020 10:58:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0nS277uhxHLZEn2DxJ3W+xVeVJZJSJcfd3sYw+B0Qu153BUyJHniv6tFyBwnJPullonUsxHLmCHsf5R+c4vwuFZ9rdm9Fss2gg+Zwe3ZvIPA1O8IQddjbNWEpm4PQ2BGG6lLLvQUv5MFsQUWRrM49iFQwYwaqdLwj2KQH8ELXd0uLJUwRVmvJPrjbkpr0vbZEpnMIvZqdAEWlj8pMv/9FyCeH/ZJdd7MgH7h33gokAA+qe6XoKFjXqIku3qgD+M9tyAzdIAJPIYiFfbOxF56zTsyp+1z9Yvx/tKRsRdhtJ3clvc1eMw2qOEY5GgEhoICJwXq8kPMGNpE228Y/ojZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waeebzD014wkySlF66mOBBtU7GcNNw9aIrNF8jrOrhk=;
 b=NDEcidybUmk3wnG0mV4Mk0AY9tTCm1XI9xgJ6q8ttIfjp8CS1M5rrKci/0Ooixbyp/EiWVYC2YsLo/9zjNb3jjySeCi5ZNJMX4d2KoKH/GSnpHrl+BA9UFqdoYWo9bAwnOHBpve/kh0qhlSht+LVuYuYX7XyZ/PGWa3DjOvMb6+8T4g5cvEXcJhJjArMsUwtEh+OreFhyJU4jCfxYpxc7ei9+efk6oE+fzmC0EEZT9JroOOmHKvRV72ip9wmZ0wpQ26VD1o0qLeCkxnixpF4R94atXAv7KOvHbwUkusfkIBNdcu/I2ImV9YOpYoK+DR0sqDhaQGQ4XvJeAHMAi/1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waeebzD014wkySlF66mOBBtU7GcNNw9aIrNF8jrOrhk=;
 b=YIKjpM7ypnsmfn8OWMb4rWrFr6LST2XOT520HGxgwKyDFExMy9pagjOseITP85UGfz/vsvsUm6t0z7beckzXXjQPJnTW7Zdj6uSZS7ImORlGJ8eG6WTGrouRWZwrRnH+OfUurLdsAYCYth+k1zjrb1+QUdlAvduORgKSUs7WEa8=
Received: from MN2PR20CA0021.namprd20.prod.outlook.com (2603:10b6:208:e8::34)
 by SN4PR0201MB3501.namprd02.prod.outlook.com (2603:10b6:803:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 15:58:40 +0000
Received: from BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:e8:cafe::d1) by MN2PR20CA0021.outlook.office365.com
 (2603:10b6:208:e8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 15:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT060.mail.protection.outlook.com (10.152.76.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 15:58:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 07:58:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 07:58:39 -0800
Received: from [10.23.120.221] (port=52932 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kegtr-0000Rn-Cu; Mon, 16 Nov 2020 07:58:39 -0800
Date: Mon, 16 Nov 2020 15:58:37 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v4 3/4] hw/block/m25p80: Check SPI mode before running
 some Numonyx commands
Message-ID: <20201116155836.th2cvcawoo3pkvit@debian>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
 <1605237055-393580-4-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1605237055-393580-4-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccffdab1-b2ec-498a-c335-08d88a487cb0
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3501:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3501EFF284DD0A82AC9EB7E8ADE30@SN4PR0201MB3501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXPk2+6z/av8kh1Ol6CEFINXUH6/m4NgrqgopFfO9Iic7////3aUHqo9tls1JcsOX46/QIUBM4pImUpv56Lm9tmzMocAP6iZcCpz+swU3qQQUdU6JvYA6WjfVRJyKYPRiO/THa2WKmxj8peuC5m191hgtjA5F7CVXWow6SqtD6Q/h8iPPnQ4By1M7OxPW32xyVVuiGVZ+aoKssIMSZiDVQqA5JzE6gy/KblcR2MSl+6HZTagwI/ACTvSQMU3Nq2G+cpi2hFSaIDruOdmbuMpZ2nkxbiF8RHmBh6ChQQXJWetQuUAvn5D8CLMoB1k9X/N0NatLYonsaxX7mTTjjb6pxbpyxr/++sBdUDEQelnzKHTdQpsTx4u3E2JfBBCAyMgMXDHaQjTPMSoNPm+Udz1hg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(9686003)(316002)(44832011)(478600001)(54906003)(9786002)(6862004)(26005)(9576002)(2906002)(186003)(4326008)(8676002)(8936002)(6636002)(426003)(36906005)(83380400001)(336012)(70206006)(82740400003)(70586007)(1076003)(47076004)(7636003)(5660300002)(356005)(33716001)(82310400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 15:58:40.5743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccffdab1-b2ec-498a-c335-08d88a487cb0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3501
Received-SPF: pass client-ip=40.107.243.82; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 10:58:42
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: figlesia@xilinx.com, qemu-block@nongnu.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, mreitz@redhat.com, philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joe,

On Thu, Nov 12, 2020 at 07:10:54PM -0800, Joe Komlodi wrote:
> Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
> trying to do DPP or DOR when in QIO mode.
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  hw/block/m25p80.c | 134 +++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 112 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index eb6539f..2552f2c 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -413,6 +413,12 @@ typedef enum {
>      MAN_GENERIC,
>  } Manufacturer;
>  
> +typedef enum {
> +    MODE_STD = 0,
> +    MODE_DIO = 1,
> +    MODE_QIO = 2
> +} SPIMode;
> +
>  #define M25P80_INTERNAL_DATA_BUFFER_SZ 16
>  
>  struct Flash {
> @@ -820,6 +826,17 @@ static void reset_memory(Flash *s)
>      trace_m25p80_reset_done(s);
>  }
>  
> +static uint8_t numonyx_get_mode(Flash *s)
> +{
> +    if (!(s->enh_volatile_cfg & EVCFG_QUAD_IO_DISABLED)) {
> +        return MODE_QIO;
> +    } else if (!(s->enh_volatile_cfg & EVCFG_DUAL_IO_DISABLED)) {
> +        return MODE_DIO;
> +    } else {
> +        return MODE_STD;
> +    }
> +}
> +
>  static void decode_fast_read_cmd(Flash *s)
>  {
>      s->needed_bytes = get_addr_length(s);
> @@ -827,9 +844,11 @@ static void decode_fast_read_cmd(Flash *s)
>      /* Dummy cycles - modeled with bytes writes instead of bits */
>      case MAN_WINBOND:
>          s->needed_bytes += 8;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
>          s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
>          if (extract32(s->volatile_cfg, 6, 2) == 1) {
> @@ -837,19 +856,21 @@ static void decode_fast_read_cmd(Flash *s)
>          } else {
>              s->needed_bytes += 8;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += extract32(s->spansion_cr2v,
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;

Above change in this function and the similar ones in below two functions
don't seem to be needed anymore (s->state = STATE_COLLECTING_DATA is being done
in all cases).

>  }
>  
>  static void decode_dio_read_cmd(Flash *s)
> @@ -859,6 +880,7 @@ static void decode_dio_read_cmd(Flash *s)
>      switch (get_man(s)) {
>      case MAN_WINBOND:
>          s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
> @@ -866,9 +888,11 @@ static void decode_dio_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
>          s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
>          switch (extract32(s->volatile_cfg, 6, 2)) {
> @@ -882,13 +906,14 @@ static void decode_dio_read_cmd(Flash *s)
>              s->needed_bytes += 4;
>              break;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;
>  }
>  
>  static void decode_qio_read_cmd(Flash *s)
> @@ -899,6 +924,7 @@ static void decode_qio_read_cmd(Flash *s)
>      case MAN_WINBOND:
>          s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
>          s->needed_bytes += 4;
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_SPANSION:
>          s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
> @@ -906,9 +932,11 @@ static void decode_qio_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_POS,
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_NUMONYX:
>          s->needed_bytes += extract32(s->volatile_cfg, 4, 4);
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      case MAN_MACRONIX:
>          switch (extract32(s->volatile_cfg, 6, 2)) {
> @@ -922,13 +950,14 @@ static void decode_qio_read_cmd(Flash *s)
>              s->needed_bytes += 6;
>              break;
>          }
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      default:
> +        s->state = STATE_COLLECTING_DATA;
>          break;
>      }
>      s->pos = 0;
>      s->len = 0;
> -    s->state = STATE_COLLECTING_DATA;
>  }
>  
>  static void decode_new_cmd(Flash *s, uint32_t value)
> @@ -950,14 +979,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>      case ERASE4_32K:
>      case ERASE_SECTOR:
>      case ERASE4_SECTOR:
> -    case READ:
> -    case READ4:
> -    case DPP:
> -    case QPP:
> -    case QPP_4:
>      case PP:
>      case PP4:
> -    case PP4_4:
>      case DIE_ERASE:
>      case RDID_90:
>      case RDID_AB:
> @@ -966,24 +989,85 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          s->len = 0;
>          s->state = STATE_COLLECTING_DATA;
>          break;
> +    case READ:
> +    case READ4:
> +        if (!(get_man(s) == MAN_NUMONYX) || (numonyx_get_mode(s) != MODE_DIO &&
> +            numonyx_get_mode(s) != MODE_QIO)) {

Above seems easier to check if we are in the correct mode here instead:

if (get_man(s) != MAN_NUMONYX || numonyx_get_mode(s) == MODE_STD) {

> +            s->needed_bytes = get_addr_length(s);
> +            s->pos = 0;
> +            s->len = 0;
> +            s->state = STATE_COLLECTING_DATA;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO or QIO mode\n", s->cmd_in_progress);
> +        }
> +        break;
> +    case DPP:
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
> +            s->needed_bytes = get_addr_length(s);
> +            s->pos = 0;
> +            s->len = 0;
> +            s->state = STATE_COLLECTING_DATA;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "QIO mode\n", s->cmd_in_progress);
> +        }
> +        break;
> +    case QPP:
> +    case QPP_4:
> +    case PP4_4:
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
> +            s->needed_bytes = get_addr_length(s);
> +            s->pos = 0;
> +            s->len = 0;
> +            s->state = STATE_COLLECTING_DATA;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO mode\n", s->cmd_in_progress);
> +        }
> +        break;
>  
>      case FAST_READ:
>      case FAST_READ4:
> +        decode_fast_read_cmd(s);
> +        break;
>      case DOR:
>      case DOR4:
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
> +            decode_fast_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "QIO mode\n", s->cmd_in_progress);
> +        }
> +        break;
>      case QOR:
>      case QOR4:
> -        decode_fast_read_cmd(s);
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
> +            decode_fast_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO mode\n", s->cmd_in_progress);
> +        }
>          break;
>  
>      case DIOR:
>      case DIOR4:
> -        decode_dio_read_cmd(s);
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_QIO) {
> +            decode_dio_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "QIO mode\n", s->cmd_in_progress);
> +        }
>          break;
>  
>      case QIOR:
>      case QIOR4:
> -        decode_qio_read_cmd(s);
> +        if (!(get_man(s) == MAN_NUMONYX) || numonyx_get_mode(s) != MODE_DIO) {
> +            decode_qio_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO mode\n", s->cmd_in_progress);
> +        }
>          break;
>  
>      case WRSR:
> @@ -1035,17 +1119,23 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          break;
>  
>      case JEDEC_READ:
> -        trace_m25p80_populated_jedec(s);
> -        for (i = 0; i < s->pi->id_len; i++) {
> -            s->data[i] = s->pi->id[i];
> -        }
> -        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> -            s->data[i] = 0;
> -        }
> +        if (!(get_man(s) == MAN_NUMONYX) || (numonyx_get_mode(s) != MODE_DIO &&
> +            numonyx_get_mode(s) != MODE_QIO)) {

The same here as above:
if (get_man(s) != MAN_NUMONYX || numonyx_get_mode(s) == MODE_STD) {

Best regards,
Francisco Iglesias


> +            trace_m25p80_populated_jedec(s);
> +            for (i = 0; i < s->pi->id_len; i++) {
> +                s->data[i] = s->pi->id[i];
> +            }
> +            for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +                s->data[i] = 0;
> +            }
>  
> -        s->len = SPI_NOR_MAX_ID_LEN;
> -        s->pos = 0;
> -        s->state = STATE_READING_DATA;
> +            s->len = SPI_NOR_MAX_ID_LEN;
> +            s->pos = 0;
> +            s->state = STATE_READING_DATA;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute JEDEC read "
> +                          "in DIO or QIO mode\n");
> +        }
>          break;
>  
>      case RDCR:
> -- 
> 2.7.4
> 

