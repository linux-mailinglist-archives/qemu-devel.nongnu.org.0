Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC062672C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjDH-0000Wk-JE; Sat, 12 Nov 2022 00:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjDF-0000VJ-OQ
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:37:53 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjDD-0003EN-8L
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:37:53 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso9454094pjc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SfV4Y7/0tmw4GFvMOuH5BwgVZFBMT1pBOulYUOD7s2A=;
 b=nX9U7VO1O3YSdNYfGo2RfkkcL79FtkHR/1vUZKHlBXdj7sPHmncbmcwKB1foss5lGP
 w6hfVz1OIlM/vFVgGquAExdPlAQrEupEB4KEEw0VeU0AT9odorAkhpPLkt+AjtvVeY8j
 XoxK4mQ/vA6T4mg8ymZAu05gQoXTjTX3t7PZYqGBGYrQQ53ubVXD1pCQiMHlSj6Rze2h
 /vGREMM/zF4U+43A/BWK7t7NANMyIArAumdFD5hqwrQmWN0oOd5E9zLoeSAkkXyOzU38
 pWzxBJwSZqDxy03UaRgdtIvxh1y11q4FdhOOgqBFkqYcH047mq3ihcIx2bknz/fciCAP
 HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SfV4Y7/0tmw4GFvMOuH5BwgVZFBMT1pBOulYUOD7s2A=;
 b=WGlc39Qmmt3GO5P0maG45JtCvNNW5lKy8ioiHeeflGTDKeCb0HIArPENLO5K/UqS/d
 G6/5FZIdmPT+JbVS/oZIG+x/DlnpdTB71K/aN2rVv/FgBt0hToSTwYRzqEbG5pxCPWce
 KNINbbg5q/2YKsaolAIVeYaGNubh+I+Br1sJokumReRnXPesZcA02suzUurH/33j2Vki
 NzrAo/gqaOtvxd5VJM2X6tk5rQt8RDVE7sf6nyRXcU90/BK4QAtRzwkFqqwN5KtNTpHV
 ZTa1j1jZhcOfwIsca2GqwwfFVOaHUrMsMIihXDIyWSmzUxovCmQTyvj5l09J0PyWX1Zn
 RU0A==
X-Gm-Message-State: ANoB5plgzGYMjTfEOQRdczOrJYQBVcbm4Zb7zcrzcKwvT8SQKuT20umh
 5Qec6S9M8bEZ8UCFrgbu7C9Nfw==
X-Google-Smtp-Source: AA0mqf4Zo+y2OHnDw5Q+5j9Pnx/HDDTusICHHiL7tzyexSPgTI0rhavd7g/k1KO+hH7H2+P5Kt/dpw==
X-Received: by 2002:a17:90a:bc95:b0:216:cdf6:54c0 with SMTP id
 x21-20020a17090abc9500b00216cdf654c0mr5171843pjr.34.1668231469656; 
 Fri, 11 Nov 2022 21:37:49 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 b191-20020a621bc8000000b00562019b961asm2484035pfb.188.2022.11.11.21.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:37:49 -0800 (PST)
Message-ID: <0d89e091-cd69-8ab0-5c41-e86c796fa286@linaro.org>
Date: Sat, 12 Nov 2022 15:37:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 10/20] target/microblaze: initialise MemTxAttrs for CPU
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/12/22 04:25, Alex Bennée wrote:
> Both of these functions deal with CPU based access (as is evidenced by
> the secure check straight after). Use the new MEMTXATTRS_CPU
> constructor to ensure the correct CPU id is filled in should it ever
> be needed by any devices later.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/microblaze/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

