Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DE3F62EE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:43:12 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZW3-0005NZ-HB
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZUI-00022f-8w
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:41:22 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZUG-0006e2-Kx
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:41:21 -0400
Received: by mail-ed1-x529.google.com with SMTP id n11so3467961edv.11
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNWqcQA26+CoF4p/BXCD6Lu5gDkO9Fc9W6YIFGLevwo=;
 b=F6IAxtdsa0K1WZAfnwfwYacngQ6pkPGfT3dFbs4kdoCk4F8MMhgY9a717rpA+cOlcC
 ncGOfsErcx1chgm9pMghVEBjm2lo0X5XMpyBhHhTH3QJoi1Nttf4ngOspLCWf7J7T7IZ
 u90sDJQ50RsTEhkdrnyOEX3AnuzRgzPpIs5LVnXKJbPWoM5t3iyL30iEgASFt8qh5wPJ
 f0RXJR46A4IpuqpiAqYkZKdmoctQ2e4re9/XdxEtbrx2WK963DcDae+97yu+J6A/bx6v
 F3d8/3wW1WxS93kuOhDH4nbfQucEdNtu0YHLIkRIyCIy2QwCviRVIufT/IrbTuTlPXue
 yngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNWqcQA26+CoF4p/BXCD6Lu5gDkO9Fc9W6YIFGLevwo=;
 b=rmguJXbEU9t1umwq0EvbyKIArhQHKDS0zs9SMt9Q86/YKShCPmetwrQZKLWWS03Mh9
 dMZKEQTBXJm/s6KvpJ8Rpdd2HFWc94WdNx7rOiT4fJ2iwAFuUgqSs1nR/5beyCWoVlCL
 N0Iu0K7MtqIJ73LVLNUWF+QsSuUm4IR+WTu+23xuHVcFtqRKjmOUdzOge+tIlvPke8cH
 Wt+VsLxXw3aP/AUuD1/KkmL5R0Dx3TiB1RMES8Yb08WgONqabzK9AjJHMK+NK/g4BF4w
 raNKchjuj6gTih0sMqg50L2z06thDem3Lkc2km6janNdPlnbeJwiOgi9u0a1ZJBcdc5d
 4qKw==
X-Gm-Message-State: AOAM530H1slDoBSZ7ndus2G6bvTMb9EvIrYNxZAgyyNiVazVqTAGE9z+
 x7HxcVzJFUH3ugDUAenoNvzhE7c4n5jt5d2SumyUJA==
X-Google-Smtp-Source: ABdhPJw7SzZm73nvS6FG1KksFcDlTBt8Mdo279hnun414wcQYFPkfy77wCLCp7wlH6iHVw5ySFO+4BAQRmvm0scMnik=
X-Received: by 2002:a05:6402:1a26:: with SMTP id
 be6mr7683738edb.278.1629823279177; 
 Tue, 24 Aug 2021 09:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-19-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:40:32 +0100
Message-ID: <CAFEAcA-xQoCvfGQHp5-krrTS88KtTdsKdyv_4caPudpbPGre9A@mail.gmail.com>
Subject: Re: [PATCH v2 18/30] linux-user/i386: Use force_sig, force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace the local gen_signal with the generic functions that
> match how the kernel raises signals.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Mention behaviour changes in the commit message. Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

