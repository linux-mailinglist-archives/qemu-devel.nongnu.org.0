Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D23064C8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:09:42 +0100 (CET)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4r8H-0004Qa-65
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4r5K-0002U6-O4
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:06:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4r5F-00005v-Sn
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:06:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id e15so2739724wme.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 12:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E3+pS4KEc0IU6t9CbRl6vNeXG2vOmi+ncwW/bvSBc4c=;
 b=tiFcclCyEKURxIUn3lJ0LtroGp4MVW/bFWCFfRRZs01Y94zq6d73zTkJnlX9EzcmVr
 GH146/4F9e+MaGATR9354FcUfjfDG4r8tEk3a17W7kUYfS9hSnT+7OYqPhAwp573RZQ2
 hfZxdxTJqBMg+w5E05yoPZdXrqV3rY6fCFR6JqfAN0WVB6yjMEW2z7V0XDqHZx2GiE9A
 wzH/4G1wfILcTF93RvFnzUxffKVuEsDJb6DMnbh9Oa9bvdbvQHK1CEUyN6b8k0VcoaTb
 1JNolPDiJ5OK6Qz4AJnmj+LmJWmTRMOxE22eZllNovb6nzjoSzAQAYy0IlVThKpk0xlc
 iJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E3+pS4KEc0IU6t9CbRl6vNeXG2vOmi+ncwW/bvSBc4c=;
 b=Og299WTFYpIe5A+M03fz11lRCqtDSch120fCAg/5MJ4ttP3qXfqgWuKtKrGnY4qrwR
 sPWZWYdOvGn4gzlokfWF3J4LYYqYdc64mmSDXiJRtF+cM6bRgj5Rc/ShXSy+4E6vfxnM
 2Mx7ATXX2oJWVMM6a3xlBJTnuHGJ7lfq1tEZimkUnVHBCrLD3R+jgVHb2FyLeXlryFjX
 sXjgPdIu0CYx1V7MkFDwEol1+KXqM8vRcxP4LyoKzbEfNwZk8JkGI10dHc1CAkDMbvw/
 12xKxXET2Wabs4HX5TLgmMfBdR7P/iwQe2NrsOL3YQ5oE0rNcdO9U5xA3+9n1y3GwSOn
 v5QQ==
X-Gm-Message-State: AOAM532YJ9TuWM0Kp249JER9UTZ9jS8LN9XcGFSGln2Cc138FScf0XfL
 UrJLl0eoUwhSh9PphRq9f9q9EA==
X-Google-Smtp-Source: ABdhPJzq7FhQZYNCtE1ydDeTt5KFA0DUH3g70idWpaf/374Ndq5efg3GnGNQAT7TCcPpWC6s9O47ZA==
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr5637109wmb.123.1611777992293; 
 Wed, 27 Jan 2021 12:06:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm9709830wmk.0.2021.01.27.12.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 12:06:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 292931FF7E;
 Wed, 27 Jan 2021 20:06:30 +0000 (GMT)
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Date: Wed, 27 Jan 2021 19:52:26 +0000
In-reply-to: <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
Message-ID: <87wnvyw3eh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P?= =?utf-8?Q?=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Am 26.01.21 um 23:39 schrieb Richard Henderson:
>
>> On 1/26/21 9:44 AM, Stefan Weil wrote:
>>> I was not talking about the TODO assertions. When I wrote TCI, I only e=
nabled
>>> and included code which was triggered by my testing - that's why I said=
 the
>>> productive code lines have 100 % test coverage. TODO assertions are not
>>> productive code, but debug code which were made to detect new test case=
s. They
>>> were successful, too, because they were triggered by some tests in `make
>>> check-tcg`.
>> The TODO assertions are all bugs.
>>
>> Any *real* dead code detection should have been done in
>> tcg/tci/tcg-target.c.inc.  What's interpreted in tcg/tci.c should be exa=
ctly
>> what is produced on the other side, and you are producing more than you =
are
>> consuming.
>
>
> Unless the TCG opcodes in tcg/tci/tcg-target.c.inc are used in real-live=
=20
> scenarios, they are dead code, too.

For example - debian-buster (arm64) running ffmpeg:

  alex.bennee@8cd150a4b35d:~/lsrc/qemu.git/builds/all.tci$ ./qemu-aarch64 /=
usr/bin/ffmpeg -i theora.mkv theora.webm
  TODO ../../tcg/tci.c:882: tcg_qemu_tb_exec()
  ../../tcg/tci.c:882: tcg fatal error
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault (core dumped)

> Writing a test case which produces them directly (not for some real=20
> architecture) is not a real-live scenario.
>
> And the remaining TODO assertions are a good indicator that the current=20
> tests are incomplete for native TCG because they obviously don't cover=20
> all TCG opcodes.

That's because check-tcg isn't a comprehensive test suite and expecting
it to be misses the point of it. It was added to make it easy to add new
test cases and remove some of the burden off maintainers having their
own zoo of test binaries. It has slowly grown as directed test cases
were written while bug hunting and sometimes when new features where
added. It will never be a comprehensive exercising of the CPU emulation
although some architectures have more coverage than others. For example
MIPs has a bunch of ISA level tests as part of check-tcg but most of the
ARM ISA validation is done externally using the RISU random instruction
testing tool.

Besides you've just argued writing a test case that targets missing
functionality in TCI would somehow be cheating as it's not a "real-live"
scenario.

I don't mind either way - the fact that TCI is useful to people is cool
and more power to them. But lets not pretend it is a fully functional
and maintained backend because it has obviously got some major holes. If
it ends up being a drag on efforts to maintain and improve the TCG then
we have to question why we are keeping it in. Being able to run
emulation on esoteric hardware without a real backend is a party trick
at best. The other use-cases that have been mentioned could be solved
with investing some effort in the rest of the TCG code.

--=20
Alex Benn=C3=A9e

