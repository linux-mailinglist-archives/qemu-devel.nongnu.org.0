Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34F571975
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:10:25 +0200 (CEST)
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEie-0000aB-0j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBEdx-0006kR-HK
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oBEdt-0001W1-IM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657627512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yt7SKqPnnqw5yWcDybAhdga3M7DjH2xk0Vw1zycKy9w=;
 b=G2PY6eVapcnr7iafh/eN7VcDJ+TNb/mKiy4GNdhXmKYISLn37MXVtkirQdo8MMMpyTOmH0
 yNsN2foowbTCo1+2roRgg+oW460H9BvuqsVEjZxfgdwEDV1kQHTQqTWymZDEF6n0BRdv/F
 DoWS9f7kXywog2fpJjQSKcyMiEgfMo0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-TLlTABIBMX2SzLtofUURvA-1; Tue, 12 Jul 2022 08:05:10 -0400
X-MC-Unique: TLlTABIBMX2SzLtofUURvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 t4-20020a1c7704000000b003a2cfaeca37so3669716wmi.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yt7SKqPnnqw5yWcDybAhdga3M7DjH2xk0Vw1zycKy9w=;
 b=LOK4MFpSrbMhpwbKUgNejzYWCQrn2CsWpkCwjI4DDW3W7dqOmJCJCTpvWLt1qyQKAt
 pFTEs+ukjDE7CvI3eyslk0LSAV3roH67anJyl/okW6ZLy9DtIcUfFGuI4FpmWSmy5zKD
 jd2l326oYGsTm7uuqibqjGlVMLqirnA3w0nPPumOZm6zHu1Ynyj4TaP94/aENtcIfzvd
 75VvQ5wyIImh0w+T9KG4I9gj8GRF3Vtir1kIl/h3kB2a0lXxJLLDr7vyn5SiBuvrOK3g
 Ub2CPgrzJQEeo4NvIPK6F1fj1MxRb0D8/esH+EOQPaSeOfZfpg3Pai92tXs7F4HDhcMe
 Wx0A==
X-Gm-Message-State: AJIora+JEh2xyiGBO0p2Ej6P13AZljMW8PXDPgzIA3llqQTU44dBEdCb
 z4u8nEeS2FwKn8HN1CrvYhyWkQOEmJnm9eARRSnKwROU8BwJ1GOU+wWkqlNlDaPRLceznjBpynl
 P1KHEJZqQGTGv/vY=
X-Received: by 2002:a5d:6d84:0:b0:21d:a7c7:d44a with SMTP id
 l4-20020a5d6d84000000b0021da7c7d44amr9190474wrs.710.1657627509495; 
 Tue, 12 Jul 2022 05:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkbP5wmrpP3x7/Xp8w550Kj0Rxv2Jhc/gdPR5RM6mQRbgDjaZVaCri/nTCYpUsgvzMptSiNA==
X-Received: by 2002:a5d:6d84:0:b0:21d:a7c7:d44a with SMTP id
 l4-20020a5d6d84000000b0021da7c7d44amr9190426wrs.710.1657627509169; 
 Tue, 12 Jul 2022 05:05:09 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b003a2e2ba94ecsm8497108wmq.40.2022.07.12.05.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:05:08 -0700 (PDT)
Date: Tue, 12 Jul 2022 13:05:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v6 12/13] qemu-sockets: update socket_uri() to be
 consistent with socket_parse()
Message-ID: <Ys1jck60PfCJPtXQ@work-vm>
References: <20220706062847.1396719-1-lvivier@redhat.com>
 <20220706064607.1397659-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706064607.1397659-1-lvivier@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> Remove 'tcp:' prefix for inet type (because inet can be 'tcp' or 'udp'
> and socket_parse() doesn't recognize it), the format is 'host:port'.

I don't think I understand why tests/qtest/migration-test.c
test_precopy_common is happy with this; it does:

    if (!args->connect_uri) {
        g_autofree char *local_connect_uri =
            migrate_get_socket_address(to, "socket-address");
        migrate_qmp(from, local_connect_uri, "{}");

which hmm, is the code you're changing what was in SocketAddress_to_str
which is what migrate_get_socket_address uses; but then the migrate_qmp
I don't think will take a migrate uri without the tcp: on the front.

Dave

> Use 'vsock:' prefix for vsock type rather than 'tcp:' because it makes
> a vsock address look like an inet address with CID misinterpreted as host.
> Goes back to commit 9aca82ba31 "migration: Create socket-address parameter"
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  util/qemu-sockets.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 870a36eb0e93..4cd76b3ae3af 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1102,7 +1102,7 @@ char *socket_uri(SocketAddress *addr)
>  {
>      switch (addr->type) {
>      case SOCKET_ADDRESS_TYPE_INET:
> -        return g_strdup_printf("tcp:%s:%s",
> +        return g_strdup_printf("%s:%s",
>                                 addr->u.inet.host,
>                                 addr->u.inet.port);
>      case SOCKET_ADDRESS_TYPE_UNIX:
> @@ -1111,7 +1111,7 @@ char *socket_uri(SocketAddress *addr)
>      case SOCKET_ADDRESS_TYPE_FD:
>          return g_strdup_printf("fd:%s", addr->u.fd.str);
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> +        return g_strdup_printf("vsock:%s:%s",
>                                 addr->u.vsock.cid,
>                                 addr->u.vsock.port);
>      default:
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


