Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA13D1585
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:51:48 +0200 (CEST)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GNn-0000t9-EM
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GMj-00087r-06
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:50:41 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GMh-00021a-L7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:50:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso1457986wmm.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=joTGJnUBwvXcuUPJ+jlO+cBzB6AQr/TWAaVWOfK9e7k=;
 b=ECl5E+6XazRL7AcOZvc6r7ZMvDPrFUxyp/vb7m3WobFwlwCxazsHO4OeDuAOsb/Bsp
 udj058APjVQiwqFY7O3lH0Nxz0Mf4I4uEzI5YIG16tn5bZnqnHDhkLzz+MtihTIyKuPN
 tZ/+IgZkr/1f8SJx7LyEiR1LAtYT2fMGTZUSwcY6Mwpcefa48f7Bh9BOdtgCIsLxwCYa
 kMenP2yepbSraDiZYYVx0pCdZ4cJhe3eKz1qKCr4x6daPFPiLD0AJgut38jvPCFfho+a
 bIRJmoBxEw9LlhcfSFtuIhMj9Yuay6/mx+v4zENEadyJCa4a48XupyvB4RIOHyfzUDVB
 DPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=joTGJnUBwvXcuUPJ+jlO+cBzB6AQr/TWAaVWOfK9e7k=;
 b=leh4SvjGZdoEQBXI3vokGbVtAZFIx9neMOopIm3PCZHNhNhRu1S5YScIAb0P/hQs1w
 1LS1SyAwfLJ2NoDyw056HJH00l9Z+7ExERQF0izscd8GqGV8iaO7qDtvGF5oVnWcNoFw
 upDLK9uWas9k0hG75yg5ZGiYGAdyZEueto4Qe0UebBL+MXyfCq1zqFVC8cHrF6STCEdY
 r4NvUzse5vaWU0TaXNkSjgeH7y77UCjifSKAO3erQzoCO2B4L/D4CuXNzhSZZiJHDGLy
 XimwwTArwlz2SzrSrRw2/PwZ+3Fk70ef4ujzO2nAGpBeIkNWeCMpZI7Sm7hKtaFV3lJi
 EDQQ==
X-Gm-Message-State: AOAM530jybaC/sAvGMfZ0aaBIA/6E6wIVqhTJyXdzIG37nxl33VN7tmx
 5sZUg8qBt+8oEqdWDZR/OHbBVMor001VKQ==
X-Google-Smtp-Source: ABdhPJxfWvGIeFY5sfOvMiS3FOIaN6yzuGQDUwnj9ZDYPqKyg78nEVwrDOtVEf/GTXlZMtAnwapgRw==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr40130359wme.48.1626889838040; 
 Wed, 21 Jul 2021 10:50:38 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id m4sm27912632wrs.14.2021.07.21.10.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:50:37 -0700 (PDT)
Subject: Re: [PATCH for-6.2 07/23] target/hppa: Drop checks for
 singlestep_enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <afcafa77-0921-69f8-49f2-0d424bfbec09@amsat.org>
Date: Wed, 21 Jul 2021 19:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721064155.645508-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 8:41 AM, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/translate.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

