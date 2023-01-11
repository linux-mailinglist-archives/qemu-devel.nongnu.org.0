Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1E6667F0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFla7-0007QZ-QB; Wed, 11 Jan 2023 19:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla6-0007Q3-1x
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:34 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla3-0001eX-Ns
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id dw9so16108759pjb.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j1RG1KdJ6kTyRmwJJRR7Rf8+x7u3WP5Km0Ki6BNxsss=;
 b=xvKQVfdVdppIZtkR6vqVjltWw73Jymfzo6BTubSokJwz0kK4Zc0CKXkuhx0REf/rrT
 /n4u7eZkc8MT6sgRmP2I4R+NWg1UqMPQ02Jmc5zGJsJaZg83sZq81CWhFqo2LD70SCZU
 GIrnPCCRxDEhLrJOWaDlrZ8eGLQctUhAqXeyrMiyzV/CHX5n2ipqijEbTvKDJDL3JUXH
 b7EobVN6hCBj0C9mR226Tl0DuJ63IIiBWNakz5TN7R4/Aei+G2O7FW57tyMXxlZ42hk9
 p6QlTGHgMluhP7inQbDl3E5vq4u/nSMkb9Jhf5voQbQ7WO0RrWGlDB4IVxTtLGhCZ2zJ
 gNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j1RG1KdJ6kTyRmwJJRR7Rf8+x7u3WP5Km0Ki6BNxsss=;
 b=LcY7emJj+T59YAhXz1krhL/TM5pgXQjEaPwq3EgzpI2ABeZlBNoNTsdLo6xAW0Y3WH
 fUML/3I2ZcMKaaGBGH0C033uAlxv4OC+jxY8cIYu5EX2aGFHqZ1tOzWUGY+0IL4yaECJ
 D/7CdLezCrUtyafD/9+Ak0lOa76B+Ik7Gzl5xfp+inonFCLax5cNgKITz5NLihzeh/q6
 x0WDJ4RiHKaMvLvWV1oaDixjQzAEdcz/YoYc/uIt+J4E5/C3BL2uyCEYxLRKtEESXb0r
 NYlzItpnS5dqyoy5xDlNggVmaYmi6a6a1UsaPFTQuwHeDiQGaEUqQ5QgoUQo9GigfBuI
 K1TQ==
X-Gm-Message-State: AFqh2kqRpCebrhcAZWkghj6Hs46fhXVFDKAPlka0OYofSEmhglbxtuJB
 2gJdWMYkdiN3kAajRSe09nFb+Q==
X-Google-Smtp-Source: AMrXdXuqSDl1Y9Gio2bHXRD43LYo2XNocEudDUwOMSlVlabJLS91IWGDE7G4xjO7jH6c65JoDg/d+Q==
X-Received: by 2002:a17:902:f691:b0:194:4a8e:7eee with SMTP id
 l17-20020a170902f69100b001944a8e7eeemr6639540plg.65.1673483790506; 
 Wed, 11 Jan 2023 16:36:30 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m3-20020a170902db0300b0018980f14ecfsm8044114plx.115.2023.01.11.16.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:30 -0800 (PST)
Message-ID: <431df90e-f455-7255-81d6-bbabed8f162c@linaro.org>
Date: Wed, 11 Jan 2023 09:06:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/26] semihosting: add semihosting section to the docs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 09:39, Alex Bennée wrote:
> The main reason to do this is to document our O_BINARY implementation
> decision somewhere. However I've also moved some of the implementation
> details out of qemu-options and added links between the two. As a
> bonus I've highlighted the scary warnings about host access with the
> appropriate RST tags.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/about/features.rst    | 10 ++---
>   docs/specs/index.rst       |  1 +
>   docs/specs/semihosting.rst | 79 ++++++++++++++++++++++++++++++++++++++
>   qemu-options.hx            | 27 +++++--------
>   4 files changed, 95 insertions(+), 22 deletions(-)
>   create mode 100644 docs/specs/semihosting.rst

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

