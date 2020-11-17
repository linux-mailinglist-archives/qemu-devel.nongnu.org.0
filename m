Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A92B67BE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:46:51 +0100 (CET)
Received: from localhost ([::1]:47704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Fu-0002xE-KK
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kf2E3-0002ES-BG; Tue, 17 Nov 2020 09:44:55 -0500
Received: from mail-dm6nam12on2071.outbound.protection.outlook.com
 ([40.107.243.71]:28460 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1kf2E0-0004mV-5t; Tue, 17 Nov 2020 09:44:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDVnywoVEY7WOyqg/yezpXIMsi1/XWl6rdM4YISTB+dLYrRoADyt940fF0HhxzIN+jbj5GtKvo+Gf13I5cTmXIdbrfjDWKaG6NlRvw/uF5bJHUTHQjcT+RSCguBx0Esf1LyasOw3WnQpbcz82RjfMawx3/qUDIuDJ8bAP+hjpbreaIUTmEfT96Z6IvnWsqLBsqxZdbngVOY6Hj/DAwnoAn14mRWPPnS3Hn8lbmCeo13Hi09GDmCdAEX7XqIOwebQWrd0Lq+cwUcwWy+qEnXw4T8oEnkdk09II89NrPS5/T6UiZPTk8fjk8jWxIiFrVnrDCSeAceUzWSJbd9HL07p4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uShfnTRMOSfMS9d+tsBDkfXySCRShSv+odubFu0Rcw4=;
 b=EReATknElK0p5R1FNOxa5UNeevZNCxY2ZJqai70OFzkcm6a2QOAG8LmYLdhAk5OhSc0DneA0ApFA2mM94dd5rxthEV0TncaacPnZP3LkeXqRo8jL0NSF555juqg/UHOnmn8C74bsKzTx3sWRajiZIBwA4KnQcpY9pIQQS7gBRPKLD37DvdvSLdnROnwFHAzBIzMVleRMlIsHopRen6i3kkQCjm7d/QgyOyBKAy5Q+nvs7I8C/VSPu7it2eSW8RhxL/yEMVJ3+B90XTtB/DHtdCsUSKXbu7qranF2sErEXxKgIm9//Q7CYDKfi+MRyYhEWsbINuKa3+860Qc2eCxvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uShfnTRMOSfMS9d+tsBDkfXySCRShSv+odubFu0Rcw4=;
 b=WRRlczTFKlbBqMFjXX2Mb/kjcc8YIuFYcxR+uuVQ5ap+W/3FYdgXlNax01OHcz7UYCz6aSVxHVAbCjbx/SuJ5slb40ygr+1+NQ6jIETqloOdiO+2EjMOeJi60vTXeBcaeOREYC+oK4j4KkXW8UxEz2bPDJnPEpKH03tla/0zm9k=
Received: from SN4PR0401CA0017.namprd04.prod.outlook.com
 (2603:10b6:803:21::27) by BN6PR02MB2708.namprd02.prod.outlook.com
 (2603:10b6:404:fa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 14:44:46 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::9a) by SN4PR0401CA0017.outlook.office365.com
 (2603:10b6:803:21::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 14:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 14:44:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 06:44:40 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 17 Nov 2020 06:44:40 -0800
Received: from [10.23.127.172] (port=62124 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1kf2Do-0002fI-D5; Tue, 17 Nov 2020 06:44:40 -0800
Date: Tue, 17 Nov 2020 14:44:38 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: Joe Komlodi <joe.komlodi@xilinx.com>
Subject: Re: [PATCH v5 3/4] hw/block/m25p80: Check SPI mode before running
 some Numonyx commands
Message-ID: <20201117144436.kjqzk5yzxyhdk75s@debian>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
 <1605568264-26376-4-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1605568264-26376-4-git-send-email-komlodi@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f097e345-7754-4a69-520e-08d88b0753a1
X-MS-TrafficTypeDiagnostic: BN6PR02MB2708:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2708402E99A995EAD645DC05ADE20@BN6PR02MB2708.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QG5Lti0cMNQvWxTovKycSXpEAxb++vH6Fle4WyAjbUvKM3xG4tzYZsiZ6TWrZMX8vT43N6E915pYCeg1rgD0wbpj7O5xPtNR8j3oU/eiAyeyU8NRaV4vZULQeM0Bm1+LWy1P3OjYOmTYCVlmYaX0vcbcNc371bgVA1GfKX5qWpwqifAg3bUqWk85BX80rc0pABRSP/+6YEIxZIxRgYPwIbHtyZ//sX7eKMXRSPzuEnB3te3wmAirVVVUd3PA9NBlUQtmA6fSWM2zyTjIbJZXMTxAWEIr85wRjt1uQqziay1hxmdFR5pTERoswvN4vrbdUHnbQ3uYSogrxqBtIcQXHaMh9dcznp+Htxg7itDyEqSEaKhKlmbUNZqFAFMZj6r5BRi1WD4WmVJ1ERikNiXBeA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(186003)(6862004)(26005)(478600001)(82310400003)(4326008)(36906005)(7636003)(356005)(316002)(70586007)(70206006)(33716001)(9786002)(426003)(6636002)(54906003)(9686003)(5660300002)(44832011)(336012)(9576002)(47076004)(8936002)(83380400001)(8676002)(2906002)(82740400003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 14:44:45.6218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f097e345-7754-4a69-520e-08d88b0753a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2708
Received-SPF: pass client-ip=40.107.243.71; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:44:50
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

On Mon, Nov 16, 2020 at 03:11:03PM -0800, Joe Komlodi wrote:
> Some Numonyx flash commands cannot be executed in DIO and QIO mode, such as
> trying to do DPP or DOR when in QIO mode.
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

> ---
>  hw/block/m25p80.c | 114 +++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 95 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index eb6539f..56bd5bc 100644
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
> +static uint8_t numonyx_mode(Flash *s)
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
> @@ -950,14 +967,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
> @@ -966,24 +977,84 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          s->len = 0;
>          s->state = STATE_COLLECTING_DATA;
>          break;
> +    case READ:
> +    case READ4:
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
> +            decode_fast_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "QIO mode\n", s->cmd_in_progress);
> +        }
> +        break;
>      case QOR:
>      case QOR4:
> -        decode_fast_read_cmd(s);
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
> +            decode_qio_read_cmd(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
> +                          "DIO mode\n", s->cmd_in_progress);
> +        }
>          break;
>  
>      case WRSR:
> @@ -1035,17 +1106,22 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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
> +        if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
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

