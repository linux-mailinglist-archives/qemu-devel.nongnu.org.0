Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57C6633DD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:22:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0Vv-0007b3-2Y; Mon, 09 Jan 2023 17:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0Vr-0007aB-QP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:21:04 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0Vq-0005Uf-6s
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:21:03 -0500
Received: by mail-oi1-x235.google.com with SMTP id n8so8528303oih.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=27ARvshwDy1yUgwDYfhuDwhT1YSx0p1MTKgw6ofF1Xc=;
 b=4bamaJV02u+QCRlk3RXn9OF+OpEwaU3kZrjIUckcvkEY8K4pzOMUkap+zXRyYFpn07
 qVq9DCEYHejBt3vNMF61s5Ycd1T0TFrwqERhb++b8RvIL7ufegCz7kfmEGECoX1O29mY
 Z+MKGQ4oTItm1EUw4N0zqryoSM+PJcnVOieSkughgC/6RD9SzP5q2x9/QQX/xAw7h0y4
 hfGEcfw2yhHLc6vgG21GW3Gj6/LpVbuGMZ14xQyJ4NM0zsdMOUohB2MZQkjfjBu5S/sc
 BdMMgs5l3FxcYmWDhAUStBabXkcxfzGofmESXYspcPT9nhurGkb0AjvSudR5kHey1eEG
 /Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27ARvshwDy1yUgwDYfhuDwhT1YSx0p1MTKgw6ofF1Xc=;
 b=AiTULlUJxgFCYwtz6/bdYPfRLG223Qx0wIZgf7N+HHpnfMFKomlWp8QLNO/SoKcQmu
 i59AV3S6UfIHGMdAo0AuxDhWKdJMb2mVLLJ/nUVBvQ2do/pH09DA+cWB48S8/R0bLNbU
 RDwhUaBPWz7wht3bgCTY3/gX+dthEphMlTYi2IjzY6+uYLtwffEB1DW5mH0Mzn4gENcZ
 VolOWpoFVi14Qfnu1kmFxPnMv4o0Te1iW9QSmNAgd0c+o5XJB26y8Lcf/blNR8NeV6Nc
 IV9jL2wnQj6xamoigQ9qVkqntpqnXStHjbGpe+qoSHTSQpAyWNLEWt5sp/BVt27CVbY0
 o0aw==
X-Gm-Message-State: AFqh2krbM55vDh8j9KMe36GWWPezNDLwU1cFKbiCAT3MocRm5jHT77Is
 sXpmA5mqx4iTUcA5gctmZhwM7g==
X-Google-Smtp-Source: AMrXdXshESS1Cw1VfIMd8R7kKZZReeK5ZR1IZ0eCwc3uOXXZyFbEo5FgMumZUAIEqCu/+5yO/JTmqQ==
X-Received: by 2002:aca:a90e:0:b0:360:fc39:e79e with SMTP id
 s14-20020acaa90e000000b00360fc39e79emr28010991oie.41.1673302860164; 
 Mon, 09 Jan 2023 14:21:00 -0800 (PST)
Received: from localhost ([37.19.221.172]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05680803c200b0035b7002af8csm4457593oie.56.2023.01.09.14.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:20:59 -0800 (PST)
Date: Mon, 9 Jan 2023 17:10:08 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] util/qht: use striped locks under TSAN
Message-ID: <Y7yQwHMNArx2tlvV@cota-l14>
References: <20230108163905.59601-1-cota@braap.org>
 <20230108163905.59601-4-cota@braap.org>
 <4f9cf406-1a46-8f7c-6a52-fb13d8c27317@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9cf406-1a46-8f7c-6a52-fb13d8c27317@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::235;
 envelope-from=cota@braap.org; helo=mail-oi1-x235.google.com
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

On Sun, Jan 08, 2023 at 11:51:44 -0800, Richard Henderson wrote:
> On 1/8/23 08:39, Emilio Cota wrote:
> > +static inline void qht_bucket_lock_init(const struct qht_map *map,
> > +                                        struct qht_bucket *b)
> > +{
> > +    qht_do_if_first_in_stripe(map, b, qemu_spin_init);
> > +}
> > +
> > +static inline void qht_bucket_lock_destroy(const struct qht_map *map,
> > +                                           struct qht_bucket *b)
> > +{
> > +    qht_do_if_first_in_stripe(map, b, (void (*)(QemuSpin *))qemu_spin_destroy);
> > +}
> 
> I think it's clear the declaration of qemu_spin_destroy is wrong vs const.

Done, added a separate patch for this.

> Why do you create two wrappers for qht_do_if_first_in_stripe, but...
> 
> > +static inline void qht_head_init(struct qht_map *map, struct qht_bucket *b)
> >   {
> >       memset(b, 0, sizeof(*b));
> > -    qemu_spin_init(&b->lock);
> > +    qht_bucket_lock_init(map, b);
> >       seqlock_init(&b->sequence);
> >   }
> > @@ -250,7 +328,7 @@ static void qht_map_lock_buckets(struct qht_map *map)
> >       for (i = 0; i < map->n_buckets; i++) {
> >           struct qht_bucket *b = &map->buckets[i];
> > -        qemu_spin_lock(&b->lock);
> > +        qht_do_if_first_in_stripe(map, b, qemu_spin_lock);
> >       }
> 
> ... not others?

Thought the remaining two cases were obvious enough.

I've now removed the wrappers.

> The actual logic of the stripe seems ok.

Thanks!

		Emilio

