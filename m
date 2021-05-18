Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C3388117
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:10:08 +0200 (CEST)
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj62Z-0006pm-Bb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj61l-0006Af-8r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:09:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj61j-000454-Ht
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:09:17 -0400
Received: by mail-ej1-x634.google.com with SMTP id s22so16309581ejv.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sj9/sHwjqKBLDS0k+VqdB+RfsMRcXVUFPpKVOFo7cLM=;
 b=qP/I3u2o+wbCdu9s6oGwnLkXEuB7heodAac0UuTgW4DXYnzfbPLaCVFsAaYO2g43Ak
 1c6lc17SJolOPPPGLreKmdCg+NBY//Qwzp7jGfIj31eF3nclHsa9jDWsaOaKmQh/9hWY
 TYGqsR+I7L5A8nt4EcLepXO8bE0tHkhQeQ47605C5xmYWGyM2NYxTc6/0LOl0gb0aFPn
 07X4iTQa6kfV9xCUhLuxX53CMIuiDdrsQP2xv8mx4watXiJHhO5IGqQHYchKX1d2Zhjc
 fQv0cX8sJrX47L+Zq2QBWlEhTZttYZ/5i0reW7KSfeSmHJ/jytJiiWyHAjvQkfgsjpaL
 RMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sj9/sHwjqKBLDS0k+VqdB+RfsMRcXVUFPpKVOFo7cLM=;
 b=dSehHLSD1NrqobPDZPvQHQBqlO7PPhYx9i//KHluecdXapQ2D3QSbkilbM0G1HJ0lG
 rHhMkbXH9Smp2a67QOJJm+tsxQGcSUPBEDoAdJu6alC9p4f1vEybOj3i0O9JZCbQSXHo
 5OGgx+84Y9Ok9ODDWleSJEVIR8UjWg8p/ki/DDIgs3IEmkX7OdjICULDmywK32ByuT23
 hkwMBXWadJvkfdFVSYHfK/TU194mVvBCUPGz/LfWBllPzchLJ5LxXCSff2w+XDNfdMn0
 PStgQIIXOQadru7LSDE0fNuHweFOS08Z9QoA9RhiPDbPgooxQAiOMQ4RPaDGrS1GGa8z
 p93Q==
X-Gm-Message-State: AOAM533PiOGGp6WMq5YSvo9jCRyOE2Hd/O+29IXge71RGQrne1ZgUO/J
 gljrVwZLj/471TAymGn9hMcE1lHSvtVxyjTS+H9/Ig==
X-Google-Smtp-Source: ABdhPJy9xQqsAiDqHu/u5A49ERtlI0DEYHSJ27714WkScUUrrvZwdkHK4jM30ryAp/pbvY5PFqXxV6nRoEBfCPJE3l0=
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr7711523ejd.4.1621368553348; 
 Tue, 18 May 2021 13:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-9-philmd@redhat.com>
In-Reply-To: <20210518183655.1711377-9-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 21:08:56 +0100
Message-ID: <CAFEAcA-sMr1_1Ckyu2qXJ5ZKhqDFgOd0Uxh+Q9ZKghrhB4ue5g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/25] qemu/bswap: Use ST_CONVERT() macro to emit
 16-bit load/store functions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 19:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu/bswap.h | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 86f5ded6acf..4e2bd2e97ee 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -350,11 +350,6 @@ static inline int ldsw_he_p(const void *ptr)
>      return r;
>  }
>
> -static inline void stw_he_p(void *ptr, uint16_t v)
> -{
> -    __builtin_memcpy(ptr, &v, sizeof(v));
> -}
> -
>  static inline int ldl_he_p(const void *ptr)
>  {
>      int32_t r;
> @@ -399,11 +394,6 @@ static inline uint64_t ldq_le_p(const void *ptr)
>      return le_bswap(ldq_he_p(ptr), 64);
>  }
>
> -static inline void stw_le_p(void *ptr, uint16_t v)
> -{
> -    stw_he_p(ptr, le_bswap(v, 16));
> -}
> -
>  static inline void stl_le_p(void *ptr, uint32_t v)
>  {
>      stl_he_p(ptr, le_bswap(v, 32));
> @@ -434,11 +424,6 @@ static inline uint64_t ldq_be_p(const void *ptr)
>      return be_bswap(ldq_he_p(ptr), 64);
>  }
>
> -static inline void stw_be_p(void *ptr, uint16_t v)
> -{
> -    stw_he_p(ptr, be_bswap(v, 16));
> -}
> -
>  static inline void stl_be_p(void *ptr, uint32_t v)
>  {
>      stl_he_p(ptr, be_bswap(v, 32));
> @@ -466,6 +451,8 @@ static inline void st ## size ## _ ## endian ## _p(vo=
id *ptr, vtype v)\
>      ST_CONVERT_END(le, bits, vtype, size)\
>      ST_CONVERT_END(be, bits, vtype, size)
>
> +ST_CONVERT(16, uint16_t, w)
> +

Where we have a macro that emits a bunch of function declarations,
can we also add a comment that (a) documents the functions and
(b) explicitly lists the name of every generated function?
The latter in particular is really helpful for people who are
trying to find function declarations/definitions with 'grep'.
The comment above the definition and use of the CPU_CONVERT
macro in bswap.h is an example.

thanks
-- PMM

