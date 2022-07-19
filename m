Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689457987E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:29:15 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlPe-000113-OB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDlO4-0007yJ-LP; Tue, 19 Jul 2022 07:27:36 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:51818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDlO2-00033R-Tw; Tue, 19 Jul 2022 07:27:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3A035CE1A32;
 Tue, 19 Jul 2022 11:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9D5C341CE;
 Tue, 19 Jul 2022 11:27:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gdDqO7cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658230046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wv2W2WLAQxUrpwGa8FHBZb5YujeO/itmSDx2kySqbZk=;
 b=gdDqO7cn2su2fuFGH6kVvheg6dD8s+WvmWyoEEib1Fe+U9H15/FCWohWhniuAjlTXrmHKr
 4OCoopvsoajp0fVSaiz2+qAvUHoDKa5cudOfSt+CcMN05aNSkQP85PLJHqTGcOKw502GcZ
 hgi+NxjioyReYTB+OsesoD/95WUZPlY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50cbbc71
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 11:27:26 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id b25so10125735qka.11;
 Tue, 19 Jul 2022 04:27:26 -0700 (PDT)
X-Gm-Message-State: AJIora93m8MFHzhok5ItlJ7wfXO+r9xPNtR3XsnNcsoWYbazWr8wivSr
 It846Yd0aGXzEpSG+22K/CwBOSbJMgrGK6dzUTo=
X-Google-Smtp-Source: AGRyM1sxrPGY4LXn0ROlMEk4GgcO+s3AsEUG4h7cBurdGvsm9iTBvSOcONeR3GLjRHtVd1oeAK0HVwijNNwY3sSFmYo=
X-Received: by 2002:a05:620a:4552:b0:6b5:fc9f:e7a7 with SMTP id
 u18-20020a05620a455200b006b5fc9fe7a7mr1898738qkp.65.1658230045336; Tue, 19
 Jul 2022 04:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220712164627.581570-1-Jason@zx2c4.com>
 <70076dcc-795e-0986-acde-8fcf3a33823d@redhat.com>
In-Reply-To: <70076dcc-795e-0986-acde-8fcf3a33823d@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 19 Jul 2022 13:27:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9pYggKwkVhU3PqTur==MWxsvvKaErhbM9sWWMA1Zpom5Q@mail.gmail.com>
Message-ID: <CAHmME9pYggKwkVhU3PqTur==MWxsvvKaErhbM9sWWMA1Zpom5Q@mail.gmail.com>
Subject: Re: [PATCH qemu] target/s390x: support PRNO_TRNG instruction
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harald Freudenberger <freude@linux.ibm.com>, 
 Holger Dengler <dengler@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Thomas,

On Tue, Jul 19, 2022 at 12:00 PM Thomas Huth <thuth@redhat.com> wrote:
> > +{
> > +        uint64_t addr = wrap_address(env, buf);
>
> I think you have to limit "len" to the lower 32-bit if not running in 64-bit
> mode.

Will do.

> According to the Principles of Operation:
>
> "A specification exception is recognized and no other
> action is taken if any of the following conditions exist:
> ...
> The R1 or R2 fields designate an odd-numbered
> register or general register 0. This exception is
> recognized regardless of the function code."
>
> It would be good to have that check here, too.

Ack.

v2 incoming.

Regards,
Jason

