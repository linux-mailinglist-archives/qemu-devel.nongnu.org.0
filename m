Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6B246D6C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 18:56:13 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7iQf-0003jp-0S
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 12:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7iPi-00032r-3f
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:55:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54412
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k7iPg-0001AR-E6
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 12:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597683311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vO4TsoQFTQkStCcuR6bDd4i2vIoMnuT7cFQpNdsMLaI=;
 b=gwkVef09h+1tkYEih0NjpC5vEoO6CZFcVQc732oNwtyNR09wqm5G5kzGH01VurYprBGOA3
 jw59UbskOPfDt2CTUGLLdyb9am869blfaL/B6y1LVCTD4C+fU3tF5wHFbhh+KIUJ3kJV1r
 d+iiHRqMzp+R/RiamMccngeSnr9UH5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-gnZtzgn9MKiQEgZfIqIQLw-1; Mon, 17 Aug 2020 12:55:09 -0400
X-MC-Unique: gnZtzgn9MKiQEgZfIqIQLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC82D81F010;
 Mon, 17 Aug 2020 16:55:07 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8CB101417B;
 Mon, 17 Aug 2020 16:55:06 +0000 (UTC)
Date: Mon, 17 Aug 2020 17:55:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/17] crypto: Allocate QCryptoCipher with the subclass
Message-ID: <20200817165503.GQ4775@redhat.com>
References: <20200813032537.2888593-1-richard.henderson@linaro.org>
 <20200813032537.2888593-9-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200813032537.2888593-9-richard.henderson@linaro.org>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:03:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 12, 2020 at 08:25:28PM -0700, Richard Henderson wrote:
> Merge the allocation of "opaque" into the allocation of "cipher".
> This is step one in reducing the indirection in these classes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  crypto/afalgpriv.h          |  3 ++
>  crypto/cipherpriv.h         |  2 +-
>  include/crypto/cipher.h     |  1 -
>  crypto/cipher-afalg.c       | 20 ++++++-----
>  crypto/cipher-builtin.inc.c | 68 +++++++++++++++++++------------------
>  crypto/cipher-gcrypt.inc.c  | 23 +++++++------
>  crypto/cipher-nettle.inc.c  | 24 +++++++------
>  crypto/cipher.c             | 20 ++++-------
>  8 files changed, 84 insertions(+), 77 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


