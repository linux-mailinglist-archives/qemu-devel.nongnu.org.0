Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6338A991
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:03:01 +0200 (CEST)
Received: from localhost ([::1]:49540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgSC-0007Hb-Pi
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljgQO-0006K8-8e
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljgQM-0007gv-DY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSYVzw4vsWO6xPBgF/9Eq5HXFPlzPGG8fy/HbflRN1k=;
 b=Zgkh093AwApyU1gRqrcw7dZd0SC7iPT5qCdZROgw+Uvwyf72oZeIF9MRkqv3m6hIz6pteg
 oUDgW1lRyyQK2gObHsljn3aIBecZjjrykkVO0I8PDmpVJ/fZpiHKVappi27/S9XNN8KFb7
 mzgOWwCVhnOGEO14UUF7xaxRXDiP7ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-PFd4xfC1NIWUPYt8wo3N0Q-1; Thu, 20 May 2021 07:01:03 -0400
X-MC-Unique: PFd4xfC1NIWUPYt8wo3N0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A26161922965;
 Thu, 20 May 2021 11:01:01 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 549FA5D9DC;
 Thu, 20 May 2021 11:00:49 +0000 (UTC)
Date: Thu, 20 May 2021 13:00:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210520130047.1a89d520@redhat.com>
In-Reply-To: <CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210503190734.12e4c1ac@redhat.com>
 <CO1PR10MB453130B44F61C9E82C431789972D9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210517183138.5a429692@redhat.com>
 <CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9@CO1PR10MB4531.namprd10.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 17:08:31 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Hi Igor,
> Thanks for the information. I am primarily interested in ensuring data persistence in the case of #1.
> As it stands so far, I have yet to observe any kind of write back into the backing file. Just to summarize,
> what I've done thus far is:
> 
> in erst_realizefn():
> ...
>     s->hostmem_obj = object_new(TYPE_MEMORY_BACKEND_FILE);
>     object_property_set_str(s->hostmem_obj, "mem-path", (const char *)(TYPE_ACPI_ERST ".hostmem"), &error_fatal);
>     object_property_set_int(s->hostmem_obj, "size", s->prop_size, &error_fatal);
>     user_creatable_complete(USER_CREATABLE(s->hostmem_obj), &error_fatal);
>     s->hostmem = MEMORY_BACKEND(s->hostmem_obj);

backend should be provided by user on CLI so all backend's properties are configured there
as user desires and frontend should access it via link property.
see how pc-dimm's memdev property is used.

> and then in erst_update_backing_file(), which is called when records are created/updated:
> 
> ...
>     if ((mr = host_memory_backend_get_memory(s->hostmem))) {
>         uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(mr);
>         memcpy(p + offset, data, length);
>         memory_region_msync(mr, 0, s->prop_size); /* for now, the whole thing */
> }
> 
> I've instrumented this code, and I can see the records. I've instrumented memory_region_msync() all the way down
> to qemu_msync() and it makes it into that code. But the end result has always been the same, the backing file is
> never updated.
> 
> I'm not really sure what else I need to do to get the hostmem contents to be written back into the file.

see "man mmap"
 in particular MAP_SHARED vs MAP_PRIVATE

and there is a corresponding property for the file backend to manage that.

in case #1 no explicit sync is needed, backing file should be updated on close at the latest
(whether it's graceful/or forced (i.e. crash))


> Thanks,
> eric
> 
> 
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Monday, May 17, 2021 11:31 AM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redhat.com <jusual@redhat.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
> 
> On Mon, 17 May 2021 15:01:02 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
> > Hi Igor,
> > I've been working to transition ERST to use the hostmem-file object as the backing store, as requested.
> >
> > I have the backend-file object now in ERST, and I have a question for you. This hostmem-file initializes
> > itself from a file, but in looking at the code, I do not see that it ever writes back to the file!? Furthermore,
> > I don't see a "flush" type method to force writeback of data in the object back to file?
> >
> > The original ERST code would flush/write to the backing file each record as it was created. I don't see
> > any equivalent way of doing that with hostmem-file?  
> 
> To force flush you can use memory_region_msync() on MemoryRegion that you get from hostmem backend.
> But question is what are you trying to achieve with sync
>   1. data persistence in case of QEMU crash
>   2. data persistence in case of host crash
> 
> for the former you do not need explicit sync as memory buffers should be flushed to disk by kernel
> if you put backend on nvdimm, you should get 2 without sync as well (see pmem=on property)
> 
> just do not forget that sync is not free, so if #1 is acceptable I'd avoid explicit sync.
> 
> 
> > Please point out where I am misunderstanding.
> >
> > Thanks,
> > eric
[...]


