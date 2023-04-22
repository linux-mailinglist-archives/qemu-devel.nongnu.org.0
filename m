Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF896EB8CA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 13:17:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqBDV-0005Z7-4W; Sat, 22 Apr 2023 07:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqBDS-0005Yk-NI
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 07:15:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqBDQ-0000RL-Lv
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 07:15:42 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so27697755e9.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682162139; x=1684754139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T3nkwhc1IPmiaRBVZRljWEuhWiHQNWyUKY8/vjUhDJY=;
 b=QS54oMMV+qqRvzGoiPlVmZCvjoK5ZpQvNHCDxPHoyp47CenYKlpfUfexzgv0xciaI+
 zXze3qwKdmPQwT4rRPdKRyvnc9geOP7MWi8NDk/7LNwbHLKoWRq5576wlcfng4PoBlL+
 t3BnWifQpIMk8uhnuLUnb1sLOcUg8ZcEM9JiBBcHDUiXN2AdHOi9+V2QzBOXXUIa5Psg
 KSz37sgEHEkh6YsDEOhSPurwWVK1eBibfP8oRT96lWsOxmihLFf4VgT2mb9i6z9t8oLZ
 MPmDTv0IYbFxkBRAgI0J8DbVCjvvjkfXeZnElH6UMLldwDZuSOzSZ6n8ys2mKEORVG9z
 SWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682162139; x=1684754139;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T3nkwhc1IPmiaRBVZRljWEuhWiHQNWyUKY8/vjUhDJY=;
 b=i7HJB7/HxMLBQfQXCs3a+zQt4aFUxmiSAVpyiCv4qL/vO53e4Otn0XQq17Iu765V7O
 nJiWg7ry8nOQdnG1f3eFKl/YbYwtfHN4JEn0CoWAGs14ikBDGWTpzuSoxecP28mSBmqi
 n/WLQSAKIrkqxflYDslLaftifoxVryrqYPjCfd16NsZL6rR2tRc7/0XOHxRwBRooFC75
 SZ+roxsxvERAcri+Lw910DWixc7gniDofwwf+0w3gbUU71BHiijiEJQt/+fQ/QS5BbIj
 mguPPiHPP2z7E5TQMzxJ0PEJW9zYq+cJOkazF78PHwoVu4v9gTGpKdvNSJIrGdhKVBdL
 LzxQ==
X-Gm-Message-State: AAQBX9eLSZPWpv3BQ49dAWVP4kAWl/bp4bV7Dw3+M+Po2Fg0vKZwrRXP
 MgC0OaG1mNyVSO+1ZOUTtQmnkw==
X-Google-Smtp-Source: AKy350bX5dvfvzf4UTcPVwc+EAmwXx+57H3lOHkKvhvPPcfs6tAm9AoMe/mpr8yKV01yU0W6BF5I2Q==
X-Received: by 2002:a7b:c4d9:0:b0:3f1:969f:c9d0 with SMTP id
 g25-20020a7bc4d9000000b003f1969fc9d0mr2074347wmk.4.1682162138657; 
 Sat, 22 Apr 2023 04:15:38 -0700 (PDT)
Received: from [10.43.15.135] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm14093470wmq.0.2023.04.22.04.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 04:15:38 -0700 (PDT)
Message-ID: <3029cab1-e270-9c9a-75e1-e53299423598@linaro.org>
Date: Sat, 22 Apr 2023 12:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v2 00/10] Hexagon queue
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com, ale@rev.ng, anjo@rev.ng,
 quic_mliebel@quicinc.com
References: <20230421164922.3608183-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230421164922.3608183-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/21/23 17:49, Taylor Simpson wrote:
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
> 
>    Merge tag 'pull-for-8.0-220323-1' ofhttps://gitlab.com/stsquad/qemu  into staging (2023-03-22 17:58:12 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/quic/qemu  tags/pull-hex-20230421
> 
> for you to fetch changes up to a305a170398d80c08e19c2ef4c8637a4f4de50e1:
> 
>    Hexagon (target/hexagon) Add overrides for cache/sync/barrier instructions (2023-04-21 09:32:52 -0700)
> 
> ----------------------------------------------------------------
> Hexagon update
> 
> **** Changes in v2 ****
> Remove patch that breaks clang CI
> 
> 
> ----------------------------------------------------------------
> Marco Liebel (2):
>        Use f-strings in python scripts
>        Use black code style for python scripts
> 
> Matheus Tavares Bernardino (1):
>        Hexagon (translate.c): avoid redundant PC updates on COF
> 
> Taylor Simpson (7):
>        Hexagon (target/hexagon) Remove redundant/unused macros
>        Hexagon (target/hexagon) Merge arguments to probe_pkt_scalar_hvx_stores
>        Hexagon (target/hexagon) Add overrides for count trailing zeros/ones
>        Hexagon (target/hexagon) Updates to USR should use get_result_gpr
>        Hexagon (tests/tcg/hexagon) Move HVX test infra to header file
>        Hexagon (target/hexagon) Remove unused slot variable in helpers
>        Hexagon (target/hexagon) Add overrides for cache/sync/barrier instructions

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


