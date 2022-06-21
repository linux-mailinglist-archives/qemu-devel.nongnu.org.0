Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD0553524
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:03:38 +0200 (CEST)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fPl-0004su-Lm
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fHT-0007Aw-I3
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:55:03 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fHR-0000OB-RJ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:55:03 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ef5380669cso133546097b3.9
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bhkY8kXiebZNvqcHn9b65DJsHCpLJ968VdKeVBvnYY=;
 b=igBbk82LKh+gVWoKySah59dLW+Cv0XOXWbbY2zlMPp+d3YrJKGihp1wPosJ+jgOvLg
 DKLC++v4U5/cWL9LTjiV7EaiFC+bvHdMRzAwmCyjK3b94xoI8JE7hvsDTLT1o50R1LPX
 f0qs/eBUCFhxrIQvOW4t7kGhIYdHdn4362TyWbtFz2rbTZ5pQFhcMGML5rVCBdHgu4ll
 vU1XUqwvAKJE2AHhJOIq1WYgppUkw899fbXLORh742lo1qwu7zucxFfeULGg5vajfHvi
 F1NCPezSnNVH5pPwuvZHZqXUHneuQgOhAG8cUyZXXH+WufU9nD7b7U9DXkvTDHJWbr+L
 WRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bhkY8kXiebZNvqcHn9b65DJsHCpLJ968VdKeVBvnYY=;
 b=XfT5fPF0Koy6X5Hcz13LuszEBrazQNVyn6KIzttHC+N28SgwHM7xvFO79pmsvKQeEM
 Qe+p9BRYtom7XgELJOJhIuf6mmz8aO3hnAklL8uK8n0JBauz3Q1oeqoGhow2GWuN+1xB
 l6N++4OFEAYcX4VcLyC47wvJmm08zIh74mkxoAX6tD967f/7wQfl39X8KyYz9hcqK23H
 nnEX1rn31LdLvlJX+7r4PEA7Ke0i0vG1TMb4vemZiQ9+xA1TTEUfnfbSrJN9xrFJrNo4
 7iK/ThPeSaYgAvgXoCGzNJoenlVy2d4sAh2OjGNWjyvk/nsvnMEGut38sYFnqcPpHROk
 bvOw==
X-Gm-Message-State: AJIora9UbL+nyONVtwJ1rCluSKZHGPJKWN4gWiGWMn5VG9oIrRASWNAg
 fM7KArN4bXF0wj5S6y1KPiOeXtVBe6wMrp3CALvx+A==
X-Google-Smtp-Source: AGRyM1ssIqk8tcPjbAO+WwhU2zPCh+Dk3zC59wkIhdIyWuFBxq6sj+PifLoJOx8j70/HK7GUHrodIpbqmIYvtrb37lA=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr18118372ywg.329.1655823300742; Tue, 21
 Jun 2022 07:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220422142851.28128-1-damien.hedde@greensocs.com>
 <CAFEAcA9Dy0DXshrKHLAEkGV_Zy-vRMPAhd4t+S7fSGSCPuPJ1g@mail.gmail.com>
In-Reply-To: <CAFEAcA9Dy0DXshrKHLAEkGV_Zy-vRMPAhd4t+S7fSGSCPuPJ1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 15:54:23 +0100
Message-ID: <CAFEAcA8avDj6is5hUvFJJMOed4fdqfcT3KgpG8xq7o-eV5Y0pQ@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: add doc about device life cycles
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 21 Jun 2022 at 15:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 22 Apr 2022 at 15:29, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > Document the 3 life cycles cases that can happen with devices.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>
> Firstly, sorry it's taken me two months to get to this patch.
> The underlying reason for this is that I'm not myself 100%
> certain about how the QOM/qdev device lifecycle works and what
> things should go in what lifecycle methods, so I didn't really
> feel very confident about reviewing it...
>
> To start with, I think we should definitely have some documentation
> for this, and I like the structure you have here with:
>  (1) the various ways devices are created and deleted
>  (2) what the corresponding lifecycles are in terms of which
>      methods get called
>  (3) the concrete consequences for what a device should and
>      should not do in each method
>
> I'll try to get into some more detailed review below.
>
> > diff --git a/docs/devel/device.rst b/docs/devel/device.rst
> > new file mode 100644
> > index 0000000000..80e3016e80
> > --- /dev/null
> > +++ b/docs/devel/device.rst
>
> I think we should name the file device-lifecycle.rst -- we're
> (hopefully) going to accumulate a bunch of documentation on devices
> generally and we don't want it all to end up in this one file.
>
> > @@ -0,0 +1,111 @@
> > +QEMU device life-cycle
> > +======================
> > +
> > +This document details the specifics of devices.
> > +
> > +Devices can be created in two ways: either internally by code or through a
> > +user interface:
> > +
> > ++ command line interface provides ``-device`` option
> > ++ QAPI interface provides ``device_add`` command
>
> I think this bulleted list should list all the ways that devices
> get created (and destroyed), so:
>
>  Devices can be created in several ways:
>   + programmatically, by the C code that implements board and SoC models
>   + on the command line, via the -device option
>   + via the QMP and HMP device_add monitor commands
>   + temporarily as part of the introspection of device objects
>     when the user asks for help on a device type or about what
>     properties it implements
>  In some cases, devices will also be destroyed:
>   + if a device is hot-unpluggable then after an 'unplug' it will
>     be destroyed
>   + the temporary objects created for introspection are destroyed
>     after they have been examined
>
>  To do this, devices must implement at least some of these methods
>  which are present on all QOM objects:
>   + instance_init
>   + instance_post_init
>   + unparent

...actually, do devices themselves really need to implement unparent?
If they don't we shouldn't list it here, that's confusing.

>   + instance_finalize
>  and these which are specific to devices:
>   + realize
>   + unrealize

-- PMM

