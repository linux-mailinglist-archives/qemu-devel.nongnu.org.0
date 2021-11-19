Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946845721C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 16:49:32 +0100 (CET)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo68o-0006U5-Le
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 10:49:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo66x-0004xQ-5R
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mo66v-00086b-2N
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637336852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o6Pz+Sg1z2WaZN5GoYDHhZyuK5+vbk2mQu+3aDWlZ/I=;
 b=BPNJ0Hmw2oHAZDeAtYLxQaIfUYfa8XeHiM7M9s1QHZiECwqitMfBmqvf8ikBzbS/DFPJ5V
 NWYznD7MJ76EV+kiFxp8ZlaiNHe5WU+AU+v/XJ6ONMpsvcSiQ4XSfljSe40Ovs2RvcCNID
 8NkXHukrcQ2dGGCPS2FhrdDWGKDdFwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-PJ_A-BP6M4mT-IiTSoqz4g-1; Fri, 19 Nov 2021 10:47:28 -0500
X-MC-Unique: PJ_A-BP6M4mT-IiTSoqz4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4D418125C1;
 Fri, 19 Nov 2021 15:47:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22DB35E26A;
 Fri, 19 Nov 2021 15:47:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4B0811380A7; Fri, 19 Nov 2021 16:47:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH for 7.0 V10 2/6] util/qemu-sockets.c: Add
 inet_parse_base to handle InetSocketAddressBase
References: <20211112031112.9303-1-chen.zhang@intel.com>
 <20211112031112.9303-3-chen.zhang@intel.com>
Date: Fri, 19 Nov 2021 16:47:23 +0100
In-Reply-To: <20211112031112.9303-3-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 12 Nov 2021 11:11:08 +0800")
Message-ID: <87a6i05er8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I normally look only at the QAPI schema changes when I'm not a subject
matter expert, but today my gaze wandered...

Zhang Chen <chen.zhang@intel.com> writes:

> No need to carry the flag all the time in many scenarios.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  include/qemu/sockets.h |  1 +
>  util/qemu-sockets.c    | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 0c34bf2398..3a0f8fa8f2 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -32,6 +32,7 @@ int socket_set_fast_reuse(int fd);
>  int inet_ai_family_from_address(InetSocketAddress *addr,
>                                  Error **errp);
>  int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
> +int inet_parse_base(InetSocketAddressBase *addr, const char *str, Error **errp);
>  int inet_connect(const char *str, Error **errp);
>  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
>  
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 0585e7a629..f444921918 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -713,6 +713,20 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
>      return 0;
>  }
>  
> +int inet_parse_base(InetSocketAddressBase *base, const char *str, Error **errp)
> +{
> +    InetSocketAddress *addr;
> +    int ret = 0;
> +
> +    addr = g_new0(InetSocketAddress, 1);
> +    ret = inet_parse(addr, str, errp);
> +
> +    base->host = addr->host;
> +    base->port = addr->port;
> +
> +    g_free(addr);
> +    return ret;
> +}

This accepts all the funky flags inet_parse() accepts, then silently
ignores them.  I seriously doubt we want that.

>  
>  /**
>   * Create a blocking socket and connect it to an address.


