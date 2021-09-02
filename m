Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA33FEE33
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:58:46 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmIn-0006ZY-LN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mLm3f-0008CG-Ku
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:43:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mLm3d-0006FL-OI
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:43:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id i6so2714040wrv.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LYkd/eN2r8RwFHh7TAqjUQEYryOrVA9FequQ9kQs3P0=;
 b=xSOEAMtzUTN6aQOhIfizwt1hzwo5SOTpqeTrhJQmYLWnUvd/zOq7uLtiLeGB4oMLbE
 PGaKQ1DzyU9bLs4k5h4lb0Ks/JjOJwL0/J4v+UD3LrOqEtu3zTBIbjEjACP7dZjnWoPh
 uVpGqKkNN0oBEocs286UKTd4+9FhlK9vcPbJqIML47deHEcdMK+ejqCiUiaqbA9XdO/T
 VY3+az95PxsCCgNkLiERy9SV2y+DL7mOcymQ55PoSQmH+EKBblpI/3M2xfiW5Mdvgydl
 /75UxiqudWVEqYs4G7HKQrlyo7d6M75bq0cei2cDA+i1lcVx1XkCxcpJHLSWDpHm1/8l
 HIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LYkd/eN2r8RwFHh7TAqjUQEYryOrVA9FequQ9kQs3P0=;
 b=f4K37MraKipMhL0fOFP6h1jpwWxbUZyfsckLhUo/5c3MrfD1wYmDEMJUdlsdHNhMWA
 IhrFAw4OEiOOAVuffMYT2/IMHUDbpbeK+JXTTqLoF7h2XFbWtapVSbaHPFDxA5XIBftV
 rp5ys+gxP0TN8DNNJWRsfJo50D+3C7DGe3kD5FMqmKHWfiI+JWBoodJhoWgJTAKWPARF
 kzZdPV140hzRCDhfnFDP6tHmJhxTXExRgntkrgZOr9R93cseNItJkInvYU7EO8OwHhE5
 WTTuQxrsUyqpgiLhbJUpfDn3EQCgqEWQBow5zngKRJ0NGLxBZAe7xQc96FbFgpVhYakF
 jvlA==
X-Gm-Message-State: AOAM533rFbdaPkaU6+6IfQGx8GiqdeidMRKrbzXaUysB72U96/cuC2gX
 HmtJJMx3S1HX10HGps43OWfZpA==
X-Google-Smtp-Source: ABdhPJxWpx9eH5bzZccutiskbe3ovAPnomWX7zf+0j1hXpqt1M+dTujYnQs0CSnDrIM36JxJZba8eQ==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr3498496wrc.158.1630586581641; 
 Thu, 02 Sep 2021 05:43:01 -0700 (PDT)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id o8sm1440424wmp.42.2021.09.02.05.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 05:43:01 -0700 (PDT)
Date: Thu, 2 Sep 2021 13:42:58 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210902124258.mqjhx7lqqvkczf6a@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Thu, Aug 19, 2021 at 14:27:19 +0100, Peter Maydell wrote:
> On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > Included creation of ITS as part of SBSA platform GIC
> > initialization.
> >
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/arm/sbsa-ref.c | 79 ++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 4 deletions(-)
> >
> 
> > +static char *sbsa_get_version(Object *obj, Error **errp)
> > +{
> > +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> > +
> > +    switch (sms->version) {
> > +    case SBSA_DEFAULT:
> > +        return g_strdup("default");
> > +    case SBSA_ITS:
> > +        return g_strdup("sbsaits");
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +}
> > +
> > +static void sbsa_set_version(Object *obj, const char *value, Error **errp)
> > +{
> > +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> > +
> > +    if (!strcmp(value, "sbsaits")) {
> > +        sms->version = SBSA_ITS;
> > +    } else if (!strcmp(value, "default")) {
> > +        sms->version = SBSA_DEFAULT;
> > +    } else {
> > +        error_setg(errp, "Invalid version value");
> > +        error_append_hint(errp, "Valid values are default, sbsaits.\n");
> > +    }
> > +}
> >
> >  static void sbsa_ref_instance_init(Object *obj)
> >  {
> >      SBSAMachineState *sms = SBSA_MACHINE(obj);
> >
> > +    sms->version = SBSA_ITS;
> >      sbsa_flash_create(sms);
> >  }
> >
> > @@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
> >      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
> >      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
> >      mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
> > +
> > +    object_class_property_add_str(oc, "version", sbsa_get_version,
> > +                                  sbsa_set_version);
> > +    object_class_property_set_description(oc, "version",
> > +                                          "Set the Version type. "
> > +                                          "Valid values are default & sbsaits");
> 
> This doesn't look right; where has it come from ?
> 
> If you want a command line switch to let the user say whether the
> ITS should be present or not, you should use the same thing the
> virt board does, which is a bool property "its".
> 
> If you want the sbsa-ref board to become a proper "versioned machine
> type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
> board exactly as QEMU 6.1 supplied it, that looks completely different
> (and is a heavy back-compatibility burden, so needs discussion about
> whether now is the right time to do it), and probably is better not
> tangled up with this patchseries.

Hmm. I mean, you're absolutely right about the complexity and need for
discussion. My concern is that we cannot insert the ITS block in the
memory map where it would be in an ARM GIC implementation without
changing the memory map (pushing the redistributor further down).

It is also true that simply versioning sbsa-ref does not mean we end
up with a properly aligned with ARM IP register frame layout. Some
additional logic is required for that.

If we assume that we don't want to further complicate this set by
adding the additional logic *now*, I see three options:
- Implement memory map versioning for sbsa-ref for this set, placing
  the ITS (if enabled) directly after the DIST for sbsa-ref-6.2.
- In this set, place the ITS frames in a different location relative
  to the REDIST frames than it will end up once the further logic is
  implemented.
- Drop the sbsa-ref ITS support from this set, and bring it in with
  the set implementing the additional logic.

Typing that, I'm getting the feeling that if I was the maintainer,
the third option would be my preference...

/
    Leif

