Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18D3B7246
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:48:20 +0200 (CEST)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDA2-0002BJ-Ms
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyD8D-0000l5-Pq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:46:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyD87-000821-8K
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:46:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id l24so6854276ejq.11
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1iBe7lXnuXl8c2aeWGRpREOxyq7Ec8Gc3SDaWc9PqsI=;
 b=wau3Ifkh9Qnw43khHResJ2jkq9ALyJYcd6I0s36ZijFS8L9ZY6qkXyE3ebuiL78QpT
 R2zdpFeHOtAA/UiD6YhFA1AXoWKbNLeAIG5XRdv2E3p5EoThUtZbRcLazy4G3qRVm1JE
 5slibOfRZiZb9obUR0WBEcnJ9M4mBFgPKYGn6lsB37ncnX+Bq98lhVrzWX83kzIYh+sG
 j+jkp9Q+WwDl4c9b7puIEASDV+MEkqXy95fE+d09XQ9QtOR7+RhPN7kksDorCUkqNxnP
 q30MvNAgH3FeTKw6k4wtbAtyFP8KuVWAQVzr6UlZiSlbbAOtjE4cTGDgOjbFsiVBVve6
 nLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1iBe7lXnuXl8c2aeWGRpREOxyq7Ec8Gc3SDaWc9PqsI=;
 b=D2rTk6BMs//OLvT6of8SqPH+4gl7asJ+4dr/pS4fCxRZKhZ1aOKnwcUal8nqi/DWM9
 WKh6JhCWCJ4g6pRwBJuubpamLOlss7VliZAk8lPFTftWPKe7XwPj18eC+bcjlsyZVQxG
 yi1kgmA2BtKJ5m0Qau8jlHx+/T3jBtTj3clVgVznkqqAiQHM2fnZJAWXunNGfXtBYsGB
 DZKrGRfzr55LI0uy1v9053vqo0/gNhMwzuNJC58ceUljdlC3bZKUI01acNb7X+PlnL0U
 5mkSlZxCjBrLf/JAIdmeqBQKgsQ4UwTeo6ifK0WSwajw2Fm3hIcNVMq7FsCtussc1DGU
 93mw==
X-Gm-Message-State: AOAM530Zl8pGFy2FvXCDdwZeIvboD9CXWG1bsf4U6Yx9m5VDNFgyZSxY
 XxLyV297lVtCjqWDsy1xBHB/hk4gaCCR30vDx7y/jw==
X-Google-Smtp-Source: ABdhPJw/14FlC3Am8qwndF83hDPl5l+lqtyAqwe+C3DPVqwVhFfL7OClf3M6DN1fRvSJnNqAfzgdPazsiUplG24Dftk=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr30336901ejb.56.1624970777435; 
 Tue, 29 Jun 2021 05:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210306105419.110503-1-pbonzini@redhat.com>
 <20210306105419.110503-13-pbonzini@redhat.com>
In-Reply-To: <20210306105419.110503-13-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 13:45:40 +0100
Message-ID: <CAFEAcA8r_CUKZxfv5A+yQ06aZkoV-K_tZBBUgo_S_swPx13szQ@mail.gmail.com>
Subject: Re: [PULL 12/23] qemu-config: add error propagation to
 qemu_config_parse
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Mar 2021 at 10:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This enables some simplification of vl.c via error_fatal, and improves
> error messages.  Before:
>
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: error reading file
>   qemu-system-x86_64: -readconfig .: read config .: Invalid argument
>   $ /usr/libexec/qemu-kvm -readconfig foo
>   qemu-kvm: -readconfig foo: read config foo: No such file or directory
>
> After:
>
>   $ ./qemu-system-x86_64 -readconfig .
>   qemu-system-x86_64: -readconfig .: Cannot read config file: Is a direct=
ory
>   $ ./qemu-system-x86_64 -readconfig foo
>   qemu-system-x86_64: -readconfig foo: Could not open 'foo': No such file=
 or directory
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20210226170816.231173-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; Coverity complains (CID 1457456) about a resource leak here:


>  /* Returns number of config groups on success, -errno on error */
> -int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
> +int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,=
 Error **errp)
>  {
>      char line[1024], group[64], id[64], arg[64], value[1024];
>      Location loc;
> @@ -375,7 +375,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
 const char *fname)
>              /* group with id */
>              list =3D find_list(lists, group, &local_err);
>              if (local_err) {
> -                error_report_err(local_err);
> +                error_propagate(errp, local_err);
>                  goto out;
>              }
>              opts =3D qemu_opts_create(list, id, 1, NULL);
> @@ -386,7 +386,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists,=
 const char *fname)
>              /* group without id */
>              list =3D find_list(lists, group, &local_err);
>              if (local_err) {
> -                error_report_err(local_err);
> +                error_propagate(errp, local_err);
>                  goto out;
>              }
>              opts =3D qemu_opts_create(list, NULL, 0, &error_abort);
> @@ -398,21 +398,21 @@ int qemu_config_parse(FILE *fp, QemuOptsList **list=
s, const char *fname)
>              sscanf(line, " %63s =3D \"\"", arg) =3D=3D 1) {
>              /* arg =3D value */
>              if (opts =3D=3D NULL) {
> -                error_report("no group defined");
> +                error_setg(errp, "no group defined");
>                  goto out;
>              }
> -            if (!qemu_opt_set(opts, arg, value, &local_err)) {
> -                error_report_err(local_err);
> +            if (!qemu_opt_set(opts, arg, value, errp)) {
>                  goto out;
>              }
>              continue;
>          }
> -        error_report("parse error");
> +        error_setg(errp, "parse error");
>          goto out;
>      }
>      if (ferror(fp)) {
> -        error_report("error reading file");
> -        goto out;
> +        loc_pop(&loc);
> +        error_setg_errno(errp, errno, "Cannot read config file");

Here we no longer 'goto out' and therefore we don't qobject_unref(qdict)
in this error path.

> +        return res;
>      }
>      res =3D count;
>  out:

thanks
-- PMM

