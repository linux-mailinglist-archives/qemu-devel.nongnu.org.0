Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19794461655
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:27:36 +0100 (CET)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrggw-0001h2-CT
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgc0-0005nG-S9
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:22:33 -0500
Received: from [2a00:1450:4864:20::42d] (port=38755
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgby-0006MY-7z
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:22:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q3so13913344wru.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFyULRHpYd0FmPcXLPQ/nW2Rj2+83bM1gAMptq4u+6E=;
 b=hJPTdMgnDgJ4PjKbRNZpHX5HpKEjNfCLdjCAOVehQkPI8XrWhMV44LE1KMm2JRKOHr
 DZVN6fpfdlSnRPsJhvzf4iO4+4Qf4NRT/o1GbfPWn6oFqEUzNN5r+UgMi8GQCp5deqLy
 4ASBOEGQrfdSIrRhGWiF6RF0PleboPVwzagf1Hd4NyKbcj10Er08geKQccdYLBpU7R8L
 S5aPSC6nDbr3nFvKPIZccqyiFU1aKJOtA+CzZJysbfYphmFeOMT+dV0Y2Gdi4pfjwgBN
 rsBdNWlBxHd2/OGCv5OvgkQvh4vXB92zXxXPdR2JfoerfDMpBTo1pO/pD2EptzfwkcKk
 E0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFyULRHpYd0FmPcXLPQ/nW2Rj2+83bM1gAMptq4u+6E=;
 b=FeHIlcbk4d+SZvwaUcTkRsSS8nXSt3Mgbxx8EJzgbmWhnX+vfwq/80dlv+E+Dq1Gs5
 atEnZQ0vSykhXXcdjI8Dl/euxtPqeaIELcTMahT7ZuIeuJU+iKfHQdHlmPdUDSM7Dy8r
 4tus0oCyjEiF3Iu96n2OKZoraPhW3j4USQGWbz6dx6Plr5QUyK/ihGUMkqHfYbPjGqfl
 g4BWzgyr+3jHM4qKaf4zMXWfJPLFc3dcfH8NEQUx80/1A+IaHbPfpCVRG1hJTssP9DRQ
 T3p9Y1AIFqLL4JBJnzDgx4Qsd1T1UO/K4pxMij1GwXOvfpXLqN1Q9JliEAbrprylMq/5
 +9Mg==
X-Gm-Message-State: AOAM531zzim5VrJA0WvWJa8uqbPljTHY1IDw+gjV4cx5kTZ+Zwu+TqHL
 23b4ULhE+Ciec8eSLCErtcrJ6NAKFrCz11+vJXUrEg==
X-Google-Smtp-Source: ABdhPJziZI4vCbx/v0UohAoZa3TrjubTqLdjnR4MRKgrXPNhyi1Nm4JNkiOmXMrt9VJgCOdOcQx+Gfs6foYxgZ6nGWU=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr34955403wrp.4.1638192144888; 
 Mon, 29 Nov 2021 05:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-6-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-6-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:22:13 +0000
Message-ID: <CAFEAcA9ueuFJUvSTT9B8YYwCe22Ue7vMFQ8Dp3UoFwLQSC5FRA@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] hw/arm/imx25_pdk: Replace drive_get_next() by
 drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
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
> Machine "imx25-pdk" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

