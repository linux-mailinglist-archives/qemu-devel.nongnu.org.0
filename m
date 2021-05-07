Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69703376962
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:16:59 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf45y-0000qm-7k
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf43O-0008Qx-Le
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf43I-0003TQ-CA
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620407650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmQ5kgpbf3169hBJ18Ia3FxprliSdUJRha7Gey5ycN8=;
 b=N+j0J8OSKbiaBy+Ou7HuDrE1B0NClMogXvgnz7uYPJEFZGnRjHLPvSbIjHZY+8raHeRefM
 N8w2yriE+kagbeBz6ZBmrYpP20YNiJ4ws8pc+vbfwwQAwc5x9nyyxEDvyhPauYvDHG4QT7
 5zSaT5u+7sU3DGLlSroaRjAFiw0oft4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-0KQrgtBzOnSHIkbTqeJecQ-1; Fri, 07 May 2021 13:14:06 -0400
X-MC-Unique: 0KQrgtBzOnSHIkbTqeJecQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so3853336wre.18
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EmQ5kgpbf3169hBJ18Ia3FxprliSdUJRha7Gey5ycN8=;
 b=rK82jygNmhBfFF6a1/yKQ9WmJ9dkaejazOvdGqUo60QgJAwdRVR9+NI7cP/b29vTNV
 UcslOWed9YhHZBy0rlLM6QAyLX3C9Gxk4w9H8/CaCMFg6zcHqI3LqOAUQbym+5pjEHjt
 pLeqzvXL7P9w9U+d7xXD+rA19k5G04WnWej0wJ+Vnwq/dSjksH1hv7xwQ969XWvpdThq
 KcXDpEJ4oCmFkDsmcqzhHlrGLzLejax5RJvy33LK6XId18cGE6K73DQ8Wwcj1R6m2N0r
 Z+DkzdwNPz/kgtv4LWu5ebO/+BiEaVe8b1TAKiEFC2rfGX4PEq9N+52th1e+FuWpZd2C
 njnw==
X-Gm-Message-State: AOAM532bKfaCJW86Y6A41ZSZoaEn/VA/G9/FK6G8vYqASmjSt5d8scdw
 NQfY38rT7FICYCtRMJQKE2rj0siIbKJC0CRuFmy2nmpLP5XkizPu7nHkSUnq9M2AZqB0lh8aq5x
 OGjtwZTVaPHvnV9Q=
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr13717836wrj.407.1620407645443; 
 Fri, 07 May 2021 10:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzbiRM8OtBh85ISQLWg+VWD/MJE+TM1OA9jo/+9O9pR2yDAaJVXnl1xIOWUgqhVK/V+o7wkg==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr13717811wrj.407.1620407645247; 
 Fri, 07 May 2021 10:14:05 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id p7sm8514253wrt.24.2021.05.07.10.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 10:14:04 -0700 (PDT)
Subject: Re: [PATCH v3 16/17] configure: Prohibit alloca() by using -Walloca
 CPPFLAG
To: qemu-devel@nongnu.org
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-17-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4bc42a9f-fcb6-40b0-cbe6-6b75c13c1440@redhat.com>
Date: Fri, 7 May 2021 19:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507144315.1994337-17-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 4:43 PM, Philippe Mathieu-Daudé wrote:
> Now that we removed all alloca() calls in the repository, add the
> -Walloca CPPFLAG to trigger a build failure if such stack allocation
> is used.
> 
> Rationale: The ALLOCA(3) man-page mentions its "use is discouraged".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> As there is an alloca() call in libslirp, this patch is pending
> on the following libslirp patch to be merged:
> https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
> (and the submodule updated).
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 4f374b48890..67cb6d5421c 100755
> --- a/configure
> +++ b/configure
> @@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
>  # provides these semantics.)
>  QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
>  QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
> -QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
> +QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
>  QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"

Sigh I forgot one Clang version (7.0.1) doesn't recognize this warning.

I'll replace this patch by:

-- >8 --
diff --git a/configure b/configure
index 4f374b48890..4330245fa1f 100755
--- a/configure
+++ b/configure
@@ -2083,2 +2083,3 @@ add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Walloca

---

Regards,

Phil.


