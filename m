Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D33D1E24B0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 16:58:20 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdb23-0005B0-9Y
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 10:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdb13-0004X0-U5
 for qemu-devel@nongnu.org; Tue, 26 May 2020 10:57:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33115
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdb12-0006U1-O0
 for qemu-devel@nongnu.org; Tue, 26 May 2020 10:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590505035;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pUkCXwtATbqP8L7MZ3UY6OQoZMaPnXx8wEoPPErU3g8=;
 b=PtGIla9WCbFcssGqsKmHoKDjJcYKlPBQGg3sHPTy5DmA5wz+UNTOup59LphfcPJUYbef62
 ZBLuUPD0qlRWHn1WdBnWK/mJ+D0jBxZj3yn9m3Kp/gcVaCoCki4KRcnUOXVEarI9EfwyUh
 vZOYdU3ADKkl+w9fv2La9m818gGMfOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-X_ET4H2LMNKS5DZJa86w9Q-1; Tue, 26 May 2020 10:57:10 -0400
X-MC-Unique: X_ET4H2LMNKS5DZJa86w9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F83E8014D7;
 Tue, 26 May 2020 14:57:09 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A6E5C1BB;
 Tue, 26 May 2020 14:57:00 +0000 (UTC)
Date: Tue, 26 May 2020 15:56:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] pc: Support coldplugging of virtio-pmem-pci devices
 on all buses
Message-ID: <20200526145658.GI2496524@redhat.com>
References: <20200525084511.51379-1-david@redhat.com>
 <20200526132840.GD108774@redhat.com>
 <dddadb61-b0af-a9c0-64f8-ac3c47d37566@redhat.com>
 <20200526142219.GE108774@redhat.com>
 <32210631-5933-088c-52e5-9e9eb2d800e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32210631-5933-088c-52e5-9e9eb2d800e3@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:51:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 26, 2020 at 04:43:35PM +0200, David Hildenbrand wrote:
> On 26.05.20 16:22, Vivek Goyal wrote:
> > On Tue, May 26, 2020 at 03:44:10PM +0200, David Hildenbrand wrote:
> >> On 26.05.20 15:28, Vivek Goyal wrote:
> >>> On Mon, May 25, 2020 at 10:45:11AM +0200, David Hildenbrand wrote:
> >>>> E.g., with "pc-q35-4.2", trying to coldplug a virtio-pmem-pci devices
> >>>> results in
> >>>>     "virtio-pmem-pci not supported on this bus"
> >>>>
> >>>> Reasons is, that the bus does not support hotplug and, therefore, does
> >>>> not have a hotplug handler. Let's allow coldplugging virtio-pmem devices
> >>>> on such buses. The hotplug order is only relevant for virtio-pmem-pci
> >>>> when the guest is already alive and the device is visible before
> >>>> memory_device_plug() wired up the memory device bits.
> >>>>
> >>>> Hotplug attempts will still fail with:
> >>>>     "Error: Bus 'pcie.0' does not support hotplugging"
> >>>>
> >>>> Hotunplug attempts will still fail with:
> >>>>     "Error: Bus 'pcie.0' does not support hotplugging"
> >>>>
> >>>> Reported-by: Vivek Goyal <vgoyal@redhat.com>
> >>>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> >>>> Cc: Igor Mammedov <imammedo@redhat.com>
> >>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>> Cc: Richard Henderson <rth@twiddle.net>
> >>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
> >>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >>>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> >>>> ---
> >>>>  hw/i386/pc.c | 18 ++++++++++--------
> >>>>  1 file changed, 10 insertions(+), 8 deletions(-)
> >>>
> >>> Thanks for the patch David. I still seem to face a different error though.
> >>>
> >>> 2020-05-26T13:26:05.720617Z qemu-system-x86_64: -device virtio-pmem-pci,memdev=pmem1,id=nv1: memory devices (e.g. for memory hotplug) are not enabled, please specify the maxmem option
> >>>
> >>> Following is my domain xml file.
> >>>
> >>> Vivek
> >>
> >> Hi Vivek,
> >>
> >> you have to declare the maxMemory option. Memory devices like
> >> virtio-pmem-pci reside in RAM like a pc-dimm or a nvdimm. If your
> >> virtio-pmem device will be 4GB, you have to add that to maxMemory.
> >>
> >>   <memory unit='GiB'>64</memory>
> >>   <maxMemory unit='GiB'>68</maxMemory>
> >>   <currentMemory unit='GiB'>64</currentMemory>
> >>
> >> (you might have to add "slots='0'" or "slots='1'" to maxMemory to make
> >> libvirt happy)
> > 
> > Ok, tried that.
> > 
> > <maxMemory slots='1' unit='KiB'>134217728</maxMemory>
> > 
> > And now it complains about.
> > 
> > error: unsupported configuration: At least one numa node has to be configured when enabling memory hotplug
> > 
> > So ultimately it seems to be wanting me to somehow enable memory hotplug
> > to be able to use virtio-pmem?
> 
> That's a libvirt error message. Maybe I am confused how libvirt maps
> these parameters to QEMU ...
> 
> NVDIMMs under libvirt seem to be easy:
> 
> https://www.redhat.com/archives/libvir-list/2016-August/msg00055.html
> 
> Maybe the issue is that virtio-pmem has not been properly integrated
> into libvirt yet:
> 
> https://www.redhat.com/archives/libvir-list/2019-August/msg00007.html

While libvirt has generic pmem support, it doesn't have virtio-pmem:

https://libvirt.org/formatdomain.html#elementsMemory

eg

  <memory model='nvdimm' access='shared'>
    <uuid>
    <source>
      <path>/dev/dax0.0</path>
      <alignsize unit='KiB'>2048</alignsize>
      <pmem/>
    </source>
    <target>
      <size unit='KiB'>524288</size>
      <node>1</node>
      <label>
        <size unit='KiB'>128</size>
      </label>
    </target>
  </memory>

> Maybe maxMemory in libvirt does not directly map to the QEMU variant to
> define the maximum physical address space reserved also for any memory
> devices (DIMMs, NVDIMMs, virtio-pmem, ...). Any libvirt experts that can
> help?

<maxMemory> reflects the upper limit on what you can hot-plug at
runtime:

   https://libvirt.org/formatdomain.html#elementsMemoryAllocation


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


