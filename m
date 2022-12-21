Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32272652AB4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nWt-000201-Jx; Tue, 20 Dec 2022 20:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nWs-0001ze-1E
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:04:18 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nWp-0003cT-VE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:04:17 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso2244534pjb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=piqH7YD4unzGrRvMOF3nwvHTOkxfYWuU4XTFusVJrVU=;
 b=jctvinIHSrg4T1aiLd4Jyo8fGVErVDZNn019tqi3OCq/vOB1avZTVS9R3EjoJJu0iy
 MfdfdlumB/TDpw9kMI5qDkyNlGAyZUbvCjFMYFIJlgABPn6Db1XwztorAcCmgkZtJSOv
 vwR264EdQtVBOD8IwTEUcDyB//Hx/cUaVYN4qWsCfjnoX2/cuUcbEoki7O9Nt+gOVhev
 yupRyLAoKPwcyHP8vIEqcCq8OHKlNSubROFIej1tWj3ULPbHOer0CgMYFyBNJQZnIZma
 KiLAP0zHEvgqEqJEEDtrzgsW0zIHCQVYk/8hI1Ge+XDIAXqcktv3SG8xEar0udO53UkE
 HfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=piqH7YD4unzGrRvMOF3nwvHTOkxfYWuU4XTFusVJrVU=;
 b=kvIdpjEbvR8E0R5CK6wBImG9cUmgYbMK9Cp2NyeyF+2/QL4W6R6zaQTRXUEcyiZhaN
 7l3bSlj7rnDq1dNChANHyW2/RDfa4c8yhFgHNPQm72CTzMoDiBAXq0oZGuyIUZTzpMGG
 fMLXGE1InVgtrO7LkfS2OQp68xAGINdDk3IJ55nHIMeeb/c4roDjIeOkOhOoe7OqXbyz
 47Fgmqp9nKvln396oez7a5KhzMFivnPXOENV1zQtYgiezhjBk/ClZI7kxHWtVZozwFvt
 sr2bfqQHJDgoxp+1M86l2oSJD0k3DyXwy6VGc+ZSm8XYdCJhPsInyWUQk9poBwxD6o36
 2poA==
X-Gm-Message-State: AFqh2krWG4AkLSnAE1MrFrp6+TVYZrwAVB4WjngjO2Aoz2C1r4XwnkI8
 Q6WMohMzYmjtfn5d7jrbV5pR4g==
X-Google-Smtp-Source: AMrXdXvUt6HjzUxrsZqCio0mQGQy3RJBJ27NrPofQj2vaACXeVwx+xQv1ompGj+VvGropIKB0Q4Mng==
X-Received: by 2002:a17:902:bf43:b0:185:441e:2d77 with SMTP id
 u3-20020a170902bf4300b00185441e2d77mr78843pls.14.1671584654173; 
 Tue, 20 Dec 2022 17:04:14 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902ce8700b00186b758c9fasm10051425plg.33.2022.12.20.17.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:04:13 -0800 (PST)
Message-ID: <4dfaeb0f-8173-0123-e7f6-2180a53eb313@linaro.org>
Date: Tue, 20 Dec 2022 17:04:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] trace: Do not try to include QMP commands in user
 emulation binaries
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20221220150417.26751-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220150417.26751-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 12/20/22 07:04, Philippe Mathieu-Daudé wrote:
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

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

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
> +  trace_ss.add(files('qmp.c'))
> +endif


