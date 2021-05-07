Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A8376923
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:57:17 +0200 (CEST)
Received: from localhost ([::1]:47772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3mu-0006Gt-Jc
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3lv-0005ZH-Ji
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:56:15 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3lr-0003DF-Sg
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:56:15 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so5660471pjv.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJkG3Nqo+eDop0bUncUBMdJeN2IwiKSJnDodmdwnz5o=;
 b=zBUPJ6QNRmfUhEY1DktU9gKD0oo2XoLbJ+C8XrlPhyGCMBvHm6qRKsgJb90UbIz3mT
 MKYo6KRGePyEUVd5WuCp6yqxaf2eicnQ/Q2XTLWfN2TO4/myVZUjJ2dWVwsQLkl2jQXT
 cGki0E3mW62mGf26x+nkVhcocKKYEtUUeDt0SUIpTC99fiHg2siSr6lwtQ4dmA+eb5RY
 0Csk3NXehmM1TG32tC69xHEvpduXTStV1CwAz0zeL4wSQWov9ZtfLTW+fyq+2Qcfnp51
 E0jKlfjOkcrCtL1/yy9eUFeXIuOlfRyEMNrBLlCIRX+nLooR6T/odono2ZlVCMuDyfGU
 vUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FJkG3Nqo+eDop0bUncUBMdJeN2IwiKSJnDodmdwnz5o=;
 b=HLFp8mxWrJEs77hEyVB/S6i2enw6DYMP/quTwCMqFHmLe6oTFrEOoz6rgoCdja7JUW
 p6VxSgomaDTx27ylAqouscnXRh7YEZ0UxX3l3Y0uq+2ZF1e/aI0YleakEc3kguaTKdF4
 cCWnheLmO1hqiwsoOoGCXuKnsMSnHC2RyzKZR8Ow3hN2gl+xHKpyvkTLPpwSmxR5wpZK
 orc/Hgw6PF/cmbEoTCaOOLpfwiZBqlYKl5HQ2hxb5hmCyJ6uO/RXUTve215oOcHdCWF6
 4ueoCKYKQH7ehJY79uL+UEtptD2l+tGF815tNgqrtuWUO8c7cwxfSLp/shXx9GpM/rb9
 gQvA==
X-Gm-Message-State: AOAM531i5gXz6dqofFnEy7CvdTJde8FlfQ+F5XbO7AYfnZSw6YqDN/9N
 fEU5LQM3ReiJLITlqLX8cwDnGQ==
X-Google-Smtp-Source: ABdhPJzC67lviIcgQ7vOxeE3SZ0glf1+5uPUqdZG3HgI4gW3FMsKdtJIjngCqDuJwH/2votLmmw/Pw==
X-Received: by 2002:a17:902:ecc5:b029:ee:cb82:fbc6 with SMTP id
 a5-20020a170902ecc5b02900eecb82fbc6mr10763425plh.70.1620406569234; 
 Fri, 07 May 2021 09:56:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id s64sm1054602pfs.3.2021.05.07.09.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:56:08 -0700 (PDT)
Subject: Re: [PATCH 23/23] configure: Prohibit variable-length allocations by
 using -Wvla CPPFLAG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-24-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <795708c1-38d0-f54f-ac22-ed5551204f61@linaro.org>
Date: Fri, 7 May 2021 09:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-24-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> Now that we converted all variable-length allocations in the
> repository, add the -Wvla CPPFLAG to trigger a build failure
> if such allocation is used.
> 
> This should help avoiding vulnerabilities such CVE-2021-3527
> (see commit range 3f67e2e7f13..05a40b172e4).
> 
> Inspired-by: Gerd Hoffmann<kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

