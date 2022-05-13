Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB48526256
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:51:23 +0200 (CEST)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUlO-0002Fh-Gj
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npUQE-0003A0-C8
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1npUQB-0007HB-42
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652444962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KwufUflIN0+si5g5sPE5FPx8DWaH5QC9MTJ9abHStk=;
 b=SxO8NglYj7UZWX7PZf69tMp5jxpfjRvs8/aMEx//WXfz+2t0kLHnXKJKLQCnXs9E/RP1xo
 fu9h9mRl23t9n7fIdd2aKhiW4NtqtlRZAT3Ncr8pKK0+MDKG9/DDulU5Ek8KM+a/7Tx728
 ZwDULd5byqaXjuzjPub3HHaebsZl1NY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-iVsCinzTPRipcbI6YnuQgg-1; Fri, 13 May 2022 08:29:19 -0400
X-MC-Unique: iVsCinzTPRipcbI6YnuQgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC60D1C05AF5;
 Fri, 13 May 2022 12:29:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F969C33AE5;
 Fri, 13 May 2022 12:29:16 +0000 (UTC)
Date: Fri, 13 May 2022 13:29:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>,
 "S. Tsirkin, Michael" <mst@redhat.com>, arei.gonglei@huawei.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [External] [PATCH v5 5/9] crypto: Implement RSA algorithm by
 hogweed
Message-ID: <Yn5PGWPbP9C4k4wD@redhat.com>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
 <20220428135943.178254-6-pizhenwei@bytedance.com>
 <Yn45CxgJ+KNIxXek@redhat.com>
 <90F3B18B-9B7E-423C-A909-45D4527A6B3C@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90F3B18B-9B7E-423C-A909-45D4527A6B3C@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Fri, May 13, 2022 at 08:26:14PM +0800, 何磊 wrote:
> 
> 
> > On May 13, 2022, at 6:55 PM, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Thu, Apr 28, 2022 at 09:59:39PM +0800, zhenwei pi wrote:
> >> From: Lei He <helei.sig11@bytedance.com>
> >> 
> >> Implement RSA algorithm by hogweed from nettle. Thus QEMU supports
> >> a 'real' RSA backend to handle request from guest side. It's
> >> important to test RSA offload case without OS & hardware requirement.
> >> 
> >> Signed-off-by: lei he <helei.sig11@bytedance.com>
> >> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> >> ---
> >> crypto/akcipher-nettle.c.inc | 432 +++++++++++++++++++++++++++++++++++
> >> crypto/akcipher.c            |   4 +
> >> crypto/meson.build           |   4 +
> >> crypto/rsakey-builtin.c.inc  | 209 +++++++++++++++++
> >> crypto/rsakey-nettle.c.inc   | 154 +++++++++++++
> >> crypto/rsakey.c              |  44 ++++
> >> crypto/rsakey.h              |  94 ++++++++
> >> meson.build                  |  11 +
> >> 8 files changed, 952 insertions(+)
> >> create mode 100644 crypto/akcipher-nettle.c.inc
> >> create mode 100644 crypto/rsakey-builtin.c.inc
> >> create mode 100644 crypto/rsakey-nettle.c.inc
> >> create mode 100644 crypto/rsakey.c
> >> create mode 100644 crypto/rsakey.h


> >> +static int qcrypto_nettle_rsa_decrypt(QCryptoAkCipher *akcipher,
> >> +                                      const void *enc, size_t enc_len,
> >> +                                      void *data, size_t data_len,
> >> +                                      Error **errp)
> >> +{
> >> +    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
> >> +    mpz_t c;
> >> +    int ret = -1;
> >> +    if (enc_len > rsa->priv.size) {
> >> +        error_setg(errp, "Invalid buffer size");
> >> +        return ret;
> >> +    }
> > 
> > Again please report the invalid & expected sizes in the message
> > 
> > We don't need to validate 'data_len' in the decrypt case,
> > as you did in encrypt ?
> 
> In the decrypt case, it is difficult (and unnecessary) to check 'data_len' before 
> we completing the decryption action. If the plaintext buffer is too small, 
> following ‘rsa_decrypt’ will return an error, and it should be valid to pass a very 
> large buffer.
> 
> According to the pkcs#1 stardard, the length of ciphertext should always equal
> to key size, and the length of plaintext can be any value in range [1, key_size - 11]:
> 
> https://datatracker.ietf.org/doc/html/rfc2437#section-7.2

Ok, thanks for explaining.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


