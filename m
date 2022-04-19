Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2C507A24
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:20:38 +0200 (CEST)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtOv-0004la-G4
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtLu-0003Zm-Tz
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:17:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtLt-0007hW-9C
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:17:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso2265286pjk.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VuX3gYmVbGXS9mQuUS/mZkASheSj1DBGLPk1jrmHzQ0=;
 b=xVQJ8EjpXKBSnc1nsOlAFiYkvd8n0TaYVqtE0mX4IRJIVqFFtq1HcslXcofJAfEHwI
 upNT70sKuKekohST3h6KfVksZcVqK9gsbKNVPU8Ogb1fmWOAn9iKuyyFrbUKhPRedpZG
 I4wNxGNK4SehvPn4AXPpeCY9xSvE4Fm2uhlMmtNNpYgH+LlMtei0q+yiJQ9p0nyXIi3j
 G4tFXasiI9ShBLe1cheGipp6aS7Yr7SPge22b3UQi6jHC22WUbsCxWRHWkxecXvvWfSm
 fdkqUgvvIj+lNseI6Xzk0LSXZ9XX+kTDScQNtnShmaglUGhb++gGYbcB6XFW4GVDLSA4
 4h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VuX3gYmVbGXS9mQuUS/mZkASheSj1DBGLPk1jrmHzQ0=;
 b=XJJ8p026ICBCQca4Ell2lz65Hu6icI2r+QFJk1z9V6a5YxtA4bk4AMJBbPlnHIRHow
 cl26F6J1hMLPtpgud4juKaRW7kwIVK3Muqeia3Zowo+F7v3EX9zI3UXVAyl/LywKl2A7
 sJpPXWEwBfyNbTYG/dQTC9MjBvOJx016NljXU8O2AjxwYe7IN+r6PhPa/8e+5C5b/qmI
 MFoj1Vo0pFFbiwhV44m2qlTu6ehzJvLZlZYZBLfnuBmRFYzZoI8ZvTLHHaU8gsB5vp4P
 O82x1LG13K2i5luO3Ew+0TPrbXtBIFBkBWzcSRaYIPFMLrWmrMzjc4kW1XroXoxSGQQ+
 M8dg==
X-Gm-Message-State: AOAM5313P0+AGe6NPbOywcS8JKwD9FTPSve3uHkFsHKt4rMv090qXxVL
 GmrOzKxdnsCGOUmvWx4mrHE/1Q==
X-Google-Smtp-Source: ABdhPJya9U5Qql+rfgAKrv7NkUgfSe8bXvsW+igVY0D4gNbrrLvEGpEGsuHVVYxXs9RUfti/sp32qw==
X-Received: by 2002:a17:90b:4c06:b0:1d2:5e99:a89d with SMTP id
 na6-20020a17090b4c0600b001d25e99a89dmr81078pjb.231.1650395845887; 
 Tue, 19 Apr 2022 12:17:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 r31-20020a63205f000000b0039db0514016sm17083791pgm.29.2022.04.19.12.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:17:25 -0700 (PDT)
Message-ID: <eaba5f28-cb18-1b1d-30df-2db5ca31f9f6@linaro.org>
Date: Tue, 19 Apr 2022 12:17:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 23/25] tests/tcg: add missing reference files for
 float_convs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> We might as well include a reference file for i386/x86_64. I was going
> to include s390x as well but it's broken hence I raised:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/979.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/i386/float_convs.ref   | 748 +++++++++++++++++++++++++++++++
>   tests/tcg/x86_64/float_convs.ref | 748 +++++++++++++++++++++++++++++++
>   2 files changed, 1496 insertions(+)
>   create mode 100644 tests/tcg/i386/float_convs.ref
>   create mode 100644 tests/tcg/x86_64/float_convs.ref

Are we forcing SSE math for i386?  Otherwise this isn't quite testing the same thing.  Not 
that we shouldn't test floatx80, but...


r~

