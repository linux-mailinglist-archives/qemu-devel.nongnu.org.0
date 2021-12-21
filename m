Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16F47C791
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:38:28 +0100 (CET)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzkxu-0001CE-Co
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:38:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzksa-0007xn-H0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:32:59 -0500
Received: from [2607:f8b0:4864:20::631] (port=46782
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzksY-0003hn-Ns
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:32:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id p18so19865pld.13
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/koREJmRIVdgdc5sZHYtgpec19c9eivnVDQnmdKFrU0=;
 b=SrdvgZ+0W1AqCisQV0WqdeDhsbFhiLhW2BAzUdHK9ar5DTZvWuYaN2HW/Jh5MYQMeY
 xdHv2dhr/xVZkLdzSjvumguZHRqTNwfzlysQdQn6oDf5/opymwv8LXTLKnJSYAj09p+c
 KHqDETJFCKqV0AENtMVL42B/EevyeiPDdvd2a0RVFb48xa2VxEo/vxf+SXbQPunPQ359
 I8B51m467GBppbyME0wXs2UdMSmkxjvzeF0ZrsWU+51EV8x2tZqpMZO7SZ++VL80xkR8
 PsOyVUg1NjX2Ecz9QCtaGEGc7SjfuieyqU2dFaZMlrCM5XLMeNeavm/8LB6NgP4xpxYH
 MfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/koREJmRIVdgdc5sZHYtgpec19c9eivnVDQnmdKFrU0=;
 b=gvWe5PhhzptPrNgisfbSGQXlfsn2EYmSZj2rBDbeoIDELkhbUrgN1vfEE6EsSFeSr8
 zaZCQEhBfVDIXLvzhqMT67IFqxK3Xjc+oKE/uSRr0+/bnVZRC9pl79kSIm+jNqfwAFBy
 StER3Ea9N3ib0tWr+86jzLzNQ/Zebd2GmeqxvFiu2roSpAAec4UfzktBQEsciNYxtT3f
 JXkzpZ2JOLsBJzNbYF1L0bRb+hA2LAM9oEss7co/Cg5ogcWRxMOHaKrep91WR+IY99PN
 9ZPyr6b2fn+N1eyi2cjNoKViY0AY+s+fMBWg7JoRXsKU3o4wY8JW0qXY4lUeFjRSAZX9
 HHaQ==
X-Gm-Message-State: AOAM531uz5iSf1gA5FIacFOEy//r0DUTbIo5bpY+LA8ItWzQJ1rk5fXz
 SgKSZgM9cTX2IG3fTmghGIFD0g==
X-Google-Smtp-Source: ABdhPJxgBSShRHhk08R9qfaIjFoylKq77Kd2f06RY6toratZ34MUtNiUywpyG4Ck2CmwG/Uw9lmMIQ==
X-Received: by 2002:a17:903:191:b0:148:b9fc:c42b with SMTP id
 z17-20020a170903019100b00148b9fcc42bmr4763963plg.63.1640115173121; 
 Tue, 21 Dec 2021 11:32:53 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id p66sm9663951pfb.142.2021.12.21.11.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 11:32:52 -0800 (PST)
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
 <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
 <72a60ec5-156b-d73e-9150-91c79eb92fc7@redhat.com>
 <656b10c3-4edc-96bd-48b6-3302ddd7cb7c@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe3c4739-48f0-bb42-77a0-3677ccb22391@linaro.org>
Date: Tue, 21 Dec 2021 11:32:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <656b10c3-4edc-96bd-48b6-3302ddd7cb7c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 2:32 AM, Thomas Huth wrote:
> Using g_file_open_tmp is certainly better ... but the tests are currently written in a way 
> where they require the file name of the temporary file - so switching to g_file_open_tmp() 
> (which only provides a file handle) certainly would need some rewrite here...

Incorrect.  g_file_open_tmp returns the open file handle, but also returns the filename in 
*name_used.

I should think you can close the file handle straight away and use the filename.


r~

