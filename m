Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916643B72A0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:53:40 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDFC-0004Qa-QM
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDEN-0003UB-0E
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:52:47 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyDEK-0003Mb-Bn
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:52:46 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h2so31193428edt.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dJy/xFdBL7CqNBAD2xeWgwsm5f1yRcrLkwWSxy7UVVI=;
 b=TmFXtvlJOZvAwz1VKudxZC9jFEuba8t8Q94dHBKPD/Uc8L+IpDoaNo4OmI55V5D28q
 WAlCFqgYv2b8QTC7iNxwluCgzJjfcCy0VGQh/qvi6sU4Xr5/+SfROAs8ndjft7/DFBId
 R0ICsYy3VUK+5tc+4UZ6ZF0ZULWiCE1pcnB8d2eLrihilHPzvzqysWEliQEFGuhtUb98
 2jKS/t4BHymRmAnUXdNI2OyvOJ9ocCqwqLX23rO6kJF2Zv2mEeGPM8E+JiYHg8j2E/QG
 BM8Z0l94Fl/dJlQ4RHk8Qj61z7L16fDKrHEQ5CmddLDF3jW3csmrSiv1h1fbZH7fzKXn
 551A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dJy/xFdBL7CqNBAD2xeWgwsm5f1yRcrLkwWSxy7UVVI=;
 b=B5id4cXqjHDbVPCQAA6pSDvkSAO4NiLzhNETYApwaBEOC8cDFyiLD8rbQIH7NAqBS1
 aUzUixJ3wKU9dMXXW0VYOKc3WVhKgyaRFNpg+8ZCdUp/da44HWC4THlYRj8YlmDGfMel
 3VeHzs6T4qd5nxt8OtAdhXWYIFHgBmvgIgez1A52E1j5JB/IlUvI1JSAHCTrF2lzek+r
 /Fv9PzabGUy6XAwDo7iCBuysp2UciK6JWvzJdIGkrU6TSb+hiMGk8whDW0uFErsHEJjo
 nP85bdRZseThgZF6OYn+gbNY1/VCvQY9J1cFWF4yS1ImxQ9CGJwleO+tllMtQA9ly2b3
 /yyg==
X-Gm-Message-State: AOAM532+G5J7yME4PwxWwNYyICrDiZszjQ/4FowZZzdWt02FJ2Ps2bpf
 LY8d+5xDIh+0i1SZVORnQaMQ6mPEr/t4PUxSX8bZ3w==
X-Google-Smtp-Source: ABdhPJzp6/PDORHosgdxYSSxBpFEaH/Sv8fnLmIlClMT/u+lnf0rXbAWS3QCaPMI/VyWoR2B77SYXR/vHTr9hFKDyvs=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr40578791edy.146.1624971161866; 
 Tue, 29 Jun 2021 05:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210604151745.310318-1-pbonzini@redhat.com>
 <20210604151745.310318-13-pbonzini@redhat.com>
In-Reply-To: <20210604151745.310318-13-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 13:52:04 +0100
Message-ID: <CAFEAcA-TVNe-seP3MMmNtX4zYGiZ06zOKapPA9rdR4DN8e3Uqw@mail.gmail.com>
Subject: Re: [PULL 12/13] vl: plumb keyval-based options into -readconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 16:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Let -readconfig support parsing command line options into QDict or
> QemuOpts.  This will be used to add back support for objects in
> -readconfig.
>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: qemu-stable@nongnu.org
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20210524105752.3318299-3-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; Coverity suspects a resource leak in this code (CID 1457455):


> +/*
> + * Parse non-QemuOpts config file groups, pass the rest to
> + * qemu_config_do_parse.
> + */
> +static void qemu_parse_config_group(const char *group, QDict *qdict,
> +                                    void *opaque, Error **errp)
> +{
> +    QObject *crumpled;
> +    if (is_qemuopts_group(group)) {
> +        qemu_config_do_parse(group, qdict, opaque, errp);
> +        return;
> +    }
> +
> +    crumpled = qdict_crumple(qdict, errp);

It thinks qdict_crumple() allocates memory...

> +    if (!crumpled) {
> +        return;
> +    }
> +    if (qobject_type(crumpled) != QTYPE_QDICT) {
> +        assert(qobject_type(crumpled) == QTYPE_QLIST);
> +        error_setg(errp, "Lists cannot be at top level of a configuration section");

...but here we return without freeing/derefing it or keeping track
of the pointer anywhere...

> +        return;
> +    }
> +    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);

...and here it thinks that qemu_record_config_group does not free or
keep a pointer to 'crumpled', though in this case I suspect it is wrong.

More general question: where should I look to find documentation on
what functions take 'ownership' of a reference-counted object?
I often find when trying to analyse Coverity reports like these that
I am just as confused as it is about whether a function really has
taken ownership of something or whether the caller kept ownership
and needed to deref it...

thanks
-- PMM

