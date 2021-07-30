Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6D3DBE8F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:53:46 +0200 (CEST)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Xdh-0002xC-IT
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XU4-0007ex-3E
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:43:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XU1-0004ES-KF
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:43:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so12110193plr.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gz2gV0Qy2A/sXQSaf5bIuS9lu8DCZmBBlOZU22hHuHQ=;
 b=CvRCm667dqJXY12zyfZyMW4e8sIjjLOOq+BuvjW+L2JAi68A+SAJqvHIorAmqtm9+W
 FJgHD4AF5+CJlsuZuMtOdBDbmDJ9NNecMQ7soLsJapZ82eSXV5qLbKEs2cmPJHd+L+KQ
 O0jbUvzXIMdyl++xU6J9kkZylaq8GR/93v4AZUxdEyjY0dgE6cEaw1IoiaNKz2uv+bXS
 +2gTee4TJXx+VpD2h2tr47kgU9bDwRz1lYRZK5e5Hs2pRpAd+qCnyLvWXfabz9CnNr9J
 MLIKWE02M7APK4dg74Bp0S0M1EuQte492CbqxvnIt3SCYKunu6531U/iGVgvBIGWhmWE
 yVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gz2gV0Qy2A/sXQSaf5bIuS9lu8DCZmBBlOZU22hHuHQ=;
 b=P9wlvpK7TRhNCb7W/tNunGRzRhuzQi/0C/C8OQp4+fezKRAedS4tt5rXAtzxNZGVhJ
 GvG6B3iCr44yPdsoG4ITq0RnHqHAnPylqApFdW1dDiSs4ZFpnJfE7Lzky+ZaPp6PDv+7
 f1UBdvdFRQz++fT2U4Itd1Di4IcuHl5mtkEVn2VUctUCtof5xv6GBtktF0Mf/8p2+3uz
 pxT3IuFXhMMUqvtJmwqo18wXJIvGu4Bzrw/VvZgybviDBokQgQeIovLeTzJ+Eq2NGwkR
 kOkt1m776nwxOcaQgJFaJscliZqRuwF4X88uAgX19N9fiv9notNtUF2PQTYPK+tncifD
 vAdA==
X-Gm-Message-State: AOAM530RS3axypxysLh4YaeL2+gTFTyFF6GDZdjHqjU1de0KxM5VSzON
 HqwbUAt3UXEaycnrBYBUfY3E7A==
X-Google-Smtp-Source: ABdhPJwrLIcOc464vVx8pY8whPCe60YHY+lmniDaYOv3Ejju5J8BGYDHkIJJfcwcFoFIMSwE9peD0Q==
X-Received: by 2002:a17:902:8bc4:b029:12b:8470:e29e with SMTP id
 r4-20020a1709028bc4b029012b8470e29emr3793338plo.2.1627670623067; 
 Fri, 30 Jul 2021 11:43:43 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id e16sm3094654pja.14.2021.07.30.11.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:43:42 -0700 (PDT)
Subject: Re: [PATCH for-6.2 4/8] meson.build: Define QEMU_ARCH in
 config-target.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <24d8518a-6951-5aac-a018-ad25f9833f4f@linaro.org>
Date: Fri, 30 Jul 2021 08:43:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> Instead of using an ifdef ladder in arch_init.c (which we then have
> to manually update every time we add or remove a target
> architecture), have meson.build put "#define QEMU_ARCH QEMU_ARCH_FOO"
> in the config-target.h file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   meson.build         |  2 ++
>   softmmu/arch_init.c | 41 -----------------------------------------
>   2 files changed, 2 insertions(+), 41 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

