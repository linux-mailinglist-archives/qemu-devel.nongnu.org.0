Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334A3C278B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:28:36 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tMh-0007en-Gm
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tGv-0002ao-7b
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:22:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1tGt-0006jg-T8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:22:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so26532487wmq.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myz1lX4ouFWqcLJnYlqZVNjMG6DA6Hx88x9PcwXE38Q=;
 b=piKbFw5QblJLrmT2U2nhQmaBxtYh1AHkH91JHGWd8p+6pDE/9ebTSfiptTnO40a9hn
 rNP37+9canSdcXK431DVZXbu3t1G9mTBaAVP0f1ugOBJK6ey9Tyi8xsfeolw3ZP8G+8a
 gqwVUxCz5vyLkx4T6t5STAN1nmKz+lKZWylxKxoufK23ajnThYqSLd57h0/FaV49hcpU
 u6LenrCnbEJegHuVyMk0127BXiHBUS7MdUmpN2MS6IcKZ3zDYVYhh3NZeoRAZT9XJTFq
 gXrhOZrEukR0O60izQecs3wGOYLPBAWu7x8gt1h6E0gvfHwDTvbUXYvB4YQTzS0yIwZx
 lx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myz1lX4ouFWqcLJnYlqZVNjMG6DA6Hx88x9PcwXE38Q=;
 b=LioaCHY3VjGLvKLIwgP+3i6doOvEIqqrw99IOLimlwSdz2/1t1W/pENoTI4H6Euqm+
 mURUcELE3Fjo4gwA4fT3D7PwdZ/0x/xkl21IX9mAZmPceZ2hmZl958mHxMCyzAbh44J0
 A5MHERyB0xCpUaCIfU/oH+IDOcbT3H42mts7f8ptWqBb46Zy36pNitGedwCFtSuGAZBx
 d7/s5C86CE9iqzHxEZ4ozt5RI6HwKsx4XZOn0ZpUOMwSNShy1Q6BWqrHGzDf+6OdoRG5
 E7Q/JYZXoDDbgLCjwjbD8AhovvZ/m9RFpMIUm6kiS2NkkiJJuVFqwtxXP86XESr3MmZR
 +Emg==
X-Gm-Message-State: AOAM530B9DjHCi/KexaLf0F7+kZDi6nHVsSdunNH+t+xyrQ1X3ARfG8i
 MaJUZ85jZ1b6PeiKaI2Jm8Q=
X-Google-Smtp-Source: ABdhPJx/X37nqfHSD8fhzEPaHJvHRZXezi3alz76hxvhAOFE0QGEpoF5yOmIYVeQnIPp8kUGYRG+ig==
X-Received: by 2002:a05:600c:4a17:: with SMTP id
 c23mr17659234wmp.7.1625847754293; 
 Fri, 09 Jul 2021 09:22:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e15sm5642932wrp.29.2021.07.09.09.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:22:33 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/openrisc: Cache constant 0 in DisasContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708213754.830485-1-richard.henderson@linaro.org>
 <20210708213754.830485-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da6c541d-b775-908b-1e01-04ae8fafb0d5@amsat.org>
Date: Fri, 9 Jul 2021 18:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708213754.830485-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 11:37 PM, Richard Henderson wrote:
> We are virtually certain to have fetched constant 0 once, at the
> beginning of the TB, so we might as well use it elsewhere.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

