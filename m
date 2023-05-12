Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502F7003E7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 11:38:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxPDI-0001J4-0s; Fri, 12 May 2023 05:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxPDE-0001Ik-2A
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:37:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxPDC-000051-4d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:37:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so9025470f8f.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683884236; x=1686476236;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=o0W8fbvaq/veR/773+dfwlHXK8TABNbUHDrfLEddc5Kq4pge2MkISBPbCTbXDjruKZ
 JmlEJImuH7b+Ngv4nGjkXpzoq6kC4zdP2UBJ4CSGOnL6ZYi7TTinegYc2Vu4GJJV7Ic6
 JkEW/nJEnP1XRGSHizBrxARWYPH7JyFhtHKU2ldKV5CCHiOlLfjRDH1AVUfOXjGx5jXg
 jkZHjIRYatqxMZT0/1iOfNEAlAXKcAPRBQJGBs64d7yvjmn6+CyYwuS6QjO2/mtUek9/
 9NUUfaw4M9CFEIqdqJSjidAA6Ojhhzrx5RW0OquDqjXWiQUiJecwasTNk0V8W+f90N+y
 EVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683884236; x=1686476236;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=20mL6ahqZNIiZWHzDkwRRqSTrSHs5qvtBtXea5jtm1c=;
 b=gG4JD2UDIX9cA/i0xj404cQIyqXOIvTshBglqiwhuVt9E8wpIDr7oytiZMiOc7rENE
 xfxUZBqUC8Z1v6sz0p5s6oorBWTQ/hfVFB5BnpG43oVT5dD/v1ww5O77+0sUHqzTDS9h
 Qh35cxotdeD9qP9gc+9PQPtu/hztSigRKQ1cVD0OSJIgcNA4D26Yuhq+YzfKQa2jMBhV
 VPQpTun3gtmztl4HH3UOESaj8OvD8sbntREJqknl1vSab6rKApJTZIQ7mc9J+55RTVIX
 UYazWLcIY78aX30MnoeV8/kmbcm6lfkR4yEo+wibJ3u2B6WQani+8V3ZKa3l9+hjiUnj
 we5Q==
X-Gm-Message-State: AC+VfDypsRyjHZRad7lzAuYn092O+3ONv1bzCLPOxCxf0O0E+2m+a+/V
 8qAjTeYavM8CYV/oV+6KKmxSPQ==
X-Google-Smtp-Source: ACHHUZ7Yrw5SedJMxpa+7I32dqyEhny15Yp7caZEXLaSndbGCKtdkOBZLOpFjG5snrPJbLu1q6pEXw==
X-Received: by 2002:adf:e9cc:0:b0:306:45c0:f070 with SMTP id
 l12-20020adfe9cc000000b0030645c0f070mr18545948wrn.39.1683884236427; 
 Fri, 12 May 2023 02:37:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n18-20020adfe792000000b002f7780eee10sm22948758wrm.59.2023.05.12.02.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 02:37:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6C1B1FFBB;
 Fri, 12 May 2023 10:37:15 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-30-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 29/84] tcg: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Fri, 12 May 2023 10:37:11 +0100
In-reply-to: <20230503072331.1747057-30-richard.henderson@linaro.org>
Message-ID: <878rdtyjp0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses replaced with TCGContext.addr_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

