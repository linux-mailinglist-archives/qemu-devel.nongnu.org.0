Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA205FEEBC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:37:16 +0200 (CEST)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKsF-0006hL-FJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKmy-0004K9-Qy
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:31:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKmv-0007Tq-Ju
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:31:47 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j16so7591025wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yT7HWSnE14h2wjwoNCeeLx9kAgfgntwJZBzhIC1N5lg=;
 b=F4RLZavHAJJzPihGf3EqKv2TZWQG58HqCw9sqaW8hvyoNEgSpLyPzVjlZGsZoWAPko
 Nb/nxLQA81Fg5KuqKF7iTlENMpbwYT6qMsU+w/lAD6yVA04NJfK/M7q06ZW0ONJ7jRe0
 g26gBDLOW0Gg6beySuqwu1XnYbv1JbELHjmg+SfjpBKax8CM6hIeIYANkkp4211P6DPF
 768O4NZTVamuvm4SKHwQRxD19w+xFO8h2kgg3zTsUiOJyo36x+vioW14nOLGJp9TTjEZ
 +J0Fde25CSX1CPNmY2DJAETvBD53sHa/tEiLtzlmoYnVx6LN9LJms+K2cekjgdtFAq3R
 uEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yT7HWSnE14h2wjwoNCeeLx9kAgfgntwJZBzhIC1N5lg=;
 b=fGdKXHiYfMPTLpcxpFqs8j7bbuicNpisb6vJ7+BI9+6WqYd3rrlnEV/aU+Om18auf7
 HnxchMy4LvouhI6jCKAHJCA/hcwLFQEr67B9hgNGrR+3jJ0uHWZLXssPBqkVHSGv/diB
 6XKK34oe3Qe5Qo8pI6EpGWpdBCUrWo50ASZw+Ew+JhAwfqE50zG86FnSDSbDNFrIzRQ5
 5LcFjRJ0EGS8dClNt9RAKMacYhC4wo7DQXpvmpHhP9akabn3EI2U0jyBHs5wJUZyzyYz
 XrBJTPVMBd1XYL/9BfRBzmoJSHCePok3xGrAmFkVy8k0rFBb6FYoPn+i/PK8f3rH+U/C
 aGag==
X-Gm-Message-State: ACrzQf2bTsoOJakAfeC0fIK+PFUukUsOeyofYi/yFMX+c1w28dENJ3sS
 AO1fIIAnhzXvaRWVwiI+ERLLNA==
X-Google-Smtp-Source: AMsMyM5LpV7u+mNyCif+aM6JvkDDg/6Z3bLDG3hplvkxDkQoB7+jt6+b6aYhlnUcQ9qsKh+k14jGfQ==
X-Received: by 2002:a5d:5a15:0:b0:22e:7771:3a07 with SMTP id
 bq21-20020a5d5a15000000b0022e77713a07mr3369747wrb.662.1665754303765; 
 Fri, 14 Oct 2022 06:31:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a05600c54c600b003c6c3fb3cf6sm2176554wmb.18.2022.10.14.06.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 06:31:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 885701FFB7;
 Fri, 14 Oct 2022 14:31:42 +0100 (BST)
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
 <222c561c-4771-c3ae-6749-5c0f4ea4c6ef@ilande.co.uk>
 <871qrasl7e.fsf@pond.sub.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH 1/4] docs/devel: add a maintainers section to
 development process
Date: Fri, 14 Oct 2022 14:24:38 +0100
In-reply-to: <871qrasl7e.fsf@pond.sub.org>
Message-ID: <874jw6o7k1.fsf@linaro.org>
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


Markus Armbruster <armbru@redhat.com> writes:

> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>
>> On 12/10/2022 13:11, Alex Benn=C3=A9e wrote:
>
> [...]
>
>>> +Becoming a maintainer
>>> +---------------------
>>> +
>>> +Maintainers are volunteers who put themselves forward to keep an eye
>>> +on an area of code. They are generally accepted by the community to
>
> Do you mean "expected by the community"?

Well I was trying to make clear how the "community" decides who should
be a maintainer. We don't leave it to who's currently holding the merge
keys so in practice its other contributors acknowledging that the
proposed maintainer knows their stuff (or at least didn't step backwards
fast enough when the call went out).

In practice when maintainership is passed down this is often just the
R-b by the previous maintainer. For areas where no maintainer currently
exists just gathering a few R-b's seems to be enough because having a
maintainer is better than not having one.

>
>>> +have a good understanding of the subsystem and able to make a positive
>>> +contribution to the project.
>>
>> Is it worth making this a bit stronger such as "having a
>> demonstrable track record of providing accepted upstream patches"?
>> I'm not sure if this is being a bit too
>> nit-picky, however someone could have good understanding of a
>> subsystem such as PCI but be still unfamiliar with the QEMU's PCI
>> APIs and how they should be used.
>
> I think existing practice varies.
>
> For something that is widely used, we generally require enough of a
> track record (contributions *and* reviews) to inspire confidence.

I can certainly add language about prior contributions.=20

> But if you submit something new, say a machine, we may ask you to stick
> around and maintain it as a prerequisite for merging.
>
> [...]


--=20
Alex Benn=C3=A9e

