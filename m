Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E711581C1A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 00:29:37 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGT3Y-00082R-GV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 18:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGT19-0006Vk-M2
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:27:07 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGT18-0007IN-27
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:27:07 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so301558pjg.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 15:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WgG9CuPFRMQCZnJMYoG3wI0tFSe5/NlTu4yXR8qW7qs=;
 b=KKebh0zisEb5TdWjZgvz/cnPADG1EXwZkSAd2PY8KxlcLU08fa9Jij8SUCg9YBOoyq
 K/2WIZ4wMX842DGIpLtXjM677LsX4zOKi8w/9z1n/gen5VpIOao0ba16Ffp/acO58rr1
 lakM+icMxvkia8UUXQjq8QPvE81VAHcS7tF2xK5VTW1AY6OgZdvcrHrJ4Y40U1l6ZQ2Z
 6hqVCjapRXojmHe4XEYFLveyR7bcS1ZRa0CkwkNOFWfTuH2j1LCP9UoGAte1GL4cWJUA
 HBFruU9Kyxg2OiV+Ai3TNF8rZU7WIi7wd43tvoZPOeraf2w404vTXEUfy3LggpxDzSwN
 1k8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WgG9CuPFRMQCZnJMYoG3wI0tFSe5/NlTu4yXR8qW7qs=;
 b=THTymelbypBpJKtzNUhiJFwQjdF4B1Dkrafyna34CFBPAIUTnKsTEFhSLOfRaLZauX
 1cfzEJwmWErBcuTD9fmS6xpZ7BGC7pkj6vAHywGqP5uCZ86MTwxdCeEyMqCFt+N+Uswn
 9DkjZc6NbHuVBDgLCxHF7+LwcQXU4ebdbFjdxBK68qnYLp4K9BwHdwxlooS0aBxODFfX
 OS852b2M7uiUYV7PEBlQBZTeMNV3lPC8TYnUemPQq8uIsf7seUvWn3zD4H0IhNuJZ/KX
 OqtMLlgoc9hZ+uSJz7PQLER+gf/8A6F+akgQGEcjgxX9r47HhvIySz5ONeXrRMeIZ6am
 dTww==
X-Gm-Message-State: AJIora8wFGDp3Wz3fRuUgLWZl3DW+Gr0nSegul0Vuno2pkL9+Ug3qZJU
 SsfTOjBonAeSP2a6jlS+xDhWnQ==
X-Google-Smtp-Source: AGRyM1sHIOVylaf8pW3/qQwL+sJwhrHLCU7tck1EiHVfWYkwn+AuF1jJFbKQ5Mg2FOYac18beauGNA==
X-Received: by 2002:a17:902:e5c5:b0:16d:82dd:8c41 with SMTP id
 u5-20020a170902e5c500b0016d82dd8c41mr9213917plf.133.1658874424409; 
 Tue, 26 Jul 2022 15:27:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:33b:7a10:8a4c:53bc?
 ([2602:ae:1549:801:33b:7a10:8a4c:53bc])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b0016a091eb88esm12101478pll.126.2022.07.26.15.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 15:27:03 -0700 (PDT)
Message-ID: <c1a3e96d-a5d7-ffc2-d91a-ad42cee2ef1f@linaro.org>
Date: Tue, 26 Jul 2022 15:27:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] pci: Remove unused pci_get_*_by_mask() functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220726163206.1780707-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 7/26/22 09:32, Peter Maydell wrote:
> The helper functions pci_get_{byte,word,long,quad}_by_mask()
> were added in 2012 in commit c9f50cea70a1596. In the decade
> since we have never added a single use of them.
> 
> The helpers clearly aren't that helpful, so drop them
> rather than carrying around dead code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/pci/pci.h | 28 ----------------------------
>   1 file changed, 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

