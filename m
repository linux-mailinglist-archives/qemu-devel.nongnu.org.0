Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD206687C9F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:47:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY2v-0004NG-ON; Thu, 02 Feb 2023 06:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY2i-0004Kx-Rn
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:46:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY2h-0007D2-Ca
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:46:16 -0500
Received: by mail-pl1-x62b.google.com with SMTP id jh15so1534034plb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ihh0Z2qNtXEvLVXwnbvKt4sDCuNMJZYETfqrjhwmgk=;
 b=d8iE/L2Wp62PgdAgWtea7haiyjEA4FAKdcMUYhSCf57XcgHftqRp7erYivsXdivFaW
 ITXXlBa5vwjG+WajY+me2KPNRnue2o02ZJ2884caBU+PauqPmg15U4fRlAXTahxYscGq
 Bk6/kGkw1vb5wZm+WUdl+d+b5M+evJzHTBNtbB4+6XfWfJMN+0RgsMYKUnUW2GnSvyR3
 ldgdI/FmrMoVHKL+1Udyc48+sIzPca5agIHpeXcRKagiYQu+haF6hikafyNoznu+uXhO
 UBqY1zA0B1bUyH6YbzCP/JVhk4sekrGm4QyuCAGdDLXo0BEw7UAhLzWj3mKqLsXIzYSM
 ZgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Ihh0Z2qNtXEvLVXwnbvKt4sDCuNMJZYETfqrjhwmgk=;
 b=veEn/44YLBoOVVaukNS5x6gPDxOh/N/x3TKqQ1Kzy5NML98GZYxaoLD81jbDJz0d8H
 /N/AgWZJhIiViLDhWfV8Cj1qqzHqCa2Iy0JnFiuXoBHMdHdA4znH0DIQ349SypeFGmOe
 wjj7aVd+Y3M/ROGcCjUJTVSRyt3Gz0MgsBCzWH9oMYENfBWH+f2xN3Mq1bv/iLhiG4Nq
 CawJXBCCStkdYlTFgZKhNLBO9VoZdpvXTM5Ebddo3TevHdy7jLlQQAC30uTxUYHbpwiW
 JzIrzU+bVYaZi2Ynm+Z7QSdhOwA65PXZoVgK11jGcKlIiAJG7ebo/wOlGKpxLi55R0me
 RCGA==
X-Gm-Message-State: AO0yUKUgbGnTZ8BHUZfgH0kSgwgGagZXw5NzHao8g6+m/AqmsKtAKwAd
 TB63g5DYe1AzJweHSkSJlu/bqMIoWHBLuSIHwlUQ8Q==
X-Google-Smtp-Source: AK7set9Aj26hFDVvqM1IUYdv2U1S8KqbNXJuNnpyFPmdEVbBxQuCp0AZUDUwpp8AofE8KsMbDje+nBKG88eNq7Bwm7Y=
X-Received: by 2002:a17:90b:60d:b0:22c:34ef:2065 with SMTP id
 gb13-20020a17090b060d00b0022c34ef2065mr477864pjb.89.1675338373608; Thu, 02
 Feb 2023 03:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126233134.103193-1-richard.henderson@linaro.org>
In-Reply-To: <20230126233134.103193-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 11:46:02 +0000
Message-ID: <CAFEAcA-OmVfz07rz3vqa2RdXgc8SgSRrAJ=qNdineNv6PP79DQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix physical address resolution for Stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org, 
 Sid Manning <sidneym@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 26 Jan 2023 at 23:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Conversion to probe_access_full missed applying the page offset.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

