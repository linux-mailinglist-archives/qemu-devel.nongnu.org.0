Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB06EA5BB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:21:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppm0p-0002Er-9h; Fri, 21 Apr 2023 04:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppm0m-0002Ec-PP
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:20:56 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ppm0k-0006tq-W4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:20:56 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so1392464e87.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682065252; x=1684657252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tzjJoTWeKHWeKWrS+aXqrjrikM6pBgRnO52mtBQivYU=;
 b=PZztsb6AA7bEuiXmZtuNlE4SF0iEn2oqMFrCSSJS16DkiO0Y551az2ogBtHQIiVnhq
 StFFPJz1nJE0RKNOO4cJtTSKNMJ+erKeRo32Q9Sz3YDN+pCg9GJ4GZl9vY9vxmKJQOWY
 3iXdzjvXG+cS++uiY+COD1N2cB4rwu6LWjbAA0ZA9VsroZGwo1MkmsBH38c1CrjAzuZ6
 5lLrx4KAOzFptcgnWU57T3o4OpgXD+zMqIXvRW94eMp70OJwRY5tCjT91VXO/Z8KUjUQ
 EJVDBGt5xBdPqmDrm6tUAhDNe6T7vo7om8VwQdKTNgjOi+iTCWo9qk/Zd4qrOpurJQhY
 r/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682065252; x=1684657252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzjJoTWeKHWeKWrS+aXqrjrikM6pBgRnO52mtBQivYU=;
 b=ck7eiYzNHwOJGJRj/9nLC/TdT0toyI5W26fWMoaQri9sweJMv5Qk0Gt+kU++gtPQW/
 MDJAJD5PhNKJ0w3+fsNJmapQqPUYRl8wgWkcR87+acDMMPWiVM6K+qeR8WQAhv1GiGK+
 vRnrMJZc9FT/LegogGh1VcQE2KrJcVVQFsMZYoooQ2Hag/2WP4JgWgOMk45ZMJzD+k+8
 7D7GIyts115wcCTjRRUvliN2n3YXCEmSIHr7LuRYg5MazIc6TSFuaC/x2MgcIm/BrXa6
 1EhOUgja7/8w8il9XgcNwszA3slXWGjG8P/bQ1aLl8MSjTiJmjMcxK2OCo0iWEcdA6Ec
 MAFQ==
X-Gm-Message-State: AAQBX9cvXGwoKDKHn421bnZnS+Fyg2OLaIV7nSqSOBO8TU2Y4dnyjHTF
 VXDztOAweLzayZwtpm57sD0e+w==
X-Google-Smtp-Source: AKy350aPm1w0YH4QVEWoTvKqotiff7S6rQ80jh7oYJte9PjvqdwkC9e8bWRUQbmv1k9fdNjFM/U6Aw==
X-Received: by 2002:ac2:561a:0:b0:4e9:9f10:b31d with SMTP id
 v26-20020ac2561a000000b004e99f10b31dmr1295778lfd.2.1682065251815; 
 Fri, 21 Apr 2023 01:20:51 -0700 (PDT)
Received: from [192.168.138.227] ([91.209.212.63])
 by smtp.gmail.com with ESMTPSA id
 y9-20020ac24e69000000b004eb44c2ab6bsm479868lfs.294.2023.04.21.01.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 01:20:51 -0700 (PDT)
Message-ID: <dd2f435f-19f6-b325-4594-89fda118eaa7@linaro.org>
Date: Fri, 21 Apr 2023 09:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/11] Hexagon queue
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com, ale@rev.ng, anjo@rev.ng,
 quic_mliebel@quicinc.com
References: <20230420032634.105311-1-tsimpson@quicinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420032634.105311-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 4/20/23 05:26, Taylor Simpson wrote:
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
> 
>    Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/quic/qemu tags/pull-hex-20230419
> 
> for you to fetch changes up to 073de8caa8f9013b4dd8613df29d15d7c42aa8f4:
> 
>    Hexagon (target/hexagon) Additional instructions handled by idef-parser (2023-04-19 20:13:20 -0700)
> 
> ----------------------------------------------------------------
> Hexagon update
> 
> ----------------------------------------------------------------
> Marco Liebel (2):
>        Use f-strings in python scripts
>        Use black code style for python scripts
> 
> Matheus Tavares Bernardino (1):
>        Hexagon (translate.c): avoid redundant PC updates on COF
> 
> Taylor Simpson (8):
>        Hexagon (target/hexagon) Remove redundant/unused macros
>        Hexagon (target/hexagon) Merge arguments to probe_pkt_scalar_hvx_stores
>        Hexagon (target/hexagon) Add overrides for count trailing zeros/ones
>        Hexagon (target/hexagon) Updates to USR should use get_result_gpr
>        Hexagon (tests/tcg/hexagon) Move HVX test infra to header file
>        Hexagon (target/hexagon) Remove unused slot variable in helpers
>        Hexagon (target/hexagon) Add overrides for cache/sync/barrier instructions
>        Hexagon (target/hexagon) Additional instructions handled by idef-parser

Fails CI job clang-user:

target/hexagon/idef-generated-emitter.indented.c:32174:39: error: implicit conversion from 
'int64_t' (aka 'long') to 'int32_t' (aka 'int') changes value from 2147483648 to 
-2147483648 [-Werror,-Wconstant-conversion]

int32_t qemu_tmp_3 = ((int64_t) 1ULL) << ((int64_t) 31ULL);
         ~~~~~~~~~~   ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/4153502279#L1140


r~

