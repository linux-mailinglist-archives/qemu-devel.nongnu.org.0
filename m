Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7966151D
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUtN-0002pY-C6; Sun, 08 Jan 2023 07:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUtI-0002nd-8J
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:35:09 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUtE-0006ti-2M
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:35:07 -0500
Received: by mail-ed1-x529.google.com with SMTP id s5so8630976edc.12
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4v/U1h0VZIursZ1OauazikRIMeBnoSSuEQtNrScYJjE=;
 b=b1rrjCZYmgXg9xJDaS/i7hbExTgfsK4EoyCb1Yk72pSjws75mFx6uWMw9IGwoi4twQ
 TkmfVUzAJzqgdawg1qHUeF0yAFe8PEc6EWdnvXDG+S1E2snsZ6cN3qQC/Pkf+HPpe9fb
 xaFmEDSi/hewR2IsBrhP51V9/ItWsJuoG2CmS2ZJJs84sak4n2KStqeXvfWY9dTt1RrV
 sqJcj/TnaYDSMg3aGBJRyJ+PsPPGKGJSDeYg7jjSJ62hQZpfv2ivGRNyJ2kZcWjgSuQw
 7uVMdWdg1AkCf/rE2wmy1zl4jMAwP0KHAlzWydv48HuIKRYwcLhzDGWQHDXHAuTo2Bqd
 UueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4v/U1h0VZIursZ1OauazikRIMeBnoSSuEQtNrScYJjE=;
 b=xhgkRehrs4g+0W2Ez2Et/Fes9QWcDkeM3dkk9zoFwp9wXbgDWIxpFLp3MWn6shjozh
 OPMGKOXdF08/g9/qF8T+Zd8rjl6EY98zupyOfiOQabpdelwdkg0Sq509BNV8parqMEzb
 cET85708J42jUpyNW9B+1Q/TmKLeDAGgZTAyVeZxYOowzJ5dEKhaInHzquh3T839aPHB
 21nHZpr3ZnTCIY5/yh4jt+BqcUR4n29xYpGdiC5psy0Jrfbr23ivuZRH1/06JeNaMqAG
 Ak8SVL/E26RMp26a5G9qbdtSOO21mhl5Px+Uy/1OSqkYRHxO6VClr7MZo2F/4xmS6fBR
 pgmA==
X-Gm-Message-State: AFqh2kryryNzk+tjcCAQEFQzcsf1f/ahJzifOlF/kVCU6HTtpB88wFEx
 uCo45iK/hEIi9Bz8lqkfDzoXQYZ1NWlOjW3oQ2M4bGqo
X-Google-Smtp-Source: AMrXdXsoNUYSDOUcNEo3rsrggq9tzOLpBG9RTourvCkJWMmEqu13hMjQhC3fZDkHWV91QHg+eiXtujAd2IdaC13/03w=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr6925173edy.193.1673181302155; Sun, 08
 Jan 2023 04:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-21-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-21-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:34:49 +0800
Message-ID: <CAEUhbmVW3e9C4eMjsV3tST3kzHrkBcowZr+PzXg1Qfgg7goUng@mail.gmail.com>
Subject: Re: [PATCH 20/20] hw/block: Make PFlashCFI02 QOM declaration internal
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

On Thu, Jan 5, 2023 at 6:50 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Convert the QOM PFlashCFI02 to a forward/opaque pointer declaration.
> Only pflash_cfi02.c is able to poke at the internal fields.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/block/pflash_cfi02.c  | 2 ++
>  include/hw/block/flash.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

