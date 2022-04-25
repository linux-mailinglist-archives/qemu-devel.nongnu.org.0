Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82C50D8C9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 07:23:02 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nirBd-00080g-70
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 01:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nirA2-00071s-JN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nir9y-0006Sk-Vw
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 01:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650864076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8INWg1c4nl6Pz7H5KIzlVuU+gxwopIue9aOjDWvg4Pc=;
 b=XXsMHdpRWIxlHjlzjuzQZwlp2O6lNJv6eMBCkD7g/OdcEx53OSRm+tyFgBJr5baS88rs7Y
 ZdGiJ3sPofZM5NFS+GcedgMSlf+pbEjTbZHXGMGsgStxL/chya9UMzEN8oY/NuBbg7J52W
 iVj//DfOxynXFODj9fLxm4jlOeZE6Ek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-m_8I-pPjPRGisUv6RJn_Yg-1; Mon, 25 Apr 2022 01:21:14 -0400
X-MC-Unique: m_8I-pPjPRGisUv6RJn_Yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7595D800882;
 Mon, 25 Apr 2022 05:21:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86BBE111E411;
 Mon, 25 Apr 2022 05:21:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 696A621E6A1F; Mon, 25 Apr 2022 07:21:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v5 2/3] util/main-loop: Introduce the main loop into QOM
References: <20220422163857.703111-1-nsaenzju@redhat.com>
 <20220422163857.703111-3-nsaenzju@redhat.com>
Date: Mon, 25 Apr 2022 07:21:04 +0200
In-Reply-To: <20220422163857.703111-3-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Fri, 22 Apr 2022 18:38:56 +0200")
Message-ID: <87ilqxrb5r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> index a2439533c5..51f3acaad8 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -540,6 +540,16 @@
>              '*poll-grow': 'int',
>              '*poll-shrink': 'int' } }
>  
> +##
> +# @MainLoopProperties:
> +#
> +# Properties for the main-loop object.
> +#

Please add

   # Since: 7.1

> +##
> +{ 'struct': 'MainLoopProperties',
> +  'base': 'EventLoopBaseProperties',
> +  'data': {} }
> +
>  ##
>  # @MemoryBackendProperties:
>  #
> @@ -830,6 +840,7 @@
>      { 'name': 'input-linux',
>        'if': 'CONFIG_LINUX' },
>      'iothread',
> +    'main-loop',
>      { 'name': 'memory-backend-epc',
>        'if': 'CONFIG_LINUX' },
>      'memory-backend-file',
> @@ -895,6 +906,7 @@
>        'input-linux':                { 'type': 'InputLinuxProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'iothread':                   'IothreadProperties',
> +      'main-loop':                  'MainLoopProperties',
>        'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-file':        'MemoryBackendFileProperties',

[...]


