Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1B6613B6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOIr-0005F5-VM; Sun, 08 Jan 2023 00:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOId-0005EW-HV
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:33:02 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOIb-00032a-1n
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:32:51 -0500
Received: by mail-ed1-x530.google.com with SMTP id v10so6636499edi.8
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOMqs6LaRM5mJ+K5gtYQTYXILJDlaI0AYjL9pQ15Xhw=;
 b=liFlmmWSXM0n2NBNzdH2nmAYeN6qZnxQUWGx4ewlZs8pZWDTnmdGFcRj15x8R67hwT
 oACYsxZn0XGVL1/KYtb7u5UqHBc2LTFXTqxppQTyvZfHfjTSp0eQcgIbGUKo0LadydWy
 9HazRPC0pIfMBEityz0JviYggoC0cb6mFfAstNwZ6VvVkNlc9zkc+aKucHBEBIOT8sZ7
 Kf3U/D5VnjshborXY+xZNbqf7K+iukWkwwgq4RYwQr8vshok6DVBbEM/S6btl1VaAiSD
 Ymeqy42veC4PfPpBKN5IJosBCSOJU+tUES9+/9z7My+WDFMUwzvt0rCQMMR9fCPdNUTn
 O4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOMqs6LaRM5mJ+K5gtYQTYXILJDlaI0AYjL9pQ15Xhw=;
 b=U0bd8Mz8ytV3d/neEaCufV9Rg0/dqHWVv7diLafXRg3Qle4DawjH6kfcP++TnFpg4R
 c8+b9EFxXNeL89YHY/BlMFoid+3THBl/2JPTMABAhKFbukS8g5zjcDeZswYdHVycsjkO
 +Q785S6r8umRWAPPfiBJQ/0BVkPHih05ZUtO/HEoSdsRtJIPjcxG0921GkT9fU8B2/y6
 0SzSW0u7B7Z1efNhoiVD7QfXS9EsVAciTQyt/5sIXRzkgPFA/DkU0o0p2QNzggtC+wKz
 p7Zz7wTc6hAr3P/5vZEYAmRXsovuY8jRJj4YZzqp0M+l0FUxZKjrFNzbjGdzVZosHKff
 5bgQ==
X-Gm-Message-State: AFqh2koHTQoQNPD5PPG4RceQXLayqozpqaFq04e/7pPkfLRAiQd/80AK
 SMxUwXNLkCmFFnrgce944KAWTtETelau6W5gX7Y=
X-Google-Smtp-Source: AMrXdXvC8UF8t/ygaH1SQUdN+Xs1l/HMR3Y7U27Am9sN/ZUXqYsU2Mn8YHFDhlt/i55HiOMVI9nestcxnrNfTJlX77w=
X-Received: by 2002:aa7:d80f:0:b0:499:dfa:1c6b with SMTP id
 v15-20020aa7d80f000000b004990dfa1c6bmr275853edq.202.1673155966882; Sat, 07
 Jan 2023 21:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-10-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-10-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:32:34 +0800
Message-ID: <CAEUhbmVRCp3uqdJ63-=rNDC4DXA88e18hSaTpc0_Y6MRYE-M4A@mail.gmail.com>
Subject: Re: [PATCH 09/20] hw/block: Factor pflash_cfi01_create() out of
 pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 5, 2023 at 6:16 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Currently pflash_cfi01_register():
>
>  1/ creates a TYPE_PFLASH_CFI01 qdev instance
>  2/ maps the first MMIO region to the system bus
>
> The first minor issue is the implicit sysbus mapping is not
> obvious (the function name could mention it), and the function
> is not documented.
>
> Another issue is we are forced to map on sysbus, thus code
> wanting to simply instantiate this device are forced to open
> code the qdev creation.
>
> This is a problem in a heterogeneous system where not all cores
> has access to the sysbus, or if we want to map the pflash on
> different address spaces.
>
> To clarify this API, extract the qdev creation in a new helper
> named pflash_cfi01_create().
>
> We don't document pflash_cfi01_register() because we are going
> to remove it in a few commits.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi01.c  | 34 +++++++++++++++++++++++++---------
>  include/hw/block/flash.h | 14 +++++++++++++-
>  2 files changed, 38 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

