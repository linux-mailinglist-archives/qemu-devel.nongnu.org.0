Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695136A9783
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4pC-0003RS-T8; Fri, 03 Mar 2023 07:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY4pA-0003RB-Ba
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY4p8-00086a-NW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677847665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1YAKg7BtgeaEZ0xj7p6x302w2n6TLwGJtnBjHQae8g=;
 b=CvDUESN2vgMsTmPmFU3fu0veORSSokFr8uN1Q0LvkQBCjGKOr5k9UBmKvfkquSgJ+Aib7p
 cV3etG3qfC7A2IB1ar+YliztDZoUoPBpbfZH5DmsrwQfE5NAVgqgdYNQy4UGqV7Htic5KK
 gbpIyD0+1s7mWTqQoOG5k7ZYWXTUqt4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-20fQhpWXOr6l3wHXnlwS0w-1; Fri, 03 Mar 2023 07:47:44 -0500
X-MC-Unique: 20fQhpWXOr6l3wHXnlwS0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so2776325wme.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e1YAKg7BtgeaEZ0xj7p6x302w2n6TLwGJtnBjHQae8g=;
 b=6nD83X5OruaYzGRyF8g8oiLHmvVNm5jWai2fu12lfJ1O5ElmHHTFjMnzgIap5TOHA8
 PrrSZq9zZi4CBJBMpfXNcrN2MoF7vor8SXuY/mn1dzvR9s2gGbC0XrB0FJ8YPD1Ansmg
 D6xZI2OIjPGZ5JoJfXwhUx8bT7V/vVF0Is1xfXK64imn661J/df8KDt4NbqDgmY3NJvj
 OKr9C2to4XcE+D2s95EiaSVDJV6M4/ioCT91TdGD8NmrVAb6bgvHE7ibTLeu8akXah+D
 KuOab1+NQnJUn7DjXRrBe9+5pDPwfs3Z4p6RPEfKiMNPyjYhVCeIjUstFESINSt3nkWT
 903A==
X-Gm-Message-State: AO0yUKXFueGrpXiPyvEbhHBjT2OMJ+MSyTjK026nfLFWE1AOcjzn4fcA
 j7fn8wTnGv1shrHmI+JmwKP7conXLL+PjV5YKzBKkmXCDtSmFfw2SSL5FZPuxezw/XQ3y/V5EER
 o272mQfUpP+Ie5Ao=
X-Received: by 2002:a05:600c:524b:b0:3eb:39e2:9156 with SMTP id
 fc11-20020a05600c524b00b003eb39e29156mr1502453wmb.5.1677847663070; 
 Fri, 03 Mar 2023 04:47:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+PLZsSOWSFVjLlz1le1R1F/w4QzBz88s9Gwq5O5T6vFXh94i74h28Nsl49d/nKNna4sxX3gA==
X-Received: by 2002:a05:600c:524b:b0:3eb:39e2:9156 with SMTP id
 fc11-20020a05600c524b00b003eb39e29156mr1502444wmb.5.1677847662844; 
 Fri, 03 Mar 2023 04:47:42 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d4445000000b002c70a0e2cd0sm2053695wrr.101.2023.03.03.04.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 04:47:42 -0800 (PST)
Message-ID: <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com>
Date: Fri, 3 Mar 2023 13:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] test: Fix test-crypto-secret when compiling without
 keyring support
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230301110058.1255-1-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230301110058.1255-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/03/2023 12.00, Juan Quintela wrote:
> Linux keyring support is protected by CONFIG_KEYUTILS.
> Use CONFIG_SECRET_KEYRING.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Previous version of this patch changed the meson build rules.
> Daniel told me that the proper fix was to change the #ifdef test.
> ---
>   tests/unit/test-crypto-secret.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

This seems to cause failures in the CI:

https://gitlab.com/thuth/qemu/-/jobs/3870672310#L1443
https://gitlab.com/thuth/qemu/-/jobs/3870672331#L2353

../tests/unit/test-crypto-secret.c:29:10: fatal error: keyutils.h: No such file or directory
    29 | #include <keyutils.h>
       |          ^~~~~~~~~~~~
compilation terminated.

And when building locally, I got:

FAILED: tests/unit/test-crypto-secret
tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_expired_key':
../../devel/qemu/tests/unit/test-crypto-secret.c:194: undefined reference to `add_key'
../../devel/qemu/tests/unit/test-crypto-secret.c:197: undefined reference to `keyctl_set_timeout'
../../devel/qemu/tests/unit/test-crypto-secret.c:212: undefined reference to `keyctl_unlink'
tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_revoked_key':
../../devel/qemu/tests/unit/test-crypto-secret.c:169: undefined reference to `add_key'
../../devel/qemu/tests/unit/test-crypto-secret.c:172: undefined reference to `keyctl_revoke'
../../devel/qemu/tests/unit/test-crypto-secret.c:186: undefined reference to `keyctl_unlink'
tests/unit/test-crypto-secret.p/test-crypto-secret.c.o: In function `test_secret_keyring_good':
../../devel/qemu/tests/unit/test-crypto-secret.c:141: undefined reference to `add_key'
../../devel/qemu/tests/unit/test-crypto-secret.c:155: undefined reference to `keyctl_unlink'
collect2: error: ld returned 1 exit status

  Thomas


