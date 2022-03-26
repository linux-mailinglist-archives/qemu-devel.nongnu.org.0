Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F94E80FE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:14:17 +0100 (CET)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6FE-0000sG-0z
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:14:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6EN-0008Tg-Hd
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:13:23 -0400
Received: from [2001:4860:4864:20::2c] (port=34068
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6EM-0003Hc-0M
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:13:23 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-de3f2a19c8so10736503fac.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZhRIoQNLXj7v9P+Rs3MJIulwLgSadY0Rq9dVyJ1IdcI=;
 b=QWYmytRQL3fMM91JbPZ656lHhWfA+RJ91fDXqdRQV1sh09sL2+WW8gIHRzHACxr/zl
 ZXLoX0heIl7hrRPw7IfqIdJ32sOm4OdbUNbhhT1FbUIEsFpb7blHrZx6KHdzjaMW8Gij
 GuDX3gh2mgQQXtN1Gb9AUMZUvsx5j1NbEUaIOOf/l7qX0RV41ze2eBU9rzJhU+DnGQzy
 TMNmDidAcfKCuk77Npt8UUIqRzZFOnEG9l9crbC80c+OnDwUgrDiiKDgZo0K9Rw3cJOv
 GjOm5KEsaw3r2sx4nfLavYohG9KZUNizOpIs1X95YXlNKor2zersJpqWfzLnPE08i44I
 EgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZhRIoQNLXj7v9P+Rs3MJIulwLgSadY0Rq9dVyJ1IdcI=;
 b=QKTiMoC0tqp3yoLEwmVKeXGzCG89EuzU0OLcRlOk7aKpPVyppWLsSjo9W9sP++6lro
 J3lUpjlO8nDkSBGsfBILW7ez03I3Cgw69HmxnZJbubPzuX7uyT/KfHO/OP/1FNi7PHIk
 bfJFZIUKduRG5eEoZGQsU9G/usGHwTDXtQAqhg+YCyO0VXOEmcjyImTTjRxGsXf2UOEj
 JbHTqAjczzsAx+7qqa2wdzRlOfrR8y4QYVpQZjudmCeq1FmSdQeP1r58KLq7+cSQrIiD
 8saQRUe6TjzHX9QzdT7szGl7HGv/5sDX61c1DNkQ+M0ynjIhGFBgyYr4+j5Nbuc9o1tM
 1yEg==
X-Gm-Message-State: AOAM530WMjGrJ81G5lT6FwuGeLFxok+wqze1UHa2KjUBfkdq38NQLg81
 kB7GUnyhJuu6Znk+Yn5dJgvqdg==
X-Google-Smtp-Source: ABdhPJw4Sz3Ytgb8Yp3OC8gQ36dBdoPEdtvUNZBtuc2W4Dq6dkZULgDYXDcaedVrAKOv8YJ9B2tUXw==
X-Received: by 2002:a05:6870:a70b:b0:dd:9cf0:763e with SMTP id
 g11-20020a056870a70b00b000dd9cf0763emr11695945oam.116.1648300400748; 
 Sat, 26 Mar 2022 06:13:20 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 w4-20020a4adec4000000b0032109de628esm3978829oou.6.2022.03.26.06.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 06:13:19 -0700 (PDT)
Message-ID: <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
Date: Sat, 26 Mar 2022 07:13:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/6] Port PPC64/PowerNV MMU tests to QEMU
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 13:08, Leandro Lupori wrote:
> To be able to finish the test and return an exit code to the
> calling process, the Processor Attention instruction is used.
> As its behavior is implementation dependent, in QEMU PowerNV
> it just calls exit with GPR[3] value, truncated to an uint8_t.

I think you're simply thinking too small here, and should consider using the attn 
instruction to implement a full -semihosting interface.  You might as well join arm and 
riscv with CONFIG_ARM_COMPATIBLE_SEMIHOSTING.


r~

