Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32770687025
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:54:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK7o-0002x1-3j; Wed, 01 Feb 2023 15:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK7i-0002wh-W1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNK7d-000894-Q1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675284851;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=asirKvU1d0A46Bv7Y1H5lbdLU1hrEfVIVFUwdDgBVsc=;
 b=eq1VYprxxgG3SlBzkwJbU9EIOw4myd879/ZOOnG2TaDSCs+fnm5Eycy+WT3gIr7NZGqjmK
 mi+6WhQ+OJa+nuoWYVmGhXeUwuryGQX6vcV+TlnO1ytGlV894GlHd2CmeK5CqyQGzhTTVE
 EJ6Hs0C5JIjwnwS2mPb7DlsU5h19sVQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-olm7vAv_MKCP3VuWd-2Acg-1; Wed, 01 Feb 2023 15:54:10 -0500
X-MC-Unique: olm7vAv_MKCP3VuWd-2Acg-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl5-20020a05600c0b8500b003db12112fdeso10967511wmb.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=asirKvU1d0A46Bv7Y1H5lbdLU1hrEfVIVFUwdDgBVsc=;
 b=feaZ6yWAVdQjsI/kwTa/Ct7bsQMrPQYkl1yAubQ768ASD/hBBGFUWwTdgvNI7/9FT1
 6rQrwFK1bPHDN0SS20BzQEzRSVPizWKX85SnpdjEle+t8/rRfpLQvPyk4Cp+rVHUZvQA
 dSFDv5z2h8KwSU/AKO92I1z8loyu0Csrr8HdYyZzSBcbwWz7IkVGQ8Lvk/Y5oKYQ69/5
 po46I4AxCFX5iZG56aHXkMDkrG6phrcq5CRexv/fEEvlx2bWij8dhOejB2gmiczWfdde
 Eje21m+qda8S8gbpV9yyDBZSl6UuohDd0kxRJM16lGigsS8QFIOamqqfBk+pDQ+g8c6K
 XWsw==
X-Gm-Message-State: AO0yUKW2QgPrN7Ts21S6CiIuZRR9laagVMHQTqJwgOOZDLZcDeF5J6vE
 a8EQdIHpz7linl6RMDyCko2nSOnHAASj5fkJEuJz6mgdklcqAWpMKjjN0MG7McMQyq0rRCv1/Uz
 bofhUNRteY+xkuOs=
X-Received: by 2002:adf:f947:0:b0:2c3:bc2e:757f with SMTP id
 q7-20020adff947000000b002c3bc2e757fmr1373329wrr.31.1675284849592; 
 Wed, 01 Feb 2023 12:54:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9x8pjbyjFICdbFRBro2QsgjOhUB8ZJiybry4b56qATr2maNS5NoAtUNNqXQDIAZOnk+DPXjQ==
X-Received: by 2002:adf:f947:0:b0:2c3:bc2e:757f with SMTP id
 q7-20020adff947000000b002c3bc2e757fmr1373319wrr.31.1675284849369; 
 Wed, 01 Feb 2023 12:54:09 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b002bdd155ca4dsm18170700wrs.48.2023.02.01.12.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 12:54:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,  qemu-devel@nongnu.org,  "Dr. David
 Alan Gilbert (git)" <dgilbert@redhat.com>,  qemu-arm@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>,  Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 23 Jan 2023 16:29:37
 +0100")
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
 <874jshco5h.fsf@suse.de>
 <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 21:54:08 +0100
Message-ID: <878rhhumxb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> On 23/1/23 15:37, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 20/1/23 19:48, Fabiano Rosas wrote:
>>>> The migration tests are currently broken for an aarch64 host because
>>>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>>>> line. Most other architectures define a default value in QEMU for
>>>> these options, but arm does not.
>>>
>>> There was some discussions around that in the past:
>>> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redh=
at.com/
>>> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ1=
2PT6PmLjdZ5h_YA@mail.gmail.com/
>> There's more than one topic being discussed, specially in this last
>> thread, but here's my two cents.
>> About defaults: It's probably best to be explicit in tests. And if
>> we
>> wanted, have a separate test to make sure the lack of an option still
>> does what it's expected, either outputting a message or behaving the
>> same as the explicit version.
>> About host architecture-specific tests: Unless we're talking about
>> KVM,
>> I see no point. Having to change hosts to test agnostic features makes
>> no sense (the migration test is one example).
>> About generic tests: If a feature is required to behave the same for
>> all
>> architectures/machines/cpus then sure. But most low level stuff would be
>> quite dependent on specifics.
>>=20
>>>> Add these options to the test class in case the test is being executed
>>>> in an aarch64 host.
>>>
>>> I'm not sure what we are aiming to test here.
>>>
>>> Migration in general? If so, any random machine should work.
>>> By hardcoding the 'virt' machine, at least this test is reproducible.
>> Yeah, I cannot say for sure there isn't some machine property that
>> gets
>> transferred during migration. It seemed more conservative to define a
>> specific one.
>
> Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?
>
> What does this test require? Any machine running KVM?
>
> Adding Juan and David for migration since I'm still confused trying
> to understand what we are trying to test here...

No clue really from my side either.

ARM machine types are a mystery.  But on one hand:
- arm is a sane architecture when there is no default machine
  learn x86, learn.
- I don't know either which one to use.

Later, Juan.

>>> I'd rather fix that generically as "if a test requires a default
>>> machine and the target doesn't provide any default, then SKIP the
>>> test". Then adding machine-specific tests. Can be done on top, so
>> I agree, but the only tests that should *require* a default are the
>> ones
>> that test the command line parsing or adjacent features. We could always
>> test "-machine foo" and then separately test that the lack of a machine
>> option still gives the Foo machine.
>> The fact that we sometimes use defaults to be able to have the
>> same-ish
>> command line for every case is more of a limitation of our testing
>> infrastructure in my opinion.


