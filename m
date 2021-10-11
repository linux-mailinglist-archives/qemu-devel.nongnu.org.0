Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113942941E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:04:36 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxn0-0002uI-KT
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZxep-0005Jc-0L
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZxem-0004nl-HR
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633967764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7J8ErIyYnJFcKyKhyY+pn7w6HQ5L7yIOoHmuELwx4w=;
 b=IN1IZ2mQrg21e+2G6s/QIKWGZc0ourtv3+xlQYeBq61Z7jGOq2VX4/y0LvHiZGXX1xntcz
 w0ZIzFa0n9FEhUqtyeSWUQegKkwfYbefn1eHhLLEFbz+BZAEas7g0s3/SOUup8JYkFBRyG
 v1K+smzZxT7BzSTLm1HR8nTZwSqkT94=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-NItCEjnlPcGqVxZD4l080A-1; Mon, 11 Oct 2021 11:56:02 -0400
X-MC-Unique: NItCEjnlPcGqVxZD4l080A-1
Received: by mail-ed1-f72.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so14251778edy.14
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7J8ErIyYnJFcKyKhyY+pn7w6HQ5L7yIOoHmuELwx4w=;
 b=y2/XscZK/Vm4m2yF8aH2GNNqvtoKzctxFHUqLPbFabumM4sa9GP58IwfcRpn+QD3Uf
 OUcSuVdWl7XTZSbQ5BX/QVLjVlS+wThcGjnJByTqInLYV0WPaTfpEyS/qlE5op2j8Xrm
 AQepx966jU+ZaAjnIiwWYqoja+boofdV47WXfvJbXenPeU9gWZgzYMJZoLUY/FMte5D1
 F7PjL/52ihGU4koN90o+vMKTZIXN8clMLTy/btZbCDv/p60C3daD5pwkj4Fq7zM5yhPv
 7843UrSz5RvL7HBXsnAC7b8AbkkwmXEWFll2BfeYt46Dr65KhproKmv29herZi64AB3L
 d/mg==
X-Gm-Message-State: AOAM533G0a3ze5/LOA8Zlzor8D8b8wtOBUS9HZ3ieMXgm5L+h9uiDu0v
 A7jLuAwdJahDgw4/G527QYv8eX4EK6KnUXKtgpr7dmQWUytEge2INosHyloIBH6ThNLfCEC7Hrh
 MZ+is9MKPDWe52dY=
X-Received: by 2002:a50:d809:: with SMTP id o9mr42724358edj.149.1633967761580; 
 Mon, 11 Oct 2021 08:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQIvGMK5zdDhbEUGcVHsLdRAYVuv9XcO7Lgm3oNZJd2TPjapPopeBgk5VNw1eA986ZJflW+g==
X-Received: by 2002:a50:d809:: with SMTP id o9mr42724332edj.149.1633967761412; 
 Mon, 11 Oct 2021 08:56:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id lm14sm3673760ejb.24.2021.10.11.08.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:56:00 -0700 (PDT)
Date: Mon, 11 Oct 2021 17:55:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211011175559.3d10bab3@redhat.com>
In-Reply-To: <YWBjHrELdZIBXcOD@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
 <20211006101215.24414401@redhat.com> <YWBjHrELdZIBXcOD@myrica>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 16:26:22 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Wed, Oct 06, 2021 at 10:12:15AM +0200, Igor Mammedov wrote:
> > On Fri,  1 Oct 2021 18:33:56 +0100
> > Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> >   
> > > Create empty data files and allow updates for the upcoming VIOT tests.
> > > 
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
> > >  tests/data/acpi/q35/DSDT.viot               | 0  
> > 
> > does default tests/data/acpi/q35/DSDT differs from
> > DSDT.viot?  
> 
> Yes the VIOT test has one more PCI device (virtio-iommu) and PXB devices,
> so there are additional descriptors in the DSDT


also see tests/qtest/bios-tables-test.c step 6
(---include diff--- part)

> 
> Thanks,
> Jean
> 
> >   
> > >  tests/data/acpi/q35/VIOT.viot               | 0
> > >  tests/data/acpi/virt/VIOT                   | 0
> > >  4 files changed, 3 insertions(+)
> > >  create mode 100644 tests/data/acpi/q35/DSDT.viot
> > >  create mode 100644 tests/data/acpi/q35/VIOT.viot
> > >  create mode 100644 tests/data/acpi/virt/VIOT
> > > 
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index dfb8523c8b..29b5b1eabc 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,4 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/virt/VIOT",
> > > +"tests/data/acpi/q35/DSDT.viot",
> > > +"tests/data/acpi/q35/VIOT.viot",
> > > diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> > > new file mode 100644
> > > index 0000000000..e69de29bb2
> > > diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> > > new file mode 100644
> > > index 0000000000..e69de29bb2
> > > diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> > > new file mode 100644
> > > index 0000000000..e69de29bb2  
> >   
> 


