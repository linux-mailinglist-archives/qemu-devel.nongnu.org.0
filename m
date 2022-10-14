Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B645FEEC6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 15:39:58 +0200 (CEST)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojKur-0001sc-2Q
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 09:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKqt-0005UE-1d
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:35:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojKqj-000861-50
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 09:35:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id u10so7625812wrq.2
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6dz3PBbdARjXYhBIGFc4ut6w4CPg3DveJcygOA8XBM=;
 b=G5x+XF/1jWz1EmNljp3RNQhzf96nfi0jRz+68qSX+D3Tgh3hICEcJcc+/XI1L84Xhs
 2s7Zozojbbn4XwkMT5LimyxGYBtKgESLKs2Ozfjcydcv99aYbXehO5kvBE638iBb7ZKc
 urofHdyT7zNBCsyqU93WRKe0UQ5gYCidDet7anFoCrSEhOi4Ux07+p+AvLgcj+qXgQxJ
 bd2UAYK9rridUdXzfk3BhHEbDoO4Vdb70wP6BqzuXdSgiVJuG2hOUePadsLEaTYXoecT
 u6xVtqjK5R8DG+kYTJaEUCeY/8/JLpLD2Kq35p3UpS1UBezalQ9sYDc8Feczncqd7KCu
 MB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K6dz3PBbdARjXYhBIGFc4ut6w4CPg3DveJcygOA8XBM=;
 b=D3Cr+UfA4UFf4bRCstiUfhzzFtwlYM9mMfNfTOlnF2Gkt4rSa/y4CMs/xKj9FBMQm1
 NENEgll3fhLRgRG2QKWw5E+BRGSghbvhY8PB0nb+zFzZKHzxj1rZ4RqCseo/LF0iOQuB
 7Cyf7cDCOOfdoG7dP34ZMjwKLU5b7zBWYG0w3G1U4z547DxE4GKahhHLDcIGRyB9PehX
 re9eCfieIuBUBlTTYOFWggvoZepeUzJFty6sxRYg8MUgfh4MbM2TAdPFg04B3Aho+vdw
 xtRfMWMLuzs0LEbMYpZxz/iAPHU8vSsPeoEFXSCXsgnT6OfpwCLRzNhn7T/7mizi4Kj5
 tJ1A==
X-Gm-Message-State: ACrzQf0dRm2bzqPuiDiwVbOFQ5W2Cy44ZobS10+8fp/+YJkSpBduB6o8
 F+PIwXn6foF1B6AfXlEg6u5ZZQ==
X-Google-Smtp-Source: AMsMyM4oWpyeUfBShG7zXPNV2sAzl70xF4/11DqypNkoyMVddGDG/tQqe6fTjsgVAt3KQ3mwT0LgKg==
X-Received: by 2002:a5d:428c:0:b0:22e:5d4e:c71e with SMTP id
 k12-20020a5d428c000000b0022e5d4ec71emr3314354wrq.19.1665754537894; 
 Fri, 14 Oct 2022 06:35:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a05600c4e1600b003c6c5a5a651sm2123892wmq.28.2022.10.14.06.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 06:35:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C62341FFB7;
 Fri, 14 Oct 2022 14:35:36 +0100 (BST)
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <b3d01cdd-9893-ee76-0d3c-fd11ea6e3f7c@ilande.co.uk>
 <87wn92r62p.fsf@pond.sub.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH 0/4] docs/devel suggestions for discussion
Date: Fri, 14 Oct 2022 14:31:59 +0100
In-reply-to: <87wn92r62p.fsf@pond.sub.org>
Message-ID: <87zgdymst3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
>>
>>> Hi,
>>> This is an attempt to improve our processes documentation by:
>>>   - adding an explicit section on maintainers
>>>   - reducing the up-front verbiage in patch submission
>>>   - emphasising the importance to respectful reviews
>>> I'm sure the language could be improved further so I humbly submit
>>> this RFC for discussion.
>>> Alex Benn=C3=A9e (4):
>>>    docs/devel: add a maintainers section to development process
>>>    docs/devel: make language a little less code centric
>>>    docs/devel: simplify the minimal checklist
>>>    docs/devel: try and improve the language around patch review
>>>   docs/devel/code-of-conduct.rst           |   2 +
>>>   docs/devel/index-process.rst             |   1 +
>>>   docs/devel/maintainers.rst               |  84 +++++++++++++++++++
>>>   docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
>>>   docs/devel/submitting-a-pull-request.rst |  12 +--
>>>   roms/qboot                               |   2 +-
>>>   6 files changed, 157 insertions(+), 45 deletions(-)
>>>   create mode 100644 docs/devel/maintainers.rst
>>
>> Hi Alex,
>>
>> I've replied with a couple of things I noticed, but in general I think t=
his is a really nice improvement.
>>
>> If you're looking at documenting some of the maintainer processes
>> better, there are a few other things I have been thinking about that
>> it may be worth discussing:
>>
>>
>> i) Requiring an R-B tag for all patches before merge
>>
>> - Is this something we should insist on and document?
>>
>> ii) Unresponsive maintainers
>>
>> - Should we have a process for this? When Blue Swirl (the previous
>> SPARC maintainer) disappeared abruptly, I think it took nearly 3
>> months to get my first patches merged
>> since no-one knew if they were still active. If a maintainer has
>> been unresponsive for e.g. 2 months should that then allow a process
>> where other maintainers can merge
>> patches on their behalf and/or start a process of maintainer transition?
>>
>> iii) Differences(?) between maintainers
>>
>> - There have been a few instances where I have been delayed in
>> finding time for patch review, and in the meantime someone has
>> stepped up to review the patch and given it
>> an R-B tag which is great. However I have then reviewed the patch
>> and noticed something amiss, and so it needs a bit more work before
>> being merged. I think in
>> these cases the review of the maintainer of the code in question
>> should take priority over other maintainer reviews: do we need to
>> explicitly document this? I can
>> certainly see how this can be confusing to newcomers having an R-B
>> tag as a pre-requisite for merge coming from one person, and then a
>> NACK from someone else later.
>
> The opposite also happens: I review in my role as a maintainer, and give
> my R-by, then somebody else has questions or objections.  These need to
> be addressed.  My R-by as maintainer does not change that at all.
>
> Maintainers' reviews are not special.  Issues raised in review need to
> be addressed regardless of who raised them.  Maintainers' "specialness"
> kicks in at the point where they make judgement calls, such as "this is
> good enough, we can address the remaining issues on top".

This is my view as well - and we want to encourage as much reviewing as
possible rather than implying you need to be blessed to have a view on
the code. That said it is still going to be the maintainers call to take
a patch through their tree and hopefully we don't have too many cases
where that is subverted by going through other maintainers trees.=20

> If multiple maintainers are responsible and disagree, they need to
> hammer out some kind of consensus.

Which reminds me I've quite often used the A-b tag to indicate I'm happy
for a patch that touches one of my areas to go through someone elses
tree. Do we actually codify that meaning anywhere?

--=20
Alex Benn=C3=A9e

