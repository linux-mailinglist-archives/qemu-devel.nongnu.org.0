Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE04AFDD0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:57:47 +0100 (CET)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHt62-0000Va-9C
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nHsLR-0000ik-TR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nHsLP-0007YH-B6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 14:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644433774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4e2B8CRA0Mc/Bft/aeYH9njX0ttCU4Cd8d8MvfCIbc=;
 b=JqIFZpGsHEgTMTZ38vgvQO2FWTnum2+TUhWym3trxmujd76Xbz2taNzjccjkDbSwL3tk3y
 fWldRt5AxXsZZJM+fHcH0bGIIxINadIjPh8HW5Jt54lomF/zZDo4umCNM1UtjPU3qf9wXF
 xvPgFjgUyCDkmMYwoUe7Q+pp9Lil/Dk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-PG_p04RdNXGcDWrezmEHAg-1; Wed, 09 Feb 2022 14:09:33 -0500
X-MC-Unique: PG_p04RdNXGcDWrezmEHAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1451415wrg.19
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 11:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C4e2B8CRA0Mc/Bft/aeYH9njX0ttCU4Cd8d8MvfCIbc=;
 b=eLs7sofjWyIRGG3g/hpqTLxjpzxw46Hd0QbZdZ9EoLLGN824O7EOFzMc+tArhr+OfQ
 NlUgckAbz6PvViLIiUItSDXLeQ9sKfXtIUXMWRY/VRyzo87NvpI3A/4gv644ZH0jZ9Eq
 XMkQ12o8ULoO9N4GnXmexlUur9EinXCP9/phU9+WgTPKSbw8E9pEirqrAGlpRiSegZzz
 k6GIp3CCWfYzFIKi2QFl50LW8iTn4sAQCc13gM7dEtkW9S10ZO0yZve0OaHwx+vo0uAa
 htt5rns4pIk58oPQwkyRdCCB1RYBiQieBz79eb34kO5VvbGdkjLd1MZR2ew3G80+/OX3
 krRw==
X-Gm-Message-State: AOAM532sCzKOT+eAp9CJLJVeZkycIvuuv4x8/uenOsIRPWJ5LT8pofPB
 Af7XYmMXzk4xfFf46Jgh/3Km6sMZ6kCn5639W/0UAgetWd+XjdJqObzZdo7QI019vmVhuOuiVql
 fowMoESXf8/NwRpY=
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3888620wmc.119.1644433772231; 
 Wed, 09 Feb 2022 11:09:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBWebjrQrOEbPi6SSWj+FREYBf9KcLbgIKtgu5cA08Qg6VT1MVnwzJazDvD+svlGh9IwJVqQ==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3888585wmc.119.1644433772006; 
 Wed, 09 Feb 2022 11:09:32 -0800 (PST)
Received: from redhat.com ([2.55.139.162])
 by smtp.gmail.com with ESMTPSA id r12sm16792384wrw.73.2022.02.09.11.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:09:30 -0800 (PST)
Date: Wed, 9 Feb 2022 14:09:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 23/42] tests/acpi: allow CEDT table addition
Message-ID: <20220209140746-mutt-send-email-mst@kernel.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-24-Jonathan.Cameron@huawei.com>
 <20220209181801.00000e4d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220209181801.00000e4d@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 09, 2022 at 06:18:01PM +0000, Jonathan Cameron wrote:
> On Mon, 24 Jan 2022 17:16:46 +0000
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > From: Ben Widawsky <ben.widawsky@intel.com>
> > 
> > Following patches will add a new ACPI table, the
> > CXL Early Discovery Table (CEDT).
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  tests/data/acpi/pc/CEDT                     | 0
> >  tests/data/acpi/q35/CEDT                    | 0
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  3 files changed, 2 insertions(+)
> > 
> > diff --git a/tests/data/acpi/pc/CEDT b/tests/data/acpi/pc/CEDT
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/q35/CEDT b/tests/data/acpi/q35/CEDT
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..9b07f1e1ff 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/pc/CEDT",
> > +"tests/data/acpi/q35/CEDT",
> 
> Whilst reordering the series to allow partial sets to be picked up
> it occurred to me that there is reason why we should now generate a CEDT
> table unless cxl=on is set for the relevant machine.

Absolutely. But this is just an example, it's an instance of
a bigger issue: skipping new features when they are off
reduces the chance of legacy guest breakage.

> Adding the relevant conditions means we can avoid this dance
> to add effectively empty CEDT tables.  I have added a proper
> test for to bios-test-tables but that can be introduced once
> everything is in place, rather than as we go along (whereas
> for qtests/cxl-test.c I am doing a series of updates as the 
> functionality is built up.).
> 
> Makes for a simpler patch series to update.
> 
> Jonathan


