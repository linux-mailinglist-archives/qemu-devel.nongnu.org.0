Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBC49E1A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:55:07 +0100 (CET)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3Mo-0004Bk-BK
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3BN-0000Lh-D5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:43:18 -0500
Received: from [2a00:1450:4864:20::436] (port=44768
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3BL-0002WS-Lg
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:43:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id k18so4187637wrg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BcH1nHPR47fHpCPeOlz4Kj9mOlG9SQD37Fo/QmEk1cU=;
 b=WAFFOxZpU5TUQTHFouOP6c8dy09XxLm0b1J6nwrivnGepLGKT1d+Fgc2U51oDgMJhY
 ZYu7Pj773SFdpDoIp5luaW9XvmYn2WUQZOs1VdZ5xv4ZAd036rXmgn5pWDBMhHAUUIvZ
 Qdj5v9y+ULW22SlXMVZwmSsuXZCbiZEh9gPMMuk08W9WBPAHwD5pCQt0N6afyOEFlEEd
 HAeeSAe63BHKefXHIRcxXXZpfw5yxsFCKKXvNTrQkB0CK7fQkK4+/7XC1Fwdka3QWS2n
 zAA6G+L9S70PVZ7dvT4q0zN+uQ3EcHTOlAVc0Fu07t3qmvZheZW8Go+ZHX8K2U2O4E/X
 NSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BcH1nHPR47fHpCPeOlz4Kj9mOlG9SQD37Fo/QmEk1cU=;
 b=wVXIA00+NjUm2Uy5fiWI8GfSQ7CzJw0yFXmAWVxK/927WkUwE4QYAY/YAdbx+w6wan
 2RwbqicW7z4eiTEuun2ZUwNT/EmBlSc85LK/PyGIeCAcFkAbyNiDf7bbwoJ6FyiocaBC
 eGUhLJyKNZQNr+WBi5NnI5R95FQEad4ZQxQotKc27hVyE0xzKVga3JzHctWts2dbmTZr
 RESHMlPq4PIEsvBpFStD6y7PuP5eOEJtdSVWT8/5LNz9VpzEO2KlT5CMgKHDiNhWygGb
 T+whw2doNx8kwPnpt+oapxkCACxeA1TlGr1SitIi1yshBUqyneZX9wnW5b6rkufzM48X
 fKMQ==
X-Gm-Message-State: AOAM53164UgEbAi1Wx/5yTep1SNXNnQXoTeY612JaMekbwYb/08FHq8s
 OHJUipSe9IOBdMftfkdxwnf2eA==
X-Google-Smtp-Source: ABdhPJwkn5cwBSog1lF0erA8j6SzER+eUovEx6ffRIBTjuiZGUyp3/EPvR8QkENKnwBh2uiflF0+HQ==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr2777933wro.229.1643283789934; 
 Thu, 27 Jan 2022 03:43:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g5sm2485099wri.108.2022.01.27.03.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:43:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DAA21FFB7;
 Thu, 27 Jan 2022 11:43:08 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-7-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 06/42] hw/cxl/device: Implement basic mailbox (8.2.8.4)
Date: Thu, 27 Jan 2022 11:31:16 +0000
In-reply-to: <20220124171705.10432-7-Jonathan.Cameron@huawei.com>
Message-ID: <87czkdbe0j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> This is the beginning of implementing mailbox support for CXL 2.0
> devices. The implementation recognizes when the doorbell is rung,
> handles the command/payload, clears the doorbell while returning error
> codes and data.
>
> Generally the mailbox mechanism is designed to permit communication
> between the host OS and the firmware running on the device. For our
> purposes, we emulate both the firmware, implemented primarily in
> cxl-mailbox-utils.c, and the hardware.
>
<snip>
> +
> +#define define_mailbox_handler(name)                \
> +    static ret_code cmd_##name(struct cxl_cmd *cmd, \
> +                               CXLDeviceState *cxl_dstate, uint16_t *len)
> +#define declare_mailbox_handler(name) define_mailbox_handler(name)
> +
> +#define define_mailbox_handler_zeroed(name, size)                       =
  \
> +    uint16_t __zero##name =3D size;                                     =
    \
> +    static ret_code cmd_##name(struct cxl_cmd *cmd,                     =
  \
> +                               CXLDeviceState *cxl_dstate, uint16_t *len=
) \
> +    {                                                                   =
  \
> +        *len =3D __zero##name;                                          =
    \
> +        memset(cmd->payload, 0, *len);                                  =
  \
> +        return CXL_MBOX_SUCCESS;                                        =
  \
> +    }
> +#define define_mailbox_handler_const(name, data)                        =
  \
> +    static ret_code cmd_##name(struct cxl_cmd *cmd,                     =
  \
> +                               CXLDeviceState *cxl_dstate, uint16_t *len=
) \
> +    {                                                                   =
  \
> +        *len =3D sizeof(data);                                          =
    \
> +        memcpy(cmd->payload, data, *len);                               =
  \
> +        return CXL_MBOX_SUCCESS;                                        =
  \
> +    }
> +#define define_mailbox_handler_nop(name)                                =
  \
> +    static ret_code cmd_##name(struct cxl_cmd *cmd,                     =
  \
> +                               CXLDeviceState *cxl_dstate, uint16_t *len=
) \
> +    {                                                                   =
  \
> +        return CXL_MBOX_SUCCESS;                                        =
  \
> +    }

I missed these #define's - can you upcase them to make it clear they are
macros when used.

--=20
Alex Benn=C3=A9e

