Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3EC2B0CD6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:40:12 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHVz-0003CQ-MZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdHTg-0001s6-0S
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdHTe-0006CI-B1
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ENFkVMR+NLzWy59s1uFDwy28kZKLerARaMUE7sBM5Wo=;
 b=detWvJtmvBrMChmpUMVyMlDCGnclUfwyoj1Q2x1Z1CPt5w4GxyWPb4UjaxRze25kpSaBRs
 LF+3zFyZdXlwkR4W+R4uD8pdwA86/QNeQauSygq7ioVRNuCVBEdsowF0sPavtLHrS+vEjw
 ZWIJ9VMgIUgUKyl3WhNNEHUaPsSDzgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-wG0awOLTMpaRpFqwnNFv0g-1; Thu, 12 Nov 2020 13:37:41 -0500
X-MC-Unique: wG0awOLTMpaRpFqwnNFv0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60CCAF061;
 Thu, 12 Nov 2020 18:37:39 +0000 (UTC)
Received: from [10.3.113.51] (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE3155765;
 Thu, 12 Nov 2020 18:37:35 +0000 (UTC)
Subject: Re: [RFC PATCH 18/25] hw/cxl/device: Add a memory device (8.2.8.5)
To: Ben Widawsky <ben.widawsky@intel.com>, qemu-devel@nongnu.org
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-19-ben.widawsky@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b2d95e72-51d9-72d2-b340-aefb00928a76@redhat.com>
Date: Thu, 12 Nov 2020 12:37:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111054724.794888-19-ben.widawsky@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 11:47 PM, Ben Widawsky wrote:
> A CXL memory device (AKA Type 3) is a CXL component that contains some
> combination of volatile and persistent memory. It also implements the
> previously defined mailbox interface as well as the memory device
> firmware interface.
> 
> The following example will create a 256M device in a 512M window:
> 
> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---

> +++ b/qapi/machine.json
> @@ -1394,6 +1394,7 @@
>  { 'union': 'MemoryDeviceInfo',
>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>              'nvdimm': 'PCDIMMDeviceInfo',
> +            'cxl': 'PCDIMMDeviceInfo',
>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
>              'virtio-mem': 'VirtioMEMDeviceInfo'
>            }

Missing documentation of the new data type, and the fact that it will be
introduced in 6.0.  Also, Markus has been trying to get rid of so-called
"simple unions" in favor of "flat unions" - every time we modify an
existing simple union, it is worth asking if it is time to first flatten
this.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


