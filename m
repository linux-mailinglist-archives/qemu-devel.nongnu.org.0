Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D853A6FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:14:31 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssyc-0000cZ-4D
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsswp-00067G-Hx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:12:39 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsswn-0004fV-D7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:12:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id i34so9563692pgl.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G4N0mW6oOIUt/fa2h8B9pfvnBagaIZfwHZ+0OwOvWyA=;
 b=tblGaanTjWSzSbudF8EeEcGo4JWsVl4nv+WjaaSe8tnXaazbqfDFczAtdYUOdiqcCt
 a3nCqlE5YWA+YP1p6K48WX234UwJlCWNYVDKwPftg8R/7qleA9Dlw3ZSf8sFYKPq4rVP
 WEmCxfj5KC/g3e2I2P74/9cGto7AEs4EuUtLU0Rd9QOVc0H3ox1eqenfqfCPgcNloTyA
 uzGdcdTE+M7r9LbzdfxiVwiFGOLncEHtXxvR/NkB5Bw61gpWTvzmMbbcLYZmVA6OEuR+
 HBf1Y1oephkcn6A8n/taX+kXIoTvff7hwazs0IgvUClFYHGUhvIMwczq/OxEyljFrNro
 G7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G4N0mW6oOIUt/fa2h8B9pfvnBagaIZfwHZ+0OwOvWyA=;
 b=TI/98VVmv3pUIzW+a3sAsFM6CAvLzVDECS/ja23xG8/EZKiR6W47kSS4NBLj5K7q/f
 +epJ+wLM6DVpNzvDrb8BDIfUvgRQ8fEFEQyk8h9pIHTOq9gpARDRK0GNRU8B/9BPKW/w
 mF/jJIW1wchSQDlcJjZdhHd9hpibHOsuB67WMXp/VM+s9Gr9GlWQ3n+DOA/n5pw3GNfr
 a+7eRfYBXg4308Vn/oglp8/ESDHFpZdWG2r4qHlO9UFbnx/TZiq88Q2MlLwMoj9jNC/P
 TlNnvyzAgcbjNWTNyDEwKYCuzJJhDrBITsaR+kANwrbidouWHuuH0jpGT8O9TZqC9z6Q
 4+dA==
X-Gm-Message-State: AOAM532Sr7xRjdTcP1iyLUrfh039Vkvav/8oSgRDU7TJj4W40PgR1Hr8
 mYzgINuP4qOLEVATwMLH1idBYa8HtfuAjw==
X-Google-Smtp-Source: ABdhPJwoS92o//WmOU+6H9Cm4g4noxMdp1afsfKdIr/BQkDPv9buHuKY0SDw4TYSMDPKg5GpXF1L1g==
X-Received: by 2002:aa7:954c:0:b029:2f5:33fc:1073 with SMTP id
 w12-20020aa7954c0000b02902f533fc1073mr609306pfq.79.1623701556027; 
 Mon, 14 Jun 2021 13:12:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s4sm215174pju.17.2021.06.14.13.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:12:35 -0700 (PDT)
Subject: Re: [PATCH v2 21/57] tcg: Make gen_dup_i32() public
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <786a95b8-8b42-1455-e4a9-27b0094e13a4@linaro.org>
Date: Mon, 14 Jun 2021 13:12:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> The Arm MVE VDUP implementation would like to be able to emit code to
> duplicate a byte or halfword value into an i32.  We have code to do
> this already in tcg-op-gvec.c, so all we need to do is change the
> function from static to global.
> 
> For consistency, expose both the _i32 and _i64 forms.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I picked tcg.h just because that's where dup_const (defined
> next to gen_dup_i32() and gen_dup_i64()) has its prototype.
> Happy to move the prototypes elsewhere.

I would definitely rename them to tcg_gen_*.

I would put the declarations in either tcg-op.h, with the other scalar tcg_gen_* 
functions, or at the end of tcg-op-gvec.h, with the other vector-related but still scalar 
functions.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

