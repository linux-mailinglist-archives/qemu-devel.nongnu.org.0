Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DC6DDF99
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:26:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFrQ-0000G5-Hr; Tue, 11 Apr 2023 11:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFrK-0000FU-Lf
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:24:39 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmFrI-0006oU-Mu
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:24:38 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gb34so21540303ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681226670; x=1683818670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uqXJKldNs6ZkRC2QswOKIpXD0Aq3/zbZCFwDsT+PsrM=;
 b=qkaqy2UqZ0uQh/QhiNHySK1TH3rdE20Pz+qlgFg/g0BDNO92U6nZimPCzgtaXe+RuG
 VVTp/LtLC4mwC56bM6vqLa6QeaWs2dgLG4VIyl+yIweWb65XnsBQGagVajt4oIidIflj
 fUkOKawq30bIL2gTontuha9ao8Jtfes9Wgx8HiLbS70HunkOcLSbdGYqzCC021EtRbKq
 HGcbXituEXNwopYujAuMfXjCWsbgpEguVPPxREgqFke1VSCaE0AMIfWPB1bqRL24oq3O
 NMpPkbjXDo7tM2+9MsJitpayXSN2ZNkCM3X/P/4ujvaVD6MGcXvlTgb33MZ+dW7V7xZ6
 tu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681226670; x=1683818670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqXJKldNs6ZkRC2QswOKIpXD0Aq3/zbZCFwDsT+PsrM=;
 b=YBgOLkS8oPmqzm/SgrjTvFhBUG4mMpaxS9XdHsLk5i7lPTaKIVVh+XeYVl3kPkLgoE
 LUvI15nKzCa7nE5yvFC/t2yW3GDLbkKyaUm3duP1ulW1YUbUNlF7yroH4ubm3I346x0Q
 Qwv5aMJKdstJrBo0mGBh7V1N4eKikmf6v5SAnLsFtRhIovlOctSmW+MHo5ou0tIpI3Jm
 s6uzHRUf2T+xXRiL4BhBsHaoBcxMzFzi6LLvJOFQXvuxRKJW8hJ5eXVk6l02aJNnZvBE
 28DAvjybv1B0NUFbDhxMCbDJkejznc4XIVHGiKY9V54QZ3HhxXBQugW7NCtv6lJ20QIn
 /cJw==
X-Gm-Message-State: AAQBX9dx8gJ5CpBPc7wsmQZKy0qYLDjJMIjSk+1Yw9K0YYBKy/lGEyEb
 NoH2zFs5h/MV2bsmlinVb7Jpjs3iHi7PmqeUeyY5uw==
X-Google-Smtp-Source: AKy350b94GncRrM0oZ5PKTwUK0dp7VIlFo1aO+dTLajrnlDASKUsfCQg2++nnQ9Y/LnlqIGGxaly8f0gamGvz5HMGgA=
X-Received: by 2002:a17:906:b301:b0:930:90ce:a1a6 with SMTP id
 n1-20020a170906b30100b0093090cea1a6mr4576902ejz.6.1681226670194; Tue, 11 Apr
 2023 08:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
 <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
In-Reply-To: <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 16:24:19 +0100
Message-ID: <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
To: "Bartell, Paul" <pbartell@amazon.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Mon, 10 Apr 2023 at 15:38, Bartell, Paul <pbartell@amazon.com> wrote:
>
> You can reproduce the problem by running gdb against an ARMv8M target running secure mode code (the default).
>
> Running qemu with the following arguments : qemu-system-arm -machine mps2-an505 -m 16M -cpu cortex-m33 -nographic -semihosting -monitor null --semihosting-config enable=on,target=native -d guest_errors -kernel /path/to/binary.elf
>
> With the following .gdbinit file:
> target extended-remote :1234
> compare-sections
>
> Upon startup, every symbol in the elf file reports the following error:
>
> Section .text, range 0x10000000 -- 0x10009298: MIS-MATCHED!
> Section .text.main, range 0x10009298 -- 0x10009300: MIS-MATCHED!
> Section .text.prvQueueSendTask, range 0x10009300 -- 0x10009338: MIS-MATCHED!
>
> Attempting to debug results in errors constantly (unable to read or write memory at all).
>
> init_data_sections () at /project/Demo/ARM_MPS/startup.c:95
> 95      {
> (gdb) info locals
> pCopyTable = <error reading variable pCopyTable (Cannot access memory at address 0x381fffec)>
> dataIndex = <error reading variable dataIndex (Cannot access memory at address 0x381fffe8)>
>
> Does that clarify my report sufficiently?

Could you (a) file a bug and (b) attach a sample test executable
that demonstrates the problem, please?

thanks
-- PMM

