Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361916B2AF0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:38:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJHR-0003ri-0k; Thu, 09 Mar 2023 11:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJHO-0003rH-K0
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:38:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJHN-0004Ti-1v
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:38:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1625690wmi.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7suhqJvoPxuvycmGtPcGl/ENBav8n9zRnMqaSi+NhU=;
 b=Yqq5IxyPIlO8fROf8mMfpYQ8/T32bhhxeUjIKnXC9KSkuXwxDD1C7Zp85814Rz3qAZ
 IO9BYb2XtmcOz7Bnmq0hlxpfwTXw6OnRhNe7NHCzzVevKMD2rTd+/Kz0Z+Ng/bTDaG5q
 1cn05qsvZcgzRzzSqKUG35mHGvRQ4CcH7YAfTAI8KYa1mswmkM/3P478KFDfUHF8HUtt
 crMSyzBVDWVQxjgdj+pMvKGDLE/7jSZggDqMhuU3morqMGR8sMOvb93VlSURCTMwbifK
 L3cmFrV6AqW00e9Pw14/VlR8aFwDqDsgt9iV+TnVQB78eAjAXNlCrW3iWjYA1XrqgOQS
 r4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7suhqJvoPxuvycmGtPcGl/ENBav8n9zRnMqaSi+NhU=;
 b=7Dy3JIbM5sRr2mofhpcM6vy5OP0uDHZsITL8vzN26T95Xmw+rwzrD4Jq4viS4o/Ebh
 d/tr8oOWZQ0JI/K1QKh/tfNSAzdofs9WsKgCxsw5byv4PblbfSEZVBJdit71OvK9cN/o
 rVt4zCvEw6AWdZu8V8K1+3GUJMQRiUZ2Ka44o+j/BriyZ1E6Pr3dAMnh0wzmiy8/xkxD
 fUaYNJyUwtXuNTY1xpzftoDrMPDL2ls78XS1hEbgktpEqZ8UETWe8nc2aSp3t9p8pHPR
 CVKB7UHRDudc+XY7+M3QJGMwM/Tb3Xh+rkrOgFVt9bDtLwbgyEIEH4sK/Vt7GoI4S6gv
 +CrQ==
X-Gm-Message-State: AO0yUKXOEoMSl6amxpZuYIPwmow6yhF/N21ljDtIl4MDWHxdIOSOTWgZ
 a+a6er3uIrZWhdr2h3B2GWiOmA==
X-Google-Smtp-Source: AK7set9dsCmOiY0INz5RnUEPDMDkLV+D4XBIUoKlPHNGgsctXT8hdI78KJionVPrczpNUR33jEH/vw==
X-Received: by 2002:a05:600c:1c9c:b0:3e9:f15b:935b with SMTP id
 k28-20020a05600c1c9c00b003e9f15b935bmr20348730wms.32.1678379887283; 
 Thu, 09 Mar 2023 08:38:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003dc1d668866sm369539wmn.10.2023.03.09.08.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:38:06 -0800 (PST)
Message-ID: <1b38469c-4d92-d4f5-fc56-7714b5375aa1@linaro.org>
Date: Thu, 9 Mar 2023 17:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/18] ui/egl: print EGL error, helping debugging
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-14-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307115637.2464377-14-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/egl-helpers.c | 54 ++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


