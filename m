Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554F3E4406
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:42:09 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2jQ-0001GO-5j
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD2iD-0000EH-07
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:40:53 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD2iA-0005cH-FS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:40:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id y7so23819192eda.5
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKN+ejNdGSQpWpJgM98wU2elCO0jPtUsbrzh0moYtTw=;
 b=FMjfrEMAjw5oCJHVsI2kW3YHRcRGGr8wLUxBECcg1H/bXT3xDQMsY7mEjfOcROoCvM
 SmOhLJD+/tpWK6TWoS+B7FaS0lWIkJh76MdiyNuxg7/nTwylnCILaXmKIArJtzxTamW6
 1BpZtPHDwecQpNP+nHI7qjgsR29pJNb1Tg2RqG1Hlj+FySACgRjSUf1+nzbS9HDeDSiD
 7BnUmvoRB1v5cuAFNUH/ag+eNqW596FmFOr9FH2vKjwUO6qy54mILXhBaD0RiYYtKnYS
 zNdI9R/7q8rMmpqE79eAgMCKa4m3GGEEb7paTsOKe2hhq6KuHSf2KUJiPlTGdAKzqFD9
 y1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKN+ejNdGSQpWpJgM98wU2elCO0jPtUsbrzh0moYtTw=;
 b=WP+Ui4NHmBm4YC7lGOgjoWWJwbomMw6CY7UiBzTYRNJTc2L6y6ktrOF02bvjXXAXcw
 cU3mXzq9F2XDA1HAJhgdGcrXYs5W9lGbSecMFJWFG2D6DTvam8lx+W/NlDyoQj7vC5Pc
 kHUTfQcncU7mL6yxQY6YtAZHF0QB6emMt3TG1aWkZSXYySgRA6keo/oqgZ7e8gB1Utst
 CX1Zl7MR8/LbDxXE0A6YdGdXZn5f+53dtsdb/NRzBslxtUwfVvdyzXc57GOo/Ol6LEOL
 Hw4Sweh1xZfhbG0awVzS8xsFEfrHvWC+aSpyxBHsgEyf1dNal62izWWzhZOY25onK4zc
 zF6w==
X-Gm-Message-State: AOAM532uRe+7xLnekzM5b518+doVSYwh0Hkrh+KRCL06ZH7FmXAOZHRe
 Ul5rbjzaTeibJ4lKAtcd124O2WvIDaHX6GKCevNXYQ==
X-Google-Smtp-Source: ABdhPJzDBZzq7NwjKAY5pzESAoQhAaskpbLChQ6xNzCoFsE+ybvI4fAuaeUYJ88RnMs/XPMH+Ljbf3gp12vWy+yY7SU=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr28663833edb.36.1628505648781; 
 Mon, 09 Aug 2021 03:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
 <20210724085453.16791-9-pbonzini@redhat.com>
In-Reply-To: <20210724085453.16791-9-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 11:40:04 +0100
Message-ID: <CAFEAcA9eNFoZ5p8A1hneJ7kZ=9HOSjFMxR_9C1tuMA20sFhDZw@mail.gmail.com>
Subject: Re: [PULL 8/9] qapi: introduce forwarding visitor
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 10:00, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This new adaptor visitor takes a single field of the adaptee, and exposes it
> with a different name.
>
> This will be used for QOM alias properties.  Alias targets can of course
> have a different name than the alias property itself (e.g. a machine's
> pflash0 might be an alias of a property named 'drive').  When the target's
> getter or setter invokes the visitor, it will use a different name than
> what the caller expects, and the visitor will not be able to find it
> (or will consume erroneously).
>
> The solution is for alias getters and setters to wrap the incoming
> visitor, and forward the sole field that the target is expecting while
> renaming it appropriately.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; Coverity complains here (CID 1459068) that the call to
visit_optional() is ignoring its return value (which we check
in 983 out of the other 989 callsites).

> +static void forward_field_optional(Visitor *v, const char *name, bool *present)
> +{
> +    ForwardFieldVisitor *ffv = to_ffv(v);
> +
> +    if (!forward_field_translate_name(ffv, &name, NULL)) {
> +        *present = false;
> +        return;
> +    }
> +    visit_optional(ffv->target, name, present);
> +}

Is it right, or is this its "looks like this is returning an error
indication" heuristic misfiring again ?

My guess is the latter and it's caused by a mismatch
between the prototype of visit_optional() (returns a
status both by setting *present and in its return value)
and the Visitor::optional method (returns a status only
by setting *present, return void). I guess ideally we'd
standardize on whether these things were intended to return
a value or not.

thanks
-- PMM

