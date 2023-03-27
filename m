Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F36CAFE8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 22:25:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgtNb-0006oi-3m; Mon, 27 Mar 2023 16:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgtNY-0006ns-13; Mon, 27 Mar 2023 16:23:44 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgtNV-0004MJ-Mm; Mon, 27 Mar 2023 16:23:43 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 w13-20020a4aca0d000000b0053b8aa32089so1548395ooq.5; 
 Mon, 27 Mar 2023 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679948619;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ceBNBWo3Kh8hBs07kySAHpg67nlVz3ykdzXKAnkLwvM=;
 b=CNtrQejTzXNB1VFbtLO4Xlkh0L19tJvuxeVH5PRtwOTlsOXqeGUWTsXXqE4AHxBIsp
 VS1xRhhZuLWN8Dp+8E/lb97K3V2R7OFlWMTWyEGZSHl6TTWpH4zKzUGtrJ2/JdalrZ+m
 1+kkGlHAAqk2WpPpLxAodpH15o/Aq8+4kYdKtk/LD6JH/3y7qZ8syGCbRR/X2BYudeDP
 2JZx7JhDtaVRLR+yJDboM0ADzW9Pniq5mwQlW8Izg73XHBOjZ3iPDss7srlYtYxgoiba
 W691VrsDEjgIgWDu/KgwJ4BwTjEXNRwdqzfbKkWwWpKVA8fIyd9WWkbjhUZNq1/arUws
 4tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679948619;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ceBNBWo3Kh8hBs07kySAHpg67nlVz3ykdzXKAnkLwvM=;
 b=lJN7fj/hWgz+IoKocHognGMoX6Wzklf554XvnTIIULVjnh/u4qN1wf3nkUEa+2v2fh
 Dm6WncdokFjXdBPbB1HtmAol5LPPXTHG/pfpFxK3KZUQIg6IWdmcfekyyxfyVh4LAWkC
 l6eW80WJJVl8j6YcWuiwaoLUZM0lz/NUuaCwmuckW9vsDg44bbg/rhx3usQYLmN4ZJ9f
 bPtFUUntbroDryixUC2V8H128I8k9Y7wWpb6698XeFUF9CpT5+vV0s0OG9Q91PdjXFCk
 atOhWUO+wKd/KkB/prYVLfnVvXwnxM2luAaCwSDrFKf/ODY5rgCSrn8Ai8yNxMybU8yd
 Bwgw==
X-Gm-Message-State: AO0yUKWZaMD1YjfdHKRHaqemjWUnVuK93I57xcIrdcR6iHtgoizx/nog
 HcloDsPeTbQEKE5y9XGw1w==
X-Google-Smtp-Source: AK7set/RZJqR50f1g3XevKWfWqC8jLHIeQ1cyv2SnBpz/MqWBLvU4T590RoMMp8jcT4rb4IXLWIuzg==
X-Received: by 2002:a4a:558b:0:b0:525:42c7:9a5f with SMTP id
 e133-20020a4a558b000000b0052542c79a5fmr8225033oob.6.1679948619433; 
 Mon, 27 Mar 2023 13:23:39 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 p45-20020a4a95f0000000b0051fdb2cba97sm11797804ooi.7.2023.03.27.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:23:38 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7fea:b4f3:8d6d:64ca])
 by serve.minyard.net (Postfix) with ESMTPSA id E5CD7180044;
 Mon, 27 Mar 2023 20:23:37 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:23:36 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, hskinnemoen@google.com, titusr@google.com,
 peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
Message-ID: <ZCH7SHWzZrB92sva@minyard.net>
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
 <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
 <CAGcCb13gHDdO=hqo_UztH1=BOZVMbXNYKNKcdVEZmqT8gBuBmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGcCb13gHDdO=hqo_UztH1=BOZVMbXNYKNKcdVEZmqT8gBuBmg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 27, 2023 at 10:11:50AM -0700, Hao Wu wrote:
> Hi, Cedric
> 
> The naming scheme is suggested by Corey in a previous review:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02691.html
> 
> I originally kept "IpmIBmc" for the host side code talking to BMC but it
> might also cause confusion as well. I'm not sure which name is the best
> here. Maybe Corey can shed some light on this one? Thank you!

I agree with Cédric here, Bmc and BmcClient sound more clear than what I
proposed earlier.

-corey

> 
> Best Regards,
> 
> On Mon, Mar 27, 2023 at 5:34 AM Cédric Le Goater <clg@kaod.org> wrote:
> 
> > Hello Hao,
> >
> > On 3/25/23 00:09, Hao Wu wrote:
> > > This patch refactors the IPMI interface so that it can be used by both
> > > the BMC side and core-side simulation.
> > >
> > > Detail changes:
> > > (1) Split IPMIInterface into IPMIInterfaceHost (for host side
> > >      simulation) and IPMIInterfaceClient (for BMC side simulation).
> > > (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
> > >      Core side.
> > > (3) Add a new class IPMICore. This class represents a simulator/external
> > >      connection for both BMC and Core side emulation.
> > > (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
> > >      simulation.
> > > (5) Add a new type IPMIBmcClient representing BMC side simulation.
> > > (6) Appy the changes to  the entire IPMI library.
> >
> > 'IPMIBmcHost' is a BMC object model (internal or external) and
> > 'IPMIBmcClient' is a host object model ?
> >
> > [ ... ]
> >
> > > @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
> > >    * Instantiate the machine BMC. PowerNV uses the QEMU internal
> > >    * simulator but it could also be external.
> > >    */
> > > -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> > > +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
> > >   {
> > >       Object *obj;
> > >
> > >       obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
> > >       qdev_realize(DEVICE(obj), NULL, &error_fatal);
> > > -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> > > +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
> > >
> > > -    return IPMI_BMC(obj);
> > > +    return IPMI_BMC_HOST(obj);
> >
> > QEMU PowerNV machines model the host side of OpenPOWER systems which
> > have an Aspeed SoC based BMC for management. The routine above creates
> > an Aspeed *BMC* object model for the PowerNV *host* machine. I find
> > 'IPMIBmcHost' confusing. It shouldn't have a 'Host' suffix I think.
> >
> > 'IPMIBmcClient' sounds ok, or 'IPMIBmcPeer' maybe.
> >
> > Thanks,
> >
> > C.
> >
> >

