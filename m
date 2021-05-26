Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C4391FC4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:55:24 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llygd-00025g-Ma
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyeb-0008QN-5O
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:53:17 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyeZ-00036e-F3
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:53:16 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y202so1646640pfc.6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7OKWdFoVS/e/ol0Xo6mo5HIKvNLBwt7Hic3gZJ64gyo=;
 b=K2spuzSguRYIUf9l9L5QEr8to5CYd/dGXGQhtyghtPplZd/ma/vffq4W5aMFzR5tOC
 PxgTpptrb8v14ds2mZqWLekl6xmJDuoANzfyruw3UaF9rNQ5sc6kGrx2QinqdzGkZLd5
 tYcKVnCZ9IBOXiQpMKzZ3p1lSWRLE345CCvdu/AGRhrrdPtU5SpYO547opw7sNSk3Vac
 jvu1FfL+NciqOsaJevtvHjcKmmXXosrHyNfQxTu3gfi3Wgi85NXqOh1IvjZeqIAkCkqO
 pKku4w/saWdd+d99bmbmVhWnmN+zc5Tk8AmVKe803STRU/Mgy5LiqwZPJXNs2UOD/Ypu
 et1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7OKWdFoVS/e/ol0Xo6mo5HIKvNLBwt7Hic3gZJ64gyo=;
 b=spu2FX4QTO1m4vdNT9feiRLjtgGpXGnvmaSnw+KWPXE4Y6OAfsMJvxZT1fRfVCPLwJ
 ajlLdkljam+KR+jpFxHkHaiU7aWH00T+FwYBn/U1cS65hbG9i0Zi0Qbyv5Aos3lLoOUk
 trRnFfsetr98qeeK3aC6ecBG0CgrXX/cOkPWA0Ruiby9PYtspkLa/ZieDTA8F4CGFYma
 o9wkLuc6Y8wXNkRJn6OmiGhQ2iyiGXflAFFOERoT5uRI75lYFi1rMSoHLr7/dFMaIvqQ
 olLKefgGUTdQAZvu8msS0tXibJKGVGc9FL55y91Qaxek2uHFSwZDPPWpR2Du4xktSNVc
 bKhg==
X-Gm-Message-State: AOAM530Hybgi/GKRj8qFM+dGYcRNqmLA/8xPG0BevoJrWbZFAmxbgoeY
 HSrNydAgWrH3FAvbuebzNe8mLg==
X-Google-Smtp-Source: ABdhPJxeFpcj0kinZu5TNL+uavD+4cnrJ/Xb5P7niaR4PnfySblkCIIctvJp6JQiR0KOo0q2xnc7Kw==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr36541091pfb.76.1622055194019; 
 Wed, 26 May 2021 11:53:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g15sm15663832pfv.127.2021.05.26.11.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:53:13 -0700 (PDT)
Subject: Re: [RFC PATCH 05/15] accel/kvm: Simplify user-mode #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba2edcf3-f437-8d44-9a87-2bb65e8125b2@linaro.org>
Date: Wed, 26 May 2021 11:53:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Now than we only build this stub with system emulation,
> remove the user-mode #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/stubs/kvm-stub.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

