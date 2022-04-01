Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D174EF929
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:49:41 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naLP2-0002oU-8Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:49:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naLLi-0001bl-4g
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:46:14 -0400
Received: from [2607:f8b0:4864:20::1135] (port=41776
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naLLg-0006G6-G9
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:46:13 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e6ceb45174so41084287b3.8
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uq6p7tEnKQ4J+drHNRhW4K5q7xAVtiN7APFIwp+/eSY=;
 b=BN0J7u4ST59ttzHDsMu2XCC6pU9rVMwyx8LKNyYx0D0gSy5p+hLPEi/CV9HJ+MgDIQ
 L1fvo3ptGXksoIHPl11R4O+tAeyB/NoM/SJrDhJVE4PH3gcoRTepBh6bRba45mGdfqtf
 m7JyCmib1ViHW3FMDFMip2nYBDN4nLg91zV9398Nner5D3EpUacGgaW3i9imst61pmoO
 CkePycJ8AuUeRWTPE0vTbDQQ8tstLr2wIaSh1JLN6shfLfvPlF0DcaeXjtkqsgeklcin
 0dgd5Gltw0BFl44DIJKWE2a58EOb7Jcvstlil84qekVBiG5KaSJuRwrY531NR5v2xH/5
 t3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uq6p7tEnKQ4J+drHNRhW4K5q7xAVtiN7APFIwp+/eSY=;
 b=aq1QD9GJLWois5sWFi4qqkFc/MRlVeuO5f3Ekevx4smcik/gxTLKCDcAsMw771hSrv
 a91guDPJfK0IoR0IDhQcBHQPwHY5k5IoM8RA6CUWNFqVSH3WRecQNSVo1I1xVRofqiQG
 xv4/TOrTai473yvxCB5w4ygKCfQUwW9hR2qrfAxO/Nyk2VzkMgfgCjUYfhUkXYV/NC8p
 oGyJiGjs4H9+Xz/P/3jpmA6jp8C6tLmlWO8vus/nwdhrKBbwvy/3CdqRa2j9BVl5GC+p
 yUYYgS+5E9AKJcvYdu+QZgjfMektpuhwTE0KVMXMGQJOGlIfB66sBK4dBgwZbwH2ueZj
 uRng==
X-Gm-Message-State: AOAM533/KIaidb/Q+xO8gpbnl0MNrIF9c+HHIe2TZA0uM2ccLiGs/wBR
 PfO6nkSRMSWJJrteyvhthja8tzqSrac/N1+ulvI2UA==
X-Google-Smtp-Source: ABdhPJwd/XIPLE9VGL2m4UWa+zIxgwk73a5nBw1EnuDGjwQDnimBQEECIizprFE3UWSA8M28uMdugJ9gK6JbwF4yzFY=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr11695107ywf.469.1648835171010; Fri, 01
 Apr 2022 10:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220401170747.318545-1-richard.henderson@linaro.org>
In-Reply-To: <20220401170747.318545-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 18:45:59 +0100
Message-ID: <CAFEAcA-vF2ybG0Lkw0JDXv8GFTcw7tXy9iOMP4Vc2uGcTeM71g@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Remove ATOMIC_MMU_IDX
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 18:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The last use of this macro was removed in f3e182b10013
> ("accel/tcg: Push trace info building into atomic_common.c.inc")
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

