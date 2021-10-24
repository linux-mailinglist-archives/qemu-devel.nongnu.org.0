Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972A438B1B
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:53:08 +0200 (CEST)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehgB-0004wm-NC
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehea-0002pe-CV
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:51:28 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meheY-0001ls-Pm
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:51:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t21so6334861plr.6
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zFj+OQhoahN7DtjcWEwHyiN7fqE7iiRJsyZ6RyOoPsk=;
 b=wkELC9AArdltgh3oroszWQegmex8MdRdq4mM96ZcRl4ObarWVbbU2hKVS2T2kcPMcu
 DnZzAA+jBhqWNXlsYaZgnvK6XnmvYQftY/eqHTvIVHObpYygwfJ8z27f4ugHyWSADvAa
 hcf59llT00SIAusUxCggrYXqPXCQtrcISOlDbcyeNipOrfkRtMQE0rBHXf9ZAiAGCwwS
 wNkftM9pb+Zo+QTRsQjy9qPRJFSdmV6ApTRebIpcMnDM902F8ewU2ACuIB9/sEoji4Ow
 vZ6RMvXyiloPfSylMkyhsjFKd7prWJUBvexKpam/LHH6dU6e5vDV6MZ1jrzkkT3F1yJy
 8dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zFj+OQhoahN7DtjcWEwHyiN7fqE7iiRJsyZ6RyOoPsk=;
 b=x4PWmQPLJ1/2uhLAt1yzslaaJ3crWPeosgG7gtlAJgPx/BbWu6qLshg09nvzfK/iCJ
 lDzv8prYFDNqgH2KOl/PT6TqCSILTTXNsWLR3MDpco20wmt4L6K6lkwDnCYKjuUgh1BV
 82G34uVrOwIos/80S/2O9R4InRjl8bpeeRvqaZX69vJJUEE8BHNMS34uZYppwSZV37LU
 pXtUirFk9DqKtndGT/nnNqpbYqVkwzJoQmNna6P7D6vEUyezuBx6bkcGEk1UN/E6HxkQ
 AiiZi1WBJQut4Bzmfkt5fU+0Z0HJvyn7khYQ2QwcbUc5FHDwv9HGzz4uI8gqj1yLohho
 7Trg==
X-Gm-Message-State: AOAM533+xm02VqH7F64nbzvuQNWznL79DMz8yVF+dRctT2kV6uuXPeQb
 NP1+7UokZLBeBoAcGBlCoLqBTw==
X-Google-Smtp-Source: ABdhPJyePaGRzOTBki6FhjnuiXjQaxpQtJzUEMgaut4NpF1ItNa/n3MFGVw0C3BD4x2B32IR/T/DVw==
X-Received: by 2002:a17:902:ba8e:b0:13e:c690:5acb with SMTP id
 k14-20020a170902ba8e00b0013ec6905acbmr12056238pls.63.1635097884940; 
 Sun, 24 Oct 2021 10:51:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t2sm13797141pgf.35.2021.10.24.10.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:51:24 -0700 (PDT)
Subject: Re: [PATCH 22/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72190483-1e81-45e1-b3bd-739efeb893f9@linaro.org>
Date: Sun, 24 Oct 2021 10:51:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);
> +    TCGv_i32 twt = tcg_const_i32(a->wt);

tcg_constant_i32, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

