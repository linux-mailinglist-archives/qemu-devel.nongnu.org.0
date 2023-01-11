Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DFB6651F5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 03:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFR4U-0003rO-DR; Tue, 10 Jan 2023 21:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFR4R-0003qy-As
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 21:42:31 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFR4P-00025L-LP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 21:42:31 -0500
Received: by mail-qt1-x82b.google.com with SMTP id bp44so12855516qtb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 18:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aaGczZVmik1O4bkKA7G0Gkj4yxvKlBsEHWCJsShOaCk=;
 b=ce8+m2JvoKIUCn0PQLdrL1J1+/1zyuSlk7cs5C9Y++fpmS+RLnx/AH2wU/ITYZDuwv
 QFKEmgv2gNFPhnibrFyyoniP+pOUEDzH084Yqw9O18irGMrfuNGatekBKv6lQUOr4s34
 vr5NLckm1u2ff3Db7r+ILZogrW5uUeWvdv8HHw72kea0QSDGdJ3+G+H9ibuRW+654GxI
 AWm0wgu35GcRJgA6mgIEm0rmeKTFa6D/d+LwCawvRjgJZ0W81hqqwdbx2my4x+DKfBDK
 m5KcjRuf4jsQ4nqMFqH/xwAx6onta5RZpaUsf77fmUPdGld32Fa3WVbhu+CkcEDKHydc
 cUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aaGczZVmik1O4bkKA7G0Gkj4yxvKlBsEHWCJsShOaCk=;
 b=18czqbgQaJ1P3uLaZzlsCM7/8+CtojUGRFSEXwXdLfoW8MKdasxaxr9R51avFe8KFI
 1pGLNl2mYP0+tohPpGBTD/Ez1vV89crAKBHuh7d37guYS1wIb4M1hrrr4/uxGKt/nKze
 wUNe+KCspxwXF5bAFVDmUz+rFkj8f2N9Ch5Y5hPkV7V7aOKtrTaaUdGHMd4HOawIwMbT
 cc2xTZnWabOO79nOsELBw4YHBCIr84I4b6UrkCr4wrD5vJoZRsNmaLp7pUPpLEL9OBcd
 TaAhEffjLYY3D1lkK40zedpI8grAX972ab8tFTaSL7qbCSXFgwDdOfGSyZJVlkdNIbls
 J87w==
X-Gm-Message-State: AFqh2kqbh+C3xMOk+LjAdSVfFQdafiFU6ZKB7C04MobPbC8u/7ckpBX7
 WDktZzD9LIeI6q2cYMa73YPeeA==
X-Google-Smtp-Source: AMrXdXvM6kHHXYsScI3pX54BAA6T8PgubOmrPuVsruGdL/zHbOTFFfHcLCeB6HooAYiK6GfrJx8vEw==
X-Received: by 2002:a05:622a:c:b0:3ab:b78b:c3cf with SMTP id
 x12-20020a05622a000c00b003abb78bc3cfmr61525841qtw.60.1673404948017; 
 Tue, 10 Jan 2023 18:42:28 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 h14-20020ac8548e000000b003ab1ee36ee7sm6918003qtq.51.2023.01.10.18.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 18:42:27 -0800 (PST)
Date: Tue, 10 Jan 2023 21:41:29 -0500
From: Emilio Cota <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/5] util/qht: use striped locks under TSAN
Message-ID: <Y74h2RC+8J63Nzqj@cota-l14>
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-5-cota@braap.org>
 <87cz7mm7fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz7mm7fu.fsf@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82b;
 envelope-from=cota@braap.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Tue, Jan 10, 2023 at 20:58:01 +0000, Alex Bennée wrote:
> Emilio Cota <cota@braap.org> writes:
(snip)
> > +static inline void qht_do_if_first_in_stripe(const struct qht_map *map,
> > +                                             struct qht_bucket *b,
> > +                                             void (*func)(QemuSpin *spin))
> > +{
> > +#ifdef CONFIG_TSAN
> > +    unsigned long bucket_idx = b - map->buckets;
> > +    bool is_first_in_stripe = (bucket_idx >> QHT_TSAN_BUCKET_LOCKS_BITS) == 0;
> > +    if (is_first_in_stripe) {
> > +        unsigned long lock_idx = bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
> > +        func(&map->tsan_bucket_locks[lock_idx]);
> 
> Hmm I ran into an issue with:
> 
>      ../util/qht.c:286:10: error: incompatible pointer types passing 'const struct qht_tsan_lock *' to parameter of type 'QemuSpin *' (aka 'struct QemuSpin *') [-Werror,-Wincompatible-pointer-types]

Gaah, sorry. I didn't notice this because of unrelated noise due
to having to configure with --disable-werror. Fixed now by removing
a bunch of const's and also using .lock.

> > +static inline void qht_bucket_lock_destroy(const struct qht_map *map,
> > +                                           struct qht_bucket *b)
> > +{
> > +    qht_do_if_first_in_stripe(map, b, qemu_spin_destroy);
> > +}
> 
> Who is meant to be calling this?

Should have been removed in v2; fixed now.

I've uploaded the v3 series to https://github.com/cota/qemu/tree/tsan-v3

Please let me know if you want me to also mail it to the list.
Thanks,

		Emilio

