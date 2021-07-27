Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068103D7850
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:16:29 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Nsh-0007PY-Ju
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8Nrd-0006eR-VL
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:15:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m8Nra-0003xy-II
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsUhObJm8xHpHMaFOAB7I7O8clA5Q92c7tXVjnm45zk=;
 b=KG6PNTaZL27JarPTdKSnhmZ6fCQz7+2UPpKjZZ0YtHEuAI863Ju8nsgPxcVj9UtK4AnAZF
 xooiycYQOOPHZP6rL4hLKXnRGQDIrDr4uSX59opLOzYqR2a7RlBD9O+z155TLgp8BaNdko
 YjpC6UdsxYBKQKCCMvpkcdwygPIt5SA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-_qL6AFTOMsqlVUQTfLKZCQ-1; Tue, 27 Jul 2021 10:15:15 -0400
X-MC-Unique: _qL6AFTOMsqlVUQTfLKZCQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020aa7de100000b02903a6620f87feso6691284edv.18
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wsUhObJm8xHpHMaFOAB7I7O8clA5Q92c7tXVjnm45zk=;
 b=jE1VMc8GP38pmRUMJ40IkXX2NENfwxmtEx5YT2WKPb5tpM8fjaCrj9Jlve4At/z/Xc
 0o7CKB5THxrdTiuxj+s705A49X148KGgWxcTrXIsInTC5tT3CbKtotulIqID7qvIopoB
 K6g3Ze33Z7T8XllOnpLJf/9TK0OtwjUXCYX2NAxSponc3OVsLwalvSMIUFR9zLmEsrmb
 s2nsVX2BvXht1dSD5HmKo2hhJPn8MYKtX6leCzZ7ripA6VM89NSyTeRszqzwpxlZns+r
 VVFm87NhhnArzYSRSQWujkCQcGNWECU93OCLZcB4oXemZN/wkJZizzVGONLrk78/uLHH
 SIcA==
X-Gm-Message-State: AOAM533y/Gou2Hfxp8maAajs6EYoNcDytQRF8AAsqBGqqyH6ObS01OnZ
 TXI5mVGTYSricRjr0mK3JX3xdLvUalMem/TXvp9PCpDfNE2ySolIm99DHG4BlYFiEZbpi4n+7G0
 WsrUEsxS3a9SqHd4qcJevzYKML6ohTVI=
X-Received: by 2002:a17:906:f2d7:: with SMTP id
 gz23mr12573373ejb.486.1627395313325; 
 Tue, 27 Jul 2021 07:15:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvaGOTltXZvfQDCimuhjycMAJZiuqJPLMfkzBBh0nttvlHqQg12AVQKScIfU9eZubxZNyQqHsjieLQ5/eHNdY=
X-Received: by 2002:a17:906:f2d7:: with SMTP id
 gz23mr12573352ejb.486.1627395313123; 
 Tue, 27 Jul 2021 07:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
 <CAFEAcA8eEyhhV88RoTfSMnQb05uODYcL4RVHOzLaxPGPUUc_GA@mail.gmail.com>
 <CA+bd_6+zxLQP1XL_wXM3UZvbAZ6FvNspzSAV7XGqrEgfWjWFZQ@mail.gmail.com>
 <CAFEAcA8aEkSRABqJ4-_SJ9-dS=M4jeaW=OQH99BaZUs5Lq0u=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8aEkSRABqJ4-_SJ9-dS=M4jeaW=OQH99BaZUs5Lq0u=w@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 27 Jul 2021 10:15:02 -0400
Message-ID: <CA+bd_6L47217UTjyWLrn45JHDMJa0eaDMOW6JQFFZRqkpfpkTA@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 9:48 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Jul 2021 at 14:24, Cleber Rosa <crosa@redhat.com> wrote:
> > Yes, I've spent quite some time with some flaky behavior while running
> > the replay tests as well. But in the end, the test remained unchanged
> > because we found the issues in the actual code under test (one time
> > the recording of the replay file would sometimes be corrupted when
> > using >=1 CPUs, but 100% of the time when using a single CPU).
> >
> > This time, it was failing 100% of the time in my experience, and now,
> > after the fix in df3a2de51a07089a4a729fe1f792f658df9dade4, it's
> > passing 100% of the time.  So I guess even tests with some observed
> > flakiness can have their value.
>
> To me they have very little value, because once I notice a test
> is flaky I simply start to ignore whether it is passing or failing,
> and then it might as well not be there at all.
> (This is happening currently with the gitlab CI tests, which have
> been failing for a week.)
>
> -- PMM
>

I hear you... and I acknowledge that we currently don't have a good
solution for keeping track of the test results data and thus going
beyond one's perceived value of a test.

It's not something for the short term, but I do plan to work on a
"confidence" tracker for tests.  There is some seed work in the CKI
data warehouse project[1] but it's very incipient.

- Cleber.

[1] - https://gitlab.com/cki-project/datawarehouse/-/blob/main/datawarehouse/views.py#L158


