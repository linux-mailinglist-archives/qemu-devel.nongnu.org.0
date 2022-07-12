Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95808571170
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:27:39 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Uo-0006Cy-Ef
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7Qs-0001of-3e
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:23:34 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7Qq-0004vE-GD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:23:33 -0400
Received: by mail-pf1-x431.google.com with SMTP id v7so4419976pfb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yymjKM4tk+i0ww/fDuALNS4VPeHfRf1lfm8q29qDxHw=;
 b=RI2EKI8Zs7qeN3uMxd4aExJ6s/3iN3dFM/hbjb5bHh8xibXbTXtcWrlG1jgK8kwlYP
 u+rL8WZBbY7YlHnMOlbksOqHorhpAVYhTohTtYoirNaVF72E24IVNp0tmcEl2jz7PYYp
 R4jeL3EAztD5RLmJfdWF8nyFcbmkKXlXXp5UBSl0OCzF6sDeR3IuOI5WcTWgtniVKNfH
 8n4zp8L0zMmRoUYtuAX0yxIgfb1id77VHGu+BcrKfALCOqMsum0KocLkDHmh0edU9Z3H
 YKBLBrkTbTAwMouqsM1jfXJX12gP3wkDAFIc6WlrBfPI27P8SFkqd0BQ5fpCjhCNO5F+
 Snzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yymjKM4tk+i0ww/fDuALNS4VPeHfRf1lfm8q29qDxHw=;
 b=fCvp0/mSuC1SjtsGYUh4E3+NyXClgm64csPPWSiG+8ZdWMOJxmAeQ3YAeZ6vDCn9qt
 +58UUxNKRp6vtwltSBnjJKJcpd+CueOLVvp4R4LI3X0dgXR/k8Oo9+GhyWwZGNF1DJ1l
 k0hxks6B0+Wbo3CzYM0fpTKte9TMzgc8Ao5HVT3+dQeC3HEwxt6d2NJSaDNs5CCYszT2
 E2H3puhDZzVOk4hzXzDj7zpHn9AhQuiMNTSSney+JiKYMVBpBi0OXbJBX5OjjZterjwq
 ot8diRwzIhDvnvRdKZbtUDa60qX8dJAW13okl6gWPs6snmnMoNOlWtRF0PPnt3Yvkxoc
 a31Q==
X-Gm-Message-State: AJIora94GeNRPiVltKRJ08h7/NlfT1+IMGkJWfj7FNrUoUnHhCDstCNT
 vqpZjgSQj7lMeXUHTGXucRQ/kw==
X-Google-Smtp-Source: AGRyM1unZcfePC6NiHDg0v5Z8wvIgVX5Hx/54H8ex1jXXPgB21JiebHMDdcGGYfTLUVdKz3UmyhT3g==
X-Received: by 2002:a05:6a00:23c8:b0:52a:e35b:47f1 with SMTP id
 g8-20020a056a0023c800b0052ae35b47f1mr3050916pfc.10.1657599810704; 
 Mon, 11 Jul 2022 21:23:30 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y73-20020a62ce4c000000b005283cd33ea6sm5710199pfg.145.2022.07.11.21.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:23:30 -0700 (PDT)
Message-ID: <1fe31da9-bccb-362c-946a-df349a523021@linaro.org>
Date: Tue, 12 Jul 2022 09:30:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 09/12] tests/vm: Remove docker cross-compile test from
 CentOS VM
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-10-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 7/8/22 21:05, John Snow wrote:
> The fedora container has since been split apart, so there's no suitable
> nearby target that would support "test-mingw" as it requires both x32
> and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
> would be truly suitable.
> 
> Just remove this test as superfluous with our current CI infrastructure.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/centos | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

