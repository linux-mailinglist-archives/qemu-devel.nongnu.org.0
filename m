Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2330665C17
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:04:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFamF-000798-77; Wed, 11 Jan 2023 08:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFamB-000784-Mo
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:04:19 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFam7-00074u-Rr
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:04:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id t5so10541746wrq.1
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suZHlIF2Y9gRILn+szSyJeFsObDJPaoFKRCgUiMBqQ8=;
 b=Gr31KVA3rUQ3kxyTrt369k///baau6IIbwWTxEADh8uXl9hTYEtP5bF0GJhCz633Kp
 Inf9AN6DbR890DmMCqWgE1ZUsp9zLx4OxtQ8ohUrGVM33mPPnEmVwCYnim6WIYyJiyrx
 BBezkoAPmb4+IhDBt6dEv22Pf3ArVU1FN7y1wuP6UiAjM8QyY5UuAFCQqB/OzjaLMPnL
 DFikZaZcd5NYs9yATMoEsqWBHf6k7BPr0oMLFn7qapkhzqevAEwC53+do/IDkINf49tk
 TXt+9OLYAIvcKaP4JLuBjoZYoWYnhb4xlv64AehRxp1zD/Mkz9iG6rMmCtXzNVoPnP0z
 JMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=suZHlIF2Y9gRILn+szSyJeFsObDJPaoFKRCgUiMBqQ8=;
 b=D0JE0aoTH1KpMMHoJr/gHhgPHRq3RWBDPOeJGkjLyPs4u992URdj/m7jidorT9zK3D
 up6poVBDJ1QN6vZKGRi8ik6Q/EqdUNRjMoJi2Ta5PKtLDTR+HhIRXkNQC2YBP1Hshlvy
 64tmCuMO1Ai/d38ZUg2142Bwiz02afVltox61JlyjYM+4Ur4xplAkoJElQKrxtP420Dh
 iYlDLzfEwXMTiDctc65D+YJ5gdXwyg29GiUkgWdYBaQsigS/35NHLbbRBd+N9J+vR6PP
 EvWPotwbcjUTT92hQ341d243nMRCXHqU8DubKfxM5nkkBwzs9OxSvToO8K5ON9LtgM+H
 1MYw==
X-Gm-Message-State: AFqh2kpcmGSjttR2/1tgbp4ZBUC96TzPj4HaTl/zdhAIl5XNkFq9xqLt
 jxWIR8Dg80QJD5chPmJZjHzJgg==
X-Google-Smtp-Source: AMrXdXsSsvvrlD0mqtQW3dmmNU7/RJmO0iliKmxJv6vJ+t+RR6FNUfB540/8MKttWwUi36ZMzoyhXQ==
X-Received: by 2002:a05:6000:1a41:b0:24b:b74d:8012 with SMTP id
 t1-20020a0560001a4100b0024bb74d8012mr43544083wry.18.1673442253958; 
 Wed, 11 Jan 2023 05:04:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b002366e3f1497sm13929137wrm.6.2023.01.11.05.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 05:04:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3A8D1FFB7;
 Wed, 11 Jan 2023 13:04:11 +0000 (GMT)
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-5-cota@braap.org> <87cz7mm7fu.fsf@linaro.org>
 <Y74h2RC+8J63Nzqj@cota-l14>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/5] util/qht: use striped locks under TSAN
Date: Wed, 11 Jan 2023 13:03:53 +0000
In-reply-to: <Y74h2RC+8J63Nzqj@cota-l14>
Message-ID: <87v8ldkyt0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Emilio Cota <cota@braap.org> writes:

> On Tue, Jan 10, 2023 at 20:58:01 +0000, Alex Benn=C3=A9e wrote:
>> Emilio Cota <cota@braap.org> writes:
> (snip)
>> > +static inline void qht_do_if_first_in_stripe(const struct qht_map *ma=
p,
>> > +                                             struct qht_bucket *b,
>> > +                                             void (*func)(QemuSpin *s=
pin))
>> > +{
>> > +#ifdef CONFIG_TSAN
>> > +    unsigned long bucket_idx =3D b - map->buckets;
>> > +    bool is_first_in_stripe =3D (bucket_idx >> QHT_TSAN_BUCKET_LOCKS_=
BITS) =3D=3D 0;
>> > +    if (is_first_in_stripe) {
>> > +        unsigned long lock_idx =3D bucket_idx & (QHT_TSAN_BUCKET_LOCK=
S - 1);
>> > +        func(&map->tsan_bucket_locks[lock_idx]);
>>=20
>> Hmm I ran into an issue with:
>>=20
>>      ../util/qht.c:286:10: error: incompatible pointer types passing
>> 'const struct qht_tsan_lock *' to parameter of type 'QemuSpin *'
>> (aka 'struct QemuSpin *') [-Werror,-Wincompatible-pointer-types]
>
> Gaah, sorry. I didn't notice this because of unrelated noise due
> to having to configure with --disable-werror. Fixed now by removing
> a bunch of const's and also using .lock.
>
>> > +static inline void qht_bucket_lock_destroy(const struct qht_map *map,
>> > +                                           struct qht_bucket *b)
>> > +{
>> > +    qht_do_if_first_in_stripe(map, b, qemu_spin_destroy);
>> > +}
>>=20
>> Who is meant to be calling this?
>
> Should have been removed in v2; fixed now.
>
> I've uploaded the v3 series to https://github.com/cota/qemu/tree/tsan-v3
>
> Please let me know if you want me to also mail it to the list.

Please do and then I can be sure I'm upto date when I rebuild the PR.

> Thanks,
>
> 		Emilio


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

