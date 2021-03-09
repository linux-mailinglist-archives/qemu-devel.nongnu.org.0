Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5233229A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:09:31 +0100 (CET)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZIw-0000HZ-Oc
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZI2-0008I3-FP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:08:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZI0-0001ok-Nq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:08:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id b7so19018522edz.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OctfkJJ2DqGILCOuDl2zxuSX3e2qFwLuRZXoGiFXnik=;
 b=YnsVH/xsFq1EswVWCCXKDwKkTpR/8tPYfdT3iggnBDs2rRfMDyPk2Sczq1abfpspdR
 P0Ev9ejZjBjptKMvYu4ivQaesOK7bJF3BRUEpFn3Md9mqGD+GrjzMG+Bm4+ZQOGIoVWe
 PlbyDmkprQ+FCjOMAMdCqvylG0LzM92LYQuzUW2LJoDmUOKiUkmQMMX8CCa9XtH8mP2/
 O8shCPKcCIJy/CzMCI1s1mDqPF6zv6wu6Bnv54a5b6o2ucjbiQDZsaEis5ReLELOJT24
 aSTrdbCEkkdhJ+mZBQtO5oiaoaUsdjPn/mrffROKx7gjQuKWg6JmBQqD2rxzGfrSPUNH
 rFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OctfkJJ2DqGILCOuDl2zxuSX3e2qFwLuRZXoGiFXnik=;
 b=dejeylmq5IskBQ509bx3ndMjY68gYB8z9xQHZ4S3GnHjq2PZf5iT2hlxT/2+glwNVB
 0T37nPXb12ighjV9cB025CindnC4punKFNg71P10f7j5r98a+KOQhjJ4t/fA1K4QtKaE
 huPyjOlN8zi37+D6KP/KJL3VSCAYPVaxHBY6WKzkgcKD2SLIG8A83f7CqyHLqGUUK1+i
 TUswzGrWMB88RibrfCEc2rpWIGGctnwsRcH+GxMkwESAOIguFuOtkfZwKdVlrzFKX71U
 enIm5QxVKKd+tfqrR53Z9ZfehidpwfDGXpMhUz10uSYAfsVROeMe4+c+j0M+jx+4v3Bk
 VMjQ==
X-Gm-Message-State: AOAM53388BygywcX4CiM8ucvUuovz7to6Ktw0aQBivi8XOh+jisbKGyd
 5+ZRyQEM+fuW8dmAA9Tbv1AAbQ04XU3hcHD21U3X3Q==
X-Google-Smtp-Source: ABdhPJz8ZFmWWLzdHpPQxRd5k7IHIbpio2MIqGFHI8vCkeZUc39j2lsBkdVsDWo0WCZaGWY9R1seA6QK+K8Jpu/cWSw=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr3120984edt.36.1615284511058; 
 Tue, 09 Mar 2021 02:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
In-Reply-To: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 10:08:14 +0000
Message-ID: <CAFEAcA-x=FPqFMi7=RkPj4sU7nPgqZCnRf4x7k5_e2AcryGJ+A@mail.gmail.com>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 20:14, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> This allows plugins to query for full virtual-to-physical address
> translation for a given `qemu_plugin_hwaddr` and stops exposing the
> offset within the device itself. As this change breaks the API,
> QEMU_PLUGIN_VERSION is incremented.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---


> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index c66507fe8f..2252ecf2f0 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
>
>  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>
> -#define QEMU_PLUGIN_VERSION 0
> +#define QEMU_PLUGIN_VERSION 1
>
>  typedef struct {
>      /* string describing architecture */
> @@ -328,7 +328,7 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
>   * offset will be into the appropriate block of RAM.
>   */
>  bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
> -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
> +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);


This should have a documentation comment, since this is the public-facing API.

Also, physical addresses aren't uniquely identifying, they're only valid
in the context of a particular address space (think TrustZone, for instance),
so the plugin-facing API should probably have some concept of how it
distinguishes "this is an access for Secure 0x4000" from "this is an
access for Non-Secure 0x4000".

thanks
-- PMM

