Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FFF5E8F9C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:22:22 +0200 (CEST)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBfJ-0008AL-Ik
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBd5-0006Mw-Av
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:20:03 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBd3-0001NE-Pb
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:20:03 -0400
Received: by mail-qk1-x734.google.com with SMTP id 3so2056982qka.5
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=oD41erK8C94SJ8AtaWcDNrKOI0ZIbUPegqcHIqjEgL0=;
 b=vzxtltssEANOBR+ukxkpXtTsxhLNyvcttudBWQeYSunqczdwkcYQgPG29XlDLCwMEN
 EDbrtRVcLphdjgjkjejdbY3YupBVrtyzJNKtSxYPGn91SubLh7CUwoeq64ysOg33BXYc
 M2lsESgXQPExy719Gk4bXFz4+n1FikoJp6lylYkW/ZYuwGkKKolryXVpJNcSHsq++JFJ
 w1w85dgO88++lk3pLUJhpZHfGrQI2ykbGiakmmiioyh7NY2Svg68lmtmrnOdObr1G9Gq
 jIrQEfYTnKefVnFQPYQmaTvpuxjbFWjfdewuwSaXNBwCtvn6UYJMevxNjTrOCl9IKxbG
 N7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oD41erK8C94SJ8AtaWcDNrKOI0ZIbUPegqcHIqjEgL0=;
 b=Qp+AZW1KeMAeUI3vezjyK2RNrAzd+Kgl/p8ahlQJ3P1R9cFgiLTiUAtgpyJGJdkwAS
 gU7FxmLIy8VXneG3Iinh/bz/v+VA+0+zcw2ftQGFYtvHkS4TK+loSGnUcC5fRPUQxTEB
 OzW0IEZVxCiFt33gwoBz2/FRjtKmEbogW/0ISpG/dU0dGgKbTWJEhejLd4+qDbW0M0dX
 5a377e7lyyjnZFOxUckNheQVHnGBjBbA6L4HxfD1OhdyiwIAuomeoTIHUkyiDCaBkKMh
 uoTrKrBtmmOBm+IfKI+NacAsPtd7VTHdwHYNjFT8HvI2HbNL0mD8EbOEP7gJzpHe6e4E
 vyPA==
X-Gm-Message-State: ACrzQf1YTL/eccB+Z/qrCMaGwSiuZCO4jreh6FPuK2iZmGN13Y0XCTYw
 VYxhuaK4aGi4DRDea3XdZZxDVC/q+2bKr/TK
X-Google-Smtp-Source: AMsMyM6peqTRJwRR5QEh7fzTdI9uTpcb8gR8XTYTi/yAzXIb43UsN7uuMrpZcMuGX7kz4kiGNiHERg==
X-Received: by 2002:a37:b247:0:b0:6ba:ed13:dd89 with SMTP id
 b68-20020a37b247000000b006baed13dd89mr9591509qkf.771.1664050800493; 
 Sat, 24 Sep 2022 13:20:00 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 z12-20020ac87f8c000000b0035ba7012724sm8435820qtj.70.2022.09.24.13.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:19:59 -0700 (PDT)
Message-ID: <bf00077b-7965-b050-aeec-aec18aea410d@linaro.org>
Date: Sat, 24 Sep 2022 20:19:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/37] target/i386: validate VEX prefixes via the
 instructions' exception classes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> +    uint8_t      vex_class:8;

As before, "unsigned", so gdb doesn't present this as a character.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

