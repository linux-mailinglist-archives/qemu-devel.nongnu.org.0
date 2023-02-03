Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA24068A468
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:15:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3OD-0007oF-L3; Fri, 03 Feb 2023 16:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3OB-0007nc-QA
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:14:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO3OA-0005dU-4W
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675458869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNo7GzJuUFESbPsgaNP9Pq/jWo8JX3uSjG6FHvOalgQ=;
 b=IF8Cc3L2Ejpyby/Hxd4fr8be10U44AcNdQOb//EI8AkLnIUsXBtrbghFMLHBlFfsuISn3n
 sxWGKZ1pomHNAiEggXJ0j2KMa4crtGirK533DIWo1nDZyeLw/GqONUmoJWC8b/QBvW6G+W
 o6NTXnuoDzIVRYhzYeWsDWLeTYMBIII=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-CZreB9C9M62hk1CCos809A-1; Fri, 03 Feb 2023 16:14:28 -0500
X-MC-Unique: CZreB9C9M62hk1CCos809A-1
Received: by mail-wm1-f69.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso3234757wmb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNo7GzJuUFESbPsgaNP9Pq/jWo8JX3uSjG6FHvOalgQ=;
 b=ZRoGdr0XZ/D1bHfMc3zE0NOvE05b69LBs5cZ/WehmddKrLNFHQjFNcxToJ32SBI3WN
 Dalhh3kmUHVhZAAyQztu9igNAs1FOkkG0mb8jK0AmOBu4a0YxYSdBhjnF5evXsqSxRtu
 HPKImfEuxJCkDWRHBY3AilwXw1lO9sBVCIh/blPW60ci3biUt2NO5wbq13iT+6Q+ctZ3
 8LfPoxdYT1nUCAOuFenqKaLWkC4dlTGxGxA75KiZ8KATVYqe+ml2lWyUdvd7be+cWm3L
 aibYCMJaFJSMd/GVk+a9GUE0pUGXWqQ9NhIYYoJkTBD5G0shb5kvUS0/e7x24M9zEpwj
 nITQ==
X-Gm-Message-State: AO0yUKU+1vgT/bjoBLSRpFFpIX+UnNEElvFKkwY8fnGovSjNgMv0nZUA
 GUw/sycRs6dL19DrwTL5B6/SCjzekYf8wmq336osAvsekWo4O+PZSo0tgzOlk3ZDYJq+1eABpom
 xYFa4y7zfne/9cOE=
X-Received: by 2002:a05:600c:3b1e:b0:3db:1200:996e with SMTP id
 m30-20020a05600c3b1e00b003db1200996emr11198240wms.16.1675458866130; 
 Fri, 03 Feb 2023 13:14:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/yNXM1oIE2IZxHRgAMSVe0oUZnlB1mr3ReCVpJID9JlGEdgJUJmo5OmV9sdwpW4iSr+iTeKw==
X-Received: by 2002:a05:600c:3b1e:b0:3db:1200:996e with SMTP id
 m30-20020a05600c3b1e00b003db1200996emr11198233wms.16.1675458865843; 
 Fri, 03 Feb 2023 13:14:25 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 x33-20020a05600c18a100b003dd7edcc960sm3461484wmp.45.2023.02.03.13.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 13:14:25 -0800 (PST)
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
In-Reply-To: <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 (Peter Maydell's message of "Fri, 3 Feb 2023 15:47:31 +0000")
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com>
 <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Feb 2023 22:14:24 +0100
Message-ID: <87sffme9jj.fsf@secure.mitica>
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

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 3 Feb 2023 at 15:44, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 03/02/2023 13.08, Kevin Wolf wrote:
>> > Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
>> >> On 30/01/2023 11.58, Daniel P. Berrang=C3=A9 wrote:
>> >>> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>> >>>> We can get rid of the build-coroutine-sigaltstack job by moving
>> >>>> the configure flags that should be tested here to other jobs:
>> >>>> Move --with-coroutine=3Dsigaltstack to the build-without-defaults j=
ob
>> >>>> and --enable-trace-backends=3Dftrace to the cross-s390x-kvm-only jo=
b.
>> >>>
>> >>> The biggest user of coroutines is the block layer. So we probably
>> >>> ought to have coroutines aligned with a job that triggers the
>> >>> 'make check-block' for iotests.  IIUC,  the without-defaults
>> >>> job won't do that. How about, arbitrarily, using either the
>> >>> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
>> >>> are closely related, so getting sigaltstack vs ucontext coverage
>> >>> between them is a good win, and they both trigger the block jobs
>> >>> IIUC.
>> >>
>> >> I gave it a try with the ubuntu job, but this apparently trips up the=
 iotests:
>> >>
>> >>   https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
>> >>
>> >> Does anybody have a clue what could be going wrong here?
>> >
>> > I'm not sure how changing the coroutine backend could cause it, but
>> > primarily this looks like an assertion failure in migration code.
>> >
>> > Dave, Juan, any ideas what this assertion checks and why it could be
>> > failing?
>>
>> Ah, I think it's the bug that will be fixed by:
>>
>>   https://lore.kernel.org/qemu-devel/20230202160640.2300-2-quintela@redh=
at.com/
>>
>> The fix hasn't hit the master branch yet (I think), and I had another pa=
tch
>> in my CI that disables the aarch64 binary in that runner, so the iotests
>> suddenly have been executed with the alpha binary there --> migration fa=
ils.
>>
>> So never mind, it will be fixed as soon as Juan's pull request gets incl=
uded.
>
> The migration tests have been flaky for a while now,
> including setups where host and guest page sizes are the same.
> (For instance, my x86 macos box pretty reliably sees failures
> when the machine is under load.)

I *thought* that we had fixed all of those.

But it is difficult for me to know because:
- I only happens when one runs "make check"
- running ./migration-test have never failed to me
- When it fails (and it has been a while since it has failed to me)
  it is impossible to me to detect what is going on, and as said, I have
  never been able to reproduce running only migration-test.

I will try to run several at the same time and see if it happens.

And as Thomas said, I *think* that the fix that Peter Xu posted should
fix this issue.  Famous last words.

Later, Juan.


