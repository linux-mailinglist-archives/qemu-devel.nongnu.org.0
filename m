Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AE33F987
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:46:13 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMc7P-00053Z-QT
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMc5U-0004OZ-8G
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:44:12 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMc5Q-0005fN-1C
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:44:12 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso839229ooq.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cOwBnXCtNWvJWqPE9f8ycLTGkOM3d0k1MkITMk2mR0Y=;
 b=nHgkq8kjurqPdO0XCcNVvyseWMQ4UtiYAY1KTyab0rUrPIEKUd2Oauo6tqZRuzjIuE
 nMsjR5qEYpM354SLlwD15dBDYisTNJvYdk/sID4/z9gbsi+nZnVZtFGlHYi4WmnX30sd
 dItsLHHEBqkgyFs7DbGh08Ju87aCWAf8XvTh1VNCEKV76Cvj7c+DaU50sI9D3JCB6Hhl
 zv/dSO6tBUPGMWmUyNrSYL0pJBveu/jrYHGTPKD1jfXHuDEek0pk0QMTktJ1tabiU0WD
 1tQiqLPoHR7BEbsyUpActnR/3UmfICxMTu1O3Jh4aC1WxmU33i2uHvgXqFQUvqQcjPjU
 Eq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cOwBnXCtNWvJWqPE9f8ycLTGkOM3d0k1MkITMk2mR0Y=;
 b=a4VIPyLfdLSoGoyp2C0d1Mt4pXC/lP6XNjpqWNaVmREzAJ71FfSLNQ/xgYEokM1wVa
 szi5QOPrbVZC5bP5XgbkS9l1qOt07hivbFSzqfTzIoK9gbP9VatTK/5mRVlbKXiqEJTK
 ax99BfWBW4I+gNVLMEDSWAyNMhhhCW/UN9p5liWKneAGRiEPjtGeMMYjFbP5zBj3v4Vj
 z6iLonv7LkkpBYgI6xX9jdzKG3rsxJOClNC/icV633THldi75eVYTfq6zzsGf4oQFQBA
 BMEZnLlxUgBGUNb5pzvwTkRaNGLiw5+fQt3ny16itdUyhEWpAQMfF3yMIAj7oVk9MkKR
 MQzw==
X-Gm-Message-State: AOAM530R27utyhcoYOYbb98FHW87JlBmld2oYbsDqEkjTvVUdPIA3EwE
 D30PRXVKZ5v6yA/r5QCekewWvg==
X-Google-Smtp-Source: ABdhPJy+YxWi8s3CJA5I76TT9iHYHnY3RP7zp9wlor5UtRd8AwNCogv7UUzKY/9aDfUa5VRy1F0GWA==
X-Received: by 2002:a4a:6b44:: with SMTP id h4mr4553343oof.38.1616010246588;
 Wed, 17 Mar 2021 12:44:06 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm1609733oiw.44.2021.03.17.12.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 12:44:06 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] target/riscv: Use the RiscVException enum for CSR
 predicates
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <9c0fa7d4f191d83ac2e70e830d141f4f4105e061.1616002766.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db7bdc63-2c9b-40fc-f36c-230d32810970@linaro.org>
Date: Wed, 17 Mar 2021 13:44:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9c0fa7d4f191d83ac2e70e830d141f4f4105e061.1616002766.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 11:39 AM, Alistair Francis wrote:
> @@ -1312,8 +1320,8 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>           return -RISCV_EXCP_ILLEGAL_INST;
>       }
>       ret = csr_ops[csrno].predicate(env, csrno);
> -    if (ret < 0) {
> -        return ret;
> +    if (ret > 0) {
> +        return -ret;
>       }

I think you want

   if (ret != RISCV_EXCP_NONE) {
      return -ret;
   }

here.  But of course this outer interface is still confused until patches 4+5. 
  So perhaps it doesn't matter.


r~

