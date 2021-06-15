Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B83A87E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:41:38 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltD4D-0007ng-FR
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltD2B-0006fF-DC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltD28-0002bc-Kn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM5G0inhZLUzQJzMHG3GnG+h1YaDL9rhiern71blFXQ=;
 b=FuingQ9/O663mmDxVesSa0SqwhSVQxFLhtfge7v5bmtU/s1KUQDYSIJqQQnbVfdUZp5fFW
 DQdHAW7x/801gDHzja+IWsMHLCUhDEnKBC1sH3ZF9aej8H65t5QmyDCgwoZXR4xXG73UR6
 eVbPJ1XnEIA0lgTwkATjfGWUF/UZZWE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-wBCBrqzLMfeWXa1RL9AESQ-1; Tue, 15 Jun 2021 13:39:26 -0400
X-MC-Unique: wBCBrqzLMfeWXa1RL9AESQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso8925680wrf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lM5G0inhZLUzQJzMHG3GnG+h1YaDL9rhiern71blFXQ=;
 b=T0yL6LWMiG920FtNEXiqFsCGxonMqIMGc0y9NnfMSQQi1aXu5uMyqMGSEtLDwNscmb
 97lw+4rEVIO+2Teky9mbYjdxmarKii2libtmeHMAUAEZikD25+joK6RbCZc6xW3s2hZE
 dcS4b8hBj0w90b98XGqkopZtZ4eb+PPp1qttiAli7OccJd0Ssd2WbRoBODNO4JX11kN0
 mdZ4day6WQRcVqRIy2y52ow4u7dmax9Ge6zcnpWXXshYgMThyBV7Tiq7wbVMzSpjxS5i
 vnQ//pXF2N43O6k5Z3/8dowRvisqjRpVHYQzAtr1JStn1SiRDqorVAnYMUsFqiJT5Ex1
 YuIQ==
X-Gm-Message-State: AOAM53328PRxwSOw58B8CyvWIXiBdWBkMPU+8SQu/izHvdL4Z4Ujo9Ou
 5WakkkKjHaAaYXLrFXyrns51KsbixBA/5rwqpYKuEnNBUQSGlyPxekSnBZsdFx2E/6nMGpCjGLA
 04UxPPzTcSJ6TSzs=
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr245077wra.223.1623778764879; 
 Tue, 15 Jun 2021 10:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwonwPN89v5lbt5j7H6jIB9Bb9Cv5msK5VYk/QTzwIy0UGTQTU12BDzuNUUZalaZ1jteluwQ==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr245056wra.223.1623778764653; 
 Tue, 15 Jun 2021 10:39:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o11sm15547296wmq.1.2021.06.15.10.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:39:24 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] crypto: Make QCryptoTLSCreds* structures private
To: qemu-devel@nongnu.org
References: <20210615172746.2212998-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d960bfe7-1052-5cc0-2852-2b39a5295d92@redhat.com>
Date: Tue, 15 Jun 2021 19:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615172746.2212998-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 7:27 PM, Philippe Mathieu-Daudé wrote:
> Follow Daniel suggestion to simplify qcrypto TLS implementations,
> aiming to solve the OSX build failure.
> 
> Since v2:
> - Add Error* argument (Daniel)
> - Move structure definitions to "tlscredspriv.h"
> 
> Philippe Mathieu-Daudé (7):
>   crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper
>   block/nbd: Use qcrypto_tls_creds_check_endpoint()
>   chardev/socket: Use qcrypto_tls_creds_check_endpoint()
>   migration/tls: Use qcrypto_tls_creds_check_endpoint()
>   crypto/tlssession: Introduce qcrypto_tls_creds_check_endpoint() helper
>   ui/vnc: Use qcrypto_tls_session_check_role()
>   crypto: Make QCryptoTLSCreds* structures private
> 
>  crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
>  include/crypto/tls-cipher-suites.h |  6 ----
>  include/crypto/tlscreds.h          | 29 +++++++++----------
>  include/crypto/tlscredsanon.h      | 12 --------
>  include/crypto/tlscredspsk.h       | 12 --------
>  include/crypto/tlscredsx509.h      | 10 -------
>  include/crypto/tlssession.h        | 14 ++++++++++
>  block/nbd.c                        |  6 ++--
>  blockdev-nbd.c                     |  6 ++--
>  chardev/char-socket.c              | 18 ++++--------
>  crypto/tls-cipher-suites.c         |  7 +++++
>  crypto/tlscreds.c                  | 12 ++++++++
>  crypto/tlscredsanon.c              |  3 +-
>  crypto/tlscredspsk.c               |  3 +-
>  crypto/tlscredsx509.c              |  4 +--
>  crypto/tlssession.c                |  8 ++++++
>  migration/tls.c                    |  6 +---
>  ui/vnc.c                           |  6 ++--
>  18 files changed, 120 insertions(+), 87 deletions(-)

Sorry Daniel, today it is too hot inside :S

$ git checkout sev_builtin
error: Your local changes to the following files would be overwritten by
checkout:
        include/crypto/tlscreds.h
        include/crypto/tlssession.h
Please commit your changes or stash them before you switch branches.
Aborting
$ git diff
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index 41b8939d417..2a8a8570109 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -53,6 +53,7 @@ struct QCryptoTLSCredsClass {
  * qcrypto_tls_creds_check_endpoint:
  * @creds: pointer to a TLS credentials object
  * @endpoint: type of network endpoint that will be using the credentials
+ * @errp: pointer to a NULL-initialized error object
  *
  * Check whether the credentials is setup according to
  * the type of @endpoint argument.
diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 657a2c05521..2fb0bb02d9f 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -166,6 +166,7 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoTLSSession,
qcrypto_tls_session_free)
  * qcrypto_tls_session_check_role:
  * @creds: pointer to a TLS credentials object
  * @endpoint: role of the TLS session, client or server
+ * @errp: pointer to a NULL-initialized error object
  *
  * Check whether the session object operates according to
  * the role of the @endpoint argument.


