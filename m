Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559A438662
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 04:48:03 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meTYH-0004kH-Ok
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 22:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meTVo-0002jd-6i
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:45:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meTVh-00029t-Pf
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:45:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id s136so7256103pgs.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 19:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4216sNxJL5S2GM4k2dTOWH0buq4i4dZFozwD2kjgUAE=;
 b=haBjJOBKogQ2vwxJ6dTCLh1pTKDxBzIsav7zh/jtd5S7jLlvG5GBkNK+yupeQNjELb
 j1zwP9e6WhR+h36hhXp4OKlg1Vw3cCc9WKn6CGB6/hB5T60j+8vwyFZ3DFWOTUQVFzP0
 vbImwgvgjsfuWXHeW9zTzdmR3k0Juyj4kvxfszKYh+UQl29fNbiNp/EMj/DYL7r0/bSs
 R4m/EOXUAIjioyukp4W77k5zXFqMmpgY4vTAC7dfB3jDqL2rPifyVNhEbWuLHJvBKvhS
 f9GS6sbpevClc3jTO2nKsTxyJ4nWFDejzRRA/6OwlW14fvMtvLB8FnFXNtCtgpXeg0t+
 M8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4216sNxJL5S2GM4k2dTOWH0buq4i4dZFozwD2kjgUAE=;
 b=MujLVP9zlAkLt0N8+iveIVV8pr0q0nJYlCBcsj+rRUXh6/VPSQuRFILEYbqZ4F4WZg
 Dewsow+6jFPr8d6cZovrU+5MQ/CM8EikLPO6vf/x8A676hFCz2EbN7uNrljelfHNR64h
 4Y921la5TSmYgcwX+mDPN16nWUT/x7VgZ32nxv9/wEz6VsrZ8E4/SpFs5brbVN0w2mC/
 iT+mtlALpw4wXYCBmzzYksktoxORUKDRn4bfdMTa7jibuof3WrRo1l55VoWl2TaM0dFV
 rcA2iaCZF0m+N869UARJ+5VvSfW+ZfzzmNLFYnAMVt6YltFMmQgMHGTGjtCWox2eO4PA
 hp7A==
X-Gm-Message-State: AOAM53388OLK0U7XLaVGLmgsDs6zgPH3S9tEU1YBnraPmdYYAJzlIF6+
 ZPrbOxrYTgasbmqCzBjqauIfSQ==
X-Google-Smtp-Source: ABdhPJzpaTA64sM9G+ungeAqxK8S3H+pmH6/iIDm1GTd5KUjwca0NAhv2r0S0Ttdr1FxgdqsKh6Wyw==
X-Received: by 2002:a63:b20c:: with SMTP id x12mr7261553pge.10.1635043519912; 
 Sat, 23 Oct 2021 19:45:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id mp14sm2570313pjb.17.2021.10.23.19.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 19:45:19 -0700 (PDT)
Subject: Re: [PATCH 12/33] target/mips: Convert MSA BIT instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bf3fe48-f875-239a-8ba5-8ba836df117c@linaro.org>
Date: Sat, 23 Oct 2021 19:45:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
>   @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
>   @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
>   @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
> +@bit                ...... ... df:7       ws:5 wd:5 ......  &msa_ldst sa=0

Not sure why you seem over-keen to use &msa_ldst, with fields that don't apply to these 
insns.  Drop that and you can more properly name the field dfm.

> +    twd = tcg_const_i32(a->wd);
> +    tws = tcg_const_i32(a->ws);

tcg_constant_i32.


r~

