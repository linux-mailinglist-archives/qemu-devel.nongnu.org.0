Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F26E0AD2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:58:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmti5-0007US-SB; Thu, 13 Apr 2023 05:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmti4-0007UC-A8
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:57:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmti1-0006RT-CA
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:57:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso14414856wmq.2
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681379855; x=1683971855;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jwa7xKoTriD1v4qegQGkt41xbeIHzl4flqf5VjFjptg=;
 b=jiPx/DzYvkLQ2+Vawl2E8cQTqcBfu/J+FaK9vfS07Rx2RSdSNLEtnX2b+lVgj7OXbE
 ES/6/VQLFBKMrEcoSKhCVIGEh6f23FfqMEn+kN4ct292Dnw6Rvggps1dPw0KUfdWiUdt
 MQRskLhE2umC+2zw1cbKOVUqxXxcMWjU9ry3O7ioB4Tv0LIIj9QI/jYLaDCnGyol/L/j
 YfM9NCW8PZgvi4xhWbXWTzfU5ijhMBZ4rad6p8CdVG5ytDFn/RJ+bkk4tPlhq4TAaI0k
 YbmGC/qBX0alDUMUoUXZXA0fsEiYaEhzqy+zLlWAadWFP+NfGFq0um1CcdHker/5Qq7u
 df5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681379855; x=1683971855;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jwa7xKoTriD1v4qegQGkt41xbeIHzl4flqf5VjFjptg=;
 b=mIUqsePX/yuqxhydPaH9KCL43vETX7FgyFBt7BLJkpvBhZtTIYU9BnKimx7LTDOmZe
 zQEJ4wbd4mbLa8z4Is7JKt8qMrKFaX/14Fl2lUGmdqT8sQj0a1DUAmmdR6JKzMk6kXsb
 UhobW/ubPJZ4bJeoHDHyCzGivlELc5iCHZblF0ox3gvIqLHcEX87mA4WkwASiMxCNXug
 XyOU/bGA27fE49TICJifZiOCxamTW53K5vGdP5vOncKL7vuXqfAuyz0Ez2yzb+w6DQS1
 uFa8DtGLjVYHF9zaTuMm6XjtlYAIltpa4M6ZMi8TmfoTur7vFM01M+TnwiMOpOJTwSOq
 NY0w==
X-Gm-Message-State: AAQBX9dLPy0BJ0Pr7+TEyhsTRlMfhJhJnHpaY4qBsdyc7NsM0hM9/xYk
 O6StxHqeioZy8R3hRzrKl5P3RKBKiexcPctaNFc=
X-Google-Smtp-Source: AKy350ZdbvooQvzZq7Vr4EC2A+Cnd+3SUWM+XgFqhZZmwbf0Pr+yzaFBqx8Xo8dAkgJ8fp4jrYDorA==
X-Received: by 2002:a05:600c:2212:b0:3ed:711c:e8fe with SMTP id
 z18-20020a05600c221200b003ed711ce8femr1099216wml.2.1681379854650; 
 Thu, 13 Apr 2023 02:57:34 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003f09d7b6e20sm1410659wmc.2.2023.04.13.02.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:57:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABD641FFB7;
 Thu, 13 Apr 2023 10:57:33 +0100 (BST)
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
 <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
 <87fs95pk7n.fsf@linaro.org>
 <CAFEAcA8TB65xkv2+ZVdY0jYdEPU-uAc+twK5=eWYzkwZYbkhmQ@mail.gmail.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 mst@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
Date: Thu, 13 Apr 2023 10:42:48 +0100
In-reply-to: <CAFEAcA8TB65xkv2+ZVdY0jYdEPU-uAc+twK5=eWYzkwZYbkhmQ@mail.gmail.com>
Message-ID: <878rewcdf6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 12 Apr 2023 at 09:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > Whoops, hadn't noticed that guint type... (glib's
>> > g_int64_hash()'s approach to this is to XOR the top
>> > 32 bits with the bottom 32 bits to produce the 32-bit
>> > hash value.)
>>
>> This is less of a hash and more just concatting a bunch of fields. BTW
>> if the glib built-in hash isn't suitable we also have the qemu_xxhash()
>> functions which claim a good distribution of values and we use in a
>> number of places throughout the code.
>
> Is that really necessary? If glib doesn't do anything complex
> for "my keys are just integers" I don't see that we need to
> do anything complex for "my keys are a handful of integers".
> glib does do a bit on its end to counteract suboptimal hash functions:
>
> https://github.com/GNOME/glib/blob/main/glib/ghash.c#L429
>
> static inline guint
> g_hash_table_hash_to_index (GHashTable *hash_table, guint hash)
> {
>   /* Multiply the hash by a small prime before applying the modulo. This
>    * prevents the table from becoming densely packed, even with a poor ha=
sh
>    * function. A densely packed table would have poor performance on
>    * workloads with many failed lookups or a high degree of churn. */
>   return (hash * 11) % hash_table->mod;
> }
>
> I figure if glib thought that users of hash tables should be
> doing more complex stuff then they would (a) provide helpers
> for that and (b) call it out in the docs. They don't do either.

Ahh I didn't realise glib was adding extra steps (although I guess it
makes sense if it is resizing its tables) or that their default hash
functions where so basic.

The original primary user of the qemu_xxhash functions is QHT which has
to manage its own tables so relies more on having a well distributed
hash function.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

