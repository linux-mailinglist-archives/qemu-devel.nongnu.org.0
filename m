Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953DE3F8A41
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:39:23 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGXF-0000Fy-MY
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGTY-0004q7-KG
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:35:31 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJGTU-00088M-1x
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:35:28 -0400
Received: by mail-ed1-x530.google.com with SMTP id s25so5066088edw.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6k9eU2KOZ7kniwPglQ5e3qfK7erHrd3eaoioKg1AO0=;
 b=mnKN9JTTwAccYgZpUQq1o4M/7mgExdmgr3ZnGTdnW6ne0zFuSR0TG1nvN86rkS650g
 gZPIb5zAFVMphGUrGev4536uhC/gAW+QpP3e5wYyodP8lMa2SYZSPoCvNFk9iW7c1I4s
 TNIGMdmQZGuS69Bui8WL4wbA7jPQQ+rTYOiaF7NdPRdtmWTBwBjp7CR1ImviXG82weKL
 7iuiLDMYgKrkiK60Lp0O8kzlfoS6bIuPiTcv7o0C2L5QqIG6f0L0RekUp1z0J+gZ2gx6
 IY36rELBLJtT+C6IKcXGFxKtBMiejg/8+kaV/PNQ+uRv0IZf9CbupQctEq24Z9mjrYbV
 G2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6k9eU2KOZ7kniwPglQ5e3qfK7erHrd3eaoioKg1AO0=;
 b=Gsc0IiXhdG0+Q76MXzKFPPgSTM2CEty2dUq6SK5H1FIc+OeMOchAuQMck5ZIT6SNmS
 qEoDLpJ+wUsz3SN0lMoNXmCC43++QRaJ7EnElwE5ZAwIgawbA8fRJKYwQXzlm875TKTD
 DrWsCPMUdNA1mkHkbC/kIY7br+dPsIU4lI3JgnhE7gXV0wsNtGTLKBiZgJiJiiI/a7QB
 NNIG7bM+prYVOmtMITIaQbEL4SIwDFNovY9eDlqdQaJfsHV1wvdTUqj+JlGs+EyhKSvX
 6xEkxOeG/Xz9Z8LPfo8ESTmBEdWUUyMEbQ+UcTp07InYWixYZn0znaKtUabCMkYlky5R
 2WrA==
X-Gm-Message-State: AOAM530FGRcreE2cwTyeGdH4555nrls32+SYhbm6dTw1q0zrp6ottHj0
 Sv9yxK4uix2B5U2/dUuXQ9WQFqbZrnSMB05GIsMj3ZzTky4=
X-Google-Smtp-Source: ABdhPJzvOQajHSOxnd5NI2DG0O/BvDHw1K8fiu7JLS4XyaZLf2YeaQyKvjfCAyBXdkhjnvNKbXvADsEruOn62KqvsA0=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr4519709edu.100.1629988522589; 
 Thu, 26 Aug 2021 07:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210813150506.7768-1-peter.maydell@linaro.org>
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 15:34:35 +0100
Message-ID: <CAFEAcA-n1242Le8o0=Mp_=itv7Q+Xj09h7Fn8jPS7170dJMgjg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 at 16:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The POSIX spec for sockaddr_in says that implementations are allowed
> to have implementation-dependent extensions controlled by extra
> fields in the struct, and that the way to ensure these are not
> accidentally activated is to zero out the whole data structure.
> We have several places in our codebase where we don't zero-init
> sockaddr_in structs and so (at least in theory) might run into this.
> Coverity spotted the ones in the net code (CID 1005338); the
> others in this series I found by looking at all uses of sockaddr_in.
> (The gdbstub patch changes also a sockaddr_un use, for symmetry.)
>
> Thanks to Eric for the analysis of what the spec says and why
> Coverity is correct here.
>
> thanks
> -- PMM
>
> Peter Maydell (4):
>   net: Zero sockaddr_in in parse_host_port()
>   gdbstub: Zero-initialize sockaddr structs
>   tests/qtest/ipmi-bt-test: Zero-initialize sockaddr struct
>   tests/tcg/multiarch/linux-test: Zero-initialize sockaddr structs

I'll take this series via target-arm.next unless anybody objects.

thanks
-- PMM

