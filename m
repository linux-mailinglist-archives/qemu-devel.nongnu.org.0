Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AB4FDD8C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:09:53 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neEPA-00074w-2i
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neEKT-0001d2-GP
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:05:06 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1neEKL-0004cL-RI
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:04:58 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x200so8713843ybe.13
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0jMuE/4VFcKYPKUDmrXJoO+ONBHsxr4s331j/VpHSEE=;
 b=vYmpQwh5ha2/pxigPI5ZdAahjiAjfTnE2ch1WizDVIsb8vkIO5AxK6ldiRfaPUUyN/
 //MaaaMZ83yxB0p2qK09aK+c9k9uB0oABAvPhIwnZ7ZfYaRsFki9CBNIl1J3ST6U7yOn
 +pO9QH6l3uDQnTWGtYwy4ixZMfYy1vnP4avLs6ClLM9udRTv0ct6FOjHJBT5EBl/Juam
 T+9Btr+ueKUykLlfwaIpdWbHUrs8EVSgQl4C0Xfw1mMI0pT8AbARcCImApSjfzQ3vLL0
 zY+Vu7ITn8vtowIBU6bXbtagoAEvm67c634cudpLvoeB2PCAw1dU0kB6aN388kKkkCo+
 +n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0jMuE/4VFcKYPKUDmrXJoO+ONBHsxr4s331j/VpHSEE=;
 b=13+FFkAnBU5wuhWjV6d2diSwIysWq0GpCTWH7XmANJ0db5OGMNMb0Fv+7Cd+RcaBAK
 e9sm326e1e243yDaud7J22uInhXACZKcBZCKTk7jGafCiFbgSVKm/ug/38XfsqGSQ9bP
 utG3WrjAbklPUk2uePmR92smGfk2CmFBQwQXqfTcSoTIXmXdVLa3OW1lN6biye9daU99
 20Hsnn8ED11X+K1r6GtDU/rt4pBDdvdHOQk9p1vET/p3br3h+D8JzMh8+Q1UWD1cubwp
 SpEe+gRMOt/KmPkf5M7Wkz0igHrJAgSNTvRsq1fun7n14JHCo3YK8ubYXjFYu43Ur0kq
 HCww==
X-Gm-Message-State: AOAM532zTxGTbxZmkRvh+3Fn/ZYBgKJEx6Vmiz/STYu+UKdsmg1wU1cl
 sRfwuD5wgjx3WowFmdsSt4sVMC9L6fFTBJI3ecTsaQ==
X-Google-Smtp-Source: ABdhPJyO/cxbmN3vEBxiUXOXqN9/Z2nvjaQRvmOd66aT3u54aJjR/jN4S9a/Pes7HvjaC/hSplRInPB2NgqYhoZnUok=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr25413007ybu.140.1649761433612; Tue, 12
 Apr 2022 04:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220412104519.201655-1-alex.bennee@linaro.org>
In-Reply-To: <20220412104519.201655-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Apr 2022 12:03:42 +0100
Message-ID: <CAFEAcA_j78LD=K=BY+szHK+X0kyh3RXm7ZT4gM2GDmcKTLYeCA@mail.gmail.com>
Subject: Re: [RFC PATCH] gdb/gic: expose cpu_index via MxTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Apr 2022 at 11:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When accessing HW via the gdbstub we can't easily figure out what the
> cpu_index is. The canonical case is current_cpu but for some cases
> that will be NULL. For debug accesses we can overload requester_id and
> make the GIC a bit smarter about fishing that out.
>
> [AJB: very much a PoC hack for now but interested if this makes sense.
> We could encode cpu_index in another field but that would grow
> MxTxAttrs even more.]
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> ---
>  include/exec/memattrs.h |  2 +-
>  hw/core/cpu-sysemu.c    | 15 +++++++++++----
>  hw/intc/arm_gic.c       | 33 +++++++++++++++++++--------------
>  3 files changed, 31 insertions(+), 19 deletions(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..1333a34cb3 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -43,7 +43,7 @@ typedef struct MemTxAttrs {
>       * (see MEMTX_ACCESS_ERROR).
>       */
>      unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester ID (for MSI for example) or cpu_index for debug */
>      unsigned int requester_id:16;

If we want to provide a requester ID for memory transactions we
should provide it always, not just for debug. That way gic_get_current_cpu(=
)
and similar code can unconditionally use requester_id and never needs
to look at current_cpu. (We would also need to figure out how we want
to parcel out requester_ids in the system, so that PCI requester IDs
don't clash with CPU requester IDs.)

-- PMM

