Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0250B6BB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:03:50 +0200 (CEST)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs0q-0001mR-Jp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhrER-0002Fi-2d
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhrEO-0007Wr-3e
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650626022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERPcih4iHuGxzuV00oGVFuu1CUr6xanQvZ+FZLDQQ+A=;
 b=PCWwkEZFaTcg3RXAzZGwciuEvQwjmVh8fLiMW2yN9aTGNRsAID1Jb08gZTfbWprv/bmpu6
 WuXtcpfp+/o1YbWXqppECh4R8CPFdt/mZfWH1qWZeScyf7g5nVw6EMcJosvqJATtrWgYMT
 fVozxkBdNUckS766bL1FO23W7wVocyY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-n7tFDQHQNmCs0AnSoICRTg-1; Fri, 22 Apr 2022 07:13:39 -0400
X-MC-Unique: n7tFDQHQNmCs0AnSoICRTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3D8F1E10B48;
 Fri, 22 Apr 2022 11:13:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9937A572354;
 Fri, 22 Apr 2022 11:13:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B1C821E6A1F; Fri, 22 Apr 2022 13:13:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v4 2/3] util/main-loop: Introduce the main loop into QOM
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-3-nsaenzju@redhat.com>
Date: Fri, 22 Apr 2022 13:13:37 +0200
In-Reply-To: <20220401093523.873508-3-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Fri, 1 Apr 2022 11:35:22 +0200")
Message-ID: <87r15pz7z2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
> index eeb5395ff3..e5f31c4469 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -499,6 +499,17 @@
>              '*repeat': 'bool',
>              '*grab-toggle': 'GrabToggleKeys' } }
>  
> +##
> +# @EventLoopBaseProperties:
> +#
> +# Common properties for objects derived from EventLoopBase

This makes sense as internal documentation: QAPI type
EventLoopBaseProperties is associated with C type EventLoopBase.  Doc
comments are *external* documentation: they go into the QEMU QMP
Reference Manual.

What about "Common properties for event loops"?

> +#
> +# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> +#                 0 means that the engine will use its default.

Missing:

   # Since: 7.1

Permit me a short digression.  We add these unthinkingly, because
thinking is expensive.  Even when the type isn't really part of the
external interface.  The deeper problem is that we're trying to generate
documentation of the external interface from doc comments that are
written as documentation of the internal QAPI data structures.  Here,
for example, we document EventLoopBaseProperties even though it is a
purely internal thing: whether we factor out common members into a base
type or not is not visible in QMP.

> +##
> +{ 'struct': 'EventLoopBaseProperties',
> +  'data': { '*aio-max-batch': 'int' } }
> +
>  ##
>  # @IothreadProperties:
>  #
> @@ -516,17 +527,26 @@
>  #               algorithm detects it is spending too long polling without
>  #               encountering events. 0 selects a default behaviour (default: 0)
>  #
> -# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> -#                 0 means that the engine will use its default
> -#                 (default:0, since 6.1)
> +# The @aio-max-batch option is available since 6.1.

This separates the member's "since" information from its defintion.
Can't be helped, because its defined in the base type, but the since
only applies here.  Okay.

>  #
>  # Since: 2.0
>  ##
>  { 'struct': 'IothreadProperties',
> +  'base': 'EventLoopBaseProperties',
>    'data': { '*poll-max-ns': 'int',
>              '*poll-grow': 'int',
> -            '*poll-shrink': 'int',
> -            '*aio-max-batch': 'int' } }
> +            '*poll-shrink': 'int' } }
> +
> +##
> +# @MainLoopProperties:
> +#
> +# Properties for the main-loop object.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'MainLoopProperties',
> +  'base': 'EventLoopBaseProperties',
> +  'data': {} }

The patch does two things:

1. Factor EventLoopBaseProperties out of IothreadProperties.

2. Create MainLoopProperties.

I'd split it.  This is not a demand.

>  
>  ##
>  # @MemoryBackendProperties:
> @@ -818,6 +838,7 @@
>      { 'name': 'input-linux',
>        'if': 'CONFIG_LINUX' },
>      'iothread',
> +    'main-loop',
>      { 'name': 'memory-backend-epc',
>        'if': 'CONFIG_LINUX' },
>      'memory-backend-file',
> @@ -883,6 +904,7 @@
>        'input-linux':                { 'type': 'InputLinuxProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'iothread':                   'IothreadProperties',
> +      'main-loop':                  'MainLoopProperties',
>        'memory-backend-epc':         { 'type': 'MemoryBackendEpcProperties',
>                                        'if': 'CONFIG_LINUX' },
>        'memory-backend-file':        'MemoryBackendFileProperties',

[...]


