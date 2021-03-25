Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A93494BA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:57:38 +0100 (CET)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRQX-0005EV-PN
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPROg-0002yq-VY
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:55:42 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPROf-0000FF-FW
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:55:42 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2139737ott.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w0wjG5TevIhXcDLA3uDEnpxuSM4nssuLkcD2mp0jktU=;
 b=B6tQSelRDV6EOFT06oXGPCZ6CXE+U5pTYvr3SD4klxaw7XoQw6YgdSW+OYrDts6yBs
 t2fjHoTLycM8TW3kCwMQVPVjm1Kn4bCj3o/KsuxL7x5BdpVcP+iav8/CB82UvRhykbHK
 Cci62AUIpje70hmyvxeG432V6A8mxWdooiFQ+w0IiIm0RKNF+WRK+qN5aJrxJDspM5z9
 JF8XRsz/TRIdMzFCHuqik0fXbYaEgF8wZ4Oaw2TuJkjYPEk/JhzCXSdX9gsdeCwrBERY
 JCs9FycuVCRTIZB4s+seEUEyPQznUqTv/SGZqiGoESYFyd46vaCMQJxZaTV4TEfhIJQE
 jqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w0wjG5TevIhXcDLA3uDEnpxuSM4nssuLkcD2mp0jktU=;
 b=iG7Tp5Bvei4bA53y9XUe7NJPSHFpbFqC2b9Z8vhizZO8Hk3exmM5xHvdWljY1WDR2n
 tN5ytQV+2k61zETeaHubylQqSZx9wpCgb8cwc7rZQlcX4vLCqSwBxYccXfF7Fu1kR7vK
 ngrek6T9r74W/B4wUl6RYqnTeK8xKBRJckB1ZKIFzt9D7aqiNH3XrT7Xy2cOWJgfcxQT
 t+2RfCaFr/2boVG20VJxRHHBgze3ON1Y6ZG+6nQQ0PWcxy1p+YURRaM0x4sCbYRXF4PQ
 Qbx/89XDASVpkuBGNAAy1DzFd54Bz5spFNZE7bfeP5t7PvFoveHGA252u/Bpn/hnrmOG
 3ZRw==
X-Gm-Message-State: AOAM532uixa/yU4VqrmPHXQCUWU0aCV/Zht33JDtf8frOfBW71sp8dVQ
 3jf+N+pO43iDMJI065vZx/cgbMFgPkEJSmeV
X-Google-Smtp-Source: ABdhPJzCuovFbWv25zTczIimGOo2dAuQXXW5vNsCHpSfAlGZejkNPrCRjCssZYQ3dbN3GpsXY5andQ==
X-Received: by 2002:a05:6830:8c:: with SMTP id
 a12mr7501012oto.317.1616684140077; 
 Thu, 25 Mar 2021 07:55:40 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e12sm1314243otq.30.2021.03.25.07.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:55:39 -0700 (PDT)
Subject: Re: [PATCH 08/15] Hexagon (target/hexagon) replace float32_mul_pow2
 with float32_scalbn
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-9-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9dd6ae44-9e08-7b9d-a774-8ec825c7a50c@linaro.org>
Date: Thu, 25 Mar 2021 08:55:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-9-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/arch.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

