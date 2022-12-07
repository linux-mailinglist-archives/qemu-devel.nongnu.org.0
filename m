Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED664627F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p31Cf-000148-8R; Wed, 07 Dec 2022 15:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p31Cd-00013q-3R
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:39:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p31Cb-0001sF-Gq
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670445573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txfrm0C2BHEERyO9lm+mYiFUdZiISX3V+MkCwEGpavM=;
 b=eMnR8RYymPPiGfc/Ae+GuQWTGh04+wU+c+NwCDBEm1CtPDM++niB+2k6rxzNbVfoaACLZR
 +EL5N1bUMnOSoTFQNurCzLZGdVLW7pTw65wCxIkJphWhzvWyc0NC2mcJvUowCeYmuvC+8R
 cRJi4wk3do4gLqXY7bD2d/iGnhHuG+M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-w4ole94PNCGidBx9yJe4Nw-1; Wed, 07 Dec 2022 15:39:32 -0500
X-MC-Unique: w4ole94PNCGidBx9yJe4Nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so1293904wma.3
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 12:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=txfrm0C2BHEERyO9lm+mYiFUdZiISX3V+MkCwEGpavM=;
 b=VWyOtlPqNYxvsKNh8inCcXYN63RixM182SLvxVyIj9hh20LxN1um3/0XhyK0aAo2AU
 ggPch23EM6A9ZjS0dlKqm3i34yHL6ZNE8yTd396U5txnE2tIiMLzc2FUtHVUu3yfARiu
 SDXEEqEVqZ7YqPJ0+kfdDDZdMjEkH+HOEulUM9JqBFrJdsnAui2neu8ve6MtAT4idVEN
 NyO4CmbPaOyOyQtpFu8xLs4X0YF9cVdkb30s8Y3Z2ShBW4QYTYmB1Q2l14zKUmNzbqCe
 mMO4AZfPpyWsL6w/i3/2phEGvfJkUe86ugRUGT9WY07aRw4kd/Mwo2WBR9Qz+9C8BJ8q
 +JCw==
X-Gm-Message-State: ANoB5pmLuMrrUnAEWZax8hpWt4OzXidVYp66jme7Lu+BboBHDnAqjvO/
 3E/7h4peBqv+5caSYFY2257XuF4erR7x0zvt02kq++aGJJo6qefiZS13oHH0c9lXstSQGZqZyY5
 KNTcVhSEk3YctM/o=
X-Received: by 2002:a05:600c:5118:b0:3d0:7026:49eb with SMTP id
 o24-20020a05600c511800b003d0702649ebmr25019618wms.53.1670445571299; 
 Wed, 07 Dec 2022 12:39:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7FbdNoj0sY9JG8x5EcmQNWJFgcTUgNnsgLaEqhIvx2cvSdooQaC4Fqmi6JzPDO7sxjoX8+gQ==
X-Received: by 2002:a05:600c:5118:b0:3d0:7026:49eb with SMTP id
 o24-20020a05600c511800b003d0702649ebmr25019603wms.53.1670445571077; 
 Wed, 07 Dec 2022 12:39:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0024207ed4ce0sm20449191wrx.58.2022.12.07.12.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 12:39:30 -0800 (PST)
Message-ID: <c5435744-8926-b1f3-11f9-92829c7cf163@redhat.com>
Date: Wed, 7 Dec 2022 21:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, paul@nowt.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
 <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
 <64a40f5d-855e-7f70-ba1f-df464abcfddf@linaro.org>
 <d3ba280e-0955-a599-29ec-3fd24df9fd23@redhat.com>
 <CAFEAcA8SYqsdkHq==xggYH3dxpREq6rjhqDUyd_0ZrzrUzCCJw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8SYqsdkHq==xggYH3dxpREq6rjhqDUyd_0ZrzrUzCCJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 12/7/22 21:28, Peter Maydell wrote:
> On Wed, 7 Dec 2022 at 18:44, Eric Auger <eric.auger@redhat.com> wrote:
>> On 12/7/22 19:23, Richard Henderson wrote:
>>> Adding -Wall is not standard, nor all the other -W that you are
>>> adding.  I think you should not be surprised that you run into problems.
>> OK that's a useful indication. I used to have this configure cmd line
>> for a while and have not paid much attention to it until now, I
>> acknowledge. This was useful to catch compilation errors at some point I
>> guess.
>>> While you can make a case for auditing the code base and adding these
>>> to the default set of warning flags, that's a job for the next
>>> development cycle.
>> Let me clarify, I am not insisting for that fix to land in 7.2 all the
>> more so it is pretty late. I just wanted to report the compilation issue
>> and since I use the std qemu pieces with a pretty standard tool chain I
>> thought somebody else would be likely to hit the same problem.
> As Richard says, we don't expect people to randomly add extra
> warning flags, and anybody who does should expect to see extra
> warnings (and that they need to --disable-werror if they don't want
> those extra warnings to turn into errors).
>
> We specifically disable some warnings, there are some not-on-by-default
> warnings that we know we have work to do if we want to eliminate them
> (eg -Wvla) and there's probably a few where we conceptually disagree
> with a warning flag or don't find it useful for QEMU (like
> -Wgnu-statement-expression -- we deliberately use GNU statement
> expressions so warning about them isn't useful to us).
>
> Sorting through which of the currently non-enabled warning flags
> are worth trying to fix existing warnings and enable by default
> is a pretty big task (not dissimilar to sorting through Coverity
> issue reports -- maybe some of the things you fix are real bugs
> but there's a lot of false-positives to wade through to get there).
>
> maybe-uninitialized warnings are particularly awkward because whether
> you get them depends a lot on the version of the compiler and how
> smart its data analysis is.

OK. I don't exactly remember how I came to this configure cmd line.
Maybe in the old times bots were complaining about such kind of warnings
or some of the extra warning flags were used downstream. I simply
thought we had a stricter policy with regards to those and I have been
using this configure command for a long time, without trouble, until
recently, hence that belief.

Thanks

Eric
>
> thanks
> -- PMM
>


