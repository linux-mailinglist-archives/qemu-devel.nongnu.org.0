Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950754F697
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:22:34 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2A3d-0007d2-1n
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2A1d-0006Gm-IN
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o2A1X-00059t-Ar
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655464822;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vT3qoeUveuABIdyVcu4gMf9nyXLoswoWTaWYCPAJAVk=;
 b=KPVwCn0WDFLKYpP5M5/uMnD4RLUoEGKFLbxmAdnoGEmnDZE8ObmweVUBpdo1w+hcKUVbwo
 UDl5QyjGPzujGmWXzwwcVHF2NVLhFsXY0EcPbAwQYKHqkfHsAn9s9QSK1Pj7PJiprPZ3Tn
 T2kG22pQbvtQ0OiIsZ9pljq6jsJ+zRU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-KioskUjePH2vLCtn21UwtQ-1; Fri, 17 Jun 2022 07:20:19 -0400
X-MC-Unique: KioskUjePH2vLCtn21UwtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A8383C0ED4A;
 Fri, 17 Jun 2022 11:20:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A13552026985;
 Fri, 17 Jun 2022 11:20:17 +0000 (UTC)
Date: Fri, 17 Jun 2022 12:20:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 pizhenwei@bytedance.com, jasowang@redhat.com
Subject: Re: [PATCH 2/7] crypto: Support more ASN.1 types
Message-ID: <Yqxjb/9WTSmv5Kjw@redhat.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-3-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613084531.8086-3-helei.sig11@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Mon, Jun 13, 2022 at 04:45:26PM +0800, Lei He wrote:
> 1. support decoding of 'bit string','octet string',
> 'object id', and 'context specific tag' for DER decoder.
> 2. support encoding of int and sequence for DER decoder.
> 3. add test suites for the above changes.
> 
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> ---
>  crypto/der.c                 | 174 +++++++++++++++++++++++++++++++++++++------
>  crypto/der.h                 | 128 ++++++++++++++++++++++++++++++-
>  tests/unit/test-crypto-der.c | 126 +++++++++++++++++++++++++------
>  3 files changed, 382 insertions(+), 46 deletions(-)
> 
> diff --git a/crypto/der.c b/crypto/der.c
> index f877390bbb..edf2c6c313 100644
> --- a/crypto/der.c
> +++ b/crypto/der.c
> @@ -27,15 +27,68 @@ enum QCryptoDERTypeTag {
>      QCRYPTO_DER_TYPE_TAG_INT = 0x2,
>      QCRYPTO_DER_TYPE_TAG_BIT_STR = 0x3,
>      QCRYPTO_DER_TYPE_TAG_OCT_STR = 0x4,
> -    QCRYPTO_DER_TYPE_TAG_OCT_NULL = 0x5,
> -    QCRYPTO_DER_TYPE_TAG_OCT_OID = 0x6,
> +    QCRYPTO_DER_TYPE_TAG_NULL = 0x5,
> +    QCRYPTO_DER_TYPE_TAG_OID = 0x6,
>      QCRYPTO_DER_TYPE_TAG_SEQ = 0x10,
>      QCRYPTO_DER_TYPE_TAG_SET = 0x11,
>  };
>  
> -#define QCRYPTO_DER_CONSTRUCTED_MASK 0x20
> +enum QCryptoDERTagClass {
> +    QCRYPTO_DER_TAG_CLASS_UNIV = 0x0,
> +    QCRYPTO_DER_TAG_CLASS_APPL = 0x1,
> +    QCRYPTO_DER_TAG_CLASS_CONT = 0x2,
> +    QCRYPTO_DER_TAG_CLASS_PRIV = 0x3,
> +};
> +
> +enum QCryptoDERTagEnc {
> +    QCRYPTO_DER_TAG_ENC_PRIM = 0x0,
> +    QCRYPTO_DER_TAG_ENC_CONS = 0x1,
> +};
> +
> +#define QCRYPTO_DER_TAG_ENC_MASK 0x20
> +#define QCRYPTO_DER_TAG_ENC_SHIFT 5
> +
> +#define QCRYPTO_DER_TAG_CLASS_MASK 0xc0
> +#define QCRYPTO_DER_TAG_CLASS_SHIFT 6
> +
> +#define QCRYPTO_DER_TAG_VAL_MASK 0x1f
>  #define QCRYPTO_DER_SHORT_LEN_MASK 0x80
>  
> +#define QCRYPTO_DER_TAG(class, enc, val)        \
> +    (((class) << QCRYPTO_DER_TAG_CLASS_SHIFT) | \
> +     ((enc) << QCRYPTO_DER_TAG_ENC_SHIFT) | val)
> +
> +static void qcrypto_der_encode_data(const uint8_t *src, size_t src_len,
> +                                    uint8_t *dst, size_t *dst_len)
> +{
> +    size_t max_length = 0xFF;
> +    uint8_t length_bytes = 0, header_byte;
> +
> +    if (src_len < QCRYPTO_DER_SHORT_LEN_MASK) {
> +        header_byte = src_len;
> +        *dst_len = src_len + 1;
> +    } else {
> +        for (length_bytes = 1; max_length < src_len;) {
> +            length_bytes++;
> +            max_length = (max_length << 8) + max_length;
> +        }

Can't length_bytes++ be in the for clause like:

         for (length_bytes = 1; max_length < src_len;length_bytes++) {
             max_length = (max_length << 8) + max_length;
         }

?


Aside from that minor nitpick

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


