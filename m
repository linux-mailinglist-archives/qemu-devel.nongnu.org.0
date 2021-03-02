Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD032A9EE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:01:51 +0100 (CET)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAHF-0006xj-W9
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9VX-0000PW-6T
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9VS-0001Tn-Li
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614708745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gFEPs+euacg8bcpqwm1s3jWMQqDjlVFO10SuwV35Ax4=;
 b=fQpbZE126Dzhhm5pqK+4l4g5us//NFxHTy4XClCVeMoXL35maifq/lpKjM6gwQ11x6Yha5
 0oEh6qd7XEVN2FFlP+6f6k8NitthOpxzC+P7DOq0FN42Eq2dRH6SqrsGWfFhRCe+9wdMpb
 ie9LeY7v2OgRrjZ6adtyNMI9gj/WxZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-obDg8Kt9Pse_5k-eTFqS-g-1; Tue, 02 Mar 2021 13:12:23 -0500
X-MC-Unique: obDg8Kt9Pse_5k-eTFqS-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C72102CC3D;
 Tue,  2 Mar 2021 18:12:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15E2C6889F;
 Tue,  2 Mar 2021 18:11:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:11:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 07/31] qapi/qom: Add ObjectOptions for memory-backend-*
Message-ID: <20210302181127.GE5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-8-kwolf@redhat.com>
 <cbb010a0-0d41-7a21-0130-d56d18942b5e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cbb010a0-0d41-7a21-0130-d56d18942b5e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 17:23 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the memory-backend-*
> > objects.
> > 
> > HostMemPolicy has to be moved to an include file that can be used by the
> > storage daemon, too, because ObjectOptions must be the same in all
> > binaries if we don't want to compile the whole code multiple times.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/common.json  |  20 ++++++++
> >  qapi/machine.json |  22 +--------
> >  qapi/qom.json     | 118 +++++++++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 138 insertions(+), 22 deletions(-)
> > 
> 
> > +++ b/qapi/qom.json
> 
> > +##
> > +# @MemoryBackendProperties:
> > +#
> > +# Properties for objects of classes derived from memory-backend.
> > +#
> > +# @merge: if true, mark the memory as mergeable (default depends on the machine
> > +#         type)
> > +#
> > +# @dump: if true, include the memory in core dumps (default depends on the
> > +#        machine type)
> 
> Interesting choice to flip the description text from its previous
> wording, but fine by me:
>     object_class_property_set_description(oc, "dump",
>         "Set to 'off' to exclude from core dump");

I feel that for booleans, describing what happens if they are false
often turns out a bit confusing with double negatives etc. But if you
think that in some cases, describing the negative is actually better,
I'm open for that.

> > +#
> > +# @host-nodes: the list of NUMA host nodes to bind the memory to
> > +#
> > +# @policy: the NUMA policy (default: 'default')
> > +#
> > +# @prealloc: if true, preallocate memory (default: false)
> 
> Not quite in the same order as
> backends/hostmem.c:host_memory_backend_class_init() (alphabetic here
> instead of matching the C code declaration order), but that doesn't
> impact QMP semantics, and I was able to match everything up in the end.
> 
> > +#
> > +# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
> > +#
> > +# @share: if false, the memory is private to QEMU; if true, it is shared
> > +#         (default: false)
> > +#
> > +# @size: size of the memory region in bytes
> > +#
> > +# @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
> > +#                                        for ramblock-id. Disable this for 4.0
> > +#                                        machine types or older to allow
> > +#                                        migration with newer QEMU versions.
> > +#                                        (default: false generally, but true
> > +#                                        for machine types <= 4.0)
> 
> The comment in the C code mentions that in spite of the x- prefix, we
> have to treat this as a stable interface until 4.0 machines disappear.
> Do we need any of that sentiment in the documentation here?

"This option is considered stable despite the x- prefix."

Does this work or should I be more verbose? (The indentation makes me
want to keep it terse... :-))

> > +#
> > +# Since: 2.1
> > +##
> > +{ 'struct': 'MemoryBackendProperties',
> > +  'data': { '*dump': 'bool',
> > +            '*host-nodes': ['uint16'],
> > +            '*merge': 'bool',
> > +            '*policy': 'HostMemPolicy',
> > +            '*prealloc': 'bool',
> > +            '*prealloc-threads': 'uint32',
> > +            '*share': 'bool',
> > +            'size': 'size',
> > +            '*x-use-canonical-path-for-ramblock-id': 'bool' } }
> > +
> > +##
> > +# @MemoryBackendFileProperties:
> > +#
> > +# Properties for memory-backend-file objects.
> > +#
> > +# @align: the base address alignment when QEMU mmap(2) @mem-path. Some
> > +#         backend store specified by @mem-path requires an alignment different
> 
> Grammar feels off.  Would it read better as
> 
> ...when QEMU mmap(2)s @mem-path.  Some backend stores specified by
> @mem-path require an...

This description is stolen from qemu-options.hx (I actually tried to
copy existing documentation whenever it seemed to explain things well),
but that's no reason not to improve it.

> > +#         than the default one used by QEMU, e.g. the device DAX /dev/dax0.0
> > +#         requires 2M alignment rather than 4K. In such cases, users can
> > +#         specify the required alignment via this option.
> > +#         0 selects a default alignment (currently the page size). (default: 0)
> 
> Again, not in the same order as
> backends/hostmem-file.c:file_backend_class_init(), but it matches up.
> 
> > +#
> > +# @discard-data: if true, the file contents can be destroyed when QEMU exits,
> > +#                to avoid unnecessarily flushing data to the backing file. Note
> > +#                that ``discard-data`` is only an optimization, and QEMU might
> > +#                not discard file contents if it aborts unexpectedly or is
> > +#                terminated using SIGKILL. (default: false)
> > +#
> > +# @mem-path: the path to either a shared memory or huge page filesystem mount
> > +#
> > +# @pmem: specifies whether the backing file specified by @mem-path is in
> > +#        host persistent memory that can be accessed using the SNIA NVM
> > +#        programming model (e.g. Intel NVDIMM).
> > +#
> > +# @readonly: if true, the backing file is opened read-only; if false, it is
> > +#            opened read-write. (default: false)
> > +#
> > +# Since: 2.1
> > +##
> > +{ 'struct': 'MemoryBackendFileProperties',
> > +  'base': 'MemoryBackendProperties',
> > +  'data': { '*align': 'size',
> > +            '*discard-data': 'bool',
> > +            'mem-path': 'str',
> > +            '*pmem': 'bool',
> 
> To match the C code, this should be
>  '*pmem': { 'type':'bool', 'if':'defined(CONFIG_LIBPMEM)' },

Good catch, will fix.

> > +            '*readonly': 'bool' } }
> > +
> > +##
> > +# @MemoryBackendMemfdProperties:
> > +#
> > +# Properties for memory-backend-memfd objects.
> > +#
> > +# The @share boolean option is true by default with memfd.
> > +#
> > +# @hugetlb: if true, the file to be created resides in the hugetlbfs filesystem
> > +#           (default: false)
> > +#
> > +# @hugetlbsize: the hugetlb page size on systems that support multiple hugetlb
> > +#               page sizes (it must be a power of 2 value supported by the
> > +#               system). 0 selects a default page size. This option is ignored
> > +#               if @hugetlb is false. (default: 0)
> > +#
> > +# @seal: if true, create a sealed-file, which will block further resizing of
> > +#        the memory (default: true)
> > +#
> > +# Since: 2.12
> > +##
> > +{ 'struct': 'MemoryBackendMemfdProperties',
> > +  'base': 'MemoryBackendProperties',
> > +  'data': { '*hugetlb': 'bool',
> > +            '*hugetlbsize': 'size',
> > +            '*seal': 'bool' } }
> 
> backends/hostmem-memfd.c makes 'hugetlb' and 'hugetlbsize' conditional
> on qemu_memfd_check(MFD_HUGETLB), and only registers the overal type
> based on qemu_memfd_check(MFD_ALLOW_SEALING).  In turn, qemu_memfd_check
> returns false except for CONFIG_LINUX,...
> 
> > +
> >  ##
> >  # @ObjectType:
> >  #
> > @@ -287,7 +395,10 @@
> >      'cryptodev-backend-builtin',
> >      'cryptodev-vhost-user',
> >      'dbus-vmstate',
> > -    'iothread'
> > +    'iothread',
> > +    'memory-backend-file',
> > +    'memory-backend-memfd',
> > +    'memory-backend-ram'
> >    ] }
> >  
> >  ##
> > @@ -314,7 +425,10 @@
> >        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
> >        'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
> >        'dbus-vmstate':               'DBusVMStateProperties',
> > -      'iothread':                   'IothreadProperties'
> > +      'iothread':                   'IothreadProperties',
> > +      'memory-backend-file':        'MemoryBackendFileProperties',
> > +      'memory-backend-memfd':       'MemoryBackendMemfdProperties',
> 
> ...so I'm wondering if this branch should be:
> 
> 'memory-backend-memfd', { 'type':'MemoryBackendMemfdProperties',
>   'if': 'defined(CONFIG_LINUX)' },
> 
> and whether we are risking problems by always having the 'hugetlb*'
> fields even when the runtime does not register them.

I don't think that's necessarily a problem.

Later in the series we'll have some more object types in here that don't
actually work: Some of them are target dependent, but the code generated
from the schema is compiled only once. So if you configured multiple
targets, you'll get all of them in the schema for all system emulators,
even those that emulate a different target.

I'm hesitant to change this one because it feels a bit indirect. It
would be a much clearer case if we only compiled the source file for
CONFIG_LINUX instead of deciding at runtime.

*checks meson.build*

Wait, scratch that... We already do that in addition, so you can get
your 'if'. :-)

And while I'm at it, cryptodev-vhost-user is conditional on
CONFIG_VIRTIO_CRYPTO and CONFIG_VHOST_CRYPTO. The QAPI schema language
doesn't have a way to split strings across multiple lines? Because I'll
need more than 80 characters for this line then...

Kevin


