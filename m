Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE503508BE5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:15:44 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhC3T-0001of-NN
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhBqN-000527-5l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:02:15 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhBqI-0003d0-H5
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:02:10 -0400
Received: by mail-ej1-x62c.google.com with SMTP id y20so4117841eju.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qx4VajtV9dH5SyGY/AI0pomHKBXPNmKF0tHQxHhCVsk=;
 b=KtbnGQF5n+nvw+un7sJwQxaEpUAOShhyiRFbsLAtzI+05QHbPkJQjL5rhGKtYSGQ+G
 TElZBPYbcCPNqKvG0Vm4xwG6WhqXwo1ZEsM4pRDWMm/rt6RrAfuBsrMuwWWPFNGl/awf
 at9MYl7B7D/p+ohMjUazZbYJiQtahNP/Rzu1I4ifoSMG8d0rLg9Z43qJ8LUUwHXoA1D1
 UIMvIhKykDdL2MW4FsJVP9WBFXI2Y69TgZlcCxjetY7NJHz3JVGg5B6M0cLh6rqBr8jF
 xtRpgnRbUw+cQoIplX5lecDlY55RtatDRiGhZc7uFVW/I6RTSpx0tWp+ije/KZbuA0Xn
 p+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qx4VajtV9dH5SyGY/AI0pomHKBXPNmKF0tHQxHhCVsk=;
 b=DNg7JY1XeBj7ff6dX0YbFkz//VcX+6WG5GXoRmDut7X5g/r9l/nwU79kRTzz5HW+fl
 Gka2N/ngWn+wHVaHbY8p1jvDqRvB357yOB22kRJbv/Z6f0VITb7ISdg0TcIEGTCIgs0p
 IgqBrqbRecT5t/VHNYXBIYOvMrryYuCEWkYkayYQO9aNuKB7HWbzamE5AkwXOGSF3wx/
 FugdB/Lyi/uychD+09GZBcRYc1yb1PDPwsXIki1M32dE2oJsMbyTNZD2PgbXVrnsHCCh
 DSs8Ty/6cZAihLTWYEOMzH8+wJczk7STdWFfE4ws/75k/mvQAiQ202Dh7lvFGZkgypRn
 Kx2Q==
X-Gm-Message-State: AOAM532aHZ5wcqroHWTGKBkaakKD9fiwJi6vC5yPT7+k8vb1TovhS5wR
 5WxEbz9vjGiRmwt7EzzQ9auxBw==
X-Google-Smtp-Source: ABdhPJx2VpgUJLVfBabwIPoYV6higwAb0Q5FV1DbreWBkb9KMO1mTU1/aGjEbAgAIrb9mVQJ0PJY1Q==
X-Received: by 2002:a17:906:5597:b0:6ce:f3cc:14e8 with SMTP id
 y23-20020a170906559700b006cef3cc14e8mr18536963ejp.426.1650466924841; 
 Wed, 20 Apr 2022 08:02:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lb26-20020a170907785a00b006ea4d2928e5sm6831556ejc.218.2022.04.20.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:02:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EE981FFB7;
 Wed, 20 Apr 2022 16:02:03 +0100 (BST)
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-24-alex.bennee@linaro.org>
 <eaba5f28-cb18-1b1d-30df-2db5ca31f9f6@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 23/25] tests/tcg: add missing reference files for
 float_convs
Date: Wed, 20 Apr 2022 15:59:10 +0100
In-reply-to: <eaba5f28-cb18-1b1d-30df-2db5ca31f9f6@linaro.org>
Message-ID: <874k2nx0gk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 qemu-devel@nongnu.org, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/19/22 02:10, Alex Benn=C3=A9e wrote:
>> We might as well include a reference file for i386/x86_64. I was going
>> to include s390x as well but it's broken hence I raised:
>>    https://gitlab.com/qemu-project/qemu/-/issues/979.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/tcg/i386/float_convs.ref   | 748 +++++++++++++++++++++++++++++++
>>   tests/tcg/x86_64/float_convs.ref | 748 +++++++++++++++++++++++++++++++
>>   2 files changed, 1496 insertions(+)
>>   create mode 100644 tests/tcg/i386/float_convs.ref
>>   create mode 100644 tests/tcg/x86_64/float_convs.ref
>
> Are we forcing SSE math for i386?  Otherwise this isn't quite testing
> the same thing.  Not that we shouldn't test floatx80, but...

No for i386 the compiler defaults to using the x80 instructions although
I can see the x86_64 build defaults to using xmm regs. For the reference
it doesn't matter too much because as long as we get the same patterns
native vs translated we are ok. We could add an additional sse build to
i386 like we do for the various sha512 variants but I doubt it would
gain us much in coverage.

>
>
> r~


--=20
Alex Benn=C3=A9e

