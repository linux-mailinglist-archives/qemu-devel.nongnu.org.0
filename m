Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6254CC705
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:23:20 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPryp-0000mh-3k
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:23:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPrxz-0008NL-Dy
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPrxw-00012e-QQ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646338943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHrCeWT0r7aNZlIYu46ItAhOf9hx/6bc6ngJwDSCEKg=;
 b=ANqj4pg2DMqxvp/bUG8qC/5alAH7B4yXCWqZFRgalkAcEEB2ZJwYGEtwRHSzupT3NGROYG
 Gucja9LdcEv8TOz0H8LwK2Nk/U4avclXXUO0qfqEcKGU9NbutYbYULOh42jg1ywUh76/la
 7px+xHFe+hOjh7r/7xbpW3yrwTTxdmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-ap3-7gDPPt6djfZjHFEbvw-1; Thu, 03 Mar 2022 15:22:22 -0500
X-MC-Unique: ap3-7gDPPt6djfZjHFEbvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 482AE801AFE;
 Thu,  3 Mar 2022 20:22:21 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A11A25DF3A;
 Thu,  3 Mar 2022 20:22:15 +0000 (UTC)
Date: Thu, 3 Mar 2022 14:22:13 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/4] os-posix: Add os_set_daemonize()
Message-ID: <20220303202213.75wzcoz6f5t2hcfn@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-2-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 05:48:11PM +0100, Hanna Reitz wrote:
> The daemonizing functions in os-posix (os_daemonize() and
> os_setup_post()) only daemonize the process if the static `daemonize`
> variable is set.  Right now, it can only be set by os_parse_cmd_args().
> 
> In order to use os_daemonize() and os_setup_post() from the storage
> daemon to have it be daemonized, we need some other way to set this
> `daemonize` variable, because I would rather not tap into the system
> emulator's arg-parsing code.  Therefore, this patch adds an
> os_set_daemonize() function, which will return an error on os-win32
> (because daemonizing is not supported there).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---

> +++ b/include/sysemu/os-win32.h
> @@ -77,6 +77,11 @@ typedef struct {
>  } qemu_timeval;
>  int qemu_gettimeofday(qemu_timeval *tp);
>  
> +static inline int os_set_daemonize(bool d)
> +{
> +    return -ENOTSUP;

Should this fail only if d is true?  Or will all callers only ever
pass true, in which case why do we need the paraemeter?

> +}
> +
>  static inline bool is_daemonized(void)
>  {
>      return false;
> diff --git a/os-posix.c b/os-posix.c
> index ae6c9f2a5e..24692c8593 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -317,6 +317,12 @@ bool is_daemonized(void)
>      return daemonize;
>  }
>  
> +int os_set_daemonize(bool d)
> +{
> +    daemonize = d;
> +    return 0;
> +}
> +
>  int os_mlock(void)
>  {
>  #ifdef HAVE_MLOCKALL
> -- 
> 2.34.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


