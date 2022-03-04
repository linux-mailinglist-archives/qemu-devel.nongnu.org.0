Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728A4CDF05
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:00:49 +0100 (CET)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQF2d-0002x9-5O
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQF0M-0001dx-AE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:58:26 -0500
Received: from [2607:f8b0:4864:20::42b] (port=45909
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQF0K-0000vn-Kj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:58:25 -0500
Received: by mail-pf1-x42b.google.com with SMTP id s8so4517299pfk.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=zRQUS9wz1uD3AG2A8PfxxuOkV8R3OB00pnlwwNVu40Y=;
 b=u2YpLFfUPsP8dIja41rPHyatiNGvVeZ76GUxyK+0k4X/5nW/MkXohDFnSBE7kRyiph
 Cybac8BE4ppmF++N7gG+dxmii3j+im/O4uUD6qcl/ixzbUvoZ0nRp5rJvW60JHfdOXMW
 zxiiPXE7LpQyR/i4fNsBKAxdT+Tz5SiMVnn6CkR1AOvs+qOg2oYwF7mjnMo8JSNRHk0N
 s2+3FmoMkjUUYhXT1EtC4eYCS8wyNC6CsNzkO1MSGGH6kiGg5GccamSqQn41VazmuGob
 9SIZFFO4L1G9bid3u3CmKKfomaZh5MZPgfRnPabeVDSRlDdgXsuVy2bP7vxgJNtdYSCs
 rBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zRQUS9wz1uD3AG2A8PfxxuOkV8R3OB00pnlwwNVu40Y=;
 b=IDosh7RvxDjejaHe8HpiAor2NkRORUPG5LgAoGEXI89cBwp4TpM2k9h0sJo1IudhOa
 UGwsUwxJOWkfrULUXUNhDnte0MAj4QkM1W5Tz0ZzWkHYx/uzuiZDicogfl9b8ogERwgu
 46DPas/GhwOX2+0eXNFx4GmdvPNT2GT9Oe2X7553qGSqUvAEq4NvvD1cYvHQV8YzoFdu
 78ZRHe6YRrTUYAPQaD+qVRYvCHgNDbQ6tppXpE2ZxqMRiaA+F8D4jMl6irkcFyg2EfGx
 0N3z+FCiVpIJsxu30G8tchrG1gf+TW8+5NAV0fToL3E3qSIi89PoA1IsbdUiLdhCgWNT
 IZug==
X-Gm-Message-State: AOAM533rU4KbcRZFRjia6z4GHj0JYomtj4GQjDKeQ/Wh2gX1qc6Rl1Tt
 PURUhTUcomgUAa5PYDl+4PKwSQ==
X-Google-Smtp-Source: ABdhPJxIKjs+IDhsi7bLHl98mSUhAJ61Srb9crpeNOdMwO7rd1HVvjPLGx02S4OCjn1BfjMQUwzpiw==
X-Received: by 2002:a05:6a00:15d5:b0:4f0:fbeb:6007 with SMTP id
 o21-20020a056a0015d500b004f0fbeb6007mr453308pfu.17.1646427503109; 
 Fri, 04 Mar 2022 12:58:23 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a17090a910400b001bd171c7fd4sm11341544pjo.25.2022.03.04.12.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:58:22 -0800 (PST)
Message-ID: <20c82322-85fb-3159-1874-a23a8ec312e2@linaro.org>
Date: Fri, 4 Mar 2022 10:58:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] oslib: drop qemu_gettimeofday()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-5-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304152704.3466036-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 05:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> No longer used after the previous patches.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/sysemu/os-posix.h |  3 ---
>   include/sysemu/os-win32.h |  6 ------
>   util/oslib-win32.c        | 20 --------------------
>   3 files changed, 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

