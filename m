Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD82CA94F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:08:16 +0100 (CET)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk98Q-00081F-ST
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kk97M-0007Z1-I6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kk97J-0000LU-F9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606842422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpWQHXhaAIgP/A1PszXQGjps+UzKgZdo4htCayZmCpg=;
 b=CZgi+LSmjeBIzM1iet7kVvXgMRZbQnnAwf1YLdA0iu24yHVuneaQM0OBOzAW7JBdhM7fcY
 xvqz1/nPD96TKxaFgmnTLKWsRPSzOCr6vIlvPHF0jjNrAu0G4SqIOPrciPIjGE3qD4OZAj
 b/ciKyE5Q3DdsyBWWYkArtOCpdTBoVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-K8Doiqo7OWCATiyQw0WqSQ-1; Tue, 01 Dec 2020 12:06:48 -0500
X-MC-Unique: K8Doiqo7OWCATiyQw0WqSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25E75188;
 Tue,  1 Dec 2020 17:06:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5538C189CE;
 Tue,  1 Dec 2020 17:06:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D7546113864E; Tue,  1 Dec 2020 18:06:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH 18/25] hw/cxl/device: Add a memory device (8.2.8.5)
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-19-ben.widawsky@intel.com>
 <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com>
 <87d00hk89c.fsf@dusky.pond.sub.org>
 <20201125165333.zn5tpwfjnwmjmcdu@intel.com>
 <87360w39qw.fsf@dusky.pond.sub.org>
 <20201130170730.o5fkrpaubwcroz4y@mail.bwidawsk.net>
Date: Tue, 01 Dec 2020 18:06:41 +0100
In-Reply-To: <20201130170730.o5fkrpaubwcroz4y@mail.bwidawsk.net> (Ben
 Widawsky's message of "Mon, 30 Nov 2020 09:07:30 -0800")
Message-ID: <878saha21q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ben Widawsky <ben@bwidawsk.net> writes:

> On 20-11-26 07:36:23, Markus Armbruster wrote:
>> Ben Widawsky <ben.widawsky@intel.com> writes:
>> 
>> > On 20-11-13 08:47:59, Markus Armbruster wrote:
>> >> Eric Blake <eblake@redhat.com> writes:
>> >> 
>> >> > On 11/10/20 11:47 PM, Ben Widawsky wrote:
>> >> >> A CXL memory device (AKA Type 3) is a CXL component that contains some
>> >> >> combination of volatile and persistent memory. It also implements the
>> >> >> previously defined mailbox interface as well as the memory device
>> >> >> firmware interface.
>> >> >> 
>> >> >> The following example will create a 256M device in a 512M window:
>> >> >> 
>> >> >> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
>> >> >> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
>> >> >> 
>> >> >> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
>> >> >> ---
>> >> >
>> >> >> +++ b/qapi/machine.json
>> >> >> @@ -1394,6 +1394,7 @@
>> >> >>  { 'union': 'MemoryDeviceInfo',
>> >> >>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>> >> >>              'nvdimm': 'PCDIMMDeviceInfo',
>> >> >> +            'cxl': 'PCDIMMDeviceInfo',
>> >> >>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
>> >> >>              'virtio-mem': 'VirtioMEMDeviceInfo'
>> >> >>            }
>> >> >
>> >> > Missing documentation of the new data type, and the fact that it will be
>> >> > introduced in 6.0.
>> >> 
>> >> Old wish list item: improve the QAPI schema frontend to flag this.
>> >> 
>> >
>> > "Introduced in 6.0" - quite the optimist. Kidding aside, this is the area where
>> > I could use some feedback. CXL Type 3 memory devices can contain both volatile
>> > and persistent memory at the same time. As such, I think I'll need a new type to
>> > represent that, but I'd love to know how best to accomplish that.
>> 
>> We can help.  Tell us what information you want to provide in variant
>> 'cxl'.  If it's a superset of an existing variant, give us just the
>> delta.
>> 
>
> I'm not exactly sure what the best way to do this is in QEMU, so I'm not really
> sure what to specify as the delta. A CXL memory device can have both volatile
> and persistent memory. Currently when a CXL memory device implements the
> TYPE_MEMORY_DEVICE interface. So I believe the shortest path is a
> MemoryDeviceInfo that can have two memory devices associated with it, but I
> don't know if that's the best path.

Perhaps a CXL device should contain two sub-devices implementing
TYPE_MEMORY_DEVICE.  Paolo, what do you think?

If yes, one of the existing variants fits the bill, I guess.

If no, I have more ramblings to offer.

query-memory-devices returns a MemoryDeviceInfo for each realized device
that implements interface TYPE_MEMORY_DEVICE.  The interface provides
callback ->fill_device_info() to fill in the MemoryDeviceInfo.  This is
its only use.

This means TYPE_MEMORY_DEVICE places no obvious constraints on how the
callbacks use MemoryDeviceInfo.  Each callback can pick whatever variant
it wants.  This also means *your* callback can pick a new one, which you
define however you want.

What if there are unobvious (and unwritten) constraints?

The existing variants overlap:

* All provide the device's ID: optional member @id

* All provide a physical address (base address, I supposed) and size,
  but the member names differ (argh!): @addr, @size vs. @memaddr, @size

* All provide the memory backend: member @memdev

The members that overlap by necessity (i.e. any conceivable
TYPE_MEMORY_DEVICE will have them) should be common members, not variant
members.  Requires converting the simple union to the equivalent flat
union.

Do these members overlap by necessity?  Paolo, Igor?

[...]


