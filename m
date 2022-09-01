Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C35A9AFC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:56:57 +0200 (CEST)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlcl-0006mi-Re
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlZq-0001LH-BN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:53:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlZo-00028M-IO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:53:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c7so16049497wrp.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=nu7sumbqAfqzuOt6q1DBECNPK61XEbxkKFUKshcSeI8=;
 b=r6E0dofJyWlq2h9wKfSnN16jIZVYzRapWfgBy1QQStBI2+fogDzjbxdyWA4m9Ikpzv
 weNQc9Y10j4cilndm0X6HnUAnYK0Hsg2qwlcNveWvT4H5QOClorbPr/1aINS+oiYv8Ut
 I5gAFKjKtnMx4h4OQA9Xu0LCXMR/5RF2dgz7PVTkHg0ko++XHu5oRIfryQ8Sf6CkITlK
 yLP/488GnNn4wdf9+aNU9n3ynzMwMp3EwHx0YSaxoz9V3sIyCavXihlT74HZVAuWGDi5
 6EFKZhhZGOGEDHyq+vaukYBS4XbZtdPng2eqqxceZyirShJ0yYDDOHugsrF8AdXN8R5c
 5pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=nu7sumbqAfqzuOt6q1DBECNPK61XEbxkKFUKshcSeI8=;
 b=UuQaZp5mb3byrWok9rM9rQf2+XB+7SZcMfiR9jr/ZK1ywBNVOMELsUMpPFDjI0lah9
 RcvclfKpsdJPjpU35gZYHlBL5OoLntvzTXxJCdIEyhXrw48cUyCa9pFBMogdM5YiHLms
 jq+aMjwADpfydCWEYIh+3PhIjsbfIt9kL/dJdQzmzWAGoL3F7Hx0U1CLaJuYpWYQT7eB
 6/N667j12SbLyhv+MTDtcVJowVI1j1+DchHbycY9CrE8vmaxPQA/eX/1wnijs7E8n/yo
 19Oud7LnLOB9QGsZ+5QjoTmTH9WsaG/B1jGZOkdCGNSd+rx2QZX8wZ6VUwTluDdERat6
 fexw==
X-Gm-Message-State: ACgBeo0fZHTGHFa6yQHF9juSf5/T4/ic7bpcr08FKIkMx5VZUv8KotoY
 ZbCTYuvx7MUQ1dhETZQ3i8o69A==
X-Google-Smtp-Source: AA6agR4M1uDHMIZZ4MsSshoKUD24aiGWi/U7HWCiNOQ33Kmi/PKM5CA8Kh5hRMhDx4wMTb6NJJrkPQ==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr14054806wrb.149.1662044029795; 
 Thu, 01 Sep 2022 07:53:49 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 i16-20020adffc10000000b002253af82fa7sm18032231wrr.9.2022.09.01.07.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:53:49 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:53:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI
 node
Message-ID: <YxDHev0qezcjSvxE@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-3-jean-philippe@linaro.org>
 <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 08:33:54PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate warns that an implementation compatible with arm,psci-1.0
> > shouldn't have arm,psci in their compatible string.
> >
> >   psci: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
> >   From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/boot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..527918227e 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
> >              const char comp[] = "arm,psci-0.2\0arm,psci";
> >              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> >          } else {
> > -            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
> > +            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
> >              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> >          }
> 
> This doesn't look right.
> Documentation/devicetree/bindings/arm/psci.yaml says
> "arm,psci-1.0" means "complies to PSCI 1.0",
> "arm,psci-0.2" means "complies to PSCI 0.2",
> and "arm,psci" means "complies to pre-0.2 PSCI"
> 
> If you want to drop "arm,psci" then you should be arguing why
> we're not compliant with pre-0.2 PSCI. Maybe we aren't and we
> shouldn't be advertising it, but you need more rationale than
> "dt-validate complained".

Yes I agree, and that's my mistake. Rob already relaxed the bindings
https://lore.kernel.org/all/20220803201639.2552581-1-robh@kernel.org/
but that's queued for v6.1 and I was validating against mainline.
I'll drop the patch

Thanks,
Jean

