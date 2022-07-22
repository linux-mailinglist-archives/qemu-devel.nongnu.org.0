Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CE957DEE5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 12:06:23 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEpY5-0000Yc-GD
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 06:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oEpU2-0006VS-9I; Fri, 22 Jul 2022 06:02:10 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oEpTz-000072-HL; Fri, 22 Jul 2022 06:02:08 -0400
Received: by mail-lj1-x231.google.com with SMTP id m9so4834047ljp.9;
 Fri, 22 Jul 2022 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=a6GWcq6uoIDiNjpxorFOKeOFb5T26zP05NyaD1MqXbw=;
 b=Q9Va03I3D5wWoLTw5yNi7Kaa6Bc/HQEH+QsPq/aOXJkjPlsKrpa/vF45whQDcY7B13
 o0j0czESqZV1uBV+B2vo3GXfqq3m7uLZx4l+TvysBFpUe/Mpo3xLKytiLjzo1YtW5s7T
 tZeGQC4TwBZfEba42XMmB08VS0Jqb9G8uf5PEHl6gFxNQ/gToPCLyqmsb9QHXPU6hK1o
 YGV8JVF1LqdRLz0TrJF/PeDcdoiYWr0k+5jqlrEVublE3G8rjZhktwPaYYGMZTifbs7d
 khrIQ5IP05psdW66vOfBqjDX9RU4rXH4bEnkGmz4ifmPukCOVN7XDLl7C9PJ43m18Obr
 bykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=a6GWcq6uoIDiNjpxorFOKeOFb5T26zP05NyaD1MqXbw=;
 b=f8ceFhkic/LtEGzLdIZWoPzZoL3ow6V7AY/v4z1uY4Cq8mfhXRJssFKMhM7a3qeyr7
 6PIE8xIVoxsqsL3Ohdta52BM9XVpaXhvpWpo2DpzcEf95Liu4RdtG3m9G4mjtl3fnOCD
 Qkkg/k/9IBX6SpliqB95de3f5vnJ3RdG5EqA4a+cMpN5KTpUFW/sky7y7+yC8+Hi2NNX
 +uj16mqrXMZaru3VX3l1RpTFA6GOnclNxSoAA1YBeuzXVLcfVL85GuPkFjY4VwHesuai
 yQuxywL7mvI7gpz4J5Mwc6aWd7tC8P8sK+NiQ7lNqAwXPWRpYHjL6hld7lJSZVPpsHxQ
 xkTA==
X-Gm-Message-State: AJIora/AbyfsC1fEzXWf64mnQeZZ6UNZhOG8fQ3HOMMUSeHfBgR5by+8
 CHvoJimMG1tOHjT9Mv4wFdM=
X-Google-Smtp-Source: AGRyM1tC1k7LWc5pW+dXqVKONkB8BpqW0GC8X6oajP/5qLRQrk0E03X4yyqkqL3/G4kUjIwmEzViWA==
X-Received: by 2002:a2e:98cd:0:b0:25d:dad6:3a19 with SMTP id
 s13-20020a2e98cd000000b0025ddad63a19mr920052ljj.337.1658484124475; 
 Fri, 22 Jul 2022 03:02:04 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0047f943112e3sm960877lfm.285.2022.07.22.03.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:02:03 -0700 (PDT)
Date: Fri, 22 Jul 2022 12:02:02 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 1/8] m25p80: Add basic support for the SFDP command
Message-ID: <20220722100158.GA2574@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-2-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Jul 22] Fri 08:35:55, Cédric Le Goater wrote:
> JEDEC STANDARD JESD216 for Serial Flash Discovery Parameters (SFDP)
> provides a mean to describe the features of a serial flash device
> using a set of internal parameter tables.
> 
> This is the initial framework for the RDSFDP command giving access to
> a private SFDP area under the flash. This area now needs to be
> populated with the flash device characteristics, using a new
> 'sfdp_read' handler under FlashPartInfo.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/block/m25p80_sfdp.h | 18 ++++++++++++++++++
>  hw/block/m25p80.c      | 27 +++++++++++++++++++++++++++
>  MAINTAINERS            |  2 +-
>  hw/block/trace-events  |  1 +
>  4 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 hw/block/m25p80_sfdp.h
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> new file mode 100644
> index 000000000000..230b07ef3308
> --- /dev/null
> +++ b/hw/block/m25p80_sfdp.h
> @@ -0,0 +1,18 @@
> +/*
> + * M25P80 SFDP
> + *
> + * Copyright (c) 2020, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_M25P80_SFDP_H
> +#define HW_M25P80_SFDP_H
> +
> +/*
> + * SFDP area has a 3 bytes address space.
> + */
> +#define M25P80_SFDP_MAX_SIZE  (1 << 24)
> +
> +#endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a8d2519141f7..abdc4c0b0da7 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -35,6 +35,7 @@
>  #include "qapi/error.h"
>  #include "trace.h"
>  #include "qom/object.h"
> +#include "m25p80_sfdp.h"
>  
>  /* 16 MiB max in 3 byte address mode */
>  #define MAX_3BYTES_SIZE 0x1000000
> @@ -72,6 +73,7 @@ typedef struct FlashPartInfo {
>       * This field inform how many die is in the chip.
>       */
>      uint8_t die_cnt;
> +    uint8_t (*sfdp_read)(uint32_t sfdp_addr);
>  } FlashPartInfo;
>  
>  /* adapted from linux */
> @@ -355,6 +357,7 @@ typedef enum {
>      BULK_ERASE = 0xc7,
>      READ_FSR = 0x70,
>      RDCR = 0x15,
> +    RDSFDP = 0x5a,
>  
>      READ = 0x03,
>      READ4 = 0x13,
> @@ -421,6 +424,7 @@ typedef enum {
>      STATE_COLLECTING_DATA,
>      STATE_COLLECTING_VAR_LEN_DATA,
>      STATE_READING_DATA,
> +    STATE_READING_SFDP,
>  } CMDState;
>  
>  typedef enum {
> @@ -679,6 +683,8 @@ static inline int get_addr_length(Flash *s)
>      }
>  
>     switch (s->cmd_in_progress) {
> +   case RDSFDP:
> +       return 3;
>     case PP4:
>     case PP4_4:
>     case QPP_4:
> @@ -823,6 +829,11 @@ static void complete_collecting_data(Flash *s)
>                            " by device\n");
>          }
>          break;
> +
> +    case RDSFDP:
> +        s->state = STATE_READING_SFDP;
> +        break;
> +
>      default:
>          break;
>      }
> @@ -1431,6 +1442,16 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>              qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
>          }
>          break;
> +    case RDSFDP:
> +        if (s->pi->sfdp_read) {
> +            s->needed_bytes = get_addr_length(s) + 1; /* SFDP addr + dummy */
> +            s->pos = 0;
> +            s->len = 0;
> +            s->state = STATE_COLLECTING_DATA;
> +            break;
> +        }
> +        /* Fallthrough */
> +
>      default:
>          s->pos = 0;
>          s->len = 1;
> @@ -1538,6 +1559,12 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>              }
>          }
>          break;
> +    case STATE_READING_SFDP:
> +        assert(s->pi->sfdp_read);
> +        r = s->pi->sfdp_read(s->cur_addr);
> +        trace_m25p80_read_sfdp(s, s->cur_addr, (uint8_t)r);
> +        s->cur_addr = (s->cur_addr + 1) & (M25P80_SFDP_MAX_SIZE - 1);
> +        break;
>  
>      default:
>      case STATE_IDLE:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6af9cd985cea..92f232f01e3c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1915,7 +1915,7 @@ SSI
>  M: Alistair Francis <alistair@alistair23.me>
>  S: Maintained
>  F: hw/ssi/*
> -F: hw/block/m25p80.c
> +F: hw/block/m25p80*
>  F: include/hw/ssi/ssi.h
>  X: hw/ssi/xilinx_*
>  F: tests/qtest/m25p80-test.c
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index d86b53520cc5..2c45a62bd59c 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -80,5 +80,6 @@ m25p80_page_program(void *s, uint32_t addr, uint8_t tx) "[%p] page program cur_a
>  m25p80_transfer(void *s, uint8_t state, uint32_t len, uint8_t needed, uint32_t pos, uint32_t cur_addr, uint8_t t) "[%p] Transfer state 0x%"PRIx8" len 0x%"PRIx32" needed 0x%"PRIx8" pos 0x%"PRIx32" addr 0x%"PRIx32" tx 0x%"PRIx8
>  m25p80_read_byte(void *s, uint32_t addr, uint8_t v) "[%p] Read byte 0x%"PRIx32"=0x%"PRIx8
>  m25p80_read_data(void *s, uint32_t pos, uint8_t v) "[%p] Read data 0x%"PRIx32"=0x%"PRIx8
> +m25p80_read_sfdp(void *s, uint32_t addr, uint8_t v) "[%p] Read SFDP 0x%"PRIx32"=0x%"PRIx8
>  m25p80_binding(void *s) "[%p] Binding to IF_MTD drive"
>  m25p80_binding_no_bdrv(void *s) "[%p] No BDRV - binding to RAM"
> -- 
> 2.35.3
> 

