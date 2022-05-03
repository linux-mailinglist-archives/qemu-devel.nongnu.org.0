Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235895180E4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:24:00 +0200 (CEST)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlolD-0007nN-41
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlogw-0005LW-SM
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:19:35 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlogv-0001Bn-CF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:19:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id 7so9698951pga.12
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i90u9FWtuT9KsoF3yacMMNTaSW6l4P+xlhV+WVW3ggU=;
 b=HiTHQo4FxMXATb10nP1zwvTyXEiiC8bdJ3i2gB1YCIkJxmB02zhK3ELBzFm723FEnj
 Jsp5Hw13VbOu1o93TVWr/WGlVHgHmQqI7QkbbX7+UxDy0bAJdO2EXzv2Vzb7dwffVCiP
 QoQU9s5grdf44pUQIKa+FCGwN9+sTvyxRAtG8Pm0rkHP91At+VsQvzEaZpZ46i8JD3jA
 u0ouVWRUJxUOj4sWV0ZAiKxCeGKGd2nwREmcN7er6jYRaquKFPyztWrJsyd8c4yI+csw
 SuEWw5w80h56rvTkDzBpQWu8NKjCp07Knx0i6Ao6kVHNsU4kPFd77Ds3ginIHycYa0eR
 224g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i90u9FWtuT9KsoF3yacMMNTaSW6l4P+xlhV+WVW3ggU=;
 b=IgLBWlrdSrReUlYwo3167pQ+6wVv/S3mJZOiTKt3FKwwF9ao26LOiwoDECPIypGIvp
 GAhdqc7iLpgZYLBRflvaP9vF28zY0448ilngWox4CmeiiwBacHnrpslzfQM/KtXGh2Jp
 9cWiyBwDmrtRJuZAYrwBTHtgHkZ47wrGU7lISIZ6w70sJNJz40i2d25gesJPxB9aB9sr
 yoxved5z5csV1kaL6KNcL++7uowDoCRUjF9mH3ybS7BIUpaqas0EOLoouxmFgcjrL8+g
 Qd51q50T54Ia8ZboYmBa470fYkp4mayA1YWyy2tsLJyxWYUWGnQfpat9uNv/l8xm03LW
 DGhQ==
X-Gm-Message-State: AOAM53112OB5XPELJnurxWfXdStMo67dqi+WgvciLFrURFPU8biwCcW3
 VsXwwmaw6SMH8ze8HmyfQ70=
X-Google-Smtp-Source: ABdhPJwhiIAQ5uhhL9wWfUrdziBQDIFdAxhNkphjIq+gaDmxbDGAEKdJbZWz/BkfGQPo27C4bN7JLw==
X-Received: by 2002:a63:6a45:0:b0:3c1:47b7:edce with SMTP id
 f66-20020a636a45000000b003c147b7edcemr12847164pgc.207.1651569571518; 
 Tue, 03 May 2022 02:19:31 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a170902864500b0015e8d4eb229sm5905731plt.115.2022.05.03.02.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:19:30 -0700 (PDT)
Date: Tue, 3 May 2022 18:19:29 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org
Subject: Re: [PATCH] hw/openrisc: use right OMPIC size variable
Message-ID: <YnDzoWHqpYcCWTVs@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 04:59:47PM -0700, Richard Henderson wrote:
> On 5/2/22 16:28, Jason A. Donenfeld wrote:
> > This appears to be a copy and paste error. The UART size was used
> > instead of the much smaller OMPIC size.
> > 
> > Signed-off-by: Jason A. Donenfeld<Jason@zx2c4.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks,

I will queue this one.

