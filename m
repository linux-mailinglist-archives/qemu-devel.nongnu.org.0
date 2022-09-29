Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8A5EF4DB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:59:27 +0200 (CEST)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsCM-0006uc-NI
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrUZ-00067m-4J
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odrUS-00048Z-Qz
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664450042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AiyuRITLA+doX3felbvdDINKJ4G6V8t17rjeGTYFT90=;
 b=F7tkweMMgHjldrKYuhnN2S+vIWB950RfVtfXTa9yjKUoFnI/VNfz9hb/kugUJg5P6k0+i1
 l/lUOfzDw//mPyaDlOHR4J390UCMYcS06ohXTcmWhFXzD3aVIqnM9YjSShCAF4X/NlbYGq
 Xg/efhXg7GCMkcW9UZIj5C3F8MSTfpU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-pShE7TkNPS2o3MhsXlDOMw-1; Thu, 29 Sep 2022 07:14:01 -0400
X-MC-Unique: pShE7TkNPS2o3MhsXlDOMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BBD857F90;
 Thu, 29 Sep 2022 11:14:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 968E740C6EC2;
 Thu, 29 Sep 2022 11:14:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8767F21E691D; Thu, 29 Sep 2022 13:13:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v1 4/7] util: Add write-only "node-affinity" property
 for ThreadContext
References: <20220928164542.117952-1-david@redhat.com>
 <20220928164542.117952-5-david@redhat.com>
Date: Thu, 29 Sep 2022 13:13:59 +0200
In-Reply-To: <20220928164542.117952-5-david@redhat.com> (David Hildenbrand's
 message of "Wed, 28 Sep 2022 18:45:39 +0200")
Message-ID: <87a66itoug.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Let's make it easier to pin threads created via a ThreadContext to
> all current CPUs belonging to given NUMA nodes.
>
> As "node-affinity" is simply a shortcut for setting "cpu-affinity", that
> property cannot be read and if the CPUs for a node change due do CPU
> hotplug, the CPU affinity will not get updated.

Color me confused.

> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  qapi/qom.json         |  7 +++-
>  util/meson.build      |  2 +-
>  util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 4775a333ed..d36bf3355f 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -838,10 +838,15 @@
>  # @cpu-affinity: the CPU affinity for all threads created in the thread
>  #                context (default: QEMU main thread affinity)
>  #
> +# @node-affinity: shortcut for looking up the current CPUs for the given nodes
> +#                 and setting @cpu-affinity (default: QEMU main thread
> +#                 affinity)
> +#

Still confused.  Explain for dummies?  With an example, perhaps?

>  # Since: 7.2
>  ##
>  { 'struct': 'ThreadContextProperties',
> -  'data': { '*cpu-affinity': ['uint16'] } }
> +  'data': { '*cpu-affinity': ['uint16'],
> +            '*node-affinity': ['uint16'] } }
>  
>  
>  ##

[...]


