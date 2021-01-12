Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5B2F2344
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:16:42 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7MX-0004Dk-MW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7K2-0002hF-Li
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:14:06 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7K1-0005NR-BP
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:14:06 -0500
Received: by mail-pj1-x102d.google.com with SMTP id w1so674911pjc.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RLBeLmNm4wbSY3ku5Iqz7J1SWOX3iUZ4RuiRWaCWtO4=;
 b=MKxI0yHb5zJXOT3KjRg1u889VmA3axTZAEL2ph/bNWmvyiunHO1nQzOK0phohNrOeU
 0vl+Qt7tig1kAqurQmoeFePVJOcxPbdVMgInNHXgjEWyEt0mhi9zfIlmsCa29o6Fv/r0
 PAQjkEzXSSmPKITgXvjO/1VLs1zFkSO75mBSD0yJhvlHChdMngLFcxvS8jrSvolVmA4V
 i2UmHWZBKVVokDgw6O3sYY5QdorA5mzhs6ezWlS5N8TK8pgGzy0Pi4gvSTpcx0iIKn6f
 Kn03rihFg2Kdk+i42YDLdMgPiZ8XnBg+h4MsdDUOwkjm5cobuT2DH00Qy48Xh9QqtgYc
 VzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RLBeLmNm4wbSY3ku5Iqz7J1SWOX3iUZ4RuiRWaCWtO4=;
 b=lyaOjR9HDhaflwUzDGZI/axH5+dyhPfoDrXv0D/k6W0DNGnmV1Sw839MgpyQRNGSjY
 e2iiVBBBKJmzNp/bRrneXB1jS/ys4MwRM/1kqCPMMIf7Cf5efpgn2zslxWDCAcEPNrH/
 u1JdpJ+q2RQuil+X/sw/UWa99KWnntmsRFc19O2truHY1Ca5aqQaCsS1QnOvMKTM1y33
 rI0U7NgyIFrZ0hDkcMjdC2ddo3snywJ6xk1cbhX1AS9Lsrg0WmHbLW9F+ixEuENrbg50
 IH3eqM158Glp7RAbSyWPO9PX+c0eJD2jfqOvB5akBFjcThjGqM+7goAR//tFe/zs/zCp
 1X8g==
X-Gm-Message-State: AOAM531vt0nJxvHWL5peLJMxaQJvZ8biD3hPK3PxrStHcfgOHknm/+Im
 pLOaUM+CV0usTI33jKSTTIH/d+RgTezdDw==
X-Google-Smtp-Source: ABdhPJwj6jZ1GuGL9nWRShCpa/j9ggpDHDIEDc4pSIZ0mO5HDdEeO5qGHr7qn9unxInIhilL6wLSlw==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr1427521pjr.227.1610410443624; 
 Mon, 11 Jan 2021 16:14:03 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gb9sm585357pjb.40.2021.01.11.16.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:14:03 -0800 (PST)
Subject: Re: [PATCH 18/18] target/arm: refactor vae1_tlbmask()
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-18-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4cc7dc0-15d8-63a5-88c3-b5bf7907321e@linaro.org>
Date: Mon, 11 Jan 2021 14:14:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-18-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


