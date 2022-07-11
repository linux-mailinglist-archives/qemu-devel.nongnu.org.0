Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E02570C17
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:41:48 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0Dy-0002uM-RK
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0Ba-0001M3-R2
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0BO-0003x2-5E
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yd0e/qEDR0HAIe68Os+VJTlpMgY9sD77dAM88hbiVmo=;
 b=YnRWBHFD9ALEG/IxIbbNeLz980HBCc79iJd+MOXAeZlZfUwyq/EoJ2kdEf7chSrnLuEDQM
 kKa4l+3C4cDQ2QgiaoiB1yLrE783HbXliAHOPr2jYEX7skm241FthvoHhKWasHfhK1+L2P
 mFVa06VEjrJry6/FbrGzgtbWJyfVmMM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-xqV0rEhnMICOoDhIJe0awA-1; Mon, 11 Jul 2022 16:38:58 -0400
X-MC-Unique: xqV0rEhnMICOoDhIJe0awA-1
Received: by mail-vs1-f72.google.com with SMTP id
 q13-20020a056102204d00b003572e098105so648118vsr.22
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd0e/qEDR0HAIe68Os+VJTlpMgY9sD77dAM88hbiVmo=;
 b=Py0//GQSLqwj8lToC4GHhjMseybtIIz2fgSLM4o9wb+JBiHbT00My+SwRajPO5Xm0Z
 At/IBqVN2kDRgxRDb2PusMVv02xqo7ng4AaK5yd89MdYCa5vWjrc9RB0lBBm3w4Z8/V+
 pFmwDtLzspfPMEpvlk8kGR4MGVdstzE0rmv1QLj4zv9srwV57ihmSBnqKIxol/j8/s+c
 U2o0wtyiq6G/+Bdr6W9ZS5yDcXHMwjsS0yqAA7wZPZdF5Ka/h/sSTO9xqfgVso10p8g6
 LvgnYlc/ni2EgciUNZ0PpFDqe9iRPRtVqQQLRw9gFBlc+yD4s0i9HRcwlpj3BuDH2Ysw
 zFxA==
X-Gm-Message-State: AJIora+cZ1Zrj0SD0of4DFz//ILY19eP0eR8kuPss29XOlQPWaEezd1s
 k7TgMN9p1kYdUvbhzWUEyPVSbO8DtQUoQfyhZ/yYUo31VhoU7grW5kn3sL+33VUou6eskd/qy4F
 +tkrwc02jdjgeXnJZ0Az/Y1BBnHuGlTc=
X-Received: by 2002:a05:6102:1586:b0:357:5677:75ef with SMTP id
 g6-20020a056102158600b00357567775efmr3022606vsv.61.1657571937592; 
 Mon, 11 Jul 2022 13:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTvmSeY6biNUdChFC9vyj6zBV/EsVSfn2Ef/o+MX2dnmiTBeHosC5AhnBD9QxRDPzUt2N+J817/n1m/H+rz54=
X-Received: by 2002:a05:6102:1586:b0:357:5677:75ef with SMTP id
 g6-20020a056102158600b00357567775efmr3022590vsv.61.1657571937371; Mon, 11 Jul
 2022 13:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
In-Reply-To: <20220710170014.1673480-2-ani@anisinha.ca>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:38:46 -0400
Message-ID: <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> This is initial commit of cpuid, acpi and smbios python test scripts for
> biosbits to execute. No change has been made to them from the original code
> written by the biosbits author Josh Triplett. They are required to be installed
> into the bits iso file and then run from within the virtual machine booted off
> with biosbits iso.
>
> The original location of these tests are here:
> https://github.com/biosbits/bits/blob/master/python/testacpi.py
> https://github.com/biosbits/bits/blob/master/python/smbios.py
> https://github.com/biosbits/bits/blob/master/python/testcpuid.py
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
>  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430 +++++++++++++++++
>  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
>  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
>  4 files changed, 2807 insertions(+)
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
>  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
>
> diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build b/tests/pytest/acpi-bits/bits-tests/meson.build
> new file mode 100644
> index 0000000000..3056731a53
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> @@ -0,0 +1,11 @@
> +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> +
> +copytestfiles = custom_target('copy test files',
> +  input : test_files,
> +  output :  test_files,
> +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> +  install : true,
> +  install_dir : 'bits-tests',
> +  build_by_default : true)
> +
> +other_deps += copytestfiles
> diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py b/tests/pytest/acpi-bits/bits-tests/smbios.py
> new file mode 100644
> index 0000000000..9667d0542c
> --- /dev/null
> +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> @@ -0,0 +1,2430 @@
> +# Copyright (c) 2015, Intel Corporation
> +# All rights reserved.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions are met:
> +#
> +#     * Redistributions of source code must retain the above copyright notice,
> +#       this list of conditions and the following disclaimer.
> +#     * Redistributions in binary form must reproduce the above copyright notice,
> +#       this list of conditions and the following disclaimer in the documentation
> +#       and/or other materials provided with the distribution.
> +#     * Neither the name of Intel Corporation nor the names of its contributors
> +#       may be used to endorse or promote products derived from this software
> +#       without specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
> +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
> +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
> +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +"""SMBIOS/DMI module."""
> +
> +import bits
> +import bitfields

New deps?

> +import ctypes
> +import redirect

Also a new dep?

> +import struct
> +import uuid
> +import unpack

And another?

> +import ttypager
> +import sys

What's the proposed strategy for dependency management for these
tests? I know there's some mail I'm backlogged on ...


