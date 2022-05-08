Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CC751EB30
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:09:17 +0200 (CEST)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXIK-00017q-T8
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXH5-0000RT-0f
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:07:59 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXH3-0007A4-6W
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:07:58 -0400
Received: by mail-pg1-x52d.google.com with SMTP id v10so9281979pgl.11
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=p7SHe6oUR+rf5lB2qsNJQVXUb7kfZgkc1tCJ/Oi8PHc=;
 b=arI/PgZU4To0Z0tKBR4XHt1Z2TAHO16uX2pNWlFrcRp4aD5UcfWjiG0iMAK5/ar31u
 y26W50ShQM3n4w0Wvk/xDRqVtFutglKVrw7vewKtk5JH3Mu/ezdnZ2IWKYf06um0XceZ
 8i9WV/QG3/JHpVrhhIOagP2i6olBgFIpV2AsBgKzmzbLGRvQCu2jaQ+P73vet23aAcD7
 9dNObsPC/ij2Yl8a0VGCFnlo6JKHDcgM2rEp0EaF2xF3TQyv+awSaopgt6XtFbHN/z2F
 CvO8xR4n3Uz+ejYw5Pe4NIfqXLBSGWjpXlJmXbdfzmPR9QQYijpTJoLwO1+QPT4xE8se
 o2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p7SHe6oUR+rf5lB2qsNJQVXUb7kfZgkc1tCJ/Oi8PHc=;
 b=eFf/DrDT0xS8YlWOjLF1DuYNgUn9DOrqv3MRS/AuH1pBMdC3RIAYZs5HrWIoSn0/M1
 GLww/bWcS3o9hLIxwTtylfQnkYD8wgKc8QNj5oiYbc1ImjIq4ZrzRuzsaWSew8eZuHC3
 KnrQe6/eSJmyMsNr0Y2ag1GZ0m+8+GvdJz2V8lZsX9P+0GzZvzaa1cqa6nUM+s0TWQ/b
 Leokq8TLr+vdVabmSmIYtwGQ8oAQncfTL8PkOeJ1w2Xw6IfTERqr9uY6EYyBOQYuDaXe
 QVpQQvcWTNf+DOpP/TcCkTBC6sfGCaV92ZEAdcx4FawxhbbPhuWQzm5/N0wYe6V28tGh
 5WQQ==
X-Gm-Message-State: AOAM532eymBWz9oVTNS5TnKKz6CM7wG4KkWCzgOqCw6PYQMWNPzKyvfm
 7wRo5rzxueFpCzJOG1riaFC+pD7i1i1M0A==
X-Google-Smtp-Source: ABdhPJw0RQQqxJpzTnEHeUjh88H/LYGYU8nQvGdNYLVog/lsCepSg8QvxCv9nMR7hHhsH5sfKO36Uw==
X-Received: by 2002:a63:6a82:0:b0:3bc:321e:6d54 with SMTP id
 f124-20020a636a82000000b003bc321e6d54mr8466387pgc.232.1651979275683; 
 Sat, 07 May 2022 20:07:55 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 l11-20020a170903120b00b0015e8d4eb21esm4366159plh.104.2022.05.07.20.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:07:55 -0700 (PDT)
Message-ID: <e3dd0ee0-d805-d5a2-464c-3b4478925303@linaro.org>
Date: Sat, 7 May 2022 22:07:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 42/50] lasi: move from hw/hppa to hw/misc
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-43-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-43-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Move the LASI device implementation from hw/hppa to hw/misc so that it is
> located with all the other miscellaneous devices.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   MAINTAINERS                         | 2 ++
>   hw/hppa/Kconfig                     | 1 +
>   hw/hppa/machine.c                   | 2 +-
>   hw/hppa/meson.build                 | 2 +-
>   hw/hppa/trace-events                | 5 -----
>   hw/misc/Kconfig                     | 3 +++
>   hw/{hppa => misc}/lasi.c            | 3 +--
>   hw/misc/meson.build                 | 3 +++
>   hw/misc/trace-events                | 5 +++++
>   {hw/hppa => include/hw/misc}/lasi.h | 0
>   10 files changed, 17 insertions(+), 9 deletions(-)
>   rename hw/{hppa => misc}/lasi.c (99%)
>   rename {hw/hppa => include/hw/misc}/lasi.h (100%)

I don't understand hw/misc, or why this is a better categorization than hw/hppa.


r~

