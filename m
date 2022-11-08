Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C191D621360
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:49:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOyh-00082k-UY; Tue, 08 Nov 2022 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osOyU-00081R-H7
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osOyS-0003JO-N4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667915347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O2ZRaatWkc1iwxiiA3rEnatEUKzYJyukKIJCWyL0+hs=;
 b=PmoeExj4Jt8NqT9ogcKLboVbDB8QGL95EFigy6sghDAuG1zZLr4DXB32NO4lE8n8Ds0GR+
 or5roT6tsiZlKUfqUj0BxOobd55Pl93BdxMdkJoPdT3aQX3NFkWaXWEQ+wtn4Dz+YP5HZa
 CZo+kGgWyFbAoIVn6iuI6l6o8uwIL58=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-N9xpJG36MC6djlnY8zqpqQ-1; Tue, 08 Nov 2022 08:49:06 -0500
X-MC-Unique: N9xpJG36MC6djlnY8zqpqQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 cm12-20020a05622a250c00b003a521f66e8eso10298700qtb.17
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2ZRaatWkc1iwxiiA3rEnatEUKzYJyukKIJCWyL0+hs=;
 b=VKno9IUqKaakSNZxlMrBkPOluxguDFt4e91YoyAFc62lqoC+azHkF066xFxhRjkfxg
 w3qy9C6gb977d/rTiZu7/O8oXQafNbu6IVoKiy46lrPfuoySYE2ftJw6ejwbgCZzMikg
 g1B/Ke0QRKHRaTVJwxurj6DxUZ+tE2XMxWtY98RJdbre6B+8aap8w7IxINS21Kvp+dTR
 9n482tbXk1+jBkFsBUHb3DyMEaBKDok6/FebTS8OoakVbgQ2lKL5RpJureR0w31k47Dh
 rtSdwxnGkoJxHH/yKZCMjcmnmbP0f7arO66A6LUrbKEgvUfqQC2dXN89qCW2VikHhApI
 XHbg==
X-Gm-Message-State: ACrzQf1pcSUV65HLjKEj8KIvHbaszOrLfo5dlaMiBlswEZlhDYmOLSL/
 CHjBwA35zv7z9ofIiaIOuQp27Lzhh3jvo75MGGM+szc3xvLQQwZ17O4alXMLvRRkQ/FTLqtDMMk
 O1aaoIxpeRcN/98U=
X-Received: by 2002:a05:622a:249:b0:3a5:75a5:d038 with SMTP id
 c9-20020a05622a024900b003a575a5d038mr14100802qtx.359.1667915346134; 
 Tue, 08 Nov 2022 05:49:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6HaoCYANECMQrB/nqh5SQzfrVcU6pZA6PPMcEAGVrIKwIXXKY6wnBGf3NlGxa8Vcsv+E8fdw==
X-Received: by 2002:a05:622a:249:b0:3a5:75a5:d038 with SMTP id
 c9-20020a05622a024900b003a575a5d038mr14100783qtx.359.1667915345825; 
 Tue, 08 Nov 2022 05:49:05 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b006bb8b5b79efsm9352573qki.129.2022.11.08.05.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 05:49:05 -0800 (PST)
Date: Tue, 8 Nov 2022 08:49:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221108084835-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-46-mst@redhat.com>
 <20221108143641.4bdaae6f@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108143641.4bdaae6f@fedora>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 02:36:41PM +0100, Igor Mammedov wrote:
> On Mon, 7 Nov 2022 17:51:11 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..570b17478e 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,35 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/pc/DSDT",
> > +"tests/data/acpi/pc/DSDT.acpierst",
> > +"tests/data/acpi/pc/DSDT.acpihmat",
> > +"tests/data/acpi/pc/DSDT.bridge",
> > +"tests/data/acpi/pc/DSDT.cphp",
> > +"tests/data/acpi/pc/DSDT.dimmpxm",
> > +"tests/data/acpi/pc/DSDT.hpbridge",
> > +"tests/data/acpi/pc/DSDT.hpbrroot",
> > +"tests/data/acpi/pc/DSDT.ipmikcs",
> > +"tests/data/acpi/pc/DSDT.memhp",
> > +"tests/data/acpi/pc/DSDT.nohpet",
> > +"tests/data/acpi/pc/DSDT.numamem",
> > +"tests/data/acpi/pc/DSDT.roothp",
> > +"tests/data/acpi/q35/DSDT",
> > +"tests/data/acpi/q35/DSDT.acpierst",
> > +"tests/data/acpi/q35/DSDT.acpihmat",
> > +"tests/data/acpi/q35/DSDT.applesmc",
> > +"tests/data/acpi/q35/DSDT.bridge",
> > +"tests/data/acpi/q35/DSDT.cphp",
> > +"tests/data/acpi/q35/DSDT.cxl",
> > +"tests/data/acpi/q35/DSDT.dimmpxm",
> > +"tests/data/acpi/q35/DSDT.ipmibt",
> > +"tests/data/acpi/q35/DSDT.ipmismbus",
> > +"tests/data/acpi/q35/DSDT.ivrs",
> > +"tests/data/acpi/q35/DSDT.memhp",
> > +"tests/data/acpi/q35/DSDT.mmio64",
> > +"tests/data/acpi/q35/DSDT.multi-bridge",
> > +"tests/data/acpi/q35/DSDT.nohpet",
> > +"tests/data/acpi/q35/DSDT.numamem",
> > +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> > +"tests/data/acpi/q35/DSDT.tis.tpm12",
> > +"tests/data/acpi/q35/DSDT.tis.tpm2",
> > +"tests/data/acpi/q35/DSDT.viot",
> > +"tests/data/acpi/q35/DSDT.xapic",
> 
> still missing DSDT.count2 table, likely in other updates (as well)
> which should break bisection if not whole pull request.


That's because I reordered count2 patches to be after these.

> I'll prep a tree based on your pull req, with fixups
> for you to pull from.


