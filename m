Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58886A810E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXh94-00031V-F5; Thu, 02 Mar 2023 06:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXh8v-0002yl-PW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:30:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXh8t-00087f-2X
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:30:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx12so13029605wrb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibn98QnENJ79vk3cdEH7jQ8PEE/35+GSWZdFhJCIX+k=;
 b=fN2sTLZ3cSKvPI24QtRr0uP6sxtVey0Xlz1HCyvMvDZfiyeAp1dMw/6WMMKeufo9HR
 uYL+XAQ/0L6OG5zp2rC794YS7nEzXW0rKmUjGFp/CwAqWRFkCxkOTpVbwGNxjpEA3LnZ
 OEIr0Vp0CXCPf5+vvwMaQkCH88CEiM5P17NhJEc/hVYOPbe9xoz140KIQZi7DIN4GeMW
 dL4WrFLVUgUXcoPRMnHlJKbySZn9rJVSoXupOSGOzcrltk2BqBN5sFfTjSfhXnHtMdzR
 I9t3BSFzIip0WPBIb45X2Dk9eDCduXK/iTe/fhZbqeKnkXA/bF//pJM9YE60+me3ZKk9
 h7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ibn98QnENJ79vk3cdEH7jQ8PEE/35+GSWZdFhJCIX+k=;
 b=080nF4GvEaCflZ8bUqLq815aEYquv5IW0yUBDm/tm9xNGqb8gWnr+jyH9mqZBbNDIY
 e8d3wTHBij/Be5AwpevlcsRqwgUvM+OvJwuBFjh5yF0UkjsRfN4YMxvi45xfNMMDsJz+
 nemedeDT0hfyEkSC588Q8zUj+9gqwFZzv9BWt8YlI9Ss/puejrgfS3TR581AV7beBtLO
 AQbY5KAz0Q5Dazsq27bZA6wc/aLbq+k2RRumfiyf8zKSOLTHSlcN9jgfj/wYEgXc36XG
 9Z2wVspr6Z2egLLnuKpKhq0zgyRGJhQ44YwpOnm2PForTiCkud3tPMMOhn1o4WYIsc8P
 Msfw==
X-Gm-Message-State: AO0yUKXexPOY2VfZp3sNLbZC3xlhHCTjmsXFgbQTeR2hIASJGgvd2r/1
 2ZtPq03DfRX4aDJpWALCXYGFlA==
X-Google-Smtp-Source: AK7set+2lvZuRGhlXjirmvbnnX5EqXoZVA1OdFbEWyfYZ8cfUp//AgIjSavZfGDmoe6qeEKOg8Du1A==
X-Received: by 2002:a5d:4b88:0:b0:2c7:faf:af28 with SMTP id
 b8-20020a5d4b88000000b002c70fafaf28mr7501004wrt.43.1677756633614; 
 Thu, 02 Mar 2023 03:30:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm15288463wrv.85.2023.03.02.03.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:30:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3EAE1FFB7;
 Thu,  2 Mar 2023 11:30:32 +0000 (GMT)
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
 <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker,
 avocado, windows)
Date: Thu, 02 Mar 2023 11:30:05 +0000
In-reply-to: <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
Message-ID: <87h6v3bdbb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> From the other thread:
>>
>> I think the underlying config needs updating:
>>
>>   .git/modules/tests/fp/berkeley-testfloat-3/config
>>
>> I'm surprised the git config for submodules doesn't carry the metadata.
>
> Yeah, in my local repo that I merge stuff with that file
> does still have a github URL:
> url =3D git://github.com/cota/berkeley-testfloat-3
>
> So I guess my questions are:
>  (1) why hasn't this been a problem up til now ?
>  (2) does this mean that if I merge this then everybody will
>      need to manually go in and update this file somehow
>      to be able to pull the updated qemu master ?

  git submodule set-url tests/fp/berkeley-testfloat-3 https://gitlab.com/qe=
mu-project/berkeley-testfloat-3.git

seems to be the magic to reset origin without manually hacking things.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

