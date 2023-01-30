Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60552681BBF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMb5Z-0003NG-AC; Mon, 30 Jan 2023 15:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMb5S-0003Mw-Cr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:49:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMb5Q-0003Sz-M5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:49:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o18so2896341wrj.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rV9xwlANCC1x56K8iV1huOC7rWqV7yM04ksBL92ptU=;
 b=OsdgQXYg1/SAt10v+jtWLb47R/0OE2dQ5kpKU5TJL5WekOMRy3BN4yoIUtWrxVGfqQ
 tucCY1szRnf5GshAXgDhXvgNmMLqPFJVRiE9apEo27+dFFGta9CpeP6SObadZSy6pMva
 3OaBV70VxOAEzzyAfSnCckRjGt/G1/kqWlJYuH93DL/1FgPdNjThe7nrce4Bx+KLgyYb
 LWEe0mofHFXRDGv/yWYf1dh8NaYLtnkm1bq0Dc9TcXaf5BEOBtFBVjUah+zhyjjI/eh9
 CRpmCHlYn15oaMX84G1kd1X4wBlNQBsEcxPyo4Fb2Mf0t4YCo7k97NzC0ghYh0K6YcjL
 Qv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6rV9xwlANCC1x56K8iV1huOC7rWqV7yM04ksBL92ptU=;
 b=xg1Wnud20Smmzkj/+JSbjTehtmsh8VSGBDt1i/KogKLR7IrXeSfsqFZahO8SZElfFW
 IluNkoykM2yKyUJIG4+CLAo7grXlY97Bz2HVdaSpxLaQHNpyJSj5UzGeGTG5fF9Y6+L/
 bnorCpS+ia6yqVy3AI17+R/WO85WbBLBOezW5HZrR18N97yNXHGiG2g6B0amaN+srcQC
 13DPTdYDRS4EjyKzfRGt3CU7F+hlhrAgazK/bzilBlF5JptrDIiyjE5+XmDK7IW+Pe3u
 viIqxkDJ+82FwOu+f+w9q87CwNuEM57BZrxW4dEE+CLAPthOEw2AYg9+hxPq05ad74e1
 +NVg==
X-Gm-Message-State: AO0yUKV84BQS9VWYVJHGRIZdxgYuhJYBLqbY/32XqAxASL8bCV5fOoV+
 0Yo/01HYBQmfAjqgopGgyhdNcw==
X-Google-Smtp-Source: AK7set82myOWnRJjRIIUFIGn4TLJcHTrtx3JgnKZGhnKFFYnZoSqF7j7VjMDQE6aueQM7a2A4UQMCA==
X-Received: by 2002:adf:a1ce:0:b0:2bf:cfc2:2eae with SMTP id
 v14-20020adfa1ce000000b002bfcfc22eaemr12272699wrv.69.1675111747197; 
 Mon, 30 Jan 2023 12:49:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a1c7713000000b003dc48a2f997sm8478918wmi.17.2023.01.30.12.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:49:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44C541FFB7;
 Mon, 30 Jan 2023 20:49:06 +0000 (GMT)
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>, Brad
 Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Date: Mon, 30 Jan 2023 20:45:47 +0000
In-reply-to: <Y9exrDWT2NUoinu1@redhat.com>
Message-ID: <87h6w7694t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>> >
>> > Testing 32-bit host OS support takes a lot of precious time during the=
 QEMU
>> > contiguous integration tests, and considering that many OS vendors sto=
pped
>> > shipping 32-bit variants of their OS distributions and most hardware f=
rom
>> > the past >10 years is capable of 64-bit
>>=20
>> True for x86, not necessarily true for other architectures.
>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>> I'm not entirely sure about whether we're yet at a point where
>> I'd want to deprecate-and-drop 32-bit arm host support.
>
> Do we have a feeling on which aspects of 32-bit cause us the support
> burden ? The boring stuff like compiler errors from mismatched integer
> sizes is mostly quick & easy to detect simply through a cross compile.
>
> I vaguely recall someone mentioned problems with atomic ops in the past,
> or was it 128-bit ints, caused implications for the codebase ?

Atomic operations on > TARGET_BIT_SIZE and cputlb when
TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
throughout.

>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

