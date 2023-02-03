Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C2688FF4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 08:01:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNq3R-0005Qv-4m; Fri, 03 Feb 2023 02:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNq3I-0005Qd-AV
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNq3F-0003uZ-Ua
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 02:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675407600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=14GBqWCt7wgfWtpwCrnMK8usthbOu1ASK+PivO2RZf4=;
 b=DJHVqYxJ4C/1WP+wtuH1aj1nGli6/lwvN3Jk66nK0AlwhKkpqONBZGa8slDOZi5xZxf5G8
 awNhKERu0jnWytiElWFC7NNSMQ7EBlpTuLb4No5yNrUP5uZ8db+M1QANwvOlKToI5yDNAX
 cZOlhiORIw87PVIIZTHvJ2DdEfRMQoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-vrN4yY9APFyAp75X0vFI1w-1; Fri, 03 Feb 2023 01:59:56 -0500
X-MC-Unique: vrN4yY9APFyAp75X0vFI1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7165811E6E;
 Fri,  3 Feb 2023 06:59:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A642A404CD80;
 Fri,  3 Feb 2023 06:59:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 232BB21E6A1F; Fri,  3 Feb 2023 07:59:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: <qemu-devel@nongnu.org>,  Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Philippe Mathieu-Daude <philmd@linaro.org>,  Peter
 Xu <peterx@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Ashish Kalra <ashish.kalra@amd.com>
Subject: Re: [PATCH] hostmem-file: add offset option
References: <20230202225603.27559-1-graf@amazon.com>
Date: Fri, 03 Feb 2023 07:59:54 +0100
In-Reply-To: <20230202225603.27559-1-graf@amazon.com> (Alexander Graf's
 message of "Thu, 2 Feb 2023 22:56:03 +0000")
Message-ID: <877cwzgro5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alexander Graf <graf@amazon.com> writes:

> Add an option for hostmem-file to start the memory object at an offset
> into the target file. This is useful if multiple memory objects reside
> inside the same target file, such as a device node.
>
> In particular, it's useful to map guest memory directly into /dev/mem
> for experimentation.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index 30e76653ad..d4e16c57a3 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -649,6 +649,7 @@
>  { 'struct': 'MemoryBackendFileProperties',
>    'base': 'MemoryBackendProperties',
>    'data': { '*align': 'size',
> +            '*offset': 'size',
>              '*discard-data': 'bool',
>              'mem-path': 'str',
>              '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },

Looks like you forgot to document the new member.  You may want to ...

> diff --git a/qemu-options.hx b/qemu-options.hx
> index d59d19704b..2f12a9299e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4875,7 +4875,7 @@ SRST
>      they are specified. Note that the 'id' property must be set. These
>      objects are placed in the '/objects' path.
>  
> -    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
> +    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,offset=offset,readonly=on|off``
>          Creates a memory file backend object, which can be used to back
>          the guest RAM with huge pages.
>  
> @@ -4945,6 +4945,10 @@ SRST
>          such cases, users can specify the required alignment via this
>          option.
>  
> +        The ``offset`` option specifies the offset into the target file
> +        that the region starts at. You can use this parameter to overload
> +        multiple regions into a single file.
> +
>          The ``pmem`` option specifies whether the backing file specified
>          by ``mem-path`` is in host persistent memory that can be
>          accessed using the SNIA NVM programming model (e.g. Intel

... adapt the CLI documentation for it.

[...]


