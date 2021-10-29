Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD78440071
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:37:18 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUsX-0003H8-1x
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUr3-0001Cx-JL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:35:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUr1-0001BN-MP
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:35:45 -0400
Received: by mail-pl1-x62f.google.com with SMTP id j1so689131plx.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AE6/Z0SFfD9T46i0d58JN36sNa1NYElbYE+jwWOZ4eQ=;
 b=eVFQHaxhCVYIsWsypg3c7KLOHB/PCGk/ZBv03Gg6pg2RaBXEE+aglcKV5jZzy7pSVu
 c3SZYOzejZiiZ9lRsNkO8TX+PfnJEZWypkghHa3J6jel9FQpL09WzDWsk6nrqKZODI2o
 G42KK4CkdTfKerrYUib3Om5Y33XioLBprNAqPqO1mXSaEmiC65faMHVoWEQ2Rf5XVtBb
 0t8McBtohChfPiSbOrDNjjY3iYuBcJzcalduZZOs7a7jkP5WpeFiaPz0DIHE0MXi3/0Q
 GXviA/C0YgMt5eIdv6Uyp57DsmrLZrqy2wiMS15dHXMY5ibyKnuTT2yP0FMUAEXt+Xuk
 VBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AE6/Z0SFfD9T46i0d58JN36sNa1NYElbYE+jwWOZ4eQ=;
 b=bLH8Ox/TVpPfwCzuffQ6ISIxTbS6TEgMzaZ5Q0x2KqtPAEM8L7kEa0QIyYvZV1APEY
 jjhiiIXQU6vKKy+dq6+d8OurtjJVMr4elLo2eOF4Hyf9hlqhLrg+SnHVjLQY3N7bcyZJ
 jpPFcKmkDgU8FxVT8um+bmfJ+vKGPLsC/ubVQxpctAY3TNQOkqNezO3/J6A4mUoNul8Z
 gId2AhwbHzZqU06yukWNcBxAcIdDstbvbYrELWgBiD3YBxBvljhBZPwrkaIAVEu5BLGq
 0UTP5ZN8HXg1yktQ92IOqqSVhiSZtAGDRiWC+T5eiqbADl8faD1Mz1J8XB8QZIAC7ZU6
 jBbA==
X-Gm-Message-State: AOAM532WEo3B6r/A1sGeLbD8DTclHDl1WxUoYng58hDQgLmgTqfrVc2Y
 3LCFDap9jebfqsgY9pq5EIHZ3Q==
X-Google-Smtp-Source: ABdhPJznpC2h/SxMsiyl5nvKNj3nCYREuU+Ztd9AVCayAp+IgefuMUoDHgV67YtWR5UiUC7+IDAleA==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr2813891pjb.133.1635525341689; 
 Fri, 29 Oct 2021 09:35:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm6147892pga.65.2021.10.29.09.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:35:41 -0700 (PDT)
Subject: Re: [PATCH v3 20/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 1/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b392e80-b4a5-b01a-e9ec-0d2fa6a39e76@linaro.org>
Date: Fri, 29 Oct 2021 09:35:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> +@3r                 ...... ...  df:2 wt:5ws:5  wd:5 ......  &msa_r

Nit: should this be called @3rf, since it includes df and...

> +TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);

... you use trans_msa_3rf as the implementation?


r~

