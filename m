Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFD2B80BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:41:51 +0100 (CET)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPag-0001qW-VD
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfPZD-0001O0-Kj
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:40:19 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfPZB-0004cF-1f
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:40:19 -0500
Received: by mail-ed1-x536.google.com with SMTP id m16so2479493edr.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Pq6Mz0O/n8+7SevdgfQXLYATgstSP5EBkHImLL2O8c=;
 b=T8/Pr42uFo5jijv7vPAxE1EGIel4VRtMNw3VsAkglUxa0YbGBwPO7SRXBkQszKpamL
 Bof52tALAcMb3Ka5MnjJxTM+MvXUxN+ZK2XB3bMILzgheQN3bv9jFqC39pJ1Q5n075Xl
 a1pypxLXBcZqJHvMc9aMSglvvz9AbyARMBqRYf9qzrSiWVdkKpYmnWK9JeNJa7qwcq9j
 KR8lKGNQTljcE9hQ+wMTjvhdTORoMDzsHncqXdb3joaJeJ/jnBYUjfiM0EErC6eN1wjQ
 3qsDNAN1XyWF4oWaq/dHC67wF54PeLGynSYwaZ2RcwyiyZGOYR9/nRQkCmXq9U1YEmFr
 brwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Pq6Mz0O/n8+7SevdgfQXLYATgstSP5EBkHImLL2O8c=;
 b=oEebCcpFlhQ8lQ/yQhGLU2k3uYeQeERRbTlXih36g7+BHGQ1UGlx8Ye+xA2B8cXX17
 Sp8+s+CXl73JX3vVGBaz04dESimIX6URPwbDZGM+5OGyRrbaK+lovQe9RX+g4entW8oD
 QDuCCv8c21a6xrTeujUcoEezwVM2CX4QtSo18w4YxUVhg8B/tAr2qeWTlyR4pDN2NMft
 2KwNSqLpy3JjO9OfVIAC0TVSSCPZubeBodFj0bLGP7SPr6ew7R+d/tRBSB8n0cRVTho1
 P9iUTjxcs4BMOzqRA9UXqbWKfM+6cinlWTBVNKuuCWeyjkAnCjbk6HNmf82s2XPCkzV0
 AGnw==
X-Gm-Message-State: AOAM5314pmrkvyfH2QVFf7EDais4esdNUbr/HuKZeWgB3wWFlSaSg1mO
 puRE5esR6w6NaOQi7Vs+ANUy6EWE+uld3xFD8PYWlA==
X-Google-Smtp-Source: ABdhPJyVPinc4KVvhl2CYNoWM+DbECck9Y1CpFkLQyn9t2duV0eclM8C5GYPyYuRBW2nyfFQUp8PMP5NcFrW8fhdH7A=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr25602260edr.44.1605714015507; 
 Wed, 18 Nov 2020 07:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20200924092314.1722645-1-pbonzini@redhat.com>
 <20200924092314.1722645-20-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-20-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 15:40:04 +0000
Message-ID: <CAFEAcA9Utr2mCGyi7+8Yg16KSYhoP=3+hJa=wN6_AdG8TB0a8g@mail.gmail.com>
Subject: Re: [PULL 19/92] hw/char/serial: Assert serial_ioport_read/write
 offset fits 8 bytes
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Sep 2020 at 10:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The serial device has 8 registers, each 8-bit. The MemoryRegionOps
> 'serial_io_ops' is initialized with max_access_size=3D1, and all
> memory_region_init_io() callers correctly set the region size to
> 8 bytes:
> - serial_io_realize
> - serial_isa_realizefn
> - serial_pci_realize
> - multi_serial_pci_realize
>
> It is safe to assert the offset argument of serial_ioport_read()
> and serial_ioport_write() is always less than 8.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20200907015535.827885-2-f4bug@amsat.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/char/serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index fd80ae5592..840da89de7 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -344,7 +344,7 @@ static void serial_ioport_write(void *opaque, hwaddr =
addr, uint64_t val,
>  {
>      SerialState *s =3D opaque;
>
> -    addr &=3D 7;
> +    assert(size =3D=3D 1 && addr < 8);
>      trace_serial_ioport_write(addr, val);
>      switch(addr) {
>      default:

Bug report https://bugs.launchpad.net/qemu/+bug/1904331
points out that the addition of this assert() makes obvious
that either the assert is wrong or some code later in the
function which is looking at size must be dead:
            if (size =3D=3D 1) {
                s->divider =3D (s->divider & 0xff00) | val;
            } else {
                s->divider =3D val;
            }

Presumably it's the if() that should be fixed ?

thanks
-- PMM

