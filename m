Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D663A6DD7B4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:17:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmB3E-0007Tf-HG; Tue, 11 Apr 2023 06:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmB3B-0007TA-4v
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmB39-0004VZ-LC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681208191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdNuPIx2orCvPKxmQj67yAMtO4s9TDl0ZAJQ4scXeL4=;
 b=MvECpS/fcoy2eg0Mnx8OCf35MeEmpwGD5OGlMg+lwitr0spB62bAP6cJ9+tPvjc4Dce94i
 auKEFopWNhVwq7tBC8zQekvJyTJ7reUVmF0fBlTwj0xVvG5DZh8m0nCd7vo4rsU20Agy3l
 0encrYhDqEW6FH4yFeTznod6eXwrigo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-ub5OmVqrM0evlQVVRPWqAg-1; Tue, 11 Apr 2023 06:16:29 -0400
X-MC-Unique: ub5OmVqrM0evlQVVRPWqAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k29-20020a05600c1c9d00b003ee89ce8cc3so2364057wms.7
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 03:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdNuPIx2orCvPKxmQj67yAMtO4s9TDl0ZAJQ4scXeL4=;
 b=M2oBnz2OV6C8qaezRvg8AXNq4FR6HU4mqsLSWlfS0/49If+Dgb4hn+jATjh/Joj/Je
 V3HdcEtdoHgu6FuR17Dvqqm84ezYTk9hDEL0JvgbZBSct7re0+MKFWco9s3uOCvdZoSr
 D2Ki+awRjRNY3ExIx9yih6vN7NQMhi6/5Trc2o8CbRmDsl+Ah9y9E5fnZ69wSqNRzPDQ
 25XefQYmXxhDCcV3H83nNKBAx3b6IaZTMos6qTWP1qfgLiFSRbhe6LvVux8yiTs1Brv+
 XwaXPYETACHq1tMBWbUis3iE29Zt2ejNfzmwPj+dhvx4JthhkdkmX5qC8/Xa3T5zJbNA
 X91A==
X-Gm-Message-State: AAQBX9eRrnPAw2RVbDlOIt0YtGMEqX0vLGxs2Htxux9nu1aDpEmVnUjV
 Hc+8NLU/FF4k41dTAA4om5uTnj6PaOy6w2NulBmCZ8n5PkW6UhmtVB/pQ6DpD1AJayMYUfTGc0e
 D6dSMrYzSJOOLrPo=
X-Received: by 2002:a7b:ce95:0:b0:3ed:b4e8:630f with SMTP id
 q21-20020a7bce95000000b003edb4e8630fmr1586765wmj.10.1681208188476; 
 Tue, 11 Apr 2023 03:16:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zll7ip+489d19zW8gI6s/rR7/l5J+px+4Qe/kh7yY+Msp+XDe2Qi06KYcI4HM0gwPc77zGOA==
X-Received: by 2002:a7b:ce95:0:b0:3ed:b4e8:630f with SMTP id
 q21-20020a7bce95000000b003edb4e8630fmr1586752wmj.10.1681208188198; 
 Tue, 11 Apr 2023 03:16:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-153.web.vodafone.de.
 [109.43.179.153]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c315200b003ef6708bc1esm20858080wmo.43.2023.04.11.03.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:16:27 -0700 (PDT)
Message-ID: <849e915d-8628-9bd1-1b6b-9861027fcd3a@redhat.com>
Date: Tue, 11 Apr 2023 12:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] test: Fix test-crypto-secret when compiling without
 keyring support
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230411095156.6500-1-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230411095156.6500-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/04/2023 11.51, Juan Quintela wrote:
> Linux keyring support is protected by CONFIG_KEYUTILS.
> We also need CONFIG_SECRET_KEYRING.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> - Previous version of this patch changed the meson build rules.
>    Daniel told me that the proper fix was to change the #ifdef test.
> 
> - Change rule again.  We need both defines.
> - Now it passes the test with and without CONFIG_SECRET_KEYRING defined
> 
> ---
>   tests/unit/test-crypto-secret.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/unit/test-crypto-secret.c b/tests/unit/test-crypto-secret.c
> index 34a4aecc12..d31d97f36a 100644
> --- a/tests/unit/test-crypto-secret.c
> +++ b/tests/unit/test-crypto-secret.c
> @@ -24,7 +24,7 @@
>   #include "crypto/secret.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> -#ifdef CONFIG_KEYUTILS
> +#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
>   #include "crypto/secret_keyring.h"
>   #include <keyutils.h>
>   #endif
> @@ -128,7 +128,7 @@ static void test_secret_indirect_emptyfile(void)
>       g_free(fname);
>   }
>   
> -#ifdef CONFIG_KEYUTILS
> +#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
>   
>   #define DESCRIPTION "qemu_test_secret"
>   #define PAYLOAD "Test Payload"
> @@ -268,7 +268,7 @@ static void test_secret_keyring_bad_key_access_right(void)
>       keyctl_unlink(key, KEY_SPEC_PROCESS_KEYRING);
>   }
>   
> -#endif /* CONFIG_KEYUTILS */
> +#endif /* CONFIG_KEYUTILS && CONFIG_SECRET_KEYRING */
>   
>   static void test_secret_noconv_base64_good(void)
>   {
> @@ -571,7 +571,7 @@ int main(int argc, char **argv)
>       g_test_add_func("/crypto/secret/indirect/emptyfile",
>                       test_secret_indirect_emptyfile);
>   
> -#ifdef CONFIG_KEYUTILS
> +#if defined(CONFIG_KEYUTILS) && defined(CONFIG_SECRET_KEYRING)
>       g_test_add_func("/crypto/secret/keyring/good",
>                       test_secret_keyring_good);
>       g_test_add_func("/crypto/secret/keyring/revoked_key",
> @@ -582,7 +582,7 @@ int main(int argc, char **argv)
>                       test_secret_keyring_bad_serial_key);
>       g_test_add_func("/crypto/secret/keyring/bad_key_access_right",
>                       test_secret_keyring_bad_key_access_right);
> -#endif /* CONFIG_KEYUTILS */
> +#endif /* CONFIG_SECRET_KEYRING */

Nit: The comment after the "#endif" should mention both switches now, like 
the one earlier in the patch.

  Thomas


