Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98051355796
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:21:05 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnVo-0000Vv-EP
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lTnJM-0005PS-T3
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lTnJI-0000oF-4b
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617721687;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKsNzzMuohctfFO/avnN4KNnzjNXmgyIqLXRL4UEPwI=;
 b=SmhJJs74+fEvtuxYweErvAKczSZEIhAkNwamUdGAzKVZgCyeTzh4AzERbs1319WZSGrQIq
 +YytyHbkcpcP3GUQbctF3Seji7kJK14eu3nHgWwDQV8ZmoPO/ViMx0Iog5q07t6Lk+H9Ym
 Sy2DBz4pOfBShrLzn/sBJ8WQBch9yk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-yiuu9XH-O--YU_ZHH6UmGg-1; Tue, 06 Apr 2021 11:07:33 -0400
X-MC-Unique: yiuu9XH-O--YU_ZHH6UmGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0749618C8C20;
 Tue,  6 Apr 2021 15:07:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-172.ams2.redhat.com [10.36.114.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3B05D9D0;
 Tue,  6 Apr 2021 15:07:28 +0000 (UTC)
Date: Tue, 6 Apr 2021 16:07:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL v2 11/19] pci: acpi: ensure that acpi-index is unique
Message-ID: <YGx5LRiqkKRmO4aJ@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
 <20210322225907.541943-12-mst@redhat.com>
 <YGx2IFN3mJisOR1w@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YGx2IFN3mJisOR1w@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 03:54:24PM +0100, Daniel P. Berrangé wrote:
> On Mon, Mar 22, 2021 at 07:00:18PM -0400, Michael S. Tsirkin wrote:
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > it helps to avoid device naming conflicts when guest OS is
> > configured to use acpi-index for naming.
> > Spec ialso says so:
> > 
> > PCI Firmware Specification Revision 3.2
> > 4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
> > "
> > Instance number must be unique under \_SB scope. This instance number does not have to
> > be sequential in a given system configuration.
> > "
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index ceab287bd3..f4cb3c979d 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
> >      PCIBus *bus;
> >  } AcpiPciHpFind;
> >  
> > +static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
> > +{
> > +    return a - b;
> > +}
> > +
> > +static GSequence *pci_acpi_index_list(void)
> > +{
> > +    static GSequence *used_acpi_index_list;
> > +
> > +    if (!used_acpi_index_list) {
> > +        used_acpi_index_list = g_sequence_new(NULL);
> > +    }
> > +    return used_acpi_index_list;
> > +}
> > +
> >  static int acpi_pcihp_get_bsel(PCIBus *bus)
> >  {
> >      Error *local_err = NULL;
> > @@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >                     ONBOARD_INDEX_MAX);
> >          return;
> >      }
> > +
> > +    /*
> > +     * make sure that acpi-index is unique across all present PCI devices
> > +     */
> > +    if (pdev->acpi_index) {
> > +        GSequence *used_indexes = pci_acpi_index_list();
> > +
> > +        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
> > +                              g_cmp_uint32, NULL)) {
> > +            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
> > +                       " already exist", pdev->acpi_index);
> > +            return;
> > +        }
> > +        g_sequence_insert_sorted(used_indexes,
> > +                                 GINT_TO_POINTER(pdev->acpi_index),
> > +                                 g_cmp_uint32, NULL);
> > +    }
> 
> This doesn't appear to ensure uniqueness when using PCIe topologies:
> 
> $ ./build/x86_64-softmmu/qemu-system-x86_64 \
>      -device virtio-net,acpi-index=100 \
>      -device virtio-net,acpi-index=100
> qemu-system-x86_64: -device virtio-net,acpi-index=100: a PCI device with acpi-index = 100 already exist
> 
> $ ./build/x86_64-softmmu/qemu-system-x86_64 \
>      -M q35 \
>      -device virtio-net,acpi-index=100
>      -device virtio-net,acpi-index=100
> ....happily running....

In fact the entire concept doesn't appear to work with Q35 at all as
implemented.

The 'acpi_index' file in the guest OS never gets created and the NICs
are still called 'eth0', 'eth1'

Only with i440fx can I can the "enoNNN" based naming to work with
acpi-index set from QEMU


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


