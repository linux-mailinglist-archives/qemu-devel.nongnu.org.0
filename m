Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A830DF8A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:22:42 +0100 (CET)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KvR-00062b-5N
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7KpK-0001Tj-8h
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7KpI-0001eT-96
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id l12so197338wmq.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=UOQT8h+hflEcNCh9Q3LfChKzHA/xrI+XgiL4rwrm02U=;
 b=oYPVO/X5FXbqv+gHLIxA5zwMEz9B4HYuKuVXX1Gr8XXGI7bug9jfVhXCDFOP3yWjSS
 hHc0hA8W26QH0M8ApNmh156m4Daw7OHG8lqBWwmhXSGITUctb6lmiy2QgEkL6+NGm7Wp
 x6LXy4ElaEPFyxQBtEpgGIe3Pr5h4jSPzn5NLXuNyX98fRgFldquX68sPuVYfb3vukN2
 CwzcQ7MHvHQ9v1IDibfssT1n6YtjQ8Cv9e8OjOlJxqwWaG/Nx3P9zCVsw8kF2YL8ob7m
 96V6a8SJCKrUwmQE9w4sQxCgcDgCKHusD2hlLKaK8Qkub2OcsDMO2dtlzRAPdUmbPFs2
 ziFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=UOQT8h+hflEcNCh9Q3LfChKzHA/xrI+XgiL4rwrm02U=;
 b=Pahm6vZ2UUuZreQYcMn9panxbATEfV1/iNhtdgUyamYdBY6nz4nY2JL4fqrvBIHE9N
 ZwNSFrz9pBOPbPuRUUEPV69nAQDyfdxb8Pph9UMBBAfXErK1qHXGVXsuy/w5p01HWAn0
 6IXsGCwIqVOV34H/ADQZdgMkqIWhRTePQ/cxFym3f+3EZAnuMLJP0/CW/Ag+/IGaWCoc
 P8nqqqJRB2TRq9szQBQqaJk28YeiQzunRfAUP3UBJU+3w7cwzhiVOm9xA/y3SrXmGj0g
 qOfqxSmAAx+wqg7qP7SaWbfw1tBWTYznWTfp7kk6q7r94XzkRLebWfqom9hW2HniHTJ8
 eWMQ==
X-Gm-Message-State: AOAM532aNbhR3qvkcNr7bua/II6rXJhUItJNNllgBBBJ2RfKzCSyjOPI
 h9HOknIOCp5vi3tzt/nYl+Qlvw==
X-Google-Smtp-Source: ABdhPJxFWcODJz0c1MIVLLqx7RdlQ7quY2WCM4V02JQlhQzrPoLaqx6IuiYWTiZ4CGO3ihkyQwTntQ==
X-Received: by 2002:a05:600c:27d1:: with SMTP id
 l17mr3519492wmb.18.1612368978433; 
 Wed, 03 Feb 2021 08:16:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b3sm3652272wme.32.2021.02.03.08.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 08:16:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 322CB1FF7E;
 Wed,  3 Feb 2021 16:16:16 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <87ft2drzy1.fsf@linaro.org> <9e821e84-8885-7923-c5a4-3a7afaf0273b@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
Date: Wed, 03 Feb 2021 16:15:16 +0000
In-reply-to: <9e821e84-8885-7923-c5a4-3a7afaf0273b@suse.de>
Message-ID: <878s85rusv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/3/21 3:22 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> v14 -> v15:
>>>
>>> * change the TcgCpuOperations so that all fields of the struct are
>>>   defined unconditionally, as per original patch by Eduardo,
>>>   before moving them to a separate struct referenced by a pointer
>>>   (Richard, Eduardo).
>>>
>> <snip>
>>=20
>> I'm not sure if their is some instability because I keep seeing failures
>> in the review trees, e.g:
>>=20
>>   https://gitlab.com/stsquad/qemu/-/pipelines/250749404
>>=20
>> If you look at my pipeline history you'll see it is *mostly* green:
>>=20
>>   https://gitlab.com/stsquad/qemu/-/pipelines
>>=20
>> especially for the testing/next branches that I apply the reviews to. So
>> I worry there might be something lurking in there. How have your CI runs
>> looked?
>>=20
>
> My CI has looked fine, I build-tested (with make check) every single comm=
it.
>
> Rebased last time the day before yesterday.
>
> https://gitlab.com/hw-claudio/qemu/-/pipelines

Yeah it did seem weird given it was a block failure. Chalk it up to
paranoia ;-)

--=20
Alex Benn=C3=A9e

