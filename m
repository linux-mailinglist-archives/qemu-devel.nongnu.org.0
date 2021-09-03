Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3813400756
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:14:04 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGVf-0002C4-Mk
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGT6-0006FF-B9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:11:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGT2-0000jE-71
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630703479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=509e9qQPKk67PxlHPsH5v8Hs84kOus8xl5Bui86n/Ks=;
 b=KfXt50RnkIhGIRZTfbAbgqG8/gNTys3FzYdeiQo04vh/F9r6JaLJAgP+hmG0xF4LaZVhLe
 bAWmhrxEnvtOzbQZqRYpQV5xK5DlFjmeuQcUmTGaq8JpKPpfCDJIDeCx2BpSuF6HNDYnZl
 Fhjqjepa2Ekt+cRlkBC/0bfw8u1XSu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-XUxF0OF-Nt-xuIdsl4bAvQ-1; Fri, 03 Sep 2021 17:11:15 -0400
X-MC-Unique: XUxF0OF-Nt-xuIdsl4bAvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8464418397A3;
 Fri,  3 Sep 2021 21:11:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB30B10016F4;
 Fri,  3 Sep 2021 21:10:59 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:10:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 03/28] qapi: Replace g_memdup() by g_memdup2()
Message-ID: <20210903211057.kvn6r5pvx7iuwf5a@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-4-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 07:44:45PM +0200, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/qapi-clone-visitor.c | 16 ++++++++--------
>  qapi/qapi-visit-core.c    |  6 ++++--
>  2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
> index c45c5caa3b8..b014119d368 100644
> --- a/qapi/qapi-clone-visitor.c
> +++ b/qapi/qapi-clone-visitor.c
> @@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
>          return true;
>      }
>  
> -    *obj = g_memdup(*obj, size);
> +    *obj = g_memdup2(*obj, size);

I did not audit whether any callers were previously vulnerable,
although I suspect most (if not all) callers were from the generated
QAPI code passing in the results of sizeof, and none of our QAPI types
are 4G large to cause overflow.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


