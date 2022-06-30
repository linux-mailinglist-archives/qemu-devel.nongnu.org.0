Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EAC562301
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:21:54 +0200 (CEST)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6zjd-0005Zd-PM
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zgu-0003OR-N8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:19:07 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zgs-0000By-U8
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 15:19:04 -0400
Received: by mail-ej1-x629.google.com with SMTP id d2so29128934ejy.1
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fA23ErRTzLQJPvGEr2VDI4wbxiKnUq0Jb3AXwzPvH1o=;
 b=eq1QTMg+jnIVRJSzrJA+G907+EFudAqESxbAbWrcTpvKO1Dl4CsjG/vFvJplvUjaIO
 eafIvAjyU9/MqY+Sw57MtHGaDwLpEqmDUKvx5A88H+uR2CJ1bom8gVr3qa0vuiJs0XRk
 NIzyQyXkQ8t7Z6zqisoKPz7W0HVdd3orTC8c8+wKb/P1festq2WP7+RFVuGVh+8T2dbd
 EOUXCTWjrz2PWQ2g2M35fbldObIIcF2HQuWUGjmdWUGuFryD/ty9OH2JAWg9E1xSuAZY
 QvMCPdJeGxuT5BhfjDgjglUcTbT8GXS0WAIxXaiI+UcLUah2O3JVV52uapfD2sAxnt8X
 Aevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fA23ErRTzLQJPvGEr2VDI4wbxiKnUq0Jb3AXwzPvH1o=;
 b=ZaaytBTtGN3AlqXIv1kO7zQWUqhzf4Wxi0Ru42zo85pf+TJnyTguOEG3ekYRJJXF1t
 d2ECIGjdO/gwlIjmKEZ1YU1aow/jDfw2l+wo3ZY+2D4C7GWsr74jwzlGfDYuboz0bqjX
 3vZUe5Axa/7paq2ZiGeHUddQqqKPqxkMXfMjvT6kb7zKE6JxGvJhggsMikqXTUp+S16e
 wHA9OWMjNFOASg7y0Am2AaMZnCE9VedUsQu7mUEyZx3Xz+GIKR1R4zcrAoe9o3Wu3nsZ
 W28c6F3woStOcAFHzskt40lzRq/i5mT0B3xYYelcSkD7vaFftvt9FCdJ6jRDVOYN02yS
 4fDQ==
X-Gm-Message-State: AJIora9avhu48cAqEp5/VXUYCziWwvfbXh/YK/9WKMHcfg9NjIudVsd1
 xiaEHtaHgluj1bF9l2eO+STUMxG+Lx4iZaA26StoVg==
X-Google-Smtp-Source: AGRyM1u4Da+oFPpW2BixWGt/0Sp+9NwrEmE2La9n2tc7zC4Yf4rg+GroH4trB1kfFB4bY1NPPWxMU9QY1i3rWY6wqbs=
X-Received: by 2002:a17:907:da5:b0:726:2a4d:be69 with SMTP id
 go37-20020a1709070da500b007262a4dbe69mr10556994ejc.208.1656616739535; Thu, 30
 Jun 2022 12:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-9-me@pjd.dev>
In-Reply-To: <20220630045133.32251-9-me@pjd.dev>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:18:23 -0700
Message-ID: <CAMvPwGqd1tpkY7=atXUEx7tWwQjhDN=PAcnAirjtpYU4YRDj8A@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] hw/i2c/pmbus: Add idle state to return 0xff's
To: me@pjd.dev
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=titusr@google.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 21:52, Peter Delevoryas <me@pjd.dev> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/i2c/pmbus_device.c         | 9 +++++++++
>  include/hw/i2c/pmbus_device.h | 7 +++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a1..f89fea65f3 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -261,6 +261,11 @@ void pmbus_check_limits(PMBusDevice *pmdev)
>      }
>  }
>
> +void pmbus_idle(PMBusDevice *pmdev)
> +{
> +    pmdev->code = PMBUS_IDLE_STATE;
> +}
> +
>  /* assert the status_cml error upon receipt of malformed command */
>  static void pmbus_cml_error(PMBusDevice *pmdev)
>  {
> @@ -984,6 +989,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>
> +    case PMBUS_IDLE_STATE:
> +        pmbus_send8(pmdev, PMBUS_ERR_BYTE);
> +        break;
> +
>      case PMBUS_CLEAR_FAULTS:              /* Send Byte */
>      case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
>      case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 0f4d6b3fad..93f5d57c9d 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -155,6 +155,7 @@ enum pmbus_registers {
>      PMBUS_MFR_MAX_TEMP_1            = 0xC0, /* R/W word */
>      PMBUS_MFR_MAX_TEMP_2            = 0xC1, /* R/W word */
>      PMBUS_MFR_MAX_TEMP_3            = 0xC2, /* R/W word */
> +    PMBUS_IDLE_STATE                = 0xFF,
>  };
>
>  /* STATUS_WORD */
> @@ -527,6 +528,12 @@ int pmbus_page_config(PMBusDevice *pmdev, uint8_t page_index, uint64_t flags);
>   */
>  void pmbus_check_limits(PMBusDevice *pmdev);
>
> +/**
> + * Enter an idle state where only the PMBUS_ERR_BYTE will be returned
> + * indefinitely until a new command is issued.
> + */
> +void pmbus_idle(PMBusDevice *pmdev);
> +
>  extern const VMStateDescription vmstate_pmbus_device;
>
>  #define VMSTATE_PMBUS_DEVICE(_field, _state) {                       \
> --
> 2.37.0
>

Reviewed-by: Titus Rwantare <titusr@google.com>

