Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB9661519
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUt0-0002gl-Ev; Sun, 08 Jan 2023 07:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUsv-0002gA-S3
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:45 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUsu-0006pW-Ca
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id m21so8683025edc.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgTqj700srJKwmbQ0yqgMwKG1s9RKKOWl454LlkNWUk=;
 b=foa1M4ssZhS5nt9h7oQwzDSeKzb7AtvwS9uXgLaxH91aQo1EEARlQ/q1QQ788nETGA
 4qsLht1niyyospx2gutbf+0Idxtry99Lihj6Y9n5kWbSHEIbLM87REMoYnsyjnKoZTmz
 dbXnbWuUZdFEkoB6x65pUv4p7kxsk/bMvNcsFKnBC/KHBbNMgGJScRTXcpL1xDSQMYQS
 +rmgOEN3Ymc9D6ThLNidTEVoQvCv7bkcBAMq9w05lTaw2o8OzJLVH30Yu82T+TjvxRe2
 T51E/NgrzBo1WgoouEawCtBsDSusagrGU5IYjBmYfncNP9Lz6oczqFehOyxCeoKjYZ61
 q/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgTqj700srJKwmbQ0yqgMwKG1s9RKKOWl454LlkNWUk=;
 b=IDp+6Irt8hddQTz7jAlzVUpqOqe3PcBxqOBZAiwUCIWczX/TZcV51u0Se004uscAFh
 6JJPM/Rz4C7CevsS9HwwOlGzxIQpdCTLl7nhuFt/kmG2RlbYSVvlYhl9TNjKamX7CQQ0
 k3XeBsvVoLjItOqLGEX1B53XmcFKfFrgPjzCuGzu2iwWEjupCCuF1FVht9KGnoiROMD8
 UadhK1W+Jv2wID0VhdUC60T0+1ehsHHSl/6ksfB/6t2V/wKG4qVhhqht/lEa35EVEO6c
 MEMVeerFHyMnGJGlpaDlOX5tjEyXDiO1xPgYZvaV4MBXE6DqIA8+LmPH9fN07xDQQXcz
 //Gg==
X-Gm-Message-State: AFqh2kpWW+xoLrrwfnIYOJRAvLR7GfkM4Fexb0crKVMkHqtT2dXip1nr
 ChsCwZD2ezm3tzZ1qEIGJCcr94yfJCd+mxYkTbQ=
X-Google-Smtp-Source: AMrXdXtfOqLH/Ia+sERBMyfNhHf5qMb1Aw6i8b9eXa6gPEOsh3qupTYuC+x5jX2kymeRHrA/HBcuIrL+gQhvApv9Nks=
X-Received: by 2002:aa7:d80f:0:b0:499:dfa:1c6b with SMTP id
 v15-20020aa7d80f000000b004990dfa1c6bmr381591edq.202.1673181282876; Sun, 08
 Jan 2023 04:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-17-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-17-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:34:30 +0800
Message-ID: <CAEUhbmWjTOimgy3E76J5+B3Cx=WmS_K-dXikOxdrizXdA=pGpg@mail.gmail.com>
Subject: Re: [PATCH 16/20] hw/block: Factor pflash_cfi02_create() out of
 pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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

On Thu, Jan 5, 2023 at 6:51 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Currently pflash_cfi02_register():
>
>  1/ creates a TYPE_PFLASH_CFI02 qdev instance
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
> named pflash_cfi02_create().
>
> We don't document pflash_cfi02_register() because we are going
> to remove it in a pair of commits.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi02.c  | 55 ++++++++++++++++++++++++++--------------
>  include/hw/block/flash.h | 14 +++++++++-
>  2 files changed, 49 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

