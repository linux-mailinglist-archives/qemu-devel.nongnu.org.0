Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91301522644
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 23:26:40 +0200 (CEST)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noXNP-0005pO-3H
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 17:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLn-0004Oy-Vn
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1noXLm-0003NX-FH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 17:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652217897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLL5xT3CB5Cc6D7Y+RFSH4qh38dRUSNttXEbdNItwn8=;
 b=eNCycunCjPqwNGquve11RDj488yv6e41AI0S2swpUFYvxTJjarbXyXa4QY5mTsqbBlthpo
 5/TGWfGQj4JkHJqhX1X4sm+WpVGX4V8ayvmu4+8vD+pbS/iKGT1T8uhT63IB9LVbHC1AJD
 nK2fiy4ktJaHNcGtGW83MGK3qHrQiqQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-3i8cu3CONcKbLxQKOj6dzQ-1; Tue, 10 May 2022 17:24:54 -0400
X-MC-Unique: 3i8cu3CONcKbLxQKOj6dzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69C001C068DE;
 Tue, 10 May 2022 21:24:54 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4E32024CB6;
 Tue, 10 May 2022 21:24:54 +0000 (UTC)
Date: Tue, 10 May 2022 23:24:51 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 4/6] net: socket-ng: make dgram_dst generic
Message-ID: <20220510232451.2ff891e8@elisabeth>
In-Reply-To: <20220509173618.467207-5-lvivier@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <20220509173618.467207-5-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
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

On Mon,  9 May 2022 19:36:16 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> dgram_dst is a sockaddr_in structure. To be able to use it with
> unix socket, use a pointer to a generic sockaddr structure.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  net/socket-ng.c | 76 ++++++++++++++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 30 deletions(-)
> 
> diff --git a/net/socket-ng.c b/net/socket-ng.c
> index 2c70440a2b57..0056924dc02b 100644
> --- a/net/socket-ng.c
> +++ b/net/socket-ng.c
>
> [...]
>
> @@ -903,13 +918,14 @@ static int net_socketng_udp_init(NetClientState *peer,
>      }
>  
>      if (remote) {
> -        s->dgram_dst = raddr_in;
> +        g_assert(s->dgram_dst == NULL);
> +        s->dgram_dst = dgram_dst;
>  
>          pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
>          g_free(info_str);
>      }
>      return 0;
> -}
> +};

Stray semicolon (I guess not reported by gcc without -pedantic).

-- 
Stefano


