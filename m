Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C23D0352
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:49:22 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wg5-0005Zx-80
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wf5-0004sp-9N
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:48:19 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wf3-0000rI-Tm
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:48:19 -0400
Received: by mail-ed1-x533.google.com with SMTP id k27so30100465edk.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2jlldo6SiNVnoooUKroIDUr2ZTM8pbkuvcsBIpt0TE=;
 b=v8JooSyU2TZ+mW5rVYFAH5ygXSqGdi78stl4FXqhh9Q+QaQr6C0x0zgZb5P1ysAk4z
 /3yPvrfwg4XGZZhjFTZmWaN7QhDStYzdsGEkZTwrUokcxcYH1Xl3O4GxQSkhif7IRm5L
 APjglzgW8nBJfx+wLOVse28zO2UL9ZPnVvgd+IUvmP0CgGzzoqGDA9i6P5ikfvvPetnj
 J/yfMybBZZz/eCnDmn0MD9Mq1/qhDFvoj5Pp1aKRMpnB1ZmNHE+jgPBezI21x0euJkZx
 MsOFfi5SfDL/uTxQCE+q6/ZwL7mtRzkO2EHvss3CHxgRjyz/l8uN0BCxby/0Qvq0gav5
 1q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2jlldo6SiNVnoooUKroIDUr2ZTM8pbkuvcsBIpt0TE=;
 b=o3TctZ3AjOzisQOl4TBTb2iFT9vk/rlMOpZ9nIB/hRYi+zXqrEBJ30zmnfgHvfykQh
 AvguVEpuSTsDWSHkDGNMeA2p4l9YlS9cVUsexot2akRRoCZks2zKEziDJYeoRT0dBQRq
 BOcJhrUrr0NyMtlmkEa2RPg/K7aQkQ4Gq8z1IDtB29AQHXDQ3yEsWYcwsDS4Ru+H1A6d
 dAtmuU+85uxKJfN6HBvvJnfPHDIng75kxZoZG38gwTQ3imNnc6t9D/VjW4qw0ftpwbyq
 RjQFNtgMTP1kUMjV9rsSRvyUMZMJFF3sNAE63aAgkIfmzNaYwbUWVTe2ntVMqU92ucFO
 sXaw==
X-Gm-Message-State: AOAM53327gJsyyNge1bSpkMlYmC1LzsiRQO/PsNiG41KXbe2gq1bh8sJ
 OrJuGoSNHuriLfXliD42BCUO0Wuxdq9s4qVxIf2PDxP/WLo=
X-Google-Smtp-Source: ABdhPJw05PnnL6NvIknuRBDlLopSKFU+br8oMYm5EjT5LhpgHYWuT8LNboGseYQT/IxYga59Vdl03EytZJE1SNSbXMY=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr43155576edt.100.1626814096345; 
 Tue, 20 Jul 2021 13:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-18-richard.henderson@linaro.org>
In-Reply-To: <20210720195439.626594-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 21:47:35 +0100
Message-ID: <CAFEAcA_6obz=TmD4SCfqJdrbT4X0+yieBP1CgksBWBGwcGzZtQ@mail.gmail.com>
Subject: Re: [PATCH for-6.1 v6 17/17] accel/tcg: Record singlestep_enabled in
 tb->cflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 20:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Set CF_SINGLE_STEP when single-stepping is enabled.
> This avoids the need to flush all tb's when turning
> single-stepping on or off.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

