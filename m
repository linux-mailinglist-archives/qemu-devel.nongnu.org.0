Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DB2B16B6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 08:49:06 +0100 (CET)
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdTpR-00077g-3V
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 02:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdToa-0006HA-Dz
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 02:48:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdToX-00009H-9a
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 02:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605253687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WqRBTZSM2ZmvUNTCus/nKc9jwL0KpwQayXjh+yxyCuw=;
 b=PF3IEB+Cq6Ym2AjPd3MwyiwXoC4OvtZdhhDQhiY0s0HFzjikuV1Y6pS+RLHgVMHXwgPeey
 V9xP1mYk0vNoPqp2Q+kJC1usuiW1Iuxf0NCKF4FBOVnSZc/XUYfsWSoVvXJKKOGfsFeFUT
 b2QMRDDLF4w0A4ZryJ6TUSeZGwHYgXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-RF48tZXcNq6y3HFbxuGJZQ-1; Fri, 13 Nov 2020 02:48:05 -0500
X-MC-Unique: RF48tZXcNq6y3HFbxuGJZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E701006700;
 Fri, 13 Nov 2020 07:48:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E42646EF62;
 Fri, 13 Nov 2020 07:48:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6CEB411386A0; Fri, 13 Nov 2020 08:47:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH 18/25] hw/cxl/device: Add a memory device (8.2.8.5)
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-19-ben.widawsky@intel.com>
 <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com>
Date: Fri, 13 Nov 2020 08:47:59 +0100
In-Reply-To: <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com> (Eric Blake's
 message of "Thu, 12 Nov 2020 12:37:35 -0600")
Message-ID: <87d00hk89c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 11/10/20 11:47 PM, Ben Widawsky wrote:
>> A CXL memory device (AKA Type 3) is a CXL component that contains some
>> combination of volatile and persistent memory. It also implements the
>> previously defined mailbox interface as well as the memory device
>> firmware interface.
>> 
>> The following example will create a 256M device in a 512M window:
>> 
>> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
>> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
>> 
>> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
>> ---
>
>> +++ b/qapi/machine.json
>> @@ -1394,6 +1394,7 @@
>>  { 'union': 'MemoryDeviceInfo',
>>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>>              'nvdimm': 'PCDIMMDeviceInfo',
>> +            'cxl': 'PCDIMMDeviceInfo',
>>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
>>              'virtio-mem': 'VirtioMEMDeviceInfo'
>>            }
>
> Missing documentation of the new data type, and the fact that it will be
> introduced in 6.0.

Old wish list item: improve the QAPI schema frontend to flag this.

>                     Also, Markus has been trying to get rid of so-called
> "simple unions" in favor of "flat unions" - every time we modify an
> existing simple union, it is worth asking if it is time to first flatten
> this.

0. Simple unions can be transformed into flat unions.  The
transformation can either preserve the nested wire format, or flatten
it.  See docs/devel/qapi-code-gen.txt "A simple union can always be
re-written as a flat union ..."

1. No new simple unions.

2. Existing simple unions that can be flattened without breaking
backward compatibility have long been flattened.

3. The remaining simple unions are part of QMP, where we need to
preserve the wire format.  We could turn them into flat union preserving
the wire format.  Only worthwhile if we kill simple unions and simplify
scripts/qapi/.  Opportunity to make the flat union syntax less
cumbersome.  Not done due to lack of time.

4. Kevin and I have been experimenting with ways to provide both flat
and nested wire format.  This would pave the way for orderly deprecation
of the nested wire format.  May not be practical for QMP output.


