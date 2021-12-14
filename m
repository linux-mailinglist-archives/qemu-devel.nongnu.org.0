Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F847432D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:07:53 +0100 (CET)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7X6-0000Zq-LX
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:07:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx7Tv-0006ta-IR
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx7Tj-0008Af-Dg
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639487062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SucfDyR7x0r4iYRwa6hX2PbUXxIRDbRO4D9iBlSb7Rs=;
 b=bsNFaCaC7PU5YTPf4tapl59iQQ7IrUer+0vi709hlPHEHFyLhnE4ojtXRwnDPYB43rTVyg
 181xU4N6OYCFJWOjKEYoB3I6KW8gzTwHVj1JeJ98BB6sauklIaLl1sESJa3m7r3pktnTv1
 YmWv/KdIpU3o7NDjjZ3eDQ7+iUQ2a2w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-YHBUGWpnNauGSI10XK01LQ-1; Tue, 14 Dec 2021 08:04:19 -0500
X-MC-Unique: YHBUGWpnNauGSI10XK01LQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so4687675wrc.17
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SucfDyR7x0r4iYRwa6hX2PbUXxIRDbRO4D9iBlSb7Rs=;
 b=gIzyDxk9pSLxS2PU28S7VP5Nkz8ODj4CD3KRTcovc3PQ95Ux0fofAYZTbfspeV6C0l
 X4sscQWvUw6uXSKM8tD4gt+pJL8jsLSQYxXyQfXMbIc9CeCQWMUxdWgcvrdpokKHNhaW
 9BHzr48WVfA7VKw4EjSiD+kWs9GVSzgsePySAA+zszkGj7lgR664Zdqrmw7dowulomNq
 R5/ACwklmzdrJiUI7eXCfpmjtzdXvSsve5wZe7o/z2Fb5j7KxUmorGmFWjzlW768odKQ
 mtwJeEzpP0fh/p9ZyGTmUXDiqtDyoNS21JKlXfZRSNUWxAZGSnywjuk9RoFdKx0CkS65
 gX+Q==
X-Gm-Message-State: AOAM531PuXjuj20N+ZudshsNDkItRB/SAsywjei8A5HNLp4PMhdfdGnX
 HJ6ZJoLzLURiLOCq/Hy7+OiZrS6AGa/Wa363eK5mbThTK+9dpBcmSnEEypGSy252VaNj6eIUlCF
 cld5YxA9LhyCkdi0=
X-Received: by 2002:adf:c992:: with SMTP id f18mr5603335wrh.574.1639487058655; 
 Tue, 14 Dec 2021 05:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPEeIIesLhw6fS7PWZglMwwS+ihChfeDqSa9lb/fY2z+O5eTY5dGF3OIMyS/fs+DCpsF1tRA==
X-Received: by 2002:adf:c992:: with SMTP id f18mr5603306wrh.574.1639487058409; 
 Tue, 14 Dec 2021 05:04:18 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d2sm1349277wra.61.2021.12.14.05.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:04:18 -0800 (PST)
Message-ID: <dfaa65b0-bc06-e8c4-2d09-4385c79d99a4@redhat.com>
Date: Tue, 14 Dec 2021 14:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Relax X509 CA cert sanity checking
To: Henry Kleynhans <henry.kleynhans@gmail.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20211214113930.9205-1-henry.kleynhans@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211214113930.9205-1-henry.kleynhans@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Henry,

Please Cc maintainers:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer
(doing it for you now).

On 12/14/21 12:39, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
> 
> The sanity checking function attempts to validate all the certificates
> in the provided CA file.  These checks are performed on certificates
> which may or may not be part of the signing chain and duplicates checks
> that should be performed by the TLS library.
> 
> In real life this causes a problem if the certificate chain I want to
> use is valid, but there exist another expired certificate in the CA
> file.
> 
> This patch relaxes the sanity checks to only ensure we have at least one
> valid certificate in the CA certificate file and leave the actual
> validation to the TLS library.

Since nobody complained so far, should we add this change as a boolean
property such "allow-expired-ca-certificate", default to false?

> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  crypto/tlscredsx509.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index 32948a6bdc..fb056f96a2 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -473,6 +473,7 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
>      gnutls_x509_crt_t cert = NULL;
>      gnutls_x509_crt_t cacerts[MAX_CERTS];
>      size_t ncacerts = 0;
> +    size_t nvalidca = 0;
>      size_t i;
>      int ret = -1;
>  
> @@ -505,11 +506,15 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
>      for (i = 0; i < ncacerts; i++) {
>          if (qcrypto_tls_creds_check_cert(creds,
>                                           cacerts[i], cacertFile,
> -                                         isServer, true, errp) < 0) {
> -            goto cleanup;
> +                                         isServer, true, errp) == 0) {
> +            ++nvalidca;
>          }
>      }
>  
> +    if (nvalidca == 0) {
> +        goto cleanup;
> +    }
> +
>      if (cert && ncacerts &&
>          qcrypto_tls_creds_check_cert_pair(cert, certFile, cacerts,
>                                            ncacerts, cacertFile,
> 


