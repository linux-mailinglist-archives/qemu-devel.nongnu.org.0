Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA936DD712
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:43:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmAW6-0006CV-0A; Tue, 11 Apr 2023 05:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmAW2-0006Bs-68
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:42:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmAW0-0004W3-Bw
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:42:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id sh8so18686466ejc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681206134; x=1683798134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lFsfwQMai3YumHmI00q+pGOFiY1+qqsIQAwngZzTd6A=;
 b=gwL9EovHcJL7A4vi75KJ+Zi6xBOWNxa0MTt41d3gLX2ZA3LcNYJ52NRryYH2S1oxbA
 lmUvsQi2e/G+AaQE202Atz1v3YQq5pRMae5zzko2MbHlm+74uleI8GrmWN+2ZG5ntsp1
 ohZbOrjX5bqksKeZ2jIrm3dyN65KwoDyFDez9ybxYkKWFj3i9a6KweVTtlnFuJUNshng
 rf+RY3icuaBTJ2W1B2olY6MvON0uQn9wohxehdrB2typUKU7j9rq2or/fnOd9etYOjyi
 5YQCdaqVe1I8seo/gzKAy+d3VyrhUfW87Nuq0LdcTQEhRoODfdq0H9UqJ3FayTdQlI59
 fQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681206134; x=1683798134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lFsfwQMai3YumHmI00q+pGOFiY1+qqsIQAwngZzTd6A=;
 b=GCp2Twyb4GsEo7P9t+1VQOwllfOvXMCgXwglRbKNVcscw3F7E68A5QrJgtvymtf2dd
 MXvvpurI8wZfZAhBAl80hfCNCmqb00dc259co78uYgGGExZh7sv3PwrI3oKj1I9LSBwC
 CbW7GQa3Gvcqv1gplXZlxlSiGRszaBC6VSSSgBhdgD7C8lZpHgYW73CFNVQLmjbG6uBy
 gyAIg2dtQ7QzqxQUuFP7c2qQqIrkaibeWBI+/BehV7vtVu1yxFfSxgeijSSEUrZ+wXDZ
 LJG1FDtH26iEvggaiXM6nK+ixxcg0NYi59vNgVpQO1MYp0V8vXwjSpVvvIMd8nIDVd/3
 J/Gw==
X-Gm-Message-State: AAQBX9fVsXtiEvGpdNc1e1whED58RhPef0Ai66MZsWEY37OQA+V1/NNl
 OoqdMu12R6s97hvTCN1aROkCNnYYsddr/Bf9iL8lhg==
X-Google-Smtp-Source: AKy350Yhg5QpWQFbsbD+KGx+yp2I454dTnhcdFEAUgbe+4+6+al7tvSmtBzhRu9e8mtdSiAinQDLk2G7io6mI2Yto2I=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr5158735eje.6.1681206134370; Tue, 11 Apr
 2023 02:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220215093223.110827-1-pbonzini@redhat.com>
 <20220215093223.110827-16-pbonzini@redhat.com>
In-Reply-To: <20220215093223.110827-16-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 10:42:03 +0100
Message-ID: <CAFEAcA-4iU0PHR3hqqTYqr730ADVZEvsW8xONjDTEna+YKNNeg@mail.gmail.com>
Subject: Re: [PULL 15/30] configure, meson: move some default-disabled options
 to meson_options.txt
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 15 Feb 2022 at 09:53, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> These do not depend on --with-default-features, so they become
> booleans in meson too.

Hi; I've just noticed what looks like an unintentional
change in this commit. The subject says it's dealing
with "default-disabled options"...

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/configure b/configure
> index 1a15e2325e..5a4a642846 100755

> @@ -311,13 +309,11 @@ modules="no"
>  module_upgrades="no"
>  prefix="/usr/local"
>  qemu_suffix="qemu"
> -profiler="no"
>  softmmu="yes"
>  linux_user=""
>  bsd_user=""
>  pkgversion=""
>  pie=""
> -qom_cast_debug="yes"

...but qom_cast_debug is not default-disabled, it's default-enabled...

>  trace_backends="log"
>  trace_file="trace"
>  opengl="$default_feature"

> diff --git a/meson_options.txt b/meson_options.txt
> index 3bfaa77805..781e4d5170 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -242,3 +242,15 @@ option('qed', type: 'feature', value: 'auto',
>         description: 'qed image format support')
>  option('parallels', type: 'feature', value: 'auto',
>         description: 'parallels image format support')
> +option('block_drv_whitelist_in_tools', type: 'boolean', value: false,
> +       description: 'use block whitelist also in tools instead of only QEMU')
> +option('rng_none', type: 'boolean', value: false,
> +       description: 'dummy RNG, avoid using /dev/(u)random and getrandom()')
> +option('debug_mutex', type: 'boolean', value: false,
> +       description: 'mutex debugging support')
> +option('qom_cast_debug', type: 'boolean', value: false,
> +       description: 'cast debugging support')

...and so here we've accidentally inverted the default
so we aren't doing the QOM casting checks any more.

Spotted while looking at https://gitlab.com/qemu-project/qemu/-/issues/1586
where RedHat downstream found this because they happen to configure
with the option explicitly enabled.

I think we should fix the default back to what it was, but that
seems a bit risky for 8.0 at this point.

thanks
-- PMM

