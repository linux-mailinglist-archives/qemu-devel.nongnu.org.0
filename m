Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3B3F62A1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:24:57 +0200 (CEST)
Received: from localhost ([::1]:60678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZEJ-0003dW-K0
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZAw-0008Sp-9v
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:21:22 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZAu-00021d-Ll
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:21:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id x11so45604369ejv.0
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDXumLncWHcShRu6HR1hJJBW5qh8TITewrTX1JG7gik=;
 b=tyaJrb9NpeOMyu7PEEnM2YDA7Iz1cLiT1qMGC8taZieJQzFz/FfY3kY/Be2piDt1uK
 UA9l+vqyleXVsWZ5vB3XfO6BZ6TwHTMLH6dMVwg19JrLE/SYktLF0kjQ1EMNTW2IZdc8
 YoXDxos2xozyPMILNukuPS4wLm+hv71AnZMLMBMIWv5IAyihZq00kqRo487VQ1x9rLPM
 NjE8iDWxMzi3tonKLdHclt4F4N6YPgO8ikUkhKGFLOV+/k9CrIj6kyN8AvNpNACA+D76
 /f2nLyavfE+2Refraol8NOI4cbyJVAiFyRPsk9Jz0Ez4rulP/bh7O91FPteyibGmyImw
 +Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDXumLncWHcShRu6HR1hJJBW5qh8TITewrTX1JG7gik=;
 b=PVrUC20A8/l74hQCGjf9dTmZv27V7gRq72H6o/vCvHHGWPyOVO6m+TpD2waqzvdrgI
 0NNkAMjZxbGMphnA5suoZ06YpMuUmWVmnoWTrEzJP2iZEDmITvrKC9lpkrI7YKPtwljq
 XA9UrKl9ThZZG5tfwA61wWt9PT1Pn6jkyqbOfGEL52UPlwdi0tVJmvPPJbLBepiSRlja
 YPnaXv1Q9pKmo1e2pZLEb7waKII0ewe0Y20P2r2HEpGuNKbqL2xUgu5+HmojkoTY2JYF
 QaYwp0f2FZzcgrd+gPxQJCCiZBsh4dmypVQClye2G+fvirQFOBr9i/ZQMS+VLwbLmUDK
 io8Q==
X-Gm-Message-State: AOAM533mPMtV0vVnRtr6o21bJu6+rs1nW0lwPeUwTw/ZQqIgrUelN2En
 9aczJd1c9dBRZDNXpI9nLjhHiclumqQBY98sn5wYIw==
X-Google-Smtp-Source: ABdhPJzhvKFwbXAT7a5wwaGQYw7NF1euM/Q4FRKXFc+6C4gjACFSTqGFo3gBOdVWYm8+xq2G84HLYS1g14gRcdu9314=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr989258ejc.4.1629822079026; 
 Tue, 24 Aug 2021 09:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-7-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:20:31 +0100
Message-ID: <CAFEAcA-XhRreA56JTH2w2QcDxr7uEBYuYTUEs=4LAnD7Zq=5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 06/30] linux-user: Provide new force_sigsegv_for_addr()
 function
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
> Most linux-user targets so far do not distinguish between SEGV_MAPERR
> and SEGV_ACCERR.  This function will be used to fix that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal-common.h |  1 +
>  linux-user/signal.c        | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

