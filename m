Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F75E9206
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:19:25 +0200 (CEST)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOjM-000254-Ay
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOcN-0003Se-Mc
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:12:11 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOcM-0003I7-3e
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:12:11 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id mi14so2728787qvb.12
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gzQKjbR5GmyA7CW4/I00rYihmZIfR24Zm9zAQFZBsyg=;
 b=tazHoA4xI4s4VZSIhnpBqqLxGMAA4oBZ6PnHfMLAJwSnwxd05/KKT2B0P6U6A5eDuM
 q9TKGApVxOQ/iAnsJO7MRg3BMPwlIc4xutbrC+oUJ0UHJj67/XowZA9ucX1oAB+kCwcJ
 aan32ww7l2unSMF/p4cbvRvbn+383YRH3Xno6cTbhSv91E9vuGB6b6Ql3RwK3WCo8b0a
 xOGfvKp3FXtQ3kkru5Li2+5SFZ1QZrKoTXO6GdovOpvSiUwe9NuAjDbRM/mqIHfv9cSF
 bLc73pQ6+RRC8XogeD2E8Uezad33DLMmwxGGvjSR3zACp0ZpSmO9h9v6oEocjb213NP3
 ltcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gzQKjbR5GmyA7CW4/I00rYihmZIfR24Zm9zAQFZBsyg=;
 b=fo9XQ9SYHGRKZi81dce2rmUZBj90+7AvdpajatQWYXTrn54/Fq8prBzlo6R4kPuyh9
 4orkfFDRRhvYW1IE3g6TJqjb2YqLgMMk6ezPz3oCF1BwOsFo1VXxXK5S/SrHgKBreKSH
 3wJdj8PChGIppQsA8R7sohGm2iNdZsZA30eo3bsMC5HOr2mBEsl8lw2nWX53zH+6F2BA
 sz33fe/Qph1OvxwrO5bKwXEdtOb++GXfjFm7fdWmEygKpGUrjA9tthKzTWTUX0SYHhZ1
 30WIQcsFULHr4o6EhIioR+sg1ShbSttgsbG7b4Jv/IBGZhq5qhfw6c0XqDJLMHeJnGNe
 PdYA==
X-Gm-Message-State: ACrzQf15Uste7L043krA/D/qIubiY1K3RfLNg83OGrqFAzafOcKaMBJd
 wijmHgM/Te4Ih1yvnShz2iUfXA==
X-Google-Smtp-Source: AMsMyM6v2HsGWhBhdeq2GAhnUQNAvU+720tZa3CUH5yZZDHMRd9Vh/lLf0JS1+XqsLk/ni7Ufc9FOg==
X-Received: by 2002:ad4:5def:0:b0:4ac:b5b9:333 with SMTP id
 jn15-20020ad45def000000b004acb5b90333mr13364372qvb.121.1664100728950; 
 Sun, 25 Sep 2022 03:12:08 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006bc0980db76sm10019736qkl.126.2022.09.25.03.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:12:08 -0700 (PDT)
Message-ID: <4b2f9900-b936-f069-9808-9b539ec587d0@linaro.org>
Date: Sun, 25 Sep 2022 10:11:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 5/9] configure: move detected gdb to TCG's
 config-host.mak
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> When tests/tcg gained it's own config-host.mak we forgot to move the
> GDB detection.
> 
> Fixes: 544f4a2578 (tests/tcg: isolate from QEMU's config-host.mak)
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   configure | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

