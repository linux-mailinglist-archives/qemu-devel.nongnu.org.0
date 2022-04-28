Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5002513065
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:56:27 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0sr-0003f3-Sa
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk0jg-0002z3-8n
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk0jd-00088N-9r
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36D7HaZ6K5XbhABPZn4LQk6yhDWuF2iBAWeSegHu85E=;
 b=fG7M0oTrLXHhzp6pFeIf72QvAVFoMGl+VJ/GJOw0aP46dZNw267Ynfmc7kiyolImEHmJkA
 FFzpu5jqXqaPKIc5UagkzZzqvpt2yJwkOU0nYXP3uRv0qqxrfTw25TcqC4LcDfgBWVkFXN
 3U94gPqWDGzoEIBERfMy7S3JM3h76WY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-oxLhtEwnOsWu_zdPm29npg-1; Thu, 28 Apr 2022 05:46:50 -0400
X-MC-Unique: oxLhtEwnOsWu_zdPm29npg-1
Received: by mail-wr1-f70.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso1721182wrg.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=36D7HaZ6K5XbhABPZn4LQk6yhDWuF2iBAWeSegHu85E=;
 b=xUKt2yoqJ7jzig/RgrSsSRrXPW2B3Vs6aIX0EassCmAbj6t4Lqu/O4mumxWkWAaLtL
 cVIUzVAxFws45kp9/hYyIj1jRsUez2sw1PuVSO3k5i1Fd6U7vh8EyLv5WovRnyU7C4zB
 ydpkKVX+71cd0TFwa9h1IS8C4kwRYawjKwXJhTKrSgo1KYP+GVF3zVnqFP4GDkL5Uqv6
 /LrqBhGAz6FTcXw02YWFTQRLQT57PFFanJH4vSt9HZhmypMVhEgRex5WZKYPKNb9tNiE
 bD7yfXqjAcp52NpKiHVcW6Etoobd+Y2ERBsAB+LEqtkjwZtBjUlYLk5TLIlqLKJf6wV1
 l0xQ==
X-Gm-Message-State: AOAM531Sk2jsbP+wJ57Sk3sywPrQZ4EEDr0SWfeMbDPA9zMAhGEsG4lk
 CmlejcRiJPpOxTtkOfVxVwrREhL3FAmsDTjoWRez8xEwTm5DD0ClVeHBA14RvtsAU8JTF1l1jg0
 wDkEs81kLkdTuejU=
X-Received: by 2002:a5d:49d0:0:b0:20a:de8b:8fc0 with SMTP id
 t16-20020a5d49d0000000b0020ade8b8fc0mr13816564wrs.79.1651139208913; 
 Thu, 28 Apr 2022 02:46:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAZ5Wawl7dKGTPEWzGdzhigupWcX+L4zNUPBAkeYbww39kOekEXdDgYiMo4JpblBa+sWxNsQ==
X-Received: by 2002:a5d:49d0:0:b0:20a:de8b:8fc0 with SMTP id
 t16-20020a5d49d0000000b0020ade8b8fc0mr13816547wrs.79.1651139208652; 
 Thu, 28 Apr 2022 02:46:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b00391447f7fd4sm4076360wmq.24.2022.04.28.02.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 02:46:48 -0700 (PDT)
Date: Thu, 28 Apr 2022 10:46:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/9] tests: fix encoding of IP addresses in x509 certs
Message-ID: <YmpiheB319XMmv5p@work-vm>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-2-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-2-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> We need to encode just the address bytes, not the whole struct sockaddr
> data. Add a test case to validate that we're matching on SAN IP
> addresses correctly.

Lets see:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/unit/crypto-tls-x509-helpers.c | 16 +++++++++++++---
>  tests/unit/test-crypto-tlssession.c  | 11 +++++++++--
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/unit/crypto-tls-x509-helpers.c b/tests/unit/crypto-tls-x509-helpers.c
> index fc609b3fd4..e9937f60d8 100644
> --- a/tests/unit/crypto-tls-x509-helpers.c
> +++ b/tests/unit/crypto-tls-x509-helpers.c
> @@ -168,9 +168,19 @@ test_tls_get_ipaddr(const char *addrstr,
>      hints.ai_flags = AI_NUMERICHOST;
>      g_assert(getaddrinfo(addrstr, NULL, &hints, &res) == 0);

test_tls_get_ipaddr is passed a char** data ptr that's then passed to
gnutls_x509_crt_set_subject_alt_name with GNUTLS_SAN_IPADDRESS, none of
which I know about, bu tthe manpage says:
  'GNUTLS_SAN_IPADDRESS as a binary IP address (4 or 16 bytes)'

so yes, it wants the IP not the full structure.

>  
> -    *datalen = res->ai_addrlen;
> -    *data = g_new(char, *datalen);
> -    memcpy(*data, res->ai_addr, *datalen);
> +    if (res->ai_family == AF_INET) {
> +        struct sockaddr_in *in = (struct sockaddr_in *)res->ai_addr;
> +        *datalen = sizeof(in->sin_addr);
> +        *data = g_new(char, *datalen);
> +        memcpy(*data, &in->sin_addr, *datalen);
> +    } else if (res->ai_family == AF_INET6) {
> +        struct sockaddr_in6 *in = (struct sockaddr_in6 *)res->ai_addr;
> +        *datalen = sizeof(in->sin6_addr);
> +        *data = g_new(char, *datalen);
> +        memcpy(*data, &in->sin6_addr, *datalen);
> +    } else {
> +        g_assert_not_reached();
> +    }
>      freeaddrinfo(res);

Yes, you could use g_memdup,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  }
>  
> diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
> index 5f0da9192c..a6935d8497 100644
> --- a/tests/unit/test-crypto-tlssession.c
> +++ b/tests/unit/test-crypto-tlssession.c
> @@ -512,12 +512,19 @@ int main(int argc, char **argv)
>                    false, true, "wiki.qemu.org", NULL);
>  
>      TEST_SESS_REG(altname4, cacertreq.filename,
> +                  servercertalt1req.filename, clientcertreq.filename,
> +                  false, false, "192.168.122.1", NULL);
> +    TEST_SESS_REG(altname5, cacertreq.filename,
> +                  servercertalt1req.filename, clientcertreq.filename,
> +                  false, false, "fec0::dead:beaf", NULL);
> +
> +    TEST_SESS_REG(altname6, cacertreq.filename,
>                    servercertalt2req.filename, clientcertreq.filename,
>                    false, true, "qemu.org", NULL);
> -    TEST_SESS_REG(altname5, cacertreq.filename,
> +    TEST_SESS_REG(altname7, cacertreq.filename,
>                    servercertalt2req.filename, clientcertreq.filename,
>                    false, false, "www.qemu.org", NULL);
> -    TEST_SESS_REG(altname6, cacertreq.filename,
> +    TEST_SESS_REG(altname8, cacertreq.filename,
>                    servercertalt2req.filename, clientcertreq.filename,
>                    false, false, "wiki.qemu.org", NULL);
>  
> -- 
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


