Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E468313B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMsPm-0005Ae-J7; Tue, 31 Jan 2023 10:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsPX-0004uj-17
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMsPV-0005hF-3r
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 10:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675178339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNac+Dciv/qPDAvzD0R/yysHbMYKjSfKm9tmFoxuAts=;
 b=G5K9xGTTuY6GFlMLN689Olqfn/MBuRP9GT13K4U+fpAdwlqaOyO17Z3rSJ0ynm7IyhIrO5
 TZIiC3aK6kZ+31XU5fV4UVdsMFmsU9dEUNC1werubBUa28cTFt07r5JW6c6EhdoPXj/1gv
 FrzYTaYBzPKBIpoJ8ot1pnCPA8dc0Rk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-HwaXFcLiPPumPKCAqM7SDA-1; Tue, 31 Jan 2023 10:18:57 -0500
X-MC-Unique: HwaXFcLiPPumPKCAqM7SDA-1
Received: by mail-yb1-f199.google.com with SMTP id
 t13-20020a056902018d00b0074747131938so16626090ybh.12
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 07:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNac+Dciv/qPDAvzD0R/yysHbMYKjSfKm9tmFoxuAts=;
 b=21ccyFP3igz1ylKghhopVzL21OIUMyo23Tz8mOFYm0OdJd420Lc8nQZmArW8XChJr4
 oT8vlKtdm9VRQGen4bZJMg31favTj4lT2YaT2qD1WtZvDjRCcDI7r+0/133L/6hEHM63
 /ywOhqlHZoDYOfPsRY7Ty/EO57g759bSmcwPCnNPjlIz9uXEjCNJbFrjFV2LZ7LrD+0w
 jIaWcjYQbS9UUaKgq5qKltVbUN/FlTMt3H/WL1IrWq8QKQ+gm3a7eVouMKWbpz8ubonr
 eAxWVxMaUUNh2Pcwna5f9mm7AS3aQ4kt6Hy2xCvwW87C+xdSRTqMx3MvfbWYcrqjJIa0
 hO4g==
X-Gm-Message-State: AO0yUKV2fHbr1ODLUXCSrXDgI7X4+vDTjF7wc0yhr0kzz2KZkHIdOP+W
 loOqNAvKeV0tWeI3PntOez8GFi2NL8dY5nFCoAq0FzFGjt9wK+mlexM8ky+S7HuHdL1nmUqwmVI
 DiIbgN4rx2DPgiPg=
X-Received: by 2002:a25:734d:0:b0:80b:5b7c:6870 with SMTP id
 o74-20020a25734d000000b0080b5b7c6870mr21995483ybc.8.1675178336865; 
 Tue, 31 Jan 2023 07:18:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+h+8s0WiPF+cJOO+iV8HrSUmg6vUMmqlFpU1nxwRO1hJ6MDp+5Jbyb/4Dunffv3Ot4YL74bA==
X-Received: by 2002:a25:734d:0:b0:80b:5b7c:6870 with SMTP id
 o74-20020a25734d000000b0080b5b7c6870mr21995470ybc.8.1675178336650; 
 Tue, 31 Jan 2023 07:18:56 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 h6-20020a375306000000b006fa4ac86bfbsm10055614qkb.55.2023.01.31.07.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 07:18:56 -0800 (PST)
Message-ID: <2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.com>
Date: Tue, 31 Jan 2023 16:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] readconfig-test: add test for accelerator
 configuration
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230117080745.43247-1-pbonzini@redhat.com>
 <20230117080745.43247-5-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230117080745.43247-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/01/2023 09.07, Paolo Bonzini wrote:
> Test that invalid configurations do not cause a SIGSEGV, and cover a
> valid configuration as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
>   tests/qtest/libqtest.h        | 12 ++++++++++
>   tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
>   3 files changed, 70 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 64ba98bc5853..53d766fe3fa5 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -402,6 +402,26 @@ static QTestState *G_GNUC_PRINTF(1, 0) qtest_spawn_qemu(const char *fmt, ...)
>       return s;
>   }
>   
> +QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)

I think you don't need the G_GNUC_PRINTF here, do you?

  Thomas



