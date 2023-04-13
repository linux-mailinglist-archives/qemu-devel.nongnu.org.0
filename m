Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72B6E123C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzm8-0001CX-2w; Thu, 13 Apr 2023 12:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmzm6-0001C2-Cj
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:26:18 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmzm4-0005Tl-Lj
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:26:18 -0400
Received: by mail-ej1-x62b.google.com with SMTP id z9so11824878ejx.11
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681403175; x=1683995175;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C/NjjnA1zJChYiDScaB4DFYsLTdq/db45fwRpB4Qbyk=;
 b=bRGVH9vH7O1NKkQXzvds1/WkvzeOcoZDdX9pEP+AfjWa1qUDuJs84GEFHxDQpg2jcL
 afQ53lfQYkYwM9DouoD1LH+zUsHz6OL5kVoHC/n4Ny7u3KTCd46mbv/LklAHhi/4hPCh
 IBgGsT7McX+WInhHsC+6lGg8CM9zJaQpEN16jdniP+uep+j3+RjKS0jhuv88YF0NVVln
 pGBOPVSAL1ET2N0EtwkiHJDuhRp8I+zcxR30DRjIiixM5B1Wn/DVH2hMdYFuJC7fCs9Z
 qHsjTO55ApUE0DQNs/T/vrS4n98OpMxuSDFn/BgsS1I/LdMCywfEPM2bfZnm/5xtiHqo
 sMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681403175; x=1683995175;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C/NjjnA1zJChYiDScaB4DFYsLTdq/db45fwRpB4Qbyk=;
 b=Btyx4jPjmIcZe5inZEQk0CD5eP4URhJpUDyCakKC4nxmaEkx+V5s+9mPTNPCLrM6H0
 0n4mKl30F6wFQ9RDBSWFiyaMW3QPDVLn8GbrCltb9/ff2e2cOU2HUi+j7oSPwSbqgDqq
 lVsqrt7GfotO+GWNnpYluZTfVgAZ6Cqni1D8mOk6C8Q1gnt85V8CHyKYwqldFdakl4cq
 ZhHUdRtdkmLMyiJItemyZCmdRuiFI+CXHhfpfAeRPUYoQvQtyi5qzrGMacZGjtZjgwCb
 C1t5YUf5W7CGLjvyFjgSb3rt7VHDQt60wR/PBJDWu6nvhBdfOc4eq0946NowQDkBIqfC
 HaVg==
X-Gm-Message-State: AAQBX9dCF5CFMO+R7sQZzg1X+9SzsGjrrdJug50l7FlWHBe/cTeWITxw
 8qEzDyxFU/l0HRwDJ7MCe3dTriELlR47595pBF1uHQ==
X-Google-Smtp-Source: AKy350YnwrQNGw1hZ5++zhBFIw/SP62Z+RAtZvDUldC9vjt2SypRhusOe3STkzLSecoS2PNBlOUijJj60bvXgi88vo0=
X-Received: by 2002:a17:907:1c02:b0:932:4577:6705 with SMTP id
 nc2-20020a1709071c0200b0093245776705mr1691010ejc.6.1681403175163; Thu, 13 Apr
 2023 09:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230330152613.232082-1-thuth@redhat.com>
 <33e52dd7-32f7-0fa8-b6ee-813b87ead623@msgid.tls.msk.ru>
In-Reply-To: <33e52dd7-32f7-0fa8-b6ee-813b87ead623@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 17:26:03 +0100
Message-ID: <CAFEAcA8g5Uqcns0FPy74mZ+jh-8ZtCxOTR8qL+RGbn+XjNfk0w@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/malta: Fix the malta machine on big endian hosts
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-stable@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Thu, 13 Apr 2023 at 17:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 30.03.2023 18:26, Thomas Huth wrote:
> > Booting a Linux kernel with the malta machine is currently broken
> > on big endian hosts. The cpu_to_gt32 macro wants to byteswap a value
> > for little endian targets only, but uses the wrong way to do this:
> > cpu_to_[lb]e32 works the other way round on big endian hosts! Fix
> > it by using the same ways on both, big and little endian hosts.
> >
> > Fixes: 0c8427baf0 ("hw/mips/malta: Use bootloader helper to set BAR registers")
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Has this been forgotten?

Looks like it. Too late for 8.0 now (and it wasn't a regression
since it looks like it was broken in 7.2 as well); will have to
be fixed in 8.1.

thanks
-- PMM

