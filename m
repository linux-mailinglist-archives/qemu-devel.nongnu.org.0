Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767F4CF423
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:57:51 +0100 (CET)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9Be-0003mh-C6
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR98N-0000Ug-KB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR98K-0000kJ-TI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646643263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12DEsos71s7FzxClC55Kye3X3h2NxMC98zQc/5X7pS0=;
 b=LLujrvwGyGdGVs71ZPuiFfHqAmBe+KkmFW1m1nRIhdd2P6a8GKKLuwqQSp+xCYfGwVDeMH
 fEUytKyVs6UjYvIRcxyPk/4HDITr1J2UuT1j9sncMvdOBxJN/A9LoJnYXzH9Z+r08W1nFs
 CemAt7jCQ0zWpa/jTkPjYX9lR6HtlOo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-vfiS-qSlOx6BdafAwKhI2Q-1; Mon, 07 Mar 2022 03:54:22 -0500
X-MC-Unique: vfiS-qSlOx6BdafAwKhI2Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so7579197wma.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=12DEsos71s7FzxClC55Kye3X3h2NxMC98zQc/5X7pS0=;
 b=eVrBHza7izXxf7XZd+ogqgl1KPm0YJtXH6l77fUXeWU57Xv/dGDFRngeUh8T5TBbPY
 wo4z4YScCiARPC2EURqwvCxrkYX9j+F/C5I0NAPkTcOaN5zI8YA/gwnl2DE6HMGeCLkl
 bIM/fY7/yuPG09tjxC7HFQ/twHnvrt6diTkZP5JX5iMlPHhd5TF7wG5kAOVjduTT1Lr2
 CigRYkKkG4t5E871a7GsBexfkEWoAHUTAAtSjE+YIsLSdIseE/ZG8EgYq5DLBIH4D9Q2
 517Io/uqIKLhrofz+IOZA1rIo96TwV8BkA+Y5nZ92r9agkwFe/TUq2dt46/I5JdylQuj
 o+bA==
X-Gm-Message-State: AOAM533GGmvDYhklsFKILSsJ9NomjEjXueLHD7v5qbRjx/3oOGvyz2VP
 V7nsIh+15vWBVnbWApLsrO4m3dY2Vyu3U/f12siqfaK0HRAqbrVtHbd+PZr2UNO0z0sv82FWdW/
 x1BMygMv9mjZGbv8=
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id
 d11-20020a5d538b000000b001f1e60b20c2mr5254587wrv.294.1646643260952; 
 Mon, 07 Mar 2022 00:54:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhk+S95XCHiyJEA2GS+BY1ER9H63IIEX90K0zEy49M4PuMBhqfgjmc6Rf10YEN7W3A9J+cZA==
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id
 d11-20020a5d538b000000b001f1e60b20c2mr5254574wrv.294.1646643260796; 
 Mon, 07 Mar 2022 00:54:20 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b0037c4e2d3baesm19217100wma.19.2022.03.07.00.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:54:20 -0800 (PST)
Message-ID: <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
Date: Mon, 7 Mar 2022 09:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 13/18] tests/tcg: add vectorised sha512 versions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
 <20220301094715.550871-14-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220301094715.550871-14-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/2022 10.47, Alex Bennée wrote:
> This builds vectorised versions of sha512 to exercise the vector code:
> 
>    - aarch64 (AdvSimd)
>    - i386 (SSE)
>    - s390x (MVX)
>    - ppc64/ppc64le (power10 vectors)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>
[...]
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 1a7238b4eb..e53b599b22 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
>   
>   EXTRA_RUNS += run-gdbstub-signals-s390x
>   endif
> +
> +# MVX versions of sha512
> +sha512-mvx: CFLAGS=-march=z13 -mvx -O3
> +sha512-mvx: sha512.c
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +
> +run-sha512-mvx: QEMU_OPTS+=-cpu max
> +
> +TESTS+=sha512-mvx

When running "make check-tcg" on my s390x host, I'm now getting this error:

  TEST    sha512-mvx on s390x
qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
make[2]: *** [../Makefile.target:156: run-sha512-mvx] Error 10

Any ideas how to fix this?

  Thomas


