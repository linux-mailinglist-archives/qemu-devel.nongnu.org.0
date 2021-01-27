Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1030639C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:55:27 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4pyQ-0001G7-FD
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4pwz-0000Ok-Nr
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:53:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4pww-0000kM-Vc
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611773632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KI/DfdS0+h9aIFw3BLtsg+lirdjllb1xPcu+SewHqhM=;
 b=WrtoXTPz6P5FRwVwNWXg+ZSe8UyztuvnxCft8YRwlQ5iWUG4uZnQ6yfDtcCyvtu3TqtBT9
 kFTgfqJsSyJr4uwEDoFZYNv3DvoDldwavA0CygAEMR0b0CaUbp3Qz7FARR4YQFu3ypFTlf
 fxYYoL5REPE0m7WdyWXfnyKmRHB878s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-d00rZBhpOkK4shZtZ2UXRQ-1; Wed, 27 Jan 2021 13:53:50 -0500
X-MC-Unique: d00rZBhpOkK4shZtZ2UXRQ-1
Received: by mail-ej1-f70.google.com with SMTP id n25so1074292ejd.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 10:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KI/DfdS0+h9aIFw3BLtsg+lirdjllb1xPcu+SewHqhM=;
 b=UIVODzcfjwNASotaPOsauNW55vHya8Xmj8ILTk05hEbO4mAXeiIJNGPKPG5hTTg4+u
 WZEJiY/x17g3ZZtMZTV27roP+R4phtin6jGdKjrDWtSZyFTyF/zPEJ+1u9Zv66rvZbLH
 MYLN5cB9OOhYWKarEUeMUYAzul7v7KjWUdL4POVvlc/anoxoQHo051e5VqX9xAVFGo8D
 JeGSU3HMSKyIgO4o/TWnudT5CqH78B7F/65DMA6Js3l99qqwZg83MOd6e2liih5bQzvR
 D7tgaRSgGTAzMKkfpVNq+Csspvam2Y7D39yg+GmsCTtcRtdv7NUAXi9ZTrPpjE/DlZHI
 plSA==
X-Gm-Message-State: AOAM532ZDQ02zYPnSYllgjvO1eRoHpEEqMyuBhfM77X6VfOrPDrosQLo
 CMy+804HpZYdPjZH6U87lbs/g5ZL5q391F9sP+hJm+HvxRqzA85HU/GqXwcqiVW2cjLojnxTNln
 7LeMQHO6a8vwXd0Y=
X-Received: by 2002:a17:906:2c0e:: with SMTP id
 e14mr7655593ejh.299.1611773629101; 
 Wed, 27 Jan 2021 10:53:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRH6rNx7d2GxY11lHvVFdmDOhn7tjtS9a7txGNcsXiOGwlna9vD4VYe+XSd7WyVXOssr9TRw==
X-Received: by 2002:a17:906:2c0e:: with SMTP id
 e14mr7655580ejh.299.1611773628851; 
 Wed, 27 Jan 2021 10:53:48 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm1807888edm.6.2021.01.27.10.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 10:53:48 -0800 (PST)
Subject: Re: [PATCH] ui: update keycodemapdb submodule commit
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210127180843.3820964-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef824b15-8fa6-fa8a-cd66-2057c7d9c332@redhat.com>
Date: Wed, 27 Jan 2021 19:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127180843.3820964-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:08 PM, Daniel P. Berrangé wrote:
> Primarily this is to pull in a fix for Win32 keycodes. The other useful
> change is the removal of build timestamp from generated files which is
> desirable for reproducable builds.
> 
> The make rules need updating due to slightly changed CLI syntax - more
> args must now come after the command name.
> 
> 6119e6e19a050df847418de7babe5166779955e4 Fix scan codes for Korean keys
> 685684a8404301780714e8a89a871981e7cae988 Fix argument order in output headers
> b3774853042c951b200d767697285781cc59a83c Add HTML entries for Korean layout keys
> 8e54850d800e4697a2798fb82ac740e760f8530b Add macOS entries for Japanese keyboards
> 27acf0ef828bf719b2053ba398b195829413dbdd Fix win32 keycode for VK_OEM_102
> 317d3eeb963a515e15a63fa356d8ebcda7041a51 Add support for generating RST formatted docs pages
> 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352 Introduce separate args for title & subtitle with docs generator
> 6280c94f306df6a20bbc100ba15a5a81af0366e6 keymap-gen: Name sections in pod output
> df4e56f8fab65ba714ec18f4e7338a966a1620ad Add an empty meson project
> 16e5b0787687d8904dad2c026107409eb9bfcb95 remove buildtime from generated files
> 044f21dd0d4f62519aae9f1d53a026407a0b664f add header file generators
> 7779876a6b06755e3bb2c94ee3ded50635bcb0fa c++: add extern declaration to the generated file
> 0e0a317889464397d6f1ae03aad0d2ca593aab04 move CLanguageGenerator closer to CLanguageGenerator itself
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  ui/keycodemapdb | 2 +-
>  ui/meson.build  | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> index 6b3d716e2b..6119e6e19a 160000
> --- a/ui/keycodemapdb
> +++ b/ui/keycodemapdb
> @@ -1 +1 @@
> -Subproject commit 6b3d716e2b6472eb7189d3220552280ef3d832ce
> +Subproject commit 6119e6e19a050df847418de7babe5166779955e4
> diff --git a/ui/meson.build b/ui/meson.build
> index 634fabab0d..156b600a99 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -127,9 +127,10 @@ if have_system or xkbcommon.found()
>                    capture: true,
>                    input: files('keycodemapdb/data/keymaps.csv'),
>                    command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
> +                            'code-map',
>                              '--lang', 'glib2',
>                              '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
> -                            'code-map', '@INPUT0@', e[0], e[1]])
> +                            '@INPUT0@', e[0], e[1]])

This matches with 685684a ("Fix argument order in output headers") indeed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


