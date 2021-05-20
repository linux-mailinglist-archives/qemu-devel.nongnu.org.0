Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433338B04C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:46:17 +0200 (CEST)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljj0C-0006gt-Jq
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiyf-0005xD-2B
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:44:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiyZ-0006tJ-Ac
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:44:40 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so25361566ejc.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5UpEfik/almutf4QneFNxzRblrk5C2E8VQtMj4vkhU=;
 b=rKU+QX4wi/n+dE5Ri0WR5nZgy6cquV1lWk91+wYBjHeer/tt0ES0mu2sN5Sj6wizOW
 cgvjpAk7oOr/HmEuehRTIXRdQwp3qJ/SvrAEJAlNAqv3pBI/hXlanQz9orivaPY9zTXh
 oh5AAt0UyTfdntkIJzADrpV6vwCvpDy5O1+6qmdiw4LasAPjasDsv8A4cEuWybsDKRwy
 M7/PGx+ws9RBNCu7bk0BI9vXaDdpQes+TMw0DIjeL3MopncnRex6rMM2UM0Wm/oxxWfO
 6Gnrskl/4cTLHhTQKGSJFzjzSk582+ISudMpNKlbdnAf2wRjYIrmOI2okJye83Lf/Owi
 NEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5UpEfik/almutf4QneFNxzRblrk5C2E8VQtMj4vkhU=;
 b=FJu9dVGZclWylGGpXN9RwLYfrb0ejbbU/oCaOaUUHloa91qK2ONu4V0QebppeRRHDN
 wLBGemY0M0ElXmHpH7KWQ66hLovZtJpT/Jtx7SJ9vOFPp62BkkPQwurEza+2XwWHeY3a
 JyKqxI/gEB6K1BhJGh6QGUD50J+krssQ9I/UPOmf5WtsZkg0jBQDZwM3mmMqsVmhc6V9
 087PNV/k5QtIzcqnNPCorY22Sj3ne4v92kol6HCDPbYFFGXminIWETLt5b3SvEt0vYqw
 f8O7Z4wsZOuDhyI1C795yE37lafAyu7u7Wfg2Cr1eDQg/FbTA398ChtN8ITcyjYynKI/
 BOWA==
X-Gm-Message-State: AOAM530wowtZHsa4vcyE6fxfqh99BeWYl1yCoOKthBqa8JMKX60ESw6P
 GO48HIEgK4IXJg3Tn7OL+DQsVpE7CAbD0BaYgJSuIpQ4Miy3lA==
X-Google-Smtp-Source: ABdhPJxN4OCVrdMw7Vy1ZZ6FKDoApzMiIz5hWAiVOYAE2NOsev2QpN8PbpDSc+hTNn0GQj7Wg8Wwv36DQsH8z9h7M68=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr4864450ejb.56.1621518273854; 
 Thu, 20 May 2021 06:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210514164514.1057680-1-mreitz@redhat.com>
 <20210514164514.1057680-4-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-4-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:44:15 +0100
Message-ID: <CAFEAcA_MynMjOYHmYrkGigV2hF7sFEofFW2vxZuOOs-rxk1=Bg@mail.gmail.com>
Subject: Re: [PULL 03/19] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 May 2021 at 17:45, Max Reitz <mreitz@redhat.com> wrote:
>
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Hi; Coverity complains about this code (CID 1453194):

> diff --git a/qemu-io.c b/qemu-io.c
> index bf902302e9..57f07501df 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -411,6 +411,19 @@ static void prep_fetchline(void *opaque)
>      *fetchable= 1;
>  }
>
> +static int do_qemuio_command(const char *cmd)
> +{
> +    int ret;
> +    AioContext *ctx =
> +        qemuio_blk ? blk_get_aio_context(qemuio_blk) : qemu_get_aio_context();

Here we check whether qemuio_blk is NULL...

> +
> +    aio_context_acquire(ctx);
> +    ret = qemuio_command(qemuio_blk, cmd);

...but here we pass it to qemuio_command(), which assumes it must
be non-NULL (via calling command() which calls blk_is_available()).

Bug, or false positive ?

thanks
-- PMM

