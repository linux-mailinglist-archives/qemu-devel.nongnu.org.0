Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E137F5C5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:43:31 +0200 (CEST)
Received: from localhost ([::1]:35366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8oU-0003FF-Kf
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8jm-00054z-LE
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:38:38 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8ji-0005qC-Ux
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:38:38 -0400
Received: by mail-ej1-x630.google.com with SMTP id b25so39152386eju.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CNMyQGCf6aFt8q2U2Vqp9hHdb6Ji2+QfDcWNldclbYc=;
 b=Oo6uDTqE4RtwCQ/SIM+j6dG1EVrUvdiheT3xb093iqMGtQZZx8BvbMeqnYxEEj38pk
 oozkn7F18iFY0moJOZQsTUwffWe9I+lTE+sXcHQ3oomb3gsuLhKomfPM/PCrQrhWxu3l
 g2f+DY6I7O+DbVACOPebQH/oLdNxFPb2dp82Uts9rKq6LV9XMIxACHXZlUJmcWiJgjL3
 llrFPxgAZiipFp7t4Dekaooc6fIpdcCulnvJRRQec2h91w3PUMCK8Y5ckR8iJdMp4afs
 O/OUdMjM339P06yyIyaFS9MzAYzJB/aht/KyO6A668lupBOSCCbyHiOcq6L5+B9+J80t
 Tn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CNMyQGCf6aFt8q2U2Vqp9hHdb6Ji2+QfDcWNldclbYc=;
 b=oz9zgH0hYN/2uy9TcEj475dWzBbK+kBP40UaFuHfJp+EIyDNuaqW+rzdljODRGL8qd
 McqjrbpC8uwNSB5/y/ktxECm7hqcsbL1KqkRWQCLM8wD38JKAu3YH3kHQrKUaDIYrZVr
 Dhx/o3XfXEgIeWLHY5UU9B+GT22Wk4rt437+O9jbPyTY9wWo66hkVOkuqujCz7l4OWLq
 H8sO6+6J6NwG3AOm14MWPZVbhx6/ifd/MNK11xOyWGD1AqqBuBaFYMuxrLQmlydN6wHe
 KdIVJhYQt0h+wl17xf4Rbl5BCi8pSaH+jyqoP0hcVWkM4nl1P/7bOFFnlvH3/WMTOd5y
 c1dg==
X-Gm-Message-State: AOAM533ChOqIJ8sn0diuFNnrYnHh7yNBv14rgsj0oXMKJEtaREve464Y
 wtku1SgNhNqhqmHGNsk83KEEgMsNWyJ/1zvmUyZc0A==
X-Google-Smtp-Source: ABdhPJxjHQ2k3JcoLC/QZKg71QIBkdatXB/EN8zq1QHWIEoS+uDadHzUqmW5f3LLyMtfsYDDtWdqfhk+GnuWCm1s+r8=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr42461079ejb.382.1620902310599; 
 Thu, 13 May 2021 03:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-47-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:38:19 +0100
Message-ID: <CAFEAcA-N0nW+RxXZaaqatfdefbwP9z7Zb6gzVe66HbT70zjzNg@mail.gmail.com>
Subject: Re: [PATCH v6 46/82] target/arm: Implement SVE2 FMMLA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200422165503.13511-1-steplong@quicinc.com>
> [rth: Fix indexing in helpers, expand macro to straight functions.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 10 ++++++
>  target/arm/helper-sve.h    |  3 ++
>  target/arm/sve.decode      |  4 +++
>  target/arm/sve_helper.c    | 74 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 34 ++++++++++++++++++
>  5 files changed, 125 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

