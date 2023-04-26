Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293DF6EF978
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:33:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj1A-0005qF-5K; Wed, 26 Apr 2023 13:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj18-0005iT-8l
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:33:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj16-0001eo-NX
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:33:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so4659390f8f.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682530398; x=1685122398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KB6cS8DiRbuBWkENfUYnsa8npsJ65wlXcElLy1+NDw4=;
 b=zNy/VDjDmzBbbN84acsDIjbmrQT6cbt+gZvQ40vi2RCisL0dvzmveND2SUsrUXRoEw
 DHUsP0eGLrq55ogRdhY1VcgJbSFA8AzJThod/q/6/k2KNB40ICBdMlO9ugXWakuZm/aK
 Zr7q63pFYPsaPvTvBZHXM/ssTDnQ+NLlKL1PnJyoM1gkb+fqBPWkt2cX2Brx8m2acRJ4
 QIB+TcDOw5xzDoFrjmUHSZqDWjoxoovyTn2OScFxEKf3I6cSz8cOmeqUOA9mN0H8M13Q
 WlUO0AOFdMP+gV0LPFa60T6tKk3qxeF+tw44s3IYqkMDkc/AEPHZ5GgDJ/VyXnWH/Zcv
 JDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682530398; x=1685122398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KB6cS8DiRbuBWkENfUYnsa8npsJ65wlXcElLy1+NDw4=;
 b=bc2UCwbwD5E4Fy8zOTDLSwX+PnLal0rJJ63elxOWAoBJThPyKHCgnEpUXjS/wv0zRi
 BnhB6H3tWgIQbgxqMEO5b4mJDmj7QdzBr3ZpU1aRUrms+Bh3xOiw0yPvpQnfMA4+jfUj
 7+xCaRBDpdzqiOX+lNBwufdw/Mdz0VTgHHwf0PQm5AA+pfUTglGgTmQWkLU7eWQkJ/2f
 Q/rbeyIf5ErpH0l3Sh0FDenolC9qgUwrzraKKCZ/ilZvU9w9IHmAKBU9u7988qTqhLoL
 jB2EqDNhrS08aGuW7z6lL74B5poN7OAfQqHtOnYjENW6DDAJ1S++sm/akLnIWD6gzpF7
 ijZQ==
X-Gm-Message-State: AAQBX9ckU+wnkyQSAz4+vtaHqQhlM2MxeCZSMCi/pfyXjBucq3TsIBH0
 Xx3aOMxZMXO5xRH4rS/aLkYyMNJpPl8ScDIZk66dpQ==
X-Google-Smtp-Source: AKy350bs4w+qfja/+CsF/8v+h0PWi63oINt9wPzMskxe5HENXZLo7nVeVcGsh8l+tmvPJ1avU2KEBw==
X-Received: by 2002:a5d:4109:0:b0:2f5:8116:6453 with SMTP id
 l9-20020a5d4109000000b002f581166453mr13709284wrp.61.1682530398403; 
 Wed, 26 Apr 2023 10:33:18 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003048084a57asm6788460wrz.79.2023.04.26.10.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 10:33:17 -0700 (PDT)
Message-ID: <4ec9fd08-11fb-6ab3-00fb-15948fbd1227@linaro.org>
Date: Wed, 26 Apr 2023 18:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/21] Hexagon (target/hexagon) Add DisasContext arg to
 gen_log_reg_write
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004105.1318844-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004105.1318844-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/26/23 01:41, Taylor Simpson wrote:
> Add DisasContext arg to gen_log_reg_write_pair also
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h                    |  2 +-
>   target/hexagon/genptr.h                     |  2 +-
>   target/hexagon/genptr.c                     | 10 +++++-----
>   target/hexagon/idef-parser/parser-helpers.c |  2 +-
>   target/hexagon/README                       |  2 +-
>   target/hexagon/gen_tcg_funcs.py             |  8 +++++---
>   6 files changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

