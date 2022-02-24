Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CD4C35F8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:36:39 +0100 (CET)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJuo-0000u3-Ji
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:36:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJbB-0004nT-1m
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:16:21 -0500
Received: from [2607:f8b0:4864:20::533] (port=40760
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJb8-0000xZ-Fq
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:16:20 -0500
Received: by mail-pg1-x533.google.com with SMTP id w37so2548454pga.7
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5oPEjlC9TIcWZgxaFX/NhWfLlYHLKj/hJ+r9HWm++vc=;
 b=PP7tCiBmOjpovXuSYQhkixpzJvAP2dYKEbN0UO8X0RTqg1Ui3floOgWvAVbMbqFGjZ
 rHRKPK6LEBGUHqyRJxtFGOSq5HZ/zjbnKc53Nt+azXgGgOaKeMUZ/kFmPWXjqh0BscYq
 D4MzhNvBVn37rxbIwDM1Le5394Gq/hwejZE8SxFo/SeIzEEvS0NX0WQqSLGxZ9cmCGaU
 Y6r+LLmf2C4StbjcBrFJfthpdEVyDawpswXbJJA6gk6qtsNNdohYJ29kR3CwcPzL9YJZ
 dWNvk7Y5tfY5JfPSKUMU+H1lV2SpVtU2gQ+B2l03nqQEAKdsnZw0sQYnCzcmIk+pl3xo
 lYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5oPEjlC9TIcWZgxaFX/NhWfLlYHLKj/hJ+r9HWm++vc=;
 b=f3rlYC/96KPj8iSwcxIQX5fi8bNCRoi3SFTypvMHDAkP3LZMWPbzDsqaEpa53++Aj+
 6vGzSY3dJDH41xLg9aTbHseT9dbH0FQJKlPtpUoQuAh5A1TgOOtArgv8TNgqtQ7CMIk6
 KM7pCRHbFWU6jXCgO2jqATOJ0QwGm0Qey4qotqhl+7qPHyVJ3Wa2dVp/XHtlnjZwRmL0
 gDCR8yelGb/S5fdvNPDdmLSR2gZPoYhMq+Ni4kuk9JLjIrnLkhliiYJTmQViayuTGI0K
 krqXymsjB/+DWOkHKYL7qPRmIO0SvFB0iDQ6kbJZotlD71MTbGUn+sg46UAqx0mwE/4/
 9x/w==
X-Gm-Message-State: AOAM530XynMDKttmhHGxP3nlDAbnsaHWyzB8oZ1hFCrrujIy5ttk/NPl
 rv+aG92KcJiQx+8RxQHt94Stuw==
X-Google-Smtp-Source: ABdhPJw1mkIljMtAnmEkRza53u2CHEZsg+8aeyJwE2iWwLIYgXCFEpIDAQTmqSjr0Rqsrk7yRhpzbw==
X-Received: by 2002:a65:6842:0:b0:375:983d:7e5b with SMTP id
 q2-20020a656842000000b00375983d7e5bmr2104049pgt.496.1645730168003; 
 Thu, 24 Feb 2022 11:16:08 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00174800b004f26d3f5b03sm286790pfc.39.2022.02.24.11.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:16:07 -0800 (PST)
Message-ID: <57482894-73e4-7bd5-b38b-fe73c3a63637@linaro.org>
Date: Thu, 24 Feb 2022 09:16:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/12] compiler.h: replace QEMU_WARN_UNUSED_RESULT with
 G_GNUC_WARN_UNUSED_RESULT
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-2-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h      |  2 +-
>   include/qemu/compiler.h    |  2 --
>   include/qemu/range.h       |  4 ++--
>   scripts/cocci-macro-file.h |  2 +-
>   block/qcow2-refcount.c     | 20 +++++++++++---------
>   scripts/checkpatch.pl      |  2 +-
>   6 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

