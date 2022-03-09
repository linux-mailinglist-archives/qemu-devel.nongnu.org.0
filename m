Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86814D2E43
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:41:10 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRugn-0001yT-U5
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuMl-0001NO-Mk
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:20:30 -0500
Received: from [2a00:1450:4864:20::429] (port=42701
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuMk-0007G6-4O
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:20:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id u10so2461812wra.9
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gedCp2fKQFkO13vxqiagPeOkbTY4lF67o14qmdBSr1Q=;
 b=ua3JcR7KpqjMrHSVlPI3NqO4eBjjMyA6LuNmj8PijIcnOtezvnBM/nu7MdWjTkDi4k
 kSEuhZLN8/WValS9/1AneanYjT5d0vvCWXCtn7t7JvpJTGTPZySsgk2TuNQ+MvQ9k9p9
 Ynuq/zhOzEX+92ucFz/cp9ZMwF+J+ElEcV4Rn/GFkQeAtoB7bHIhkZgf7177TF8DebDA
 cp9TcKfFDp5mNLBJPFhyuySAhRA1ntSAi2TSmqOrKgNh08epZm8BjGytw+4FiXEmEQr6
 Z3KI6mDgPw3Xyc1J2P45doTo1Ko5WKu5clkC2o+B2wOxJt/MkLSJk1LJlm9b5bpTr0q1
 0qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gedCp2fKQFkO13vxqiagPeOkbTY4lF67o14qmdBSr1Q=;
 b=u/aDe2YAbjpcNwlreXpihZHmx5aBg2r+0QmdujMmvOMY7E89GArY2syz0FKAcSPCHy
 PDjO8bf3AMU2TuSL8aExV2Nh9Irsxw9n/2A+Sipu0zvcfCwWB6Yv8YAVVgiV9m2cjPU2
 pRADVhvoQCpJRYYEfSZnOCuw62/2uNxnoxrBdlRcgKryvB3E8gXYaC85t236F/OZe+LX
 u9MPCZqDJX3ynnnu/RPe7kddFTcmXve11kBK5ogV/ulRhnuJFNAX53cvOLrTAew6lsP1
 lEGtbRhbI2JPmYfLJcLi2qPnensuP2hFqZ+BZLT/UnfvAyALE2965zHMO+fJecmjfnOO
 R3Hw==
X-Gm-Message-State: AOAM532Y0KDU2l3O4TDEPpym+GAcgMEkHNqe8nBpTW5C0GKX/xzFSHOq
 hNJZUutUURG2mUMJ1SDriu2QXw==
X-Google-Smtp-Source: ABdhPJz1g7GiFFywcNu8GCBgGzAQdCBsyFB8wHtcGtOru3Ml8lBiuT9kGi4riANnsRMrzIwSpT3rSg==
X-Received: by 2002:adf:8b85:0:b0:1ed:b97b:493d with SMTP id
 o5-20020adf8b85000000b001edb97b493dmr15456860wra.108.1646824823582; 
 Wed, 09 Mar 2022 03:20:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adfdbd2000000b001e4bbbe5b92sm1517807wrj.76.2022.03.09.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:20:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4BDC1FFB7;
 Wed,  9 Mar 2022 11:20:21 +0000 (GMT)
References: <20220301094715.550871-1-alex.bennee@linaro.org>
 <20220301094715.550871-14-alex.bennee@linaro.org>
 <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 13/18] tests/tcg: add vectorised sha512 versions
Date: Wed, 09 Mar 2022 11:18:02 +0000
In-reply-to: <162f6b45-8b3a-9672-2e5e-f28e867eff31@redhat.com>
Message-ID: <874k4774p6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 01/03/2022 10.47, Alex Benn=C3=A9e wrote:
>> This builds vectorised versions of sha512 to exercise the vector code:
>>    - aarch64 (AdvSimd)
>>    - i386 (SSE)
>>    - s390x (MVX)
>>    - ppc64/ppc64le (power10 vectors)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220225172021.3493923-14-alex.bennee@linaro.org>
> [...]
>> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.=
target
>> index 1a7238b4eb..e53b599b22 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -25,3 +25,12 @@ run-gdbstub-signals-s390x: signals-s390x
>>     EXTRA_RUNS +=3D run-gdbstub-signals-s390x
>>   endif
>> +
>> +# MVX versions of sha512
>> +sha512-mvx: CFLAGS=3D-march=3Dz13 -mvx -O3
>> +sha512-mvx: sha512.c
>> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>> +run-sha512-mvx: QEMU_OPTS+=3D-cpu max
>> +
>> +TESTS+=3Dsha512-mvx
>
> When running "make check-tcg" on my s390x host, I'm now getting this erro=
r:
>
>  TEST    sha512-mvx on s390x
> qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
> qemu-s390x: warning: 'msa5-base' requires 'klmd-sha-512'.
> make[2]: *** [../Makefile.target:156: run-sha512-mvx] Error 10

Hmm I see the warning but it doesn't fail for me. Dropping -cpu max
makes the working go away. I thought we needed it to ensure the CPU
model had s390x's vector instructions enabled.

> Any ideas how to fix this?
>
>  Thomas


--=20
Alex Benn=C3=A9e

