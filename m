Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B064F1E3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6GYe-0005Dc-Ql; Fri, 16 Dec 2022 14:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6GYc-00058T-Cd
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:39:46 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6GYW-0005Lt-Id
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 14:39:43 -0500
Received: by mail-pj1-x1029.google.com with SMTP id t17so3470960pjo.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vB+6ABJmUd1c+R6GnOStbQxQX5D9GBt6xwcCrbuVq5w=;
 b=FFKk3movDAH3JYC3JrSpsTcfGZbqUreF05MLh8PaVEI52lgHFu0MQktxhpVv6oYheY
 A96J1aTLKtZX+tXF2cMmShqD1bUVC1q5hYoXL8Eq6GESc90S9E1KIuKVC7BXclQdSXHn
 pS3u9W4jYdInc3yyI01DleY7a3ljSttXHHP1D7e9fxrBd1IIfb0FU+FjwgM1Aryd6fn7
 N2Or4DaVbz8SAysiMRorrOnqi6qvH0sIGslzAIIoAR1AFe1JHKmcZsxEW3mpSubLfw1S
 kP/3Qq0umWpQi7iNjvZ4tTNPIKvRi7VBjQ4b8ivGl4BBttmYNQ7V4XHyeTVa2XUQ9HQG
 URMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vB+6ABJmUd1c+R6GnOStbQxQX5D9GBt6xwcCrbuVq5w=;
 b=nrezNgL4iGfe5+ckwaLJLTtX878qt1yGyCEzY+gtzCOYpZFXOn+7PiS2dHmFX4Xobp
 J2nQ8NsEiBxWw04lAmVtmQKmfbNnqcjJk70XW0r4mMvMdU5yIbDsoxYwin9LrlTKIliJ
 ZVM0UD9j3t5xzTB8xmjtEsyNZ1m5+xHXSTwNHj/zJb/a5nPaQm55Fc+wfCWBcrLUNxI7
 suP5YJSkBjNGkoriL4WBk09DZcH1hfW9DTTfbgBcBJL35Lp66z4L4acYjW8hd+FRN8Kb
 Jo2X5CUY4RUT9bgwrSRvTyo+TfjV0MmyFgCFp8DDItFS1J+f6IdI6oKKVawavqBuBjbs
 FcOA==
X-Gm-Message-State: ANoB5pnx818laGSUvZnWvXdMBgi4hQEt0tuND/qwQ0/WM/3N+6FJy7wM
 6yKXxylOgjA4qt1HhVRY9HGM4A==
X-Google-Smtp-Source: AA0mqf68goIqiU8wl2EPN3xQTGgPsNxchx6rUJh0T54ST2LnFaevx23hLGYpjLwXBYn49bT2266zqg==
X-Received: by 2002:a17:90a:73c5:b0:218:a343:2330 with SMTP id
 n5-20020a17090a73c500b00218a3432330mr34064995pjk.14.1671219577509; 
 Fri, 16 Dec 2022 11:39:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 w31-20020a17090a6ba200b0021870b2c7absm1696449pjj.42.2022.12.16.11.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 11:39:37 -0800 (PST)
Message-ID: <b9f6dc97-65ec-82aa-e1c8-b374177f6f2b@linaro.org>
Date: Fri, 16 Dec 2022 11:39:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 02/10] gdbstub: fix-up copyright and license files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 12/16/22 03:21, Alex Bennée wrote:
> When I started splitting gdbstub apart I was a little too boilerplate
> with my file headers. Fix up to carry over Fabrice's copyright and the
> LGPL license header.
> 
> Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

