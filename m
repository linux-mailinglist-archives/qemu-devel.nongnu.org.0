Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27407699D68
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 21:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSkba-0003yZ-N2; Thu, 16 Feb 2023 15:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSkbY-0003wU-NV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 15:11:44 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSkbX-0007D1-7N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 15:11:44 -0500
Received: by mail-pl1-x631.google.com with SMTP id m2so3297655plg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 12:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UKzJOPq6CYdPJnRmOnq47FCpvMkQLtD+dyuEoUEnwt0=;
 b=xbK6Xzg7lNTZ1nR/ffpkBP7pZdl4M3zpDTwzRdkCKa6DZk7+g5AKD6n1CEIlsIcUKv
 cqFmxL8kW7Ngmyj0WAhKbQ5vJ12WvdFNaDrjIJ/6fICUvH9PjX6UqZuBleFg7TQm1jwJ
 GHAX++SWPLR3/d1XBsLU0fVlJ3upeqttsipc2UiVoDlFFVjZiRB4IsF9l0/bEiWOks6v
 6A/h38hw/r/icZAasfImxz5jyIQUJV2/391tGqN2NgfzMMzlfjzBChUZ88LHJYeTHJhu
 P2pnSIukvRNIh3CF2600OH7N3WNd3DVRaC8reSYCHQYbPpVlBrD1oXPrcwq8Bc+oASme
 pBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UKzJOPq6CYdPJnRmOnq47FCpvMkQLtD+dyuEoUEnwt0=;
 b=ozRktf1HwMqmfQRckj8oFibKd03D7YlRObMKqoKSUymOOjqmxehc22O1ekflr0FE6o
 OB6pcdvTM44e03WwvyulgWPrJDs43OzgqFUJ3+MDRGiBBkdUBXKmx3UETBaYRBtq/U/E
 QGktjtpe46eDEfQB/brR1p6k0vrdV0o9hHWkj8JWz7+NythZpgbUmHo0vBdeh4JHes3o
 vsjjAS9t+0zCgatIaArvfjZPPDQhPXXf1eELDNNczVSaHl24T/hzr/sJseQEcWhFUd/B
 s1URvCh5YmluJDxpwPzjfinIgXHnRgmfvi7xkCIUe/hGlTpU68INMS7hdqXrcDdqNNG+
 9Rtw==
X-Gm-Message-State: AO0yUKVY8FSNdrJ4po1nwRFTfYDQ07RMZh6TF0Kd7uPplhP1CNLgq+/8
 gdkxJXAnaMtZSiQrSzgCvHCKNQ==
X-Google-Smtp-Source: AK7set+ejbouRWfOjSqgKUtvtLqMf97Qd5HIPhA4/CLGreEarbCvwxjOhRHl90fXQJvlEW99jrVXTA==
X-Received: by 2002:a17:902:e88a:b0:198:dd3f:2847 with SMTP id
 w10-20020a170902e88a00b00198dd3f2847mr8714080plg.21.1676578301419; 
 Thu, 16 Feb 2023 12:11:41 -0800 (PST)
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a?
 ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170902ed4900b0019a256bfe96sm1684172plb.242.2023.02.16.12.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 12:11:40 -0800 (PST)
Message-ID: <41615dde-73c3-49a9-2e29-c21324265c1f@linaro.org>
Date: Thu, 16 Feb 2023 10:11:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216134911.6803-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 2/16/23 03:49, Pierrick Bouvier wrote:
> When compiling for windows-arm64 using clang-15, it reports a sometimes
> uninitialized variable. This seems to be a false positive, as a default
> case guards switch expressions, preventing to return an uninitialized
> value, but clang seems unhappy with assert(0) definition.
> 
> Change code to g_assert_not_reached() fix the warning.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/ppc/dfp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

