Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D04199BB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:54:53 +0200 (CEST)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtu0-0007wn-7N
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtmD-0007Qf-Rb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtmA-0006Mj-H4
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632761203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYPgonmE09YaBM0iRAxilyIKJd/hIX3aaATz/sGSbVw=;
 b=hCEwfJfXvVWj/XNnRF7LbU44MxCwJA441H6XkIxdI1AvbuHrTCd7eJzVyBjZQPUpIQhjn/
 uELewRIOm70p6e9SJ4HGUblWHXVUX/yGNO3jTBU21+W2hrfNyUvbggS1ntcILZmxiwCSVj
 B0zuD5w3v7rhkqYgVyTCY8eSP6RMYBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-f6YqQoKbPkyItGARSi7fmQ-1; Mon, 27 Sep 2021 12:46:40 -0400
X-MC-Unique: f6YqQoKbPkyItGARSi7fmQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso14363688wrn.4
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYPgonmE09YaBM0iRAxilyIKJd/hIX3aaATz/sGSbVw=;
 b=s9TggR9pfTLi/CAqonGXFW0DFVzfuorerRAbIvEU41sZp/OHNUnbrrnDz2l1l34eSj
 Qt6HTt1QCvjwNJLKoYHFeXxxmkTo9UnpbWr8askkiXuymXinGPY7MGCAJ2cP7tgep2te
 IigpPxS9gzJzBXM3g5aPM+WfSZnYCAfFkrAs0HhhYa5EjDsjK7YRN0MzwSHwPDw4G42q
 uM7CocmBbL8DfeaUZBseOmIRHY8H2z0ZP3/T4yeYexgM1jxbANaDRPJn8O79yx42e3KJ
 GEkchx7lfAeXhxAkSqKeC0nOX2WKrKTfm7be7qFoZnuKwiUfCOelKoAcBSyNVJizd7KC
 AlIw==
X-Gm-Message-State: AOAM530rLiKGP5eSzxQn3Vg85aeJFmD9jtqpl6zIYIkg9bRjT9eAujMp
 iwj0p3VxDzqWyrHb/CFyC8OSSKg+sTyY+04kDuZirJaqYb8y/C0h7HIxceojRXP+xgqWbhIIijN
 uVUJkTk75pVdePsU=
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr898035wre.387.1632761199329;
 Mon, 27 Sep 2021 09:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZUkF8pTG1tw9+z2WgZY+OCY7OHodA4KMlpTsrMq1vF4vRdLOZjBYzTNPZMc14+68ffFSpjA==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr898001wre.387.1632761199130;
 Mon, 27 Sep 2021 09:46:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j14sm16938183wrp.21.2021.09.27.09.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:46:38 -0700 (PDT)
Message-ID: <80a1e61d-97d7-2caa-a366-babd64f8172c@redhat.com>
Date: Mon, 27 Sep 2021 18:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 00/16] Acceptance Tests: use Avocado 91.0 features and
 other improvements
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:54, Cleber Rosa wrote:
> This is a collection of patches for the Acceptance Tests to leverage
> some of the features of Avocado 91.0.  With the Avocado version bump
> by itself, there would be a change in the default "test runner"
> implementation that Avocado uses, from the one simply known as
> "runner" to the new one called "nrunner".
> 
> Among the changes from one implementation to the other, is the fact
> that "nrunner" will run tests in parallel by default.  This is *not
> yet* enabled by default on "make check-acceptance", but users can
> choose to use simply by setting the "AVOCADO_RUNNER" variable, that
> is:
> 
>   make AVOCADO_RUNNER=nrunner check-acceptance
> 
> If you are curious about the architectural differences of the nrunner,
> please refer to:
> 
>   https://avocado-framework.readthedocs.io/en/91.0/guides/contributor/chapters/runners.html
> 
> One other noteworthy proposal is a convention to tag tests that either
> have known issues, or that touch on QEMU features that have known
> issues.  By tagging those tests accordingly, they will be
> automatically excluded from the regular execution with "make
> check-acceptance".
> 
> Finally, some updates to assets locations and some tests refactors and
> cleanups.
> 
> Cleber Rosa (16):
>   Acceptance Tests: bump Avocado requirement to 91.0
>   Acceptance Tests: improve check-acceptance description
>   Acceptance Tests: add mechanism for listing tests
>   Acceptance Tests: keep track and disable tests with known issues
>   Acceptance Tests: add standard clean up at test tearDown()
>   Acceptance Tests: use extract from package from avocado.utils
>   Acceptance Tests: workaround expired mipsdistros.mips.com HTTPS cert
>   acceptance/tests/vnc.py: use explicit syntax for enabling passwords
>   tests/acceptance/boot_xen.py: merge base classes
>   tests/acceptance/boot_xen.py: unify tags
>   tests/acceptance/boot_xen.py: fetch kernel during test setUp()
>   tests/acceptance/boot_xen.py: removed unused import
>   tests/acceptance/boot_xen.py: use class attribute
>   tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location update
>   tests/acceptance/ppc_prep_40p.py: clean up unused import
>   tests/acceptance/ppc_prep_40p.py: unify tags

Thanks. Trivial patches 2, 8, 12, 14, 15 applied to my
integration-testing tree.


