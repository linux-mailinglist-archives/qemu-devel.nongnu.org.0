Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C14C8AD7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:33:17 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0km-0001dW-9B
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nP0hA-0008PK-9D
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nP0h8-0000F1-2U
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646134169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0HL3uBgn9cU2UHKmf6I2jcYMo0WIeEtHE7hfYrqro1M=;
 b=XTMprAltROhP4j5P4GU/Mrq7PeoN2/31UITHYOjXPAQytXExFQGCRELhOS+hfi57HAgbym
 IDIWnWXG/YRz00GmcUd3wnnE7lDkmpsTqCbNA1rXzseCb2pZGqh+ukXsiNLpzZfd7Ntu3M
 3mVNTm+/lPOkuZ7kkwXLibbGapWS6zI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-HG9RvruhMnuYztyyvWNrdA-1; Tue, 01 Mar 2022 06:29:28 -0500
X-MC-Unique: HG9RvruhMnuYztyyvWNrdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1726C293;
 Tue,  1 Mar 2022 11:29:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8B883195;
 Tue,  1 Mar 2022 11:29:22 +0000 (UTC)
Date: Tue, 1 Mar 2022 12:29:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v7 02/31] main loop: macros to mark GS and I/O functions
Message-ID: <Yh4DkABql0tkUyBi@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
 <20220211145153.2861415-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220211145153.2861415-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.02.2022 um 15:51 hat Emanuele Giuseppe Esposito geschrieben:
> Righ now, IO_CODE and IO_OR_GS_CODE are nop, as there isn't
> really a way to check that a function is only called in I/O.
> On the other side, we can use qemu_in_main_thread to check if
> we are in the main loop.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/main-loop.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index bc42b5939d..77adc51627 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -269,6 +269,15 @@ bool qemu_mutex_iothread_locked(void);
>   */
>  bool qemu_in_main_thread(void);
>  
> +/* Mark and check that the function is part of the global state API. */
> +#define GLOBAL_STATE_CODE() assert(qemu_in_main_thread())
> +
> +/* Mark and check that the function is part of the I/O API. */
> +#define IO_CODE() /* nop */
> +
> +/* Mark and check that the function is part of the "I/O OR GS" API. */
> +#define IO_OR_GS_CODE() /* nop */
> +

I don't think it is actually a problem with the current macro expansions
and the places where they are used are limited, but if you have to
respin, I'd consider wrapping things in the usual do { ... } while (0)
just to be sure.

Kevin


