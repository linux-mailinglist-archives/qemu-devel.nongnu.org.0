Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0334BE71
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:07:28 +0200 (CEST)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQakx-0003uS-Cl
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQajI-0002wK-9o
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:05:44 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQajG-0001OW-Q2
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:05:44 -0400
Received: by mail-oi1-x232.google.com with SMTP id n8so11102510oie.10
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LUCsDLEFiMd2dAku+R27fIcLb2tyB/uCLq2F9k1sW5M=;
 b=uje7TG5CXAAl2BfQUtEL2f3Qt14kRMpiqSQHKrb/CFDJFqjwRh8nYxyvql3Qcp805Q
 lY6ewF+6hfs8hFXYIRSQbCQfI3F/TJsfEIRYLYnTySw6fR2m/kP+AHddVgdKh519K2+v
 sRGIQQpyu7CacK/cDq1dgqJTEfOGHJRsRbglb+mkDM7WzFgc4wRZUxiXywUI9kRLaMuU
 C8dV3DvXOdXTjvAiDs2lnb013BEqvOmgjw5dPi1IlCagLzjFKc8hc2ypVRDisXSHa7ay
 +pzoavmVQmwxzJRPjQb7RSiPjyOs5YRslaEMjWI3HAQqJdNg5gcGYQuiMOq5Ln/hU3Bq
 jY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LUCsDLEFiMd2dAku+R27fIcLb2tyB/uCLq2F9k1sW5M=;
 b=Sgsk/GNnETbcU6S4N6iHOi3/gRuerAuyr1snxj/6yays4lcFN/aUNSJ5jf75rfCUBj
 aYq42C7fTNFPzBOE3tdiOdWsI9JjICz5Geq+ttIuKmIok13lijtCJ/XtK/AEPITsygId
 4VJldIe01UgtCXAXUd51wGrWRjcr/n/vD4owfYBiH3VcTrldb2z12mXIq/CNDZNhgazG
 20j7xKY0DG4wuh9QiGEpD57PpsqKhzmvcu1M659T9vPHiqhlQDg/FNqb4NTxtgdsec/t
 V9w4VoM4as35py+LhXLJ0FN7ZWrjponwCOx3VACYpI4XhsswMx0Cpnw+qGo6Sw0vEZOP
 dhiQ==
X-Gm-Message-State: AOAM533UBoN7B5EmizlypmavjAmGIaVV8aWBCPFLuiZU3fJoHEheosQl
 E7MdxdG7h8xql0RnzDM5maiYDg==
X-Google-Smtp-Source: ABdhPJzLXuJwqvMnujUh5Nbf8mzasWX4FkpsyS4ev9K37/VyYZEcf/3rB9R08NbOaJ3fc9Yjhmhzjw==
X-Received: by 2002:a05:6808:ab0:: with SMTP id
 r16mr15910679oij.34.1616958341636; 
 Sun, 28 Mar 2021 12:05:41 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id c25sm3956551otk.35.2021.03.28.12.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:05:41 -0700 (PDT)
Subject: Re: [RFC v12 60/65] target/arm: cpu-pauth: new module for ARMv8.3
 Pointer Authentication
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-61-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1a32cde-2eb0-9990-05c0-8c2efecf7fc5@linaro.org>
Date: Sun, 28 Mar 2021 13:05:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-61-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> Pointer Authentication is an AARCH64-only ARMv8.3 optional
> extension, whose cpu properties can be separated out in its own module.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h           |  3 --
>   target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
>   target/arm/cpu.c           |  4 +--
>   target/arm/cpu64.c         | 35 ++------------------
>   target/arm/tcg/cpu-pauth.c | 66 ++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |  1 +
>   6 files changed, 105 insertions(+), 38 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-pauth.h
>   create mode 100644 target/arm/tcg/cpu-pauth.c

No move + rename at once.

Also, you've started using tcg_sve_* and I think that might as well apply to 
these, in that second step.

r~

