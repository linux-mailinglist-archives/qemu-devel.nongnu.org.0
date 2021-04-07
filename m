Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7D356DA4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:43:35 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8T1-0008PJ-23
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU8Rh-0007vM-Ld
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:42:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lU8Rf-0001FU-Bi
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:42:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x15so8842133wrq.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=azaRh+cDn1EU4lWZUQ+60LKBxD1sRiyU+2GUI5+HM4A=;
 b=OcP9PsYeSxQMHZpBDJL7k49v53cCUjmGDS/HGT0+EWNM4Lfwvs0IZ9fgZ7M0cQhwSO
 MBnGcti6NGY9koyND9QHm6NqdhcZudSm9cgGAqFe8MNPdpjHOmAPo/snWMYBAT1PhRuu
 RfhLN2511NpDB5oA5hsc8Oly7ycrFmlhhn+Q4PC+5LtWqtKGsokQIN6yvS5sLPstiffQ
 O4Ozv0OfOCo5WdeHLfF0ZvabdurVmivWlPJ5TQMydKP7FW6GLhH7HaCblu6N5HqWQCn8
 KZGEXD4VCJGeq/8aIgfl7zWJo0yNP1+n3EOhNoSpbw9e1uW1ioyU3N54rzgfCsUXGKAi
 lkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=azaRh+cDn1EU4lWZUQ+60LKBxD1sRiyU+2GUI5+HM4A=;
 b=T44EJKwgJ+Evrm1qedS0i5qVFlsIVLWNeWLET0tmUjZd4NP7Oaf8JTA9mgaLgiP7oD
 8vngdWKBU8zUl6RKgcjK9SvHUruybD1A5cLSAPRHFHSTFPJTzXvPyVKVezo37g3pw905
 QNsP6pCWl2KEwpzGb/dvphSuUFTsK6h9A/ny9AVk1twLJUVGhHU/Xh3LCu8YR723i8jg
 BTXl4LsAXO1usZnkKBU5/RzQZOHY9IvACc8Wz9IdWQWOnhEdhwZMhBowuiUZOnLCVZVB
 b3JQvG5m1f+kpZGmxIBrFuV+G9gXdNQKYO1wALVTv0F6yOVbbBRvl5en/l4iJtu5uTks
 Ar9Q==
X-Gm-Message-State: AOAM532V3RSGfQIuo33eEJiCYJUNko/bkF1insE1/ChQdkXvPGGwQGjm
 Ln88VcXE2H0IegiGomL7yoxYvg==
X-Google-Smtp-Source: ABdhPJwm9poLhPbTnSR1kogHpm4EYUKYXaOqWqMXmymSo/Qn7ePh27RbdTYp/80KaJppmIQC7rF3/w==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr4375240wrn.323.1617802929118; 
 Wed, 07 Apr 2021 06:42:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j30sm43347523wrj.62.2021.04.07.06.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:42:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 794091FF7E;
 Wed,  7 Apr 2021 14:42:07 +0100 (BST)
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Date: Wed, 07 Apr 2021 14:35:46 +0100
In-reply-to: <YG2ILNrmn0+vVVKJ@merkur.fritz.box>
Message-ID: <87wnteus7k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kevin Wolf <kwolf@redhat.com> writes:

> Am 31.03.2021 um 17:05 hat Paolo Bonzini geschrieben:
>> +respectful.  Examples of unacceptable behavior by participants include:
>> +
>> +* The use of sexualized language or imagery
>> +
>> +* Personal attacks
>> +
>> +* Trolling or insulting/derogatory comments
>> +
>> +* Public or private harassment
>> +
>> +* Publishing other's private information, such as physical or electronic
>> +addresses, without explicit permission
>
> "Electronic addresses"? No more Cc: in emails without asking for
> explicit permission first in each case, especially when looping in
> people who are not subscribed to the list? And the same for attribution
> in commits (turning informal statements into Reported-by, Acked-by
> etc.)? Links to git repositories of other people?
>
> I'm sure that this is not what was intended, but it's pretty clearly the
> implication of what is written here.

I'm pretty sure emails used to post to public mailing lists (or used in
a dco tag) are considered public pieces of information. I read the above
as covering things that are not public such as private email addresses
or chat ids and the likes.

> (This kind of "bugs" is one of the reasons why I'm not a huge fan of
> written rules instead of trusting the judgement of community leaders.
> In the communities I am involved in, I can't remember many cases where
> they actually helped to resolve conflicts, but I can remember many
> unproductive discussions about how to interpret the written text and
> what it does and doesn't cover.)

Well we don't have to start here ;-)

We explicitly try to avoid rules lawyering with the very next statement:

  This isn't an exhaustive list of things that you can't do. Rather, take
  it in the spirit in which it's intended: a guide to make it easier to
  be excellent to each other.

--=20
Alex Benn=C3=A9e

