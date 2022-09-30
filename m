Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3135F0E58
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 17:01:45 +0200 (CEST)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHWK-0008T3-EV
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 11:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oeHTj-00067d-Ux
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:59:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oeHTi-0004A8-AR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:59:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u10so7134102wrq.2
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=h8y4N1bkwks88BM2NdZFId+wZewTzkR9/zZYH+zi3zw=;
 b=qjybKvSR1aHDXpQJPDKtpRST45OXCIleoxOkZRn2NHenXhfd9GH7BR8sfQD1hOwtrf
 8DhApPVOBaQNWuxeWpfDxu3PQBzOQ61cW8BLN+KfEiYePdYOijEYFB+LURGTg2/WGCwm
 jrg/4fQRxmKYahLYhmz5Ra6jtGCaEhiehuGEbUgqp3uaDucNbhTsEsRkfh/Vy9FLbm4J
 9xbm+VoJJ2xDkJA/zeh35evmoLE/lKj0uVDUYo9E+MVyr6DJfN8AIZhaHH52af6huNk9
 s4IXZo/Lv8aznJHfikRxHqqV7SaiL8iYLgXTkVJPslnsGmVinpEytflOiCdEfKOu14nc
 PeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=h8y4N1bkwks88BM2NdZFId+wZewTzkR9/zZYH+zi3zw=;
 b=iD+2h29LclW3hhmG5KufHaQC4B1bSnzkVYxzLioY95WXaiMTisTNjJh12i9jx1KJui
 vBnekpblmgvUtyCo2B2XSXS7BDnUmsp9xKryS0VCOMlCDnMTJLwErtcZWYQSJQWsRqz6
 nTSmWbCOE1O18YWYqSCb4CFNehxlNEJdML6X76AEDjksQUYbQTiTFFYl54gHgNmrbop8
 sTN7aQDKFqm/PgzPZzlXSSZmpb7stxnkQvdtnh1fq8k8NAVHP8Ny1aqkC9K4jguIC4QN
 wdo3Io3Dq03guQ72sNZqhppRp32GqOY5Gk9zoWhMnxZ9OemSfBOOZJqkwJEbfEZ/tTSG
 bGhA==
X-Gm-Message-State: ACrzQf1HTLYpESYFkddq4oQ0Bmyn6ZOSFq9yWgmoEvXgHANf+SfHNi8C
 q/qVng33TzszLv4kPftMlIxbzQ==
X-Google-Smtp-Source: AMsMyM6mB7APFXIiKVuH5DyQA4pJf2w1uQmYHj4oWi5iWzEurAJKkyPavP16KYqNE/FPPzFyxVFJlg==
X-Received: by 2002:adf:d204:0:b0:22e:397:d489 with SMTP id
 j4-20020adfd204000000b0022e0397d489mr1596745wrh.639.1664549940488; 
 Fri, 30 Sep 2022 07:59:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b0022ac672654dsm2222799wre.58.2022.09.30.07.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 07:58:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D45FC1FFB7;
 Fri, 30 Sep 2022 15:58:58 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
 <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
 <87pmfdxagx.fsf@linaro.org>
 <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
Date: Fri, 30 Sep 2022 15:57:21 +0100
In-reply-to: <CAFEAcA8c2_U7YMBej-9Me43bTLz=f8e6oemNy-kFkPfAwZ-+=g@mail.gmail.com>
Message-ID: <87leq0yklp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 30 Sept 2022 at 14:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > This is going to break previously working setups involving
>> > the "filter logging to a particular address range" and also
>> > anybody post-processing logfiles and expecting to see
>> > the virtual address in -d exec logging, I think.
>>
>> To be honest I've never found -exec logging that useful for system
>> emulation (beyond check-tcg tests) because it just generates so much
>> data.
>
> It can be very useful for "give me a list of all the
> PC values where we executed an instruction", for shorter
> test cases. You can then (given several of these) look at
> where two runs diverge, and similar things. I use it,
> so please don't break it :-)

ack.

FWIW you can also do that with:

   -plugin ./contrib/plugins/libexeclog.so,ifilter=3D"instruction"

and avoid having to reduce a bunch of massive logs.

>
>> > For the range-filter stuff, I'm not sure what to do.
>> > Alex, any ideas?
>> >
>> > (I see the -dfilter option documentation doesn't say
>> > whether it's intending to work on physical or virtual
>> > addresses...)
>>
>> I have a feeling for system emulation phys-pc is the most natural but we
>> could extend the filter spec to be explicit.
>
> ...isn't it currently based on virtual addresses, though ?

Yes - or rather it only ever considered whatever was in tb->pc.

>
> -- PMM


--=20
Alex Benn=C3=A9e

