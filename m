Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA534AB5F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:22:11 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoHq-0006zl-TN
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoEz-0003ZT-1K
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoEx-0008KX-9W
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616771950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jaet349BmAZpFZIdAaCxLAwnCwBziRY4lDIn9qO+1qE=;
 b=VRv0dokKk+HuQBks3XMnom4lPCg/43RMVI3IVYlrJZFbFiv3/H/2YQ9j9iKka4jd5RjXHn
 wlUE6/by9EHPwaAqBijZVM0lbf+cUTWCqNlpAid0rjvaSrg6Yw1SVPZpQIB42VWppJD5/f
 pT5zo/B9WE3TU25BjXO+I3JgA7VsxJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-XTPqOcAkORClGUzqyYUjRA-1; Fri, 26 Mar 2021 11:19:08 -0400
X-MC-Unique: XTPqOcAkORClGUzqyYUjRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A377A18C89EB
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 15:18:56 +0000 (UTC)
Received: from [10.3.114.231] (ovpn-114-231.phx2.redhat.com [10.3.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22AFA5C8AB;
 Fri, 26 Mar 2021 15:18:56 +0000 (UTC)
Subject: Re: [PATCH v3 2/7] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210326092448.367016-1-kraxel@redhat.com>
 <20210326092448.367016-3-kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5fd58711-cb1f-c0c0-0f9b-6a93381a0a6d@redhat.com>
Date: Fri, 26 Mar 2021 10:18:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326092448.367016-3-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 4:24 AM, Gerd Hoffmann wrote:
> The vdagent protocol allows the guest agent (spice-vdagent) and the
> spice client exchange messages to implement features which require
> guest cooperation, for example clipboard support.
> 
> This is a qemu implementation of the spice client side.  This allows
> the spice guest agent talk to qemu directly when not using the spice
> protocol.
> 
> usage: qemu \
>   -chardev vdagent,id=vdagent \
>   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
> 
> This patch adds just the protocol basics: initial handshake and
> capability negotiation.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---

> +++ b/qapi/char.json
> @@ -390,6 +390,17 @@
>    'data': { '*size': 'int' },
>    'base': 'ChardevCommon' }
>  
> +##
> +# @ChardevVDAgent:
> +#
> +# Configuration info for vdagent.
> +#
> +# Since: 6.0
> +##

This feels like a new feature.  Are we still aiming to get it in 6.0, or
does this need an update to 6.1?



-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


