Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77653461662
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:28:11 +0100 (CET)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrghW-0002ci-IV
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:28:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgbo-0005ZZ-NM
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:22:16 -0500
Received: from [2a00:1450:4864:20::334] (port=52828
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgbh-0006HY-No
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:22:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id o29so14588220wms.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+OaQc4EFLLIk4Ngs96CA869eSl0gwol9QOp0Hx7KIk=;
 b=vKkkd3wbaM+BDiecJiwAOybhIzapHCnpfVDBjvXgS0j+YoIzqDiV8fa6iw8godHF6S
 KZb/BGk3FIMpIeY2DHIgt3YnkH9mDMvHzYupSsdWimX7AxolQtaILz33VzhibNpxyFy4
 rqVEZf+GjXxgdHmpbZeExjpHQ+JMuCD77y5GyZumWE2K9faEFgC9ImfixwSRLqT9uNp8
 +aw6xAEdhF1wtMK2hXtDsYLaEdaWm9078PjCtJUlx3CS8hSKXzJLdgwF9fKKU35r8FJq
 bY8PjbtYvTlYz9BE3GmkfTNmCA6kA3bMM8LlIuusenYO6OFLhO0Z9Bq+HIZhkFriWTbx
 92Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+OaQc4EFLLIk4Ngs96CA869eSl0gwol9QOp0Hx7KIk=;
 b=EtlbOlHUc/+1FrpE9pLefD78oMYbVC/Wk+/th1G/0jEsLIp7Yrrje6+Z+IFibSWZjf
 XITD8yRTSPOleTVWxN5vXZ5gDVW4zfC2PPC8D1WFdjOX63ATrdr422Gc0UCHpbYbziBC
 MH4h8VUSdcyiWXlTiIw59Vor3csvmTfLOmqStUQBngsyVBuH/I5FH36TlQK1YBc3C7vT
 F7ha+NgHk+AJE1OFz3ZHMjsd6MiV6lhA5r5R+y315DBeSL5bo03GN1V7Lhvv3O/ndSIN
 ZBV5d9jISKhw0vaxKqKe+RzkjE9EafgMANocFHPtj7mIZpwI/iLmBea4DXs1NDQCut0L
 og+Q==
X-Gm-Message-State: AOAM5311xHVT5CpX2wYui5rMQ8qBwcfDH0hX/UfdP3Tpxs/1+i4aK5ZT
 MefTLuM5LVS8rEKKRxoZXGaos/9D3dhnx5tTo+YN/Q==
X-Google-Smtp-Source: ABdhPJz0Rm4uSs/gmxun6xczooNZRFMvc6L9kXwWrck64GAnXt6qIwVFOeM7AK/MVScLBw1X2lXh2PMu3DijPZTsbbM=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr36488673wmg.37.1638192122850; 
 Mon, 29 Nov 2021 05:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-5-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-5-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:21:51 +0000
Message-ID: <CAFEAcA9d+pLFmrQa-kMUpCEEmdi99NzN4AjFgM6oU3-w4TniQA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] hw/arm/versatilepb hw/arm/vexpress: Replace
 drive_get_next() by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> The versatile and vexpress machines ("versatileab", "versatilepb",
> "vexpress-a9", "vexpress-a15") connect just one or two backends of a
> type with drive_get_next().  Change them to use drive_get() directly.
> This makes the unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

