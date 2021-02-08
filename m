Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCD313D87
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:32:03 +0100 (CET)
Received: from localhost ([::1]:32974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BKM-00023I-Lw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9730-0005PF-2j
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:57:51 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l972g-0001Mx-IA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:57:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id sa23so24886389ejb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9NiabmO5CzJfZ/zFcfyiUkofT/HxE6L7y1PJoRvMxw=;
 b=t7MWugstWbRds/zCmvRBYaIIW87Cd0IQ/TzBq3iMS22suu71NdpCGPsBJ3EPgQUCAX
 CaYF+dsjXzqANiNUTErmMK5PwROOCfx5VpXz/CaxADLdw2ipxLX5LN61D6Xr7szVH4tF
 QZdwFZdfJsovk319dhPZoPedGodA3lE1std1Frfu7lFlSwp580RGa8K3Zr+L5f6TXBKc
 QrvPe6DzEUkE3X7uRJX+XQrdPDdIldjaH+/2+0fJQUL/DQVf+CUIFWOjN78t6hcJYM+1
 8H9iRbtV8G8TBfH6HMThNKHXildLRGgvo8nocIcosLszbFyT+kuGDLp+LPqPlmYUpyEr
 tfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9NiabmO5CzJfZ/zFcfyiUkofT/HxE6L7y1PJoRvMxw=;
 b=jWBRm3eWAP23Gnj8PjgAVoh6HOtFazEVS+Twh6ZwEpNN+N9C4nXFWxuzCh5sJ3qpqh
 r4gKkJ3q2lozhCADk1RmlzwAO/QL2izOlsZSSdCZEDA0fg7eCKgXUWKEAdGqJL5rm0+5
 HUlLckudDRsdxx9fVix3pkjXv9rsjTlZ8koifhwJTIL0Bb9a8ZXo6IY1BTbx8X4yIZdl
 xDT0K9GUK2DYeTYhoDy0zDTe7aGhrgrPlGhFNpa9RTP+BcH8GDOULOSg6Ux6XXZWZp+J
 vMUzyn8qVPBx3heEaLkYAucuk5gCV1eiWvJLgkRqpPssrsUnj12nZrVgIAsg5ruIFGxZ
 3enA==
X-Gm-Message-State: AOAM530vzhKfu64DCyGQAYh5HHqXiUXlwhqwl83Rg/6B/39L1A8J5K4X
 LpoyXupIUNdr/1UO1RkgzqlgKzkccM43ulGf3bkG7w==
X-Google-Smtp-Source: ABdhPJz37Pkn56qiXLFanBZkODMoEg2hT1p5t8mPVxa8MJWXyQHihM+PkZYAQztUXvrS27bERNZ/rIrmt6rtygy/Qvs=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr17152203ejc.482.1612792639269; 
 Mon, 08 Feb 2021 05:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-20-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:57:08 +0000
Message-ID: <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
Subject: Re: [PATCH v5 19/31] linux-user: Handle tags in lock_user/unlock_user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Resolve the untagged address once, using thread_cpu.
> Tidy the DEBUG_REMAP code using glib routines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/uaccess.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index 30d01f8b30..c696913016 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -6,36 +6,37 @@
>
>  void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
>  {
> +    void *host_addr;
> +
> +    guest_addr = cpu_untagged_addr(thread_cpu, guest_addr);
>      if (!access_ok_untagged(type, guest_addr, len)) {
>          return NULL;
>      }
> +    host_addr = g2h_untagged(guest_addr);
>  #ifdef DEBUG_REMAP
> -    {
> -        void *addr;
> -        addr = g_malloc(len);
> -        if (copy) {
> -            memcpy(addr, g2h(guest_addr), len);
> -        } else {
> -            memset(addr, 0, len);
> -        }
> -        return addr;
> +    if (copy) {
> +        host_addr = g_memdup(host_addr, len);
> +    } else {
> +        host_addr = g_malloc0(len);
>      }
> -#else
> -    return g2h_untagged(guest_addr);
>  #endif
> +    return host_addr;
>  }
>
>  #ifdef DEBUG_REMAP
>  void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
>  {
> +    void *host_ptr_conv;
> +
>      if (!host_ptr) {
>          return;
>      }
> -    if (host_ptr == g2h_untagged(guest_addr)) {
> +    host_ptr_conv = g2h(thread_cpu, guest_addr);
> +    if (host_ptr == host_ptr_conv) {
>          return;
>      }
> -    if (len > 0) {
> -        memcpy(g2h_untagged(guest_addr), host_ptr, len);
> +    if (len != 0) {
> +        memcpy(host_ptr_conv, host_ptr, len);
>      }

Why the change from checking >0 to checking !=0 ? I'd rather not
have to go through and audit all the callsites to confirm none
of them pass a "length-or-negative-errno" value here...

thanks
-- PMM

