Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54C2B84DB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:22:35 +0100 (CET)
Received: from localhost ([::1]:36940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfT2I-0006gr-4O
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfT0U-00067T-LD
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kfT0S-0002GN-JZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605727239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltMQpK+vEnhwwLFfZTvtQ3iFV264qcF/ySdSEyRXG6s=;
 b=HE6LHXtHhrX/zU6+v7wkUZbb461v3+im1S3CKBgM+CK9jPd9YvZtjeqadmIMpOOriEEOzq
 Y9VuEb6M+cqmLSyN28S/Q3nVfFPU6vqGjfO2CvQULITfW/O/PBc3jvrtDs3QYgHypYWVmA
 5t5SCQfDsZg5AdIgDG81n905HECp64w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-u4w-SGzEOJu78qpg3nwnQw-1; Wed, 18 Nov 2020 14:20:37 -0500
X-MC-Unique: u4w-SGzEOJu78qpg3nwnQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4475F101C7A4;
 Wed, 18 Nov 2020 19:20:36 +0000 (UTC)
Received: from [10.36.114.231] (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA5575C1A3;
 Wed, 18 Nov 2020 19:20:05 +0000 (UTC)
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
To: Peter Xu <peterx@redhat.com>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com> <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
 <20201118152311.GB29639@xz-x1>
 <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
 <20201118170143.GC29639@xz-x1>
 <1f1602db-748a-4e9d-dfde-950b573592fb@redhat.com>
 <20201118190508.GD29639@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <6cf8380a-974d-ec94-ed1e-e7e825c0adfa@redhat.com>
Date: Wed, 18 Nov 2020 20:20:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201118190508.GD29639@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Le Tan <tamlokveer@gmail.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, wei.huang2@amd.com,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> So it's about the malicious guests.
> 
> I agree with you that we can try to limit above from happening, e.g. by
> teaching vfio_get_xlat_addr() to fail when it's going to map some unplugged
> range of virtio-mem device.

Exactly.

> 
> Or... imho, we may not even need to worry too much on those misuses of
> virtio-mem? As long as the issue is self-contained within the buggy VM/process.
> E.g., the worst case of such a malicious guest is to fiddle around the maximum
> allowed memory size granted to the virtio-mem device to either have pages
> incorrectly pinned, or some strange IOVA mapped to unplugged pages within that
> range.  As long as it won't affect other VMs and the host, and qemu won't crash
> with that, then it seems ok.

Indeed, I have the same thoughts.

The only "ugly" thing is that our VM might not only consume more memory 
than intended, but also pin that memory (unmovable, unswappable ...). So 
I'm thinking about at least doing a warn_report_once() until we have 
some approach to handle that - for environments that might care about this.

Thanks for looking into this!

-- 
Thanks,

David / dhildenb


