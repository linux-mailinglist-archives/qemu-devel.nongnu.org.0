Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42257A171
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:27:51 +0200 (CEST)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoCT-00076J-Tg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oDnmX-0006H5-6a
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:01:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oDnmV-0004Tu-6i
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:01:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id r24so922439plg.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vj6tc7D49uxbhDtdddtvfcySPy89ynlQwOirpXagsNo=;
 b=jUpGPUXQP9NvfDXeouNpp/EKLphVXXS8WKABlOvT39KxVG5SfomKQgJhWAE2lCDeLY
 RSq9tyN/+5tct0hOXM2xeoVJmMSshWpGAA9ZvGInD4vuay/ioadtWJeaHqBJBCPz5w6D
 qLYTBjZ0cOJ2fkzmTQLVE+3eKuzjzdNnhRUiTcYtfMaDPyIPmsRpPEPO9osRZV3UHlOq
 o1R1FmZ8NrbE9mpO2MfVH6LRSm3TONMmQNqDqB2i9McA+IFm1O67NFNMOYGlym+L5yHO
 1ugofK6h8x+Tx68YqxSJt1YUwA1BrWwL1OJhTYo6n2xvMEZ79aXt5U00/eeM0y1+gQ0H
 MqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vj6tc7D49uxbhDtdddtvfcySPy89ynlQwOirpXagsNo=;
 b=2kQRCqEOzZWc7vgnaII7BwT3nP0R16odi366kR5ZSf2l3dgdGrouyaje5uiX+75iqz
 0z0FFGbpCebcy2wanKziRgTjbdX4KX/RQSyk3dfcMZ5Yzz4re6i9fnpuFICZ3pog8YJf
 8isPbVnYAjGZrJqBPheUFItgmchrF455E/1NxK1i6Kl83vZfyplJQyGPGUZObPGmcbIl
 GavUXbu5fy4iUQhhwGPI/7n3Mt9iSBrCjfzI+PMe54dvGOgyTgTsXrHe+wAQCNqWgPwp
 AbSQyDP8F3yshxvSDYWIq01ngCBgarwQu0jxiTuTHIcJpkxA+6Sf7aRdjp0xeZrUtuhR
 pKUQ==
X-Gm-Message-State: AJIora9s3qjpRD2DKuDWqcTd+9X/gjhyVcDU6K0Ln/T7xgGqJ8EVVIuG
 fngTyhoKN32zmtlE79IDkQ4=
X-Google-Smtp-Source: AGRyM1vp8CzeEDcGsmhWU4pigvEXObP10CnteJZZH3l6dW67XJBTIFVJ281EqlQJfqLSc2upWwNZXg==
X-Received: by 2002:a17:903:11d0:b0:16b:80cf:5d9 with SMTP id
 q16-20020a17090311d000b0016b80cf05d9mr33897780plh.91.1658239257207; 
 Tue, 19 Jul 2022 07:00:57 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902d2ca00b0016a11b7472csm11788884plc.166.2022.07.19.07.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 07:00:56 -0700 (PDT)
Message-ID: <aaca288b-30f9-2db5-9280-0e29e35d07c0@gmail.com>
Date: Tue, 19 Jul 2022 23:00:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] docs: Add caveats for Windows as the build platform
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20220719135014.764981-1-bmeng.cn@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220719135014.764981-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/07/19 22:50, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Commit cf60ccc3306c ("cutils: Introduce bundle mechanism") introduced
> a Python script to populate a bundle directory using os.symlink() to
> point to the binaries in the pc-bios directory of the source tree.
> Commit 882084a04ae9 ("datadir: Use bundle mechanism") removed previous
> logic in pc-bios/meson.build to create a link/copy of pc-bios binaries
> in the build tree so os.symlink() is the way to go.
> 
> However os.symlink() may fail [1] on Windows if an unprivileged Windows
> user started the QEMU build process, which results in QEMU executables
> generated in the build tree not able to load the default BIOS/firmware
> images due to symbolic links not present in the bundle directory.
> 
> This commits updates the documentation by adding such caveats for users
> who want to build QEMU on the Windows platform.
> 
> [1] https://docs.python.org/3/library/os.html#os.symlink
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Changes in v2:
> - fix typo of "preferred"
> 
>   docs/about/build-platforms.rst | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index ebde20f981..6b8496c430 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -94,8 +94,16 @@ not tested anymore, so it is recommended to use one of the latest versions of
>   Windows instead.
>   
>   The project supports building QEMU with current versions of the MinGW
> -toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
> +toolchain, either hosted on Linux (Debian/Fedora) or via `MSYS2`_ on Windows.
> +A more recent Windows version is always preferred as it is less likely to have
> +problems with building via MSYS2. The building process of QEMU involves some
> +Python scripts that call os.symlink() which needs special attention for the
> +build process to successfully complete. On newer versions of Windows 10,
> +unprivileged accounts can create symlinks if Developer Mode is enabled.
> +When Developer Mode is not available/enabled, the SeCreateSymbolicLinkPrivilege
> +privilege is required, or the process must be run as an administrator.
>   
>   .. _Homebrew: https://brew.sh/
>   .. _MacPorts: https://www.macports.org/
> +.. _MSYS2: https://www.msys2.org/
>   .. _Repology: https://repology.org/


