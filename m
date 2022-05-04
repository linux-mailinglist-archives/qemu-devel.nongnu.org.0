Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB8951AE1A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:41:43 +0200 (CEST)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKsX-0002rW-Vs
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmKpy-0001TM-75
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nmKpv-0008Ov-5z
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651693137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Y35OSmr8GF56WbRRZAP15kUBVJw5R/ALNxp/k/XQo/4=;
 b=fYBN0TtPxCQRLvHSVgcTCqMpmN4bovDM9lzWC4NmIEO757/iBPTpluKUtU8fIID+fnyl5z
 QSXLlpFJfaOsWwt80gYwEpLqQ0YJurU+vUS0AAhb5yjvj4dRvBahJp7dKmDCWt8fXpEumh
 0T5QnV/VFdujocR2/HteH/ZZ7lEDe0s=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-LaNoGbIpMWum6nr2M0H5_Q-1; Wed, 04 May 2022 15:38:56 -0400
X-MC-Unique: LaNoGbIpMWum6nr2M0H5_Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 x17-20020ab07811000000b0036280ecb145so938578uaq.17
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Y35OSmr8GF56WbRRZAP15kUBVJw5R/ALNxp/k/XQo/4=;
 b=R7dlgTagrQ2jN7Y202ZDEtsRJ2PMts7wgpNTWOXTVjgf7QLVWPp9Earfu96PaquhdN
 VsIHsKqMGkhphE/BxDzLHoB+o6s26/JrTlnYUDQA3A7fNvwXkxKG/+rkeL86IJe8HIfk
 uQWECe7EN/r6NWCJH47zJqXPhaa5UInEN22LoKE4IAQO6yo6/T+2Tt62aJRXLkCF1fnt
 sBoeNLu5mfdzgjqOk6L81jZzb+P8KoGuP51Oez2YL3zCGTKTr5eO6OJa7CHHpq3icFqH
 +O/v9c1/fT5/QT4PbonJJCyLxvxH8vNoO08XUTQqpzswRUPzGS3jre0A2bSJImSBZL1k
 Qlsg==
X-Gm-Message-State: AOAM5313g0j2HYFYvccYAada3cw4oWN9LbcAjVRGePyq26J1MeQACjej
 rksOO1jaGBfHg8IspRsknIxgSs2DkEXVL6XJ6DQEn/CxtRTPcj0K29hVHNdoVxIKQGIEYDgXuND
 Xe+jac66P3dLKPie9e/P+kYZPd+KRXsY=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr7153264uam.119.1651693136330; 
 Wed, 04 May 2022 12:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDEWqXjJxvHyY0XmV/yUxv9TOVMTWL0xWhjYO/YhjHAGcDU4P+ula9mgxhhTrBQKUFQwWmgSW2QDFRPEneEbQ=
X-Received: by 2002:a9f:2046:0:b0:35d:bfc:2c9 with SMTP id
 64-20020a9f2046000000b0035d0bfc02c9mr7153252uam.119.1651693136125; 
 Wed, 04 May 2022 12:38:56 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 May 2022 15:38:45 -0400
Message-ID: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
Subject: iotests and python dependencies
To: Qemu-block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Howdy!

So, I want to finally delete python/qemu/qmp from qemu.git, and this
creates a small problem -- namely, iotests needs access to it in order
to run the python-based tests.

What I think needs to happen is that we create a virtual environment
that installs python/qemu/. The reason this cannot be done with
PYTHONPATH alone anymore is because the qmp package itself won't be
there anymore, we need an installer like `pip` to actually fetch it
for us and put it somewhere. (i.e., we need to process the
dependencies of python/qemu now and can't treat it as a pre-installed
location.)

Avocado tests are already creating a venv for the purposes of
installing and running Avocado. We can amend e.g. "../../python" to
tests/requirements.txt and the Avocado environment is A-OK good-to-go.
The Makefile magic for avocado tests creates a venv-per-build. It
seems to work well enough. One thing to note here is that the
supported invocation for avocado tests is only through the Makefile,
which handles creating and entering the venv to make the command
seamless.

iotests, however, manages its own execution environment with
testenv.py, and we support running iotests from outside of the
Makefile, for example by going to $build/tests/qemu-iotests and
running ./check.

Now ... I could update testenv.py to be smart enough to create and
enter a python venv, and have even prototyped this. It seems to work
pretty well! This approach seemed like the least invasive to how
iotests are expected to be run and used. But a downside with this
approach is that now avocado tests and iotests are each managing their
own python venv. Worse, vm-tests and device-crash-test are still
unhandled entirely.

I'd like to find a solution where I create a unified python testing
venv tied to the build shared by avocado, iotests, vm-tests and
device-crash-test. I'm not completely sure how exactly I'll manage
that right now, but I wanted to throw this out there in case there are
some requirements I might be overlooking.

I think vm-tests and avocado-tests can both have a venv created for
them and activated before the test runs. device-crash-test I believe
will need a script change in the gitlab ci yaml. iotests is somewhat
unique in that it needs to run both by manual invocation and from
makefile invocations. If I want a shared VM between all of these, I'll
need to isolate the create-and-enter-venv logic somewhere where it can
be shared both inside and outside of a Makefile.

I'll see what I can cook up, but if you have any concerns or Cool
Ideas, lemme know. I want to make sure this is as painless as I can
think to make it.

Thanks,
--js


