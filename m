Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090A652373
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eD9-0003Zu-0v; Tue, 20 Dec 2022 10:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eCX-0003P5-KL
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:06:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eCS-0006iO-F9
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:06:41 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so9032358wml.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OoANko0cRupSYhuCHxLg9Nhfmt17Q20VSQpiBS+ll4s=;
 b=FGcWPBQgpcTefOt32Lc8lhQAXjhEMXSDy9nRvDV1U7R+LU+p69JzDNaYQeuCF3RfRK
 +cD+8HsFcbln5F0FTu4IHage/Lk/aWk4cX0/SCKcwQRqYoAc+35zSeoy2H8Wods5cuYr
 axXjTW21k0ttw9CHyFrPaa0HB4uuRXQ/7EXtfzl+MLZRCLwne00AWpXWVU5KD/XSZqaA
 O8oVN0MRuvzMFYl7iPIFY3HDsUIb3J0ThJw3JWbwtvlBWHOTF8XTKrILmx3/4VnZjlmk
 l5v+bg2hDJQFg7EuWh14QSG7kWl0txSMSAklQ2VauAlohD0hgK9Uol9iPCV7lf/L6D3P
 Wn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoANko0cRupSYhuCHxLg9Nhfmt17Q20VSQpiBS+ll4s=;
 b=TdGDHOVpyNw6HmguYMb7z5NEFP7oswl4+3tK3VzLCUDFusx7rJeIAleYORs/5lOFYB
 MpFlgtSYEvDZPGlQB4+cZfqVV4A1VlPjFrzPzvPhyW08pG3ozQhZooKbVUs+VtIU5Iuq
 8XNfXdHsSf6hmEeFDh3VhT1bGEmFfs1SuKQAbt85AZFW7pnvfQzy4CEzo/xdoM7UBnjV
 Lsy6PDQKlY7HMpEjYunPtlZxc045uH0Ol8sNw4cL/PJVjjkIaOMmp30BFgiKYztnview
 FLhJ7Er/XevEk48qthGDmtilKXxr0X7hGwUMI/ZNIHP0RtRb6BaipFrApKFvxHRxLTz8
 Rrog==
X-Gm-Message-State: ANoB5pmPRFTe+05SbvsGdmTNnF6g024DsX1ccbyb11rB/vl2ahuQO68t
 GaGlHuDq6gLHAFCwkef2t6O1xG0vIT++IQQFLY8=
X-Google-Smtp-Source: AA0mqf6kXkzmeHgb9IxLhm3EDfIMxTT2cXUpEamwNS78twY/a2gvFxWsk5HlVLzAGt6PEbbx2470yg==
X-Received: by 2002:a05:600c:33a5:b0:3d2:3eda:dd1 with SMTP id
 o37-20020a05600c33a500b003d23eda0dd1mr16045763wmp.17.1671548794198; 
 Tue, 20 Dec 2022 07:06:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b003d23a3b783bsm18210144wmq.10.2022.12.20.07.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 07:06:33 -0800 (PST)
Message-ID: <091fed13-063f-b3ad-806d-0822be444d4c@linaro.org>
Date: Tue, 20 Dec 2022 16:06:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] trace: Do not try to include QMP commands in user
 emulation binaries
Content-Language: en-US
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20221220150417.26751-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220150417.26751-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/12/22 16:04, Philippe Mathieu-Daudé wrote:
> QMP is not available on user emulation; there is not monitor.
> Besides, since commit a0e61807a3 ("qapi: Remove QMP events
> and commands from user-mode builds") we don't generate the
> qapi-commands-trace.h header in a user-emulation-only build.
> 
> Remove the QMP trace commands from qemu-user binaries.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   trace/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/trace/meson.build b/trace/meson.build
> index 26b54714d5..4385afbff0 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -88,4 +88,6 @@ if 'ftrace' in get_option('trace_backends')
>     trace_ss.add(files('ftrace.c'))
>   endif
>   trace_ss.add(files('control.c'))
> -trace_ss.add(files('qmp.c'))
> +if have_system or have_tools or have_ga

Maybe this pattern deserves adding a variable similar to:

   have_monitor = have_system or have_tools or have_ga

> +  trace_ss.add(files('qmp.c'))
> +endif


