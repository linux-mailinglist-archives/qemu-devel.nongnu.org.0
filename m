Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA523BC209
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:07:41 +0200 (CEST)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0S4J-00040T-Oe
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0S1I-0001Bv-Ho
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:04:32 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0S1G-0001kp-WB
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:04:32 -0400
Received: by mail-qt1-x833.google.com with SMTP id w13so12675234qtc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyZ006BpTP0Cg0029ChDj40RT2X+XZOXlDQR2fqBnh8=;
 b=vJFJwUQMW6FzYiG4Sni2H0KOlLNF22xu4tG6Eq9J7ywnvY7t9tAEXKj8b/ULqnc2Ia
 cklY7VoTU7eDFglaN/n7juvxKaQe4bPPV5tHxL36DCIAVoLT27zOzRV/n9MVN0q6kkFl
 3gJ0up92kNTtdKuHqkcDDidDV9wvxMyEQA/zLkHgreMB8V/mjUb1NcyDVqqL9I3upF9G
 9/CET1QGVPtCq0pliXV11kx3b1IgIb0qpP2XysOE1fQnEbMPL2uC4MNX7l2XxdNmZ8Fn
 dguFyKKTuTNqDzumKlJNxBfaD9BQVNhKcc6Fxoor01h43Vq1VXSMaFy7if2Vrd4YI6Uu
 zN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyZ006BpTP0Cg0029ChDj40RT2X+XZOXlDQR2fqBnh8=;
 b=FFBJuPcq7OgRDXf4DpKZXBTryPuvpBmJe3HFGChHSgN4cuvNAErPU2QThHj/xTUYQq
 Ds+tenBXhNKyqxgj11E7o2G139fMyRF62S7aXXuKXxwfadAxQKfoTSTVAr7ip8gpu08M
 8utzHZ65MwNUpjn3Nst4SeVNy0z5Cbi7KBUC5jYNDVjjAoigLnraQPYQCfh3akcOhVOX
 KBlTYK/1ZWJ3W4KR65xt7Foy2PFWamAuaauQKr4YyWHrxnlVnsYyVoAmuBJVbj+tmbd3
 qRY9uvE0JmxIlix7VajWdfZD4m0KMOP1K/zrYuOA2meIBePaovw6XUkSWXgCj5wXwP/w
 toyQ==
X-Gm-Message-State: AOAM532o577qjcrHJj9XnIbTAw3vfdBzcbzIBkb+Oc1sSdiVlJwcW3NC
 a9Lgs95ICkSH6ZRFr9TbRf9Bmg==
X-Google-Smtp-Source: ABdhPJwq3jvIcCmSoAx6bq3diCKe0bnwvG7jW8c27PL6ZzHkkeEU3vXOXgzKZSour3q8KC44s/ADYQ==
X-Received: by 2002:ac8:674d:: with SMTP id n13mr10600618qtp.381.1625504669191; 
 Mon, 05 Jul 2021 10:04:29 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id x14sm3394174qta.90.2021.07.05.10.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 10:04:28 -0700 (PDT)
Message-ID: <916a2c2eb368835dbd17fe0b90be541abbebde93.camel@linaro.org>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 05 Jul 2021 13:04:27 -0400
In-Reply-To: <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
 <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-07-05 at 17:25 +0100, Peter Maydell wrote:
> On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
> > On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > > shashi.mallela@linaro.org> wrote:
> > > > Added register definitions relevant to ITS,implemented overall
> > > > ITS device framework with stubs for ITS control and translater
> > > > regions read/write,extended ITS common to handle mmio init
> > > > between
> > > > existing kvm device and newer qemu device.
> > > > 
> > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > +static void gicv3_arm_its_realize(DeviceState *dev, Error
> > > > **errp)
> > > > +{
> > > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > > +
> > > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > > &gicv3_its_translation_ops);
> > > > +
> > > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> > > 
> > > Can you remind me why we make this check, please? When would we
> > > have created an ITS device but not have a GICv3 with LPI support?
> > This check applies to GIC's physical LPI support only as against
> > GIC's
> > virtual LPI support.
> 
> Right, but when would we have a GIC with no physical LPI support
> but an ITS is present ?
If we only support Direct injection of virtual interrupts (which can
have their own vPEID and the vPE table),then the ITS present could havejust virtual LPI support 
> 
> thanks
> -- PMM


