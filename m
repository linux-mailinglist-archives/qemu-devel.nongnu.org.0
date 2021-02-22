Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCA321F91
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:04:01 +0100 (CET)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGUy-000741-Lf
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1lEGTr-0006JT-AZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:02:51 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:40379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1lEGTp-0001uU-8V
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:02:50 -0500
Received: by mail-lf1-x12b.google.com with SMTP id h125so7444382lfd.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 11:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7tjb/ULPTs0YK9djuSw4jI/piZzj9Be22oeBt6d4gY=;
 b=mrY2NByHHyaff5bYeda64M/VoEosJ32rOPg4tTipSJbWFIY8bKAiJGN3qURfIutpyz
 cKHTAdFT3H9fWNcQWE2vXUst95QbVQs61PEsUdkOp7sG0fP2gxNN5ic1tPrEInT/BFCC
 DdjFE6QkIVos4s3D0CwyGIsOIS7R2loRI6I3YgmoFTLjfYtMpCnkAXXeYXEvbzQfP7xh
 hZL+lMLgfhKTczJIeW/5/P43e8Jte8+AMEoZg7Zk7fIwbSVfeWZMzJi5nYZSyuhx6wB3
 pa+VbIe1bTeAVIh3SXAnnnoSQJbpwwYw9zj6co1Uc5gfn4SJlHujHmfF00kn4ZC+/sb3
 ikuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7tjb/ULPTs0YK9djuSw4jI/piZzj9Be22oeBt6d4gY=;
 b=j0WrUIR2rDoMZOOo+Wnhmne2Y7IjazPLXdTPAZJMHQXI9H9wsWoUuHw4iq/+9NTHb2
 +KXr/HH4gZO9FRknz0j9+jlJxfER8rPfP5PNK04SiXJMEyNPDsvm+uG4j16c6PDMyaj2
 kK4CVQyeiAudxknoihqFbh9RAf6J2sU1nGke7TAg9g52N3FmcypqjjC2/qNYaVO6cidb
 08v9r0hwiQbESrl4HpAf2KkFGTiQMOFkHf9K6cLm+xVtHT+f2FfIvPBsTi5QFXzROxQf
 nA0t2Jr7roOF+PQT+qIbHa/q47tu8Xp+Y1MrKu1dsFLlc7Io9saUcb9yUPz5E7CGWekq
 fztg==
X-Gm-Message-State: AOAM532CMPwB/2cxcfaIfHmk/sECoFCn5mktvTO79Q0UkcX2kgpZCx3u
 SJF79wLJ1NInIEGRhBItjdqzt/0eigfQQh/ow+T/cQ==
X-Google-Smtp-Source: ABdhPJwWmG0JYv8DqkeX3ykU/s7MQAhAyFGkaW2VRAIk/PCpiPtFsdg9zr2j2BvY54a5YWmtKdCLcROd3JJyfCfLpf4=
X-Received: by 2002:ac2:515c:: with SMTP id q28mr5267546lfd.297.1614020566033; 
 Mon, 22 Feb 2021 11:02:46 -0800 (PST)
MIME-Version: 1.0
References: <20210211194258.4137998-1-nathan@kernel.org>
In-Reply-To: <20210211194258.4137998-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 Feb 2021 11:02:34 -0800
Message-ID: <CAKwvOdkJfJ+LDspz04tsjd=55LxF5rgTOAXt0cPxTyCCUBqgBw@mail.gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>,
 qemu-devel@nongnu.org, LKML <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=ndesaulniers@google.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Did this happen to get picked up already? EOM

On Thu, Feb 11, 2021 at 11:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> which violates clang's CFI checking because fw_cfg_showrev()'s second
> parameter is 'struct attribute', whereas the ->show() member of 'struct
> kobj_structure' expects the second parameter to be of type 'struct
> kobj_attribute'.
>
> $ cat /sys/firmware/qemu_fw_cfg/rev
> 3
>
> $ dmesg | grep "CFI failure"
> [   26.016832] CFI failure (target: fw_cfg_showrev+0x0/0x8):
>
> Fix this by converting fw_cfg_rev_attr to 'struct kobj_attribute' where
> this would have been caught automatically by the incompatible pointer
> types compiler warning. Update fw_cfg_showrev() accordingly.
>
> Fixes: 75f3e8e47f38 ("firmware: introduce sysfs driver for QEMU's fw_cfg device")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1299
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/firmware/qemu_fw_cfg.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index 0078260fbabe..172c751a4f6c 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -299,15 +299,13 @@ static int fw_cfg_do_platform_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static ssize_t fw_cfg_showrev(struct kobject *k, struct attribute *a, char *buf)
> +static ssize_t fw_cfg_showrev(struct kobject *k, struct kobj_attribute *a,
> +                             char *buf)
>  {
>         return sprintf(buf, "%u\n", fw_cfg_rev);
>  }
>
> -static const struct {
> -       struct attribute attr;
> -       ssize_t (*show)(struct kobject *k, struct attribute *a, char *buf);
> -} fw_cfg_rev_attr = {
> +static const struct kobj_attribute fw_cfg_rev_attr = {
>         .attr = { .name = "rev", .mode = S_IRUSR },
>         .show = fw_cfg_showrev,
>  };
>
> base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
> --
> 2.30.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210211194258.4137998-1-nathan%40kernel.org.



-- 
Thanks,
~Nick Desaulniers

