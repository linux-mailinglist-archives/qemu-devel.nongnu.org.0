Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E24613AAA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:48:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opX06-0000kJ-VF; Mon, 31 Oct 2022 11:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opX01-0000LT-Hm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:46:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWzz-0006HG-EG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:46:52 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so3626321wmp.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8NcFxOlgHpaQqD3vkgRK+mVuz6Wel6WYdnqSVt9Fm8=;
 b=vZCBnhkl90ntD5DbHgpxZToe1wEn4C2udjKkO9D9AeXbJjS9AfuC2ig2WBq1SJKo4Q
 jHDvqJ8KbQk6SZCgCDQNnFrO6J+9GlziGEqKQiGNGj7A+ILikKHtUEsiQPo1b6b8e+jd
 t/abpdUsEbeg4zFMcXCrTV2QNGuREc8C7Lo3sk711wieUjveQWWPeLoiZzq0Z9qPNPgh
 9zpAnKiwKNci8HY6qDHiWPPR3/FpyqcOF2SymVBOtU84QzdAGUqXuXxUDIhTW50fiwhg
 CgfUpvdcop2P1OI6dZu5yfBFUNo4Ui36XXDcBhjNq0NZbvXX9YW5q7qZsJeUtx7fYlmw
 iciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8NcFxOlgHpaQqD3vkgRK+mVuz6Wel6WYdnqSVt9Fm8=;
 b=M7V3dcyySrZpSHMqfs3Da+B5o3sAupaN5QWiC39SlHbGkHVd8CEeLWTyIWc+39xezn
 GQ1f8iJbh8DmdwYMSMx3UU/nSqYAlrHPKmR0EC0kDvdaJvGvrZmHiJHJypuwesjsYyTH
 cJyC6mnGZ53qzwKiQjIm3PiMEQ/o8lgFbKilZmg4Bw8e6YtsgUXjejeLPTkWO8S3cuSX
 cKYn5lohjuI3D1dfbmO2JVnRTZawQD0nTLTHlF5UI5s2uk3xoEnUHKWOxQ5QW3P46/j8
 DnCnG+OdBq8o0ovej7e63Hwt1BLs3AuO9VQuUodXXqGREox23E2SGvEQAW6c1cdLZDpe
 4JqQ==
X-Gm-Message-State: ACrzQf2cfvCHCcxDajY20PuXFxd0RT/B1X28tS3uyL8iehJN6j8j9l06
 5SLA4j4VH9ouCkCEBZ3Lvfmewg==
X-Google-Smtp-Source: AMsMyM7GAc93VuKYdZfgNT2BV8U2ZjnhJYPLtsIQLvJQMbffnqEJOIqbdFzwxsUuChXLvn0uxzkzXw==
X-Received: by 2002:a7b:c7c1:0:b0:3c7:103:f964 with SMTP id
 z1-20020a7bc7c1000000b003c70103f964mr8715809wmk.121.1667231209432; 
 Mon, 31 Oct 2022 08:46:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b002366fb99cdasm7400859wrw.50.2022.10.31.08.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 08:46:48 -0700 (PDT)
Message-ID: <498a731f-2c38-745d-0f13-37a3d560b336@linaro.org>
Date: Mon, 31 Oct 2022 16:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 3/4] hw/watchdog: add trace events for watchdog action
 handling
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
 <20221031131934.425448-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031131934.425448-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 14:19, Daniel P. Berrangé wrote:
> The tracepoints aid in debugging the triggering of watchdog devices.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/watchdog/trace-events | 4 ++++
>   hw/watchdog/watchdog.c   | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index 89ccbcfdfd..fc1d048702 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -16,3 +16,7 @@ spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
>   spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
>   spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
>   spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"
> +
> +# watchdog.c
> +watchdog_perform_action(unsigned int action) "action=%d"
> +watchdog_set_action(unsigned int action) "action=%d"

"%u", otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

