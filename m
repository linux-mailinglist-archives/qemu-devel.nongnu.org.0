Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9076216D3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 15:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osPdN-0004sW-Pa; Tue, 08 Nov 2022 09:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osPdA-0004rk-BN
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osPd8-0000Eu-54
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 09:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667917869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCUfauZwaB2evRNOHqV4AdHGDoltDtieuP7imswQuD0=;
 b=W4/Pdgk8eDbp3Z3nH2eUHNRo4cRf6Q8P/gcYoXLtOh0S9qs+BWPC0TNA4hkcd3Xd3u9OO2
 iZyk1DLHF7Lxx48mRebPaSqVDUFimgBdfpsD0/KmG6RtIXYm+PjA8PhBd4ZeO20iuWQ6uB
 npv8LamE1YIMqR2ttE/tB+05Yg2fKKc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-_iMT2NJTNL-Bys6VN2eS8A-1; Tue, 08 Nov 2022 09:31:07 -0500
X-MC-Unique: _iMT2NJTNL-Bys6VN2eS8A-1
Received: by mail-wm1-f72.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso9970571wmk.3
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 06:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCUfauZwaB2evRNOHqV4AdHGDoltDtieuP7imswQuD0=;
 b=odu4MgMwyQeKGwgNSzCcMWlHc8X5tb8T7fR0cdIAxS+24ktFjUxYOebq/zthLX3EcD
 q6y4SgVJ2IUlD1buSTap29NJV/YMhikxi9FxIlmuibP1AiifbO29Gi/jdWqNpIm9KCPH
 rlBgaYu9D+iFS0+8RhYxlsR1Tt0IHw/UaUgi0d2d6bzdwy72rsfh4LofyDa/JLdnwkO9
 jwXBhUSmEQqZWwg/4BuimcM0KIxbi/qmGUiuykSxmdsER8woC62Dvulb2v95gDILDg0X
 4e9isS5WhH4Jay5A8o7+dLPk95LQydPRZPqPJiaXGwJm5Cgu3bPz/Wtcp7ud5WRn+oP2
 yN9Q==
X-Gm-Message-State: ACrzQf2DQPjh0h3O/bhxmZWAUCzRABaYDvZqYF0cg5Lg8nkQQz3tKSQ8
 m5nTn/do0ad8J/7sOBHC0pTjjdxQOIyMn6AuYcahLL1C5MfWjTHEAAOIuOdRVZHZLnF+2gf79Y7
 n/bedyEpZk4N4IAQ=
X-Received: by 2002:a05:600c:54e9:b0:3cf:92a6:30ad with SMTP id
 jb9-20020a05600c54e900b003cf92a630admr17972632wmb.152.1667917866645; 
 Tue, 08 Nov 2022 06:31:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4V4QlS9SjQBA3nj0IY3/laOylr9ZLfkCAGj9Sb7y/sJC2Wx8Qi68VBLirEZq5SqkcF8PnfNg==
X-Received: by 2002:a05:600c:54e9:b0:3cf:92a6:30ad with SMTP id
 jb9-20020a05600c54e900b003cf92a630admr17972612wmb.152.1667917866390; 
 Tue, 08 Nov 2022 06:31:06 -0800 (PST)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003cf75213bb9sm16307503wmo.8.2022.11.08.06.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 06:31:05 -0800 (PST)
Date: Tue, 8 Nov 2022 15:31:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Ani
 Sinha <ani@anisinha.ca>
Subject: Re: [PULL v4 45/83] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
Message-ID: <20221108153105.05cfc186@fedora>
In-Reply-To: <20221108084835-mutt-send-email-mst@kernel.org>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-46-mst@redhat.com>
 <20221108143641.4bdaae6f@fedora>
 <20221108084835-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, 8 Nov 2022 08:49:01 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Nov 08, 2022 at 02:36:41PM +0100, Igor Mammedov wrote:
> > On Mon, 7 Nov 2022 17:51:11 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > From: Igor Mammedov <imammedo@redhat.com>
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > > 
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index dfb8523c8b..570b17478e 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,35 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/pc/DSDT",
> > > +"tests/data/acpi/pc/DSDT.acpierst",
> > > +"tests/data/acpi/pc/DSDT.acpihmat",
> > > +"tests/data/acpi/pc/DSDT.bridge",
> > > +"tests/data/acpi/pc/DSDT.cphp",
> > > +"tests/data/acpi/pc/DSDT.dimmpxm",
> > > +"tests/data/acpi/pc/DSDT.hpbridge",
> > > +"tests/data/acpi/pc/DSDT.hpbrroot",
> > > +"tests/data/acpi/pc/DSDT.ipmikcs",
> > > +"tests/data/acpi/pc/DSDT.memhp",
> > > +"tests/data/acpi/pc/DSDT.nohpet",
> > > +"tests/data/acpi/pc/DSDT.numamem",
> > > +"tests/data/acpi/pc/DSDT.roothp",
> > > +"tests/data/acpi/q35/DSDT",
> > > +"tests/data/acpi/q35/DSDT.acpierst",
> > > +"tests/data/acpi/q35/DSDT.acpihmat",
> > > +"tests/data/acpi/q35/DSDT.applesmc",
> > > +"tests/data/acpi/q35/DSDT.bridge",
> > > +"tests/data/acpi/q35/DSDT.cphp",
> > > +"tests/data/acpi/q35/DSDT.cxl",
> > > +"tests/data/acpi/q35/DSDT.dimmpxm",
> > > +"tests/data/acpi/q35/DSDT.ipmibt",
> > > +"tests/data/acpi/q35/DSDT.ipmismbus",
> > > +"tests/data/acpi/q35/DSDT.ivrs",
> > > +"tests/data/acpi/q35/DSDT.memhp",
> > > +"tests/data/acpi/q35/DSDT.mmio64",
> > > +"tests/data/acpi/q35/DSDT.multi-bridge",
> > > +"tests/data/acpi/q35/DSDT.nohpet",
> > > +"tests/data/acpi/q35/DSDT.numamem",
> > > +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> > > +"tests/data/acpi/q35/DSDT.tis.tpm12",
> > > +"tests/data/acpi/q35/DSDT.tis.tpm2",
> > > +"tests/data/acpi/q35/DSDT.viot",
> > > +"tests/data/acpi/q35/DSDT.xapic",  
> > 
> > still missing DSDT.count2 table, likely in other updates (as well)
> > which should break bisection if not whole pull request.  
> 
> 
> That's because I reordered count2 patches to be after these.

Aha,
that should fix the issue.

> 
> > I'll prep a tree based on your pull req, with fixups
> > for you to pull from.  
> 


