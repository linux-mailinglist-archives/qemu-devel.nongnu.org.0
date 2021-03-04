Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C532DB6D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:51:06 +0100 (CET)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuw5-0008A4-HB
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuoa-0001lt-86
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:43:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuoY-000892-3c
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:43:20 -0500
Received: by mail-pj1-x102f.google.com with SMTP id jx13so7365891pjb.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UO18dYEgbsRtOG89oitxPES4hgMP4qyqBwAN9E1bG54=;
 b=LTPvOoHniD1WgL7kumMEeptWWh4EK5rIUOYWYJr9QF4NQ+I0nZ9d/+5qBj6+nT+5Ar
 pEXxYSPUPbNv16Cxw+ozn2KrGsWbMl/RhxkaIpzhp2LZlEsv4J1kc1ieM7/Y9MITfGEP
 tntI6MU8S8l0cU1JYqymR4mRJcmPzKufJuUgVOBiruBO3rPyXclU7U2IC5iogUbincdK
 l3vy54lA58nFeRq1NUe5rwTEL9Q/w2GfiwUKA4AIpf/8p51cAKKrcmGCqUjx0Q8l/U70
 xDQrmNGKjxH7KuLPUXC6i4oLkv+WPbCh7rDNq4GZryUmHsNxDSbnQi+NxAzu2ljhTp2R
 Nt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UO18dYEgbsRtOG89oitxPES4hgMP4qyqBwAN9E1bG54=;
 b=FkRe/bdtKXDPBA4vJIaY8IdI0wLbKdZeYWA7p+AYtSL2Dew+veLjpOqcTLznxthH+E
 CIW7Un4wjIIfcENgfjeRp0bmVygh8/GYRSPE6nlmVcJWAl8IZ3EKI2t349LZxRTVeDxz
 hv+qKeBB3LMxaTTmeB/2x4MNi8pJGdpU0KKK2wfW6GFt6yyPpZ21/vu9XVh2Ld6QSz/T
 SRnvZTWq477QSVjzljhSWCrgSJdnVT6NWO2PFjApo3NXIgxHuLWQwU0gu7kah0L9R6KD
 dteNiQDrrvAuVu9/vml1QTDLQB6xx9poS4USsEDKx0ApASWUOFsoAZXmjJ3ThfMvhE9e
 irLg==
X-Gm-Message-State: AOAM532hr5BKRbpE8MVTbiJ/vSroUIQsdJRrLDsMAvdzCjuf8YPC2C0h
 Dqm9oZxmlXhWfXFPE44kGA1unf7Y7qOPhQ==
X-Google-Smtp-Source: ABdhPJwnCro17JCDUgW8EgX8DwzJcBQys2x1ncN2EHzcpHiJ1cDCwoW0dwZPhiU3xXk0DnSY36dL3g==
X-Received: by 2002:a17:90b:608:: with SMTP id
 gb8mr6357818pjb.121.1614890594539; 
 Thu, 04 Mar 2021 12:43:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k64sm273862pga.52.2021.03.04.12.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:43:14 -0800 (PST)
Subject: Re: [PATCH 36/44] hw/arm/mps2-tz: Make UART overflow IRQ
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <941e0e0d-78ab-6a04-5b1a-76c76befa195@linaro.org>
Date: Thu, 4 Mar 2021 12:43:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The AN547 puts the combined UART overflow IRQ at 48, not 47 like the
> other images. Make this setting board-specific.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

