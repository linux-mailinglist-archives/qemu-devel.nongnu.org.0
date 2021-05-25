Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A538F93B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 06:15:29 +0200 (CEST)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llOTY-0007Qo-6C
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 00:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llOSk-0006kj-Bw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 00:14:38 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llOSi-0003pB-Np
 for qemu-devel@nongnu.org; Tue, 25 May 2021 00:14:38 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v14so18975036pgi.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2Fd3G0uJOesSJs/5ngQZ0h4poW0EjYxe3KX3SmC+COs=;
 b=fnrskJnWShfh9FUKDqcm9iI7FStPOeP0euWRQKFwSYykNSHXyoaOKkjaXm5ygTLeMJ
 H9+Kp8D31Ex+Rxpu2TYKtIzX9YIscLLeGdlKSevLJMSQmdCVi8MCFzydW4minh1B6wdG
 G/5RSkFChFQNtSVeMZRavcVFUs5gzyZyPBAP2ayi/l4it733ekRAKfvSsDL2eU1NLfz/
 prXpW8P9csFyTNaRXtPdrrYQqJR7R0JWioXQkmax3Z3RhBfzAgRaBNfdJRPjfjawpIzQ
 C1kmXvdgeiKz07HHHqzZHirs97xS94KzwJRenqAdVWoYUmnqsSe7Zf7jnFadKlk64v+j
 EtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Fd3G0uJOesSJs/5ngQZ0h4poW0EjYxe3KX3SmC+COs=;
 b=t57EWq4wtLON5HB+l32Bzz2M/ZRcgVYv2ImD0YTQ3kEC0h9lXju2cHi4eM0dwDBAS/
 JHj7XkQ9T6/x317OWW8ergitisUdN5nuX63kVMuvpQziwQXwhoC3Bj6v7KYtKO98tJKI
 bH/Qr8+PM4iCUBQ0tLTV78aADoz1Lln/2rEmn6oeaWOxPRWXUMyPd7oIFcWq+QdJtnfX
 zE0FgYYusOnoeMPXGHgf95un5j9oDbhAcNPQPP1l71NA7U9dY/G706clpOOkGz1lnCej
 lzAXCOmEbAHisw1BfKzLvOA23PzwQbeWqnG9Y57PpsqbEOjnDhVs1Igaw8Lu9N7XtIiL
 hQmw==
X-Gm-Message-State: AOAM533LpkdUJfsSULEF5eNDO2RXFHDpb8hflR78pEz0uG9l+Xt7pkiD
 j9ekHvYWBnH5CQt0cv066xSiCOH4X4ptPg==
X-Google-Smtp-Source: ABdhPJwGwoQ7JRcWZduy61XuGycfpZYOE5uPApJBaHcUJHHfopMSybPsKVerYcsuGz2o1uhwD208eg==
X-Received: by 2002:a63:a62:: with SMTP id z34mr17043994pgk.318.1621916075134; 
 Mon, 24 May 2021 21:14:35 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m20sm12112155pfd.133.2021.05.24.21.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 21:14:34 -0700 (PDT)
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Swetha Joshi <swethajoshi139@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
 <CALf2nmKjSB0FN1ZotYjLKF+BBsWiwLPUDjkNeRgq1HkG4P=Aow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52adb715-5953-da2c-4a84-b81c0ffb5910@linaro.org>
Date: Mon, 24 May 2021 21:14:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALf2nmKjSB0FN1ZotYjLKF+BBsWiwLPUDjkNeRgq1HkG4P=Aow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 8:23 PM, Swetha Joshi wrote:
> Where do I add the commit message?

When you use git commit?

> About the outer if, so if config_arm_virt was enabled and if acpi_enabled Is 
> true, we still need to make sure config_acpi_apei was enabled as well.

Done in hw/arm/Kconfig:

config ARM_VIRT
...
     select ACPI_APEI


r~

