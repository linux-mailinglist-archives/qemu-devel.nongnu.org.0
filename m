Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3E484817
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:52:23 +0100 (CET)
Received: from localhost ([::1]:44106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ov0-0001kZ-0s
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:52:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4onN-0005mH-9u
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4onL-0007xe-B1
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641321866;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6CGT+trdRuujURpK1psMiFidPx068lat9wSkAi6MQI=;
 b=YX42ygDzG+4KUzPf+ZpHidnLTq+UuGKiKhABRkwKcQDlF/OYbLQQhGrOAvcxrDgcfHYJKt
 tEyx6d2PoGr5n1s5CSsXepjRjOiX/6kfAGHGwz6pRmD9Uh1yqTb+9DVxvWct5m9D4o87UL
 7KWokP6rYRJ4Kl5IG1hFNWzDF4hJ+LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-MXFPWKsJNtmj693l_BpMcg-1; Tue, 04 Jan 2022 13:44:23 -0500
X-MC-Unique: MXFPWKsJNtmj693l_BpMcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 539C8190A7A6;
 Tue,  4 Jan 2022 18:44:22 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 188B58032C;
 Tue,  4 Jan 2022 18:44:20 +0000 (UTC)
Date: Tue, 4 Jan 2022 18:44:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Subject: Re: [PATCH 2/2] [crypto] Only verify CA certs in chain of trust
Message-ID: <YdSVgnQ6+JfeePAl@redhat.com>
References: <20211222150600.37677-1-henry.kleynhans@gmail.com>
 <20211222150600.37677-2-henry.kleynhans@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211222150600.37677-2-henry.kleynhans@gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, qemu-devel@nongnu.org,
 henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 03:06:00PM +0000, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
> 
> The CA file provided to qemu may contain CA certificates which do not
> form part of the chain of trust for the specific certificate we are
> sanity checking.
> 
> This patch changes the sanity checking from validating every CA
> certificate to only checking the CA certificates which are part of the
> chain of trust (issuer chain).  Other certificates are ignored.
> 
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  crypto/tlscredsx509.c                 | 50 +++++++++++++++++++++++----
>  tests/unit/test-crypto-tlscredsx509.c | 25 +++++++++++++-
>  2 files changed, 68 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
> index d061c68253..841f80aac6 100644
> --- a/crypto/tlscredsx509.c
> +++ b/crypto/tlscredsx509.c
> @@ -315,6 +315,44 @@ qcrypto_tls_creds_check_cert(QCryptoTLSCredsX509 *creds,
>      return 0;
>  }
>  
> +static int
> +qcrypto_tls_creds_check_authority_chain(QCryptoTLSCredsX509 *creds,
> +                                        gnutls_x509_crt_t cert,
> +                                        gnutls_x509_crt_t *cacerts,
> +                                        unsigned int ncacerts,
> +                                        const char *cacertFile,
> +                                        bool isServer,
> +                                        bool isCA,
> +                                        Error **errp)
> +{
> +    gnutls_x509_crt_t *cert_to_check = &cert;
> +    int checking_issuer = 1;
> +    int retval = 0;
> +
> +    while (checking_issuer) {
> +        checking_issuer = 0;
> +
> +        if (gnutls_x509_crt_check_issuer(*cert_to_check, *cert_to_check)) {
> +            /* The cert is self-signed indicating we have reached the root of trust. */
> +            return qcrypto_tls_creds_check_cert(creds, *cert_to_check, cacertFile,
> +                                                isServer, isCA, errp);
> +        }
> +        for (int i = 0; i < ncacerts; i++) {
> +            if (gnutls_x509_crt_check_issuer(*cert_to_check, cacerts[i])) {
> +                retval = qcrypto_tls_creds_check_cert(creds, cacerts[i], cacertFile,
> +                                                      isServer, isCA, errp);
> +                if (retval < 0) {
> +                    return retval;
> +                }
> +                cert_to_check = &cacerts[i];
> +                checking_issuer = 1;
> +                break;
> +            }
> +        }
> +    }
> +
> +    return -1;

I have a feeling this should be 'return 0'.  eg consider the case
where the cacert.pem does not contain the issuer of clientcert.pem.
we will only do one iteration of the while(checking_issuer) loop,
not hitting any of the 'return' statements. This is ok, so should
report success I think.

> +}
>  
>  static int
>  qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
> @@ -500,12 +538,12 @@ qcrypto_tls_creds_x509_sanity_check(QCryptoTLSCredsX509 *creds,
>          goto cleanup;
>      }
>  
> -    for (i = 0; i < ncacerts; i++) {
> -        if (qcrypto_tls_creds_check_cert(creds,
> -                                         cacerts[i], cacertFile,
> -                                         isServer, true, errp) < 0) {
> -            goto cleanup;
> -        }
> +    if (cert && 
> +        qcrypto_tls_creds_check_authority_chain(creds, cert, 
> +                                                cacerts, ncacerts,
> +                                                cacertFile, isServer,
> +                                                true, errp) < 0) {
> +        goto cleanup;
>      }
>  
>      if (cert && ncacerts &&
> diff --git a/tests/unit/test-crypto-tlscredsx509.c b/tests/unit/test-crypto-tlscredsx509.c
> index aab4149b56..e4d657ba61 100644
> --- a/tests/unit/test-crypto-tlscredsx509.c
> +++ b/tests/unit/test-crypto-tlscredsx509.c
> @@ -589,6 +589,12 @@ int main(int argc, char **argv)
>                   true, true, GNUTLS_KEY_KEY_CERT_SIGN,
>                   false, false, NULL, NULL,
>                   0, 0);
> +    TLS_CERT_REQ(cacertlevel1creq_invalid, cacertrootreq,
> +                 "UK", "qemu level 1c invalid", NULL, NULL, NULL, NULL,
> +                 true, true, true,
> +                 true, true, GNUTLS_KEY_KEY_CERT_SIGN,
> +                 false, false, NULL, NULL,
> +                 360, 400);
>      TLS_CERT_REQ(cacertlevel2areq, cacertlevel1areq,
>                   "UK", "qemu level 2a", NULL, NULL, NULL, NULL,
>                   true, true, true,
> @@ -617,16 +623,32 @@ int main(int argc, char **argv)
>          cacertlevel2areq.crt,
>      };
>  
> +
>      test_tls_write_cert_chain(WORKDIR "cacertchain-ctx.pem",
>                                certchain,
>                                G_N_ELEMENTS(certchain));
>  
> +    gnutls_x509_crt_t certchain_with_invalid[] = {
> +        cacertrootreq.crt,
> +        cacertlevel1areq.crt,
> +        cacertlevel1breq.crt,
> +        cacertlevel1creq_invalid.crt,
> +        cacertlevel2areq.crt,
> +    };
> +
> +    test_tls_write_cert_chain(WORKDIR "cacertchain-with-invalid-ctx.pem",
> +                              certchain_with_invalid,
> +                              G_N_ELEMENTS(certchain_with_invalid));
> +
>      TLS_TEST_REG(chain1, true,
>                   WORKDIR "cacertchain-ctx.pem",
>                   servercertlevel3areq.filename, false);
>      TLS_TEST_REG(chain2, false,
>                   WORKDIR "cacertchain-ctx.pem",
>                   clientcertlevel2breq.filename, false);
> +    TLS_TEST_REG(certchainwithexpiredcert, false,
> +                 WORKDIR "cacertchain-with-invalid-ctx.pem",
> +                 clientcertlevel2breq.filename, false);
>  
>      /* Some missing certs - first two are fatal, the last
>       * is ok
> @@ -640,7 +662,6 @@ int main(int argc, char **argv)
>      TLS_TEST_REG(missingclient, false,
>                   cacert1req.filename,
>                   "clientcertdoesnotexist.pem", false);
> -
>      ret = g_test_run();
>  
>      test_tls_discard_cert(&cacertreq);
> @@ -694,10 +715,12 @@ int main(int argc, char **argv)
>      test_tls_discard_cert(&cacertrootreq);
>      test_tls_discard_cert(&cacertlevel1areq);
>      test_tls_discard_cert(&cacertlevel1breq);
> +    test_tls_discard_cert(&cacertlevel1creq_invalid);
>      test_tls_discard_cert(&cacertlevel2areq);
>      test_tls_discard_cert(&servercertlevel3areq);
>      test_tls_discard_cert(&clientcertlevel2breq);
>      unlink(WORKDIR "cacertchain-ctx.pem");
> +    unlink(WORKDIR "cacertchain-with-invalid-ctx.pem");
>  
>      test_tls_cleanup(KEYFILE);
>      rmdir(WORKDIR);
> -- 
> 2.34.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


