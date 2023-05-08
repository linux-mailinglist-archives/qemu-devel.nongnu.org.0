Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA336FA1F6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 10:14:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvzI-0002Ax-Lq; Mon, 08 May 2023 04:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pvvzG-00029l-4b
 for qemu-devel@nongnu.org; Mon, 08 May 2023 04:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pvvzC-0005yj-U1
 for qemu-devel@nongnu.org; Mon, 08 May 2023 04:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683533566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Sk6u4hqi8IWTC0kETDjEcfkq1no3At9aCxeuzlQ8Yi0=;
 b=EttUvFLEmxzWnY/XipbSI/Bmt7GJEwvl4p99jmSiqForCzWwAkvEbtBBauxbBQogH8zxEI
 OQh99pYg3VgJGIMOCi8P541g9pFECM9umiOoxC24Sn9g0HvshYt12w9dBh95yvyKbuLdvA
 rTIGqksaVLIJriBGgIvGVqyXBQ2upoo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-vb-YMcyZOBerqMc9TI02rA-1; Mon, 08 May 2023 04:12:44 -0400
X-MC-Unique: vb-YMcyZOBerqMc9TI02rA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so23002305e9.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 01:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683533563; x=1686125563;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sk6u4hqi8IWTC0kETDjEcfkq1no3At9aCxeuzlQ8Yi0=;
 b=FJ8zzdHdr7vDTWckV2Bb86yNjv6W9aXJshPfDCaTyap/nUzwgvJudRKYgmT+XfGLe2
 X84ZvRwlN4l1xqNZwTvaxP5cV5x++AatYJ5YGqWF70V2753qnVWRI2r3zT7KJ8MWPnoO
 S0jKgfLvejeJKJ2DP8RNEunvOeKZ/Fmb5lB3Z/nkcIZ/y909fWPw0VzasTwlhGJEN4zT
 v38hHdL8Gc0ODPE/cD0Dk0zw6APR7dFKBHnKLbEhaMv3j7R6E2bxMNvtS4/cb36SQ9l5
 7ZBY4JaZU/U1zrDFHMnpVL9Fqa6/I7u+efkPxYbYjyDhkd0raBHYbI9xRK5gH+KRoPh4
 4NMw==
X-Gm-Message-State: AC+VfDx+oqRlNowVBpSbft9OKarieyGm63frfOHTkLB+8QLufNH/2GLA
 DeHbgZLl6OPdph+0LhueytGsF4YM+KW4pwIrRGs0H3yePlikJrmH6bpWHFrDY7B8ymuKGpHGzlY
 fMkqkpXDxssQEOYM=
X-Received: by 2002:a5d:48cc:0:b0:2f4:fcd:98dd with SMTP id
 p12-20020a5d48cc000000b002f40fcd98ddmr7158704wrs.4.1683533563792; 
 Mon, 08 May 2023 01:12:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eePYMlbZawmyRfp/mcQEoM/MC4vE9XPp/8Nqx30NvDPL6g1tbvCfkNS/YNY8DfY2hhuMrvw==
X-Received: by 2002:a5d:48cc:0:b0:2f4:fcd:98dd with SMTP id
 p12-20020a5d48cc000000b002f40fcd98ddmr7158691wrs.4.1683533563473; 
 Mon, 08 May 2023 01:12:43 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4843000000b003047d5b8817sm10588666wrs.80.2023.05.08.01.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 01:12:42 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
In-Reply-To: <20230508010342.4162c526@gecko.fritz.box> (Lukas Straub's message
 of "Mon, 8 May 2023 03:06:04 +0200")
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <20230508010342.4162c526@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 08 May 2023 10:12:35 +0200
Message-ID: <87mt2fnswc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lukas Straub <lukasstraub2@web.de> wrote:
> On Tue, 02 May 2023 12:39:12 +0200
> Juan Quintela <quintela@redhat.com> wrote:
>
>> [...]
>> 
>> my patches are only code movement and cleanups, so Lukas any clue?
>> 
>> Lukas, I am going to drop the compress code for now and pass the other
>> patches.  In the meanwhile, I am going to try to setup some machine
>> where I can run the upstream tests and see if I can reproduce there.
>> BTW, I would be happy if you double check that I did the rebase
>> correctly, they didn't apply correctly, but as said, the tests have been
>> running for two/three days on all my daily testing, so I thought that I
>> did the things correctly.

Hi

> Hi,
> I rebased the series here and got exactly the same files as in this
> pull request. And I can't reproduce these failures either.

Nice

> Maybe you can run the CI just on the newly added compress tests and see
> if it already blows up without the refactoring?

It does, I don't have to check O:-)

The initial reason that I did the compression code on top of multifd was
that I was not able to get the old compression code to run "reliabely"
on my testing.

> Anyway, this series is not so important anymore...

What about:
- I add the series as they are, because the code is better than what we
  have before (and being in a different file makes it easier to
  deprecate, not compile, ...)
- I just disable the tests until we find something that works.

Richard, Lukas?

Later, Juan.

>> Richard, once that we are here, one of the problem that we are having is
>> that the test is exiting with an abort, so we have no clue what is
>> happening.  Is there a way to get a backtrace, or at least the number
>> 
>> Later, Juan.
>> 


