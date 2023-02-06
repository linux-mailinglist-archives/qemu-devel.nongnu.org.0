Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48768B8C8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOxvC-0006Hk-F3; Mon, 06 Feb 2023 04:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOxv6-0006HV-Pc
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pOxuy-00025e-B7
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675676167;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=M0+OpNt4ZXRXrXKrSESyMavjsXbZhap2HfzMArZfS1k=;
 b=iEJR+kUUdDyP++6U3SumsAE7xfnweu/KUGwbyoifINNAWJfQnQwfp8S4wITVweFanJITqk
 3N6K1inqbu48UqWVdtN0BAetNeOOJ/0JH/qYs3Hmorkrub60Sj7SAGXjujYx+VkDR0sSpi
 Km6xpKWATL7XGWhwdzeTiWWSdmBFUF0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-ZRsRR0keOQCxccNJ2Gebiw-1; Mon, 06 Feb 2023 04:36:05 -0500
X-MC-Unique: ZRsRR0keOQCxccNJ2Gebiw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso5469901wms.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 01:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0+OpNt4ZXRXrXKrSESyMavjsXbZhap2HfzMArZfS1k=;
 b=welTQWsSm4iZuVQpWYxILkFnnP0Lgi75u+pdJ/34/nFY1/ovGgS1Pks5A1oa85Vj7m
 SA6LXsA/zQQMGpvXeQUMNC6oQV64QXykcSuKvwUhNJlZaCVAjkSgJd6x6q6YX9hyFX+S
 J+cXGEanAJG4e6HxHiFt4vOb3a2Wi6v3ojGQOzNOuCtV6Nojzq/Kgfgq/hbTA7ygap/K
 XYM7UDCIbnkK7k/F7mUXbPZnKkE2E0tmKzmmWty/NW7eK9/2meFllPlVv/kRU7iwrQCR
 0ReCqMpVmbkgc0WBZryPph47xF6TF3r2w0nsLOxBvMs8yZx9URVnu4AHQBMpyIN/T6iF
 fwVA==
X-Gm-Message-State: AO0yUKXnf2N53gv/c1quNusEmGjNTaOR0kV83eYGxOOIDipo4yvMGE1s
 LmAPjOKtJpYZK/y8CKi1bibEVpJ3/glGP34ksY4YSKDBoJ8lFl9bTodB/x9ovd/kRiyn7u7+PqH
 yZzUmATq91HA8UCs=
X-Received: by 2002:a7b:cbd8:0:b0:3df:e69a:2175 with SMTP id
 n24-20020a7bcbd8000000b003dfe69a2175mr7468216wmi.35.1675676164727; 
 Mon, 06 Feb 2023 01:36:04 -0800 (PST)
X-Google-Smtp-Source: AK7set86CfObicuLO1xpURX8tyGLJ00lLSStVroKCg4sLeOpW6y8YzEKD/xdWgllG5ol7jDdiiWfyg==
X-Received: by 2002:a7b:cbd8:0:b0:3df:e69a:2175 with SMTP id
 n24-20020a7bcbd8000000b003dfe69a2175mr7468188wmi.35.1675676164360; 
 Mon, 06 Feb 2023 01:36:04 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b003dc433bb5e1sm11128005wmo.9.2023.02.06.01.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 01:36:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  hreitz@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
In-Reply-To: <CAFEAcA9azj-v-=dXPjqzX4kdUaeOpArQZUxWU_R5sOm7vwSrrA@mail.gmail.com>
 (Peter Maydell's message of "Sat, 4 Feb 2023 10:23:17 +0000")
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 <87sffme9jj.fsf@secure.mitica>
 <CAFEAcA9azj-v-=dXPjqzX4kdUaeOpArQZUxWU_R5sOm7vwSrrA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 06 Feb 2023 10:36:02 +0100
Message-ID: <87r0v3cf0d.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 3 Feb 2023 at 21:14, Juan Quintela <quintela@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>> > The migration tests have been flaky for a while now,
>> > including setups where host and guest page sizes are the same.
>> > (For instance, my x86 macos box pretty reliably sees failures
>> > when the machine is under load.)
>>
>> I *thought* that we had fixed all of those.
>>
>> But it is difficult for me to know because:
>> - I only happens when one runs "make check"
>> - running ./migration-test have never failed to me
>> - When it fails (and it has been a while since it has failed to me)
>>   it is impossible to me to detect what is going on, and as said, I have
>>   never been able to reproduce running only migration-test.
>
> Yes. If we could improve the logging in the test so that when
> an intermittent failure does happen the test prints better
> clues about what happened, I think that would help a lot.
>
> https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/
> is the thread from late December about the macos failures.

We (red hat) found a similar problem with aarch64, but only when using
zero copy.  Will try to see if I can reproduce this other there.

https://bugzilla.redhat.com/show_bug.cgi?id=2160929

the similar thing to what you have is:
- they are trying to cancel
- they are on aarch64

but:

- they can only reproduce with zero copy enabled.

Later, Juan.


