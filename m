Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81A03C1A81
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:23:10 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aY9-0001bK-G7
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Zo1-0003P5-Lr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Zo0-00045W-1q
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625772927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K57PXdN/awrT+XJ0I9hm9xXf+rfU14QbvtGGf59+GgY=;
 b=FoIwtUHSI8Db7pW7iUvEtRPJqK4exAdeOspV5XULIBCfpIZ2ppz4Yzv9+GRDbKi1Vcot2D
 sAI4+LhENsS7BQ7oyEbQD5DTT6OiXLkUq9UZnaFq7lznWVCkl/KETVPUjKJWFKXMdWvpCh
 jF+U5qJ5RtSJW33BmKPCNPoNikMGyUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-nnOCq5nEPyKgyqCyCIDdCg-1; Thu, 08 Jul 2021 15:35:25 -0400
X-MC-Unique: nnOCq5nEPyKgyqCyCIDdCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22E66100B3AC
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 19:35:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C140189C7;
 Thu,  8 Jul 2021 19:35:21 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:35:19 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 16/18] crypto: add gnutls hmac provider
Message-ID: <20210708193519.yljm4vovvjup2e6y@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-17-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-17-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:22AM +0100, Daniel P. Berrangé wrote:
> This adds support for using gnutls as a provider of the crypto
> hmac APIs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/hmac-gnutls.c | 136 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 crypto/hmac-gnutls.c
> 
> diff --git a/crypto/hmac-gnutls.c b/crypto/hmac-gnutls.c
> new file mode 100644
> index 0000000000..ea33b5753b
> --- /dev/null
> +++ b/crypto/hmac-gnutls.c
> @@ -0,0 +1,136 @@
> +/*
> + * QEMU Crypto hmac algorithms
> + *
> + * Derived from hmac-gcrypt.c:
> + *
> + *   Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.

Is this line correct?

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * (at your option) any later version.  See the COPYING file in the
> + * top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "crypto/hmac.h"
> +#include "hmacpriv.h"
> +#include <gnutls/crypto.h>

Should you favor floating this to be right after "qemu/osdep.h"?

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


