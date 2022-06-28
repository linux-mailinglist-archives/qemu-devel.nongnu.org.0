Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7853455C992
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:57:10 +0200 (CEST)
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AmD-0003RO-AE
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AfO-0004TH-Ky
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AfM-0003rf-7W
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7hMuR6WaiIPf6N2uUkIWLm4fRumP1ClZDC/beJJGt8=;
 b=geksdBz5Fv87lqDp80lj9HVol42lHB9jWcgkL05BjBfX+v5/nL079HR+gJC1HCGiSgkxdZ
 lnK0Rxivs9lIjwhAhClSDaxbX3X8MWalJQZtyxjT6S/OPJWcxB3YcYyBQt6Vf5JkUvd95Z
 +2TFf7p2ztgbTgQ3OenecWmMRbo+ZHU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-1oWcU-lmNsyxQQscBp9MWA-1; Tue, 28 Jun 2022 08:50:02 -0400
X-MC-Unique: 1oWcU-lmNsyxQQscBp9MWA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z11-20020a056000110b00b0021b9c009d09so1789734wrw.17
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p7hMuR6WaiIPf6N2uUkIWLm4fRumP1ClZDC/beJJGt8=;
 b=K+jInKs/GNn6I9VpKgbydfmabHUbyS/CFPeC7lBTUAiI3yYOeiTQ7J7FxZ6UAvIpfk
 kI8A209AVqxYZYzDl6nDBvyjPooYihULshVVEJGL+AuyA+cnQoUDGpGsrRTleGWLBfYD
 ioKzcxdk4iBiuPO+JGhBh8qihCgMsRyoaNyqmFzAyY7XwtWMdmiymoRDR2cX0XLtyOPi
 Wl/CgUhEH/54N4cF9KCH9aKfgeO7YnDFB+u+duVe0X2wRBE6VAMPTL8W6fYvUmADZKOM
 PXXlVY94wHIkOgwfMVWAIBzCsD6030RWHRc+EymghSZaLrgEKpAAe/iGSz/9HCRwtPtJ
 nnEg==
X-Gm-Message-State: AJIora82HSv7tYYrewHY/DcS3f0PC3gUbuk+dNfnWXWYGqE0KQQ3l395
 /T3e2W3AUwnpmngcet8Wt2Ey1loAgRd4HLLHC2CYhVR2lVLBavxv7laxNRp2aAuLBiEemXAiw/a
 QFW3ngCKg00awyic=
X-Received: by 2002:a5d:51d2:0:b0:21b:bd52:c9c9 with SMTP id
 n18-20020a5d51d2000000b0021bbd52c9c9mr17190351wrv.498.1656420600828; 
 Tue, 28 Jun 2022 05:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUWpDeBcH2zs4rRuQ1nv3h3YbjwA/++c+x5rjxT48c8iYb/2FzIlS82O8V89XWKdHUbWhAsg==
X-Received: by 2002:a5d:51d2:0:b0:21b:bd52:c9c9 with SMTP id
 n18-20020a5d51d2000000b0021bbd52c9c9mr17190329wrv.498.1656420600578; 
 Tue, 28 Jun 2022 05:50:00 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b0039c747a1e8fsm20869071wml.7.2022.06.28.05.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:49:59 -0700 (PDT)
Message-ID: <ec781a1c-3088-1600-a317-f7f00eefc5fa@redhat.com>
Date: Tue, 28 Jun 2022 14:49:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] tests: wait max 120 seconds for migration test status
 changes
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628105434.295905-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> Currently the wait_for_migration_fail and wait_for_migration_complete
> functions will spin in an infinite loop checking query-migrate status
> to detect a specific change/goal. This is fine when everything goes
> to plan, but when the unusual happens, these will hang the test suite
> forever.
> 
> Any normally executing migration test case normally takes < 1 second
> for a state change, with exception of the autoconverge test which
> takes about 5 seconds. Taking into account possibility of people
> running tests inside TCG, allowing a factor of x20 slowdown gives
> a reasonable worst case of 120 seconds. Anything taking longer than
> this is a strong sign that the test has hung, or the test should be
> rewritten to be faster.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-helpers.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
> index a6aa59e4e6..e81e831c85 100644
> --- a/tests/qtest/migration-helpers.c
> +++ b/tests/qtest/migration-helpers.c
> @@ -15,6 +15,14 @@
>   
>   #include "migration-helpers.h"
>   
> +/*
> + * Number of seconds we wait when looking for migration
> + * status changes, to avoid test suite hanging forever
> + * when things go wrong. Needs to be higher enough to
> + * avoid false positives on loaded hosts.
> + */
> +#define MIGRATION_STATUS_WAIT_TIMEOUT 120

Reviewed-by: Thomas Huth <thuth@redhat.com>

... but I think I'd suggest to use an even longer timeout - sometimes people 
try to run the tests with TCI, or on heavy loaded CI machines, and then you 
can get really really long timeouts. Maybe 240 or even 300 seconds?


