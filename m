Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555450B717
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:16:29 +0200 (CEST)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsD6-0007sm-Gq
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhrGb-0005d9-9J
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhrGV-0007sI-Dy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650626151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X49cwXjVWSePZ/dNIyBS9cxdqpwJALhzrGHRgX+vQ2k=;
 b=M7o4xMgxV4f0iSUuolPVHtI7xQ5v3Gx8iYaicZMSSmVscZecVslu4l5gEzcApY5J8y4mve
 FckDL3VoffBSTRb6orNGLVHazbRCuUhB9y7WLda5DtzpQAYAbJHFQtihjndcYrg1Jr9xCG
 VuGFzwODHASP+nncTxkIgZ4IksgR3yU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ArPi63opN_K7ZbM5LyBMlg-1; Fri, 22 Apr 2022 07:15:48 -0400
X-MC-Unique: ArPi63opN_K7ZbM5LyBMlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 534D9101AA44;
 Fri, 22 Apr 2022 11:15:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B8FC404D2F1;
 Fri, 22 Apr 2022 11:15:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A45421E6A1F; Fri, 22 Apr 2022 13:15:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v4 3/3] util/event-loop-base: Introduce options to set
 the thread pool size
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-4-nsaenzju@redhat.com>
Date: Fri, 22 Apr 2022 13:15:47 +0200
In-Reply-To: <20220401093523.873508-4-nsaenzju@redhat.com> (Nicolas Saenz
 Julienne's message of "Fri, 1 Apr 2022 11:35:23 +0200")
Message-ID: <87ilr1z7vg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

> The thread pool regulates itself: when idle, it kills threads until
> empty, when in demand, it creates new threads until full. This behaviour
> doesn't play well with latency sensitive workloads where the price of
> creating a new thread is too high. For example, when paired with qemu's
> '-mlock', or using safety features like SafeStack, creating a new thread
> has been measured take multiple milliseconds.
>
> In order to mitigate this let's introduce a new 'EventLoopBase'
> property to set the thread pool size. The threads will be created during
> the pool's initialization or upon updating the property's value, remain
> available during its lifetime regardless of demand, and destroyed upon
> freeing it. A properly characterized workload will then be able to
> configure the pool to avoid any latency spikes.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index e5f31c4469..06b8c3d10b 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -506,9 +506,17 @@
>  #
>  # @aio-max-batch: maximum number of requests in a batch for the AIO engine,
>  #                 0 means that the engine will use its default.
> +#
> +# @thread-pool-min: minimum number of threads readily available in the thread
> +#                   pool (default:0, since 7.1)

What do you mean by "readily available in the thread pool"?

> +#
> +# @thread-pool-max: maximum number of threads the thread pool can contain
> +#                   (default:64, since 7.1)
>  ##

If you add "Since: 7.1" in the previous patch, then the "since 7.1" here
need to go.

>  { 'struct': 'EventLoopBaseProperties',
> -  'data': { '*aio-max-batch': 'int' } }
> +  'data': { '*aio-max-batch': 'int',
> +            '*thread-pool-min': 'int',
> +            '*thread-pool-max': 'int' } }
>  
>  ##
>  # @IothreadProperties:

[...]


