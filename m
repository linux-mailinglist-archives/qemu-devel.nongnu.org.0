Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015D4DB36B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:38:20 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUn5-000842-2U
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:38:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUeW-00060M-7z
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUUeT-00079s-JE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647440964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WY3NWJWWoIvuwPx9Z9Ikpt53QpRe+U9kXa6keeILGiM=;
 b=O6ljUvIfaRSgQ5Hb5EFKVU1F9rBIy7Umzao+mj6z4Y2uqUTQ3g7FfW7sWYaIyOiks4SKys
 84o16sZ/ItMOp9IJJZe2//H638q2MltO811PsYD9yW1N5hf/CZveZgFOKuNb7LkU+XnSsn
 XcX+r+bQacAj57eoDFL2OIR7qGLJWo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-dC35KmsqNHi1YxnvKq4VoA-1; Wed, 16 Mar 2022 10:29:23 -0400
X-MC-Unique: dC35KmsqNHi1YxnvKq4VoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD7418037A4;
 Wed, 16 Mar 2022 14:29:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3E43112C087;
 Wed, 16 Mar 2022 14:28:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8249621E66D2; Wed, 16 Mar 2022 15:28:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v3 2/3] util/main-loop: Introduce the main loop into QOM
References: <20220316135321.142850-1-nsaenzju@redhat.com>
 <20220316135321.142850-3-nsaenzju@redhat.com>
Date: Wed, 16 Mar 2022 15:28:57 +0100
In-Reply-To: <20220316135321.142850-3-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Wed, 16 Mar 2022 14:53:22 +0100")
Message-ID: <877d8uug2e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:

> 'event-loop-base' provides basic property handling for all 'AioContext'
> based event loops. So let's define a new 'MainLoopClass' that inherits
> from it. This will permit tweaking the main loop's properties through
> qapi as well as through the command line using the '-object' keyword[1].
> Only one instance of 'MainLoopClass' might be created at any time.
>
> 'EventLoopBaseClass' learns a new callback, 'can_be_deleted()' so as to
> mark 'MainLoop' as non-deletable.
>
> [1] For example:
>       -object main-loop,id=main-loop,aio-max-batch=<value>
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..10800166e8 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -528,6 +528,19 @@
>              '*poll-shrink': 'int',
>              '*aio-max-batch': 'int' } }
>  
> +##
> +# @MainLoopProperties:
> +#
> +# Properties for the main-loop object.
> +#
> +# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> +#                 0 means that the engine will use its default (default:0)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'MainLoopProperties',
> +  'data': { '*aio-max-batch': 'int' } }
> +

IothreadProperties has the same member, with the same documentation.

Do main loop and iothreads have a common ancestor, conceptually?

If yes, it might make sense for MainLoopProperties and
IothreadProperties to have a common base type, and put @aio-max-batch
there.  This is not a demand.

>  ##
>  # @MemoryBackendProperties:
>  #
> @@ -818,6 +831,7 @@
>      { 'name': 'input-linux',
>        'if': 'CONFIG_LINUX' },
>      'iothread',
> +    'main-loop',
>      { 'name': 'memory-backend-epc',
>        'if': 'CONFIG_LINUX' },
>      'memory-backend-file',
> @@ -883,6 +897,7 @@
>        'input-linux':                { 'type': 'InputLinuxProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'iothread':                   'IothreadProperties',
> +      'main-loop':                  'MainLoopProperties',
>        'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-file':        'MemoryBackendFileProperties',

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


