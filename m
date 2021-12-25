Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2D47F1A2
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 02:26:12 +0100 (CET)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0vp5-00027e-8i
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 20:26:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0vmt-000178-UP
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 20:23:56 -0500
Received: from [2607:f8b0:4864:20::102e] (port=50907
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0vms-0007Ll-9Z
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 20:23:55 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gj24so8791281pjb.0
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 17:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fvU3bHTlGLhtBjLwEyU1RY2Q3Pcnt61OHULbvQOO0OM=;
 b=iYhKowaclarCadeKKfzg8NtfDyukUSIG+GH7Cb4vUP0W0+7IjCfLbnM2YERv44WTQG
 HvenxFTVQ5jPvyePsSFoKur998ce+MKNVnb1eV+LECF0SG/neZocD2CG4CAVlyD6MQdU
 u0QIC7314DA8xwdFzhYnMg7bfkFwJwEEssAjtZVFYePKgiSctFTqYhgYLvMrle91V/9a
 O/PNOELYORZeB/eecWE4AGtuww3fSYcdtQMip4nGnj4On+JHkuFsLo3/2zeXG8XPOyFo
 vqqTGjZ38axy9xCM67wB7NCZfDvtvMQkTFz+oxlckiNABoIsgaGL7a32TH1Nm36IVhWa
 OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvU3bHTlGLhtBjLwEyU1RY2Q3Pcnt61OHULbvQOO0OM=;
 b=LVeJrTCwL3HHWgHVizuPpKGA9+KUx11iUeWSd+y6+sW+H4jYinNtwksLL6gvJnZSrY
 SoSf/sHkBm/qYHVdxsmVIQMegc3q2XTbYeKpzyZAzaMWMmlmlCM0hSYwu0QeqMHPNJpS
 k9tcTePFo6tUqvcSA86+4HmWddQjHSLFywI/P7/KZJREhoJru4lZYCok2N9JSzFuCpTg
 9HuT9rbB+KCdGNociJyMcKEH51+6tuAHVaikBaUh4SDGddliZedwRy5gfhwPM46HOrpl
 zl5TIh2L+HbB2Mn+pDJoNwCayDp4Ztw3JJbPBTxzv3x947YlQZwzQIX251c7BGj5SJya
 pjeQ==
X-Gm-Message-State: AOAM531AHTFNuA1H8mJg5q7mSqoATDiRoxXphEpjgr8BZVVkBuF+/A0l
 11mF0Cib5Q5Y3fTliNgfw1TCTg==
X-Google-Smtp-Source: ABdhPJyN7UvIRGi6plfGukpmAfXU5zz6NuBt9KQCV9JGZ1tlABF7tQ2+0Jg0uocNsr3z82sNzxA1yA==
X-Received: by 2002:a17:902:f68a:b0:149:51c0:60a1 with SMTP id
 l10-20020a170902f68a00b0014951c060a1mr8061631plg.31.1640395432768; 
 Fri, 24 Dec 2021 17:23:52 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s30sm3320037pfw.195.2021.12.24.17.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 17:23:52 -0800 (PST)
Subject: Re: [PATCH] tests/unit/test-util-sockets: Use g_file_open_tmp() to
 create temp file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211224234504.3413370-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2bc0b1f2-54ba-af6a-298b-0c86ac4d921f@linaro.org>
Date: Fri, 24 Dec 2021 17:23:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224234504.3413370-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
> Use g_file_open_tmp() to create temporary file"), avoid calling
> g_test_rand_int() before g_test_init(): use g_file_open_tmp().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/unit/test-util-sockets.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
> index 72b92465298..896247e3ed3 100644
> --- a/tests/unit/test-util-sockets.c
> +++ b/tests/unit/test-util-sockets.c
> @@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
>       };
>       int i;
>   
> +    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
> +    g_assert_true(i >= 0);

Just g_assert.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +    close(i);
> +
>       addr.type = SOCKET_ADDRESS_TYPE_UNIX;
> -    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
> -                                         getpid(), g_random_int());
>       addr.u.q_unix.has_abstract = true;
>       addr.u.q_unix.abstract = true;
>       addr.u.q_unix.has_tight = false;
> 


