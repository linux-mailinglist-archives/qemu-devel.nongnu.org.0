Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2D3229C9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:58:03 +0100 (CET)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWKI-0002qS-R7
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEWIs-0002Fu-Ag; Tue, 23 Feb 2021 06:56:34 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEWIo-0001Ld-UY; Tue, 23 Feb 2021 06:56:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id d11so4724261plo.8;
 Tue, 23 Feb 2021 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PXFyo0fuv8jnsWZ01bGHl1Ugcs8Arvd+rz+qu2RPvEM=;
 b=U4LFMjR8y4mbb058lAaEBxy+7FoQZsS/RRL6p56ZkRtOpACd+OiBbbwT1SZ3loU7Mf
 dJjP1BMtveDZMIhMUqYcZJaidMcOoUhPwLLfIiSLyfyVJ7aM+Z660x+1x4mkyLzakZfF
 Dn8QFe7Skk3sOuYXmvP/mX8JADJXavKIdLeTjv/GXRc9tWn0N0ooRWxGIX8om2g5lELl
 pMH/AUHGTXzPecfUI7NvqZ02sODJc994zm88O5Iq6x7NwRFuBhz5wwXOXA4YTfPJqm3X
 NXmwrifpxtMxx2YLkRgRNxul8PgLSNEmDSxDKuYTWgaz3cOiY5nTqG5tWCU8GvOwtcmo
 sR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXFyo0fuv8jnsWZ01bGHl1Ugcs8Arvd+rz+qu2RPvEM=;
 b=bkmuig50oLbSsH7I3Yo7nCyeJVRX4r35sNGZFgtwywckdBQaEM6VgsYEMIkyj7aK4s
 MCOUUod4jbkYVsVc2DnYbxzv0CPkkL99sfkCyUDjBrVB0nQ0HEEqdasHpHnH8atPKoTF
 0GKcKhhihlzuLgsy7Nz5NwCkrSnDlN1NsjZvETTH/C2ZOfuTLLJas9rnTI/3eHsha4Cg
 X2dwUDGNs+LFsrPvpEzitSxGp0PN6w+30FG3u1+0XYgxHvbcTz4rDNYquXP/EfHEQOx8
 jIi2rIIpWQQ+GVmrPNXiF5ZYMx16/UergXcJofjUCwQA8LjDwRB93YDoXL0j6rEiuM+6
 DedA==
X-Gm-Message-State: AOAM531zX2iEOfn9J0uJPk5xeLEwproqIdEum19bbZDnYEaZv2Zvkxe3
 Yv54hsQfH5anX3KbRwQC7HE=
X-Google-Smtp-Source: ABdhPJxl1NpgyjVl/0sdylSoZAWbjdKZJnDHm4N9KmZKpOLQOvklDKJba3g9w9WegJyOVTrDbrbBvg==
X-Received: by 2002:a17:90b:3892:: with SMTP id
 mu18mr28696287pjb.143.1614081389156; 
 Tue, 23 Feb 2021 03:56:29 -0800 (PST)
Received: from [10.0.2.15] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id j3sm21312811pgk.24.2021.02.23.03.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:56:28 -0800 (PST)
Subject: Re: [PATCH v6 01/11] hvf: Add hypervisor entitlement to output
 binaries
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-2-agraf@csgraf.de>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-ID: <a41a39e5-951f-c178-d50e-6041eec63cbe@gmail.com>
Date: Tue, 23 Feb 2021 20:56:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210120224444.71840-2-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I use your patches when running QEMU on M1 MacBook Air.

I noticed that the installation process corrupts the code signature 
because meson modifies the file to fix dynamic shared library install 
names. Also, stripping apparently does not work because the signed file 
is not considered as "executable" by meson. Here is some change I wrote 
for my own use, just for reference:
https://github.com/akihikodaki/qemu/commit/6a9b5d7e4ea03b1e757be1eedf256871bb6a5bdd

Also, the patch series do no longer apply to master. Here is my merge 
with conflict resolution (It is not a rebase and was done for my own 
purpose. Just for reference.):
https://github.com/akihikodaki/qemu/commit/b7885e4370a2fe426e80d32afe6eb5d01a71640d

Regards,
Akihiko Odaki

On 2021/01/21 7:44, Alexander Graf wrote:
> In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
> respective entitlement. Add an entitlement template and automatically self
> sign and apply the entitlement in the build.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> ---
> 
> v1 -> v2:
> 
>    - Make safe to ctrl-C
> 
> v3 -> v4:
> 
>    - Remove unused exe_full variable
>    - Reuse exe_name variable
> ---
>   accel/hvf/entitlements.plist |  8 ++++++++
>   meson.build                  | 29 +++++++++++++++++++++++++----
>   scripts/entitlement.sh       | 13 +++++++++++++
>   3 files changed, 46 insertions(+), 4 deletions(-)
>   create mode 100644 accel/hvf/entitlements.plist
>   create mode 100755 scripts/entitlement.sh
> 
> diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
> new file mode 100644
> index 0000000000..154f3308ef
> --- /dev/null
> +++ b/accel/hvf/entitlements.plist
> @@ -0,0 +1,8 @@
> +<?xml version="1.0" encoding="UTF-8"?>
> +<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
> +<plist version="1.0">
> +<dict>
> +    <key>com.apple.security.hypervisor</key>
> +    <true/>
> +</dict>
> +</plist>
> diff --git a/meson.build b/meson.build
> index 3d889857a0..c667d64498 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2146,9 +2146,14 @@ foreach target : target_dirs
>       }]
>     endif
>     foreach exe: execs
> -    emulators += {exe['name']:
> -         executable(exe['name'], exe['sources'],
> -               install: true,
> +    exe_name = exe['name']
> +    exe_sign = 'CONFIG_HVF' in config_target
> +    if exe_sign
> +      exe_name += '-unsigned'
> +    endif
> +
> +    emulator = executable(exe_name, exe['sources'],
> +               install: not exe_sign,
>                  c_args: c_args,
>                  dependencies: arch_deps + deps + exe['dependencies'],
>                  objects: lib.extract_all_objects(recursive: true),
> @@ -2156,7 +2161,23 @@ foreach target : target_dirs
>                  link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
>                  link_args: link_args,
>                  gui_app: exe['gui'])
> -    }
> +
> +    if exe_sign
> +      emulators += {exe['name'] : custom_target(exe['name'],
> +                   install: true,
> +                   install_dir: get_option('bindir'),
> +                   depends: emulator,
> +                   output: exe['name'],
> +                   command: [
> +                     meson.current_source_dir() / 'scripts/entitlement.sh',
> +                     meson.current_build_dir() / exe_name,
> +                     meson.current_build_dir() / exe['name'],
> +                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
> +                   ])
> +      }
> +    else
> +      emulators += {exe['name']: emulator}
> +    endif
>   
>       if 'CONFIG_TRACE_SYSTEMTAP' in config_host
>         foreach stp: [
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> new file mode 100755
> index 0000000000..c540fa6435
> --- /dev/null
> +++ b/scripts/entitlement.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh -e
> +#
> +# Helper script for the build process to apply entitlements
> +
> +SRC="$1"
> +DST="$2"
> +ENTITLEMENT="$3"
> +
> +trap 'rm "$DST.tmp"' exit
> +cp -af "$SRC" "$DST.tmp"
> +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
> +mv "$DST.tmp" "$DST"
> +trap '' exit
> 

