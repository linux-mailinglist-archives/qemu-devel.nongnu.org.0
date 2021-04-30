Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60897370394
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:37:01 +0200 (CEST)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbkq-0000mk-Eh
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbiR-0008FK-4k
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:34:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbiK-0002y4-ET
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:34:30 -0400
Received: by mail-ej1-x633.google.com with SMTP id f24so8898855ejc.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRraqRJDa920BkW45Ic3WAZ99dkkyDBXjooHsfbM8ug=;
 b=hqNVXm1NgkOkgNmS1g3cWo6cXfmC6Fgxumj84pA2RIa/el1jkCj9fKkEZAuhe2/3VE
 zdlCApsQ6QgfjHH/pTwr9jqBrcsCPnRwZhb4NvU17AvMyOtWh06BVVAm/p7wHdOPsl1t
 IvPApmg0hFf6ph+2/zw+ggVWMYxam8W3mOTw+ySNQf30BObhGNQHeqhaQC9gvQUsgF3i
 h7NZTZCMYW8GXPqDCLcbtD9cecxZCdA5tQnfl6PCe1UQeggoayuz+jgAeOgQirZ6JyvZ
 ztpWRBM8pIF4LJSOQixniDY9Yydmov0P7RXmVcToGD52eqiUvR/mRKWDOFKd429st3I9
 Wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRraqRJDa920BkW45Ic3WAZ99dkkyDBXjooHsfbM8ug=;
 b=IUN/sSelpOJm0fNYb+Ks9K6qpRIS5B00oLalvfBUbw4+3qRg+yZqi7rOdJ6fIFZUGW
 4Xs4PjNqJhE6/ZatDene9lzrQgutLcEFoIPxRTL5bOKejMAo1gaKPGlwGZOwfejAvCc8
 sOSwHyMWi27KU7+i+my6Le7fqaQlw37G1gxjLqeQ4hF8lymrqe8S3ADjj+M1C4tZ2tCR
 TtVdE97djsa1593321/KhcCcuyW8Dzt6JzFCLrPLNUAyAWHTPKEzd34DrJSYyfYARUqt
 1iDXM3lX9rWuCok/i78k++/BWId1LvMXBfEsNVv7R03ncsoYA4dxDzEHeZXN/Q6uPo4+
 lPhA==
X-Gm-Message-State: AOAM531aPexkZlVv8qU354sCQUf5FaIV2xQfGCByyarCq/mq6JFDdxoD
 cKLwmhJ6otw8aX8o/YTROx7/nRAYxrC4HlkRtxCW2Q==
X-Google-Smtp-Source: ABdhPJzYF2xFTHPhiBRbHoEK8ez1fO10VWZolgMdcHXN3dfao1eTEQ0045/E4/KTHqVuMLwSIsNGx+rCdN4wkCu7gGg=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr6955283ejb.250.1619822055095; 
 Fri, 30 Apr 2021 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210430105147.125840-1-kwolf@redhat.com>
 <20210430105147.125840-19-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-19-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:33:12 +0100
Message-ID: <CAFEAcA8gJQsUqtrvr3X+T+CZ5NYCJcaF=9oQzy3VDFbV1jC17w@mail.gmail.com>
Subject: Re: [PULL 18/39] block: add bdrv_attach_child_common() transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 11:53, Kevin Wolf <kwolf@redhat.com> wrote:
>
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> Split out no-perm part of bdrv_root_attach_child() into separate
> transaction action. bdrv_root_attach_child() now moves to new
> permission update paradigm: first update graph relations then update
> permissions.
>
> qsd-jobs test output updated. Seems now permission update goes in
> another order. Still, the test comment say that we only want to check
> that command doesn't crash, and it's still so.
>
> Error message is a bit misleading as it looks like job was added first.
> But actually in new paradigm of graph update we can't distinguish such
> things. We should update the error message, but let's not do it now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Message-Id: <20210428151804.439460-19-vsementsov@virtuozzo.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Hi; Coverity thinks it's found a resource leak in this function
(CID 1452773):

> +/*
> + * This function steals the reference to child_bs from the caller.
> + * That reference is later dropped by bdrv_root_unref_child().
> + *
> + * On failure NULL is returned, errp is set and the reference to
> + * child_bs is also dropped.
> + *
> + * The caller must hold the AioContext lock @child_bs, but not that of @ctx
> + * (unless @child_bs is already in @ctx).
> + */
> +BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
> +                                  const char *child_name,
> +                                  const BdrvChildClass *child_class,
> +                                  BdrvChildRole child_role,
> +                                  uint64_t perm, uint64_t shared_perm,
> +                                  void *opaque, Error **errp)
> +{
> +    int ret;
> +    BdrvChild *child = NULL;
> +    Transaction *tran = tran_new();

Here we create a new Transaction...

> +
> +    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
> +                                   child_role, perm, shared_perm, opaque,
> +                                   &child, tran, errp);
> +    if (ret < 0) {
> +        bdrv_unref(child_bs);
> +        return NULL;

...but in this error-return path we don't free it.

> +    }
> +
> +    ret = bdrv_refresh_perms(child_bs, errp);
> +    tran_finalize(tran, ret);
> +
> +    bdrv_unref(child_bs);
>      return child;
>  }

thanks
-- PMM

