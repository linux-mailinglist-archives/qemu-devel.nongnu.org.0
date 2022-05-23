Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29425530C62
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:45:50 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4dI-0006CO-SB
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4Zc-00049S-QD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt4Za-0008KL-Kk
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653298918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IhiwstYkYYpaHuAFd5FkcFzkEqA7mNU5eF+1/Zp3w0k=;
 b=AVq0GqWUEUYxaGErHN/SURHp5zuvX6zmxZU+MkOoj9Vuizgffl6CoQtHG2gU707dWltQSu
 V5F8bXjL2MZz1CU3y97IyzYwySeK5dpOjqpP1XuXCRnhbnfgW5Yv6Jy1c6WuE5shhmfi9E
 40EkQAWymOy5gl84CwkIqNZGEZ5eS2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-qjyrpEHGMsuhgHCdhThIvA-1; Mon, 23 May 2022 05:41:54 -0400
X-MC-Unique: qjyrpEHGMsuhgHCdhThIvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4202A101A52C;
 Mon, 23 May 2022 09:41:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD5E1410DD5;
 Mon, 23 May 2022 09:41:52 +0000 (UTC)
Date: Mon, 23 May 2022 10:41:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v6 5/9] crypto: Implement RSA algorithm by hogweed
Message-ID: <YotW3ikMeeXAvs8/@redhat.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
 <20220514005504.1042884-6-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220514005504.1042884-6-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

On Sat, May 14, 2022 at 08:55:00AM +0800, zhenwei pi wrote:
> From: Lei He <helei.sig11@bytedance.com>
> 
> Implement RSA algorithm by hogweed from nettle. Thus QEMU supports
> a 'real' RSA backend to handle request from guest side. It's
> important to test RSA offload case without OS & hardware requirement.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  crypto/akcipher-nettle.c.inc | 451 +++++++++++++++++++++++++++++++++++
>  crypto/akcipher.c            |   4 +
>  crypto/meson.build           |   4 +
>  crypto/rsakey-builtin.c.inc  | 200 ++++++++++++++++
>  crypto/rsakey-nettle.c.inc   | 158 ++++++++++++
>  crypto/rsakey.c              |  44 ++++
>  crypto/rsakey.h              |  94 ++++++++
>  meson.build                  |  11 +
>  8 files changed, 966 insertions(+)
>  create mode 100644 crypto/akcipher-nettle.c.inc
>  create mode 100644 crypto/rsakey-builtin.c.inc
>  create mode 100644 crypto/rsakey-nettle.c.inc
>  create mode 100644 crypto/rsakey.c
>  create mode 100644 crypto/rsakey.h
> 
> diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
> new file mode 100644
> index 0000000000..0796bddcaa
> --- /dev/null
> +++ b/crypto/akcipher-nettle.c.inc

> +static int qcrypto_nettle_rsa_encrypt(QCryptoAkCipher *akcipher,
> +                                      const void *data, size_t data_len,
> +                                      void *enc, size_t enc_len,
> +                                      Error **errp)
> +{
> +
> +    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
> +    mpz_t c;
> +    int ret = -1;
> +
> +    if (data_len > rsa->pub.size) {
> +        error_setg(errp, "Plaintext length should be less than key size: %lu",
> +                   rsa->pub.size);
> +        return ret;
> +    }

This needs to include both the good & bad values. I'm going to make
the following changes to error messages:

ie

+        error_setg(errp, "Plaintext length %zu is greater than key size: %lu"
+                   data_len, rsa->pub.size);
         return ret;
     }


But also the '%lu' needs to change to '%zu' because the rsa->pub.size
parameter is 'size_t'.  %lu doesn't match size_t on 32-bit hosts.

The same issues appear in several other error messages through this
file

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


