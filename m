Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9935356D51
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:30:49 +0200 (CEST)
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8Ge-0002H0-Oh
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8FP-0001pc-Qs
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8FO-0001uX-52
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617802169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YimiFQC5+EwfE56oJLWW8KHEsdgt1spky94zvPmNszU=;
 b=A9BmXxR6fNOGS2spxNthvPUoPh2kar0WjwkWGJHIoC71EDkR2m3LF3TwLNBFjoA3uE9gtm
 e7uIGxyC4fDATI2thf6lg4aY9KLl1mUWJnHDG3OZhsWqpL5y/mqhiRrUS7T2jgk/JVAPeR
 QA8wbw1Nm2GpU9oo2ZI6qgam4luY9ME=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-dCTvllSENF6VaRggsyS0Vw-1; Wed, 07 Apr 2021 09:29:26 -0400
X-MC-Unique: dCTvllSENF6VaRggsyS0Vw-1
Received: by mail-wr1-f69.google.com with SMTP id p2so2010532wrq.18
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YimiFQC5+EwfE56oJLWW8KHEsdgt1spky94zvPmNszU=;
 b=MjQ5KIzeyI0wvsYWb8EWFaapp19rcmU8dQ7PLSZSsKWdRcHpdFMTbKT7TlTM2r77e1
 XBPIhA5mjH72IztM2Y3OB65k6UEE09rEO4FlvDk/Il59bk20RiHMoDWrKYL3B6Ds+WuS
 bde4XGApJSLS7N5L7x/b2M+b26IXV0+NwD3z6BQxWyeJ0cy+yj3392blF5wKYJ9rZS1z
 p5VXhWpLJkkO5bjxKwcu4TbJBOw/4KTcsuUfE8b7TjEolJbarRhbi6LXnr88nmXeU6mt
 k8naIy8yeGQnjsJS7HZAU8yOE7J/UE/66ifyToP6o+lIQA/qs01TTvtMXT1XMLk5qrFe
 szDA==
X-Gm-Message-State: AOAM531DwamtNGPf6Z8mi2ELa9WCBN2oISEgbjcNaAquZfpTQGSm8L60
 XU0xoIHwybnzq0qpaefWZBi1DjnLRt8WLNJ8mgzkWEeYijriJaxfO6LgZ733N35VG5uIz0J8Eeo
 hSjMqs4DwktgROe0=
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3147221wma.10.1617802165329;
 Wed, 07 Apr 2021 06:29:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh4NGcQu4Apjey5xGwuER4awO50xfIt3Gy8+pbEp6t51lLPqB7f6NtMqf1pfuZhEFHNaU83A==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3147210wma.10.1617802165161;
 Wed, 07 Apr 2021 06:29:25 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id k7sm31090849wrd.24.2021.04.07.06.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:29:24 -0700 (PDT)
Date: Wed, 7 Apr 2021 09:29:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210407092759-mutt-send-email-mst@kernel.org>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com> <YGx5LRiqkKRmO4aJ@redhat.com>
 <20210406201546.2377830e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406201546.2377830e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Julia Suvorova <jusual@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 08:15:46PM +0200, Igor Mammedov wrote:
> On Tue, 6 Apr 2021 16:07:25 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrangé wrote:
> > > On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote:  
> > > > From: Igor Mammedov <imammedo@redhat.com>
> > > > 
> > > > it helps to avoid device naming conflicts when guest OS is
> > > > configured to use acpi-index for naming.
> > > > Spec ialso says so:
> > > > 
> > > > PCI Firmware Specification Revision 3.2
> > > > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
> > > > "
> > > > Instance number must be unique under \_SB scope. This instance number does not have to
> > > > be sequential in a given system configuration.
> > > > "
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 46 insertions(+)
> > > > 
> > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > index ceab287bd3..f4cb3c979d 100644
> > > > --- a/hw/acpi/pcihp.c
> > > > +++ b/hw/acpi/pcihp.c
> > > > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> > > >      PCIBus *bus;
> > > >  } AcpiPciHpFind;
> > > >  
> > > > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
> > > > +{
> > > > +    return a - b;
> > > > +}
> > > > +
> > > > +static GSequence *pci_acpi_index_list(void)
> > > > +{
> > > > +    static GSequence *used_acpi_index_list;
> > > > +
> > > > +    if (!used_acpi_index_list) {
> > > > +        used_acpi_index_list = g_sequence_new(NULL);
> > > > +    }
> > > > +    return used_acpi_index_list;
> > > > +}
> > > > +
> > > >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> > > >  {
> > > >      Error *local_err = NULL;
> > > > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > > >                     ONBOARD_INDEX_MAX);
> > > >          return;
> > > >      }
> > > > +
> > > > +    /*
> > > > +     * make sure that acpi-index is unique across all present PCI devices
> > > > +     */
> > > > +    if (pdev->acpi_index) {
> > > > +        GSequence *used_indexes = pci_acpi_index_list();
> > > > +
> > > > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
> > > > +                              g_cmp_uint32, NULL)) {
> > > > +            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
> > > > +                       " already exist", pdev->acpi_index);
> > > > +            return;
> > > > +        }
> > > > +        g_sequence_insert_sorted(used_indexes,
> > > > +                                 GINT_TO_POINTER(pdev->acpi_index),
> > > > +                                 g_cmp_uint32, NULL);
> > > > +    }  
> > > 
> > > This doesn't appear to ensure uniqueness when using PCIe topologies:
> > > 
> > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > >      -device virtio-net,acpi-index=100 \
> > >      -device virtio-net,acpi-index=100
> > > qemu-system-x86_64: -device virtio-net,acpi-index=100: a PCI device with acpi-index = 100 already exist
> > > 
> > > $ ./build/x86_64-softmmu/qemu-system-x86_64 \
> > >      -M q35 \
> > >      -device virtio-net,acpi-index=100
> > >      -device virtio-net,acpi-index=100
> > > ....happily running....  
> > 
> > In fact the entire concept doesn't appear to work with Q35 at all as
> > implemented.
> > 
> > The 'acpi_index' file in the guest OS never gets created and the NICs
> > are still called 'eth0', 'eth1'
> > 
> > Only with i440fx can I can the "enoNNN" based naming to work with
> > acpi-index set from QEMU
> 
> It is not supported on Q35 yet as it depends on ACPI PCI hotplug infrastructure.
> Once Julia is done with porting it to Q35, acpi-index will be pulled along with it.


Right. But for now, should we make it fail instead of being ignored silently?
If we don't how will managament find out it's not really supported?
And if we make it fail how will management then find out when it's finally
supported?

> 
> > Regards,
> > Daniel


