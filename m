Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DD438702
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 06:54:26 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meVWb-0005JQ-1P
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 00:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVVk-0004f6-Fc
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 00:53:32 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVVj-0003xB-15
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 00:53:32 -0400
Received: by mail-pf1-x42a.google.com with SMTP id l203so2739446pfd.2
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 21:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ojnx/JKOkRs3zXl3YBe8FY4LxX6jZAxhakw2dpXxvMw=;
 b=RS2Ac0smhZT+B7S5SyETwwkvV4dAhVI2Yd/GDXyTAunkdS4W+1+8K0unawwAOk3crM
 OfyO+Eg7a366jA6u7jejHpsSK19WCrTbMqjgfhRjHQnRqz76SHCv3fUXl9m2+TF6Rsm3
 Rt6PL69srSTAhGna20pRbO3pSCYzD5ffRVIdBAqDa8dfXiKE5cYpOX7PDfRzPPXbRsLg
 JnIzHVbJTroacycfrqP+5lpC258t0Tpuz9TNcPMjNwOB6ZcbvPtl24X7mzFysiMec133
 TrfIutbTmmlCMwVn5g10zKfeo4nBxTF7UmGFLVEQW46bakqeLH1FxOuxBQUz7p2cs3qL
 HrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ojnx/JKOkRs3zXl3YBe8FY4LxX6jZAxhakw2dpXxvMw=;
 b=l/v0HP3T/rXdyE/UBbD1yXCmkvB/VM5lB4alxl4EK7xOoAI4M+awYXIrGshsJ58pZy
 hRIR3h+8bPLuFUZYH7LI1WJkr1OJXwZBpr42wgRCDa66voeGJiOtjI7iKaZKnd69xCvj
 djjNYnXf18mcw47LNN4adY2GJodJlLPgGctHndtj7tQz2kqRmK+3RHzBkL1r3hRZpSZw
 IEfgia2mreCeT4pG7hYy9juaBH6DyXkMxO/XMslQ1COZtq+50RFYICD85zQ7x9L2vZJ3
 bK6v3uWWSBn2WWfIE5qYYSJm/3VhpRiyTTWjAZC5eGVply86Y1+Naw26GBvVpRLb7c54
 eOCg==
X-Gm-Message-State: AOAM531p+5R8uD5rJlduKjNTeod7klMHW1V7lG2fksJKK0V1hy/xbYXz
 TWNghgtDjcQBEyjXf1mBi0bVJA==
X-Google-Smtp-Source: ABdhPJzdzBnmIsIJbe+S3fYvnuUX9ZFO6qTY9FRdAPejEMZoGs8ay2ddwNF9zApUCwR0Es71Tkjn+Q==
X-Received: by 2002:a65:6a0f:: with SMTP id m15mr7525712pgu.298.1635051208926; 
 Sat, 23 Oct 2021 21:53:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm14439581pfn.159.2021.10.23.21.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 21:53:28 -0700 (PDT)
Subject: Re: [PATCH 15/33] target/mips: Convert MSA load/store instruction
 format to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afe60d73-0cc5-3af1-2da7-52f5d5a4adfa@linaro.org>
Date: Sat, 23 Oct 2021 21:53:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
> +#define TRANS_DF_E(NAME, trans_func, gen_func) \
> +        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
> +                    gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)

I think this would be better as a table.

#define TRANS_DF_E(NAME, trans_func, gen_func) \
     static void (* const NAME##_tab[4])(TCGv_ptr, TCGv_i32, TCGV) = { \
         gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)       \
     };                                                                \
     TRANS_MSA(trans_func, NAME##_tag[a->df])


r~

