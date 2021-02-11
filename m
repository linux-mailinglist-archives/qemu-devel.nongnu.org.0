Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6262319562
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:49:44 +0100 (CET)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJqJ-00053X-CX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samitolvanen@google.com>)
 id 1lAImJ-0002Ua-MU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:41:31 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:39110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samitolvanen@google.com>)
 id 1lAImH-00070m-1g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:41:31 -0500
Received: by mail-ua1-x931.google.com with SMTP id t15so2189746ual.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqZZZvFE5VxL++dFfoZprDhk9+CSenhmKTyUPdyCU/U=;
 b=JwpYmrz5Pq9isvSseBiUCn4eQXQyfBr2OxOXWrBy7tw8o+XYqRFK+R2ucZp0cFdhaK
 A4sSR+eNIBHOfYKj7ZwwWoMNYH1qP8OtXTYlKygnib3yOBIkWMO2BAsEd4R0rZWVDrU4
 UQB2CNI9KgTkaZW/msOwTE9FUsXlVrt18/mRJUzfFqEXYlrgLt0Vxwx1wDYe7v4b0wKV
 rJ9yO9NLkvzKJHpcirJ1nQVtIIu9dUAgZPIFkDx86PTwZf6zFB8pXXDqiVLhBjiSGy1W
 3Txd7anedzyRr7l070exCjtnnQVhSA6MSHFx8e3l2nPByd1zdHNBPvjCE2cIpGXPRd8K
 kGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqZZZvFE5VxL++dFfoZprDhk9+CSenhmKTyUPdyCU/U=;
 b=B3Zc1p0Iqd4uhyD97pW1TLDVOcrodsu3mR5vqaU0mu8xouLg641P2KSwxljgLlGyhm
 zfO2PIWx//1aobzqhzqmOeyMN3tU9TGfz434pCFdBQWTyNXqkPNo3BA77uH+fv+A9M3u
 7k32pUctTeNZr7atJ39Alkh+deZWgsY45d62a8SvLI3nUqV7CZTOWOvGYFHegrbZyWbG
 uF5UPq8aKJvypyJ0N+VbBCQNu1zV0wHmYNwaoIine1cVSiOAgEJ5uGZHnL5YGXpsD79y
 7kvvbDKGIb04rAVLGzZFAVjBTvxDfSkgzDClztbmGUnCKEx4mhiYLaPQGBTN+X56Eckj
 sg2w==
X-Gm-Message-State: AOAM530+jYgnP9Pt9PZS6Z49KsdOJ4c+WVamwFsrFwEfyOx81QH1rbc4
 Bwx4oVFAXam4FHCwa93Duwg4hl3rrnz2J0e8ohl62A==
X-Google-Smtp-Source: ABdhPJzIm5VtW1C8leqxolWHrGOE0VBLS/CwbuSyepxQoy46V+/+2C4/k7slInILzPb1rPE6aCMUoTA1e2xrIj9H8d8=
X-Received: by 2002:ab0:2448:: with SMTP id g8mr6669684uan.89.1613076085437;
 Thu, 11 Feb 2021 12:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20210211194258.4137998-1-nathan@kernel.org>
In-Reply-To: <20210211194258.4137998-1-nathan@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 11 Feb 2021 12:41:14 -0800
Message-ID: <CABCJKueyXp5EQnmZ7a6HR87oKwDBDukprnJWT620McSYFd1SMg@mail.gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
To: Nathan Chancellor <nathan@kernel.org>
Cc: Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>,
 qemu-devel@nongnu.org, LKML <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=samitolvanen@google.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Feb 2021 16:47:44 -0500
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

Hi Nathan,

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

Looks good to me. Thank you for sending the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

