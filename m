Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78174530C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:55:02 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4mD-0005vU-It
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4e6-0008WE-9Z
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4e3-0000tm-5l
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653299194;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hhtlmlKxSNsXkQSBYy7jFqr7wJq7OZFvbfv9iGDXvX4=;
 b=KBk+qJh3eEBf/CHYQ728Yzg9wSdFRYS35ziwf1LYw5Gp54xrrOXdIR18UOLLiEi2CUU5Um
 sZzWEIsAHuFHLDmRwStIe5f69Ud5rgbmYiHWr4dEe40s3yEqlw7WjMmoFocbRvHN6n7omV
 cWpAO9qH2sOoP94sBhDR0heV2Pk1jQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-9MW44G2oO_K3RO6XZJNU3Q-1; Mon, 23 May 2022 05:46:28 -0400
X-MC-Unique: 9MW44G2oO_K3RO6XZJNU3Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDBD9811E75;
 Mon, 23 May 2022 09:46:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1C4C27E8A;
 Mon, 23 May 2022 09:46:26 +0000 (UTC)
Date: Mon, 23 May 2022 10:46:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v6 4/9] crypto: add ASN.1 DER decoder
Message-ID: <YotX8KouIzrVjX2R@redhat.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
 <20220514005504.1042884-5-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220514005504.1042884-5-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 14, 2022 at 08:54:59AM +0800, zhenwei pi wrote:
> From: Lei He <helei.sig11@bytedance.com>
> 
> Add an ANS.1 DER decoder which is used to parse asymmetric
> cipher keys
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/der.c                 | 189 +++++++++++++++++++++++
>  crypto/der.h                 |  81 ++++++++++
>  crypto/meson.build           |   1 +
>  tests/unit/meson.build       |   1 +
>  tests/unit/test-crypto-der.c | 290 +++++++++++++++++++++++++++++++++++
>  5 files changed, 562 insertions(+)
>  create mode 100644 crypto/der.c
>  create mode 100644 crypto/der.h
>  create mode 100644 tests/unit/test-crypto-der.c
> 

> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index 264f2bc0c8..a8af85128d 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -47,6 +47,7 @@ tests = {
>    'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
>    'test-qapi-util': [],
>    'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
> +  'test-crypto-der': [crypto],
>  }

This needs to be moved to later in this file where the other
test-crypto-XXXX rules are, otherwise it fails to build
on a configuration  --without-system --without-tools.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


