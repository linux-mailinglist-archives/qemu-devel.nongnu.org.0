Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC79201E44
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 00:56:28 +0200 (CEST)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmPvv-0002sK-Mt
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 18:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPv1-0002Jq-GB
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 18:55:31 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:38022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPv0-0003Fi-4v
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 18:55:31 -0400
Received: by mail-pj1-x1041.google.com with SMTP id d6so4963058pjs.3
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JJy6te62vgLsFiwBnTR022jPSplVVJ3aectN2uosuLg=;
 b=Rh9dX1RI6W9OcruHBwRy8pE8OIapQbEcDu5XDzUaDhaBCB1rz5WY2UyLbFVaOXroLi
 E8wRa5fxGLHskmZAR06onKBDkvrVFdzub5TB6RvcoM1o/Dtx8dB/zocjK1fN/ifEPKTB
 u5nQEp6o/O6uwlXhVW8JfOp/jm2h8ulgQdE25nn+J0PoZVl420VQKybKsA0qPaLmbK4r
 03WSUJobJ31jDYr1kZr0rrZbbpy2RUaCyEcsxRl5O7G9j0hAvLqKmdWuN6YBdp9PgGFi
 jx2JxDa2n9AmFkO7whARiML2jZ+hPbbzG0Tko4BPtFDniUx+kVYjLNU9hw2d/lw7YEc7
 uaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJy6te62vgLsFiwBnTR022jPSplVVJ3aectN2uosuLg=;
 b=h6ZqYqd1Gg29CXqcbNIfHlgR47JQdsxd2heL3qw4hY0MJmo+ntVPDPxIktwwaxUzvY
 3i3TP5liV3gonCgPRV03/56J5RrnZYS9YxLNmjyGE8oUyaxXffuGbIIGHXMHSBfucubC
 JvtIctkzYHNmQOpAQvwiajnBZOTYy5SaCX3z0eCLVNjexyE9WKMgSX/vwWX5pa6cOfU/
 6fXxpQB8ma1jY0cOemoqhiGMXCkb9FVI0iIFpYcwDSP7uGXlmbWdYr8+gXufz2e1kZUq
 tisy+zwOBLwfDrIjuLPaj465TDS/4a3ReEY44Sh8sYb9lkHo0HFgQ+T7mzZpzIcmYEYV
 V0Ew==
X-Gm-Message-State: AOAM530XwaKvJH8L1qL/yTRO2JyYDxThpKj51xkA88xYIWL0HURIpEAd
 IiIoLdXNH58soK41LqgRBjw077Mx+0c=
X-Google-Smtp-Source: ABdhPJzsIGJBgrRh+3bkSyC1nC9tujFIEnKXvNeJ/SSsY3dAWAyD+kXiVXCVSDQa6pfEEoRXpVqRKw==
X-Received: by 2002:a17:90a:f414:: with SMTP id
 ch20mr5440387pjb.97.1592607327323; 
 Fri, 19 Jun 2020 15:55:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z140sm7063799pfc.135.2020.06.19.15.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:55:26 -0700 (PDT)
Subject: Re: [PATCH 05/21] target/arm: Convert Neon 2-reg-misc VSHLL to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e19ef48-a3a2-ba5c-d2b0-3135e944d89e@linaro.org>
Date: Fri, 19 Jun 2020 15:55:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the VSHLL insn in the 2-reg-misc Neon group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  2 ++
>  target/arm/translate-neon.inc.c | 52 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 35 +---------------------
>  3 files changed, 55 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


