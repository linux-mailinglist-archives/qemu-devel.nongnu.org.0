Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E97602C04
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:45:22 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklyB-0006K8-S0
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklUC-0002Vb-Us
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:14:25 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklUA-00075p-S3
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:14:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so2890643wmb.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIGb1pPXqOhoNzBfEQ1N3EwpBoLrG1Eu7FcKm2kk7QE=;
 b=LEMZNzhZvCxRZ1YFc+BCB4doSO8Q1zJT5OkcVWEKUEo8pnzA9Sqgvyj1AJZriIYw8z
 fyU9IlaWjiEdCywBcZyBbHTDsqq/L1yIrDMA59beYVBW05mjrEPKfryNgWBDu8PRO2JI
 z4SOaKge13hH8L49NjfpPeHzk4sYbQOuZLFcSap7TuX/2rDHb/QYb7a60Xug5UIoE+S1
 MKFIM07bgY3H8l8ItRWaelnP0TZgIigNqBBBZ/cVXwPsu0UfRMbPskfeNej99lTScF6B
 SPl88Q3UN8LZI5Nxd24NNHpnU33XvQ+piWFZEEi5lAyQylyLFicXPgkfzYOo2OtUELV1
 /45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIGb1pPXqOhoNzBfEQ1N3EwpBoLrG1Eu7FcKm2kk7QE=;
 b=JsOV4g64BCtMlEJkxpqEKfwGmTV5WJMqil6XYAu1NiBql56St0MARk3gLZb0P1hMXi
 tP6Zm/Z/SglJ2ojrip1tgNSCb1posETtOY1mmDdbcZWEGnh9ugWETahsXedzDc7DQvq3
 lMjvZxtyKU4Y/0Tcm8TOfw8oWvOU1Rdq1Lt9sfvLMIv6+hDrDw5iOfNdE4KuxOPXve8L
 3RfDisz4iBqQ9HhmxVvTwtJ486YfwpQcqxYLzWNkeJsR1vSwckPuNRAuxgr0yjxGgsdI
 mrkd0+sOs5CVD6SwgtMTA53xJ3dE1xFHHDNhAAWPTJd7uhCPwrlLBPPkdd5nPiAlpU1r
 LEzw==
X-Gm-Message-State: ACrzQf2EQRzOvl+xQws2kw6cA33u8MSqRRiKzq9+67YvuG5u3vUfng3t
 I+Kh1Q+6TEINXBcv8OzcXz2HsA==
X-Google-Smtp-Source: AMsMyM7W40pNYqJi8u3/dBC3KyiZYPZiiBSjo1/LGMty5xSCHqWD9o6mftWelSIZM7DR+YK9L7mWWA==
X-Received: by 2002:a05:600c:310c:b0:3c6:f7c6:c7b6 with SMTP id
 g12-20020a05600c310c00b003c6f7c6c7b6mr1756966wmo.81.1666095248873; 
 Tue, 18 Oct 2022 05:14:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003c0d504a92csm17685278wmk.22.2022.10.18.05.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:14:08 -0700 (PDT)
Message-ID: <11955623-1be2-d19d-8720-9032be63b423@linaro.org>
Date: Tue, 18 Oct 2022 14:14:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 09/28] qapi char: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/char.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   chardev/char-file.c    |  4 ++--
>   chardev/char-socket.c  | 10 ++++------
>   chardev/char-udp.c     |  1 -
>   chardev/char.c         |  6 +-----
>   tests/unit/test-char.c |  1 -
>   scripts/qapi/schema.py |  1 -
>   6 files changed, 7 insertions(+), 16 deletions(-)

Eventually s/char/chardev/ in subject.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

