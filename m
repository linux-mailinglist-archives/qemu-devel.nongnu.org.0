Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516631BF2F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:29:55 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgl0-0001FQ-Jv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgji-0000GT-QT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:28:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgjh-0000ty-3J
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:28:34 -0500
Received: by mail-pg1-x531.google.com with SMTP id t11so4485229pgu.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YEMGBxsQUNvp2PjonSueQwZBRSyLbY8BmqfulY2lSn0=;
 b=Cd6idMbA/Q2Sy/vgu1m+WY05caTlkMXw0qhyvL9avwbR+DMQVeQIwz2URk5qlRTUBi
 OwK83gaJbWqzko9ZQj+92HAyWrnZt3h81aJAafMiSCeeMNAWmr2ULEUJzg3MgNST2iwx
 0rqsaEwSUCpzb2V9ZeHdYONEnGVLh1HceSOHFqqg6HWqSRBQMa+MhKBoCoyqOI6JDL/2
 SoRK05IOvtVHeNzBB9YM034TakAEKhvio5aCWqLtpR0l3ErVTy9lLewjayRRV4NURjVp
 etkfueqdUtwaPWQFxW3uMUd276ExB7/rwg11kS9Yl7S7izSOxs763+uB0Kohx5BWJL8Z
 VJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YEMGBxsQUNvp2PjonSueQwZBRSyLbY8BmqfulY2lSn0=;
 b=J4iBf30HfNUUwQFtynGiXHFStkf2ejgQELd63nDnekxbC5l/TbW5Yo1sUgfIa8rJIn
 JvtYdaF0ObqFr0uA1L9xgZb1KmWhasxHg9qPDLAKZFORcTUc0Ej6dwf7bwvtzsrpQkNW
 5HvZSD6veU7XxV9OlCybx1DqrPVkB4KP2Qtck23zamC0W7LJd7p1r85zpRtgLhoPF7Yt
 V/lr24nDOrwDYl9quyAMw1qITT2yIy8N0s2jS8bGiTtUjYHlrpuEzx7JBiukOg0P4qxW
 HMDXRHkwaUN5dDUrM9U+Hvm3ctKi+iR/NUxH2cq5W59/IODR+1A5lbONWG8Gond2Y0S3
 7CTw==
X-Gm-Message-State: AOAM533M2HEqE4PsW2tCmrzoqfxt/NymYza+Qo/itg012PWdFjBhhhXn
 j9+ufeL7A9F7VC1M8GNkpVnuZA==
X-Google-Smtp-Source: ABdhPJyErc4c14AjTDhvxXQ6/+99l+2C48q81k+e9fI2i6Wd/+F78xFoD4yCBmTNR5hYlCDdEBTQlA==
X-Received: by 2002:a62:1708:0:b029:1da:2f7a:3639 with SMTP id
 8-20020a6217080000b02901da2f7a3639mr15819097pfx.78.1613406507550; 
 Mon, 15 Feb 2021 08:28:27 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 lw17sm17507068pjb.11.2021.02.15.08.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:28:26 -0800 (PST)
Subject: Re: [RFC PATCH 12/42] target/mips/tx79: Move PCPYLD / PCPYUD opcodes
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2606adaa-6558-61da-53e0-c4830f7fc448@linaro.org>
Date: Mon, 15 Feb 2021 08:28:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    if (a->rs == 0) {
> +        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
> +    } else {
> +        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr[a->rs]);
> +    }
> +
> +    if (a->rt == 0) {
> +        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
> +    } else if (a->rd != a->rt) {
> +        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
> +    }

Use gen_load_gpr.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

