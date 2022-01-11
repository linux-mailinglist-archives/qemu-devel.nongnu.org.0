Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB448AD8A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:23:52 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7GBr-0000DX-NW
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7GA2-0007th-0e
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:21:58 -0500
Received: from [2a00:1450:4864:20::430] (port=40553
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7GA0-0006iy-7K
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:21:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id x4so7443505wru.7
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6EicbKasqe7K/i3ebUaaoH6W3pH00NfPe2NYj3T9jQA=;
 b=H+mRWBejdcU4AnHfIJGZTLfJOyCduoT19vbZmcaG2P+Lk31BnFquwdGdMcX6+K/eZI
 5/etBZrS5o9Z6fM/ETSQ/1VC6CrtIJzK8Xg5Yg0hfBTYIWAoieMG6gBRHYXHC1U8iR8d
 yFLH0cuNVAEIIe5zcx6/oGN4OUqofAz6KFO7Z9b0iZhVJpPN2O0zkCX9AQxPsJh7jr36
 ArilmwKTUhIIFQifM+f1KaOyn+izPMPeFoA7b11yER0fe55SZSz0MkxpWVlEHxuYTQJ5
 z20yzyZjqHKqq4RWDTUxoDtbs5r5sTPf4tCLI1bwt9nLdTVQq+FSEmqesh0q5s4XpGRv
 yllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6EicbKasqe7K/i3ebUaaoH6W3pH00NfPe2NYj3T9jQA=;
 b=bKcDyFSnatbFsbMzme6dlOefco7Brabh93P9WFo7wStWNcVKNPEq1Uq/egk1eenDYu
 ZQahdGYQw5h8Q9nJIcwklbF+j6vIX+4Tb0hkIOE1QYl6vRLn3l4aM1dV2G2kVVP7JZju
 fq2ZDgjlfcml6pPwJ5CHCQ1Q6z/+/RRJGgNqo+9XuJqSUbmTK686rrhqHvH9Bcwv0fkC
 0mK0o2WgBSjO4Cm0hXSjxS6mkg/l3gunFX+rlRZKio/25YRkg6peEqnU0j8iLYRO7lHf
 MconITWpI7kmY7w6KZ+WEKjgN5s77rXz/9WBd4mad9l5jxN8gt3yw1egQ6UVhK3refH0
 qMmw==
X-Gm-Message-State: AOAM5317xdRcRRjwKdq1SLur9uub7OYNC+ya9AWFbiv79IQ5S+8sTRb9
 4J/ZGEyWNym3+g8wjCGXwJVP5ZUsztKlKWs++Zw3og==
X-Google-Smtp-Source: ABdhPJzQN+BiGoOvA8Gr5Cv79dJRtqddtof31R2NYoU8/odcDZAALpLX30gs86ZPmmfc5DWt04GhEE1G2DjUNFRrVjg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3512121wri.295.1641903713940; 
 Tue, 11 Jan 2022 04:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
In-Reply-To: <20220111104918.896841-1-pizhenwei@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 12:21:42 +0000
Message-ID: <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
Subject: Re: [PATCH] usb: allow max 8192 bytes for desc
To: zhenwei pi <pizhenwei@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
>
> A device of USB video class usually uses larger desc structure, so
> use larger buffer to avoid failure. (dev-video.c is ready)
>
> Allocating memory dynamically by g_malloc of the orignal version of
> this change, Philippe suggested just using the stack. Test the two
> versions of qemu binary, the size of stack gets no change.
>
> CC: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/usb/desc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
> index 8b6eaea407..57d2aedba1 100644
> --- a/hw/usb/desc.c
> +++ b/hw/usb/desc.c
> @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket=
 *p,
>      bool msos =3D (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>      const USBDesc *desc =3D usb_device_get_usb_desc(dev);
>      const USBDescDevice *other_dev;
> -    uint8_t buf[256];
> +    uint8_t buf[8192];
>      uint8_t type =3D value >> 8;
>      uint8_t index =3D value & 0xff;
>      int flags, ret =3D -1;

I think 8K is too large to be allocating as an array on
the stack, so if we need this buffer to be larger we should
switch to some other allocation strategy for it.

thanks
-- PMM

