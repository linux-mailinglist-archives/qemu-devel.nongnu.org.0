Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A216FC918
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:34:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOPV-0007Rk-4V; Tue, 09 May 2023 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOPM-0007Qg-F9
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:33:40 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOPK-00073N-CU
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:33:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so210977265e9.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642816; x=1686234816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uGBWhvMNS+axjsrzLLzmOBLHUotS7AxairZM5Agq5RQ=;
 b=t+VBg8PYQksG6UJJRbyKV0MTGv8MGF//qs8zpTNU80iRJCOLa4+zO8xd3SchG5mUEc
 sf1hjEJ0hwx4qNLghmhbaAub5ZAhZOiDCWhvLA2GtXdjDioq9rnJtOtyXjv4eJS9lDZk
 jYyi5i/s8rfCXWHSBfwkHsp6x3u0KEi8+VugEHFYV52C3kErsCAST6+Y64u1ylR63ZH3
 gsNNBJ922FH8EmII9Mf6oMmxnyXl5Vrr23ysTmlcN7fRSwdsPEnLJPKIVnBQO/r2bS21
 XSjzlbfMj6xauSsgKQhb+jRXy4sp7ntc0UXCdcRoelvKI4dmmPfmzKNVnjdEmIkAzVYY
 V0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642816; x=1686234816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uGBWhvMNS+axjsrzLLzmOBLHUotS7AxairZM5Agq5RQ=;
 b=Wdm+0Yt5DcK8lH+No5FPTVKiCNOXmZa02rM6oAgvrzsqpx1iKo14W0FF75AvIBEJ+z
 WhG9/IKf9Q/MYkjtJDhjFg1xu0bSO1Cxqg09kWAFVYBaXmqcIUru0Bd+X2t+1+ID4oVE
 Qmxd+D1tzlrT4iucCvBiMju9RKOaXgj5L7Ro6WV79fkfrvCJxqtJUpcX850fOJjVzwud
 aKdmBKZKYSxys8FsFKPvNSZt234SGGEbls/isy9NNks1Ti5VQz0fLRLWBsgDPOtIOUrY
 mt6AND47DXctLrDanZBjvVxOHYosM7yYyzexr0oCVhK3DyH8UXvC4n2yVdeRG3Qqj3de
 x+cg==
X-Gm-Message-State: AC+VfDwJwAhSWNr1XMxLkxFpMqJpdHzlwxWL/uOwPHf4DvHjo8Dx/L3r
 cIif6f7qBp4WaqYP/xn7NB75bQja+XjxbPitzT4=
X-Google-Smtp-Source: ACHHUZ5xSavnGpUbmDiRcfq0rGwaL5WOG+NOahATrdqwc8F2ugtqURhDhF9UwUcn6XQ6e5fGfeSbRA==
X-Received: by 2002:adf:fdd1:0:b0:306:2ff1:5227 with SMTP id
 i17-20020adffdd1000000b003062ff15227mr8677698wrs.23.1683642816592; 
 Tue, 09 May 2023 07:33:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0030795b2be15sm6954311wrx.103.2023.05.09.07.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:33:36 -0700 (PDT)
Message-ID: <00958ee1-4c47-20e9-bcd0-ed92179ee831@linaro.org>
Date: Tue, 9 May 2023 16:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] ui/dbus: Implement damage regions for GL
Content-Language: en-US
To: Bilal Elmoussaoui <belmouss@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 chergert@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230509115940.114033-1-belmouss@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230509115940.114033-1-belmouss@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 9/5/23 13:59, Bilal Elmoussaoui wrote:
> From: Christian Hergert <chergert@redhat.com>
> 
> Currently, when using `-display dbus,gl=on` all updates to the client
> become "full scanout" updates, meaning there is no way for the client to
> limit damage regions to the display server.
> 
> Instead of using an "update count", this patch tracks the damage region
> and propagates it to the client.
> 
> This was less of an issue when clients were using GtkGLArea for
> rendering,
> as you'd be doing full-surface redraw. To be efficient, the client needs
> both a DMA-BUF and the damage region to be updated.
> 
> In the future, when additional methods are allowed on the D-Bus
> interface,
> this should likely be updated to send damage regions as a single RPC to
> avoid additional message processing.
> 
> Currently, Linux does not propagate damage rectangles when using the
> virtio-gpu drm driver. That means compositors such as Mutter which
> utilize
> drmModePageFlip() will be sending full or near-full surface damages.
> 
> https://lists.freedesktop.org/archives/dri-devel/2023-March/395164.html
> contains a patch to fix that too.
> 
> Signed-off-by: Bilal Elmoussaoui <belmouss@redhat.com>
> ---
>   meson.build        |  8 ++++++++
>   ui/dbus-listener.c | 25 +++++++++++++++++++------
>   ui/meson.build     |  2 +-
>   3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 229eb585f7..72678ef78e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1761,6 +1761,14 @@ dbus_display = get_option('dbus_display') \
>              error_message: '-display dbus is not available on Windows') \
>     .allowed()

^ dbus strictly required deps, ...

> +cairo = not_found
> +if dbus_display
> +  cairo = dependency('cairo',
> +                     kwargs: static_kwargs,
> +                     method: 'pkg-config',
> +                    )

cairo declared as optional dep, ...

> +endif
> +
>   have_virtfs = get_option('virtfs') \
>       .require(targetos == 'linux' or targetos == 'darwin',
>                error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 911acdc529..047be5cb3a 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -25,6 +25,7 @@
>   #include "qemu/error-report.h"
>   #include "sysemu/sysemu.h"
>   #include "dbus.h"
> +#include <cairo.h>

cairo used unconditionally.

Shouldn't we now declared it as a strict dependency in meson?

>   #include <gio/gunixfdlist.h>
>   
>   #ifdef CONFIG_OPENGL


