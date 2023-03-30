Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12F6D0AEF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:23:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phv3Z-0005Ec-Hg; Thu, 30 Mar 2023 12:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv3U-0005Dw-5f; Thu, 30 Mar 2023 12:23:16 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv3Q-00023O-MT; Thu, 30 Mar 2023 12:23:15 -0400
Received: by mail-qt1-x830.google.com with SMTP id cr18so15152883qtb.0;
 Thu, 30 Mar 2023 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193374; x=1682785374;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVNBiLxxysDVU/0c96gowkUbmR8ovdmPDeHHo6hYp9g=;
 b=lKrO3B0GkzFRhLdh9LaTdrlDwnlIVLuYrJiamxQU5NSC/qsu8BAc/08xO8NzAIEu+u
 T3vj/v2CGionisFLA0vRYri8XwOaHXBtlFm79AhvNRvOb4sm439ioHeBEJvWSAmVUS0u
 6i5vSurCc8H/S7H8UCLhUqDadYjF4VaXKoOxXaosHM25IrbJh811igxZJ1cxn4ssCotm
 iJvI6ySbyhU3/2UezL9HhfSJXKZdmko2QrmbRLNCZLzEwWYPm75BBzGmNWZsinU/dbhK
 Gp33iOLQMNtZMg9lt0QgEF7MPB4EGXwONLMs501yAD/562RvcmWW2rUp6wteFhA+iINU
 mcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193374; x=1682785374;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FVNBiLxxysDVU/0c96gowkUbmR8ovdmPDeHHo6hYp9g=;
 b=PIQgQvt8XtLmlIXXY2XxE66cZOPuQN/UHkfvE086QAUK/pTyJ4dUM+YuWtbReNa89F
 3ghyN8VXiasZF8G9UzzbJuOP/KNOBAUoD+0TGUnH9UpkikCni/Xbj+5rCsrKfDOaOpBn
 wX57uGHY6qX/WZbY/M5yd/N52gG7Yftt1xDHJ1Cq/2HuPApj5SuhHHFbH6CY/075LGy0
 OqL+gTYhKkO+1phYw43bj7rsYzOiQTp/4vCK5K7xtkOsi0SC7FC7iKQAKCJUJKHwR2/X
 wDgwfbzOAmxm22fHpCUagbRp4N5wEAnl5dzziXQ/ivMSLHyjRePOPlYRGLfDVZS5ZbCz
 OEKw==
X-Gm-Message-State: AO0yUKVJpRp+2AWiFnVCTWbslOTnM1Z8VYO059AWgirbT+OJ6ThWzeR0
 Gguqf2l9i5BB8r1bCo8cjFVnaYUohA==
X-Google-Smtp-Source: AK7set9JkeCXW9SBBF4llgh0ek4h0bFH8bza84dTgZ20CCtC0AllULZayROKYtVyP61N4E5Mk/FN6g==
X-Received: by 2002:a05:622a:1ba6:b0:3bf:a8cf:3096 with SMTP id
 bp38-20020a05622a1ba600b003bfa8cf3096mr39772403qtb.33.1680193373687; 
 Thu, 30 Mar 2023 09:22:53 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 jt40-20020a05622aa02800b003e4ec377dc4sm2595819qtb.49.2023.03.30.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:22:53 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id 2D50E1800BB;
 Thu, 30 Mar 2023 16:22:52 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:22:51 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Stephen Longfield <slongfield@google.com>
Subject: Re: [PATCH 3/5] hw/i2c: pmbus: add fan support
Message-ID: <ZCW3Wx2XQefX5Kvi@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-4-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322175513.1550412-4-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Empty description, but the code itself looks ok.

Acked-by: Corey Minyard <cminyard@mvista.com>

On Wed, Mar 22, 2023 at 05:55:11PM +0000, Titus Rwantare wrote:
> Reviewed-by: Stephen Longfield <slongfield@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/pmbus_device.c         | 176 ++++++++++++++++++++++++++++++++++
>  include/hw/i2c/pmbus_device.h |   1 +
>  2 files changed, 177 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 02647769cd..bb42e410b4 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -490,6 +490,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>  
> +    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].fan_config_1_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_1:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_1);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_2:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].fan_config_3_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_3:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_3);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_4:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
>          if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
>              pmbus_send16(pmdev, pmdev->pages[index].vout_ov_fault_limit);
> @@ -800,6 +848,22 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
>          break;
>  
> +    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
>          if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
>              pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
> @@ -872,6 +936,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>  
> +    case PMBUS_READ_FAN_SPEED_1:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_1);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_2:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_3:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_3);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_4:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_DUTY_CYCLE:           /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_duty_cycle);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FREQUENCY:            /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_frequency);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_READ_POUT:                 /* Read-Only word */
>          if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
>              pmbus_send16(pmdev, pmdev->pages[index].read_pout);
> @@ -1295,6 +1407,54 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>          }
>          break;
>  
> +    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_config_1_2 = pmbus_receive8(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_1:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_1 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_2:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_2 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_config_3_4 = pmbus_receive8(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_3:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_3 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_4:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_4 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
>      case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
>          if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
>              pmdev->pages[index].vout_ov_fault_limit = pmbus_receive16(pmdev);
> @@ -1600,6 +1760,22 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>          pmdev->pages[index].status_mfr_specific = pmbus_receive8(pmdev);
>          break;
>  
> +    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
>      case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
>      case PMBUS_CAPABILITY:                /* Read-Only byte */
>      case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 2e95164aa1..ad431bdc7c 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -258,6 +258,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
>  #define PB_HAS_TEMP2               BIT_ULL(41)
>  #define PB_HAS_TEMP3               BIT_ULL(42)
>  #define PB_HAS_TEMP_RATING         BIT_ULL(43)
> +#define PB_HAS_FAN                 BIT_ULL(44)
>  #define PB_HAS_MFR_INFO            BIT_ULL(50)
>  #define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
>  
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 

