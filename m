Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE4562102
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 19:13:50 +0200 (CEST)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6xjh-0005Ee-BY
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o6xiK-0004NW-OO
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:12:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o6xiH-0001zm-D7
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 13:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656609139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zd4yMGuHHYYIJfoWieCXx/GUgBswfBFPBsE+Hta2wL4=;
 b=SWq+0OijpBDUVUE5CA/vLMp+zhijDpnnU0NZSgqzFbASG+m8I/TNDtbXrWLtDvrsz8lj91
 xnxA5YOm3cAU5dwUjPOJvZe2TgJ2BmsH7ENnVa/WDH9SZhk8zg4pvYUgX2S+wdRUX/162M
 1h5YlbNRNtRspXSCa+nOHFHvxffSrxs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-F9JCEL9EOqaaJKa2F1KCcg-1; Thu, 30 Jun 2022 13:12:17 -0400
X-MC-Unique: F9JCEL9EOqaaJKa2F1KCcg-1
Received: by mail-pf1-f199.google.com with SMTP id
 bm2-20020a056a00320200b0052531ca7c1cso8054pfb.15
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 10:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zd4yMGuHHYYIJfoWieCXx/GUgBswfBFPBsE+Hta2wL4=;
 b=0ZJfQ1gqa9p/y4w2dq5f0hBZTt3hsDETGnW884v3B7ap20lTzd6lkulwVR3J/DZMuM
 jz4TzqVgHkyc7wh5346Ar6tgRjPx568axOQjiVYfA5pEiwGHebzEl8ma6wRA92lLeOoy
 SgODlncvbe1v0EHWV+8ultzpWdAZR6TksE1YhRkCntk/7ghm7NuZMmxQO/5jS/tOwMZG
 1UJUgbX1gWMOmaBgKpLj8lb9LLEtqdHj5o99IoVvEDONWDK5wgTiKho12sej9zRFPdK6
 uohxDlYUaJhUq2ket6Bj3Nuf7VRSQRZBeMaJjcpW8SfXhqT1ygI8FANIGuIvBJK7B0zJ
 fMjA==
X-Gm-Message-State: AJIora+WlHw7iSektyjKjX1ZPRPcrznT9QbYr3ecn5XfkuTuyNVxLF+g
 cLchXvOiX3pg64kBTnzrRlj8jYqU15KXTGbiCaSNYhx4Bc21SocbiBeiVRLlbskDVkpV0qaeNBi
 eTFF+5Y2ONOvG2nBV8f8utWLipVzFDF0=
X-Received: by 2002:a17:902:ec83:b0:16a:3029:a44 with SMTP id
 x3-20020a170902ec8300b0016a30290a44mr14939247plg.141.1656609136372; 
 Thu, 30 Jun 2022 10:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uMemen0ZQ9Tl38hKsvYy9eiwA+1ra8Qoxu9kWHYcNb4Ftm3XlvdG4AdMcg0uuY7DrIGIBFs0GkFtq2XlQIzus=
X-Received: by 2002:a17:902:ec83:b0:16a:3029:a44 with SMTP id
 x3-20020a170902ec8300b0016a30290a44mr14939222plg.141.1656609136053; Thu, 30
 Jun 2022 10:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220624082730.246924-1-pbonzini@redhat.com>
 <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
In-Reply-To: <9d4d83cc-d4e5-6b8e-2ed9-00cefb534082@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 30 Jun 2022 19:12:03 +0200
Message-ID: <CABgObfa+RqJigqdzq1CJjVyCOh2GUT9CH4YJfDxobXPDi87n5Q@mail.gmail.com>
Subject: Re: [PULL 00/14] (Mostly) build system changes for 2022-06-24
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001624f105e2ad5f0e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000001624f105e2ad5f0e
Content-Type: text/plain; charset="UTF-8"

Il ven 24 giu 2022, 17:57 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> But then the i386 cross-compiler isn't used:
>

Yeah, that was intentional. In theory a softmmu target is freestanding and
does not need anything beyond the compiler install, so configure defaults
to the native compiler, which is biarch. That however assumes that the
compiler install includes the libgcc for both architectures.

Does that mean that Ubuntu installs GCC without a 32-bit libgcc.a?

Paolo


> $ cat tests/tcg/config-i386-softmmu.mak
>
> # Automatically generated by configure - do not modify
>
> TARGET_NAME=i386
>
> BUILD_STATIC=
>
> EXTRA_CFLAGS=-m32
>
> CC=cc
>
> CCAS=cc
>
> AR=ar
>
> AS=as
>
> LD=ld
>
> NM=nm
>
> OBJCOPY=objcopy
>
> RANLIB=ranlib
>
> STRIP=strip
>
> QEMU=/home/rth/qemu-publish/bld/qemu-system-i386
>
>
> leading to failure:
>
> cc -nostdlib -ggdb -O0 -isystem
> /home/rth/qemu-publish/src/tests/tcg/minilib -m32
> -ffreestanding
> /home/rth/qemu-publish/src/tests/tcg/multiarch/system/hello.c -o hello
> -Wl,-T/home/rth/qemu-publish/src/tests/tcg/i386/system/kernel.ld
> -Wl,-melf_i386 -static
> -nostdlib boot.o  printf.o -lgcc
>
> /usr/bin/ld: skipping incompatible
> /usr/lib/gcc/x86_64-linux-gnu/11/libgcc.a when
> searching for -lgcc
>
> /usr/bin/ld: cannot find -lgcc: No such file or directory
>
> collect2: error: ld returned 1 exit status
>
> make[1]: ***
> [/home/rth/qemu-publish/src/tests/tcg/i386/Makefile.softmmu-target:32:
> hello]
> Error 1
>
>
>
> r~
>
>

--0000000000001624f105e2ad5f0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 24 giu 2022, 17:57 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">But then the i386 c=
ross-compiler isn&#39;t used:<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Yeah, that was intentional. In theory a softmm=
u target is freestanding and does not need anything beyond the compiler ins=
tall, so configure defaults to the native compiler, which is biarch. That h=
owever assumes that the compiler install includes the libgcc for both archi=
tectures.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Does that mean=
 that Ubuntu installs GCC without a 32-bit libgcc.a?</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
$ cat tests/tcg/config-i386-softmmu.mak<br>
<br>
# Automatically generated by configure - do not modify<br>
<br>
TARGET_NAME=3Di386<br>
<br>
BUILD_STATIC=3D<br>
<br>
EXTRA_CFLAGS=3D-m32<br>
<br>
CC=3Dcc<br>
<br>
CCAS=3Dcc<br>
<br>
AR=3Dar<br>
<br>
AS=3Das<br>
<br>
LD=3Dld<br>
<br>
NM=3Dnm<br>
<br>
OBJCOPY=3Dobjcopy<br>
<br>
RANLIB=3Dranlib<br>
<br>
STRIP=3Dstrip<br>
<br>
QEMU=3D/home/rth/qemu-publish/bld/qemu-system-i386<br>
<br>
<br>
leading to failure:<br>
<br>
cc -nostdlib -ggdb -O0 -isystem /home/rth/qemu-publish/src/tests/tcg/minili=
b -m32 <br>
-ffreestanding /home/rth/qemu-publish/src/tests/tcg/multiarch/system/hello.=
c -o hello <br>
-Wl,-T/home/rth/qemu-publish/src/tests/tcg/i386/system/kernel.ld -Wl,-melf_=
i386 -static <br>
-nostdlib boot.o=C2=A0 printf.o -lgcc<br>
<br>
/usr/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-linux-gnu/11/libgcc.=
a when <br>
searching for -lgcc<br>
<br>
/usr/bin/ld: cannot find -lgcc: No such file or directory<br>
<br>
collect2: error: ld returned 1 exit status<br>
<br>
make[1]: *** [/home/rth/qemu-publish/src/tests/tcg/i386/Makefile.softmmu-ta=
rget:32: hello] <br>
Error 1<br>
<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--0000000000001624f105e2ad5f0e--


