Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938C37BB76
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:11:33 +0200 (CEST)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmm4-00064W-M1
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgmjl-0005La-2n
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgmjf-0006da-R8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620817742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YpHWP7ODinesTWuvWoNn7oDdEASe9EMSWEBdDnczNo=;
 b=EFaFsiinMvEd6VeMSUVaG1ROiPLkxz8wMqeNIoi6MyDZdQI84lcXYYwUPX83GRVKe7UtVu
 FVJYyTjhYbccLmga+nDCwgfZMkthQ1ucyPGdkOC4m4DcQBrRaSsDR3M8pkwsq3CObGtwzF
 mGsGELMsDrULNdnFQw2F+Xu33kwJwdo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Sln3T6J_OkqIS6-R-ssA_Q-1; Wed, 12 May 2021 07:09:01 -0400
X-MC-Unique: Sln3T6J_OkqIS6-R-ssA_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso9969414wrf.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0YpHWP7ODinesTWuvWoNn7oDdEASe9EMSWEBdDnczNo=;
 b=U4PwI3eBWdfzZQSPau+zHT5Gf2wqfrvzKhH8+s8g5hmivw7HY8BvNrhf7Z95CgSJE6
 PI9BBSCwWB683nQ9tY+HbKS/YXiPVJNS+S+xWRD5qU2CkzbbKkdVVWHaZdvsQSUsxoab
 k5S1BekTJG+cBkHzQlmU96t88bk4/N9gJ/rq0+ItC0zJJ678Ydtp0FUWwAjPEvFFquEb
 FBElEa+6miMVnpReKmt88w9CeRj2SVO3SeCCxwcZaGEZZsGG1b3RhHI/tw2i+wGqlnLf
 VBzvqH1EJClE/fOU0sHUbXWfvATG2AsZ36Qd7zGCCoBcUBZ4u88YeV8s2pIC+wLuqFU3
 wqLA==
X-Gm-Message-State: AOAM533D1rNnizDZ4iD0H0eXbyDczfOFBjD54jyXwHbC5vOeN6RLZ2hj
 6AZTR/3sFlNOt+Jm6vwYLZ1IUQgH9oqs4lGDxLLruqTQhgo28EExrGqnjbDHl/k0IWrjBryFMOy
 YrfiGi3CYmcdRMBc=
X-Received: by 2002:a5d:54c2:: with SMTP id x2mr43217936wrv.278.1620817739763; 
 Wed, 12 May 2021 04:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy22tKvdcUOC/KAfRG6x/sWsGzvAt4EJog8Mj2lJmdLQTe5/oJ3AMxtwuBE68VnFDkksR2bGg==
X-Received: by 2002:a5d:54c2:: with SMTP id x2mr43217911wrv.278.1620817739564; 
 Wed, 12 May 2021 04:08:59 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f4sm31971859wrz.33.2021.05.12.04.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 04:08:59 -0700 (PDT)
Subject: Re: [PATCH] add Visual Studio Code configuration
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210512100906.621504-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68f9e434-352d-e98c-9bd1-2fd291d2d9be@redhat.com>
Date: Wed, 12 May 2021 13:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512100906.621504-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: eesposit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On 5/12/21 12:09 PM, Paolo Bonzini wrote:
> Add configurations to build files with Visual Studio Code and
> to retrieve the search path for headers from the compile_commands.json
> file.
> 
> Using this configuration requires installing the Meson extension

maybe add "(@id:asabil.meson)" because there is another extension
called meson.

> and
> using a build subdirectory that matches the one configured in the
> Meson extension itself.

But first we need the ms-vscode.cpptools extension.

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .vscode/c_cpp_properties.json | 13 +++++++++++++
>  .vscode/settings.json         | 11 +++++++++++
>  .vscode/tasks.json            | 23 +++++++++++++++++++++++
>  scripts/rebuild.py            | 22 ++++++++++++++++++++++
>  4 files changed, 69 insertions(+)
>  create mode 100644 .vscode/c_cpp_properties.json
>  create mode 100644 .vscode/settings.json
>  create mode 100644 .vscode/tasks.json
>  create mode 100755 scripts/rebuild.py
> 
> diff --git a/.vscode/c_cpp_properties.json b/.vscode/c_cpp_properties.json
> new file mode 100644
> index 0000000000..43f5fc1b4d
> --- /dev/null
> +++ b/.vscode/c_cpp_properties.json
> @@ -0,0 +1,13 @@
> +{
> +    "configurations": [
> +        {
> +            "name": "qemu",
> +            "includePath": [ "${default}", "${workspaceFolder}/linux-headers/**", "${workspaceFolder}/include/**", "${workspaceFolder}/+build/**"],

Not sure about +build... This produces:

Cannot find "/home/phil/source/qemu/+build/".

> +            "compileCommands": "${workspaceFolder}/${config:mesonbuild.buildFolder}/compile_commands.json",
> +            "intelliSenseMode": "linux-gcc-x64",
> +            "cStandard": "c11",
> +            "cppStandard": "c++14"
> +        }
> +    ],
> +    "version": 4
> +}
> diff --git a/.vscode/settings.json b/.vscode/settings.json
> new file mode 100644
> index 0000000000..efbbb4f88b
> --- /dev/null
> +++ b/.vscode/settings.json
> @@ -0,0 +1,11 @@
> +{
> +	"files.associations": {
> +		"*.mak": "makefile",
> +		"*.c.inc": "c",
> +		"*.h.inc": "c",
> +		"*.json": "python",

When opening .json I get many:

"true" is not defined (Pylance reportUndefinedVariable)
"false" is not defined (Pylance reportUndefinedVariable)

> +		"*.rst.inc": "restructuredtext",
> +		"*.vert": "glsl",
> +		"*.frag": "glsl"
> +	}
> +}
> diff --git a/.vscode/tasks.json b/.vscode/tasks.json
> new file mode 100644
> index 0000000000..362821043e
> --- /dev/null
> +++ b/.vscode/tasks.json
> @@ -0,0 +1,23 @@
> +{
> +	"version": "2.0.0",
> +	"tasks": [
> +		{
> +			"type": "cppbuild",
> +			"label": "C/C++: build active file with compile_commands.json",
> +			"command": "python3",
> +			"args": [
> +				"${workspaceFolder}/scripts/rebuild.py", "${file}"
> +			],
> +			"options": {
> +				"cwd": "${workspaceFolder}/${config:mesonbuild.buildFolder}"
> +			},
> +			"problemMatcher": [
> +				"$gcc"
> +			],
> +			"group": {
> +				"kind": "build",
> +				"isDefault": true
> +			}
> +		}
> +	]
> +}
> diff --git a/scripts/rebuild.py b/scripts/rebuild.py
> new file mode 100755
> index 0000000000..e35e08f42d
> --- /dev/null
> +++ b/scripts/rebuild.py
> @@ -0,0 +1,22 @@
> +#! /usr/bin/env python3
> +#
> +# Author: Paolo Bonzini <pbonzini@redhat.com>
> +#
> +# This program compiles the input files using commands from the
> +# compile_commands.json file.  (Unlike Make/ninja, the _source_
> +# file is passed to the program rather than the targe).  It is

Typo "target"

> +# mostly intended to be called from editors.
> +
> +import os
> +import sys
> +import json
> +
> +with open('compile_commands.json') as f:
> +    cc_json = json.load(f)
> +
> +paths = set((os.path.relpath(i) for i in sys.argv[1:]))
> +for i in cc_json:
> +    if i['file'] in paths:
> +        os.chdir(i['directory'])
> +        print(i['command'])
> +        os.system(i['command'])
> 

I got these warnings:

[5/12/2021, 12:24:04 PM]
"${workspaceFolder}/builddir/compile_commands.json" could not be found.
'includePath' from c_cpp_properties.json in folder 'qemu' will be used
instead.
[5/12/2021, 12:24:04 PM] For C source files, IntelliSenseMode was
changed from "linux-gcc-x64" to "linux-clang-x64" based on compiler args
and querying compilerPath: "/usr/lib64/ccache/clang"
[5/12/2021, 12:24:04 PM] For C++ source files, IntelliSenseMode was
changed from "linux-gcc-x64" to "linux-clang-x64" based on compiler args
and querying compilerPath: "/usr/lib64/ccache/clang"

Then when pressing Ctrl+Shift+B to run the build task:

> Executing task: C/C++: build active file with compile_commands.json <

Starting build...
python3 /home/phil/source/qemu/scripts/rebuild.py
/home/phil/source/qemu/builddir/meson-info/meson-info.json
Traceback (most recent call last):
  File "/home/phil/source/qemu/scripts/rebuild.py", line 14, in <module>
    with open('compile_commands.json') as f:
FileNotFoundError: [Errno 2] No such file or directory:
'compile_commands.json'

Build finished with error(s).
The terminal process failed to launch (exit code: -1).

I don't see any target in the Meson view.

BTW I also installed the 'ms-python.python' extension and
got 'ms-azuretools.vscode-docker' suggested.

Regards,

Phil.


